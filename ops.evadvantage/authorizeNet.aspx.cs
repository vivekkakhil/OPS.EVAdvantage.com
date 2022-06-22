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
using EVA.AuthorizeNetCode;
using EVA.BLL;

public partial class authorizeNet : System.Web.UI.Page
{
    CreateEmp objEmp = new CreateEmp();
    AuthCode objAuth = new AuthCode();
    Verify objVeri = new Verify();
    XmlDocument xmlDoc;
    //private const string TRANSACTION_KEY ="9V9wUv6Yd92t27t5";
    private string TRANSACTION_KEY = ConfigurationManager.AppSettings["TransactionKey"].ToString();
    //private const string CREDITCARD_NUMBER = "4111111111111111";
    //private const string LOGINID = "6zz6m5N4Et";
    private string LOGINID = ConfigurationManager.AppSettings["LoginId"].ToString();
    //private const string CARD_EXPIRATION_DATE = "01-09";

    private string TransationID
    {
        get
        {
            if (ViewState["TransationID"] == null)
                ViewState["TransationID"] = string.Empty;

            return (string)ViewState["TransationID"];
        }
        set
        {
            ViewState["TransationID"] = value;
        }
    }
    protected void Page_Load(object sender, EventArgs e)
    {
        Response.Cache.SetCacheability(HttpCacheability.NoCache);
        if (Session["user"] == null)
        {
            Response.Redirect("index.aspx");
        }
        else
        {
            BindDropDown();
            objEmp.UserName = Session["user"].ToString();
            DataSet ds = objEmp.GetUserName();
            if (ds.Tables[0].Rows.Count != 0)
            {
                //UserDetailId = Convert.ToInt32(ds.Tables[0].Rows[0]["UserDetailId"]);
                txtFirstName.Text = ds.Tables[0].Rows[0]["FirstName"].ToString();
                txtLastName.Text = ds.Tables[0].Rows[0]["LastName"].ToString();
                txtCompany.Text = ds.Tables[0].Rows[0]["CompanyName"].ToString();
                txtAddress.Text = ds.Tables[0].Rows[0]["CompanyAdd1"].ToString()+" "+ ds.Tables[0].Rows[0]["CompanyAdd2"].ToString();

                txtCity.Text = ds.Tables[0].Rows[0]["City"].ToString();
                ddlState.SelectedValue = ds.Tables[0].Rows[0]["StateId"].ToString();
                txtZip.Text = ds.Tables[0].Rows[0]["ZipCode"].ToString();
                txtCountry.Text = ds.Tables[0].Rows[0]["Country"].ToString();
                txtPhone.Text = ds.Tables[0].Rows[0]["WorkTelephone"].ToString();                
                txtEmail.Text = ds.Tables[0].Rows[0]["Email"].ToString();
                
                
                
            }
        }

        txtCredit.Attributes.Add("onkeypress", "isNumberKey(event)");
        txtMonth.Attributes.Add("onkeypress", "isNumberKey(event)");
        txtYear.Attributes.Add("onkeypress", "isNumberKey(event)");
        //txtCardCode.Attributes.Add("onkeypress", "isNumberKey(event)");
    }
    private void BindDropDown()
    {
        EVA.Utilities.BindDropDownList(ddlState, objEmp.GetState(), "StateName", "StateId");
       
    }
    protected void btnSubmit_Click(object sender, EventArgs e)
    {
        xmlDoc = new XmlDocument();
        xmlDoc.Load(Server.MapPath("xml/paymentInfo.xml"));

        SetXML("firstname", txtFirstName);
        SetXML("lastname", txtLastName);
        SetXML("company", txtCompany);
        SetXML("address", txtAddress);
        SetXML("city", txtCity);
        SetXMLDdl("state", ddlState);
        SetXML("zipcode", txtZip);
        SetXML("country", txtCountry);
        SetXML("phonenumber", txtPhone);
        SetXML("email", txtEmail);
        SetXML("creditcard", txtCredit);
        SetXML("expiremonth", txtMonth);
        SetXML("expireyear", txtYear);
        SetXML("cardcode", txtAddress);

        xmlDoc.Save(Server.MapPath("xml/paymentInfo.xml"));

        //Response.Redirect("payment.aspx");
        DoAuthorizationAndPayment();

       
    }
    private AuthCode PrepareParameterForAuthCode()
    {
        objAuth = new AuthCode();
        objAuth.UserId = Convert.ToInt32(Session["userid"]);
        objAuth.Status = "U";
        objAuth.ExpiredDate = DateTime.Now;

        return objAuth;
    }
    private void SetXML(string nodename,TextBox txt)
    {
        XmlNodeList emp;
        emp = xmlDoc.SelectNodes("//"+ nodename +"");

        foreach (XmlElement element in emp)
        {
            string xpath;
            xpath = "//" + nodename + "[@name='" + nodename + "']";
            XmlElement empCost;
            empCost = (XmlElement)xmlDoc.SelectSingleNode(xpath);
            empCost.SetAttribute("value", txt.Text);
        }
    }
    private void SetXMLDdl(string nodename, DropDownList ddl)
    {
        XmlNodeList emp;
        emp = xmlDoc.SelectNodes("//" + nodename + "");

        foreach (XmlElement element in emp)
        {
            string xpath;
            xpath = "//" + nodename + "[@name='" + nodename + "']";
            XmlElement empCost;
            empCost = (XmlElement)xmlDoc.SelectSingleNode(xpath);
            empCost.SetAttribute("value", ddl.SelectedItem.Text);
        }
    }
    private string GetXML(string nodename)
    {
        XmlNodeList emp;
        emp = xmlDoc.SelectNodes("//" + nodename + "");
            
        foreach (XmlElement item in emp)
        {
            return item.GetAttribute("value");
        }
        return "";
    }
    private void DoAuthorizationAndPayment()
    {
        AuthorizeNetRequest objAuthorizeNetRequest = new AuthorizeNetRequest();

        try
        {
            // This is the account information for merchant account given by Authorize.Net people in email
            // I can see transaction history here.
            objAuthorizeNetRequest.Login = LOGINID;
            objAuthorizeNetRequest.Amount = Convert.ToDouble(Session["price"]);
            //objAuthorizeNetRequest.CardNumber = CREDITCARD_NUMBER;
            //objAuthorizeNetRequest.CardExpirationDate = CARD_EXPIRATION_DATE;
          //  System.Net.ServicePointManager.ServerCertificateValidationCallback = delegate { return true; };


           

            objAuthorizeNetRequest.TransactionType = AuthorizeNet.TransactionType.AUTH_CAPTURE;

            // Below is the API created by me by registering for test account.

            objAuthorizeNetRequest.TransactionKey = TRANSACTION_KEY;

            //Get payment information
            xmlDoc = new XmlDocument();
            xmlDoc.Load(Server.MapPath("xml/paymentInfo.xml"));
            objAuthorizeNetRequest.FirstName = GetXML("firstname");
            objAuthorizeNetRequest.LastName = GetXML("lastname");
            objAuthorizeNetRequest.CompanyName = GetXML("company");
            objAuthorizeNetRequest.Address = GetXML("address");
            objAuthorizeNetRequest.City = GetXML("city");
            objAuthorizeNetRequest.State = GetXML("state");
            objAuthorizeNetRequest.ZipCode = GetXML("zipcode");
            objAuthorizeNetRequest.Country = GetXML("country");
            objAuthorizeNetRequest.PhoneNumber = GetXML("phonenumber");
            objAuthorizeNetRequest.Email = GetXML("email");

            objAuthorizeNetRequest.CardNumber = GetXML("creditcard");
            objAuthorizeNetRequest.CardExpirationDate = GetXML("expiremonth") + "-" + GetXML("expireyear");


            AuthorizeNetRespose objAuthorizeNetResponse = AuthorizeNet.CallAuthorizeNetMethod(objAuthorizeNetRequest);

            //lblTransType.Text = "Authorize And Capture";


            if (objAuthorizeNetResponse.IsSuccess)
            {
                TransationID = objAuthorizeNetResponse.TransactionId;

                //lblMessage.Text = "Thank you for your payment. Your transaction Id is : " + objAuthorizeNetResponse.TransactionId + "";
                //lblMessage.Text = "Thank you for your payment. Please click below button to view your requested verification.";
                Session["payment"] = "Y";

                //if(String.IsNullOrEmpty(Session["Comp"].ToString()))
                if (Session["Comp"] == null)
                {
                    Session["Comp"] = objAuthorizeNetRequest.CompanyName;
                }

                if (Session["vertype"].ToString() == "2")
                {
                    if (Request.QueryString["from"] != null)
                    {
                        ////////////////////
                        objAuth.ExpiredDate = DateTime.Now;
                        objAuth.VerifyId = Convert.ToInt32(Session["userid"]);
                        objAuth.Company = txtCompany.Text;
                        objAuth.IsCreditCard = "Y";
                        objAuth.SSN = Session["ssn"].ToString().Trim().Replace("-", "");
                        objAuth.SaveDataFromAdmin();
                        /////////////////////////////
                    }
                    else
                    {
                        objAuth = PrepareParameterForAuthCode();
                        objAuth.AuthCodeId = Convert.ToInt32(Session["AuthCodeId"]);
                        if (Request.QueryString["from"] != null)
                        {
                            objAuth.Company = Session["Comp"].ToString();
                            objAuth.IsCreditCard = "Y";

                        }
                        objAuth.UpdateDataByVerifier();
                    }
                }
                else
                {
                    objVeri.VerifierId = Convert.ToInt32(Session["userid"]);
                    objVeri.VerifierDate = DateTime.Now;
                    objVeri.UserId = Convert.ToInt32(Session["EmpInfoId"]);
                    if (Request.QueryString["from"] != null)
                    {
                        objVeri.Company = Session["company"].ToString();
                        objVeri.IsCreditCard = "Y";
                    }
                    objVeri.SaveData();
                }
                if (Request.QueryString["from"] != null)
                {
                    Response.Redirect("payment.aspx?from=admin");
                }
                else
                {
                    Response.Redirect("payment.aspx");
                }

            }
            else
            {
                Session["payment"] = null;
                //lblMessage.Text = "Error : " + objAuthorizeNetResponse.Errors;
                EVA.Utilities.MessageBox("Error : " + objAuthorizeNetResponse.Errors, Page);
            }
        }
        catch (Exception excc)
        {

        }
    }
    protected void btnClear_Click(object sender, EventArgs e)
    {
        txtCompany.Text = String.Empty;
        txtFirstName.Text = String.Empty;
        txtLastName.Text = String.Empty;
        txtAddress.Text = String.Empty;
        txtCity.Text = String.Empty;
        ddlState.ClearSelection();
        txtCountry.Text = String.Empty;
        txtPhone.Text = String.Empty;
        txtEmail.Text = String.Empty;
        txtZip.Text = String.Empty;
        txtCredit.Text = String.Empty;
        txtMonth.Text = String.Empty;
        txtYear.Text = String.Empty;
        txtCardCode.Text = String.Empty;
    }
    protected void btnCancel_Click(object sender, EventArgs e)
    {
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
