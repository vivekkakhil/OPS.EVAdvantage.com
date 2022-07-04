using System;
using System.Data;
using System.Configuration;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Xml.Linq;
using ops.evadvantage.AuthorizeNetCode;
using System.Net;
using System.IO;
using System.Text;

/// <summary>
/// Summary description for AuthorizeNet
/// </summary>
public static class AuthorizeNet
{
	
    #region Private Member(s)
    private static string UNEXPECTED_ERROR = "Unexpected error";
    private static string AUTHORIZENET_TEST_URL = "https://test.authorize.net/gateway/transact.dll";
    //private static string AUTHORIZENET_LIVE_URL = "https://authorize.net/gateway/transact.dll";
    private static string AUTHORIZENET_LIVE_URL = "https://secure.authorize.net/gateway/transact.dll";
    #endregion

    #region Transaction Type Enum(s)
    
       // Transaction Type
       public enum TransactionType
       {
           AUTH_CAPTURE = 0,
           AUTH_ONLY,
           PRIOR_AUTH_CAPTURE,
           CREDIT,
           VOID
      }
    
       // Get string for Enum
       public static string GetSringForEnum(TransactionType TransType)
       {
           switch (TransType)
           {
               case TransactionType.AUTH_CAPTURE:
                   return "AUTH_CAPTURE";
                  break;
              case TransactionType.AUTH_ONLY:
                  return "AUTH_ONLY";
                  break;
              case TransactionType.PRIOR_AUTH_CAPTURE:
                   return "PRIOR_AUTH_CAPTURE";
                   break;
              case TransactionType.CREDIT:
                  return "CREDIT";
                  break;
              case TransactionType.VOID:
                  return "VOID";
                  break;
              default:
                  return string.Empty;
                  break;
          }
      } 
   
       #endregion

    /// <summary>
       /// Generate Rququest string
       /// </summary>
       /// <param name="objAuthorizeNetRequest"></param>
       /// <returns></returns>
       private static string GetRequestString(AuthorizeNetRequest objAuthorizeNetRequest,TransactionType TransType)
       {
           StringBuilder stbRequest = new StringBuilder(string.Empty);
    
           stbRequest.Append("x_login=");
           stbRequest.Append(objAuthorizeNetRequest.Login);
           stbRequest.Append("&x_type=");
           stbRequest.Append(GetSringForEnum(TransType));
           stbRequest.Append("&x_amount=");
          stbRequest.Append(objAuthorizeNetRequest.Amount);
           stbRequest.Append("&x_card_num=");
           stbRequest.Append(objAuthorizeNetRequest.CardNumber);
           stbRequest.Append("&x_exp_date=");
          stbRequest.Append(objAuthorizeNetRequest.CardExpirationDate);
           stbRequest.Append("&x_tran_key=");
          stbRequest.Append(objAuthorizeNetRequest.TransactionKey);
           stbRequest.Append("&x_relay_response=FALSE");
          stbRequest.Append("&x_delim_data=TRUE");
           stbRequest.Append("&x_delim_char=|");

           stbRequest.Append("&x_email=");
           stbRequest.Append(objAuthorizeNetRequest.Email);

           // If x_test_request = FALSE, TransactionId is generated.
           stbRequest.Append("&x_test_request=FALSE");
           //stbRequest.Append("&x_test_request=TRUE");
           //stbRequest.Append("&x_testmode=OFF");
   
           // First name and Last will be displayed in Transaction report. (LastName,FirstName)
         stbRequest.Append("&x_first_name=");
         stbRequest.Append(objAuthorizeNetRequest.FirstName);

         stbRequest.Append("&x_last_name=");
         stbRequest.Append(objAuthorizeNetRequest.LastName);

         stbRequest.Append("&x_company=");
         stbRequest.Append(objAuthorizeNetRequest.CompanyName);


         stbRequest.Append("&x_address=");
         stbRequest.Append(objAuthorizeNetRequest.Address);

         stbRequest.Append("&x_city=");
         stbRequest.Append(objAuthorizeNetRequest.City);

         stbRequest.Append("&x_state=");
         stbRequest.Append(objAuthorizeNetRequest.State);

         stbRequest.Append("&x_zip=");
         stbRequest.Append(objAuthorizeNetRequest.ZipCode);

         stbRequest.Append("&x_country=");
         stbRequest.Append(objAuthorizeNetRequest.Country);
         stbRequest.Append("&x_description=Employee verification service");
          
   
         if (TransType == TransactionType.CREDIT || TransType == TransactionType.PRIOR_AUTH_CAPTURE || TransType == TransactionType.VOID)
          {
              stbRequest.Append("&x_trans_id=");
              stbRequest.Append(objAuthorizeNetRequest.TransactionId);
             
          }        
   
          return stbRequest.ToString();
      }
   
      
      /// <summary>
      /// Authorize the merchant detail and if merchant is valid process the credit card.
      /// </summary>
     /// <param name="objAuthorizeNetRequest"></param>
      /// <returns></returns>
      public static AuthorizeNetRespose CallAuthorizeNetMethod(AuthorizeNetRequest objAuthorizeNetRequest)
      {
         AuthorizeNetRespose objAuthorizeNetResponse = new AuthorizeNetRespose();
         try
         {
             string strRequest = GetRequestString(objAuthorizeNetRequest, objAuthorizeNetRequest.TransactionType);
             string strResponse = string.Empty;

             //WebRequest objWebRequest = WebRequest.Create(AUTHORIZENET_TEST_URL);

             ServicePointManager.ServerCertificateValidationCallback = delegate { return true; };
           //  ServicePointManager.SecurityProtocol = SecurityProtocolType.Ssl3;

          //   System.Net.ServicePointManager.SecurityProtocol = SecurityProtocolType.Ssl3 | SecurityProtocolType.Tls;

             System.Net.ServicePointManager.SecurityProtocol = (System.Net.SecurityProtocolType)192 | (System.Net.SecurityProtocolType)768 | (System.Net.SecurityProtocolType)3072;


             WebRequest objWebRequest = WebRequest.Create(AUTHORIZENET_LIVE_URL);

             objWebRequest.Method = "POST";
             objWebRequest.ContentLength = strRequest.Length;
             objWebRequest.ContentType = "application/x-www-form-urlencoded";

             // Add request parameters to memory stream before sending the web request.
             using (StreamWriter objStreamWriter = new StreamWriter(objWebRequest.GetRequestStream()))
             {
                 objStreamWriter.Write(strRequest);
                 objStreamWriter.Close();
             }


             // Get Response back.
             WebResponse objWebResponse = objWebRequest.GetResponse();

             // Retrieve result parameter.
             using (StreamReader objStreamReader = new StreamReader(objWebResponse.GetResponseStream()))
             {
                 strResponse = objStreamReader.ReadToEnd();
                 objStreamReader.Close();
             }

             HandleResponse(strResponse, objAuthorizeNetResponse);
         }
         catch (Exception exr)
         {

         }
         return objAuthorizeNetResponse;
      }
   
   
     /// <summary>
      /// Set Response to indicate failure
      /// </summary>
      /// <param name="objAuthorizeNetResponse"></param>
      /// <param name="ErrorMessage"></param>
      private static void HandleError(AuthorizeNetRespose objAuthorizeNetResponse,string ErrorMessage)
      {
         objAuthorizeNetResponse.IsSuccess = false;
          objAuthorizeNetResponse.Errors = ErrorMessage;
     }
   
   
     /// <summary>
      /// Check the response and identify the result of the request.
     /// </summary>
      /// <param name="strResponse"></param>
      /// <param name="objAuthorizeNetResponse"></param>
      private static void HandleResponse(string strResponse, AuthorizeNetRespose objAuthorizeNetResponse)
      {
          /**********************************************************************************************************************************************************************************************************
          * We will get the response srting as shown below, this is a sample string
           * 
           * 1|1|1|This transaction has been approved.|RmFjFi|Y|508252758|||100.00|CC|auth_capture||||||||||||chiragrdarji@yahoo.co.in||||||||||||||AAD0537178B11C0F1105614FD1774773||2||||||||||||||||||||||||||||
           * 
           * The first value before the first pipe(|) symbol indicates the result.
           * Below is teh link that represents the different Response code
           * http://www.authorize.net/support/Merchant/Transaction_Response/Response_Reason_Codes_and_Response_Reason_Text.htm
           **********************************************************************************************************************************************************************************************************/
          string[] strWebResponse = strResponse.Split(new char[] { '|' }, StringSplitOptions.None);
   
          if (strResponse != null)
          {
              // Check the response
              if (strWebResponse[0] == "1")
             {
                  objAuthorizeNetResponse.IsSuccess = true;
                  if (strWebResponse.Length > 3)
                     objAuthorizeNetResponse.SuccessMessage = strWebResponse[3];
                  // If x_test_request = FALSE, we will get transaction id else Transaction id = 0
                  if (strWebResponse.Length > 6)
                      objAuthorizeNetResponse.TransactionId = strWebResponse[6];
              }
              else
              {
                  if (strWebResponse.Length > 3)
                     HandleError(objAuthorizeNetResponse, strWebResponse[3]);
                  else
                      HandleError(objAuthorizeNetResponse, UNEXPECTED_ERROR);
              }
          }
         else
          {
              HandleError(objAuthorizeNetResponse, UNEXPECTED_ERROR);
          }
      }
  }


