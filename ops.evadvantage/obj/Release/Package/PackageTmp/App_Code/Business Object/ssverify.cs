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
/// Summary description for ssverify
/// </summary>
/// 
namespace ops.evadvantage.BusinessObject
{
    public class ssverify
    {
        public ssverify()
        {
            //
            // TODO: Add constructor logic here
            //
        }
        private int m_SSVerifyId;
        public int SSVerifyId
        {
            get { return m_SSVerifyId; }
            set { m_SSVerifyId = value; }
        }
        private int m_SSVerifierId;
        public int SSVerifierId
        {
            get { return m_SSVerifierId; }
            set { m_SSVerifierId = value; }
        }
        private DateTime m_SSVerifierDate;
        public DateTime SSVerifierDate
        {
            get { return m_SSVerifierDate; }
            set { m_SSVerifierDate = value; }
        }
        private int m_UserId;
        public int UserId
        {
            get { return m_UserId; }
            set { m_UserId = value; }
        }
        private int m_VerType;
        public int VerType
        {
            get { return m_VerType; }
            set { m_VerType = value; }
        }
    }
}
