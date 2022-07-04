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

public partial class Admin_socialServices : System.Web.UI.Page
{
    CreateEmp objEmp = new CreateEmp();
    static int count = 0;
    protected void Page_Load(object sender, EventArgs e)
    {
        divmain.Visible = false;
        divpop.Visible = false;
        Response.Cache.SetCacheability(HttpCacheability.NoCache);
        LinkButton lnk = (LinkButton)Master.FindControl("lnkSsu");
        lnk.Font.Bold = true;
        LinkButton lnk1 = (LinkButton)Master.FindControl("lnkManage");
        lnk1.Font.Bold = true;
        if (Session["user"] == null)
        {
            Response.Redirect("Login.aspx");
        }


        if (gvVerifier.Rows.Count == 0)
        {
            Session["verifyid"] = "0";
        }
        if (!IsPostBack)
        {
            if (Request.QueryString["searchby"] != null)
            {
                ddlSearch.SelectedValue = Request.QueryString["searchby"].ToString();
                txtSearch.Text = Request.QueryString["searchfor"].ToString();
                BindGrid();
                tblcode.Visible = false;
            }
            else
            {
                //BindGrid();
                tblcode.Visible = false;
            }
        }
        txtSearch.Attributes.Add("onKeyPress", "doClick('" + btnSearch.ClientID + "',event)");
    }
    protected void btnSearch_Click(object sender, EventArgs e)
    {
        Session["verifyid"] = "0";
        gvVerifier.SelectedIndex = -1;
        tblcode.Visible = false;
        BindGrid();
    }
    private void BindGrid()
    {
        if (ddlSearch.SelectedValue == "1")
        {
            objEmp.CompanyName = txtSearch.Text;
            objEmp.FirstName = String.Empty;
            objEmp.LastName = String.Empty;

        }
        else if (ddlSearch.SelectedValue == "2")
        {
            objEmp.CompanyName = String.Empty;
            objEmp.FirstName = txtSearch.Text;
            objEmp.LastName = String.Empty;
        }
        else if (ddlSearch.SelectedValue == "3")
        {
            objEmp.CompanyName = String.Empty;
            objEmp.FirstName = String.Empty;
            objEmp.LastName = txtSearch.Text;
        }
        else
        {
            objEmp.CompanyName = " ";
            objEmp.FirstName = " ";
            objEmp.LastName = " ";

        }
        /*if (txtSearch.Text == "")
        {
            objEmp.CompanyName = " ";
            objEmp.FirstName = " ";
            objEmp.LastName = " ";
        }*/
        if (txtSearch.Text == "*" || txtSearch.Text == "")
        {
            objEmp.CompanyName = "";
            objEmp.FirstName = "";
            objEmp.LastName = "";
        }
        gvVerifier.DataSource = objEmp.GetSsu();
        gvVerifier.DataBind();

    }
    protected void btnClear_Click(object sender, EventArgs e)
    {
        Session["verifyid"] = "0";
        txtSearch.Text = String.Empty;
        ddlSearch.SelectedIndex = -1;
        gvVerifier.SelectedIndex = -1;
        BindGrid();
        tblcode.Visible = false;
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
        //EVA.Utilities.SendMail(e.CommandArgument.ToString(), ConfigurationManager.AppSettings["email"].ToString(), body, "Reset Password from EV Advantage.");
        //EVA.Utilities.MessageBox("Password has been reset and successfully sent to employee.", Page);



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
        Session["verifyid"] = e.CommandArgument.ToString();
        gvDetail.DataBind();
        //gvUsed.DataBind();
        tblcode.Visible = true;

    }
    public void Detail(object sender, CommandEventArgs e)
    {
        string user = e.CommandName.ToString();
        //ScriptManager.RegisterClientScriptBlock(Page, typeof(Page), "MyKey", "popUp('verifierDetail.aspx?user=" + user + "');", true);
        Response.Redirect("editSsu.aspx?user=" + user + "&searchby=" + ddlSearch.SelectedValue.ToString() + "&searchfor=" + txtSearch.Text);

    }
    public string GetUser(object userid)
    {
        objEmp.UserId = Convert.ToInt32(userid.ToString());
        DataSet ds = objEmp.GetUserEmpInfo();
        return ds.Tables[0].Rows[0]["Firstname"].ToString() + " " + ds.Tables[0].Rows[0]["lastname"].ToString();


    }
    protected void gvVerifier_PageIndexChanging(object sender, GridViewPageEventArgs e)
    {
        gvVerifier.PageIndex = e.NewPageIndex;
        BindGrid();
    }
    protected void gvVerifier_SelectedIndexChanging(object sender, GridViewSelectEventArgs e)
    {
        for (int i = 0; i < gvVerifier.Rows.Count; i++)
        {

            gvVerifier.Rows[i].Visible = false;

        }
        gvVerifier.Rows[e.NewSelectedIndex].Visible = true;
    }
    protected void gvVerifier_Sorting(object sender, GridViewSortEventArgs e)
    {
        objEmp = new CreateEmp();
        if (ddlSearch.SelectedValue == "1")
        {
            objEmp.CompanyName = txtSearch.Text;
            objEmp.FirstName = String.Empty;
            objEmp.LastName = String.Empty;

        }
        else if (ddlSearch.SelectedValue == "2")
        {
            objEmp.CompanyName = String.Empty;
            objEmp.FirstName = txtSearch.Text;
            objEmp.LastName = String.Empty;
        }
        else if (ddlSearch.SelectedValue == "3")
        {
            objEmp.CompanyName = String.Empty;
            objEmp.FirstName = String.Empty;
            objEmp.LastName = txtSearch.Text;
        }
        else
        {
            objEmp.CompanyName = " ";
            objEmp.FirstName = " ";
            objEmp.LastName = " ";

        }
        if (txtSearch.Text == "")
        {
            objEmp.CompanyName = " ";
            objEmp.FirstName = " ";
            objEmp.LastName = " ";
        }
        if (txtSearch.Text == "*")
        {
            objEmp.CompanyName = "";
            objEmp.FirstName = "";
            objEmp.LastName = "";
        }

        DataTable dt = objEmp.GetSsu().Tables[0];

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
        gvVerifier.DataSource = dv;
        gvVerifier.DataBind();
    }
    protected void btnClose_Click(object sender, EventArgs e)
    {
        divmain.Visible = false;
        divpop.Visible = false;
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
    public string GetName(object fname, object lname)
    {
        return fname.ToString() + " " + lname.ToString();
    }
    public void ChangeStatus(object sender, CommandEventArgs e)
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
