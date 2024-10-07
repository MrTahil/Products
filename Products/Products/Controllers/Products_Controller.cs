using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using MySql.Data.MySqlClient;
using Products;
using Products.Model;
using System;
using System.Data.Common;
using System.Reflection.Metadata.Ecma335;
using System.Reflection.PortableExecutable;

namespace Products.Controllers
{
    [Route("Product")]
    [ApiController]

    public class ProductsController : ControllerBase
    { public int count = 0;
        public int id1 = 0;
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

            string query = "INSERT INTO Products (Id, Name, Price, Date) VALUES (@Id, @Name, @Price, @Date)";
            var command5 = new MySqlCommand("SELECT COUNT(*) FROM Products", _connection.Connection);
            count = Convert.ToInt32(await command5.ExecuteScalarAsync());
            using (var command = new MySqlCommand(query, _connection.Connection))
            {
                command.Parameters.AddWithValue("@Id", count + 1);
                command.Parameters.AddWithValue("@Name", product.Name);
                command.Parameters.AddWithValue("@Price", product.Price);
                command.Parameters.AddWithValue("@Date", DateTime.Now);


                await command.ExecuteNonQueryAsync();
            }

            await _connection.Connection.CloseAsync();


            return CreatedAtAction("Get", new { id = count + 1 }, product); }






        [HttpPut("{id}")]
        public async Task<ActionResult<Product>> Put(int id, [FromBody] Product product)
        {
            if (product == null)
            {
                return BadRequest("Nem lehet nulla");
            }

            await _connection.Connection.OpenAsync();




            string updateQuery = "UPDATE Products SET Name = @Name, Price = @Price, Date = @Date WHERE Id = @Id";
            using (var updateCommand = new MySqlCommand(updateQuery, _connection.Connection))
            {
                updateCommand.Parameters.AddWithValue("@Id", id);
                updateCommand.Parameters.AddWithValue("@Name", product.Name);
                updateCommand.Parameters.AddWithValue("@Price", product.Price);
                updateCommand.Parameters.AddWithValue("@Date", DateTime.Now);

                await updateCommand.ExecuteNonQueryAsync();
            }

            await _connection.Connection.CloseAsync();

            return NoContent();

        }
        [HttpDelete("{id}")]
        public async Task<ActionResult> Delete(int id)
        {
            await _connection.Connection.OpenAsync();

            string deleteQuery = "DELETE FROM Products WHERE Id = @Id";
            using (var deleteCommand = new MySqlCommand(deleteQuery, _connection.Connection))
            {
                deleteCommand.Parameters.AddWithValue("@Id", id);
                await deleteCommand.ExecuteNonQueryAsync();
            }

            await _connection.Connection.CloseAsync();

            return NoContent(); 
        }




        [HttpGet("{id}")]
        public async Task<ActionResult<IEnumerable<Product>>> Get(int id)
        {
            var products = new List<Product>();
            await _connection.Connection.OpenAsync();

            string query = "SELECT * FROM Products WHERE Id=@Id";
            using (var command2 = new MySqlCommand(query, _connection.Connection))
            {

                command2.Parameters.AddWithValue("@Id", id);
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
            await _connection.Connection.CloseAsync();
            return Ok(products);
        }

        }



}

    


