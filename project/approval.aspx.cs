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

    public partial class approval : System.Web.UI.Page
    {
        public SqlConnection con = new SqlConnection();
        public void getcon()
        {
            con.ConnectionString = ConfigurationManager.ConnectionStrings["db_ccs2ConnectionString"].ToString();
            con.Open();
        }
        protected void Page_PreInit(object sender, EventArgs e)
        {
            if (Session["user"].ToString() == "2")
            {
                this.MasterPageFile = "User.Master";
                LinkButton lb = (LinkButton)Master.FindControl("Approval");
                lb.Visible = true;
            }
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
                
                con.Close();
            }
        }
        
        protected void LinkButton1_Click(object sender, EventArgs e)
        {
            getcon();
            string email, password;
            LinkButton lb = (LinkButton)sender;
            GridViewRow gr = lb.NamingContainer as GridViewRow;
            int dk = (Convert.ToInt32(GridView1.DataKeys[gr.RowIndex].Values[0].ToString()));
            string strr="select tbl_registration.registration_email from tbl_registration where registration_id='"+dk+"'";
            SqlCommand cmd=new SqlCommand(strr,con);
            SqlDataAdapter ad=new SqlDataAdapter(cmd);
            DataTable dt=new DataTable();
            ad.Fill(dt);
            if(dt.Rows.Count>0)
            {
                 email=dt.Rows[0][0].ToString();
                 password_gen pg = new password_gen();
                 password = pg.CreateRandomPassword(6);
                 string str = "insert into tbl_login values('" + email + "','" + password + "','3','" + dk + "')";
                 SqlCommand cmd1 = new SqlCommand(str, con);
                 cmd1.ExecuteNonQuery();
            }
            string str3 = "update tbl_registration set registration_status='Approved' where registration_id='" + dk + "'";
            SqlCommand cmdd = new SqlCommand(str3, con);
            cmdd.ExecuteNonQuery();
            string str1 = "select tbl_registration.registration_id,tbl_registration.registration_fname,tbl_registration.registration_lname,tbl_group.group_name,tbl_relationship.relationship_type from tbl_registration inner join tbl_group on tbl_group.group_id = tbl_registration.group_id inner join tbl_relationship on tbl_relationship.relationship_id = tbl_registration.relationship_id where tbl_registration.registration_status='onRequest'and tbl_group.group_id='" + DropDown_Group.SelectedItem.Value + "'";
            SqlCommand cmdd1 = new SqlCommand(str1, con);
            SqlDataAdapter ad1 = new SqlDataAdapter(cmdd1);
            DataTable dtt = new DataTable();
            ad1.Fill(dtt);
            if (dtt.Rows.Count > 0)
            {
                GridView1.DataSource = dtt;
                GridView1.DataBind();
            }

            con.Close();
        }
        protected void DropDown_Group_SelectedIndexChanged(object sender, EventArgs e)
        {
            getcon();
            string str = "select tbl_registration.registration_id,tbl_registration.registration_fname,tbl_registration.registration_lname,tbl_group.group_name,tbl_relationship.relationship_type from tbl_registration inner join tbl_group on tbl_group.group_id = tbl_registration.group_id inner join tbl_relationship on tbl_relationship.relationship_id = tbl_registration.relationship_id where tbl_registration.registration_status='onRequest'and tbl_group.group_id='"+DropDown_Group.SelectedItem.Value+ "'";
            SqlCommand cmd = new SqlCommand(str, con);
            SqlDataAdapter ad = new SqlDataAdapter(cmd);
            DataTable dt = new DataTable();
            ad.Fill(dt);
            if (dt.Rows.Count > 0)
            {
                GridView1.DataSource = dt;
                GridView1.DataBind();
            }
            con.Close();
        }
        protected void GridView1_SelectedIndexChanged(object sender, EventArgs e)
        {

        }
}
}