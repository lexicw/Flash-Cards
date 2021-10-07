using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.HtmlControls;

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

        protected void EditSetBtn_Click(object sender, EventArgs e)
        {
            string setName = ((LinkButton)sender).Attributes["SetName"].ToString();
            string setDesc = ((LinkButton)sender).Attributes["SetDesc"].ToString();
            string setId = ((LinkButton)sender).CommandArgument.ToString();

            ScriptManager.RegisterStartupScript(this, this.GetType(), "Modal", "showModal('" + setName + "', '" + setDesc + "', '" + setId + "');", true);
        }

        protected void SaveEditSetBtn_Click(object sender, EventArgs e)
        {
            string setId = hdnfldSetId.Value;

            SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString);

            conn.Open();

            string query = "UPDATE Sets SET setName=@setName, description=@setDesc WHERE setId='" + setId + "'";
            SqlCommand cmd = new SqlCommand(query, conn);

            cmd.Parameters.AddWithValue("@setName", editSetNameTxt.Text);
            cmd.Parameters.AddWithValue("@setDesc", editDescTxt.Text);

            cmd.ExecuteReader();
            conn.Close();

            Response.Redirect("CardSets.aspx");
        }
        protected void DeleteSetBtn_Click(object sender, EventArgs e)
        {
            string setId = ((LinkButton)sender).CommandArgument.ToString();

            SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString);

            conn.Open();

            string query = "DELETE Sets WHERE setId='" + setId + "'";
            SqlCommand cmd = new SqlCommand(query, conn);

            cmd.ExecuteReader();
            conn.Close();

            Response.Redirect("CardSets.aspx");
        }
    }
}