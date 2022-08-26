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

//using System.Data.SqlClient;

public partial class Admin_dataUpload : System.Web.UI.Page
{
    static int count=0;
    DataUpload objData = new DataUpload();
    protected void Page_Load(object sender, EventArgs e)
    {
        Response.Cache.SetCacheability(HttpCacheability.NoCache);
        LinkButton lnk = (LinkButton)Master.FindControl("lnkUpload");
        lnk.Font.Bold = true;
        if (Session["user"] == null)
        {
            Response.Redirect("Login.aspx");
        }
        if (!IsPostBack)
        {
            if (Request.QueryString["comp"] != null)
            {
                txtCompany.Text = Request.QueryString["comp"].ToString();
                txtfrom.Text = Request.QueryString["fdt"].ToString();
                txtto.Text = Request.QueryString["tdt"].ToString();
                BindGrid();
            }
            else
            {
                //BindGrid();
                DataSet ds = new DataSet();
                ds = null;
                gvStatus.DataSource = ds;
                gvStatus.DataBind();
            }
      
        }
       
    }
    public string GetUsedImageUrl(object status)
    {
        if (status.ToString() == "F")
        {
            return "../images/DNNExplorer_Cancel.gif";
        }
        else
        {
            return "../images/DNNExplorer_OK.gif";
        }
    }
    

    protected void gvStatus_RowDataBound(object sender, GridViewRowEventArgs e)
    {
        if (e.Row.RowType == DataControlRowType.DataRow)
        {
            Image img = (Image)e.Row.FindControl("imgUsed");
            if (img.ImageUrl == "../images/DNNExplorer_Cancel.gif") 
            {
                LinkButton lnk = (LinkButton)e.Row.FindControl("lnkDetail");
                lnk.Visible = true;
            }
            else
            {
                LinkButton lnk = (LinkButton)e.Row.FindControl("lnkDetail");
                lnk.Visible = false;
            }
        }
    }
    public void GetDetail(object sender, CommandEventArgs e)
    {
        string statusid = e.CommandName.ToString();
        //Session["id"] = statusid;
        //ScriptManager.RegisterClientScriptBlock(Page, typeof(Page), "MyKey", "popUp('detail.aspx?id=" + statusid + "');", true);
        Response.Redirect("detail.aspx?id=" + statusid + "&comp=" + txtCompany.Text + "&fdt=" + txtfrom.Text + "&tdt=" + txtto.Text);
        
    }
    protected void btnSearch_Click(object sender, EventArgs e)
    {
        BindGrid();
    }
    private void BindGrid()
    {
        if (txtCompany.Text == "")
        {
            if (txtfrom.Text != "" && txtto.Text != "")
            {
                objData.CompanyName = txtCompany.Text;
            }
            else
            {
                
                objData.CompanyName = " ";
            }
            
        }
        else
        {
            objData.CompanyName = txtCompany.Text;
        }
        
        if (txtfrom.Text != "")
        {
            objData.FromDt = Convert.ToDateTime(txtfrom.Text);
        }
        if (txtto.Text != "")
        {
            objData.ToDt = Convert.ToDateTime(txtto.Text);
        }


        gvStatus.DataSource = objData.GetUploadStatus();
        gvStatus.DataBind();
    }
    protected void gvStatus_PageIndexChanging(object sender, GridViewPageEventArgs e)
    {
        gvStatus.PageIndex = e.NewPageIndex;
        BindGrid();
    }
    protected void gvStatus_Sorting(object sender, GridViewSortEventArgs e)
    {
        objData = new DataUpload();
        objData.CompanyName = txtCompany.Text;
        if (txtfrom.Text != "")
        {
            objData.FromDt = Convert.ToDateTime(txtfrom.Text);
        }
        if (txtto.Text != "")
        {
            objData.ToDt = Convert.ToDateTime(txtto.Text);
        }
               
        DataTable dt = objData.GetUploadStatus().Tables[0];
                  
        DataView dv=new DataView(dt);
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
        gvStatus.DataSource = dv;
        gvStatus.DataBind();

    }
    private void ClearControl()
    {
        txtCompany.Text = String.Empty;
        txtfrom.Text = String.Empty;
        txtto.Text = String.Empty;
        DataSet ds = new DataSet();
        ds = null;
        gvStatus.DataSource = ds;
        gvStatus.DataBind();

    }


    protected void btnClear_Click(object sender, EventArgs e)
    {
        ClearControl();
    }
}

