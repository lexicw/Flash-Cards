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
    public partial class Login : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            Control myControlMenu = Page.Master.FindControl("masterpage");
            if (myControlMenu != null)
            {
                myControlMenu.Visible = false;
            }
        }

        protected void LoginBtn_Click(object sender, EventArgs e)
        {
            try
            {
                string userName = userNameTxt.Text;
                string password = passwordTxt.Text;

                SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString);
                conn.Open();
                string query = "select * from Users where userName='" + userName + "' and password='" + password + "'";

                SqlCommand cmd = new SqlCommand(query, conn);
                SqlDataReader sdr = cmd.ExecuteReader();

                if (sdr.Read())
                {
                    loginMsg.Text = "Login Sucessful!";
                    int userId = Convert.ToInt32(sdr["userId"]);
                    userName = sdr["userName"].ToString();

                    Application["UserName"] = userName;
                    Application["UserId"] = userId;
                    Response.Redirect("/Default.aspx");

                    if (userId > 0)
                    {
                        //welcomeList.Visible = true;
                        //lblUsername.Text = userName;
                    }

                }
                else
                {
                    loginMsg.Text = "Your username and password are incorrect. Please try again.";

                }
                conn.Close();
            }
            catch (Exception ex)
            {
                Response.Write(ex.Message);
                loginMsg.Text = "An Error has occurred.";
            }

        }
    }
}