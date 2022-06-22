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

public partial class SocialService_EVASsv : System.Web.UI.MasterPage
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["user"] != null)
        {
           // tblMenu.Visible = true;
            div_header.Visible = false;
            div_bottom.Visible = false;

            main_body.Attributes.Add("Class", "body1");
            main_header.Attributes.Add("Class", "header1");

            div_topNav.Visible = false;
            div_top.Visible = true;
            lblWelcome.Visible = true;
            lblUser.Visible = true;
            if (Session["type"].ToString() == "2")
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
           // tblMenu.Visible = false;
            div_header.Visible = true;
            div_bottom.Visible = true;

            main_body.Attributes.Add("Class", "body");
            main_header.Attributes.Add("Class", "header");

            div_topNav.Visible = true;
            div_top.Visible = false;
            lblWelcome.Visible = false;
            lblUser.Visible = false;

        }

    }
    protected void lnkLogout_Click(object sender, EventArgs e)
    {
        Session.Clear();
        Session.Abandon();
        //Response.Redirect("login.aspx");
        Response.Redirect("http://evadvantage.com");
    }
    protected void imgbtnIndex_Click(object sender, ImageClickEventArgs e)
    {
        Response.Redirect("../index.aspx");
    }
    protected void imgbtnServices_Click(object sender, ImageClickEventArgs e)
    {
        Response.Redirect("../services.aspx");
    }
    protected void imgbtnVerifier_Click(object sender, ImageClickEventArgs e)
    {
        Response.Redirect("../verifiers.aspx");
    }
    protected void imgbtnEmp_Click(object sender, ImageClickEventArgs e)
    {
        Response.Redirect("../employees.aspx");
    }
    protected void imgbtnContact_Click(object sender, ImageClickEventArgs e)
    {
        Response.Redirect("../contact.aspx");
    }
    protected void imgbtnFaq_Click(object sender, ImageClickEventArgs e)
    {
        Response.Redirect("../faq.aspx");
    }
    //protected void lnkEdit_Click(object sender, EventArgs e)
    //{
    //    Response.Redirect("editSSUser.aspx");
    //}
}
