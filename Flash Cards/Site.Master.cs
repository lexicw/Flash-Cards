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
    public partial class SiteMaster : MasterPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            // Sets the username and password by default for testing purposes
            Application["UserName"] = "Lexi";
            Application["UserId"] = 1;
        }

        public void Logout_Click(object sender, EventArgs e)
        {
            Application["UserId"] = 0;
            Response.Redirect("/Login.aspx");
        }

    }
}
