using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using EVA.BLL;

public partial class SSRPT : System.Web.UI.Page
{

    EmpInfo objEmpInfo = new EmpInfo();
    protected void Page_Load(object sender, EventArgs e)
    {
        Response.Cache.SetCacheability(HttpCacheability.NoCache);
        if (Session["user"] == null)
        {
            Response.Redirect("login.aspx");
        }
        if (Session["payment"] != null)
        {
            lblVarificationIssDt.Text = DateTime.Now.ToString("MM/dd/yyyy");

            lblVarificationFor.Text = "Social Service Verification";

            if (Session["vertype"] != null)
            {
                if (Session["vertype"].ToString() == "4")
                {
                    lblVarificationFor.Text = "Manual Social Service Verification";
                }
            }



            lblRefrenceNo.Text = "";

            lblEmpNote.Text = "None";

            objEmpInfo.EmpInfoId = Convert.ToInt32(Session["empinfoid"]);
            DataSet ds = objEmpInfo.GetInfoById();

            lblfname.Text = ds.Tables[0].Rows[0]["FirstName"].ToString() + " " + ds.Tables[0].Rows[0]["LastName"].ToString();

            lblInformationCurrentasofDT.Text = Convert.ToDateTime(ds.Tables[0].Rows[0]["UploadDt"]).ToString("MM/dd/yyyy");
            lblEmployer.Text = ds.Tables[0].Rows[0]["CompanyName"].ToString();

            lblEmployerAddress.Text = "N/A";
            lblfname.Text = ds.Tables[0].Rows[0]["FirstName"].ToString();

            lblMiddle.Text = ds.Tables[0].Rows[0]["MiddleName"].ToString();

            lblLast.Text = ds.Tables[0].Rows[0]["LastName"].ToString();

            lblSSN.Text = ds.Tables[0].Rows[0]["SSN"].ToString().Substring(0, 3) + "-" + ds.Tables[0].Rows[0]["SSN"].ToString().Substring(3, 2) + "-" + ds.Tables[0].Rows[0]["SSN"].ToString().Substring(5, 4);

            DataSet dsHealth = objEmpInfo.GetHealthInfoById();
            if (dsHealth.Tables[0].Rows.Count != 0)
            {
                lblMIA.Text = GetYes(dsHealth.Tables[0].Rows[0]["InsuranceAvail"].ToString());
                lblEEMC.Text = GetYes(dsHealth.Tables[0].Rows[0]["EligibleCoverage"].ToString());

                lblEEMC1.Text = GetYes(dsHealth.Tables[0].Rows[0]["EnrolledCoverage"].ToString());
                lblRI.Text = GetReason(dsHealth.Tables[0].Rows[0]["IneligibilityReason"].ToString());

                lblED.Text = GetDate(dsHealth.Tables[0].Rows[0]["EligibilityDate"].ToString());

                lblMCSD.Text = GetDate(dsHealth.Tables[0].Rows[0]["CoverageStDt"].ToString());

                lblMCTD.Text = GetDate(dsHealth.Tables[0].Rows[0]["CoverageTerDt"].ToString());

                lblMCN.Text = GetData(dsHealth.Tables[0].Rows[0]["CarrierName"].ToString());
                lblMPN.Text = GetData(dsHealth.Tables[0].Rows[0]["PolicyNumber"].ToString());
                lblMGN.Text = GetData(dsHealth.Tables[0].Rows[0]["GroupNumber"].ToString());
                lblMCPN.Text = GetData(dsHealth.Tables[0].Rows[0]["CarrierPhNo"].ToString());
                lblMCA.Text = GetData(dsHealth.Tables[0].Rows[0]["CarrierAdd1"].ToString()) + " " + dsHealth.Tables[0].Rows[0]["CarrierAdd2"].ToString();
                lblMCC.Text = GetData(dsHealth.Tables[0].Rows[0]["CarrierCity"].ToString());
                lblMCS.Text = GetData(dsHealth.Tables[0].Rows[0]["CarrierState"].ToString());
                lblMCZ.Text = GetData(dsHealth.Tables[0].Rows[0]["CarrierZip"].ToString());
                lblMICC.Text = GetData(dsHealth.Tables[0].Rows[0]["InsurCoverageCode"].ToString());
                lblAMICE.Text = GetAmount(dsHealth.Tables[0].Rows[0]["AnnualInsurCostEmp"].ToString());
                lblDCA.Text = GetYes(dsHealth.Tables[0].Rows[0]["DepCoverageAvail"].ToString());
                lblNDCCM.Text = dsHealth.Tables[0].Rows[0]["NoDependents"].ToString();
                lblMCD1.Text = GetData(dsHealth.Tables[0].Rows[0]["Dep1"].ToString());
                lblMCD2.Text = GetData(dsHealth.Tables[0].Rows[0]["Dep2"].ToString());
                lblMCD3.Text = GetData(dsHealth.Tables[0].Rows[0]["Dep3"].ToString());
                lblMCD4.Text = GetData(dsHealth.Tables[0].Rows[0]["Dep4"].ToString());
                lblMCD5.Text = GetData(dsHealth.Tables[0].Rows[0]["Dep5"].ToString());
                lblMCD6.Text = GetData(dsHealth.Tables[0].Rows[0]["Dep6"].ToString());
                lblMCD7.Text = GetData(dsHealth.Tables[0].Rows[0]["Dep7"].ToString());
                lblMCD8.Text = GetData(dsHealth.Tables[0].Rows[0]["Dep8"].ToString());
                lblMCD9.Text = GetData(dsHealth.Tables[0].Rows[0]["Dep9"].ToString());
                lblMCD10.Text = GetData(dsHealth.Tables[0].Rows[0]["Dep10"].ToString());
                lblDIA.Text = GetYes(dsHealth.Tables[0].Rows[0]["DentalInsurAvail"].ToString());
                lblEEDC.Text = GetYes(dsHealth.Tables[0].Rows[0]["EligibleDetlCoverage"].ToString());
                lblEEDC1.Text = GetYes(dsHealth.Tables[0].Rows[0]["EnrolledDetlCoverage"].ToString());
                lblDPN.Text = GetData(dsHealth.Tables[0].Rows[0]["DetlPolicyNo"].ToString());
                lblDCN.Text = GetData(dsHealth.Tables[0].Rows[0]["DetlCarrierName"].ToString());
                lblDCPN.Text = GetData(dsHealth.Tables[0].Rows[0]["DetlCarrierPhNo"].ToString());
            }
        }
        else
        {
            Response.Redirect("SSHome.aspx");
        }

        if (!Page.IsPostBack)
        {
            // if (Request.UrlReferrer.ToString().Contains("admin/verification.aspx"))
            // refererCheck.Text = "true";
            //else
            //  refererCheck.Text = "false";
        }
    }
    private string GetAmount(string amt)
    {
        if (amt != "")
        {
            int main = Convert.ToInt32(amt.Substring(0, 7));
            string sub = amt.Substring(7, 2);

            return "$ " + main.ToString() + "." + sub;
        }
        else
        {
            return "N/A";
        }
    }
    private string GetDate(string str)
    {
        if (str != "")
        {
            string y = str.Substring(0, 4);
            string m = str.Substring(4, 2);
            string d = str.Substring(6, 2);
            return m + "/" + d + "/" + y;
        }
        else
        {
            return "N/A";
        }
    }
    private string GetData(string str)
    {
        if (str != "")
        {
            return str;
        }
        else
        {
            return "N/A";
        }
    }
    private string GetYes(string str)
    {
        if (str != "")
        {
            if (str == "Y")
            {
                return "Yes";
            }
            else
            {
                return "No";
            }
        }
        else
        {
            return "N/A";
        }
    }
    private string GetReason(string str)
    {
        if (str != "")
        {
            if (str == "01")
            {
                return "Part Time/Not Enough Hours";
            }
            else if (str == "02")
            {
                return "Not Yet Eligible";
            }
            else
            {
                return "Employment Position Ineligible";
            }
        }
        else
        {
            return "N/A";
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