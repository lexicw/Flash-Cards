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
    public partial class _Default : Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                SetCorkBoard();
            }
        }
        private void SetCorkBoard()
        {
            string userId = "1";

            SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString);
            conn.Open();
            string query = "SELECT * FROM Users WHERE userId='" + userId + "'";

            SqlCommand cmd = new SqlCommand(query, conn);
            SqlDataReader sdr = cmd.ExecuteReader();

            if (sdr.Read())
            {
                string toDoList = sdr["ToDoList"].ToString();
                string stickyNoteOne = sdr["StickyNoteOne"].ToString();
                string stickyNoteTwo = sdr["StickyNoteTwo"].ToString();

                ToDoList.InnerText = toDoList;
                StickyNoteOne.InnerText = stickyNoteOne;
                StickyNoteTwo.InnerText = stickyNoteTwo;
            }
            conn.Close();
        }
        protected void Save_Click(object sender, EventArgs e)
        {
            string userId = "1";

            SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString);

            conn.Open();

            string query = "UPDATE Users SET ToDoList=@ToDoList, StickyNoteOne=@StickyNoteOne, StickyNoteTwo=@StickyNoteTwo WHERE userId='" + userId + "'";
            SqlCommand cmd = new SqlCommand(query, conn);

            cmd.Parameters.AddWithValue("@ToDoList", ToDoList.InnerText);
            cmd.Parameters.AddWithValue("@StickyNoteOne", StickyNoteOne.InnerText);
            cmd.Parameters.AddWithValue("@StickyNoteTwo", StickyNoteTwo.InnerText);

            cmd.ExecuteReader();
            conn.Close();
        }
    }
}