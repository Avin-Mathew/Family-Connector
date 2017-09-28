using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;
using System.IO;
using System.Web.Security;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Xml.Linq;
using System.Data.Sql;

public partial class adminapprove_photos : System.Web.UI.Page
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
        SqlCommand cmd = new SqlCommand("select Album.AlbumID,Album.AlbumName,tbl_registration.registration_fname+' '+tbl_registration.registration_lname as name from Album inner join tbl_registration on tbl_registration.registration_id=Album.registration_id where Album.status='pending' ", con);
        DataTable ds = new DataTable();
        SqlDataAdapter da = new SqlDataAdapter(cmd);
        da.Fill(ds);
        if (ds.Rows.Count > 0)
        {
            Grd_ApprovePhoto.DataSource = ds;
            Grd_ApprovePhoto.DataBind();
        }
        else if (ds.Rows.Count == 0)
        {
            Grd_ApprovePhoto.Visible = false;
        }
        con.Close();

    }

    protected void GridView1_SelectedIndexChanged(object sender, EventArgs e)
    {
       
    }
    protected void LinkButton1_Click(object sender, EventArgs e)
    {
        getcon();
        LinkButton lb = (LinkButton)sender;
        GridViewRow gr = lb.NamingContainer as GridViewRow;
        int dk = (Convert.ToInt32(Grd_ApprovePhoto.DataKeys[gr.RowIndex].Values[0].ToString()));
        string str = "update Album set status='approved' where AlbumID='" + dk + "'";
        SqlCommand cmd = new SqlCommand(str, con);
        cmd.ExecuteNonQuery();
        con.Close();
        gridbinding();
        
    }
    protected void Grd_ApprovePhoto_RowDeleting(object sender, System.Web.UI.WebControls.GridViewDeleteEventArgs e)
    {
        getcon();
        string dk = Grd_ApprovePhoto.DataKeys[e.RowIndex].Values[0].ToString();
        string str = "delete from Album where AlbumID='" + dk + "'";
        SqlCommand cmd = new SqlCommand(str, con);
        cmd.ExecuteNonQuery();

        SqlCommand cmd1 = new SqlCommand("select Album.AlbumID,Album.AlbumName,tbl_registration.registration_fname+' '+tbl_registration.registration_lname as name from Album inner join tbl_registration on tbl_registration.registration_id=Album.registration_id where Album.status='pending' ", con);
        DataTable ds1 = new DataTable();
        SqlDataAdapter da1 = new SqlDataAdapter(cmd1);
        da1.Fill(ds1);
        if (ds1.Rows.Count > 0)
        {
            Grd_ApprovePhoto.DataSource = ds1;
            Grd_ApprovePhoto.DataBind();
        }
        con.Close();
    }
}