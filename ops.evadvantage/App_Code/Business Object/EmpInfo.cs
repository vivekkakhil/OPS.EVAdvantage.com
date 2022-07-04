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
/// Summary description for EmpInfo
/// </summary>
namespace ops.evadvantage.BusinessObject
{
    public class EmpInfo
    {
        public EmpInfo()
        {
            //
            // TODO: Add constructor logic here
            //
        }
        private string m_SSN;
        public string SSN
        {
            get { return m_SSN; }
            set { m_SSN = value; }
        }
        private int m_CompanyId;
        public int CompanyId
        {
            get { return m_CompanyId; }
            set { m_CompanyId = value; }
        }
        private string m_DateOfBirth;
        public string DateOfBirth
        {
            get { return m_DateOfBirth; }
            set { m_DateOfBirth = value; }
        }
        private int m_EmpInfoId;
        public int EmpInfoId
        {
            get { return m_EmpInfoId; }
            set { m_EmpInfoId = value; }
        }
        private string m_CompanyName;
        public string CompanyName
        {
            get { return m_CompanyName; }
            set { m_CompanyName = value; }
        }
        private string m_EmployeeName;
        public string EmployeeName
        {
            get { return m_EmployeeName; }
            set { m_EmployeeName = value; }
        }
    }

}
