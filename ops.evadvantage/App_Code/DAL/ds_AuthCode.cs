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
using ops.evadvantage.DAL;

/// <summary>
/// Summary description for ds_AuthCode
/// </summary>
public class ds_AuthCode
{
	public ds_AuthCode()
	{
		//
		// TODO: Add constructor logic here
		//
	}
    public static void SaveData(DbParameter[] param)
    {
        GenericDAL.ExecuteNonQuery("Sp_Insert_AuthCode", true, param);
    }
    public static void SaveDataForAdmin(DbParameter[] param)
    {
        GenericDAL.ExecuteNonQuery("AuthCode_InsertByAdmin", true, param);
    }
    public static object GetMaxAuthCode(DbParameter[] param)
    {
        return GenericDAL.ExecuteScalar("Sp_Max_AuthCode", true, param);
    }
    public static void UpdateData(DbParameter[] param)
    {
        GenericDAL.ExecuteNonQuery("Sp_Update_AuthCodeStaus", true, param);
    }
    public static void UpdateDataByVerifier(DbParameter[] param)
    {
        GenericDAL.ExecuteNonQuery("Sp_Update_AuthCodebyVerifier", true, param);
    }

    //21809
    //public static void UpdateDataByVerifierNoAuth(DbParameter[] param)
    //{
    //    GenericDAL.ExecuteNonQuery("Sp_Update_AuthCodebyVerifier", true, param);
    //}
    public static void UpdateStatus()
    {
        GenericDAL.ExecuteNonQuery("Sp_Update_Status", true);
    }
    public static DataSet CheckAuthCode(DbParameter[] param)
    {
        return GenericDAL.ExecuteDataSet("Sp_Check_AuthCode", true,param);
    }
    public static void SaveDataVerify(DbParameter[] param)
    {
        GenericDAL.ExecuteNonQuery("Sp_Insert_Verify", true, param);
    }
    //21809
    //public static DataSet CheckNoAuthCode(DbParameter[] param)
    //{
    //    return GenericDAL.ExecuteDataSet("Sp_Check_NoAuthCode", true, param);
    //}
}
