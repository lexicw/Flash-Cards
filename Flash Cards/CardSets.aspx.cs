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
                this.BindSetRepeater();
            }
        }

        private void BindSetRepeater()
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
            conn.Close();

        }

        protected void AddSetBtn_Click(object sender, EventArgs e)
        {
            string userId = Application["UserId"].ToString();


            if (String.IsNullOrEmpty(newSetNameTxt.Text) || String.IsNullOrEmpty(newDescText.Text))
            {
            
            }

            else { 
            string setName = newSetNameTxt.Text;
            string description = newDescText.Text;

            SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString);
            conn.Open();

            string query = "INSERT INTO Sets (setName, description, userId) VALUES('" + setName + "', '" + description + "', '" + userId + "');";
            SqlCommand cmd = new SqlCommand(query, conn);
            cmd.ExecuteReader();
            conn.Close();

            Response.Redirect("CardSets.aspx");
            }
        }


     }
}