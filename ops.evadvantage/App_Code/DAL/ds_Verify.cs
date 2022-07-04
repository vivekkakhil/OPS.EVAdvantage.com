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
/// Summary description for ds_Verify
/// </summary>
/// 
namespace ops.evadvantage.DAL
{
    public class ds_Verify
    {
        public ds_Verify()
        {
            //
            // TODO: Add constructor logic here
            //
        }
        public static void SaveData(DbParameter[] param)
        {
            GenericDAL.ExecuteNonQuery("Sp_Insert_Verify", true, param);
        }
    }
}
