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
using System.Xml;

public partial class Admin_changePrice : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        Response.Cache.SetCacheability(HttpCacheability.NoCache);
        LinkButton lnk = (LinkButton)Master.FindControl("lnkChange");
        lnk.Font.Bold = true;
        if (Session["user"] == null)
        {
            Response.Redirect("Login.aspx");
        }
        if (!IsPostBack)
        {
            XmlDocument xmlDoc = new XmlDocument();
            xmlDoc.Load(Server.MapPath("xml/price.xml"));
            XmlNodeList emp;
            emp = xmlDoc.SelectNodes("//Employment");
            
            foreach (XmlElement item in emp)
            {
                txtEmployment.Text = item.GetAttribute("cost");
            }
            XmlNodeList sal;
            sal = xmlDoc.SelectNodes("//EmploymentSalary");

            foreach (XmlElement item in sal)
            {
                txtSalary.Text = item.GetAttribute("cost");
            }
        }
        txtEmployment.Attributes.Add("onkeypress", "isNumberKey(event)");
        txtSalary.Attributes.Add("onkeypress", "isNumberKey(event)");
    }
    protected void btnSave_Click(object sender, EventArgs e)
    {
         XmlDocument xmlDoc = new XmlDocument();
         xmlDoc.Load(Server.MapPath("xml/price.xml"));

         XmlNodeList emp;
         emp = xmlDoc.SelectNodes("//Employment");
         foreach(XmlElement element in emp)
         {
            string name = element.GetAttribute("name");
            string xpath;
            xpath = "//Employment[@name='" + name + "']";
            XmlElement empCost;
            empCost =(XmlElement)xmlDoc.SelectSingleNode(xpath);                          
            empCost.SetAttribute("cost",txtEmployment.Text);
         }

         XmlNodeList sal;
         sal = xmlDoc.SelectNodes("//EmploymentSalary");
         foreach (XmlElement item in sal)
         {
             string name = item.GetAttribute("name");
             string xpath;
             xpath = "//EmploymentSalary[@name='" + name + "']";
             XmlElement salCost;
             salCost = (XmlElement)xmlDoc.SelectSingleNode(xpath);
                       
             salCost.SetAttribute("cost", txtSalary.Text);
         }

         xmlDoc.Save(Server.MapPath("xml/price.xml"));
         ops.evadvantage.Utilities.MessageBox("Price(s) changed successfully.", Page);

    }
}
