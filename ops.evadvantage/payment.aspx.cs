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
using EVA.AuthorizeNetCode;
using System.Xml;

public partial class payment : System.Web.UI.Page
{
    

    protected void Page_Load(object sender, EventArgs e)
    {
        Response.Cache.SetCacheability(HttpCacheability.NoCache);
        if (Session["user"] == null)
        {
            Response.Redirect("index.aspx");
        }
        if (Session["payment"] == null)
        {
            Response.Redirect("veriHome.aspx");
        }
        if (Session["vertype"].ToString() == "2")
        {
            lblType.Text = "Employment and Salary";
            lblAmount.Text = "US $ " + Session["price"].ToString();
        }
        else
        {
            lblType.Text = "Employment Only";
            lblAmount.Text = "US $ " + Session["price"].ToString();
        }
    }

    protected void btnView_Click(object sender, EventArgs e)
    {
        if (Session["vertype"].ToString() == "2")
        {
            if (Request.QueryString["from"] != null)
            {
                Response.Redirect("report/VFRPT.aspx?from=admin");
            }
            else
            {
                Response.Redirect("report/VFRPT.aspx");
            }
        }
        else
        {
            if (Request.QueryString["from"] != null)
            {
                //Response.Redirect("employment.aspx?from=admin");
                Response.Redirect("report/EMPRPT.aspx?from=admin");
            }
            else
            {
                //Response.Redirect("employment.aspx");
                Response.Redirect("report/EMPRPT.aspx");
            }
        }
    }
}
