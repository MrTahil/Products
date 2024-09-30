using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using MySql.Data.MySqlClient;
using Products;
using Products.Model;
using System;
using System.Data.Common;
using System.Reflection.Metadata.Ecma335;

namespace Products.Controllers
{
    [Route("Product")]
    [ApiController]
    
    public class ProductsController : ControllerBase
    {   public int count = 0;
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
            using (var command2 = new MySqlCommand(query, _connection.Connection))
            {
                using (var reader = await command2.ExecuteReaderAsync())
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
            //var command = new MySqlCommand("SELECT COUNT(*) FROM Products", _connection.Connection);
            //count = Convert.ToInt32(await command.ExecuteScalarAsync());



            return Ok(products);



            
                
        }
            [HttpPost]
            public async Task<ActionResult<Product>> Post([FromBody] Product product)
            {
                if (product == null)
                {
                    return BadRequest("Nem lehet nulla");
                }

                    await _connection.Connection.OpenAsync();

                    string query = "INSERT INTO Products (Id,Name, Price, Date) VALUES (@Id,@Name, @Price, @Date)";
            var command5 = new MySqlCommand("SELECT COUNT(*) FROM Products", _connection.Connection);
            count = Convert.ToInt32(await command5.ExecuteScalarAsync());
            using (var command = new MySqlCommand(query, _connection.Connection))
                    {
                        command.Parameters.AddWithValue("@Id", count+1);
                        command.Parameters.AddWithValue("@Name", product.Name);
                        command.Parameters.AddWithValue("@Price", product.Price);
                        command.Parameters.AddWithValue("@Date", product.CreatedDate);

                        await command.ExecuteNonQueryAsync();
                    }
                
                    await _connection.Connection.CloseAsync();
                
                
                return CreatedAtAction("Get", new { id=count+1 }, product);}
            }

            
                }

    


