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
using System.Xml;

public partial class Admin_verification : System.Web.UI.Page
{
    CreateEmp objEmp = new CreateEmp();
    EmpInfo objEmpInfo = new EmpInfo();
    AuthCode objAuth = new AuthCode();
    Verify objVeri = new Verify();
    ssverify objSS = new ssverify();
    XmlDocument xmlDoc;
    protected void Page_Load(object sender, EventArgs e)
    {
        Response.Cache.SetCacheability(HttpCacheability.NoCache);


        LinkButton lnk = (LinkButton)Master.FindControl("lnkVerification");
        lnk.Font.Bold = true;
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
        DataSet ds = new DataSet();
        DataTable dt = new DataTable();

        DataColumn dc = new DataColumn("Type");
        DataColumn dc1 = new DataColumn("TypeId");
        dt.Columns.Add(dc);
        dt.Columns.Add(dc1);

        DataRow dr = dt.NewRow();
        dr[dc] = "Employment Only";
        dr[dc1] = "1";
        dt.Rows.Add(dr);

        dr = dt.NewRow();
        dr[dc] = "Employment + Salary";
        dr[dc1] = "2";
        dt.Rows.Add(dr);

        dr = dt.NewRow();
        dr[dc] = "Social Service";
        dr[dc1] = "3";
        dt.Rows.Add(dr);
        /* this condition ensures that Manual social service option is available to admin user only */
        if (Session["type"] != null) 
        {
            if (Session["type"].ToString() == "0")
            {
                dr = dt.NewRow();
                dr[dc] = "Manual Social Service";
                dr[dc1] = "4";
                dt.Rows.Add(dr);
            }
            
        }
        

        ds.Tables.Add(dt);

        ops.evadvantage.Utilities.BindDropDownList(ddlType, ds, "Type", "TypeId");
        ops.evadvantage.Utilities.BindDropDownList(ddlCompany, objEmp.GetCompany(), "CompanyName", "CompanyId");
    }
    protected void btnValidate_Click(object sender, EventArgs e)
    {
        objEmpInfo = PrepareParameterEmpInfo();
        Session["ssn"] = txtSSN.Text;
        //Session["ssn"] =  txtSSN.Text.Trim();
        DataSet dsEmp = objEmpInfo.GetEmpInfoBySsn();
        if (dsEmp.Tables[0].Rows.Count != 0)
        {
            if (ddlType.SelectedValue == "1")
            {
                Session["empinfoid"] = dsEmp.Tables[0].Rows[0]["EmpInfoId"].ToString();

                objEmp.SSN = txtSSN.Text;
                //objEmp.SSN = txtSSN.Text.Trim();
                DataSet dsVeri = objEmp.GetUserId();
                if (dsVeri.Tables[0].Rows.Count != 0)
                {

                    if (chkCC.Checked == true)
                    {
                        Session["id"] = dsVeri.Tables[0].Rows[0]["userid"].ToString();
                        Session["company"] = txtCompany.Text;
                    }
                    else
                    {
                        objVeri.VerifierId = Convert.ToInt32(Session["userid"]);
                        objVeri.VerifierDate = DateTime.Now;
                        objVeri.UserId = Convert.ToInt32(dsVeri.Tables[0].Rows[0]["userid"]);
                        objVeri.Company = txtCompany.Text;
                        if (chkCC.Checked == true) { objVeri.IsCreditCard = "Y"; } else { objVeri.IsCreditCard = "N"; }
                        objVeri.SaveData();
                    }


                    ops.evadvantage.Utilities.MessageBox("Information validated. Click on Continue to proceed with Verification.", Page);
                    trContd.Visible = true;
                    trValid.Visible = false;
                    Enable(false);
                }
                else
                {
                    Session["company"] = txtCompany.Text;
                    ops.evadvantage.Utilities.MessageBox("Information validated. Click on Continue to proceed with Verification.", Page);
                    trContd.Visible = true;
                    trValid.Visible = false;
                    Enable(false);
                    //EVA.Utilities.MessageBox("Employee has not been registered with EV Advantage.", Page);
                    //trContd.Visible = false;
                    //trValid.Visible = true;
                    //Enable(true);
                }
            }
            else if (ddlType.SelectedValue == "3" || ddlType.SelectedValue == "4")
            {
                Session["empinfoid"] = dsEmp.Tables[0].Rows[0]["EmpInfoId"].ToString();

                objEmp.SSN = txtSSN.Text;
                //objEmp.SSN = txtSSN.Text.Trim();
                DataSet dsVeri = objEmp.GetUserId();
                if (dsVeri.Tables[0].Rows.Count != 0)
                {


                    objSS.SSVerifierId = Convert.ToInt32(Session["userid"]);
                    objSS.SSVerifierDate = DateTime.Now;
                    objSS.UserId = Convert.ToInt32(dsVeri.Tables[0].Rows[0]["userid"]);
                    objSS.VerType = Convert.ToInt32(ddlType.SelectedValue);
                    objSS.SaveData();
                    //Session["id"] = dsVeri.Tables[0].Rows[0]["userid"].ToString();

                    ops.evadvantage.Utilities.MessageBox("Information validated. Click on Continue to proceed with Verification.", Page);
                    trContd.Visible = true;
                    trValid.Visible = false;
                    Enable(false);
                }
                else
                {

                    ops.evadvantage.Utilities.MessageBox("Information validated. Click on Continue to proceed with Verification.", Page);
                    trContd.Visible = true;
                    trValid.Visible = false;
                    Enable(false);

                }
            }
            else
            {

                if (!String.IsNullOrEmpty(txtKey.Text))
                {
                    //21809
                    objAuth.AuthCodeNo = txtKey.Text;
                    //DataSet dsAuth = objAuth.CheckAuthCode(txtSSN.Text.Trim(), Convert.ToInt32(ddlCompany.SelectedValue));
                    DataSet dsAuth = objAuth.CheckAuthCode(txtSSN.Text, Convert.ToInt32(ddlCompany.SelectedValue));
                    if (dsAuth.Tables[0].Rows.Count != 0)
                    {
                        if (dsAuth.Tables[0].Rows[0]["status"].ToString() == "E")
                        {
                            if (chkCC.Checked == true)
                            {
                                Session["AuthCodeId"] = dsAuth.Tables[0].Rows[0]["AuthCodeId"].ToString();
                                Session["Comp"] = txtCompany.Text;
                            }
                            else
                            {
                                objAuth = PrepareParameterForAuthCode();
                                objAuth.AuthCodeId = Convert.ToInt32(dsAuth.Tables[0].Rows[0]["AuthCodeId"]);
                                objAuth.Company = txtCompany.Text;
                                if (chkCC.Checked == true) { objAuth.IsCreditCard = "Y"; } else { objAuth.IsCreditCard = "N"; }
                                objAuth.UpdateDataByVerifier();

                            }


                            Session["empinfoid"] = dsEmp.Tables[0].Rows[0]["EmpInfoId"].ToString();

                            //DataSet dsVeri = objEmp.GetUserId();
                            //if (dsVeri.Tables[0].Rows.Count != 0)
                            //{
                            //    //DataSet dsVeri = objEmp.GetUserId();
                            //    objAuth = PrepareParameterForAuthCode();
                            //    objAuth.AuthCodeId = Convert.ToInt32(dsAuth.Tables[0].Rows[0]["AuthCodeId"]);
                            //    objAuth.Company = txtCompany.Text;
                            //    if (chkCC.Checked == true) { objAuth.IsCreditCard = "Y"; } else { objAuth.IsCreditCard = "N"; }

                            //    //objAuth.VerifierId = Convert.ToInt32(Session["userid"]);
                            //    //objAuth.VerifierDate = DateTime.Now;
                            //    //objAuth.UserId = Convert.ToInt32(dsVeri.Tables[0].Rows[0]["userid"]);
                            //    //objAuth.Company = txtCompany.Text;
                            //    //if (chkCC.Checked == true) { objAuth.IsCreditCard = "Y"; } else { objAuth.IsCreditCard = "N"; }
                            //    objAuth.SaveData();
                            //    EVA.Utilities.MessageBox("Information validated. Click on Continue to proceed with Verification.", Page);
                            //    trContd.Visible = true;
                            //    trValid.Visible = false;
                            //    Enable(false);
                            //}
                            //else
                            //{

                            ops.evadvantage.Utilities.MessageBox("Information validated. Click on Continue to proceed with Verification.", Page);
                            trContd.Visible = true;
                            trValid.Visible = false;
                            Enable(false);
                            //}
                        }
                        else if (dsAuth.Tables[0].Rows[0]["status"].ToString() == "D")
                        {
                            ops.evadvantage.Utilities.MessageBox("Salary Authorization Code has been disable.", Page);
                            trContd.Visible = false;
                            trValid.Visible = true;
                            Enable(true);
                        }
                        else if (dsAuth.Tables[0].Rows[0]["status"].ToString() == "U")
                        {
                            ops.evadvantage.Utilities.MessageBox("Salary Authorization Code has been already used.", Page);
                            trContd.Visible = false;
                            trValid.Visible = true;
                            Enable(true);
                        }
                        else if (dsAuth.Tables[0].Rows[0]["status"].ToString() == "X")
                        {
                            ops.evadvantage.Utilities.MessageBox("Salary Authorization Code has been expired.", Page);
                            trContd.Visible = false;
                            trValid.Visible = true;
                            Enable(true);
                        }
                    }
                    else
                    {
                        ops.evadvantage.Utilities.MessageBox("Could not find Salary Authorization code. Please check Salary Authorization code.", Page);
                        trContd.Visible = false;
                        trValid.Visible = true;
                        Enable(true);
                    }// 
                }
                else
                {
                    //What if it is empty?
                    AuthCode ac = new AuthCode();
                    ac.Company = txtCompany.Text;
                    if (chkCC.Checked == true) { ac.IsCreditCard = "Y"; } else { ac.IsCreditCard = "N"; }
                    //ac.UpdateDataByVerifier();

                    Session["empinfoid"] = dsEmp.Tables[0].Rows[0]["EmpInfoId"].ToString();
                    //objEmp.SSN = txtSSN.Text;
                    //DataSet dsVeri = objEmp.GetUserId();
                    //if (dsVeri.Tables[0].Rows.Count != 0)
                    //{
                    //    //DataSet dsVeri = objEmp.GetUserId();
                    //    DataSet dsAuth = objAuth.CheckAuthCode(txtSSN.Text, Convert.ToInt32(ddlCompany.SelectedValue));
                    //    objAuth = PrepareParameterForAuthCode();
                    //    objAuth.AuthCodeId = Convert.ToInt32(dsAuth.Tables[0].Rows[0]["AuthCodeId"]);
                    //    objAuth.Company = txtCompany.Text;
                    //    if (chkCC.Checked == true) { objAuth.IsCreditCard = "Y"; } else { objAuth.IsCreditCard = "N"; }

                    //    //objAuth.VerifierId = Convert.ToInt32(Session["userid"]);
                    //    //objAuth.VerifierDate = DateTime.Now;
                    //    //objAuth.UserId = Convert.ToInt32(dsVeri.Tables[0].Rows[0]["userid"]);
                    //    //objAuth.Company = txtCompany.Text;
                    //    //if (chkCC.Checked == true) { objAuth.IsCreditCard = "Y"; } else { objAuth.IsCreditCard = "N"; }
                    //    objAuth.SaveData();

                    //    EVA.Utilities.MessageBox("Information validated. Click on Continue to proceed with Verification.", Page);
                    //    trContd.Visible = true;
                    //    trValid.Visible = false;
                    //    Enable(false);
                    //}
                    //else
                    //{

                    ops.evadvantage.Utilities.MessageBox("Information validated. Click on Continue to proceed with Verification.", Page);
                    trContd.Visible = true;
                    trValid.Visible = false;
                    Enable(false);
                    //}


                    //ac.SaveDataVerify();
                    //EVA.Utilities.MessageBox("Information validated. Click on Continue to proceed with Verification.", Page);
                    //trContd.Visible = true;
                    //trValid.Visible = false;
                    //Enable(false);
                }
            }

        }
        else
        {
            ops.evadvantage.Utilities.MessageBox("Could not find the desired employee.  Please check SSN and Company.", Page);
            trContd.Visible = false;
            trValid.Visible = true;
            Enable(true);
        }
    }
    private AuthCode PrepareParameterForAuthCode()
    {
        objAuth = new AuthCode();
        objAuth.UserId = Convert.ToInt32(Session["userid"]);
        objAuth.Status = "U";
        objAuth.ExpiredDate = DateTime.Now;

        return objAuth;
    }
    private EmpInfo PrepareParameterEmpInfo()
    {
        objEmpInfo = new EmpInfo();
        string ssn = txtSSN.Text;
        //string ssn = txtSSN.Text.Trim();
        string ss = ssn.Substring(0, 3) + ssn.Substring(4, 2) + ssn.Substring(7, 4);

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
        chkCC.Enabled = status;
        txtCompany.Enabled = status;
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
    protected void btnContinue_Click(object sender, EventArgs e)
    {

        xmlDoc = new XmlDocument();
        xmlDoc.Load(Server.MapPath("xml/price.xml"));

        if (ddlType.SelectedValue == "1")
        {
            Session["price"] = GetXML("Employment");
            Session["vertype"] = "1";
        }
        else if (ddlType.SelectedValue == "3")
        {
            Session["vertype"] = "3";
            Session["payment"] = "Y";
        }
        else if (ddlType.SelectedValue == "4")
        {
            Session["vertype"] = "4";
            Session["payment"] = "Y";
        }
        else
        {
            Session["price"] = GetXML("EmploymentSalary");
            Session["vertype"] = "2";
        }

        if (chkCC.Checked == true)
        {
            Response.Redirect("../authorizeNet.aspx?from=admin");
        }
        else
        {
            Session["payment"] = "Y";

            if (Session["vertype"].ToString() == "2")
            {
                ////////////////////
                objAuth.ExpiredDate = DateTime.Now;
                objAuth.VerifyId = Convert.ToInt32(Session["userid"]);
                objAuth.Company = txtCompany.Text;
                objAuth.IsCreditCard = "N";
                objAuth.SSN = txtSSN.Text.Trim().Replace("-","");
                objAuth.SaveDataFromAdmin();
                /////////////////////////////
                //Response.Redirect("../EmploymentSalary.aspx?from=admin");
                Response.Redirect("../Report/VFRPT.aspx?from=admin");
            }
            else if (Session["vertype"].ToString() == "3")
            {
                objSS.SSVerifierId = Convert.ToInt32(Session["userid"]);
                objSS.SSVerifierDate = DateTime.Now;
                objSS.UserId = Convert.ToInt32(Session["empinfoid"]);
                objSS.VerType = Convert.ToInt32(Session["vertype"]);
                objSS.SaveData();

                //Response.Redirect("../SocialService/socialServices.aspx?from=admin");
                Response.Redirect("../Report/SSRPT.aspx?from=admin");
            }
            else if (Session["vertype"].ToString() == "4")
            {
                objSS.SSVerifierId = Convert.ToInt32(Session["userid"]);
                objSS.SSVerifierDate = DateTime.Now;
                objSS.UserId = Convert.ToInt32(Session["empinfoid"]);
                objSS.VerType = Convert.ToInt32(Session["vertype"]);
                objSS.SaveData();

                //Response.Redirect("../SocialService/socialServices.aspx?from=admin");
                Response.Redirect("../Report/MSSRPT.aspx?from=admin");
            }
            else
            {
                ////////////////////////
                objVeri.VerifierId = Convert.ToInt32(Session["userid"]);
                objVeri.VerifierDate = DateTime.Now;
                objVeri.UserId = Convert.ToInt32(Session["EmpInfoId"]);
                if (Request.QueryString["from"] != null)
                {
                    objVeri.Company = Session["company"].ToString();
                    objVeri.IsCreditCard = "N";
                }
                objVeri.SaveData();
                ////////////////////////////
                //Response.Redirect("../employment.aspx?from=admin");
                Response.Redirect("../Report/EMPRPT.aspx?from=admin");
            }
        }
    }
    protected void btnCancel_Click(object sender, EventArgs e)
    {
        trContd.Visible = false;
        trValid.Visible = true;
        Enable(true);
    }
    protected void ddlType_SelectedIndexChanged(object sender, EventArgs e)
    {
        if (ddlType.SelectedValue == "1")// || ddlType.SelectedValue == "3")
        {
            txtKey.Text = String.Empty;
            txtKey.Enabled = false;
            trKey.Visible = false;
            trCC.Visible = true;
        }
        else if (ddlType.SelectedValue == "2")
        {
            txtKey.Text = String.Empty;
            txtKey.Enabled = true;
            trKey.Visible = true;
            trCC.Visible = true;
        }
        else if (ddlType.SelectedValue == "3")
        {
            txtKey.Text = String.Empty;
            txtKey.Enabled = false;
            trKey.Visible = false;
            trCC.Visible = false;
        }
        else if (ddlType.SelectedValue == "4")
        {
            txtKey.Text = String.Empty;
            txtKey.Enabled = false;
            trKey.Visible = false;
            trCC.Visible = false;
        }
        else
        {
            txtKey.Text = String.Empty;
            txtKey.Enabled = false;
            trKey.Visible = true;
        }
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
    protected void ddlCompany_SelectedIndexChanged(object sender, EventArgs e)
    {
        //2015-03-23: Employment Only for 'Bebe Stores' Company
        if (ddlCompany.SelectedItem.Value == "33")
        {
            ddlType.Items.FindByValue("0").Enabled = false;
            ddlType.Items.FindByValue("2").Enabled = false;
            ddlType.Items.FindByValue("3").Enabled = false;
            ddlType.Items.FindByValue("4").Enabled = false;

            ddlType.SelectedIndex = 1;
        }
        else
        {
            ddlType.Items.FindByValue("0").Enabled = true;
            ddlType.Items.FindByValue("2").Enabled = true;
            ddlType.Items.FindByValue("3").Enabled = true;
            ddlType.Items.FindByValue("4").Enabled = true;

            ddlType.SelectedIndex = 0;
        }

        this.ddlType_SelectedIndexChanged(sender, e);
    }
}
