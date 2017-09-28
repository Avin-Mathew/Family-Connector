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
    public partial class district : System.Web.UI.Page
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
                    DropDown_DistrictCountry.DataSource = dt;
                    DropDown_DistrictCountry.DataTextField = "country_name";
                    DropDown_DistrictCountry.DataValueField = "country_id";
                    DropDown_DistrictCountry.DataBind();
                    DropDown_DistrictCountry.Items.Insert(0, "select");
                }
                
                con.Close();
            }
}

        protected void Btn_AddDistrict_Click(object sender, EventArgs e)
        {
            getcon();
          
            string str1 = "select district_name,district_id from tbl_district where district_name='" + Txt_District.Text + "'";
            SqlCommand cmd1 = new SqlCommand(str1, con);
            SqlDataAdapter ad1 = new SqlDataAdapter(cmd1);
            DataTable dt1 = new DataTable();
            ad1.Fill(dt1);
            if (dt1.Rows.Count > 0)
            {
                ScriptManager.RegisterStartupScript(Page, this.GetType(), "write", "alert('Already Existig')", true);
                Txt_District.Text = "";
            }
            else
            {
                if (DropDown_DistrictState.SelectedIndex > 0)
                {
                    string str2 = "insert into tbl_district values('" + Txt_District.Text + "','" + Convert.ToInt32(DropDown_DistrictState.SelectedItem.Value) + "')";
                    SqlCommand cmd2 = new SqlCommand(str2, con);
                    cmd2.ExecuteNonQuery();
                    ScriptManager.RegisterStartupScript(Page, this.GetType(), "write", "alert('State Inserted')", true);
                    Txt_District.Text = "";
                }
                else
                {
                    Lbl_DistrictState.Visible = true;
                }
            }
            con.Close();
        }

        protected void Grd_District_SelectedIndexChanged(object sender, EventArgs e)
        {
            Lbl_DistrictCountry.Visible = false;
        }

        protected void DropDown_DistrictCountry_SelectedIndexChanged(object sender, EventArgs e)
        {
                getcon();
            
                string str = "select state_name,state_id from tbl_state where country_id=('" + DropDown_DistrictCountry.SelectedItem.Value + "')";
                SqlCommand cmd = new SqlCommand(str, con);
                SqlDataAdapter ad = new SqlDataAdapter(cmd);
                DataTable dt = new DataTable();
                ad.Fill(dt);
                if (dt.Rows.Count >0)
                {
                    DropDown_DistrictState.DataSource = dt;
                    DropDown_DistrictState.DataTextField = "state_name";
                    DropDown_DistrictState.DataValueField = "state_id";
                    DropDown_DistrictState.DataBind();
                    DropDown_DistrictState.Items.Insert(0, "select");
                    Lbl_DistrictCountry.Visible = false;
                }
                if (dt.Rows.Count == 0)
                {
                    DropDown_DistrictState.Items.Clear();
                    DropDown_DistrictState.Items.Insert(0, "select");
                    Lbl_DistrictCountry.Visible = false;
                }
                con.Close();
        }

        protected void Btn_DistrictView_Click(object sender, EventArgs e)
        {
            getcon();
            if (DropDown_DistrictCountry.SelectedIndex > 0)
            {
                if (DropDown_DistrictState.SelectedIndex > 0)
                {
                    Lbl_DistrictState.Visible = false;
                    string str1 = "select district_name,district_id from tbl_district where state_id='" + DropDown_DistrictState.SelectedItem.Value + "'";
                    SqlCommand cmd1 = new SqlCommand(str1, con);
                    SqlDataAdapter ad1 = new SqlDataAdapter(cmd1);
                    DataTable dt1 = new DataTable();
                    ad1.Fill(dt1);
                    if (dt1.Rows.Count > 0)
                    {
                        Grd_District.DataSource = dt1;
                        Grd_District.DataBind();
                    }
                }
                else
                {
                    Lbl_DistrictState.Visible = true;
                }
            }
            con.Close();
        }

        protected void Grd_District_RowEditing(object sender, GridViewEditEventArgs e)
        {
            Grd_District.EditIndex = e.NewEditIndex;
            getcon();
            string str = "select district_name,district_id from tbl_district where state_id='" + DropDown_DistrictState.SelectedItem.Value + "'";
            SqlCommand cmd = new SqlCommand(str, con);
            SqlDataAdapter ad1 = new SqlDataAdapter(cmd);
            DataTable dt = new DataTable();
            ad1.Fill(dt);
            if (dt.Rows.Count > 0)
            {
                Grd_District.DataSource = dt;
                Grd_District.DataBind();
            }
            con.Close();
        }

        protected void Grd_District_RowUpdating(object sender, GridViewUpdateEventArgs e)
        {
            getcon();
            string dk = Grd_District.DataKeys[e.RowIndex].Values[0].ToString();
            string dname = ((TextBox)Grd_District.Rows[e.RowIndex].Cells[0].Controls[0]).Text;
            string str = "update tbl_district set district_name='" + dname + "'where district_id='" + dk + "'";
            SqlCommand cmd = new SqlCommand(str, con);
            cmd.ExecuteNonQuery();
            Grd_District.EditIndex = -1;
            string str1 = "select district_name,district_id from tbl_district where state_id='" + DropDown_DistrictState.SelectedItem.Value + "'";
            SqlCommand cmd1 = new SqlCommand(str1, con);
            SqlDataAdapter ad1 = new SqlDataAdapter(cmd1);
            DataTable dt1 = new DataTable();
            ad1.Fill(dt1);
            if (dt1.Rows.Count > 0)
            {
                Grd_District.DataSource = dt1;
                Grd_District.DataBind();
            }
            con.Close();
        }

        protected void Grd_District_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
        {
            getcon();
            Grd_District.EditIndex = -1;
            string str2 = "select district_name,district_id from tbl_district where state_id='" + DropDown_DistrictState.SelectedItem.Value + "'";
            SqlCommand cmd2 = new SqlCommand(str2, con);
            SqlDataAdapter ad2 = new SqlDataAdapter(cmd2);
            DataTable dt2 = new DataTable();
            ad2.Fill(dt2);
            if (dt2.Rows.Count > 0)
            {
                Grd_District.DataSource = dt2;
                Grd_District.DataBind();
            }
            con.Close();
        }

        
        protected void Grd_District_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            getcon();
            string dk = Grd_District.DataKeys[e.RowIndex].Values[0].ToString();
            string str = "delete from tbl_district where district_id='" + dk + "'";
            SqlCommand cmd = new SqlCommand(str, con);
            cmd.ExecuteNonQuery();
            string str1 = "select district_name,district_id from tbl_district where state_id='" + DropDown_DistrictState.SelectedItem.Value + "'";
            SqlCommand cmd1 = new SqlCommand(str1, con);
            SqlDataAdapter ad = new SqlDataAdapter(cmd1);
            DataTable dt1 = new DataTable();
            ad.Fill(dt1);
            if (dt1.Rows.Count > 0)
            {
                Grd_District.DataSource = dt1;
                Grd_District.DataBind();
            }
            con.Close();
        }

        protected void DropDown_DistrictState_SelectedIndexChanged(object sender, EventArgs e)
        {
            Lbl_DistrictState.Visible = false;
        }
        }
    }