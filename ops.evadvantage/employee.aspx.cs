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

public partial class Admin_employee : System.Web.UI.Page
{
    CreateEmp objEmp = new CreateEmp();
    AuthCode objAuth = new AuthCode();
    EmpInfo objEmpInfo = new EmpInfo();
    static int count = 0;

    protected void Page_Load(object sender, EventArgs e)
    {
        Response.Cache.SetCacheability(HttpCacheability.NoCache);
        divmain.Visible = false;
        divpop.Visible = false; 
        if (Session["user"] == null)
        {
            Response.Redirect("Login.aspx");
        }
        
        
        LinkButton lnk = (LinkButton)Master.FindControl("lnkEmployee");
        lnk.Font.Bold = true;
        LinkButton lnk1 = (LinkButton)Master.FindControl("lnkManage");
        lnk1.Font.Bold = true;

        if (gvEmployee.Rows.Count == 0)
        {
            Session["emp"] = "0";
        }
        if (!IsPostBack)
        {
            //BindGrid();
            tblcode.Visible = false;

        }
        txtSearch.Attributes.Add("onKeyPress", "doClick('" + btnSearch.ClientID + "',event)");

    }

   
    protected void btnSearch_Click(object sender, EventArgs e)
    {
        Session["emp"] = "0";
        tblcode.Visible = false;
        gvEmployee.SelectedIndex=-1;
        BindGrid();
        
       
    }
    private void BindGrid()
    {
        //if (txtCompany.Text == "" && txtEmp.Text == "" && txtSSN.Text == "")
        //{
        //    objEmpInfo.CompanyName = " ";
        //    objEmpInfo.EmployeeName = " ";
        //    objEmpInfo.SSN = " ";
        //}
        //else
        //{
        //    objEmpInfo.CompanyName = txtCompany.Text;
        //    objEmpInfo.EmployeeName = txtEmp.Text;
        //    objEmpInfo.SSN = txtSSN.Text;
        //}
        if (ddlSearch.SelectedValue == "1")
        {
            objEmpInfo.CompanyName = txtSearch.Text;
            objEmpInfo.EmployeeName = String.Empty;
            objEmpInfo.SSN = String.Empty;
        }
        else if (ddlSearch.SelectedValue == "2")
        {
            objEmpInfo.CompanyName = String.Empty;
            objEmpInfo.EmployeeName = txtSearch.Text;
            objEmpInfo.SSN = String.Empty;
        }
        else if (ddlSearch.SelectedValue == "3")
        {
            objEmpInfo.CompanyName = String.Empty;
            objEmpInfo.EmployeeName = String.Empty;
            objEmpInfo.SSN = txtSearch.Text;
        }
        else
        {
            objEmpInfo.CompanyName = " ";
            objEmpInfo.EmployeeName = " ";
            objEmpInfo.SSN = " ";
        }
        /*if (txtSearch.Text == "")
        {
            objEmpInfo.CompanyName = " ";
            objEmpInfo.EmployeeName = " ";
            objEmpInfo.SSN = " ";
        }*/
        if (txtSearch.Text == "*" || txtSearch.Text == "")
        {
            objEmpInfo.CompanyName = "";
            objEmpInfo.EmployeeName = "";
            objEmpInfo.SSN = "";
        }
        

        gvEmployee.DataSource= objEmpInfo.GetEmpInfoForComp();
        gvEmployee.DataBind();

    }
    protected void btnClear_Click(object sender, EventArgs e)
    {
       
        Session["emp"] = "0";
        //txtEmp.Text = String.Empty;
        //txtCompany.Text = String.Empty;
        //txtSSN.Text = String.Empty;
        txtSearch.Text = String.Empty;
        ddlSearch.SelectedIndex = -1;
        gvEmployee.SelectedIndex = -1;
        BindGrid();
        tblcode.Visible = false;
    }
   
    public string GetImageUrl(object status)
    {
        if (status.ToString() == "E")
        {
            return "../images/ratingplus.gif";
        }
        else
        {
            return "../images/ratingminus.gif";
        }
    }
    public string GetUsedImageUrl(object status)
    {
        if (status.ToString() == "X")
        {
            return "../images/DNNExplorer_Cancel.gif";
        }
        else
        {
            return "../images/DNNExplorer_OK.gif";
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
    public void GetUserId(object sender, CommandEventArgs e)
    {
        //string ssn = e.CommandArgument.ToString();
        //objEmp.SSN = ssn;
        //DataSet ds = objEmp.GetUserId();

        //if (ds.Tables[0].Rows.Count != 0)
        //{
        //    Session["emp"] = ds.Tables[0].Rows[0]["UserId"].ToString();
        //}
        //else
        //{
        //    Session["emp"] = "0";
        //}
        Session["emp"] = e.CommandArgument.ToString();
        gvActiveCode.DataBind();
        gvUsed.DataBind();
        tblcode.Visible = true;          


        
    }
    public void DeleteCode(object sender, CommandEventArgs e)
    {
        objAuth.Status = "R";
        objAuth.AuthCodeId=Convert.ToInt32( e.CommandName);
        objAuth.UpdateData();

        gvActiveCode.DataBind();
        gvUsed.DataBind();


    }
    public void ResetPwd(object sender, CommandEventArgs e)
    {
        divmain.Visible = true;
        divpop.Visible = true;
        txtemail.Text = e.CommandArgument.ToString();
        objEmp.UserId = Convert.ToInt32(e.CommandName);
        DataSet ds = objEmp.GetUserById();
        lblUser.Text = ds.Tables[0].Rows[0]["UserName"].ToString();
        txtpass.Text = ds.Tables[0].Rows[0]["Pwd"].ToString();
        txtuserid.Text = e.CommandName.ToString();
           
        //objEmp.Pwd = "Evadva123#";
        //objEmp.UserId = Convert.ToInt32(e.CommandName);
        //objEmp.UpdateData();
        //string body;
        //body = "<b>Dear User,</b><br /><br />Your password has been reset to Evadva123# <br />";
        //body = body + "<br />Now you can login with the user name and password <br /><br /> Please do not reply to this auto - generated mail. <br /><br /><br /><b>Thanks and regards </b><br /><b>EV Advantage </b> ";
        //body = body + "<br /><a href='www.evadvantage.com'>www.evadvantage.com</a>";
        //ops.evadvantage.Utilities.SendMail(e.CommandArgument.ToString(), ConfigurationManager.AppSettings["email"].ToString(), body, "Reset Password from EV Advantage.");
        //EVA.Utilities.MessageBox("Password has been reset and successfully sent to employee.", Page);



    }

    protected void gvEmployee_PageIndexChanging(object sender, GridViewPageEventArgs e)
    {
        gvEmployee.PageIndex = e.NewPageIndex;
        BindGrid();
    }
    protected void gvEmployee_Sorting(object sender, GridViewSortEventArgs e)
    {
       
        objEmpInfo = new EmpInfo();
        if (ddlSearch.SelectedValue == "1")
        {
            objEmpInfo.CompanyName = txtSearch.Text;
            objEmpInfo.EmployeeName = "";
            objEmpInfo.SSN = "";
        }
        else if (ddlSearch.SelectedValue == "2")
        {
            objEmpInfo.CompanyName = "";
            objEmpInfo.EmployeeName = txtSearch.Text;
            objEmpInfo.SSN = "";
        }
        else if (ddlSearch.SelectedValue == "3")
        {
            objEmpInfo.CompanyName = "";
            objEmpInfo.EmployeeName = "";
            objEmpInfo.SSN = txtSearch.Text;
        }
        else
        {
            objEmpInfo.CompanyName = " ";
            objEmpInfo.EmployeeName = " ";
            objEmpInfo.SSN = " ";
        }

        if (txtSearch.Text == "")
        {
            objEmpInfo.CompanyName = " ";
            objEmpInfo.EmployeeName = " ";
            objEmpInfo.SSN = " ";
        }
        if (txtSearch.Text == "*")
        {
            objEmpInfo.CompanyName = "";
            objEmpInfo.EmployeeName = "";
            objEmpInfo.SSN = "";
        }
        DataTable dt = objEmpInfo.GetEmpInfoForComp().Tables[0];

        DataView dv = new DataView(dt);
        //count = 0;
        if ((count % 2) == 0)
        {
            dv.Sort = e.SortExpression + " " + "ASC";
        }
        else
        {
            dv.Sort = e.SortExpression + " " + "DESC";
        }

        count = count + 1;
        gvEmployee.DataSource = dv;
        gvEmployee.DataBind();
    }
    protected void gvEmployee_SelectedIndexChanging(object sender, GridViewSelectEventArgs e)
    {
        for (int i = 0; i < gvEmployee.Rows.Count; i++)
        {

            gvEmployee.Rows[i].Visible = false;

        }
        gvEmployee.Rows[e.NewSelectedIndex].Visible = true;
    }
    protected void btnSubmit_Click(object sender, EventArgs e)
    {
        objEmp.Pwd = txtpass.Text;
        objEmp.UserId = Convert.ToInt32(txtuserid.Text);
        objEmp.UpdateData();
        string body;
        body = "<b>Dear User,</b><br /><br />Your password has been reset to " + txtpass.Text + " <br />";
        body = body + "<br />Now you can login with the user name and password <br /><br /> Please do not reply to this auto - generated mail. <br /><br /><br /><b>Thanks and Regards </b><br /><b>EV Advantage </b> ";
        body = body + "<br /><a href='www.evadvantage.com'>www.evadvantage.com</a>";
        ops.evadvantage.Utilities.SendMail(txtemail.Text, ConfigurationManager.AppSettings["email"].ToString(), body, "Reset Password from EV Advantage.");
        ops.evadvantage.Utilities.MessageBox("Password has been reset and successfully sent to employee.", Page);
    }
    protected void btnClose_Click(object sender, EventArgs e)
    {
        divmain.Visible = false;
        divpop.Visible = false; 
    }
    public string GetStatusImageUrl(object status)
    {
        if (status.ToString() == "0")
        {
            return "../images/ratingplus.gif";
        }
        else
        {
            return "../images/ratingminus.gif";
        }
    }
    public void ChangeStatus1(object sender, CommandEventArgs e)
    {
        int userId = Convert.ToInt32(e.CommandName);

        objEmp.UserId = userId;
        string status = e.CommandArgument.ToString();

        if (status == "0")
        {
            objEmp.IsActive = "2";
        }
        else
        {
            objEmp.IsActive = "0";
        }
        objEmp.UpdateDataForActivate();
        BindGrid();



    }
}
