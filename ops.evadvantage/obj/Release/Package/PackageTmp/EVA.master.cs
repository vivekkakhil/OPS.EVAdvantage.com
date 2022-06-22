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

public partial class MasterPages_EVA : System.Web.UI.MasterPage
{
    protected void Page_Load(object sender, EventArgs e)
    {

        /* only for checking purpose
        Response.Write(Request.Url.DnsSafeHost.IndexOf("www").ToString());
        Response.Write(", " + Request.Url.DnsSafeHost.IndexOf("localhost").ToString());
        Response.Write(", " + Request.Url.HostNameType.ToString().ToUpper().ToString());
        Response.Write(", " + Request.Url.DnsSafeHost.Replace("www.", ""));
        Response.Write(", " + Request.Url.PathAndQuery.ToString());
        */


        if (Session["user"] != null)
        {
            div_header.Visible = false;
            div_bottom.Visible = false;

            main_body.Attributes.Add("Class", "body1");
            main_header.Attributes.Add("Class", "header1");

            div_topNav.Visible = false;
            div_top.Visible = true;
            lblWelcome.Visible = true;
            lblUser.Visible = true;
            if (Session["type"].ToString() == "2" && Session["fname"]!=null && Session["lname"]!=null)
            {
                lblUser.Text = Session["fname"].ToString() + " " + Session["lname"].ToString();

            }
            else if (Session["type"].ToString() == "3")
            {
                lblUser.Text = Session["fname"].ToString() + " " + Session["lname"].ToString();

            }
            else if (Session["type"].ToString() == "4")
            {
                lblUser.Text = Session["fname"].ToString() + " " + Session["lname"].ToString();

            }
            else
            {
                lblUser.Text = Session["user"].ToString();
            }
        }
        else
        {
            div_header.Visible = true;
            div_bottom.Visible = true;

            main_body.Attributes.Add("Class", "body");
            main_header.Attributes.Add("Class", "header");

            div_topNav.Visible = true;
            div_top.Visible = false;
            lblWelcome.Visible = false;
            lblUser.Visible = false;

        }

        SSLPageCapture();

    }

    protected void lnkLogout_Click(object sender, EventArgs e)
    {
        Session.Clear();
        Session.Abandon();
        Response.Cache.SetCacheability(HttpCacheability.NoCache);
        Response.Cache.SetExpires(DateTime.Now);
        //Response.Redirect("index.aspx");
        Response.Redirect("http://evadvantage.com");
    }
    protected void imgbtnIndex_Click(object sender, ImageClickEventArgs e)
    {
        Response.Redirect("index.aspx");
    }
    protected void imgbtnServices_Click(object sender, ImageClickEventArgs e)
    {
        Response.Redirect("services.aspx");
    }
    protected void imgbtnVerifier_Click(object sender, ImageClickEventArgs e)
    {
        Response.Redirect("verifiers.aspx");
    }
    protected void imgbtnEmp_Click(object sender, ImageClickEventArgs e)
    {
        Response.Redirect("employees.aspx");
    }
    protected void imgbtnContact_Click(object sender, ImageClickEventArgs e)
    {
        Response.Redirect("contact.aspx");
    }
    protected void imgbtnFaq_Click(object sender, ImageClickEventArgs e)
    {
        Response.Redirect("faq.aspx");
    }

    private void SSLPageCapture()
    {
        string sRet = Request.Url.ToString().ToLower();

        if (sRet.ToLower().Contains("forgetpwdn.aspx")
            //|| sRet.ToLower().Contains("createverifiern.aspx")
            //|| sRet.ToLower().Contains("createempn.aspx")
            //|| sRet.ToLower().Contains("ssnewusern.aspx")
            //|| sRet.ToLower().Contains("createverifiern.aspx")
            //|| sRet.ToLower().Contains("createempn.aspx")
            || sRet.ToLower().Contains("index.aspx")
            || sRet.ToLower().Contains("login.aspx")
            )
        {
            if (sRet.StartsWith("https://"))
            {
                Response.Redirect(sRet.Replace("https://", "http://")); //commented asr
            }
        }
        else
        {
            if (sRet.StartsWith("http://"))
            {
              //  Response.Redirect(sRet.Replace("http://", "https://"));  // commented
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
        //       // Response.Redirect(sRet.Replace("https://", "http://"));
        //    }
        //}
    }
}
