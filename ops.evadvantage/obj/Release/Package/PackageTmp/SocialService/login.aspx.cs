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

public partial class SocialService_login : System.Web.UI.Page
{
    CreateEmp objEmp = new CreateEmp();
    protected void Page_Load(object sender, EventArgs e)
    {
        txtUser.Focus();
        txtUser.Attributes.Add("onKeyPress", "doClick('" + imgbtnLogin.ClientID + "',event)");
        txtPwd.Attributes.Add("onKeyPress", "doClick('" + imgbtnLogin.ClientID + "',event)");

    }
    protected void imgbtnLogin_Click(object sender, ImageClickEventArgs e)
    {
        if (Login(txtUser.Text, txtPwd.Text, "4"))
        {
            Response.Redirect("SSHome.aspx");
        }
    }
    protected void imgbtnNewUser_Click(object sender, ImageClickEventArgs e)
    {
        Response.Redirect("SSNewUser.aspx");
    }
    protected void lnkForget_Click(object sender, EventArgs e)
    {
        Response.Redirect("forgetPwd.aspx");
    }
    private bool Login(string user, string pwd, string type)
    {
        objEmp = PrepareParameter(user, pwd, type);
        DataSet ds = objEmp.GetUser();
        if (ds.Tables[0].Rows.Count != 0)
        {
            Session["userid"] = ds.Tables[0].Rows[0]["UserId"].ToString();
            Session["user"] = ds.Tables[0].Rows[0]["UserName"].ToString();
            Session["type"] = ds.Tables[0].Rows[0]["Type"].ToString();
            if (Session["type"].ToString() == "4")
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

    private CreateEmp PrepareParameter(string user, string pwd, string type)
    {
        objEmp.UserName = user;
        objEmp.Pwd = pwd;
        objEmp.Type = type;

        return objEmp;
    }
}
