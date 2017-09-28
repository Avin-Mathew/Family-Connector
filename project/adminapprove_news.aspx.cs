using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;

public partial class adminapprove_news : System.Web.UI.Page
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
            gridbinding();
            
        }
    }
    protected void gridbinding()
    {
        getcon();
        SqlCommand cmd = new SqlCommand("select tbl_newsnevents.newsnevents_id,tbl_newsnevents.newsnevents_title,tbl_newsnevents.newsnevents_description,tbl_newsnevents.newsnevents_datentime,tbl_registration.registration_fname+' '+tbl_registration.registration_lname as name from tbl_newsnevents inner join tbl_registration on tbl_registration.registration_id=tbl_newsnevents.registration_id where tbl_newsnevents.newsnevents_status='notapprove' order By tbl_newsnevents.newsnevents_datentime desc", con);
        DataTable ds = new DataTable();
        SqlDataAdapter da = new SqlDataAdapter(cmd);
        da.Fill(ds);
        if (ds.Rows.Count > 0)
        {
            GridView1.DataSource = ds;
            GridView1.DataBind();
        }
        else if (ds.Rows.Count == 0)
        {
            GridView1.Visible = false;
        }
        con.Close();
       
    }
    protected void LinkButton1_Click(object sender, EventArgs e)
    {
        getcon();
        LinkButton lb = (LinkButton)sender;
        GridViewRow gr = lb.NamingContainer as GridViewRow;
        int dk = (Convert.ToInt32(GridView1.DataKeys[gr.RowIndex].Values[0].ToString()));
        string str = "update tbl_newsnevents set newsnevents_status='approved' where newsnevents_id='" + dk + "'";
        SqlCommand cmd = new SqlCommand(str, con);
        cmd.ExecuteNonQuery();
        con.Close();
        gridbinding();
        
        

    }
    protected void GridView1_SelectedIndexChanged(object sender, EventArgs e)
    {

    }
}