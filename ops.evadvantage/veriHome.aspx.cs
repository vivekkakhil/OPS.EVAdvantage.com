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
using System.Xml;

public partial class veriHome : System.Web.UI.Page
{
    CreateEmp objEmp = new CreateEmp();
    EmpInfo objEmpInfo = new EmpInfo();
    AuthCode objAuth = new AuthCode();
    Verify objVeri = new Verify();
    XmlDocument xmlDoc;

    protected void Page_Load(object sender, EventArgs e)
    {
        Response.Cache.SetCacheability(HttpCacheability.NoCache);
        if (Session["user"] == null)
        {
            Response.Redirect("index.aspx");
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
        DataSet ds = new DataSet();
        DataTable dt = new DataTable();
       
        DataColumn dc = new DataColumn("Type");
        DataColumn dc1 = new DataColumn("TypeId");
        dt.Columns.Add(dc);
        dt.Columns.Add(dc1);

        DataRow dr=dt.NewRow();
        dr[dc] = "Employment Only";
        dr[dc1] = "1";

        DataRow dr1 = dt.NewRow();
        dr1[dc] = "Employment + Salary";
        dr1[dc1] = "2";

        dt.Rows.Add(dr);
        dt.Rows.Add(dr1);
        ds.Tables.Add(dt);
        
        EVA.Utilities.BindDropDownList(ddlType, ds, "Type", "TypeId");
        EVA.Utilities.BindDropDownList(ddlCompany, objEmp.GetCompany(), "CompanyName", "CompanyId");
    }
    protected void lnkEdit_Click(object sender, EventArgs e)
    {
        Response.Redirect("editVerifier.aspx");
    }


    protected void ddlType_SelectedIndexChanged(object sender, EventArgs e)
    {
        if (ddlType.SelectedValue == "1")
        {
            txtKey.Text = String.Empty;
            txtKey.Enabled = false;
            trKey.Visible = false;
        }
        else if (ddlType.SelectedValue == "2")
        {
            txtKey.Text = String.Empty;
            txtKey.Enabled = true;
            trKey.Visible = true;
        }
        else
        {
            txtKey.Text = String.Empty;
            txtKey.Enabled = false;
            trKey.Visible = true;
        }
    }
    protected void btnClear_Click(object sender, EventArgs e)
    {
        ClearControl();
    }
    private void ClearControl()
    {
        txtKey.Text = String.Empty;
        txtSSN.Text = String.Empty;
        ddlType.SelectedValue = "0";
        ddlCompany.SelectedValue = "0";
    }
    protected void btnValidate_Click(object sender, EventArgs e)
    {
		Session["ssn"] = txtSSN.Text;
        objEmpInfo = PrepareParameterEmpInfo();
        DataSet dsEmp = objEmpInfo.GetEmpInfoBySsn();
        if (dsEmp.Tables[0].Rows.Count != 0)
        {
            if (ddlType.SelectedValue == "1")
            {
                Session["empinfoid"] = dsEmp.Tables[0].Rows[0]["EmpInfoId"].ToString();
                
                objEmp.SSN = txtSSN.Text;
                DataSet dsVeri= objEmp.GetUserId();
                //if(dsVeri.Tables[0].Rows.Count!=0)
                //{
                    //objVeri.VerifierId=Convert.ToInt32(Session["userid"]);
                    //objVeri.VerifierDate=DateTime.Now;
                    //objVeri.UserId=Convert.ToInt32(dsVeri.Tables[0].Rows[0]["userid"]);
                    //objVeri.SaveData();
                    //Session["id"] = dsVeri.Tables[0].Rows[0]["userid"].ToString();


                    EVA.Utilities.MessageBox("Information validated. Click on Continue to proceed with Verification.", Page);
                    trContd.Visible = true;
                    trValid.Visible = false;
                    Enable(false);
                //}
                /*else
                {
                     EVA.Utilities.MessageBox("Employee has not been registered with EV Advantage.", Page);
                     trContd.Visible = false;
                     trValid.Visible = true;
                     Enable(true);
                }*/
            }
            else
            {
                objAuth.AuthCodeNo = txtKey.Text;
                DataSet dsAuth = objAuth.CheckAuthCode(txtSSN.Text, Convert.ToInt32(ddlCompany.SelectedValue));

                if (dsAuth.Tables[0].Rows.Count != 0)
                {
                    if (dsAuth.Tables[0].Rows[0]["status"].ToString() == "E")
                    {
                        //objAuth = PrepareParameterForAuthCode();
                        //objAuth.AuthCodeId=Convert.ToInt32(dsAuth.Tables[0].Rows[0]["AuthCodeId"]);
                        //objAuth.UpdateDataByVerifier();
                        Session["AuthCodeId"] = dsAuth.Tables[0].Rows[0]["AuthCodeId"].ToString();

                        Session["empinfoid"] = dsEmp.Tables[0].Rows[0]["EmpInfoId"].ToString();

                        EVA.Utilities.MessageBox("Information validated. Click on Continue to proceed with Verification.", Page);
                        trContd.Visible = true;
                        trValid.Visible = false;
                        Enable(false);
                    }
                    else if (dsAuth.Tables[0].Rows[0]["status"].ToString() == "D")
                    {
                        EVA.Utilities.MessageBox("Salary Authorization Code has been disable.", Page);
                        trContd.Visible = false;
                        trValid.Visible = true;
                        Enable(true);
                    }
                    else if (dsAuth.Tables[0].Rows[0]["status"].ToString() == "U")
                    {
                        EVA.Utilities.MessageBox("Salary Authorization Code has been already used.", Page);
                        trContd.Visible = false;
                        trValid.Visible = true;
                        Enable(true);
                    }
                    else if (dsAuth.Tables[0].Rows[0]["status"].ToString() == "X")
                    {
                        EVA.Utilities.MessageBox("Salary Authorization Code has been expired.", Page);
                        trContd.Visible = false;
                        trValid.Visible = true;
                        Enable(true);
                    }
                }
                else
                {
                    EVA.Utilities.MessageBox("Could not find Salary Authorization code. Please check Salary Authorization code.", Page);
                    trContd.Visible = false;
                    trValid.Visible = true;
                    Enable(true);
                }
            }
            
        }
        else
        {
            EVA.Utilities.MessageBox("Could not find the desired employee.  Please check SSN and Company.", Page);
            trContd.Visible = false;
            trValid.Visible = true;
            Enable(true);
        }
    }
    //private AuthCode PrepareParameterForAuthCode()
    //{
    //    objAuth = new AuthCode();
    //    objAuth.UserId =Convert.ToInt32( Session["userid"]);
    //    objAuth.Status = "U";
    //    objAuth.ExpiredDate = DateTime.Now;

    //    return objAuth;
    //}
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
    private void Enable(bool status)
    {
        ddlCompany.Enabled = status;
        ddlType.Enabled = status;
        txtKey.Enabled = status;
        txtSSN.Enabled = status;
    }

    protected void btnCancel_Click(object sender, EventArgs e)
    {
        trContd.Visible = false;
        trValid.Visible = true;
        Enable(true);
    }
    protected void btnContinue_Click(object sender, EventArgs e)    
    {
        xmlDoc = new XmlDocument();
        xmlDoc.Load(Server.MapPath("Admin/xml/price.xml"));

        if (ddlType.SelectedValue == "1")
        {
            Session["price"] = GetXML("Employment");
            Session["vertype"] = "1";
        }
        else
        {
            Session["price"] = GetXML("EmploymentSalary");
            Session["vertype"] = "2";
        }

        Response.Redirect("authorizeNet.aspx");
       // Response.Redirect("employment.aspx");
    }
    private string GetXML(string nodename)
    {
        XmlNodeList emp;
        emp = xmlDoc.SelectNodes("//" + nodename + "");

        foreach (XmlElement item in emp)
        {
            return item.GetAttribute("cost");
        }
        return "";
    }
}
