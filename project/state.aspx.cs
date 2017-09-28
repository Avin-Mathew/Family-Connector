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
    public partial class state : System.Web.UI.Page
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
                getcon();
                string str = "select country_name,country_id from tbl_country";
                SqlCommand cmd = new SqlCommand(str, con);
                SqlDataAdapter ad = new SqlDataAdapter(cmd);
                DataTable dt = new DataTable();
                ad.Fill(dt);
                {
                    DropDown_CountryState.DataSource = dt;
                    DropDown_CountryState.DataTextField = "country_name";
                    DropDown_CountryState.DataValueField = "country_id";
                    DropDown_CountryState.DataBind();
                    DropDown_CountryState.Items.Insert(0, "select");
                }
                con.Close();
            }
        }

        protected void Btn_AddState_Click(object sender, EventArgs e)
        {
            getcon();
            string str1 = "select state_name,state_id from tbl_state where state_name='" + Txt_State.Text + "'";
            SqlCommand cmd1 = new SqlCommand(str1, con);
            SqlDataAdapter ad1 = new SqlDataAdapter(cmd1);
            DataTable dt1 = new DataTable();
            ad1.Fill(dt1);
            if (dt1.Rows.Count > 0)
            {
                ScriptManager.RegisterStartupScript(Page, this.GetType(), "write", "alert('Already Existig')", true);
                Txt_State.Text = "";
            }
            else
            {
                string str2 = "insert into tbl_state values('" + Txt_State.Text + "','" + Convert.ToInt32(DropDown_CountryState.SelectedItem.Value) + "')";
                SqlCommand cmd2 = new SqlCommand(str2, con);
                cmd2.ExecuteNonQuery();
                ScriptManager.RegisterStartupScript(Page, this.GetType(), "write", "alert('State Inserted')", true);
                Txt_State.Text = "";
            }
            con.Close();
        }

        protected void Btn_ViewState_Click(object sender, EventArgs e)
        {
            getcon();
            if (DropDown_CountryState.SelectedIndex > 0)
            {
                Label1.Visible = false;
                string str1 = "select state_name,state_id from tbl_state where country_id='" + DropDown_CountryState.SelectedItem.Value + "'";
                SqlCommand cmd1 = new SqlCommand(str1, con);
                SqlDataAdapter ad1 = new SqlDataAdapter(cmd1);
                DataTable dt1 = new DataTable();
                ad1.Fill(dt1);
                if (dt1.Rows.Count > 0)
                {
                    Grd_State.DataSource = dt1;
                    Grd_State.DataBind();

                }
            }
            else
            {
                Label1.Visible = true;
            }
            con.Close();
        }

        protected void Grd_State_RowEditing(object sender, GridViewEditEventArgs e)
        {
            Grd_State.EditIndex = e.NewEditIndex;
            getcon();
            string str = "select state_name,state_id from tbl_state where country_id='" + DropDown_CountryState.SelectedItem.Value + "'";
            SqlCommand cmd = new SqlCommand(str, con);
            SqlDataAdapter ad1 = new SqlDataAdapter(cmd);
            DataTable dt = new DataTable();
            ad1.Fill(dt);
            if (dt.Rows.Count > 0)
            {
                Grd_State.DataSource = dt;
                Grd_State.DataBind();
            }
            con.Close();
        }

        protected void Grd_State_RowUpdating(object sender, GridViewUpdateEventArgs e)
        {
            getcon();
            string dk = Grd_State.DataKeys[e.RowIndex].Values[0].ToString();
            string cname = ((TextBox)Grd_State.Rows[e.RowIndex].Cells[0].Controls[0]).Text;
            string str = "update tbl_state set state_name='" + cname + "'where state_id='" + dk + "'";
            SqlCommand cmd = new SqlCommand(str, con);
            cmd.ExecuteNonQuery();
            Grd_State.EditIndex = -1;
            string str1 = "select state_name,state_id from tbl_state where country_id='" + DropDown_CountryState.SelectedItem.Value + "'";
            SqlCommand cmd1 = new SqlCommand(str1, con);
            SqlDataAdapter ad1 = new SqlDataAdapter(cmd1);
            DataTable dt1 = new DataTable();
            ad1.Fill(dt1);
            if (dt1.Rows.Count > 0)
            {
                Grd_State.DataSource = dt1;
                Grd_State.DataBind();
            }
            con.Close();
        }

        protected void Grd_State_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
        {
            getcon();
            Grd_State.EditIndex = -1;
            string str1 = "select state_name,state_id from tbl_state";
            SqlCommand cmd1 = new SqlCommand(str1, con);
            SqlDataAdapter ad1 = new SqlDataAdapter(cmd1);
            DataTable dt1 = new DataTable();
            ad1.Fill(dt1);
            if (dt1.Rows.Count > 0)
            {
                Grd_State.DataSource = dt1;
                Grd_State.DataBind();
            }
            con.Close();
        }

        protected void Grd_State_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            getcon();
            string dk = Grd_State.DataKeys[e.RowIndex].Values[0].ToString();
            string str = "delete from tbl_state where state_id='" + dk + "'";
            SqlCommand cmd = new SqlCommand(str, con);
            cmd.ExecuteNonQuery();
            string str1 = "select state_name,state_id from tbl_state where country_id='" + DropDown_CountryState.SelectedItem.Value + "'";
            SqlCommand cmd1 = new SqlCommand(str1, con);
            SqlDataAdapter ad = new SqlDataAdapter(cmd1);
            DataTable dt1 = new DataTable();
            ad.Fill(dt1);
            if (dt1.Rows.Count > 0)
            {
                Grd_State.DataSource = dt1;
                Grd_State.DataBind();
            }
            con.Close();
        }

        protected void DropDown_CountryState_SelectedIndexChanged(object sender, EventArgs e)
        {
            Label1.Visible = false;
        }
    }
}