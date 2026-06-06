using System.Collections.Generic;
using System.Linq;
using System.Web.SessionState;

namespace GlowUp
{
    public class CartLineItem
    {
        public ProductItem Product { get; set; }
        public int Quantity { get; set; }

        public decimal LineTotal
        {
            get { return Product.Price * Quantity; }
        }
    }

    public static class CartService
    {
        private const string CartSessionKey = "Cart";

        public static List<string> GetCart(HttpSessionState session)
        {
            var cart = session[CartSessionKey] as List<string>;
            if (cart == null)
            {
                cart = new List<string>();
                session[CartSessionKey] = cart;
            }

            return cart;
        }

        public static void AddToCart(HttpSessionState session, string productId)
        {
            var cart = GetCart(session);
            cart.Add(productId);
        }

        public static int GetItemCount(HttpSessionState session)
        {
            return GetCart(session).Count;
        }

        public static List<CartLineItem> GetCartLineItems(HttpSessionState session)
        {
            return GetCart(session)
                .GroupBy(id => id)
                .Select(group =>
                {
                    var product = ProductCatalog.GetById(group.Key);
                    if (product == null)
                    {
                        return null;
                    }

                    return new CartLineItem
                    {
                        Product = product,
                        Quantity = group.Count()
                    };
                })
                .Where(line => line != null)
                .ToList();
        }

        public static decimal GetTotal(HttpSessionState session)
        {
            return GetCartLineItems(session).Sum(line => line.LineTotal);
        }

        public static void RemoveOne(HttpSessionState session, string productId)
        {
            var cart = GetCart(session);
            var index = cart.IndexOf(productId);
            if (index >= 0)
            {
                cart.RemoveAt(index);
            }
        }

        public static void ClearCart(HttpSessionState session)
        {
            session[CartSessionKey] = new List<string>();
        }
    }
}
