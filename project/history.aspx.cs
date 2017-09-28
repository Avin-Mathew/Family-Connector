using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Family_Connector
{

    public partial class history : System.Web.UI.Page
    {
        protected void Page_PreInit(object sender, EventArgs e)
        {
            if (Session["user"] == null)
            {
                this.MasterPageFile = "Login.Master";
            }
            else
            {
                if (Session["user"].ToString() == "1")
                {
                    this.MasterPageFile = "Admin.Master";


                }
                else if (Session["user"].ToString() == "3")
                {
                    this.MasterPageFile = "User.Master";


                }
                else if (Session["user"].ToString() == "2")
                {
                    this.MasterPageFile = "User.Master";


                }
                
            }

        }
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void Button1_Click(object sender, EventArgs e)
        {

        }
        protected void Btn_View_Click(object sender, EventArgs e)
        {

        }
}
}