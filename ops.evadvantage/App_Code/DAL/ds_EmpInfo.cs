using System;
using System.Data;
using System.Configuration;
using System.Collections;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Xml;
using System.Data.Common;

/// <summary>
/// Summary description for ds_EmpInfo
/// </summary>
namespace ops.evadvantage.DAL
{
    public class ds_EmpInfo
    {
        public ds_EmpInfo()
        {
            //
            // TODO: Add constructor logic here
            //
        }
        public static DataSet GetEmpInfo(DbParameter[] param)
        {
            return GenericDAL.ExecuteDataSet("Sp_Get_EmpInfo", true, param);
        }
        public static DataSet GetEmpInfoForComp(DbParameter[] param)
        {
            return GenericDAL.ExecuteDataSet("Sp_Get_EmpInfoByCompany", true, param);
        }
        public static DataSet GetEmpInfoBySsn(DbParameter[] param)
        {
            return GenericDAL.ExecuteDataSet("Sp_Get_EmpInfoBySsn", true, param);
        }
        public static DataSet GetInfoById(DbParameter[] param)
        {
            return GenericDAL.ExecuteDataSet("Sp_Get_EmpInfoById", true, param);
        }
        public static DataSet GetPayInfoById(DbParameter[] param)
        {
            //return GenericDAL.ExecuteDataSet("Sp_Get_EmpPayInfo", true, param);
            return GenericDAL.ExecuteDataSet("Sp_Get_EmpPayInfo2", true, param);
        }

        //20209
        public static DataSet GetPayInfoBySSN(DbParameter[] param)
        {
            //return GenericDAL.ExecuteDataSet("Sp_Get_EmpPayInfoBySSN", true, param);
            return GenericDAL.ExecuteDataSet("Sp_Get_EmpPayInfoBySSN2", true, param);
        }

        public static DataSet GetHealthInfoById(DbParameter[] param)
        {
            //return GenericDAL.ExecuteDataSet("Sp_Get_EmpHealthInfo", true, param);
            return GenericDAL.ExecuteDataSet("Sp_Get_EmpHealthInfo2", true, param);
        }
        public static DataSet GetCompanyInfo(DbParameter[] param)
        {
            return GenericDAL.ExecuteDataSet("Sp_Get_EmpInfoAsPerCompany", true, param);
        }

        public static DataSet GetEmployeePaymentInfoBySSN(DbParameter[] param)
        {            
            return GenericDAL.ExecuteDataSet("Sp_Get_EmpPaymentInfoByEmpSSN", true, param);
        }
    }
}
