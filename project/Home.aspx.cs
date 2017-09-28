using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Configuration;
using System.Data;

public partial class Home : System.Web.UI.Page
{
    public SqlConnection con = new SqlConnection();
    public void getcon()
    {
        con.ConnectionString = ConfigurationManager.ConnectionStrings["db_ccs2ConnectionString"].ToString();
        con.Open();
    }

    protected void Page_PreInit(object sender, EventArgs e)
    {
        if (Session["user"].ToString() == "2")
        {
            this.MasterPageFile = "User.Master";
            LinkButton lb = (LinkButton)Master.FindControl("Approval");
            lb.Visible = true;

        }
    }
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            getcon();
            string str = "select tbl_registration.registration_fname+''+tbl_registration.registration_lname as name,tbl_registration.registration_id,tbl_registration.registration_address,tbl_district.district_name,tbl_state.state_name,tbl_country.country_name,tbl_registration.registration_pincode,tbl_registration.registration_landline,tbl_registration.registration_mobile,tbl_registration.registration_email from tbl_registration inner join tbl_district on tbl_district.district_id=tbl_registration.district_id inner join tbl_state on tbl_state.state_id=tbl_district.state_id inner join tbl_country on tbl_country.country_id=tbl_state.country_id where tbl_registration.registration_id='" + Convert.ToInt32(Session["regid"]) + "'";
            SqlCommand cmd = new SqlCommand(str, con);
            SqlDataAdapter ad = new SqlDataAdapter(cmd);
            DataTable dt = new DataTable();
            ad.Fill(dt);
            if (dt.Rows.Count > 0)
            {
                Label2.Text = dt.Rows[0][0].ToString();
                FormView1.DataSource = dt;
                FormView1.DataBind();
            }
            con.Close();
        }
    }
    protected void FormView1_ModeChanging(object sender, FormViewModeEventArgs e)
    {
        getcon();
        if (e.NewMode == FormViewMode.Edit)
        {
            FormView1.ChangeMode(FormViewMode.Edit);

            string str = "select tbl_registration.registration_fname+''+tbl_registration.registration_lname as name,tbl_registration.registration_id,tbl_registration.registration_address,tbl_district.district_name,tbl_state.state_name,tbl_country.country_name,tbl_registration.district_id,tbl_state.state_id,tbl_country.country_id,tbl_registration.registration_pincode,tbl_registration.registration_landline,tbl_registration.registration_mobile,tbl_registration.registration_email from tbl_registration inner join tbl_district on tbl_district.district_id=tbl_registration.district_id inner join tbl_state on tbl_state.state_id=tbl_district.state_id inner join tbl_country on tbl_country.country_id=tbl_state.country_id where tbl_registration.registration_id='" + Convert.ToInt32(Session["regid"]) + "'";
            SqlCommand cmd = new SqlCommand(str, con);
            SqlDataAdapter ad = new SqlDataAdapter(cmd);
            DataTable dt = new DataTable();
            ad.Fill(dt);
            if (dt.Rows.Count > 0)
            {

                FormView1.DataSource = dt;
                FormView1.DataBind();

            }
            DropDownList dl1 = (DropDownList)FormView1.FindControl("DropDownList1");
            //dl1.Items.FindByText(dt.Rows[0][3].ToString()).Selected = true;
            string str2 = "select country_name,country_id from tbl_country";
            SqlCommand cmd2 = new SqlCommand(str2, con);
            SqlDataAdapter ad2 = new SqlDataAdapter(cmd2);
            DataTable dt2 = new DataTable();
            ad2.Fill(dt2);
            if (dt2.Rows.Count > 0)
            {
                dl1.DataSource = dt2;
                dl1.DataTextField = "country_name";
                dl1.DataValueField = "country_id";
                dl1.DataBind();
                dl1.Items.Insert(0, "select");
            }
            Label lb = (Label)FormView1.FindControl("Label19");
            dl1.Items.FindByText(lb.Text).Selected = true;

            DropDownList dl2 = (DropDownList)FormView1.FindControl("DropDownList2");
            string str3 = "select state_name,state_id from tbl_state where country_id=('" + dl1.SelectedItem.Value + "')";
            SqlCommand cmd3 = new SqlCommand(str3, con);
            SqlDataAdapter ad3 = new SqlDataAdapter(cmd3);
            DataTable dt3 = new DataTable();
            ad3.Fill(dt3);
            if (dt3.Rows.Count > 0)
            {
                dl2.DataSource = dt3;
                dl2.DataTextField = "state_name";
                dl2.DataValueField = "state_id";
                dl2.DataBind();
                dl2.Items.Insert(0, "select");
            }
            Label lb1 = (Label)FormView1.FindControl("Label20");
            dl2.Items.FindByText(lb1.Text).Selected = true;

            DropDownList dl3 = (DropDownList)FormView1.FindControl("DropDownList3");
            string strr = "select district_name,district_id from tbl_district where state_id=('" + dl2.SelectedItem.Value + "')";
            SqlCommand cmdd = new SqlCommand(strr, con);
            SqlDataAdapter ad1 = new SqlDataAdapter(cmdd);
            DataTable dt1 = new DataTable();
            ad1.Fill(dt1);
            if (dt1.Rows.Count > 0)
            {
                dl3.DataSource = dt1;
                dl3.DataTextField = "district_name";
                dl3.DataValueField = "district_id";
                dl3.DataBind();
                dl3.Items.Insert(0, "select");
            }
            Label lb3 = (Label)FormView1.FindControl("Label21");
            dl3.Items.FindByText(lb3.Text).Selected = true;

            ////dl1.Items.FindByValue((FormView1.Row.FindControl("Label19") as Label).Text).Selected = true;
            //DropDownList dl2 = (DropDownList)FormView1.FindControl("DropDownList2");
            //dl2.Items.FindByValue((FormView1.FindControl("Label20") as Label).Text).Selected = true;
            //DropDownList dl3 = (DropDownList)FormView1.FindControl("DropDownList3");
        }
        else
        {
            FormView1.ChangeMode(FormViewMode.ReadOnly);
            string str = "select tbl_registration.registration_fname+''+tbl_registration.registration_lname as name,tbl_registration.registration_id,tbl_registration.registration_address,tbl_district.district_name,tbl_state.state_name,tbl_country.country_name,tbl_registration.registration_pincode,tbl_registration.registration_landline,tbl_registration.registration_mobile,tbl_registration.registration_email from tbl_registration inner join tbl_district on tbl_district.district_id=tbl_registration.district_id inner join tbl_state on tbl_state.state_id=tbl_district.state_id inner join tbl_country on tbl_country.country_id=tbl_state.country_id where tbl_registration.registration_id='" + Convert.ToInt32(Session["regid"]) + "'";
            SqlCommand cmd = new SqlCommand(str, con);
            SqlDataAdapter ad = new SqlDataAdapter(cmd);
            DataTable dt = new DataTable();
            ad.Fill(dt);
            if (dt.Rows.Count > 0)
            {

                FormView1.DataSource = dt;
                FormView1.DataBind();
            }
        }

        con.Close();
    
    }
    protected void FormView1_ItemUpdating(object sender, FormViewUpdateEventArgs e)
    {
        getcon();
        string dk = FormView1.DataKey.Value.ToString();
        TextBox tb1 = (TextBox)FormView1.FindControl("TextBox1");
        TextBox tb2 = (TextBox)FormView1.FindControl("TextBox3");
        TextBox tb3 = (TextBox)FormView1.FindControl("TextBox4");
        TextBox tb4 = (TextBox)FormView1.FindControl("TextBox5");
        TextBox tb5 = (TextBox)FormView1.FindControl("TextBox6");
        DropDownList dl3 = (DropDownList)FormView1.FindControl("DropDownList3");
        string upd = "update tbl_registration set registration_address='" + tb1.Text + "',district_id='" + Convert.ToInt32(dl3.SelectedItem.Value) + "',registration_pincode='" + tb2.Text + "',registration_landline='" + tb3.Text + "',registration_mobile='" + tb4.Text + "',registration_email='" + tb5.Text + "' where registration_id='"+Convert.ToInt32(dk)+"'";
        SqlCommand cmdd = new SqlCommand(upd, con);
        cmdd.ExecuteNonQuery();
        FormView1.ChangeMode(FormViewMode.ReadOnly);
        string str = "select tbl_registration.registration_fname+''+tbl_registration.registration_lname as name,tbl_registration.registration_id,tbl_registration.registration_address,tbl_district.district_name,tbl_state.state_name,tbl_country.country_name,tbl_registration.registration_pincode,tbl_registration.registration_landline,tbl_registration.registration_mobile,tbl_registration.registration_email from tbl_registration inner join tbl_district on tbl_district.district_id=tbl_registration.district_id inner join tbl_state on tbl_state.state_id=tbl_district.state_id inner join tbl_country on tbl_country.country_id=tbl_state.country_id where tbl_registration.registration_id='" + Convert.ToInt32(Session["regid"]) + "'";
        SqlCommand cmd = new SqlCommand(str, con);
        SqlDataAdapter ad = new SqlDataAdapter(cmd);
        DataTable dt = new DataTable();
        ad.Fill(dt);
        if (dt.Rows.Count > 0)
        {

            FormView1.DataSource = dt;
            FormView1.DataBind();
        }

    }
    protected void DropDownList1_SelectedIndexChanged(object sender, EventArgs e)
    {
        getcon();
        DropDownList dl1 = (DropDownList)FormView1.FindControl("DropDownList1");
        DropDownList dl2 = (DropDownList)FormView1.FindControl("DropDownList2");
        string str = "select state_name,state_id from tbl_state where country_id=('" + dl1.SelectedItem.Value + "')";
        SqlCommand cmd = new SqlCommand(str, con);
        SqlDataAdapter ad = new SqlDataAdapter(cmd);
        DataTable dt = new DataTable();
        ad.Fill(dt);
        if (dt.Rows.Count > 0)
        {
            dl2.DataSource = dt;
            dl2.DataTextField = "state_name";
            dl2.DataValueField = "state_id";
            dl2.DataBind();
            dl2.Items.Insert(0, "select");
        }

        con.Close();
    }
    protected void DropDownList2_SelectedIndexChanged(object sender, EventArgs e)
    {
        DropDownList dl2 = (DropDownList)FormView1.FindControl("DropDownList2");
        DropDownList dl3 = (DropDownList)FormView1.FindControl("DropDownList3");
        getcon();
        string str = "select district_name,district_id from tbl_district where state_id=('" + dl2.SelectedItem.Value + "')";
        SqlCommand cmd = new SqlCommand(str, con);
        SqlDataAdapter ad = new SqlDataAdapter(cmd);
        DataTable dt = new DataTable();
        ad.Fill(dt);
        if (dt.Rows.Count > 0)
        {
            dl3.DataSource = dt;
            dl3.DataTextField = "district_name";
            dl3.DataValueField = "district_id";
            dl3.DataBind();
            dl3.Items.Insert(0, "select");
        }

     //   dl3.Items.FindByText(dt.Rows[0][0].ToString());

        con.Close();

    }
}