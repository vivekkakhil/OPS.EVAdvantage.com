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
/// Summary description for DataUpload
/// </summary>
/// 
namespace ops.evadvantage.BusinessObject
{
    public class DataUpload
    {
        public DataUpload()
        {
            //
            // TODO: Add constructor logic here
            //
        }
        private string m_Path;
        public string Path
        {
            get { return m_Path; }
            set { m_Path = value; }
        }
        private string m_CompanyName;
        public string CompanyName
        {
            get { return m_CompanyName; }
            set { m_CompanyName = value; }
        }
        private DateTime m_FromDt;
        public DateTime FromDt
        {
            get { return m_FromDt; }
            set { m_FromDt = value; }
        }
        private DateTime m_ToDt;
        public DateTime ToDt
        {
            get { return m_ToDt; }
            set { m_ToDt = value; }
        }
    }
}