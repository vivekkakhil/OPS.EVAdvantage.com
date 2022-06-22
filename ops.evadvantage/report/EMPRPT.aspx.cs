using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using EVA.BLL;

public partial class VFRPT : System.Web.UI.Page
{

    EmpInfo objEmpInfo = new EmpInfo();
    protected void Page_Load(object sender, EventArgs e)
    {

        Response.Cache.SetCacheability(HttpCacheability.NoCache);
        string tempssn = Session["ssn"].ToString();
        if (tempssn.Contains("-"))
            objEmpInfo.SSN = tempssn.Substring(0, 3) + tempssn.Substring(4, 2) + tempssn.Substring(7, 4);
        else
            objEmpInfo.SSN = tempssn;

        if (Session["user"] == null)
        {
            Response.Redirect("index.aspx");
        }

        try
        {
            if (Session["payment"] != null)
            {
                lblVarificationIssDt.Text = DateTime.Now.ToString("MM/dd/yyyy");
               // lbltype.Text = "Employment and Salary";
                lblVarificationFor.Text = "Employment";

                //lblRefrenceNo.Text = "abc REF NO";
                
               // lblNote.Text = "None";

                ////objEmpInfo.SSN = Session["ssn"].ToString();
                objEmpInfo.EmpInfoId = Convert.ToInt32(Session["empinfoid"]);
                DataSet ds = objEmpInfo.GetInfoById();

                //lblname.Text = ds.Tables[0].Rows[0]["FirstName"].ToString() + " " + ds.Tables[0].Rows[0]["LastName"].ToString();
                lblfname.Text = ds.Tables[0].Rows[0]["FirstName"].ToString();
                lblLast.Text = ds.Tables[0].Rows[0]["LastName"].ToString();


                // lblinfo.Text = Convert.ToDateTime(ds.Tables[0].Rows[0]["UploadDt"]).ToString("MM/dd/yyyy");
                lblInformationCurrentasofDT.Text = Convert.ToDateTime(ds.Tables[0].Rows[0]["UploadDt"]).ToString("MM/dd/yyyy");
                //lblemployer.Text = ds.Tables[0].Rows[0]["CompanyName"].ToString();
                lblEmployer.Text = ds.Tables[0].Rows[0]["CompanyName"].ToString();
                // lblemployeradd.Text = "N/A";
                lblEmployerAddress.Text = "N/A"; // as old mentioned 
                // lblempfn.Text = ds.Tables[0].Rows[0]["FirstName"].ToString();
                lblfname.Text = ds.Tables[0].Rows[0]["FirstName"].ToString();

                // lblempmn.Text = ds.Tables[0].Rows[0]["MiddleName"].ToString();
                lblMiddle.Text = ds.Tables[0].Rows[0]["MiddleName"].ToString();

                //lblempln.Text = ds.Tables[0].Rows[0]["LastName"].ToString();
                lblLast.Text = ds.Tables[0].Rows[0]["LastName"].ToString();

                // lblempbd.Text = ds.Tables[0].Rows[0]["DateOfBirth"].ToString().Substring(4, 2) + "/" + ds.Tables[0].Rows[0]["DateOfBirth"].ToString().Substring(6, 2) + "/" + ds.Tables[0].Rows[0]["DateOfBirth"].ToString().Substring(0, 4);

                lblDOB.Text = ds.Tables[0].Rows[0]["DateOfBirth"].ToString().Substring(4, 2) + "/" + ds.Tables[0].Rows[0]["DateOfBirth"].ToString().Substring(6, 2) + "/" + ds.Tables[0].Rows[0]["DateOfBirth"].ToString().Substring(0, 4);

                lblSSN.Text = ds.Tables[0].Rows[0]["SSN"].ToString().Substring(0, 3) + "-" + ds.Tables[0].Rows[0]["SSN"].ToString().Substring(3, 2) + "-" + ds.Tables[0].Rows[0]["SSN"].ToString().Substring(5, 4);
                //lblempid.Text = ds.Tables[0].Rows[0]["EmployeeId"].ToString();
                lblEmpID.Text = ds.Tables[0].Rows[0]["EmployeeId"].ToString();
                lblState.Text = ds.Tables[0].Rows[0]["EmpState"].ToString(); //new by jawaid
                lblStateCode.Text = ds.Tables[0].Rows[0]["StateCode"].ToString(); //new by jawaid
                lblCity.Text = ds.Tables[0].Rows[0]["EmpCity"].ToString(); //new by jawaid
                lblZip.Text = ds.Tables[0].Rows[0]["EmpZipCode"].ToString();
                lblEmployeddAddress.Text = ds.Tables[0].Rows[0]["EmpAdd1"].ToString();
                lblAddress2.Text = ds.Tables[0].Rows[0]["EmpAdd2"].ToString();
                lblFID.Text = ds.Tables[0].Rows[0]["FederalId"].ToString();
                lblLocationCode.Text = ds.Tables[0].Rows[0]["LocationCode"].ToString();
                lblEmpPhone.Text = ds.Tables[0].Rows[0]["EmpPhoneNo"].ToString();
                lblCurrentSuperViisor.Text = ds.Tables[0].Rows[0]["SupervisorName"].ToString();
                lbltitle.Text = ds.Tables[0].Rows[0]["EmpTitle"].ToString();
                lblJobTitle.Text = ds.Tables[0].Rows[0]["JobTitle"].ToString();
				
				if(!String.IsNullOrEmpty(Convert.ToString(ds.Tables[0].Rows[0]["OriginalSepDate"])))
					LblOrignalSeprationDt.Text = ds.Tables[0].Rows[0]["OriginalSepDate"].ToString().Substring(4, 2) + "/" + ds.Tables[0].Rows[0]["OriginalSepDate"].ToString().Substring(6, 2) + "/" + ds.Tables[0].Rows[0]["OriginalSepDate"].ToString().Substring(0, 4);
                if (!String.IsNullOrEmpty(Convert.ToString(ds.Tables[0].Rows[0]["LastDayWorkDt"])))
                 lblLastDayworked.Text = ds.Tables[0].Rows[0]["LastDayWorkDt"].ToString().Substring(4, 2) + "/" + ds.Tables[0].Rows[0]["LastDayWorkDt"].ToString().Substring(6, 2) + "/" + ds.Tables[0].Rows[0]["LastDayWorkDt"].ToString().Substring(0, 4);



                if (ds.Tables[0].Rows[0]["EmpStatus"].ToString() == "A")
                {
                    lblEmpStatus.Text = "Active";
                }
                else if (ds.Tables[0].Rows[0]["EmpStatus"].ToString() == "L")
                {
                    lblEmpStatus.Text = "LOA";
                }
                else if (ds.Tables[0].Rows[0]["EmpStatus"].ToString() == "T")
                {
                    lblEmpStatus.Text = "Terminated";
                }
                else if (ds.Tables[0].Rows[0]["EmpStatus"].ToString() == "S")
                {
                    lblEmpStatus.Text = "Separated";
                }
                else if (ds.Tables[0].Rows[0]["EmpStatus"].ToString() == "R")
                {
                    lblEmpStatus.Text = "Retired";
                }
                else if (ds.Tables[0].Rows[0]["EmpStatus"].ToString() == "I")
                {
                    lblEmpStatus.Text = "Inactive";

                }
                else
                {
                    lblEmpStatus.Text = ds.Tables[0].Rows[0]["EmpStatus"].ToString();
                }

                if (ds.Tables[0].Rows[0]["JobStatus"].ToString() == "F")
                {
                    lblJobStatus.Text = "Full-Time";

                }
                else if (ds.Tables[0].Rows[0]["JobStatus"].ToString() == "P")
                {
                    lblJobStatus.Text = "Part-Time";
                }
                else
                {
                    lblJobStatus.Text = ds.Tables[0].Rows[0]["JobStatus"].ToString();
                }


                if (ds.Tables[0].Rows[0]["OriginalHireDate"] != null && ds.Tables[0].Rows[0]["OriginalHireDate"].ToString() != "")
                {

                    string y1 = ds.Tables[0].Rows[0]["OriginalHireDate"].ToString().Substring(0, 4);
                    string m1 = ds.Tables[0].Rows[0]["OriginalHireDate"].ToString().Substring(4, 2);
                    string d1 = ds.Tables[0].Rows[0]["OriginalHireDate"].ToString().Substring(6, 2);
                    // lblphdt.Text = m1 + "/" + d1 + "/" + y1;
                    lblOrignalHireDate.Text = m1 + "/" + d1 + "/" + y1;
                }

                if (ds.Tables[0].Rows[0]["RecentHireDate"] != null && ds.Tables[0].Rows[0]["RecentHireDate"].ToString() != "")
                {
                    try
                    {
                        string y = ds.Tables[0].Rows[0]["RecentHireDate"].ToString().Substring(0, 4);
                        string m = ds.Tables[0].Rows[0]["RecentHireDate"].ToString().Substring(4, 2);
                        string d = ds.Tables[0].Rows[0]["RecentHireDate"].ToString().Substring(6, 2);
                        // lblrhdt.Text = m + "/" + d + "/" + y;
                        lblMostRHD.Text = m + "/" + d + "/" + y;

                        TimeSpan ts = Convert.ToDateTime(lblVarificationIssDt.Text).Subtract(Convert.ToDateTime(lblMostRHD.Text));
                        DateTime exp = DateTime.MinValue + ts;

                        int years = exp.Year - 1;
                        int month = exp.Month - 1;
                        // lblyears.Text = years.ToString() + "." + month.ToString();
                        lblTotalTime.Text = years.ToString() + "." + month.ToString();

                    }
                    catch { }
                }
                else
                {

                }



                lbltitle.Text = ds.Tables[0].Rows[0]["EmpTitle"].ToString();

            }
            else
            {
                //Response.Redirect("veriHome.aspx");
                if (Request.QueryString["from"] != null)
                {
                    Response.Redirect("Admin/verification.aspx");
                }
                else
                {
                    Response.Redirect("veriHome.aspx");
                }
            }
        }
        catch (Exception ex)
        {
            Response.Write("<br>" + "Source : " + ex.Source);
            Response.Write("<br>" + "Message : " + ex.Message);
            Response.Write("<br>" + "StackTrace : " + ex.StackTrace);
           
        }
    }
    private string GetAmount(string amt)
    {
        int main = Convert.ToInt32(amt.Substring(0, 7));
        string sub = amt.Substring(7, 2);

        return "$ " + main.ToString() + "." + sub;
    }

    private string GetFrequencyCode(string code)
    {
        if (code == "1")
        {
            return "Weekly";
        }
        else if (code == "2")
        {
            return "Bi-weekly";
        }
        else if (code == "3")
        {
            return "Semi-monthly";
        }
        else if (code == "4")
        {
            return "Monthly";
        }
        else if (code == "5")
        {
            return "Quarterly";
        }
        else
        {
            return code;
        }
    }
    protected void BtnOk_Click(object sender, EventArgs e)
    {
        Session["payment"] = null;
        if (Request.QueryString["from"] != null)
        {
            Response.Redirect("../admin/verification.aspx");
        }
        else
        {
            Response.Redirect("../veriHome.aspx");
        }

    }

}