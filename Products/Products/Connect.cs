using MySql.Data.MySqlClient;
namespace Products
{
    public class Connect
    {
        public MySqlConnection Connection;
        private string MysqlConnectionString;

        private string Host;
        private string Database;
        private string User;
        private string Password;

        public Connect()
        {
            Host = "localhost";
            Database = "Shop";
            User = "root"; 
            Password = "";
            MysqlConnectionString = "SERVER=" + Host + ";DATABASE=" + Database + ";UID=" + User + ";PASSWORD=" + Password + ";SslMode=None";
            Connection = new MySqlConnection(MysqlConnectionString);
        }
    }
}
