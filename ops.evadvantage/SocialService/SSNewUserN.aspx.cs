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


public partial class SocialService_SSNewUserN : System.Web.UI.Page
{
    CreateEmp objEmp = new CreateEmp();
    int UserId = 0;
    protected void Page_Load(object sender, EventArgs e)
    {
        Response.Cache.SetCacheability(HttpCacheability.NoCache);
        if (IsPostBack != true)
        {
            BindDropDown();
        }

    }
    private void BindDropDown()
    {
        EVA.Utilities.BindDropDownList(ddlState, objEmp.GetState(), "StateName", "StateId");
        EVA.Utilities.BindDropDownList(ddlQuestion, objEmp.GetQuestion(), "Question", "QuestionId");
    }
    protected void btnCreate_Click(object sender, EventArgs e)
    {
        objEmp.UserName = txtUser.Text;
        DataSet ds = objEmp.GetUserName();
        if (ds.Tables[0].Rows.Count == 0)
        {
            objEmp = PrepareParameterUser();
            UserId = objEmp.SaveData();

            objEmp = PrepareParameterDetails();
            objEmp.SaveDetails();

            EVA.Utilities.MessageBox("Request has been submitted and we will respond you via email after validating the information", Page);
            ClearControl();
        }
        else
        {
            EVA.Utilities.MessageBox("User name already exists.", Page);
        }
    }
    private CreateEmp PrepareParameterUser()
    {
        objEmp.UserName = txtUser.Text;
        objEmp.Pwd = txtPwd.Text;
        objEmp.Type = "4";
        objEmp.IsActive = "1";

        return objEmp;
    }
    private CreateEmp PrepareParameterDetails()
    {
        objEmp = new CreateEmp();
        objEmp.UserId = UserId;
        objEmp.FirstName = txtFname.Text;
        objEmp.LastName = txtLname.Text;
        objEmp.CompanyName = txtCname.Text;
        objEmp.CompanyAdd1 = txtCadd1.Text;
        objEmp.CompanyAdd2 = txtCadd2.Text;
        objEmp.City = txtCity.Text;
        objEmp.StateId = Convert.ToInt32(ddlState.SelectedValue);
        objEmp.ZipCode = txtZip.Text;
        objEmp.Country = txtCountry.Text;
        objEmp.WorkTelephone = txtTele.Text;
        objEmp.WorkFax = txtFax.Text;
        objEmp.Email = txtEmail.Text;
        objEmp.QuestionId = Convert.ToInt32(ddlQuestion.SelectedValue);
        objEmp.Ans = txtAns.Text;

        return objEmp;
    }
    protected void btnClear_Click(object sender, EventArgs e)
    {
        ClearControl();
    }
    protected void btnCancel_Click(object sender, EventArgs e)
    {
        Response.Redirect("login.aspx");
    }
    private void ClearControl()
    {
        txtUser.Text = String.Empty;
        txtPwd.Text = String.Empty;
        txtRePwd.Text = String.Empty;
        txtFname.Text = String.Empty;
        txtLname.Text = String.Empty;
        txtCname.Text = String.Empty;
        txtCadd1.Text = String.Empty;
        txtCadd2.Text = String.Empty;
        txtCity.Text = String.Empty;
        ddlState.SelectedValue = "0";
        txtZip.Text = String.Empty;
        txtCountry.Text = String.Empty;
        txtTele.Text = String.Empty;
        txtFax.Text = String.Empty;
        txtEmail.Text = String.Empty;
        ddlQuestion.SelectedValue = "0";
        txtAns.Text = String.Empty;
    }
}