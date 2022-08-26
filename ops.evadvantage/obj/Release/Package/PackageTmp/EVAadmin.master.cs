using System;
using System.Collections;
using System.Configuration;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Web.UI.HtmlControls;
using System.Xml.Linq;

public partial class Admin_EVAadmin : System.Web.UI.MasterPage
{
    protected void Page_Load(object sender, EventArgs e)
    {
        //divpop.Visible = false;
        tblmenuall.Visible = false;
        tblmessagewelcome.Visible = false;
        if (Session["user"] != null)
        {
            lblWelcome.Visible = true;
            lblUser.Visible = true;
            lblUser.Text = Session["user"].ToString();
            lnkLogout.Visible = true;
            myNavbar.Visible = true;
            tblmenuall.Visible = true;
            tblmessagewelcome.Visible = true;
            if (Session["type"].ToString() == "1")
            {
                tdacc.Visible = true;
                //tdacciimg.Visible = true;
                tdcomp.Visible = true;
                //tdcompimg.Visible = true;
                tdemp.Visible = false;
                tdemp1.Visible = false;
                tdemp2.Visible = false;
                tdemp3.Visible = false;
                tdemp4.Visible = false;
                //tdempimg.Visible = false;
                //tdveri.Visible = false;
                //tdveriimg.Visible = false;
                //tduser.Visible = false;
                //tduserimg.Visible = false;
                tdchange.Visible = true;
                //tdchangeimg.Visible = true;
                tdupload.Visible = true;
                //tduploadimg.Visible = true;
                tdpwd.Visible = true;
                //tdpwdimg.Visible = true;
                tdreport.Visible = true;
                tdExc.Visible = true;
            }
            else
            {
                tdacc.Visible = true;
                //tdacciimg.Visible = true;
                tdcomp.Visible = true;
                //tdcompimg.Visible = true;
                tdemp.Visible = true;
                tdemp1.Visible = true;
                tdemp2.Visible = true;
                tdemp3.Visible = true;
                tdemp4.Visible = true;
                
                //tdempimg.Visible = true;
                //tdveri.Visible = true;
                //tdveriimg.Visible = true;
                //tduser.Visible = true;
                //tduserimg.Visible = true;
                tdchange.Visible = true;
                //tdchangeimg.Visible = true;
                tdupload.Visible = true;
                //tduploadimg.Visible = true;
                tdpwd.Visible = true;
                //tdpwdimg.Visible = true;
                tdreport.Visible = true;
                tdExc.Visible = true;
            }
        }
        else
        {
            lblWelcome.Visible = false;
            lblUser.Visible = false;
            lnkLogout.Visible = false;
            myNavbar.Visible = false;
          
        }
       // SSLPageCapture();
    }
    protected void lnkLogout_Click(object sender, EventArgs e)
    {
        Session.Clear();
        Session.Abandon();
        Response.Redirect("Login.aspx");
    }
    protected void lnkAccount_Click(object sender, EventArgs e)
    {
        Response.Redirect("adminHome.aspx");
    }
    protected void lnkCompany_Click(object sender, EventArgs e)
    {
        Response.Redirect("company.aspx");
    }
    protected void lnkEmployee_Click(object sender, EventArgs e)
    {
        Response.Redirect("employee.aspx");
    }
    protected void lnkChange_Click(object sender, EventArgs e)
    {
        Response.Redirect("changePrice.aspx");
    }
    protected void lnkPwd_Click(object sender, EventArgs e)
    {
        Response.Redirect("changePwd.aspx");
    }
    protected void lnkUpload_Click(object sender, EventArgs e)
    {
        Response.Redirect("dataUpload.aspx");
    }
    protected void lnkVerifier_Click(object sender, EventArgs e)
    {
        Response.Redirect("verifier.aspx");
    }
    protected void lnkUser_Click(object sender, EventArgs e)
    {
        Response.Redirect("user.aspx");
    }



    protected void lnkVerification_Click(object sender, EventArgs e)
    {
        Response.Redirect("verification.aspx");
    }
    protected void lnkSsu_Click(object sender, EventArgs e)
    {
        Response.Redirect("socialServices.aspx");
    }

    protected void lnkRep_Click(object sender, EventArgs e)
    {
        Response.Redirect("report.aspx");
    }
    protected void lnkException_Click(object sender, EventArgs e)
    {
        Response.Redirect("Exception.aspx");
    }

    private void SSLPageCapture()
    {
        string sRet = Request.Url.ToString().ToLower();

        if (sRet.ToLower().Contains("forgetpwdn.aspx")
            || sRet.ToLower().Contains("createverifiern.aspx")
            || sRet.ToLower().Contains("createempn.aspx")
            || sRet.ToLower().Contains("ssnewusern.aspx")
            || sRet.ToLower().Contains("createverifiern.aspx")
            || sRet.ToLower().Contains("createempn.aspx")
            || sRet.ToLower().Contains("index.aspx")
            //|| sRet.ToLower().Contains("login.aspx")
            )
        {
            if (sRet.StartsWith("https://"))
            {
                Response.Redirect(sRet.Replace("https://", "http://"));
            }
        }
        else
        {
            if (sRet.StartsWith("http://"))
            {
                Response.Redirect(sRet.Replace("http://", "https://"));
            }
        }


        //if (sRet.ToLower().Contains("verihome.aspx") || sRet.ToLower().Contains("authorizenet.aspx") || sRet.ToLower().Contains("payment.aspx") || sRet.ToLower().Contains("employment.aspx"))
        //{
        //    if (sRet.StartsWith("http://"))
        //    {
        //        Response.Redirect(sRet.Replace("http://", "https://"));
        //    }
        //}
        //else
        //{
        //    if (sRet.StartsWith("https://"))
        //    {
        //        Response.Redirect(sRet.Replace("https://", "http://"));
        //    }
        //}
    }
}
