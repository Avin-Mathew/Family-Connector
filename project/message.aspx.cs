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
    public partial class message : System.Web.UI.Page
    {
        public SqlConnection con = new SqlConnection();
        public void getcon()
        {
            con.ConnectionString = ConfigurationManager.ConnectionStrings["db_ccs2ConnectionString"].ToString();
            con.Open();
        }
        public void binddatalist()
        { 
            getcon();
            string str = "select tbl_registration.registration_fname+' '+tbl_registration.registration_lname as name,tbl_message.message_message,tbl_message.message_datentime from tbl_message inner join tbl_registration on tbl_registration.registration_id=tbl_message.message_fromid where tbl_message.message_toid='4' and tbl_message.status='notviewed'";
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
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                

                Panel1.Visible = false;
                binddatalist();
               
                //getcon();
                //string str = "select tbl_registration.status from tbl_message where tbl_message='notviewed'";
                //SqlCommand cmd = new SqlCommand(str, con);
                //SqlDataAdapter ad = new SqlDataAdapter(cmd);
                //DataTable dt = new DataTable();
                //ad.Fill(dt);

                //if (dt.Rows.Count > 0)
                //{
                //    ImageButton1.Enabled = true;

                //}
                //con.Close();
            }
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            getcon();
            string str = System.DateTime.Now.ToString();

            string str1 = "select registration_id from tbl_registration where registration_email='" + Txt_To.Text + "'";
            SqlCommand cmd1 = new SqlCommand(str1, con);
            SqlDataAdapter ad1 = new SqlDataAdapter(cmd1);
            DataTable dt1 = new DataTable();
            ad1.Fill(dt1);
            if (dt1.Rows.Count > 0)
            {
                Session["toid"] = dt1.Rows[0][0].ToString();
            }
            string str2 = "insert into tbl_message values ('" + Convert.ToInt32(Session["regid"]) + "','" + Convert.ToInt32(Session["toid"]) + "','" + Txt_Msg.Text +"','"+str+"','notviewed')";
            SqlCommand cmd2 = new SqlCommand(str2, con);
            cmd2.ExecuteNonQuery();
            ScriptManager.RegisterStartupScript(Page, this.GetType(), "write", "alert('Message Sent Sucessfully')", true);
            Txt_To.Text = "";
            Txt_Msg.Text = "";
            con.Close();
            binddatalist();
            
        }

        
        protected void LinkButton1_Click(object sender, EventArgs e)
        {
            Panel1.Visible = true;
            
        }
    }
}
