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
    public partial class Cards : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!this.IsPostBack)
            {
                this.BindCards();
            }

        }

        public void BindCards()
        {
            SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString);
            conn.Open();
            string query = "SELECT cardId, front, back FROM Cards WHERE setId = 3";

            SqlCommand cmd = new SqlCommand(query, conn);

            using (SqlDataAdapter sda = new SqlDataAdapter(cmd))
            {
                DataTable dt = new DataTable();
                sda.Fill(dt);
                cardGridView.DataSource = dt;
                cardGridView.DataBind();
                ViewState["dirState"] = dt;
                ViewState["sortdr"] = "Asc";
            }
            conn.Close();

            
        }

        protected void OnPaging(object sender, GridViewPageEventArgs e)
        {
            cardGridView.PageIndex = e.NewPageIndex;
            this.BindCards();
        }

        protected void OnRowEditing(object sender, GridViewEditEventArgs e)
        {
            cardGridView.EditIndex = e.NewEditIndex;
            this.BindCards();
        }

        protected void OnRowUpdating(object sender, GridViewUpdateEventArgs e)
        {
            GridViewRow row = cardGridView.Rows[e.RowIndex];
            string front = (row.Cells[0].Controls[0] as TextBox).Text;
            string back = (row.Cells[1].Controls[0] as TextBox).Text;

            string constr = ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;
            using (SqlConnection con = new SqlConnection(constr))
            {
                using (SqlCommand cmd = new SqlCommand("UPDATE Cards SET front = @front, back = @back WHERE cardId = @cardId"))
                {
                    cmd.Parameters.AddWithValue("@front", front);
                    cmd.Parameters.AddWithValue("@back", back);
                    cmd.Connection = con;
                    con.Open();
                    cmd.ExecuteNonQuery();
                    con.Close();
                }
            }
            cardGridView.EditIndex = -1;
            this.BindCards();
        }

        protected void OnRowCancelingEdit(object sender, EventArgs e)
        {
            cardGridView.EditIndex = -1;
            this.BindCards();
        }
        protected void OnRowDeleting(object sender, GridViewDeleteEventArgs e)
        {

        }

        protected void OnRowDataBound(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.DataRow && e.Row.RowIndex != cardGridView.EditIndex)
            {
                //(e.Row.Cells[0].Controls[2] as LinkButton).Attributes["onclick"] = "return confirm('Do you want to delete this row?');";
            }
        }

        protected void OnRowSwap(object sender, EventArgs e)
        {
            
        }

        protected void Back_Click(object sender, EventArgs e)
        {
            Response.Redirect("CardSets.aspx");
        }

        protected void GridView_Sorting(Object sender, GridViewSortEventArgs e)
        {
            DataTable dtrslt = (DataTable)ViewState["dirState"];

            if (dtrslt.Rows.Count > 0)
            {
                if (Convert.ToString(ViewState["sortdr"]) == "Asc")
                {
                    dtrslt.DefaultView.Sort = e.SortExpression + " Desc";
                    ViewState["sortdr"] = "Desc";
                }
                else
                {
                    dtrslt.DefaultView.Sort = e.SortExpression + " Asc";
                    ViewState["sortdr"] = "Asc";
                }
                cardGridView.DataSource = dtrslt;
                cardGridView.DataBind();


            }
        }


    }
}