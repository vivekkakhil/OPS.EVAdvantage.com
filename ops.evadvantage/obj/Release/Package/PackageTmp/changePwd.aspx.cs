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

public partial class Admin_changePwd : System.Web.UI.Page
{
    CreateEmp objEmp = new CreateEmp();
    protected void Page_Load(object sender, EventArgs e)
    {
        Response.Cache.SetCacheability(HttpCacheability.NoCache);
        LinkButton lnk = (LinkButton)Master.FindControl("lnkPwd");
        lnk.Font.Bold = true;
        if (Session["user"] == null)
        {
            Response.Redirect("Login.aspx");
        }

    }
    protected void btnSave_Click(object sender, EventArgs e)
    {
        objEmp = PrepareParameter();
        DataSet ds = objEmp.GetUser();
        if (ds.Tables[0].Rows.Count != 0)
        {
            objEmp = PrepareParameterForUpdate();
            objEmp.UpdateData();
            ops.evadvantage.Utilities.MessageBox("Password has been changed successfully.", Page);
            ClearControl();
        }
        else
        {
            ops.evadvantage.Utilities.MessageBox("Please enter correct old password.", Page);
        }
    }
    private CreateEmp PrepareParameterForUpdate()
    {
        objEmp = new CreateEmp();
        objEmp.UserId = Convert.ToInt32(Session["userid"]);
        objEmp.Pwd = txtNew.Text;
        return objEmp;
    }
    private CreateEmp PrepareParameter()
    {
        objEmp = new CreateEmp();
        objEmp.UserName = Session["user"].ToString();
        objEmp.Pwd = txtOld.Text;
        objEmp.Type = Session["type"].ToString();

        return objEmp;
    }
    protected void btnClear_Click(object sender, EventArgs e)
    {
        ClearControl();
        
    }
    private void ClearControl()
    {
        txtNew.Text = String.Empty;
        txtOld.Text = String.Empty;
        txtConfirm.Text = String.Empty;
    }
}
