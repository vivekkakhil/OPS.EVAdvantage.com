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

public partial class Admin_adminHome : System.Web.UI.Page
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
        lnk.Font.Bold=true;
    }
    public void Activate(object sender, CommandEventArgs e)
    {
       objEmp.UserId = Convert.ToInt32(e.CommandName);
       objEmp.IsActive = "0";
      

       objEmp.UpdateDataForActivate();
       gvActive.DataBind();
       gvSSU.DataBind();

       string email = e.CommandArgument.ToString();
       string body;
       body = "<b>Dear User,</b><br /><br />Your request has been approved and your account has been activated.  You may log in to www.evadvantage.com and complete the verification using the user name and password you created.<br />";
       body = body + "<br />If you are requesting wage information you must have the employee login to evadvantage.com and create a salary code for you to use in order to complete the wage verification. <br /><br /> Please do not reply to this auto - generated mail. <br /><br /><br /><b>Thanks and regards </b><br /><b>EV Advantage </b> ";
       body = body + "<br /><a href='www.evadvantage.com'>www.evadvantage.com</a>";

       ops.evadvantage.Utilities.SendMail(email, ConfigurationManager.AppSettings["email"].ToString(), body, "Account Activation from EV Advantage");
       

    }
    public void ActivateNo(object sender, CommandEventArgs e)
    {
        objEmp.UserId = Convert.ToInt32(e.CommandName);
        objEmp.IsActive = "3";


        objEmp.UpdateDataForActivate();
        gvActive.DataBind();
        gvSSU.DataBind();

        string email = e.CommandArgument.ToString();
        string body;
        body = "<b>Dear User,</b><br /><br />Your account activation request has been declined by admin. <br />";
        body = body + "<br />So, your account has not been created. Please contact administrator for more detail. <br /><br /> Please do not reply to this auto - generated mail. <br /><br /><br /><b>Thanks and regards </b><br /><b>EV Advantage </b> ";
        body = body + "<br /><a href='www.evadvantage.com'>www.evadvantage.com</a>";

        ops.evadvantage.Utilities.SendMail(email, ConfigurationManager.AppSettings["email"].ToString(), body, "Account Activation from EV Advantage");
        

    }
    public void Detail(object sender, CommandEventArgs e)
    {
        string user = e.CommandName.ToString();
        //ScriptManager.RegisterClientScriptBlock(Page, typeof(Page), "MyKey", "popUp('veriDetail.aspx?user=" + user + "');", true);
        Response.Redirect("veriDetail.aspx?user=" + user + "&type=" + e.CommandArgument.ToString());
        //DataSet ds = objEmp.GetUserName();
                       
        //gvActive.DataBind();

        
    }

}
