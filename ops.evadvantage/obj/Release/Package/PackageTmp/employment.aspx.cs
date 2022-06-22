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

public partial class employment : System.Web.UI.Page
{
    EmpInfo objEmpInfo = new EmpInfo();
    protected void Page_Load(object sender, EventArgs e)
    {
        try
        {
            Response.Cache.SetCacheability(HttpCacheability.NoCache);
            if (Session["user"] == null)
            {
                Response.Redirect("index.aspx");
            }
            if (Session["payment"] != null)
            {
                lblissue.Text = DateTime.Now.ToString("MM/dd/yyyy");
                lbltype.Text = "Employment";
                lblrefno.Text = "";
                lblNote.Text = "None";

                objEmpInfo.EmpInfoId = Convert.ToInt32(Session["empinfoid"]);
                DataSet ds = objEmpInfo.GetInfoById();

                lblname.Text = ds.Tables[0].Rows[0]["FirstName"].ToString() + " " + ds.Tables[0].Rows[0]["LastName"].ToString();

                lblinfo.Text = Convert.ToDateTime(ds.Tables[0].Rows[0]["UploadDt"]).ToString("MM/dd/yyyy");
                lblemployer.Text = ds.Tables[0].Rows[0]["CompanyName"].ToString();
                lblemployeradd.Text = "N/A";
                lblempfn.Text = ds.Tables[0].Rows[0]["FirstName"].ToString();
                lblempmn.Text = ds.Tables[0].Rows[0]["MiddleName"].ToString();
                lblempln.Text = ds.Tables[0].Rows[0]["LastName"].ToString();
                lblssn.Text = ds.Tables[0].Rows[0]["SSN"].ToString().Substring(0, 3) + "-" + ds.Tables[0].Rows[0]["SSN"].ToString().Substring(3, 2) + "-" + ds.Tables[0].Rows[0]["SSN"].ToString().Substring(5, 4);
                lblempid.Text = ds.Tables[0].Rows[0]["EmployeeId"].ToString();
                if (ds.Tables[0].Rows[0]["CompanyID"].ToString() == "4")
                {
                    tr1.Visible = true;
                    tr2.Visible = true;
                }
                if (ds.Tables[0].Rows[0]["EmpStatus"].ToString() == "A")
                {
                    lblestatus.Text = "Active";
                }
                else if (ds.Tables[0].Rows[0]["EmpStatus"].ToString() == "L")
                {
                    lblestatus.Text = "LOA";
                }
                else if (ds.Tables[0].Rows[0]["EmpStatus"].ToString() == "T")
                {
                    lblestatus.Text = "Terminated";
                }
                else if (ds.Tables[0].Rows[0]["EmpStatus"].ToString() == "S")
                {
                    lblestatus.Text = "Separated";
                }
                else if (ds.Tables[0].Rows[0]["EmpStatus"].ToString() == "R")
                {
                    lblestatus.Text = "Retired";
                }
                else if (ds.Tables[0].Rows[0]["EmpStatus"].ToString() == "I")
                {
                    lblestatus.Text = "Inactive";
                }
                else
                {
                    lblestatus.Text = ds.Tables[0].Rows[0]["EmpStatus"].ToString();
                }

                if (ds.Tables[0].Rows[0]["JobStatus"].ToString() == "F")
                {
                    lbljstatus.Text = "Full-Time";
                }
                else if (ds.Tables[0].Rows[0]["JobStatus"].ToString() == "P")
                {
                    lbljstatus.Text = "Part-Time";
                }
                else
                {
                    lbljstatus.Text = ds.Tables[0].Rows[0]["JobStatus"].ToString();
                }
                DateTime exp;
                
                if (ds.Tables[0].Rows[0]["OriginalHireDate"] != null && ds.Tables[0].Rows[0]["OriginalHireDate"].ToString() != "")
                {
                    string y1 = ds.Tables[0].Rows[0]["OriginalHireDate"].ToString().Substring(0, 4);
                    string m1 = ds.Tables[0].Rows[0]["OriginalHireDate"].ToString().Substring(4, 2);
                    string d1 = ds.Tables[0].Rows[0]["OriginalHireDate"].ToString().Substring(6, 2);
                    lblphdt.Text = m1 + "/" + d1 + "/" + y1;
                }

                if (ds.Tables[0].Rows[0]["RecentHireDate"] != null && ds.Tables[0].Rows[0]["RecentHireDate"].ToString() != "")
                {
                    try
                    {
                        string y = ds.Tables[0].Rows[0]["RecentHireDate"].ToString().Substring(0, 4);
                        string m = ds.Tables[0].Rows[0]["RecentHireDate"].ToString().Substring(4, 2);
                        string d = ds.Tables[0].Rows[0]["RecentHireDate"].ToString().Substring(6, 2);
                        lblrhdt.Text = m + "/" + d + "/" + y;
                        TimeSpan ts = Convert.ToDateTime(lblissue.Text).Subtract(Convert.ToDateTime(lblrhdt.Text));
                        exp = DateTime.MinValue + ts;
                        int years = exp.Year - 1;
                        int month = exp.Month - 1;
                        lblyears.Text = years.ToString() + "." + month.ToString();
                    }
                    catch { }
                }
                else
                {
                    lblrhdt.Text = "N/A";
                    lblyears.Text = "N/A";
                }
               
                lbltitle.Text = ds.Tables[0].Rows[0]["JobTitle"].ToString();

                if (ds.Tables[0].Rows[0]["Separation"].ToString() == "TM")
                {
                    if (ds.Tables[0].Rows[0]["LastDayWorkDt"] != null && ds.Tables[0].Rows[0]["LastDayWorkDt"].ToString() != "")
                    {
                        //tblsep.Visible = true;
                        string y2 = ds.Tables[0].Rows[0]["LastDayWorkDt"].ToString().Substring(0, 4);
                        string m2 = ds.Tables[0].Rows[0]["LastDayWorkDt"].ToString().Substring(4, 2);
                        string d2 = ds.Tables[0].Rows[0]["LastDayWorkDt"].ToString().Substring(6, 2);
                        lblsepdt.Text = m2 + "/" + d2 + "/" + y2;

                        //lblsepdt.Text = Convert.ToDateTime(ds.Tables[0].Rows[0]["LastDayWorkDt"]).ToString("MM/dd/yyyy");
                        lblreason.Text = ds.Tables[0].Rows[0]["SeparationCode"].ToString();
                    }
                    else
                    {
                        lblsepdt.Text = "";
                        lblreason.Text = "";
                    }
                }
                else
                {
                    //tblsep.Visible = false;
                    lblsepdt.Text = "N/A";
                    lblreason.Text = "N/A";
                }
                //DataSet dsPay = objEmpInfo.GetPayInfoById();
                //if (dsPay.Tables[0].Rows.Count != 0)
                //{
                //    lblrbasis.Text = dsPay.Tables[0].Rows[0]["RateBasis"].ToString();
                //    lblfrequency.Text = dsPay.Tables[0].Rows[0]["FrequencyCode"].ToString();
                //    lblcbpr.Text = dsPay.Tables[0].Rows[0]["EmpBaseRate"].ToString();

                //    lblhourly.Text = dsPay.Tables[1].Rows[0]["hours"].ToString();
                //    lblmrcir.Text = "N/A";
                //    lblytd.Text = dsPay.Tables[1].Rows[0]["cgy"].ToString();
                //    lblGE1.Text = dsPay.Tables[1].Rows[0]["pgy"].ToString();
                //    lblGE2.Text = dsPay.Tables[1].Rows[0]["lgy"].ToString();
                //    lblcyear.Text = dsPay.Tables[1].Rows[0]["cyear"].ToString() + " :";
                //    lblpyear.Text = dsPay.Tables[1].Rows[0]["pery"].ToString() + " :";
                //    lbllyear.Text = dsPay.Tables[1].Rows[0]["lyear"].ToString() + " :";
                //}


            }
            else
            {
                //Response.Redirect("veriHome.aspx");
                if (Request.QueryString["from"] != null)
                {
                    Response.Redirect("Admin/verification.aspx");
                }
                else
                {
                    Response.Redirect("veriHome.aspx");
                }
            }
        }
        catch (Exception ex)
        {
            Response.Write("<br>" + "Source : " + ex.Source);
            Response.Write("<br>" + "Message : " + ex.Message);
            Response.Write("<br>" + "StackTrace : " + ex.StackTrace);
            //if (Request.QueryString["from"] != null)
            //{
            //    Response.Redirect("Admin/verification.aspx");
            //}
            //else
            //{
            //    Response.Redirect("veriHome.aspx");
            //}
        }
    }



    protected void BtnOk_Click(object sender, EventArgs e)
    {
        Session["payment"] = null;

        if (Request.QueryString["from"] != null)
        {
            Response.Redirect("Admin/verification.aspx");
        }
        else
        {
            Response.Redirect("veriHome.aspx");
        }
    }
    //protected void btnPrint_Click(object sender, EventArgs e)
    //{
    //    HtmlGenericControl div = (HtmlGenericControl)Master.FindControl("main_header");
    //    div.Visible = false;
    //    HtmlGenericControl div1 = (HtmlGenericControl)Master.FindControl("foot");
    //    div1.Visible = false;
    //    HtmlGenericControl body = (HtmlGenericControl)Master.FindControl("main_body");
    //    body.Attributes.Remove("Class");
    //}
}
