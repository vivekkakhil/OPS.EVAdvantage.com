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
using System.Data.Common;

/// <summary>
/// Summary description for ds_Company
/// </summary>
/// 
namespace ops.evadvantage.DAL
{
    public class ds_Company
    {
        public ds_Company()
        {
            //
            // TODO: Add constructor logic here
            //
        }
        public static void SaveData(DbParameter[] param)
        {
            GenericDAL.ExecuteNonQuery("Sp_Insert_Company", true, param);
        }
        public static DataSet GetMaxCompanyCode()
        {
            return GenericDAL.ExecuteDataSet("Sp_Max_CompanyCode", true);
        }
        public static void Delete(DbParameter[] param)
        {
            GenericDAL.ExecuteNonQuery("Sp_Delete_Company", true, param);
        }
    }
}
