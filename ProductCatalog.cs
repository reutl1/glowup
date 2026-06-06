using System.Collections.Generic;
using System.Linq;

namespace GlowUp
{
    public class ProductItem
    {
        public string Id { get; set; }
        public string Name { get; set; }
        public string ImageUrl { get; set; }
        public decimal Price { get; set; }
        public string Category { get; set; }
    }

    public static class ProductCatalog
    {
        private static readonly List<ProductItem> Products = new List<ProductItem>
        {
            new ProductItem { Id = "rhodelip", Name = "Rhode Peptide Lip Tint", ImageUrl = "images/rhodelip.jpg", Price = 18.00m, Category = "Lips" },
            new ProductItem { Id = "lipliner", Name = "MAC Lip Liner", ImageUrl = "images/lipliner.png", Price = 22.00m, Category = "Lips" },
            new ProductItem { Id = "diorgloss", Name = "Dior Addict Lip Maximizer", ImageUrl = "images/diorgloss.jpg", Price = 38.00m, Category = "Lips" },
            new ProductItem { Id = "fenty", Name = "Fenty Beauty Gloss Bomb", ImageUrl = "images/fenty.jpg", Price = 21.00m, Category = "Lips" },
            new ProductItem { Id = "summer", Name = "Summer Fridays Lip Butter Balm", ImageUrl = "images/summer.jpg", Price = 24.00m, Category = "Lips" },

            new ProductItem { Id = "rhode", Name = "Rhode Pocket Blush", ImageUrl = "images/rhode.jpg", Price = 25.00m, Category = "Blush" },
            new ProductItem { Id = "rareblush", Name = "Rare Beauty Soft Pinch Blush", ImageUrl = "images/rareblush.jpg", Price = 23.00m, Category = "Blush" },
            new ProductItem { Id = "diorblush", Name = "Dior Rosy Glow Blush", ImageUrl = "images/diorblush.jpg", Price = 44.00m, Category = "Blush" },
            new ProductItem { Id = "toofaced", Name = "Too Faced Cloud Crush Blush", ImageUrl = "images/toofaced.jpg", Price = 29.00m, Category = "Blush" },
            new ProductItem { Id = "saie", Name = "Saie Dew Blush", ImageUrl = "images/saie.jpg", Price = 26.00m, Category = "Blush" },

            new ProductItem { Id = "concealer", Name = "NARS Radiant Creamy Concealer", ImageUrl = "images/concealer.jpg", Price = 32.00m, Category = "Face" },
            new ProductItem { Id = "diorfund", Name = "Dior Forever Foundation", ImageUrl = "images/diorfund.jpg", Price = 52.00m, Category = "Face" },
            new ProductItem { Id = "charlotte", Name = "Charlotte Tilbury Flawless Filter", ImageUrl = "images/charlotte.jpg", Price = 46.00m, Category = "Face" },
            new ProductItem { Id = "tart", Name = "Tarte Shape Tape Concealer", ImageUrl = "images/tart.jpg", Price = 29.00m, Category = "Face" },
            new ProductItem { Id = "hourglass", Name = "Hourglass Vanish Foundation", ImageUrl = "images/hourglass.jpg", Price = 56.00m, Category = "Face" },

            new ProductItem { Id = "higligh", Name = "Fenty Beauty Killawatt Highlighter", ImageUrl = "images/higligh.jpg", Price = 36.00m, Category = "Highlighter" },
            new ProductItem { Id = "diorhigh", Name = "Dior Forever Glow Luminizer", ImageUrl = "images/diorhigh.jpg", Price = 48.00m, Category = "Highlighter" },
            new ProductItem { Id = "toofacedhigh", Name = "Too Faced Born This Way Highlighter", ImageUrl = "images/toofacedhigh.jpg", Price = 34.00m, Category = "Highlighter" },
            new ProductItem { Id = "high2", Name = "Becca Shimmering Skin Perfector", ImageUrl = "images/high2.jpg", Price = 38.00m, Category = "Highlighter" },
            new ProductItem { Id = "rarehigh", Name = "Rare Beauty Positive Light Highlighter", ImageUrl = "images/rarehigh.jpg", Price = 25.00m, Category = "Highlighter" },

            new ProductItem { Id = "setting", Name = "Charlotte Tilbury Airbrush Setting Spray", ImageUrl = "images/setting.jpg", Price = 38.00m, Category = "Special" },
            new ProductItem { Id = "gel", Name = "Benefit Brow Gel", ImageUrl = "images/gel.jpg", Price = 26.00m, Category = "Special" },
            new ProductItem { Id = "mascara", Name = "Too Faced Better Than Sex Mascara", ImageUrl = "images/mascara.jpg", Price = 29.00m, Category = "Special" },
        };

        public static ProductItem GetById(string id)
        {
            return Products.FirstOrDefault(p => p.Id == id);
        }

        public static IReadOnlyList<ProductItem> GetAll()
        {
            return Products;
        }
    }
}
