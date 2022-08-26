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
using System.IO;
using System.Drawing;
using iTextSharp.text;
using iTextSharp.text.pdf;

public partial class Admin_report : System.Web.UI.Page
{
    CreateEmp objEmp = new CreateEmp();
    report objRep = new report();
    static int count = 0;

    protected void Page_Load(object sender, EventArgs e)
    {
        Response.Cache.SetCacheability(HttpCacheability.NoCache);
        LinkButton lnk = (LinkButton)Master.FindControl("lnkRep");
        lnk.Font.Bold = true;
        if (Session["user"] == null)
        {
            Response.Redirect("Login.aspx");
        }
        if (!IsPostBack)
        {
            BindDropDown();
            //BindGrid();
            CalendarExtender1.SelectedDate = DateTime.Now;
            CalendarExtender2.SelectedDate = DateTime.Now;
        }
        else
        {
            CalendarExtender1.SelectedDate = null;
            CalendarExtender2.SelectedDate = null;
        }

        txtfrom.Attributes.Add("ReadOnly", "true");
        txtto.Attributes.Add("ReadOnly", "true");
    }
    public void BindDropDown()
    {
        ops.evadvantage.Utilities.BindDropDownList(ddlClient, objEmp.GetCompany(), "CompanyName", "CompanyId");

        if (ddlClient.Items.Count > 0)
        {
            ddlClient.Items.RemoveAt(0);
            ddlClient.Items.Insert(0, new System.Web.UI.WebControls.ListItem("-All-", "0"));
        }
    }
    protected void btnExport_Click(object sender, EventArgs e)
    {

        MemoryStream m = new MemoryStream();
        Document document = new Document();
        try
        {
            // step 2: we set the ContentType and create an instance of the Writer
            Response.ContentType = "application/pdf";
            PdfWriter.GetInstance(document, m);

            // step 3
            document.Open();

            // step 4
            //document.Add(new Paragraph(DateTime.Now.ToString()));
            create(document);
        }
        catch (DocumentException ex)
        {
            Console.Error.WriteLine(ex.StackTrace);
            Console.Error.WriteLine(ex.Message);
        }
        // step 5: Close document
        document.Close();

        // step 6: Write pdf bytes to outputstream
        Response.OutputStream.Write(m.GetBuffer(), 0, m.GetBuffer().Length);
        Response.OutputStream.Flush();
        Response.OutputStream.Close();

    }
    private void create(Document document)
    {
        int userType = 0;
        if (rdoAdmin.Checked)
            userType = 0;
        else if (rdoNonAdmin.Checked)
            userType = 1;
        else if (rdoAll.Checked)
            userType = 2;



        iTextSharp.text.Image img = iTextSharp.text.Image.GetInstance(Server.MapPath("../images/image001.png"));
        img.ScalePercent(25);
        document.Add(img);

        Paragraph par1;

        par1 = new Paragraph(new Chunk("Client : " + ddlClient.SelectedItem.Text, FontFactory.GetFont(FontFactory.HELVETICA_BOLD, (float)FontSize.XXLarge)));
        par1.Alignment = Element.ALIGN_TOP;
        par1.Font.Size = (float)FontSize.XXLarge;
        document.Add(par1);

        par1 = new Paragraph(new Chunk("Period : " + txtfrom.Text + " To " + txtto.Text, FontFactory.GetFont(FontFactory.HELVETICA_BOLD, (float)FontSize.XXLarge)));
        par1.Alignment = Element.ALIGN_TOP;
        par1.Font.Size = (float)FontSize.XXLarge;
        document.Add(par1);

        iTextSharp.text.Table tab1 = new iTextSharp.text.Table(7, 1);
        tab1.BorderWidth = 0.0f;
        tab1.Width = 100f;

        iTextSharp.text.Cell td6 = new iTextSharp.text.Cell();
        par1 = new Paragraph(new Chunk("Type Of Verification", FontFactory.GetFont(FontFactory.HELVETICA_BOLD, (float)FontSize.XXLarge)));
        par1.Alignment = Element.ALIGN_TOP;
        par1.Font.Size = (float)FontSize.XXLarge;

        td6.Add(par1);
        td6.BorderWidthBottom = iTextSharp.text.Cell.NO_BORDER;
        td6.VerticalAlignment = iTextSharp.text.Cell.ALIGN_JUSTIFIED_ALL;
        tab1.AddCell(td6);

        /////////////////////
        iTextSharp.text.Cell td11 = new iTextSharp.text.Cell();
        par1 = new Paragraph(new Chunk("Company Name", FontFactory.GetFont(FontFactory.HELVETICA_BOLD, (float)FontSize.XXLarge)));
        par1.Alignment = Element.ALIGN_TOP;
        par1.Font.Size = (float)FontSize.XXLarge;

        td11.Add(par1);
        td11.BorderWidthBottom = iTextSharp.text.Cell.NO_BORDER;
        td11.VerticalAlignment = iTextSharp.text.Cell.ALIGN_JUSTIFIED_ALL;
        tab1.AddCell(td11);
        /////////////////////////////

        iTextSharp.text.Cell td7 = new iTextSharp.text.Cell();
        par1 = new Paragraph(new Chunk("Employee Name", FontFactory.GetFont(FontFactory.HELVETICA_BOLD, 12)));
        par1.Alignment = Element.ALIGN_TOP;
        par1.Font.Size = (float)FontSize.XXLarge;

        td7.Add(par1);
        td7.BorderWidthBottom = iTextSharp.text.Cell.NO_BORDER;
        td7.VerticalAlignment = iTextSharp.text.Cell.ALIGN_JUSTIFIED_ALL;
        tab1.AddCell(td7);

        iTextSharp.text.Cell td8 = new iTextSharp.text.Cell();
        par1 = new Paragraph(new Chunk("Social Security #", FontFactory.GetFont(FontFactory.HELVETICA_BOLD, 12)));
        par1.Alignment = Element.ALIGN_TOP;
        par1.Font.Size = (float)FontSize.XXLarge;

        td8.Add(par1);
        td8.BorderWidthBottom = iTextSharp.text.Cell.NO_BORDER;
        td8.VerticalAlignment = iTextSharp.text.Cell.ALIGN_JUSTIFIED_ALL;
        tab1.AddCell(td8);

        iTextSharp.text.Cell td9 = new iTextSharp.text.Cell();
        par1 = new Paragraph(new Chunk("Verifier", FontFactory.GetFont(FontFactory.HELVETICA_BOLD, 12)));
        par1.Alignment = Element.ALIGN_TOP;
        par1.Font.Size = (float)FontSize.XXLarge;

        td9.Add(par1);
        td9.BorderWidthBottom = iTextSharp.text.Cell.NO_BORDER;
        td9.VerticalAlignment = iTextSharp.text.Cell.ALIGN_JUSTIFIED_ALL;
        tab1.AddCell(td9);

        iTextSharp.text.Cell td10 = new iTextSharp.text.Cell();
        par1 = new Paragraph(new Chunk("Verification Date", FontFactory.GetFont(FontFactory.HELVETICA_BOLD, 12)));
        par1.Alignment = Element.ALIGN_TOP;
        par1.Font.Size = (float)FontSize.XXLarge;

        td10.Add(par1);
        td10.BorderWidthBottom = iTextSharp.text.Cell.NO_BORDER;
        td10.VerticalAlignment = iTextSharp.text.Cell.ALIGN_JUSTIFIED_ALL;
        tab1.AddCell(td10);

        /////////////////////
        iTextSharp.text.Cell td13 = new iTextSharp.text.Cell();
        par1 = new Paragraph(new Chunk("Credit Card", FontFactory.GetFont(FontFactory.HELVETICA_BOLD, (float)FontSize.XXLarge)));
        par1.Alignment = Element.ALIGN_TOP;
        par1.Font.Size = (float)FontSize.XXLarge;

        td13.Add(par1);
        td13.BorderWidthBottom = iTextSharp.text.Cell.NO_BORDER;
        td13.VerticalAlignment = iTextSharp.text.Cell.ALIGN_JUSTIFIED_ALL;
        tab1.AddCell(td13);
        /////////////////////////////

        document.Add(tab1);

        iTextSharp.text.Table tab = new iTextSharp.text.Table(7, 1);
        tab.BorderWidth = 0.0f;
        tab.Width = 100f;
        

        DataSet ds = objRep.GetData(Convert.ToInt32(ddlClient.SelectedValue), Convert.ToDateTime(txtfrom.Text), Convert.ToDateTime(txtto.Text), userType);

        for (int i = 0; i < ds.Tables[0].Rows.Count; i++)
        {
            iTextSharp.text.Cell td1 = new iTextSharp.text.Cell();
            par1 = new Paragraph(ds.Tables[0].Rows[i]["TypeOfVerification"].ToString());
            par1.Alignment = Element.ALIGN_TOP;
            par1.Font.Size = (float)FontSize.XLarge;
            td1.Add(par1);
            td1.BorderWidthBottom = iTextSharp.text.Cell.NO_BORDER;
            td1.VerticalAlignment = iTextSharp.text.Cell.ALIGN_JUSTIFIED_ALL;
            tab.AddCell(td1);


            /////////////
            iTextSharp.text.Cell td12 = new iTextSharp.text.Cell();
            par1 = new Paragraph(ds.Tables[0].Rows[i]["CompName"].ToString());
            par1.Alignment = Element.ALIGN_TOP;
            par1.Font.Size = (float)FontSize.XLarge;
            td12.Add(par1);
            td12.BorderWidthBottom = iTextSharp.text.Cell.NO_BORDER;
            td12.VerticalAlignment = iTextSharp.text.Cell.ALIGN_JUSTIFIED_ALL;
            tab.AddCell(td12);
            ////////////


            iTextSharp.text.Cell td2 = new iTextSharp.text.Cell();
            par1 = new Paragraph(ds.Tables[0].Rows[i]["EmployeeName"].ToString());
            par1.Alignment = Element.ALIGN_TOP;
            par1.Font.Size = (float)FontSize.XLarge;
            td2.Add(par1);
            td2.BorderWidthBottom = iTextSharp.text.Cell.NO_BORDER;
            td2.VerticalAlignment = iTextSharp.text.Cell.ALIGN_JUSTIFIED_ALL;
            tab.AddCell(td2);

            iTextSharp.text.Cell td3 = new iTextSharp.text.Cell();
            par1 = new Paragraph(ds.Tables[0].Rows[i]["SSN"].ToString());
            par1.Alignment = Element.ALIGN_TOP;
            par1.Font.Size = (float)FontSize.XLarge;
            td3.Add(par1);
            td3.BorderWidthBottom = iTextSharp.text.Cell.NO_BORDER;
            td3.VerticalAlignment = iTextSharp.text.Cell.ALIGN_JUSTIFIED_ALL;
            tab.AddCell(td3);

            iTextSharp.text.Cell td4 = new iTextSharp.text.Cell();
            par1 = new Paragraph(ds.Tables[0].Rows[i]["VerifierName"].ToString());
            par1.Alignment = Element.ALIGN_TOP;
            par1.Font.Size = (float)FontSize.XLarge;
            td4.Add(par1);
            td4.BorderWidthBottom = iTextSharp.text.Cell.NO_BORDER;
            td4.VerticalAlignment = iTextSharp.text.Cell.ALIGN_JUSTIFIED_ALL;
            tab.AddCell(td4);

            iTextSharp.text.Cell td5 = new iTextSharp.text.Cell();
            par1 = new Paragraph(ds.Tables[0].Rows[i]["DateOfIssued"].ToString());
            par1.Alignment = Element.ALIGN_TOP;
            par1.Font.Size = (float)FontSize.XLarge;
            td5.Add(par1);
            td5.BorderWidthBottom = iTextSharp.text.Cell.NO_BORDER;
            td5.VerticalAlignment = iTextSharp.text.Cell.ALIGN_JUSTIFIED_ALL;
            tab.AddCell(td5);

            /////////////
            iTextSharp.text.Cell td14 = new iTextSharp.text.Cell();
            par1 = new Paragraph(ds.Tables[0].Rows[i]["CreditCard"].ToString());
            par1.Alignment = Element.ALIGN_TOP;
            par1.Font.Size = (float)FontSize.XLarge;
            td14.Add(par1);
            td14.BorderWidthBottom = iTextSharp.text.Cell.NO_BORDER;
            td14.VerticalAlignment = iTextSharp.text.Cell.ALIGN_JUSTIFIED_ALL;
            tab.AddCell(td14);
            ////////////

        }
        document.Add(tab);

        iTextSharp.text.Table tab2 = new iTextSharp.text.Table(5, 1);
        tab2.BorderWidth = 0.0f;
        document.Add(tab2);

        DataSet dsData = objRep.GetData(Convert.ToInt32(ddlClient.SelectedValue), Convert.ToDateTime(txtfrom.Text), Convert.ToDateTime(txtto.Text), userType);


        par1 = new Paragraph(new Chunk("Total Number of Employment Verifications : " + dsData.Tables[2].Rows[0]["no"].ToString(), FontFactory.GetFont(FontFactory.HELVETICA_BOLD, (float)FontSize.XXLarge)));
        par1.Alignment = Element.ALIGN_TOP;
        par1.Font.Size = (float)FontSize.XXLarge;
        document.Add(par1);

        par1 = new Paragraph(new Chunk("Total Number of Employment and Wage Verifications : " + dsData.Tables[1].Rows[0]["no"].ToString(), FontFactory.GetFont(FontFactory.HELVETICA_BOLD, (float)FontSize.XXLarge)));
        par1.Alignment = Element.ALIGN_TOP;
        par1.Font.Size = (float)FontSize.XXLarge;
        document.Add(par1);

        par1 = new Paragraph(new Chunk("Total Number of Social Service Verifications : " + dsData.Tables[3].Rows[0]["no"].ToString(), FontFactory.GetFont(FontFactory.HELVETICA_BOLD, (float)FontSize.XXLarge)));
        par1.Alignment = Element.ALIGN_TOP;
        par1.Font.Size = (float)FontSize.XXLarge;
        document.Add(par1);
		
		        par1 = new Paragraph(new Chunk("Total Number of Manual Social Service Verifications : " + dsData.Tables[4].Rows[0]["no"].ToString(), FontFactory.GetFont(FontFactory.HELVETICA_BOLD, (float)FontSize.XXLarge)));
        par1.Alignment = Element.ALIGN_TOP;
        par1.Font.Size = (float)FontSize.XXLarge;
        document.Add(par1);
    }


    protected void btnGen_Click(object sender, EventArgs e)
    {
        BindGrid();

    }
    protected void gvData_PageIndexChanging(object sender, GridViewPageEventArgs e)
    {
        gvData.PageIndex = e.NewPageIndex;
        BindGrid();
    }
    private void BindGrid()
    {
        int userType = 0;
        if (rdoAdmin.Checked)
            userType = 0;
        else if (rdoNonAdmin.Checked)
            userType = 1;
        else if (rdoAll.Checked)
            userType = 2;




        DataSet ds = objRep.GetData(Convert.ToInt32(ddlClient.SelectedValue), Convert.ToDateTime(txtfrom.Text), Convert.ToDateTime(txtto.Text), userType);
        //if (ddlClient.SelectedValue.ToString() != "0" || txtfrom.Text != "" || txtfrom.Text != "")
        if (ds != null && ds.Tables.Count > 0 && (ds.Tables[0].Rows.Count > 0 || ds.Tables[1].Rows.Count > 0 || ds.Tables[2].Rows.Count > 0))
        {

            gvData.DataSource = ds;
            gvData.DataBind();
            if (ds.Tables[0].Rows.Count != 0)
            {
                tbl.Visible = true;
                lblE.Text = ds.Tables[2].Rows[0]["no"].ToString();
                lblEW.Text = ds.Tables[1].Rows[0]["no"].ToString();
                lblSS.Text = ds.Tables[3].Rows[0]["no"].ToString();
                lblMSS.Text = ds.Tables[4].Rows[0]["no"].ToString();
            }
            else
            {
                tbl.Visible = false;
                lblE.Text = "";
                lblEW.Text = "";
                lblSS.Text = "";
                lblMSS.Text = "";
            }
        }


        else
        {
            ds = new DataSet();
            ds = null;
            gvData.DataSource = ds;
            gvData.DataBind();
            tbl.Visible = false;
            lblE.Text = "";
            lblEW.Text = "";
            lblSS.Text = "";
            lblMSS.Text = "";

        }




    }
    protected void gvData_Sorting(object sender, GridViewSortEventArgs e)
    {
        int userType = 0;
        if (rdoAdmin.Checked)
            userType = 0;
        else if (rdoNonAdmin.Checked)
            userType = 1;
        else if (rdoAll.Checked)
            userType = 2;


        DataSet ds = objRep.GetData(Convert.ToInt32(ddlClient.SelectedValue), Convert.ToDateTime(txtfrom.Text), Convert.ToDateTime(txtto.Text), userType);

        DataTable dt = ds.Tables[0];

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
        gvData.DataSource = dv;
        gvData.DataBind();
    }
}
