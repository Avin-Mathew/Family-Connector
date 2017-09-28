using System;
using System.Collections;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Web.UI.HtmlControls;
using System.Data.SqlClient;
using System.Configuration;
using System.Data;

namespace Family_Connector
{
    public partial class Registration : System.Web.UI.Page
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
                string str = "select group_name,group_id from tbl_group";
                SqlCommand cmd = new SqlCommand(str, con);
                SqlDataAdapter ad = new SqlDataAdapter(cmd);
                DataTable dt = new DataTable();
                ad.Fill(dt);
                {
                    DropDown_Group.DataSource = dt;
                    DropDown_Group.DataTextField = "group_name";
                    DropDown_Group.DataValueField = "group_id";
                    DropDown_Group.DataBind();
                    DropDown_Group.Items.Insert(0, "select");
                }

                DataTable dtt = new DataTable();
                DataColumn dc = new DataColumn("regid");
                DataColumn dc1 = new DataColumn("name");
                dtt.Columns.Add(dc);
                dtt.Columns.Add(dc1);
                Session["tbl"] = dtt;

                string str1 = "select bloodgrp_name,bloodgrp_id from tbl_bloodgrp";
                SqlCommand cmd1 = new SqlCommand(str1, con);
                SqlDataAdapter ad1 = new SqlDataAdapter(cmd1);
                DataTable dt1 = new DataTable();
                ad1.Fill(dt1);
                {
                    DropDown_BldGrp.DataSource = dt1;
                    DropDown_BldGrp.DataTextField = "bloodgrp_name";
                    DropDown_BldGrp.DataValueField = "bloodgrp_id";
                    DropDown_BldGrp.DataBind();
                    DropDown_BldGrp.Items.Insert(0, "select");
                }

                string str2 = "select country_name,country_id from tbl_country";
                SqlCommand cmd2 = new SqlCommand(str2, con);
                SqlDataAdapter ad2 = new SqlDataAdapter(cmd2);
                DataTable dt2 = new DataTable();
                ad2.Fill(dt2);
                {
                    DropDown_Country.DataSource = dt2;
                    DropDown_Country.DataTextField = "country_name";
                    DropDown_Country.DataValueField = "country_id";
                    DropDown_Country.DataBind();
                    DropDown_Country.Items.Insert(0, "select");
                }

                string str3 = "select relationship_type,relationship_id from tbl_relationship";
                SqlCommand cmd3 = new SqlCommand(str3, con);
                SqlDataAdapter ad3 = new SqlDataAdapter(cmd3);
                DataTable dt3 = new DataTable();
                ad3.Fill(dt3);
                if (dt3.Rows.Count > 0)
                {
                    DropDown_Relationship.DataSource = dt3;
                    DropDown_Relationship.DataTextField = "relationship_type";
                    DropDown_Relationship.DataValueField = "relationship_id";
                    DropDown_Relationship.DataBind();
                    DropDown_Relationship.Items.Insert(0, "select");
                }
              
             
                con.Close();
            }

        }
       
 

      

        protected void Btn_Add_Click(object sender, EventArgs e)
        {
            
        }

        protected void TextBox4_TextChanged(object sender, EventArgs e)
        {

        }

       

        protected void Btn_Submit_Click(object sender, EventArgs e)
        {
            getcon();
            if (Txt_Mobile.Text == "")
            {
                Txt_Mobile.Text = "0";
            }
            if (RBL_Gender.SelectedItem.Text == "Male" && RBL_Marital.SelectedItem.Text == "Married")
            {
                string password;
                password_gen pg = new password_gen();
                password = pg.CreateRandomPassword(6);
                string str = "insert into tbl_registration values('" + Convert.ToInt32(DropDown_Group.SelectedItem.Value) + "','" + Convert.ToInt32(DropDown_Family_Head.SelectedItem.Value) + "','" + Convert.ToInt32(DropDown_Relationship.SelectedItem.Value) + "','" + Txt_Fname.Text.Trim() + "','" + Txt_Lname.Text.Trim() + "','" + Txt_Nick.Text.Trim() + "','" + RBL_Gender.SelectedItem.Text + "','" + RBL_Marital.SelectedItem.Text + "','" + Txt_DOB.Text.Trim() + "','" + Txt_Profession.Text.Trim() + "','" + Convert.ToInt32(DropDown_BldGrp.SelectedItem.Value) + "','" + Txt_Address.Text.Trim() + "','" + Convert.ToInt32(DropDown_District.SelectedItem.Value) + "','" + Convert.ToInt32(Txt_Pin.Text.Trim()) + "','" +Txt_Home.Text.Trim() + "','" +Txt_Mobile.Text.Trim() + "','" + Txt_Email.Text.Trim() + "','" + Txt_WriteUp.Text.Trim() + "','Approved');select @@identity";
                SqlCommand cmd = new SqlCommand(str, con);
                object obj = new object();
                obj = cmd.ExecuteScalar();
                string str1 = "insert into tbl_login values('" + Txt_Email.Text.Trim() + "','" + password + "','2','" + Convert.ToInt32(obj) + "')";
                SqlCommand cmd1 = new SqlCommand(str1, con);
                cmd1.ExecuteNonQuery();

            }
            else
            {
                string str = "insert into tbl_registration values('" + Convert.ToInt32(DropDown_Group.SelectedItem.Value) + "','" + Convert.ToInt32(DropDown_Family_Head.SelectedItem.Value) + "','" + Convert.ToInt32(DropDown_Relationship.SelectedItem.Value) + "','" + Txt_Fname.Text.Trim() + "','" + Txt_Lname.Text.Trim() + "','" + Txt_Nick.Text.Trim() + "','" + RBL_Gender.SelectedItem.Text + "','" + RBL_Marital.SelectedItem.Text + "','" + Txt_DOB.Text.Trim() + "','" + Txt_Profession.Text.Trim() + "','" + Convert.ToInt32(DropDown_BldGrp.SelectedItem.Value) + "','" + Txt_Address.Text.Trim() + "','" + Convert.ToInt32(DropDown_District.SelectedItem.Value) + "','" + Convert.ToInt32(Txt_Pin.Text.Trim()) + "','" +Txt_Home.Text.Trim() + "','" +Txt_Mobile.Text.Trim() + "','" + Txt_Email.Text.Trim() + "','" + Txt_WriteUp.Text.Trim() + "','OnRequest')";
                SqlCommand cmd = new SqlCommand(str, con);
                cmd.ExecuteNonQuery();
            }

            con.Close();
        }

     

      

        protected void Txt_Fname_TextChanged(object sender, EventArgs e)
        {
            Lbl_Fname.Visible = false;
        }

        protected void DropDown_Family_Head_SelectedIndexChanged(object sender, EventArgs e)
        {

        }

        protected void DropDown_Group_SelectedIndexChanged(object sender, EventArgs e)
        {
            getcon();
            string str = "select registration_id,registration_fname,registration_lname,registration_gender from tbl_registration where registration_gender='male' and group_id='" + Convert.ToInt32(DropDown_Group.SelectedItem.Value) + "'";
            SqlCommand cmd = new SqlCommand(str, con);
            SqlDataAdapter ad = new SqlDataAdapter(cmd);
            DataTable dt = new DataTable();
            ad.Fill(dt);
            if (dt.Rows.Count > 0)
            {
                for (int i = 0; i < dt.Rows.Count; i++)
                {
                    DataTable dtt1 = (DataTable)Session["tbl"];
                    DataRow dr = dtt1.NewRow();
                    dr["regid"] = dt.Rows[i][0];
                    dr["name"] = dt.Rows[i][1].ToString() + "" + dt.Rows[i][2];
                    dtt1.Rows.Add(dr);
                    Session["tbl"] = dtt1;
                }
                DataTable dtt2 = (DataTable)Session["tbl"];
                DropDown_Family_Head.DataSource = dtt2;
                DropDown_Family_Head.DataTextField = "name";
                DropDown_Family_Head.DataValueField = "regid";
                DropDown_Family_Head.DataBind();
                DropDown_Family_Head.Items.Insert(0, "select");
            }
            con.Close();
        }



        protected void DropDown_State_SelectedIndexChanged(object sender, EventArgs e)
        {
            getcon();
            string str = "select district_name,district_id from tbl_district where state_id=('" + DropDown_State.SelectedItem.Value + "')";
            SqlCommand cmd = new SqlCommand(str, con);
            SqlDataAdapter ad = new SqlDataAdapter(cmd);
            DataTable dt = new DataTable();
            ad.Fill(dt);
            if (dt.Rows.Count > 0)
            {
                DropDown_District.DataSource = dt;
                DropDown_District.DataTextField = "district_name";
                DropDown_District.DataValueField = "district_id";
                DropDown_District.DataBind();
                DropDown_District.Items.Insert(0, "select");
            }
           
            con.Close();
        }
        protected void DropDown_Country_SelectedIndexChanged(object sender, EventArgs e)
        {
            getcon();
            string str = "select state_name,state_id from tbl_state where country_id=('" + DropDown_Country.SelectedItem.Value + "')";
            SqlCommand cmd = new SqlCommand(str, con);
            SqlDataAdapter ad = new SqlDataAdapter(cmd);
            DataTable dt = new DataTable();
            ad.Fill(dt);
            if (dt.Rows.Count > 0)
            {
                DropDown_State.DataSource = dt;
                DropDown_State.DataTextField = "state_name";
                DropDown_State.DataValueField = "state_id";
                DropDown_State.DataBind();
                DropDown_State.Items.Insert(0, "select");
            }
           
            con.Close();
        }
        protected void DropDown_Relationship_SelectedIndexChanged(object sender, EventArgs e)
        {

        }
        protected void Txt_Pin_TextChanged(object sender, EventArgs e)
        {

        }
        protected void Btn_Cancel_Click(object sender, EventArgs e)
        {

        }
}
}