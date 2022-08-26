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

public partial class Admin_detail : System.Web.UI.Page
{
    string comp;
    string fdt;
    string tdt;
    protected void Page_Load(object sender, EventArgs e)
    {
        Response.Cache.SetCacheability(HttpCacheability.NoCache);
        LinkButton lnk = (LinkButton)Master.FindControl("lnkUpload");
        lnk.Font.Bold = true;

        comp = Request.QueryString["comp"].ToString();
        fdt = Request.QueryString["fdt"].ToString();
        tdt = Request.QueryString["tdt"].ToString();
    }
    protected void btnClose_Click(object sender, EventArgs e)
    {
        //ScriptManager.RegisterClientScriptBlock(Page, typeof(Page), "MyKey", "window.self.close();", true);
        Response.Redirect("dataUpload.aspx?comp=" + comp + "&fdt=" + fdt + "&tdt=" + tdt);
    }
}
