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

public partial class createEmp : System.Web.UI.Page
{
    CreateEmp objEmp = new CreateEmp();
    EmpInfo objEmpInfo = new EmpInfo();
    int UserId=0;

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
        EVA.Utilities.BindDropDownList(ddlCompany, objEmp.GetCompany(), "CompanyName", "CompanyId");
    }
    protected void btnCreate_Click(object sender, EventArgs e)
    {
        objEmp.UserName = txtUser.Text;
        DataSet ds = objEmp.GetUserName();
        if (ds.Tables[0].Rows.Count == 0)
        {
            objEmpInfo = PrepareParameterEmpInfo();
            DataSet dsEmp = objEmpInfo.GetEmpInfo();
            
            if (dsEmp.Tables[0].Rows.Count != 0)
            {
                objEmp = PrepareParameterUserDetail();
                DataSet dsUser = objEmp.GetUserDetail();
                if (dsUser.Tables[0].Rows.Count == 0)
                {
                    objEmp = PrepareParameterUser();
                    //objEmp.EmpInfoId=Convert.ToInt32(dsEmp.Tables[0].Rows[0]["EmpInfoId"]);
                    UserId = objEmp.SaveData();

                    objEmp = PrepareParameterDetails();
                    objEmp.SaveDetails();

                    EVA.Utilities.MessageBox("Account Created Successfully.", Page);
                    Response.Redirect("index.aspx");
                    ClearControl();
                }
                else
                {
                    EVA.Utilities.MessageBox("Employee already exits with this Social Security #.", Page);
                }
            }
            else
            {
                EVA.Utilities.MessageBox("Invalid Social Security # or Company Code.", Page);
            }
            
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
        objEmp.Type="2";
        objEmp.IsActive = "0";

        return objEmp;
    }
    private CreateEmp PrepareParameterUserDetail()
    {
        objEmp = new CreateEmp();
        objEmp.SSN = txtSSN.Text;
        objEmp.DateOfBirth = Convert.ToDateTime(txtDate.Text);
        return objEmp;
    }
    private CreateEmp PrepareParameterDetails()
    {
        objEmp = new CreateEmp();
        objEmp.UserId = UserId;
        objEmp.SSN = txtSSN.Text;
        objEmp.CompanyName = ddlCompany.SelectedItem.Text.Substring(0,(ddlCompany.SelectedItem.Text.IndexOf("(")-1));
        objEmp.DateOfBirth = Convert.ToDateTime(txtDate.Text);
        objEmp.Email = txtEmail.Text;
        
        return objEmp;
    }
    private EmpInfo PrepareParameterEmpInfo()
    {
        objEmpInfo = new EmpInfo();

        //SK | Oct 05 2009 ->Start
        //string ssn = txtSSN.Text;
        //string ss = ssn.Substring(0, 3) + ssn.Substring(4, 2) + ssn.Substring(7, 4);
        string ss = txtSSN.Text;
        //SK | Oct 05 2009 ->End

        objEmpInfo.SSN =ss;
        objEmpInfo.CompanyId = Convert.ToInt32(ddlCompany.SelectedValue);

        DateTime dt = Convert.ToDateTime(txtDate.Text);
        string dtBirth = dt.ToString("yyyyMMdd");
        
        objEmpInfo.DateOfBirth = dtBirth;
        
        return objEmpInfo;
    }

    private void ClearControl()
    {
        txtSSN.Text = String.Empty;
        ddlCompany.SelectedValue = "0";
        txtEmail.Text = String.Empty;
        txtUser.Text = String.Empty;
        txtDate.Text = String.Empty;

    }
    protected void btnCancel_Click(object sender, EventArgs e)
    {
        Response.Redirect("index.aspx");
    }
    protected void btnClear_Click(object sender, EventArgs e)
    {
        ClearControl();
    }
}
