using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Flash_Cards
{
    public partial class Cards : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
                SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString);
                conn.Open();
                string getCards = "SELECT * FROM [Cards] WHERE cardId = 1";
                SqlCommand cmd = new SqlCommand(getCards, conn);
                SqlDataReader dr = cmd.ExecuteReader();

            if (dr.Read())
            {
                string t1 = dr["front"].ToString();
                string t2 = dr["back"].ToString();
                Label1.Text = t1;
                Label2.Text = t2;
            }

            conn.Close();
            
        }

    }
}