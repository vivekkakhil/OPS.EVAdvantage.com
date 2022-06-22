using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using EVA.BLL;
using System.Data;
using EVA;

public partial class report_MSSRPT : System.Web.UI.Page
{
    EmpInfo objEmpInfo = new EmpInfo();
    Utilities utility = new Utilities();
    EmpInfo objRep = new EmpInfo();
    static string EmpSSN = "";
    static int count = 0;
    protected void Page_Load(object sender, EventArgs e)
    {
        /* this condition ensures that manual social service report is accesssible only by admin user only */

        if (Session["type"] != null)
        {
            if (Session["type"].ToString() != "0")
            {
                Response.Redirect("../admin/Login.aspx");
            }
        }
        else 
        {
            Response.Redirect("../admin/Login.aspx");
        }
        Response.Cache.SetCacheability(HttpCacheability.NoCache);
        if (Session["ssn"] == null)
        {
            Response.Redirect("../admin/verification.aspx");
        }
        string tempssn = Session["ssn"].ToString();
        
        if (tempssn.Contains("-"))
            objEmpInfo.SSN = tempssn.Substring(0, 3) + tempssn.Substring(4, 2) + tempssn.Substring(7, 4);
        else
            objEmpInfo.SSN = tempssn;

        if (Session["user"] == null)
        {
            Response.Redirect("../admin/Login.aspx");
        }

        try
        {
            if (Session["payment"] != null)
            {
                
                lblVarificationIssDt.Text = DateTime.Now.ToString("MM/dd/yyyy");
                // lbltype.Text = "Employment and Salary";
                lblVarificationFor.Text = "Manual Social Service";

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
                EmpSSN = ds.Tables[0].Rows[0]["SSN"].ToString();
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

                // LblOrignalSeprationDt.Text = ds.Tables[0].Rows[0]["OriginalSepDate"].ToString().Substring(4, 2) + "/" + ds.Tables[0].Rows[0]["OriginalSepDate"].ToString().Substring(6, 2) + "/" + ds.Tables[0].Rows[0]["OriginalSepDate"].ToString().Substring(0, 4);
                // lblLastDayworked.Text = ds.Tables[0].Rows[0]["LastDayWorkDt"].ToString().Substring(4, 2) + "/" + ds.Tables[0].Rows[0]["LastDayWorkDt"].ToString().Substring(6, 2) + "/" + ds.Tables[0].Rows[0]["LastDayWorkDt"].ToString().Substring(0, 4);


                //if (ds.Tables[0].Rows[0]["CompanyID"].ToString() == "4")
                //{
                //    lblSavageMsg.Visible = true;
                //}
                //else if (ds.Tables[0].Rows[0]["CompanyID"].ToString() == "16")
                //{
                //    lblPDS.Visible = true;
                //}
                //else if (ds.Tables[0].Rows[0]["CompanyID"].ToString() == "22")
                //{
                //    lblCashcall.Visible = true;
                //}

                if (ds.Tables[0].Rows[0]["CompanyID"].ToString() == "22")
                {
                    //Label38.Text = "Tier Adjustment :";
                }
                else
                {
                    lblEmpStatus.Text = "Tips :";
                }
                //

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
                    //  lblrhdt.Text = "N/A";
                    // lblyears.Text = "N/A";
                }



                lbltitle.Text = ds.Tables[0].Rows[0]["EmpTitle"].ToString();


                if (ds.Tables[0].Rows[0]["Separation"].ToString() == "TM")
                {
                    if (ds.Tables[0].Rows[0]["LastDayWorkDt"] != null && ds.Tables[0].Rows[0]["LastDayWorkDt"].ToString() != "")
                    {
                        //tblsep.Visible = true;
                        string y2 = ds.Tables[0].Rows[0]["LastDayWorkDt"].ToString().Substring(0, 4);
                        string m2 = ds.Tables[0].Rows[0]["LastDayWorkDt"].ToString().Substring(4, 2);
                        string d2 = ds.Tables[0].Rows[0]["LastDayWorkDt"].ToString().Substring(6, 2);
                        // lblsepdt.Text = m2 + "/" + d2 + "/" + y2;
                        LblOrignalSeprationDt.Text = m2 + "/" + d2 + "/" + y2;

                        //lblsepdt.Text = Convert.ToDateTime(ds.Tables[0].Rows[0]["LastDayWorkDt"]).ToString("MM/dd/yyyy");
                        // lblreason.Text = ds.Tables[0].Rows[0]["SeparationCode"].ToString();
                        // lblLastDayworked.Text = Convert.ToDateTime(ds.Tables[0].Rows[0]["LastDayWorkDt"]).ToString("MM/dd/yyyy");

                    }
                    else
                    {
                        //lblsepdt.Text = "";
                        LblOrignalSeprationDt.Text = "";
                        // lblreason.Text = "";
                    }

                }
                else
                {
                    //tblsep.Visible = false;
                    // lblsepdt.Text = "N/A";
                    // lblreason.Text = "N/A";
                }
                

                DataSet dsHealth = objEmpInfo.GetHealthInfoById();
                if (dsHealth.Tables[0].Rows.Count != 0)
                {
                    lblMIA.Text = utility.GetYes(dsHealth.Tables[0].Rows[0]["InsuranceAvail"].ToString());
                    lblEEMC.Text = utility.GetYes(dsHealth.Tables[0].Rows[0]["EligibleCoverage"].ToString());

                    lblEEMC1.Text = utility.GetYes(dsHealth.Tables[0].Rows[0]["EnrolledCoverage"].ToString());
                    lblRI.Text = utility.GetReason(dsHealth.Tables[0].Rows[0]["IneligibilityReason"].ToString());

                    lblED.Text = utility.GetDate(dsHealth.Tables[0].Rows[0]["EligibilityDate"].ToString());

                    lblMCSD.Text = utility.GetDate(dsHealth.Tables[0].Rows[0]["CoverageStDt"].ToString());

                    lblMCTD.Text = utility.GetDate(dsHealth.Tables[0].Rows[0]["CoverageTerDt"].ToString());

                    lblMCN.Text = utility.GetData(dsHealth.Tables[0].Rows[0]["CarrierName"].ToString());
                    lblMPN.Text = utility.GetData(dsHealth.Tables[0].Rows[0]["PolicyNumber"].ToString());
                    lblMGN.Text = utility.GetData(dsHealth.Tables[0].Rows[0]["GroupNumber"].ToString());
                    lblMCPN.Text = utility.GetData(dsHealth.Tables[0].Rows[0]["CarrierPhNo"].ToString());
                    lblMCA.Text = utility.GetData(dsHealth.Tables[0].Rows[0]["CarrierAdd1"].ToString()) + " " + dsHealth.Tables[0].Rows[0]["CarrierAdd2"].ToString();
                    lblMCC.Text = utility.GetData(dsHealth.Tables[0].Rows[0]["CarrierCity"].ToString());
                    lblMCS.Text = utility.GetData(dsHealth.Tables[0].Rows[0]["CarrierState"].ToString());
                    lblMCZ.Text = utility.GetData(dsHealth.Tables[0].Rows[0]["CarrierZip"].ToString());
                    lblMICC.Text = utility.GetData(dsHealth.Tables[0].Rows[0]["InsurCoverageCode"].ToString());
                    lblAMICE.Text = utility.GetAmount(dsHealth.Tables[0].Rows[0]["AnnualInsurCostEmp"].ToString());
                    lblDCA.Text = utility.GetYes(dsHealth.Tables[0].Rows[0]["DepCoverageAvail"].ToString());
                    lblNDCCM.Text = dsHealth.Tables[0].Rows[0]["NoDependents"].ToString();
                    lblMCD1.Text = utility.GetData(dsHealth.Tables[0].Rows[0]["Dep1"].ToString());
                    lblMCD2.Text = utility.GetData(dsHealth.Tables[0].Rows[0]["Dep2"].ToString());
                    lblMCD3.Text = utility.GetData(dsHealth.Tables[0].Rows[0]["Dep3"].ToString());
                    lblMCD4.Text = utility.GetData(dsHealth.Tables[0].Rows[0]["Dep4"].ToString());
                    lblMCD5.Text = utility.GetData(dsHealth.Tables[0].Rows[0]["Dep5"].ToString());
                    lblMCD6.Text = utility.GetData(dsHealth.Tables[0].Rows[0]["Dep6"].ToString());
                    lblMCD7.Text = utility.GetData(dsHealth.Tables[0].Rows[0]["Dep7"].ToString());
                    lblMCD8.Text = utility.GetData(dsHealth.Tables[0].Rows[0]["Dep8"].ToString());
                    lblMCD9.Text = utility.GetData(dsHealth.Tables[0].Rows[0]["Dep9"].ToString());
                    lblMCD10.Text = utility.GetData(dsHealth.Tables[0].Rows[0]["Dep10"].ToString());
                    lblDIA.Text = utility.GetYes(dsHealth.Tables[0].Rows[0]["DentalInsurAvail"].ToString());
                    lblEEDC.Text = utility.GetYes(dsHealth.Tables[0].Rows[0]["EligibleDetlCoverage"].ToString());
                    lblEEDC1.Text = utility.GetYes(dsHealth.Tables[0].Rows[0]["EnrolledDetlCoverage"].ToString());
                    lblDPN.Text = utility.GetData(dsHealth.Tables[0].Rows[0]["DetlPolicyNo"].ToString());
                    lblDCN.Text = utility.GetData(dsHealth.Tables[0].Rows[0]["DetlCarrierName"].ToString());
                    lblDCPN.Text = utility.GetData(dsHealth.Tables[0].Rows[0]["DetlCarrierPhNo"].ToString());
                }


                //20209
                DataSet dsPay1 = objEmpInfo.GetPayInfoById();

                DataSet dsPay = objEmpInfo.GetPayInfoBySSN();

                if (dsPay.Tables[0].Rows.Count != 0)
                {
                    // lblrbasis.Text = dsPay1.Tables[0].Rows[0]["RateBasis"].ToString();
                    lblRatebases.Text = dsPay1.Tables[0].Rows[0]["RateBasis"].ToString();

                    // lblfrequency.Text = GetFrequencyCode(dsPay1.Tables[0].Rows[0]["FrequencyCode"].ToString());
                    lblPayrFreq.Text = utility.GetFrequencyCode(dsPay1.Tables[0].Rows[0]["FrequencyCode"].ToString());

                    //lblcbpr.Text = GetAmount(dsPay1.Tables[0].Rows[0]["EmpBaseRate"].ToString());
                    lblEmployeebaseRate.Text = utility.GetAmount(dsPay1.Tables[0].Rows[0]["EmpBaseRate"].ToString());
                    //20209

                    //lblhourly.Text = "$ " + dsPay.Tables[1].Rows[0]["hours"].ToString();
                    //lblmrcir.Text = "N/A";
                    lblMostRecentChangeRate.Text = "N/A";
                    //lblytd.Text = "$ " + dsPay.Tables[1].Rows[0]["cgy"].ToString();
                    //lblGE1.Text = "$ " + dsPay.Tables[1].Rows[0]["pgy"].ToString();
                    //lblGE2.Text = "$ " + dsPay.Tables[1].Rows[0]["lgy"].ToString();
                    //lblcyear.Text = dsPay.Tables[1].Rows[0]["cyear"].ToString() + " :";
                    //lblpyear.Text = dsPay.Tables[1].Rows[0]["pery"].ToString() + " :";
                    //lbllyear.Text = dsPay.Tables[1].Rows[0]["lyear"].ToString() + " :";
                    try
                    {
                        string hours = dsPay.Tables[0].Rows[0]["hours"].ToString();
                        hours = hours.Substring(0, hours.Length - 3);
                        if (hours != "0" && hours.Length >= 2)
                        {
                            hours = hours.Insert(hours.Length - 2, ".");
                        }

                        // lblhourly.Text = hours; //dsPay.Tables[0].Rows[0]["hours"].ToString(); //"$ " + dsPay.Tables[0].Rows[0]["hours"].ToString();
                        lblAvgHrsPerPay.Text = hours; //dsPay.Tables[0].Rows[0]["hours"].ToString(); //"$ " + dsPay.Tables[0].Rows[0]["hours"].ToString();
                    }
                    catch { }

                    // lblytd.Text = "$ " + dsPay.Tables[0].Rows[0]["cgy"].ToString();
                    lblGECunnrentYearYTD.Text = "$ " + dsPay.Tables[0].Rows[0]["cgy"].ToString();
                    lblGEPreviousyear.Text = "$ " + dsPay.Tables[0].Rows[0]["pgy"].ToString();
                    lblGEPreviouseyear2.Text = "$ " + dsPay.Tables[0].Rows[0]["lgy"].ToString();

                    // lblGE1.Text = "$ " + dsPay.Tables[0].Rows[0]["pgy"].ToString();
                    //  lblGE2.Text = "$ " + dsPay.Tables[0].Rows[0]["lgy"].ToString();
                    // lblcyear.Text = dsPay.Tables[0].Rows[0]["cyear"].ToString() + " :";
                    // lblpyear.Text = dsPay.Tables[0].Rows[0]["pery"].ToString() + " :";
                    // lbllyear.Text = dsPay.Tables[0].Rows[0]["lyear"].ToString() + " :";
                }

                if (dsPay.Tables[0].Rows.Count != 0)
                {
                    //lblgw.Text = GetAmount(dsPay.Tables[0].Rows[0]["GrossWages"].ToString());
                    //lblgw.Text = "$ " + (Convert.ToDouble(dsPay.Tables[1].Rows[0]["cgy"]) + Convert.ToDouble(dsPay.Tables[1].Rows[0]["pgy"]) + Convert.ToDouble(dsPay.Tables[1].Rows[0]["lgy"])).ToString("N");
                    //lblbpay.Text = GetAmount(dsPay.Tables[0].Rows[0]["BasePay"].ToString());


                    //lblovertime.Text = GetAmount(dsPay1.Tables[0].Rows[0]["OvertimePay"].ToString());
                    //lblcommission.Text = GetAmount(dsPay1.Tables[0].Rows[0]["CommissionPay"].ToString());
                    //lblbonus.Text = GetAmount(dsPay1.Tables[0].Rows[0]["BonusPay"].ToString());
                    //lbltips.Text = GetAmount(dsPay1.Tables[0].Rows[0]["Tips"].ToString());
                    //lblother.Text = GetAmount(dsPay1.Tables[0].Rows[0]["OtherPay"].ToString());
                    //lblnet.Text = GetAmount(dsPay1.Tables[0].Rows[0]["NetPay"].ToString());

                    // lblgw.Text = "$ " + dsPay.Tables[0].Rows[0]["gws"].ToString();
                    //lblGECunnrentYearYTD.Text = "$ " + dsPay.Tables[0].Rows[0]["gws"].ToString();
                    lblGECunnrentYearYTD.Text = "$ " + dsPay.Tables[0].Rows[0]["cgy"].ToString();
                    //250209
                    //lblovertime.Text = GetAmount(dsPay.Tables[0].Rows[0]["OvertimePay"].ToString());
                    //lblcommission.Text = GetAmount(dsPay.Tables[0].Rows[0]["CommissionPay"].ToString());
                    //lblbonus.Text = GetAmount(dsPay.Tables[0].Rows[0]["BonusPay"].ToString());
                    //lbltips.Text = GetAmount(dsPay.Tables[0].Rows[0]["Tips"].ToString());
                    //lblother.Text = GetAmount(dsPay.Tables[0].Rows[0]["OtherPay"].ToString());
                    //lblnet.Text = GetAmount(dsPay.Tables[0].Rows[0]["NetPay"].ToString());

                    // lblovertime.Text = "$ " + dsPay.Tables[0].Rows[0]["OvertimePay"].ToString();
                    lblBasePayYTD.Text = "$ " + dsPay.Tables[0].Rows[0]["BasePay"].ToString();

                    lblOvertimepayYTD.Text = "$ " + dsPay.Tables[0].Rows[0]["OvertimePay"].ToString();
                    //lblcommission.Text = "$ " + dsPay.Tables[0].Rows[0]["CommissionPay"].ToString();
                    lblComissionPayYTD.Text = "$ " + dsPay.Tables[0].Rows[0]["CommissionPay"].ToString();
                    //lblbonus.Text = "$ " + dsPay.Tables[0].Rows[0]["BonusPay"].ToString();
                    lblBonusPayYTD.Text = "$ " + dsPay.Tables[0].Rows[0]["BonusPay"].ToString();
                    //lbltips.Text = "$ " + dsPay.Tables[0].Rows[0]["Tips"].ToString();
                    lblTipsYTD.Text = "$ " + dsPay.Tables[0].Rows[0]["Tips"].ToString();
                    // lblother.Text = "$ " + dsPay.Tables[0].Rows[0]["OtherPay"].ToString();
                    lblOtherPayYTD.Text = "$ " + dsPay.Tables[0].Rows[0]["OtherPay"].ToString();
                    // lblnet.Text = "$ " + dsPay.Tables[0].Rows[0]["NetPay"].ToString();
                    lblNetPayYTD.Text = "$ " + dsPay.Tables[0].Rows[0]["NetPay"].ToString();

                    ////////////////////////////previous year/////////////////////////////
                    lbpPasePayPrev.Text = "$ " + dsPay.Tables[0].Rows[0]["PBasePay"].ToString();
                    lblOverTimepayPrev.Text = "$ " + dsPay.Tables[0].Rows[0]["POvertimePay"].ToString();
                    lblcomissionPayPrev.Text = "$ " + dsPay.Tables[0].Rows[0]["PCommissionPay"].ToString();
                    lblBonuPayPrev.Text = "$ " + dsPay.Tables[0].Rows[0]["PBonusPay"].ToString();
                    lblTipsPrev.Text = "$ " + dsPay.Tables[0].Rows[0]["PTips"].ToString();
                    lblOtherpayPrev.Text = "$ " + dsPay.Tables[0].Rows[0]["POtherPay"].ToString();
                    lblNetPayPrev.Text = "$ " + dsPay.Tables[0].Rows[0]["PNetPay"].ToString();
                    ////////////////////////////previous year/////////////////////////////

                    ////////////////////////////Last year/////////////////////////////
                    lblbasePayrPrev2.Text = "$ " + dsPay.Tables[0].Rows[0]["LBasePay"].ToString();
                    lblOverTimepayPrev2.Text = "$ " + dsPay.Tables[0].Rows[0]["LOvertimePay"].ToString();
                    lblComissionpayPrev2.Text = "$ " + dsPay.Tables[0].Rows[0]["LCommissionPay"].ToString();
                    lblBonuspayPrev2.Text = "$ " + dsPay.Tables[0].Rows[0]["LBonusPay"].ToString();
                    lblTipsPrev2.Text = "$ " + dsPay.Tables[0].Rows[0]["LTips"].ToString();
                    lblOtherPayPrev2.Text = "$ " + dsPay.Tables[0].Rows[0]["LOtherPay"].ToString();
                    lblNetPayPrev2.Text = "$ " + dsPay.Tables[0].Rows[0]["LNetPay"].ToString();
                    ////////////////////////////Last year/////////////////////////////
                    BindGrid();
                }

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
            //if (Request.QueryString["from"] != null)
            //{
            //    Response.Redirect("Admin/verification.aspx");
            //}
            //else
            //{
            //    Response.Redirect("veriHome.aspx");
            //}
        }
    }

    private void BindGrid()
    {
        DataSet ds = objRep.GetEmployeePaymentInfoBySSN(EmpSSN);
        if (ds != null && ds.Tables.Count > 0 && (ds.Tables[0].Rows.Count > 0))
        {
            gvPaymentHistoryData.DataSource = ds;
            gvPaymentHistoryData.DataBind();            
        }
        else
        {
            ds = new DataSet();
            ds = null;
            gvPaymentHistoryData.DataSource = ds;
            gvPaymentHistoryData.DataBind();     
        }




    }

    //protected void gvPaymentHistoryData_PageIndexChanging(object sender, GridViewPageEventArgs e)
    //{
    //    gvPaymentHistoryData.PageIndex = e.NewPageIndex;
    //    BindGrid();
    //}

    //protected void gvPaymentHistoryData_Sorting(object sender, GridViewSortEventArgs e)
    //{
    //    DataSet ds = objRep.GetEmployeePaymentInfoBySSN(EmpSSN);

    //    DataTable dt = ds.Tables[0];

    //    DataView dv = new DataView(dt);
    //    if ((count % 2) == 0)
    //    {
    //        dv.Sort = e.SortExpression + " " + "ASC";
    //    }
    //    else
    //    {
    //        dv.Sort = e.SortExpression + " " + "DESC";
    //    }

    //    count = count + 1;
    //    gvPaymentHistoryData.DataSource = dv;
    //    gvPaymentHistoryData.DataBind();
    //}

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