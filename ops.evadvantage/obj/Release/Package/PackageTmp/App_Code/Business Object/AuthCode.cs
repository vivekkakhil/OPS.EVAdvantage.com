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
using System.Data.Common;

/// <summary>
/// Summary description for AuthCode
/// </summary>
namespace ops.evadvantage.BusinessObject
{
    public class AuthCode
    {
        public AuthCode()
        {
            //
            // TODO: Add constructor logic here
            //
        }
        private int m_UserId;
        public int UserId
        {
            get { return m_UserId; }
            set { m_UserId = value; }
        }
        private int m_AuthCodeId;
        public int AuthCodeId
        {
            get { return m_AuthCodeId; }
            set { m_AuthCodeId = value; }
        }
        private string m_AuthCodeNo;
        public string AuthCodeNo
        {
            get { return m_AuthCodeNo; }
            set { m_AuthCodeNo = value; }
        }
        private DateTime m_IssueDate;
        public DateTime IssueDate
        {
            get { return m_IssueDate; }
            set { m_IssueDate = value; }
        }
        private DateTime m_ExpiredDate;
        public DateTime ExpiredDate
        {
            get { return m_ExpiredDate; }
            set { m_ExpiredDate = value; }
        }
        private string m_Status;
        public string Status
        {
            get { return m_Status; }
            set { m_Status = value; }
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
        public string SSN { get; set; }
    }
}