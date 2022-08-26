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

public partial class Admin_Login : System.Web.UI.Page
{
    CreateEmp objEmp = new CreateEmp();
    protected void Page_Load(object sender, EventArgs e)
    {
        Response.Cache.SetCacheability(HttpCacheability.NoCache);
        txtUser.Focus();

    }
    protected void imgbtnLogin_Click(object sender, EventArgs e)
    {
        objEmp = PrepareParameter();
        DataSet ds = objEmp.GetUser();
        if (ds.Tables[0].Rows.Count != 0)
        {
            Session["userid"] = ds.Tables[0].Rows[0]["UserId"].ToString();
            Session["user"] = ds.Tables[0].Rows[0]["UserName"].ToString();
            Session["type"] = ds.Tables[0].Rows[0]["Type"].ToString();
            Response.Redirect("adminHome.aspx");
        }
        else
        {
            objEmp.Type = "1";
            DataSet dsUser = objEmp.GetUser();
            if (dsUser.Tables[0].Rows.Count != 0)
            {
                Session["userid"] = dsUser.Tables[0].Rows[0]["UserId"].ToString();
                Session["user"] = dsUser.Tables[0].Rows[0]["UserName"].ToString();
                Session["type"] = dsUser.Tables[0].Rows[0]["Type"].ToString();
                Response.Redirect("adminHome.aspx");
            }
            else
            {
                ops.evadvantage.Utilities.MessageBox("Invalid User Name or Password.", Page);
            }

        }

    }
    private CreateEmp PrepareParameter()
    {
        objEmp.UserName = txtUser.Text;
        objEmp.Pwd = txtPwd.Text;
        objEmp.Type = "0";

        return objEmp;
    }
}
