using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Flash_Cards
{
    public partial class Contact : Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            // Sets the username and password by default for testing purposes
            Application["UserName"] = "Lexi";
            Application["UserId"] = 1;

            if (!this.IsPostBack)
            {
                this.BindRepeater();
            }
        }

        private void BindRepeater()
        {
            string userId = Application["UserId"].ToString();

            SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString);
            conn.Open();
            string query = "SELECT * FROM Sets WHERE userId='" + userId + "'";

            SqlCommand cmd = new SqlCommand(query, conn);

            using (SqlDataAdapter sda = new SqlDataAdapter(cmd))
            {
                DataTable dt = new DataTable();
                sda.Fill(dt);
                rptSets.DataSource = dt;
                rptSets.DataBind();
            }

        }

    }
}