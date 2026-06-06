#!/usr/bin/env bash
set -euo pipefail

PORT="8080"
ROOT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
CONFIGURATION="Debug"
CHECK_ONLY="false"
SKIP_RESTORE="false"
SKIP_BUILD="false"
USE_DOCKER="false"
# Ubuntu 18.04 is used by default because xsp4 in newer Ubuntu images
# can crash with a Mono.Security TypeLoadException on startup.
DOCKER_IMAGE="ubuntu:18.04"

usage() {
  cat <<'EOF'
Run the GlowUp ASP.NET Web Forms project on macOS using Mono tools.

Usage:
  ./run-macos.sh [options]

Options:
  --port <port>             Port for xsp/xsp4 (default: 8080)
  --root <path>             Project root path (default: script directory)
  --configuration <name>    Build configuration (default: Debug)
  --skip-restore            Skip NuGet restore
  --skip-build              Skip msbuild/xbuild
  --docker                  Run via Docker (installs Mono + xsp4 inside container)
  --docker-image <name>     Docker image for --docker (default: ubuntu:18.04)
  --check                   Validate required tools and exit
  -h, --help                Show this help

Examples:
  ./run-macos.sh
  ./run-macos.sh --port 8090
  ./run-macos.sh --docker
  ./run-macos.sh --check
EOF
}

while [[ $# -gt 0 ]]; do
  case "$1" in
    --port)
      PORT="$2"
      shift 2
      ;;
    --root)
      ROOT_DIR="$2"
      shift 2
      ;;
    --configuration)
      CONFIGURATION="$2"
      shift 2
      ;;
    --skip-restore)
      SKIP_RESTORE="true"
      shift
      ;;
    --skip-build)
      SKIP_BUILD="true"
      shift
      ;;
    --docker)
      USE_DOCKER="true"
      shift
      ;;
    --docker-image)
      DOCKER_IMAGE="$2"
      shift 2
      ;;
    --check)
      CHECK_ONLY="true"
      shift
      ;;
    -h|--help)
      usage
      exit 0
      ;;
    *)
      echo "Unknown argument: $1" >&2
      usage
      exit 1
      ;;
  esac
done

if [[ ! -d "$ROOT_DIR" ]]; then
  echo "Project root does not exist: $ROOT_DIR" >&2
  exit 1
fi

if [[ ! -f "$ROOT_DIR/GlowUp.sln" ]]; then
  echo "GlowUp.sln not found under: $ROOT_DIR" >&2
  exit 1
fi

if [[ "$(uname -s)" != "Darwin" ]]; then
  echo "Warning: this script is intended for macOS (Darwin)." >&2
fi

has_cmd() {
  command -v "$1" >/dev/null 2>&1
}

run_with_docker() {
  local container_flags=(
    -p "${PORT}:${PORT}"
    -v "${ROOT_DIR}:/workspace"
    -w /workspace
  )

  echo
  echo "Running in Docker image: $DOCKER_IMAGE"
  echo "This may take a few minutes on first run (package install inside container)."

  docker run --rm -it "${container_flags[@]}" "$DOCKER_IMAGE" bash -lc "
    set -euo pipefail
    export DEBIAN_FRONTEND=noninteractive
    apt-get update
    apt-get install -y mono-complete nuget >/dev/null
    BUILD_TOOL=''
    SERVER_TOOL=''
    if command -v msbuild >/dev/null 2>&1; then
      BUILD_TOOL='msbuild'
    elif command -v xbuild >/dev/null 2>&1; then
      BUILD_TOOL='xbuild'
    else
      echo 'Missing build tool inside container: msbuild or xbuild' >&2
      exit 1
    fi
    if command -v xsp4 >/dev/null 2>&1; then
      SERVER_TOOL='xsp4'
    elif command -v xsp >/dev/null 2>&1; then
      SERVER_TOOL='xsp'
    else
      echo 'Missing web server tool inside container: xsp4 or xsp' >&2
      exit 1
    fi
    if [[ '${SKIP_RESTORE}' != 'true' ]]; then
      nuget restore GlowUp.sln
    fi
    if [[ '${SKIP_BUILD}' != 'true' ]]; then
      \"\${BUILD_TOOL}\" GlowUp.sln /p:Configuration='${CONFIGURATION}'
    fi
    echo
    echo 'Starting web server at http://localhost:${PORT}/Home.aspx'
    echo 'Press Ctrl+C to stop.'
    \"\${SERVER_TOOL}\" --port '${PORT}' --root /workspace
  "
}

XSP_CMD=""
BUILD_CMD=""
MISSING=()

if has_cmd nuget; then
  :
else
  MISSING+=("nuget")
fi

if has_cmd msbuild; then
  BUILD_CMD="msbuild"
elif has_cmd xbuild; then
  BUILD_CMD="xbuild"
else
  MISSING+=("msbuild or xbuild")
fi

if has_cmd xsp4; then
  XSP_CMD="xsp4"
elif has_cmd xsp; then
  XSP_CMD="xsp"
else
  MISSING+=("xsp4 or xsp")
fi

if has_cmd mono; then
  :
else
  MISSING+=("mono")
fi

echo "Project root : $ROOT_DIR"
echo "Port         : $PORT"
echo "Docker mode  : $USE_DOCKER"
[[ -n "$BUILD_CMD" ]] && echo "Build tool   : $BUILD_CMD"
[[ -n "$XSP_CMD" ]] && echo "Server tool  : $XSP_CMD"

if [[ "$USE_DOCKER" == "true" ]]; then
  if ! has_cmd docker; then
    echo
    echo "Missing required tool for --docker mode: docker"
    exit 1
  fi

  if [[ "$CHECK_ONLY" == "true" ]]; then
    echo
    echo "Environment check passed (Docker mode)."
    exit 0
  fi

  run_with_docker
  exit 0
fi

if [[ ${#MISSING[@]} -gt 0 ]]; then
  echo
  echo "Missing required tools:"
  for item in "${MISSING[@]}"; do
    echo "  - $item"
  done
  echo
  echo "Install with Homebrew:"
  echo "  brew install mono nuget"
  echo
  echo "Note: Homebrew Mono often does not include xsp/xsp4."
  echo "If xsp is missing, run this script with Docker fallback:"
  echo "  ./run-macos.sh --docker"
  exit 1
fi

if [[ "$CHECK_ONLY" == "true" ]]; then
  echo
  echo "Environment check passed."
  exit 0
fi

cd "$ROOT_DIR"

if [[ "$SKIP_RESTORE" != "true" ]]; then
  echo
  echo "Restoring NuGet packages..."
  nuget restore GlowUp.sln
fi

if [[ "$SKIP_BUILD" != "true" ]]; then
  echo
  echo "Building solution ($CONFIGURATION)..."
  "$BUILD_CMD" GlowUp.sln /p:Configuration="$CONFIGURATION"
fi

echo
echo "Starting web server at http://localhost:$PORT/Home.aspx"
echo "Press Ctrl+C to stop."
"$XSP_CMD" --port "$PORT" --root "$ROOT_DIR"

