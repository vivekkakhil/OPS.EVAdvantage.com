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
/// Summary description for ds_DataUpload
/// </summary>
/// 
namespace ops.evadvantage.DAL
{
    public class ds_DataUpload
    {
        public ds_DataUpload()
        {
            //
            // TODO: Add constructor logic here
            //
        }
        public static void UploadData1(DbParameter[] param)
        {
            GenericDAL.ExecuteScalar("Sp_Get_CsvData", true, param);
        }
        public static void UploadData(string sql)
        {
            GenericDAL.ExecuteScalar(sql, false);
        }
        public static void MoveData()
        {
            GenericDAL.ExecuteScalar("Sp_Select_UploadData", true);
            GenericDAL.ExecuteScalar("Sp_Select_UploadPayHealthData", true);
        }
        public static DataSet GetUploadStatus(DbParameter[] param)
        {
            return GenericDAL.ExecuteDataSet("Sp_Get_UploadStatus", true, param);
        }
    }
}
