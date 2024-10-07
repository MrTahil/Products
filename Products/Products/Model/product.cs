using System.Collections.Generic;

namespace Products.Model
{
    public class Product
    {
        public int Id { get; set; }
        public string Name { get; set; }
        public int Price { get; set; }
        public DateTime CreatedDate { get; set; }
    }
}
