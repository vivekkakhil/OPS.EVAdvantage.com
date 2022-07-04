using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using ops.evadvantage.BLL;
using System.Data;

public partial class Admin_Exception : System.Web.UI.Page
{
    CreateEmp objEmp = new CreateEmp();
    CompanyExceptions ce = new CompanyExceptions();
    static int count = 0; 

    protected void Page_Load(object sender, EventArgs e)
    {
        Response.Cache.SetCacheability(HttpCacheability.NoCache);
        LinkButton lnk = (LinkButton)Master.FindControl("lnkException");
        lnk.Font.Bold = true;
        if (Session["user"] == null)
        {
            Response.Redirect("Login.aspx");
        }
        if (!IsPostBack)
        {
            BindDropDown();
            if (Request.QueryString["cmId"] != null)
            {
                ddlClient.ClearSelection();
                ddlClient.Items.FindByValue(Request.QueryString["cmId"].ToString()).Selected = true;
                ddlClient_SelectedIndexChanged(null, null);
            }
        }
    }

    public void BindDropDown()
    {
        ops.evadvantage.Utilities.BindDropDownList(ddlClient, objEmp.GetCompany(), "CompanyName", "CompanyId");
    }

    protected void ddlClient_SelectedIndexChanged(object sender, EventArgs e)
    {
        ce.CompanyID = Convert.ToInt32(ddlClient.SelectedValue);
        DataTable dt = ce.GetExecptionByCompany();
        if (dt != null && dt.Rows.Count > 0)
            txtException.Text = dt.Rows[0]["ExceptionText"].ToString();
        else
            txtException.Text = string.Empty;
    }

    protected void btnSave_Click(object sender, EventArgs e)
    {
        if (ddlClient.SelectedValue.ToString() != "0")
        {
            try
            {
                ce.CompanyID = Convert.ToInt32(ddlClient.SelectedValue);
                ce.ExceptionText = txtException.Text.Trim();
                ce.InsertUpdate();


                lblErrorMessage.ForeColor = System.Drawing.Color.Green;
                lblErrorMessage.Font.Bold = true;
                lblErrorMessage.Text = "Exception saved successfully.";
            }
            catch (Exception ex)
            {
                lblErrorMessage.ForeColor = System.Drawing.Color.Red;
                lblErrorMessage.Font.Bold = true;
                lblErrorMessage.Text = "Exception save error.";
            }

            //DataSet ds = objRep.GetData(Convert.ToInt32(ddlClient.SelectedValue), Convert.ToDateTime(txtfrom.Text), Convert.ToDateTime(txtto.Text));
            //gvData.DataSource = ds;
            //gvData.DataBind();
            //if (ds.Tables[0].Rows.Count != 0)
            //{
            //    tbl.Visible = true;
            //    lblE.Text = ds.Tables[2].Rows[0]["no"].ToString();
            //    lblEW.Text = ds.Tables[1].Rows[0]["no"].ToString();
            //    lblSS.Text = ds.Tables[3].Rows[0]["no"].ToString();
            //}
            //else
            //{
            //    tbl.Visible = false;
            //    lblE.Text = "";
            //    lblEW.Text = "";
            //    lblSS.Text = "";
            //}
        }
        else
        {
            //DataSet ds = new DataSet();
            //ds = null;
            //gvData.DataSource = ds;
            //gvData.DataBind();
            //tbl.Visible = false;
            //lblE.Text = "";
            //lblEW.Text = "";
            //lblSS.Text = "";

        }
    }
    
    protected void btnClear_Click(object sender, EventArgs e)
    {

    }


}
