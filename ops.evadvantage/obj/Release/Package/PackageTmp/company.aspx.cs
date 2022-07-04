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

public partial class Admin_company : System.Web.UI.Page
{
    Company objComp = new Company();
    EmpInfo objEmp = new EmpInfo();
    protected void Page_Load(object sender, EventArgs e)
    {
        Response.Cache.SetCacheability(HttpCacheability.NoCache);
        if (Session["user"] == null)
        {
            Response.Redirect("login.aspx");
        }
        LinkButton lnk = (LinkButton)Master.FindControl("lnkCompany");
        lnk.Font.Bold = true;

        txtSearch.Attributes.Add("onKeyPress", "doClick('" + btnSearch.ClientID + "',event)");
        txtCompany.Attributes.Add("onKeyPress", "doClick('" + btnAdd.ClientID + "',event)");
    }
    protected void btnClear_Click(object sender, EventArgs e)
    {
        txtCompany.Text = String.Empty;
    }
    protected void btnAdd_Click(object sender, EventArgs e)
    {
        objComp = PrepareParameter();
        objComp.SaveData();
        ops.evadvantage.Utilities.MessageBox("Company added successfully.", Page);
        ClearControl();
        gvCompany.DataBind();
    }
    private Company PrepareParameter()
    {
        objComp = new Company();
        DataSet dsComp= objComp.GetMaxCompanyCode();
        if (dsComp.Tables[0].Rows.Count != 0)
        {
            objComp.CompanyCode =Convert.ToString(Convert.ToInt32(dsComp.Tables[0].Rows[0]["Code"]) + 1);


        }
        else
        {
            objComp.CompanyCode = "10001";
        }
        objComp.CompanyName = txtCompany.Text;

        return objComp;
    }
    private void ClearControl()
    {
        txtCompany.Text = String.Empty;
    }
    public void Delete(object sender, CommandEventArgs e)
    {
        int compid = Convert.ToInt32(e.CommandName);
        
        objEmp.CompanyId = compid;
        DataSet ds = objEmp.GetCompanyInfo();
        if (ds.Tables[0].Rows.Count != 0)
        {
            ops.evadvantage.Utilities.MessageBox("You can not delete the company.", Page);
        }
        else
        {
            objComp.CompanyId = compid;
            objComp.Delete();
            gvCompany.DataBind();
        }


    }
   
}
