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
using EVA.BLL;

public partial class forgetPwdN : System.Web.UI.Page
{
    CreateEmp objEmp = new CreateEmp();
    protected void Page_Load(object sender, EventArgs e)
    {
        Response.Cache.SetCacheability(HttpCacheability.NoCache);
    }
    protected void btnSubmit_Click(object sender, EventArgs e)
    {
        objEmp.UserName = txtUser.Text;
        objEmp.Type = "2";
        DataSet ds = objEmp.GetUserNameForPwd();
        if (ds.Tables[0].Rows.Count != 0)
        {
            string email = ds.Tables[0].Rows[0]["Email"].ToString();
            string body;
            body = "<b>Dear " + txtUser.Text + ",</b><br /><br />Your password is " + ds.Tables[0].Rows[0]["Pwd"].ToString() + " <br />";
            body = body + "<br />Now you can login with the user name and password <br /><br /> Please do not reply to this auto - generated mail. <br /><br /><br /><b>Thanks and regards </b><br /><b>EV Advantage </b> ";
            body = body + "<br /><a href='www.evadvantage.com'>www.evadvantage.com</a>";

            EVA.Utilities.SendMail(email, ConfigurationManager.AppSettings["email"].ToString(), body, "Password from EV Advantage");
            EVA.Utilities.MessageBox("Password is successfully sent to your email address.", Page);
            ClearControl();
        }
        else
        {
            EVA.Utilities.MessageBox("Please enter valid user name.", Page);
        }
    }
    protected void btnCancel_Click(object sender, EventArgs e)
    {
        Response.Redirect("index.aspx");
    }
    private void ClearControl()
    {
        txtUser.Text = String.Empty;
    }
}