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
/// Summary description for Verify
/// </summary>
/// 
namespace ops.evadvantage.BusinessObject
{
    public class Verify
    {
        public Verify()
        {
            //
            // TODO: Add constructor logic here
            //
        }
        private int m_VerifyId;
        public int VerifyId
        {
            get { return m_VerifyId; }
            set { m_VerifyId = value; }
        }
        private int m_VerifierId;
        public int VerifierId
        {
            get { return m_VerifierId; }
            set { m_VerifierId = value; }
        }
        private DateTime m_VerifierDate;
        public DateTime VerifierDate
        {
            get { return m_VerifierDate; }
            set { m_VerifierDate = value; }
        }
        private int m_UserId;
        public int UserId
        {
            get { return m_UserId; }
            set { m_UserId = value; }
        }
        private string m_Company;
        public string Company
        {
            get { return m_Company; }
            set { m_Company = value; }
        }
        private string m_IsCreditCard;
        public string IsCreditCard
        {
            get { return m_IsCreditCard; }
            set { m_IsCreditCard = value; }
        }
    }
}
