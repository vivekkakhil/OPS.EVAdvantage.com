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

/// <summary>
/// Summary description for AuthorizeNetRespose
/// </summary>
namespace ops.evadvantage.AuthorizeNetCode
{
    public class AuthorizeNetRespose
    {
        public AuthorizeNetRespose()
        {
            //
            // TODO: Add constructor logic here
            //
        }
        private string mstrTransactionId;
        private string mlstErrors;
        private string mlstSuccessMessage;

        public string SuccessMessage
        {
            get { return mlstSuccessMessage; }
            set { mlstSuccessMessage = value; }
        }

        private bool mblnIsSuccess;

        public bool IsSuccess
        {
            get { return mblnIsSuccess; }
            set { mblnIsSuccess = value; }
        }


        public string Errors
        {
            get { return mlstErrors; }
            set { mlstErrors = value; }
        }


        public string TransactionId
        {
            get { return mstrTransactionId; }
            set { mstrTransactionId = value; }
        }

    }
}
