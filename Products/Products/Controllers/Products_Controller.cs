using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using MySql.Data.MySqlClient;
using Products;
using Products.Model;
using System;
using System.Reflection.Metadata.Ecma335;

namespace Products.Controllers
{
    [Route("Product")]
    [ApiController]
    public class ProductsController : ControllerBase
    {
        private readonly Connect _connection;

        public ProductsController()
        {
            _connection = new Connect(); 
        }

        [HttpGet]
        public async Task<ActionResult<IEnumerable<Product>>> Get()
        {
            var products = new List<Product>();
                await _connection.Connection.OpenAsync();

                string query = "SELECT * FROM Products"; 
                using (var command = new MySqlCommand(query, _connection.Connection))
                {
                    using (var reader = await command.ExecuteReaderAsync())
                    {
                        while (await reader.ReadAsync())
                        {
                            var product = new Product
                            {
                                Id = reader.GetInt32(0),
                                Name = reader.GetString(1),
                                Price = reader.GetInt32(2),
                                CreatedDate = reader.GetDateTime(3)
                            };
                            products.Add(product);
                        }
                    }
                }
            

            return Ok(products);
        }
    }

}
