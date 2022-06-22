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

public partial class empHome : System.Web.UI.Page
{
    AuthCode objAuth = new AuthCode();
    protected void Page_Load(object sender, EventArgs e)
    {
        Response.Cache.SetCacheability(HttpCacheability.NoCache);
        if (Session["user"] == null)
        {
            Response.Redirect("employees.aspx");
        }

        if (IsPostBack != true)
        {
            objAuth.UpdateStatus();
        }
        HideAddNewCodeButton();
    }

    private void HideAddNewCodeButton()
    {
        lnkAddNewCode.Visible = true;
        CreateEmp objEmp = new CreateEmp();
        objEmp.UserId = Convert.ToInt32(Session["userid"]);
        DataSet dsEmpInfo = objEmp.GetUserEmpInfo();
        if (dsEmpInfo.Tables[0].Rows.Count != 0)
        {
            int CompanyId = Convert.ToInt32(dsEmpInfo.Tables[0].Rows[0]["CompanyId"]);
            if (CompanyId == 44)
            {
           //     lnkAddNewCode.Visible = false;
            }
        }
    }

    protected void lnkEdit_Click(object sender, EventArgs e)
    {
        Response.Redirect("editEmpInfo.aspx");
    }
    protected void lnkAddNewCode_Click(object sender, EventArgs e)
    {
        if (gvActiveCode.Rows.Count < 3)
        {
            objAuth = PrepareParameter();
            objAuth.SaveData();
            gvActiveCode.DataBind();
        }
        else
        {
            EVA.Utilities.MessageBox("You can add maximum 3 codes.", Page);
        }

    }
    private AuthCode PrepareParameter()
    {
        objAuth.UserId = Convert.ToInt32(Session["userid"]);

        CreateEmp objEmp = new CreateEmp();
        objEmp.UserId = Convert.ToInt32(Session["userid"]);
        DataSet dsEmpInfo = objEmp.GetUserEmpInfo();
        if (dsEmpInfo.Tables[0].Rows.Count != 0)
        {
            int CompanyId = Convert.ToInt32(dsEmpInfo.Tables[0].Rows[0]["CompanyId"]);
            if (CompanyId == 44)
            {
                string SSN = dsEmpInfo.Tables[0].Rows[0]["SSN"].ToString();
                string LastName = dsEmpInfo.Tables[0].Rows[0]["LastName"].ToString();
                string maxCode = objAuth.GetMaxAuthCode();
                if (maxCode == "")
                {
                    string prefix = SSN.Substring(SSN.Length - 4, 4).ToUpper() + LastName.Substring(0, 3).ToUpper();
                    objAuth.AuthCodeNo = prefix + "01";
                }
                else
                {
                    objAuth.AuthCodeNo = EVA.Utilities.GenerateMaximumNo(maxCode,false);
                }
            }
            else
            {
                string maxCode = objAuth.GetMaxAuthCode();
                if (maxCode == "")
                {
                    //string prefix = Session["user"].ToString().Substring(0, 2).ToUpper();
                    string prefix = Session["fname"].ToString().Substring(0, 1).ToUpper() + Session["lname"].ToString().Substring(0, 1).ToUpper();
                    objAuth.AuthCodeNo = prefix + "0000001";
                }
                else
                {
                    objAuth.AuthCodeNo = EVA.Utilities.GenerateMaximumNo(maxCode,true);
                }
            }
        }



        objAuth.IssueDate = DateTime.Today;
        objAuth.ExpiredDate = DateTime.Today.AddMonths(2);
        objAuth.Status = "E";
        return objAuth;
    }
    public string GetImageUrl(object status)
    {
        if (status.ToString() == "E")
        {
            return "images/ratingplus.gif";
        }
        else
        {
            return "images/ratingminus.gif";
        }
    }
    public string GetUsedImageUrl(object status)
    {
        if (status.ToString() == "X")
        {
            return "images/DNNExplorer_Cancel.gif";
        }
        else
        {
            return "images/DNNExplorer_OK.gif";
        }
    }
    public void ChangeStatus(object sender, CommandEventArgs e)
    {
        int authId = Convert.ToInt32(e.CommandName);
        objAuth.AuthCodeId = authId;

        string status = e.CommandArgument.ToString();
        if (status == "E")
        {
            objAuth.Status = "D";
        }
        else
        {
            objAuth.Status = "E";
        }
        objAuth.UpdateData();
        gvActiveCode.DataBind();

    }

}
