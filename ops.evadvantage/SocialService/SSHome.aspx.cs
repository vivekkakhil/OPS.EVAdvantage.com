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

public partial class SocialService_SSHome : System.Web.UI.Page
{
    EmpInfo objEmpInfo = new EmpInfo();
    CreateEmp objEmp = new CreateEmp();
    ssverify objSS = new ssverify();

    protected void Page_Load(object sender, EventArgs e)
    {
        Response.Cache.SetCacheability(HttpCacheability.NoCache);
        if (Session["user"] == null)
        {
            Response.Redirect("login.aspx");
        }
        if (IsPostBack != true)
        {
            BindDropDown();
            trContd.Visible = false;
            trValid.Visible = true;
        }
    }
    private void BindDropDown()
    {
        EVA.Utilities.BindDropDownList(ddlCompany, objEmp.GetCompany(), "CompanyName", "CompanyId");
    }
    
    protected void lnkEdit_Click(object sender, EventArgs e)
    {
        Response.Redirect("editSSUser.aspx");
    }
    protected void btnClear_Click(object sender, EventArgs e)
    {
        ClearControl();
    }
    private void ClearControl()
    {
        txtSSN.Text = String.Empty;       
        ddlCompany.SelectedValue = "0";
    }
    protected void btnValidate_Click(object sender, EventArgs e)
    {
        objEmpInfo = PrepareParameterEmpInfo();
        DataSet dsEmp = objEmpInfo.GetEmpInfoBySsn();
        if (dsEmp.Tables[0].Rows.Count != 0)
        {
                Session["empinfoid"] = dsEmp.Tables[0].Rows[0]["EmpInfoId"].ToString();
                
                objEmp.SSN = txtSSN.Text;
                //DataSet dsVeri = objEmp.GetUserId();
                //if (dsVeri.Tables[0].Rows.Count != 0)
                //{
                    objSS.SSVerifierId = Convert.ToInt32(Session["userid"]);
                    objSS.SSVerifierDate = DateTime.Now;
                    //objSS.UserId = Convert.ToInt32(dsVeri.Tables[0].Rows[0]["userid"]);
                    objSS.UserId = Convert.ToInt32(Session["empinfoid"]);
                    objSS.SaveData();
                    //Session["id"] = dsVeri.Tables[0].Rows[0]["userid"].ToString();

                    EVA.Utilities.MessageBox("Information validated. Click on Continue to proceed with Verification.", Page);
                    trContd.Visible = true;
                    trValid.Visible = false;
                    Enable(false);
                /*}
                else
                {
                    EVA.Utilities.MessageBox("Employee has not been registered with EV Advantage.", Page);
                    trContd.Visible = false;
                    trValid.Visible = true;
                    Enable(true);
                }*/
            

        }
        else
        {
            EVA.Utilities.MessageBox("Could not find the desired employee.  Please check SSN and Company.", Page);
            trContd.Visible = false;
            trValid.Visible = true;
            Enable(true);
        }
    }
    private EmpInfo PrepareParameterEmpInfo()
    {
        objEmpInfo = new EmpInfo();

        //SK | Oct 05 2009->Start
        //string ssn = txtSSN.Text;
        //string ss = ssn.Substring(0, 3) + ssn.Substring(4, 2) + ssn.Substring(7, 4);
        string ss = txtSSN.Text;
        //string ss = ssn.Substring(0, 3) + ssn.Substring(4, 2) + ssn.Substring(7, 4);
        //SK | Oct 05 2009->End

        objEmpInfo.SSN = ss;
        objEmpInfo.CompanyId = Convert.ToInt32(ddlCompany.SelectedValue);


        return objEmpInfo;
    }
    protected void btnContinue_Click(object sender, EventArgs e)
    {
        Session["payment"] = "Y";
        Response.Redirect("socialServices.aspx");
    }
    protected void btnCancel_Click(object sender, EventArgs e)
    {
        trContd.Visible = false;
        trValid.Visible = true;
        Enable(true);
    }
    private void Enable(bool status)
    {
        ddlCompany.Enabled = status;       
        txtSSN.Enabled = status;
    }

}
