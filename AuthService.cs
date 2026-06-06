using System.Web.SessionState;

namespace GlowUp
{
    public static class AuthService
    {
        private const string UserEmailSessionKey = "UserEmail";

        public static bool IsLoggedIn(HttpSessionState session)
        {
            return session[UserEmailSessionKey] != null;
        }

        public static string GetUserEmail(HttpSessionState session)
        {
            return session[UserEmailSessionKey] as string;
        }

        public static void Login(HttpSessionState session, string email)
        {
            session[UserEmailSessionKey] = email;
        }

        public static void Logout(HttpSessionState session)
        {
            session.Remove(UserEmailSessionKey);
        }
    }
}
