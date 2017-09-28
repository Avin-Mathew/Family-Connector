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
    public partial class newsnevents : System.Web.UI.Page
    {
        public SqlConnection con = new SqlConnection();
        public void getcon()
        {
            con.ConnectionString = ConfigurationManager.ConnectionStrings["db_ccs2ConnectionString"].ToString();
            con.Open();
        }
        protected void Page_PreInit(object sender, EventArgs e)
        {
            if (Session["regid"] == null)
            {
                this.MasterPageFile = "Login.Master";
                


            }
        }
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                if (Session["regid"] == null)
                {
                    ImageButton2.Visible = false;
                    Panel2.Visible = false;



                }
               
                BindRepeaterData();
            }
        }

       

        protected void Add_Click1(object sender, EventArgs e)
        {
            getcon();
            
            string str = System.DateTime.Now.ToShortDateString();
            string strr="insert into tbl_newsnevents values( '" + Txt_Title.Text + "','" + Txt_Description.Text + "','" + str + "','" + Convert.ToInt32(Session["regid"]) + "','notapprove')";
            SqlCommand cmd = new SqlCommand(strr, con);
            cmd.ExecuteNonQuery();
            con.Close();
            Txt_Title.Text = "";
            Txt_Description.Text = "";
            con.Close();
            BindRepeaterData();
            
            
        }
        protected void BindRepeaterData()
        {
            getcon();
            SqlCommand cmd = new SqlCommand("select tbl_newsnevents.newsnevents_title,tbl_newsnevents.newsnevents_description,tbl_newsnevents.newsnevents_datentime,tbl_registration.registration_fname+' '+tbl_registration.registration_lname as name from tbl_newsnevents inner join tbl_registration on tbl_registration.registration_id=tbl_newsnevents.registration_id where tbl_newsnevents.newsnevents_status='approved' order By tbl_newsnevents.newsnevents_datentime desc", con);
            DataTable ds = new DataTable();
            SqlDataAdapter da = new SqlDataAdapter(cmd);
            da.Fill(ds);
            if (ds.Rows.Count > 0)
            {
                RepDetails.DataSource = ds;
                RepDetails.DataBind();
            }
            con.Close();
        }
        protected void ImageButton2_Click(object sender, ImageClickEventArgs e)
        {
                        
        }
}
}