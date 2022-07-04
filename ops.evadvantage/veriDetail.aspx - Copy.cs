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
using ops.evadvantage.BLL;

public partial class Admin_veriDetail : System.Web.UI.Page
{
    CreateEmp objEmp = new CreateEmp();
    protected void Page_Load(object sender, EventArgs e)
    {
        Response.Cache.SetCacheability(HttpCacheability.NoCache);
        if (Session["user"] == null)
        {
            Response.Redirect("Login.aspx");
        }
        LinkButton lnk = (LinkButton)Master.FindControl("lnkAccount");
        lnk.Font.Bold = true;

        //CreateEmp objEmp = new CreateEmp();
        if (Request.QueryString["type"].ToString() == "SSV")
        {
            trBusi.Visible = false;
            trReason.Visible = false;

        }
        else
        {
            trBusi.Visible = true;
            trReason.Visible = true;
        }
        objEmp.UserName = Request.QueryString["user"].ToString();
        DataSet ds = objEmp.GetUserName();
        if (ds.Tables[0].Rows.Count != 0)
        {
            //UserDetailId = Convert.ToInt32(ds.Tables[0].Rows[0]["UserDetailId"]);
            lblUser.Text = ds.Tables[0].Rows[0]["UserName"].ToString();
            lblPwd.Text = ds.Tables[0].Rows[0]["Pwd"].ToString();
            lblfname.Text = ds.Tables[0].Rows[0]["FirstName"].ToString();
            lbllname.Text = ds.Tables[0].Rows[0]["LastName"].ToString();
            lblcname.Text = ds.Tables[0].Rows[0]["CompanyName"].ToString();
            lblcadd.Text = ds.Tables[0].Rows[0]["CompanyAdd1"].ToString() + " " + ds.Tables[0].Rows[0]["CompanyAdd2"].ToString();
            lblcity.Text = ds.Tables[0].Rows[0]["City"].ToString();

            objEmp.StateId = Convert.ToInt32(ds.Tables[0].Rows[0]["StateId"]);
            lblstate.Text = objEmp.GetStateById().Tables[0].Rows[0]["StateName"].ToString();

            lblzip.Text = ds.Tables[0].Rows[0]["ZipCode"].ToString();
            lblcountry.Text = ds.Tables[0].Rows[0]["Country"].ToString();
            lblphone.Text = ds.Tables[0].Rows[0]["WorkTelephone"].ToString();
            if (ds.Tables[0].Rows[0]["WorkFax"].ToString() == "")
            {
                lblfax.Text = "N/A";
            }
            else
            {
                lblfax.Text = ds.Tables[0].Rows[0]["WorkFax"].ToString();
            }
            lblemail.Text = ds.Tables[0].Rows[0]["Email"].ToString();
            lblbusiness.Text = ds.Tables[0].Rows[0]["TypeOfBusiness"].ToString();
            lblreason.Text = ds.Tables[0].Rows[0]["ReasonOfVerification"].ToString();
            lblEmployeeCompany.Text = ds.Tables[0].Rows[0]["EmployeeCompany"].ToString();
        }
    }
    protected void btnClose_Click(object sender, EventArgs e)
    {
        //ScriptManager.RegisterClientScriptBlock(Page, typeof(Page), "MyKey", "window.self.close();", true);
        Response.Redirect("adminHome.aspx");
    }
    protected void btnYes_Click(object sender, EventArgs e)
    {
        objEmp.UserName = Request.QueryString["user"].ToString();
        DataSet ds = objEmp.GetUserName();
        objEmp.UserId = Convert.ToInt32(ds.Tables[0].Rows[0]["userid"]);
        objEmp.IsActive = "0";


        objEmp.UpdateDataForActivate();
        //gvActive.DataBind();

        string email = ds.Tables[0].Rows[0]["Email"].ToString();
        string body;
        body = "<b>Dear User,</b><br /><br />Your account is Activated and ready to use. <br />";
        body = body + "<br />Now you can login with the user name and password <br /><br /> Please do not reply to this auto - generated mail. <br /><br /><br /><b>Thanks and regards </b><br /><b>EV Advantage </b> ";
        body = body + "<br /><a href='www.evadvantage.com'>www.evadvantage.com</a>";

        ops.evadvantage.Utilities.SendMail(email, ConfigurationManager.AppSettings["email"].ToString(), body, "Account Activation from EV Advantage");
        Response.Redirect("adminHome.aspx");

    }
    protected void btnNo_Click(object sender, EventArgs e)
    {
        objEmp.UserName = Request.QueryString["user"].ToString();
        DataSet ds = objEmp.GetUserName();
        objEmp.UserId = Convert.ToInt32(ds.Tables[0].Rows[0]["userid"]);
        objEmp.IsActive = "2";


        objEmp.UpdateDataForActivate();
        //gvActive.DataBind();

        string email = ds.Tables[0].Rows[0]["Email"].ToString();
        string body;
        body = "<b>Dear User,</b><br /><br />Your account activation request has been declined by admin. <br />";
        body = body + "<br />So, your account has not been created. Please contact administrator for more detail. <br /><br /> Please do not reply to this auto - generated mail. <br /><br /><br /><b>Thanks and regards </b><br /><b>EV Advantage </b> ";
        body = body + "<br /><a href='www.evadvantage.com'>www.evadvantage.com</a>";

        ops.evadvantage.Utilities.SendMail(email, ConfigurationManager.AppSettings["email"].ToString(), body, "Account Activation from EV Advantage");
        Response.Redirect("adminHome.aspx");

    }
}
