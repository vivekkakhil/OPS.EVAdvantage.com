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
using ops.evadvantage.DAL;
using System.Data;
using System.Data.Common;



/// <summary>
/// Summary description for report
/// </summary>
/// 
namespace ops.evadvantage.BLL
{
    public class report
    {
        public report()
        {
            //
            // TODO: Add constructor logic here
            //
        }
        public DataSet GetData(int companyid, DateTime fromdt, DateTime todt, int userType)
        {
            DbParameter[] param = new DbParameter[4];
            param[0] = GenericDAL.PrepareParameter("companyid", DbType.Int32, companyid);
            param[1] = GenericDAL.PrepareParameter("fromdt", DbType.DateTime, fromdt);
            param[2] = GenericDAL.PrepareParameter("todt", DbType.DateTime, todt);
            param[3] = GenericDAL.PrepareParameter("userType", DbType.Int32, userType);
            return ds_report.GetData(param);
        }
    }
}
