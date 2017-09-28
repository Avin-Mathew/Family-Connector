using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Configuration;
using System.Data;

public partial class family_tree : System.Web.UI.Page
{
    string nam;
    
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
            getcon();
            TreeNode tr = new TreeNode();
            string str = "select tbl_registration.registration_fname+' '+tbl_registration.registration_lname as name,registration_gender from tbl_registration where tbl_registration.parent_id='0'";
            SqlCommand cmd = new SqlCommand(str, con);
            SqlDataAdapter ad = new SqlDataAdapter(cmd);
            DataTable dt = new DataTable();
            ad.Fill(dt);
            if (dt.Rows.Count > 0)
            {
                if (dt.Rows[0][1].ToString().Replace(" ","") == "Male")
                {
                    tr.Text = dt.Rows[0][0].ToString();
                    tr.ImageUrl = "pic/boy.jpg";
                    TreeView1.Nodes.Add(tr);
                    //TreeView1.ExpandAll();
                }
                else if (dt.Rows[0][1].ToString() == "Female")
                {
                    tr.Text = dt.Rows[0][0].ToString();
                    tr.ImageUrl = "pic/girl.jpg";
                    TreeView1.Nodes.Add(tr);
                    //TreeView1.ExpandAll();
                }
            }
            
            
            con.Close();

        }
    }
    

    protected void TreeView1_SelectedNodeChanged(object sender, EventArgs e)
    {
         getcon();
        nam=TreeView1.SelectedNode.Text.Replace(" ","");
        
        string strr = "select rtrim(registration_fname)+rtrim(registration_lname) as Name,registration_id from tbl_registration where rtrim(registration_fname)+rtrim(registration_lname)='"+nam+"'";
        SqlCommand cmdd = new SqlCommand(strr, con);
        SqlDataAdapter ad = new SqlDataAdapter(cmdd);
        DataTable dtt = new DataTable();
        ad.Fill(dtt);
        if (dtt.Rows.Count > 0)
        {

            string str = "select tbl_registration.registration_fname+' '+tbl_registration.registration_lname as name,registration_gender from tbl_registration where parent_id='" + dtt.Rows[0][1] + "'";
            SqlCommand cmd = new SqlCommand(str, con);
            SqlDataAdapter ad1 = new SqlDataAdapter(cmd);
            DataTable dt = new DataTable();
            ad1.Fill(dt);
            if (dt.Rows.Count > 0)
            {

                for (int i = 0; i < dt.Rows.Count; i++)
                {
                    if (dt.Rows[i][1].ToString().Replace(" ", "") == "Male")
                    {
                        TreeNode tr1 = new TreeNode();
                        tr1.Text = dt.Rows[i][0].ToString();
                        tr1.ImageUrl = "pic/boy.jpg";
                        TreeView1.SelectedNode.ChildNodes.Add(tr1);
                    }
                    else if (dt.Rows[i][1].ToString().Replace(" ", "") == "Female")
                    {
                        TreeNode tr1 = new TreeNode();
                        tr1.Text = dt.Rows[i][0].ToString();
                        tr1.ImageUrl = "pic/girl.jpg";
                        TreeView1.SelectedNode.ChildNodes.Add(tr1);
                    }

                }
            }
        }
        con.Close();
        
    }
}