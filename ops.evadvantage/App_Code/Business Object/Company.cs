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
/// Summary description for Company
/// </summary>
namespace ops.evadvantage.BusinessObject
{
    public class Company
    {
        public Company()
        {
            //
            // TODO: Add constructor logic here
            //
        }
        private int m_CompanyId;
        public int CompanyId
        {
            get { return m_CompanyId; }
            set { m_CompanyId = value; }
        }
        private string m_CompanyCode;
        public string CompanyCode
        {
            get { return m_CompanyCode; }
            set { m_CompanyCode = value; }
        }
        private string m_CompanyName;
        public string CompanyName
        {
            get { return m_CompanyName; }
            set { m_CompanyName = value; }
        }
    }
}
