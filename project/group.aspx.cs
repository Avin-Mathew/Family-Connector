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
    public partial class group : System.Web.UI.Page
    {
        public SqlConnection con = new SqlConnection();
        public void getcon()
        {
            con.ConnectionString = ConfigurationManager.ConnectionStrings["db_ccs2ConnectionString"].ToString();
            con.Open();
        }
        protected void Page_PreInit(object sender, EventArgs e)
        {
            if (Session["user"].ToString() == "1")
            {
                this.MasterPageFile = "settings.Master";
            }
           

            
        }
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            { 
            
            }
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            getcon();
            string str1 = "insert into tbl_group values('" + Txt_Group.Text + "','" + Txt_Description.Text + "')";
            SqlCommand cmd1 = new SqlCommand(str1, con);
            cmd1.ExecuteNonQuery();
            con.Close();
        }

        protected void Btn_View_Click(object sender, EventArgs e)
        {
            getcon();
            string str1 = "select group_name,group_description,group_id from tbl_group";
            SqlCommand cmd1 = new SqlCommand(str1, con);
            SqlDataAdapter ad1 = new SqlDataAdapter(cmd1);
            DataTable dt1 = new DataTable();
            ad1.Fill(dt1);
            if (dt1.Rows.Count > 0)
            {
                Grd_Group.DataSource = dt1;
                Grd_Group.DataBind();
            }
            con.Close();
        }

        protected void Grd_Group_RowEditing(object sender, GridViewEditEventArgs e)
        {
            Grd_Group.EditIndex = e.NewEditIndex;
            getcon();
            string str = "select group_name,group_description,group_id from tbl_group";
            SqlCommand cmd = new SqlCommand(str, con);
            SqlDataAdapter ad1 = new SqlDataAdapter(cmd);
            DataTable dt = new DataTable();
            ad1.Fill(dt);
            if (dt.Rows.Count > 0)
            {
                Grd_Group.DataSource = dt;
                Grd_Group.DataBind();
            }
        }

        protected void Grd_Group_RowUpdating(object sender, GridViewUpdateEventArgs e)
        {
            getcon();
            string dk = Grd_Group.DataKeys[e.RowIndex].Values[0].ToString();
            string gname = ((TextBox)Grd_Group.Rows[e.RowIndex].Cells[0].Controls[0]).Text;
            string gdescription = ((TextBox)Grd_Group.Rows[e.RowIndex].Cells[1].Controls[0]).Text;
            string str = "update tbl_group set group_name='" + gname + "',group_description='" + gdescription + "' where group_id='" + dk + "'";
            SqlCommand cmd = new SqlCommand(str, con);
            cmd.ExecuteNonQuery();
            Grd_Group.EditIndex = -1;
            string str3 = "select group_name,group_description,group_id from tbl_group";
            SqlCommand cmd1 = new SqlCommand(str3, con);
            SqlDataAdapter ad1 = new SqlDataAdapter(cmd1);
            DataTable dt1 = new DataTable();
            ad1.Fill(dt1);
            if (dt1.Rows.Count > 0)
            {
                Grd_Group.DataSource = dt1;
                Grd_Group.DataBind();
            }
            con.Close();
        }

        protected void Grd_Group_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
        {
            getcon();
            Grd_Group.EditIndex = -1;
            string str1 = "select group_name,group_description,group_id from tbl_group";
            SqlCommand cmd1 = new SqlCommand(str1, con);
            SqlDataAdapter ad1 = new SqlDataAdapter(cmd1);
            DataTable dt1 = new DataTable();
            ad1.Fill(dt1);
            if (dt1.Rows.Count > 0)
            {
                Grd_Group.DataSource = dt1;
                Grd_Group.DataBind();
            }
            con.Close();
        }

        protected void Grd_Group_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            getcon();
            string dk = Grd_Group.DataKeys[e.RowIndex].Values[0].ToString();
            string str = "delete from tbl_group where group_id='" + dk + "'";
            SqlCommand cmd = new SqlCommand(str, con);
            cmd.ExecuteNonQuery();
            string str1 = "select group_name,group_description,group_id from tbl_group";
            SqlCommand cmd1 = new SqlCommand(str1, con);
            SqlDataAdapter ad = new SqlDataAdapter(cmd1);
            DataTable dt1 = new DataTable();
            ad.Fill(dt1);
            if (dt1.Rows.Count > 0)
            {
                Grd_Group.DataSource = dt1;
                Grd_Group.DataBind();
            }
            con.Close();
        }

        protected void Grd_Group_SelectedIndexChanged(object sender, EventArgs e)
        {
        
        }
        }
}