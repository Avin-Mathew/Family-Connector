using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Configuration;
using System.Data;

namespace Family_Connector
{
    public partial class country : System.Web.UI.Page
    {
        public SqlConnection con = new SqlConnection();
        public void getcon()
        {
            con.ConnectionString = ConfigurationManager.ConnectionStrings["db_ccs2ConnectionString"].ToString();
            con.Open();
        }
    
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            { 
            
            }
        }

        protected void Btn_Add_Click(object sender, EventArgs e)
        {
            getcon();
            string str1 = "select country_name,country_id from tbl_country where country_name='" + Txt_country.Text + "'";
            SqlCommand cmd1 = new SqlCommand(str1, con);
            SqlDataAdapter ad1 = new SqlDataAdapter(cmd1);
            DataTable dt1 = new DataTable();
            ad1.Fill(dt1);
            if (dt1.Rows.Count > 0)
            {
                ScriptManager.RegisterStartupScript(Page, this.GetType(), "write", "alert('Already Existig')", true);
                Txt_country.Text = "";
            }
            else
            {
                string str2 = "insert into tbl_country values('" + Txt_country.Text + "')";
                SqlCommand cmd2 = new SqlCommand(str2, con);
                cmd2.ExecuteNonQuery();
                ScriptManager.RegisterStartupScript(Page, this.GetType(), "write", "alert('Country Inserted')", true);
                Txt_country.Text = "";
            }
            con.Close();
        }

        protected void Btn_View_Click(object sender, EventArgs e)
        {
            getcon();
            string str1 = "select country_name,country_id from tbl_country";
            SqlCommand cmd1 = new SqlCommand(str1, con);
            SqlDataAdapter ad1 = new SqlDataAdapter(cmd1);
            DataTable dt1 = new DataTable();
            ad1.Fill(dt1);
            if (dt1.Rows.Count > 0)
            {
                Grd_Country.DataSource = dt1;
                Grd_Country.DataBind();

            }
            con.Close();
        }

        protected void Grd_Country_RowEditing(object sender, GridViewEditEventArgs e)
        {
            Grd_Country.EditIndex = e.NewEditIndex;
            getcon();
            string str = "select country_name,country_id from tbl_country";
            SqlCommand cmd = new SqlCommand(str, con);
            SqlDataAdapter ad1 = new SqlDataAdapter(cmd);
            DataTable dt = new DataTable();
            ad1.Fill(dt);
            if (dt.Rows.Count > 0)
            {
                Grd_Country.DataSource = dt;
                Grd_Country.DataBind();
            }
        }

        protected void Grd_Country_RowUpdating(object sender, GridViewUpdateEventArgs e)
        {
            getcon();
            string dk = Grd_Country.DataKeys[e.RowIndex].Values[0].ToString();
            string cname = ((TextBox)Grd_Country.Rows[e.RowIndex].Cells[0].Controls[0]).Text;
            string str = "update tbl_country set country_name='" + cname + "'where country_id='" + dk + "'";
            SqlCommand cmd = new SqlCommand(str, con);
            cmd.ExecuteNonQuery();
            Grd_Country.EditIndex = -1;
            string str1 = "select country_name,country_id from tbl_country";
            SqlCommand cmd1 = new SqlCommand(str1, con);
            SqlDataAdapter ad1 = new SqlDataAdapter(cmd1);
            DataTable dt1 = new DataTable();
            ad1.Fill(dt1);
            if (dt1.Rows.Count > 0)
            {
                Grd_Country.DataSource = dt1;
                Grd_Country.DataBind();
            }
            con.Close();
        }

        protected void Grd_Country_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
        {
            getcon();
            Grd_Country.EditIndex = -1;
            string str1 = "select country_name,country_id from tbl_country";
            SqlCommand cmd1 = new SqlCommand(str1, con);
            SqlDataAdapter ad1 = new SqlDataAdapter(cmd1);
            DataTable dt1 = new DataTable();
            ad1.Fill(dt1);
            if (dt1.Rows.Count > 0)
            {
                Grd_Country.DataSource = dt1;
                Grd_Country.DataBind();
            }
            con.Close();
        }

        protected void Grd_Country_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            getcon();
            string dk = Grd_Country.DataKeys[e.RowIndex].Values[0].ToString();
            string str = "delete from tbl_country where country_id='" + dk + "'";
            SqlCommand cmd = new SqlCommand(str, con);
            cmd.ExecuteNonQuery();
            string str1 = "select country_name,country_id from tbl_country";
            SqlCommand cmd1 = new SqlCommand(str1, con);
            SqlDataAdapter ad = new SqlDataAdapter(cmd1);
            DataTable dt1 = new DataTable();
            ad.Fill(dt1);
            if (dt1.Rows.Count > 0)
            {
                Grd_Country.DataSource = dt1;
                Grd_Country.DataBind();
            }
            con.Close();
        }
      
}
}