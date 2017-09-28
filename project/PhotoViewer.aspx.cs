using System;
using System.Collections;
using System.Configuration;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Xml.Linq;
using System.Data.SqlClient;

public partial class PhotoViewer : System.Web.UI.Page
{
    protected void Page_PreInit(object sender, EventArgs e)
    {
        if (Session["regid"] == null)
        {
            this.MasterPageFile = "Login.Master";


        }
    }
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!Page.IsPostBack)
        {
            string photoID = Request.QueryString["PhotoID"];
            string albumID = Request.QueryString["AlbumID"];
            ViewState["hfAlbumID"] = albumID;
            //Get Page number by passing photo id
            int index = GetPageNumber(int.Parse(photoID), int.Parse(albumID));
            DataPager1.SetPageProperties(index, 1, true);
        }
    }
    public int GetPageNumber(int PhotoID, int AlbumID)
    {
        SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["db_ccs2ConnectionString"].ConnectionString);
        con.Open();
        SqlCommand com = new SqlCommand("SELECT PageNumber FROM (SELECT row_number() Over (order by photoid asc) AS PageNumber,photoid,Albumid FROM PhotAlbum where Albumid=" + AlbumID.ToString() + ") As Photos where photoid=" + PhotoID.ToString() + " and Albumid=" + AlbumID.ToString(), con);
        SqlDataReader dr = com.ExecuteReader();
        int pageno = 1;
        if (dr.Read())
        {
            pageno = int.Parse(dr["PageNumber"].ToString());
        }
        dr.Close();
        con.Close();
        return (pageno - 1);
    }
    public DataTable GetPhoto(string query)
    {
        SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["db_ccs2ConnectionString"].ConnectionString);
        SqlDataAdapter ada = new SqlDataAdapter(query, con);
        DataTable dtEmp = new DataTable();
        ada.Fill(dtEmp);
        return dtEmp;
    }
    protected void DataPager1_PreRender(object sender, EventArgs e)
    {
        lvPhotoViewer.DataSource = GetPhoto("Select * from PhotAlbum where AlbumID = " + ViewState["hfAlbumID"].ToString());
        lvPhotoViewer.DataBind();
    }
    protected void db_ccs2ConnectionString(object sender, EventArgs e)
    {

    }
}