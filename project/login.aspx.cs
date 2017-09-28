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
    public partial class login : System.Web.UI.Page
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
                Lbl_Invalid.Visible = false;
                
            }

        }
        protected void Btn_Login_Click(object sender, EventArgs e)
        {
            getcon();
            Lbl_Invalid.Visible = false;
            string str = "select * from tbl_login where login_username='" + Txt_Username.Text + "' and login_password='" + Txt_Password.Text + "'";
            SqlCommand cmd = new SqlCommand(str, con);
            SqlDataAdapter ad = new SqlDataAdapter(cmd);
            DataTable dt = new DataTable();
            ad.Fill(dt);
            if (dt.Rows.Count > 0)
            {
                if (dt.Rows[0][3].ToString() == "1")
                {
                    Session["regid"] = dt.Rows[0][4];
                    Session["user"] = dt.Rows[0][3];

                    Response.Redirect("approval.aspx");


                }
                else if (dt.Rows[0][3].ToString() == "2")
                {
                    Session["regid"] = dt.Rows[0][4];
                    Session["user"] = dt.Rows[0][3];
                    Response.Redirect("Home.aspx");



                }
                else if (dt.Rows[0][3].ToString() == "3")
                {
                    Session["regid"] = dt.Rows[0][4];
                    Session["user"] = dt.Rows[0][3];

                    Response.Redirect("Home.aspx");
                }
            }
            else
            {
                Lbl_Invalid.Visible = true;
            }
            con.Close();
        }

        protected void LinkButton1_Click(object sender, EventArgs e)
        {
            Response.Redirect("registration.aspx");
        }
        protected void Txt_Username_TextChanged(object sender, EventArgs e)
        {
            Lbl_Invalid.Visible = false;
        }
        protected void Txt_Password_TextChanged(object sender, EventArgs e)
        {
            Lbl_Invalid.Visible = false;
        }
}
}