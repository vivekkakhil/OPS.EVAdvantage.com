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

public partial class SocialService_editSSUser : System.Web.UI.Page
{
    CreateEmp objEmp = new CreateEmp();
    static int UserDetailId = 0;
    protected void Page_Load(object sender, EventArgs e)
    {
        Response.Cache.SetCacheability(HttpCacheability.NoCache);
        if (IsPostBack != true)
        {
            if (Session["user"] != null)
            {
                BindDropDown();
                objEmp.UserName = Session["user"].ToString();
                DataSet ds = objEmp.GetUserName();
                if (ds.Tables[0].Rows.Count != 0)
                {
                    UserDetailId = Convert.ToInt32(ds.Tables[0].Rows[0]["UserDetailId"]);
                    txtFname.Text = ds.Tables[0].Rows[0]["FirstName"].ToString();
                    txtLname.Text = ds.Tables[0].Rows[0]["LastName"].ToString();
                    txtCname.Text = ds.Tables[0].Rows[0]["CompanyName"].ToString();
                    txtCadd1.Text = ds.Tables[0].Rows[0]["CompanyAdd1"].ToString();
                    txtCadd2.Text = ds.Tables[0].Rows[0]["CompanyAdd2"].ToString();
                    txtCity.Text = ds.Tables[0].Rows[0]["City"].ToString();
                    ddlState.SelectedValue = ds.Tables[0].Rows[0]["StateId"].ToString();
                    txtZip.Text = ds.Tables[0].Rows[0]["ZipCode"].ToString();
                    txtCountry.Text = ds.Tables[0].Rows[0]["Country"].ToString();
                    txtTele.Text = ds.Tables[0].Rows[0]["WorkTelephone"].ToString();
                    txtFax.Text = ds.Tables[0].Rows[0]["WorkFax"].ToString();
                    txtEmail.Text = ds.Tables[0].Rows[0]["Email"].ToString();
                    ddlQuestion.SelectedValue = ds.Tables[0].Rows[0]["QuestionId"].ToString();
                    txtAns.Text = ds.Tables[0].Rows[0]["Ans"].ToString();
                    txtPwd.Attributes["value"] = ds.Tables[0].Rows[0]["Pwd"].ToString();
                }
            }
        }
    }
    protected void btnUpdate_Click(object sender, EventArgs e)
    {
        objEmp = PrepareParameterUser();
        objEmp.UpdateData();

        objEmp = PrepareParameterDetails();
        objEmp.UpdateDetails();

        EVA.Utilities.MessageBox("Account updated Successfully.", Page);
        ClearControl();

    }
    protected void btnClear_Click(object sender, EventArgs e)
    {
        ClearControl();
    }
   
    private void BindDropDown()
    {
        EVA.Utilities.BindDropDownList(ddlState, objEmp.GetState(), "StateName", "StateId");
        EVA.Utilities.BindDropDownList(ddlQuestion, objEmp.GetQuestion(), "Question", "QuestionId");
    }
    private CreateEmp PrepareParameterUser()
    {
        objEmp.UserId = Convert.ToInt32(Session["userid"]);
        objEmp.Pwd = txtPwd.Text;

        return objEmp;
    }
    private CreateEmp PrepareParameterDetails()
    {
        objEmp = new CreateEmp();
        //objEmp.UserId =Convert.ToInt32(Session["userid"]);
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
        objEmp.UserDetailId = UserDetailId;

        return objEmp;
    }
    private void ClearControl()
    {
        
        txtPwd.Attributes["value"]=String.Empty;
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
    protected void btnCancel_Click(object sender, EventArgs e)
    {
        Response.Redirect("SSHome.aspx");
    }
}
