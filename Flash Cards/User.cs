using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Web;

namespace Flash_Cards
{
    public abstract class User
    {
        public int userId { get; set; }
        public string userName { get; set; }
        public string password { get; set; }

        public User() { 
        SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString);
        conn.Open();
        string getUsers = "SELECT * FROM [Users]";
        SqlCommand cmd = new SqlCommand(getUsers, conn);
        SqlDataReader dr = cmd.ExecuteReader();

            while (dr.Read())
            {
            int userId = Convert.ToInt32(dr["userId"]);
            string userName = dr["userName"].ToString();
            string password = dr["password"].ToString();
            }

        conn.Close();
        }


        public User(int userId, String userName, String password)
        {
            this.userId = userId;
            this.userName = userName;
            this.password = password;
        }
    }
}