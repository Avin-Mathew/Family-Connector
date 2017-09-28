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
    public partial class view_sugession : System.Web.UI.Page
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
                getcon();
                string str = "select suggestion_name,suggestion_email,suggestion_message,suggestion_time from tbl_suggestion order by suggestion_time desc";
                SqlCommand cmd = new SqlCommand(str, con);
                SqlDataAdapter ad = new SqlDataAdapter(cmd);
                DataTable dt = new DataTable();

                ad.Fill(dt);
                if (dt.Rows.Count > 0)
                {
                    DataList1.DataSource = dt;
                    DataList1.DataBind();
                }
                con.Close();
            }
        }
        protected void DataList1_SelectedIndexChanged(object sender, EventArgs e)
        {

        }
}
}