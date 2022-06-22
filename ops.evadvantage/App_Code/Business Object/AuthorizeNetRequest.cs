using System;
using System.Data;
using System.Configuration;
//using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
//using System.Xml.Linq;

/// <summary>
/// Summary description for AuthorizeNetRequest
/// </summary>
public class AuthorizeNetRequest
{
	public AuthorizeNetRequest()
	{
		//
		// TODO: Add constructor logic here
		//
	}
      #region Private Member(s)
       private string mstrLogin;
       private double mdblAmount;
       private string mstrTransactionKey;    
       private string mstrCardNumber;
       private string mstrCardExpirationDate;
       private AuthorizeNet.TransactionType enmTransactionType;    
       private string mstrTransactionId;
       private string mstrFirstName;
       private string mstrLastName;
       private string mstrCompanyName;
       private string mstrAddress;
       private string mstrCity;
       private string mstrState;
       private string mstrCountry;
       private string mstrZipCode;
       private string mstrPhoneNumber;
       private string mstrEmail;

       #endregion
    
       #region Public Propertie(s)
       public string TransactionId
       {
           get { return mstrTransactionId; }
           set { mstrTransactionId = value; }
       }
    
    
       public string CardNumber
       {
           get { return mstrCardNumber; }
           set { mstrCardNumber = value; }
       }
    
    
       public double Amount
       {
           get { return mdblAmount; }
           set { mdblAmount = value; }
       }
    
    
       public string Login
       {
           get { return mstrLogin; }
           set { mstrLogin = value; }
      }
    
       public string CardExpirationDate
       {
           get { return mstrCardExpirationDate; }
           set { mstrCardExpirationDate = value; }
       }
    
       public string TransactionKey
       {
           get { return mstrTransactionKey; }
           set { mstrTransactionKey = value; }
       }
       public string FirstName
       {
           get { return mstrFirstName; }
           set { mstrFirstName = value; }
       }
       public string LastName
       {
           get { return mstrLastName; }
           set { mstrLastName = value; }
       }
       public string CompanyName
       {
           get { return mstrCompanyName; }
           set { mstrCompanyName = value; }
       }
       public string Address
       {
           get { return mstrAddress; }
           set { mstrAddress = value; }
       }
       public string City
       {
           get { return mstrCity; }
           set { mstrCity = value; }
       }
       public string State
       {
           get { return mstrState; }
           set { mstrState = value; }
       }
       public string ZipCode
       {
           get { return mstrZipCode; }
           set { mstrZipCode = value; }
       }
       public string Country
       {
           get { return mstrCountry; }
           set { mstrCountry = value; }
       }
       public string PhoneNumber
       {
           get { return mstrPhoneNumber; }
           set { mstrPhoneNumber = value; }
       }
       public string Email
       {
           get { return mstrEmail; }
           set { mstrEmail = value; }
       }
       public AuthorizeNet.TransactionType TransactionType
       {
           get { return enmTransactionType; }
           set { enmTransactionType = value; }
       }
       #endregion

}
