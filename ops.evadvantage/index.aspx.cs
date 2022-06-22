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
using System.Data.Common;
using EVA.BLL;


public partial class index : System.Web.UI.Page
{
    CreateEmp objEmp = new CreateEmp();
    protected void Page_Load(object sender, EventArgs e)
    {
        Response.Cache.SetCacheability(HttpCacheability.NoCache);
        if (Session["user"] != null)
        {
            if (Session["type"].ToString() == "2")
            {
                Response.Redirect("empHome.aspx");
            }
            if (Session["type"].ToString() == "3")
            {
                Response.Redirect("veriHome.aspx");
            }
        }
        ImageButton imgbtn=(ImageButton)Master.FindControl("imgbtnIndex");
        imgbtn.ImageUrl = "images/home_btn_select.jpg";
       
        txtUser.Attributes.Add("onKeyPress", "doClick('" + imgbtnLogin.ClientID + "',event)");
        txtPwd.Attributes.Add("onKeyPress", "doClick('" + imgbtnLogin.ClientID + "',event)");
        txtVUser.Attributes.Add("onKeyPress", "doClick('" + imgbtnVLogin.ClientID + "',event)");
        txtVPwd.Attributes.Add("onKeyPress", "doClick('" + imgbtnVLogin.ClientID + "',event)");


        


    }
    protected void imgbtnNewUser_Click(object sender, ImageClickEventArgs e)
    {
        Response.Redirect("createEmp.aspx");
    }
    protected void imgbtnLogin_Click(object sender, ImageClickEventArgs e)
    {
        if (Login(txtUser.Text,txtPwd.Text,"2"))
        {
            Response.Redirect("empHome.aspx");
        }
    }
    private CreateEmp PrepareParameter(string user, string pwd,string type)
    {
        objEmp.UserName = user;
        objEmp.Pwd = pwd;
        objEmp.Type = type;

        return objEmp;
    }
    protected void lnkForget_Click(object sender, EventArgs e)
    {
        Response.Redirect("forgetPwd.aspx");
    }
    protected void imgbtnVLogin_Click(object sender, ImageClickEventArgs e)
    {
        if (Login(txtVUser.Text, txtVPwd.Text, "3"))
        {
            Response.Redirect("veriHome.aspx");
        }
        
    }
    private bool Login(string user, string pwd,string type)
    {
        objEmp = PrepareParameter(user,pwd,type);
        DataSet ds = objEmp.GetUser();
        if (ds.Tables[0].Rows.Count != 0)
        {
            Session["userid"] = ds.Tables[0].Rows[0]["UserId"].ToString();
            Session["user"] = ds.Tables[0].Rows[0]["UserName"].ToString();
            Session["type"] = ds.Tables[0].Rows[0]["Type"].ToString();
            if (Session["type"].ToString() == "2")
            {
                objEmp.UserId = Convert.ToInt32(Session["userid"]);
                DataSet dsEmpInfo = objEmp.GetUserEmpInfo();
                if (dsEmpInfo.Tables[0].Rows.Count != 0)
                {
                    Session["fname"] = dsEmpInfo.Tables[0].Rows[0]["FirstName"].ToString();
                    Session["lname"] = dsEmpInfo.Tables[0].Rows[0]["LastName"].ToString();
                }

            }
            else if (Session["type"].ToString() == "3")
            {
                objEmp.UserName = Session["user"].ToString();
                DataSet dsVerifier = objEmp.GetUserName();
                if (dsVerifier.Tables[0].Rows.Count != 0)
                {
                    Session["fname"] = dsVerifier.Tables[0].Rows[0]["FirstName"].ToString();
                    Session["lname"] = dsVerifier.Tables[0].Rows[0]["LastName"].ToString();
                }
            }
            else
            {
                Session["fname"] = null;
                Session["Lname"] = null;
            }

            return true;
        }
        else
        {
            EVA.Utilities.MessageBox("Invalid User Name or Password.", Page);
            return false;
        }
    }
    protected void imgbtnNewUserVerif_Click(object sender, ImageClickEventArgs e)
    {
        Response.Redirect("createVerifier.aspx");
    }
    protected void lnkForgetVeri_Click(object sender, EventArgs e)
    {
        Response.Redirect("forgetPwdVeri.aspx");
    }
    protected void lnkSSV_Click(object sender, EventArgs e)
    {
        Response.Redirect("SocialService/login.aspx");
    }
}
