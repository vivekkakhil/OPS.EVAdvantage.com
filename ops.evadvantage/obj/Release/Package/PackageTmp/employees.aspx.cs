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

public partial class employees : System.Web.UI.Page
{
    CreateEmp objEmp = new CreateEmp();
    protected void Page_Load(object sender, EventArgs e)
    {
        Response.Cache.SetCacheability(HttpCacheability.NoCache);
        if (Session["user"] != null)
        {
            if (Session["Type"].ToString() == "2")
            {
                Response.Redirect("empHome.aspx");
                tblLogin.Visible = true;
                tblMsg.Visible = false;
            }
            if (Session["Type"].ToString() == "3")
            {
                tblLogin.Visible = false;
                tblMsg.Visible = true;
                lblMsg.Text = "You have already login as a verifier please logout and login again as a employee.";

            }
        }
        ImageButton imgbtn = (ImageButton)Master.FindControl("imgbtnEmp");
        imgbtn.ImageUrl = "images/employee_btn_select.jpg";

        txtUser.Attributes.Add("onKeyPress", "doClick('" + imgbtnLogin.ClientID + "',event)");
        txtPwd.Attributes.Add("onKeyPress", "doClick('" + imgbtnLogin.ClientID + "',event)");

    }
    protected void imgbtnNewUser_Click(object sender, ImageClickEventArgs e)
    {
        Response.Redirect("createEmp.aspx");
    }
    protected void imgbtnLogin_Click(object sender, ImageClickEventArgs e)
    {
        if (Login(txtUser.Text, txtPwd.Text, "2"))
        {
            Response.Redirect("empHome.aspx");
        }
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
   
    private CreateEmp PrepareParameter(string user, string pwd, string type)
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
    protected void txtUser_TextChanged(object sender, EventArgs e)
    {

    }
}
