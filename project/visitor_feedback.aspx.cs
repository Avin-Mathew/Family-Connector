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
    public partial class feedback : System.Web.UI.Page
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

        protected void Btn_Send_Click(object sender, EventArgs e)
        {
            getcon();
            string date = System.DateTime.Now.ToShortDateString();
            //DateTime dt = new DateTime();
            //dt = Convert.ToDateTime(date);
            string str = "insert into tbl_suggestion values('" + Txt_Name.Text + "','" + Txt_Email.Text + "','" + Txt_Feedback.Text + "','"+date+"')";
            SqlCommand cmd = new SqlCommand(str, con);
            cmd.ExecuteNonQuery();
            Lbl_Thanks.Visible = true;
            Txt_Name.Text = "";
            Txt_Email.Text = "";
            Txt_Feedback.Text = "";
            con.Close();
        }

        protected void Txt_Name_TextChanged(object sender, EventArgs e)
        {
          
        }

        protected void Txt_Email_TextChanged(object sender, EventArgs e)
        {
            
        }

        protected void Txt_Feedback_TextChanged(object sender, EventArgs e)
        {
        
        }
        protected void Btn_Cancel_Click(object sender, EventArgs e)
        {
            Txt_Name.Text = "";
            Txt_Email.Text = "";
            Txt_Feedback.Text = "";
        }
}
}