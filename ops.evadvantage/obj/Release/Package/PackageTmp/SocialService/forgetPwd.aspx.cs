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
public partial class SocialService_forgetPwd : System.Web.UI.Page
{
    CreateEmp objEmp = new CreateEmp();
    protected void Page_Load(object sender, EventArgs e)
    {
        Response.Cache.SetCacheability(HttpCacheability.NoCache);
        if (IsPostBack != true)
        {
            tblUser.Visible = true;
            tblQuestion.Visible = false;
        }
    }
    protected void btnSubmit_Click(object sender, EventArgs e)
    {
        objEmp.UserName = txtUser.Text;
        objEmp.Type = "4";
        DataSet ds = objEmp.GetUserNameForPwd();
        if (ds.Tables[0].Rows.Count != 0)
        {
            tblQuestion.Visible = true;
            tblUser.Visible = false;
            objEmp.QuestionId = Convert.ToInt32(ds.Tables[0].Rows[0]["QuestionId"]);
            DataSet dsQuestion = objEmp.SelectQuestion();
            lblQuestion.Text = dsQuestion.Tables[0].Rows[0]["Question"].ToString();


        }
        else
        {
            EVA.Utilities.MessageBox("Please enter valid user name.", Page);
        }
    }
    protected void btnCancel_Click(object sender, EventArgs e)
    {
        Response.Redirect("login.aspx");
    }
    protected void btnSubmit1_Click(object sender, EventArgs e)
    {
        objEmp.UserName = txtUser.Text;
        DataSet ds = objEmp.GetUserName();
        if (ds.Tables[0].Rows[0]["ans"].ToString() == txtAns.Text)
        {
            string email = ds.Tables[0].Rows[0]["Email"].ToString();
            string body;
            body = "<b>Dear " + txtUser.Text + ",</b><br /><br />Your password is " + ds.Tables[0].Rows[0]["Pwd"].ToString() + " <br />";
            body = body + "<br />Now you can login with the user name and password <br /><br /> Please do not reply to this auto - generated mail. <br /><br /><br /><b>Thanks and regards </b><br /><b>EV Advantage </b> ";
            body = body + "<br /><a href='www.evadvantage.com'>www.evadvantage.com</a>";

            EVA.Utilities.SendMail(email, ConfigurationManager.AppSettings["email"].ToString(), body, "Password from EV Advantage");
            EVA.Utilities.MessageBox("Password is successfully sent to your email address.", Page);
            ClearControl();
            //Response.Redirect("index.aspx");
            tblUser.Visible = true;
            tblQuestion.Visible = false;
        }
        else
        {
            EVA.Utilities.MessageBox("This was not the answer saved by you.", Page);
        }
    }
    protected void btnCancel1_Click(object sender, EventArgs e)
    {
        tblUser.Visible = true;
        tblQuestion.Visible = false;
    }
    private void ClearControl()
    {
        txtAns.Text = String.Empty;
        txtUser.Text = String.Empty;
    }
}
