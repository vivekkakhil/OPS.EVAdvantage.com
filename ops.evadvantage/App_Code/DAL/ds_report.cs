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
/// Summary description for ds_report
/// </summary>
/// 
namespace ops.evadvantage.DAL
{
    public class ds_report
    {
        public ds_report()
        {
            //
            // TODO: Add constructor logic here
            //
        }
        public static DataSet GetData(DbParameter[] param)
        {
            return GenericDAL.ExecuteDataSet("Sp_Get_DataForAdminRep_Latest", true, param);
        }
    }
}
