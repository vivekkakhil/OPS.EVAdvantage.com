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
using System.Data.Common;

/// <summary>
/// Summary description for ds_createEmp
/// </summary>
namespace ops.evadvantage.DAL
{
    public class ds_CreateEmp
    {
        public ds_CreateEmp()
        {
            //
            // TODO: Add constructor logic here
            //
        }
        public static DataSet GetCompany()
        {
            return GenericDAL.ExecuteDataSet("Sp_Get_Company", true);
        }
        public static DataSet GetState()
        {
            return GenericDAL.ExecuteDataSet("Sp_Get_State", true);
        }
        public static DataSet GetQuestion()
        {
            return GenericDAL.ExecuteDataSet("Sp_Get_Question", true);
        }
        public static DataSet SelectQuestion(DbParameter[] param)
        {
            return GenericDAL.ExecuteDataSet("Sp_Select_Question", true,param);
        }
        public static DataSet GetUser(DbParameter[] param)
        {
            return GenericDAL.ExecuteDataSet("Sp_Get_User", true,param);
        }
        public static DataSet GetUserEmpInfo(DbParameter[] param)
        {
            return GenericDAL.ExecuteDataSet("Sp_Get_EmpInfoByUser", true, param);
        }
        public static DataSet GetUserById(DbParameter[] param)
        {
            return GenericDAL.ExecuteDataSet("Sp_Get_UserById", true, param);
        }
        public static DataSet GetUserName(DbParameter[] param)
        {
            return GenericDAL.ExecuteDataSet("Sp_Get_UserName", true, param);
        }
        public static DataSet GetUserNameForPwd(DbParameter[] param)
        {
            return GenericDAL.ExecuteDataSet("Sp_Get_UserNameForPwd", true, param);
        }
        public static DataSet GetUserDetail(DbParameter[] param)
        {
            return GenericDAL.ExecuteDataSet("Sp_Get_UserDetail", true, param);
        }
        public static object SaveData(DbParameter[] param)
        {
            return GenericDAL.ExecuteScalar("Sp_Insert_User", true, param);
        }
        public static void SaveDetails(DbParameter[] param)
        {
            GenericDAL.ExecuteNonQuery("Sp_Insert_UserDetails", true, param);
        }
        public static void UpdateData(DbParameter[] param)
        {
            GenericDAL.ExecuteNonQuery("Sp_Update_User", true, param);
        }
        public static void UpdateDataForActivate(DbParameter[] param)
        {
            GenericDAL.ExecuteNonQuery("Sp_Update_UserForActivate", true, param);
        }
        public static void UpdateDetails(DbParameter[] param)
        {
            GenericDAL.ExecuteNonQuery("Sp_Update_UserDetails", true, param);
        }
        public static DataSet GetUserId(DbParameter[] param)
        {
            return GenericDAL.ExecuteDataSet("Sp_Get_UserBySSN", true, param);
        }
        public static DataSet GetStateById(DbParameter[] param)
        {
            return GenericDAL.ExecuteDataSet("Sp_Select_State", true, param);
        }
        public static DataSet GetVerifier(DbParameter[] param)
        {
            return GenericDAL.ExecuteDataSet("Sp_Select_Verifier", true, param);
        }
        public static DataSet GetSsu(DbParameter[] param)
        {
            return GenericDAL.ExecuteDataSet("Sp_Select_Ssu", true, param);
        }
        
    }
}
