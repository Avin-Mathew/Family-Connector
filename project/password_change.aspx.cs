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
    public partial class password_change : System.Web.UI.Page
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

        

        
        protected void Btn_Ok_Click(object sender, EventArgs e)
        {
            getcon();
            string str = "update tbl_login set login_password='" + Txt_Newpass.Text + "' where login_password='" + Txt_Oldpass.Text + "' and registration_id='" + Convert.ToInt32(Session["regid"]) + "'";
            SqlCommand cmd = new SqlCommand(str, con);
            cmd.ExecuteNonQuery();
            con.Close();
        }
        
}
}