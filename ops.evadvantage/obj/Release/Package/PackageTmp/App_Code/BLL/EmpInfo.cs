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
/// Summary description for EmpInfo
/// </summary>
namespace ops.evadvantage.BLL
{
    public class EmpInfo : ops.evadvantage.BusinessObject.EmpInfo
    {
        public EmpInfo()
        {
            //
            // TODO: Add constructor logic here
            //
        }
        public DataSet GetEmpInfo()
        {
            DbParameter[] param = new DbParameter[3];
            param[0] = GenericDAL.PrepareParameter("SSN", DbType.String, this.SSN);
            param[1] = GenericDAL.PrepareParameter("CompanyId", DbType.Int32, this.CompanyId);
            param[2] = GenericDAL.PrepareParameter("DateOfBirth", DbType.String, this.DateOfBirth);


            return ds_EmpInfo.GetEmpInfo(param);

        }
        public DataSet GetEmpInfoForComp()
        {
            DbParameter[] param = new DbParameter[3];
            param[0] = GenericDAL.PrepareParameter("ssn", DbType.String, this.SSN);
            param[1] = GenericDAL.PrepareParameter("companyname", DbType.String, this.CompanyName);
            param[2] = GenericDAL.PrepareParameter("firstname", DbType.String, this.EmployeeName);


            return ds_EmpInfo.GetEmpInfoForComp(param);

        }
        public DataSet GetEmpInfoBySsn()
        {
            DbParameter[] param = new DbParameter[2];
            param[0] = GenericDAL.PrepareParameter("SSN", DbType.String, this.SSN);
            param[1] = GenericDAL.PrepareParameter("CompanyId", DbType.Int32, this.CompanyId);

            return ds_EmpInfo.GetEmpInfoBySsn(param);

        }
        public DataSet GetInfoById()
        {
            DbParameter[] param = new DbParameter[1];
            param[0] = GenericDAL.PrepareParameter("empinfoid", DbType.Int32, this.EmpInfoId);


            return ds_EmpInfo.GetInfoById(param);

        }
        public DataSet GetPayInfoById()
        {
            DbParameter[] param = new DbParameter[1];
            param[0] = GenericDAL.PrepareParameter("empinfoid", DbType.Int32, this.EmpInfoId);


            return ds_EmpInfo.GetPayInfoById(param);

        }

        //20209
        private String PrepareParameterEmpInfo(String ssnStr)
        {
            //EmpInfo objEmpInfo = new EmpInfo();
            string ssn = ssnStr;
            string ss = ssn.Substring(0, 3) + ssn.Substring(4, 2) + ssn.Substring(7, 4);

            //objEmpInfo.SSN = ss;

            //return objEmpInfo;
            return ss;
        }
        public DataSet GetPayInfoBySSN()
        {
            DbParameter[] param = new DbParameter[1];
            param[0] = GenericDAL.PrepareParameter("ssn", DbType.String, PrepareParameterEmpInfoSSNValue(this.SSN));

            return ds_EmpInfo.GetPayInfoBySSN(param);
        }

        public DataSet GetEmployeePaymentInfoBySSN(string SSN)
        {
            DbParameter[] param = new DbParameter[1];
            param[0] = GenericDAL.PrepareParameter("ssn", DbType.String, PrepareParameterEmpInfoSSNValue(SSN));

            return ds_EmpInfo.GetEmployeePaymentInfoBySSN(param);
        }

        private String PrepareParameterEmpInfoSSNValue(String ssnStr)
        {
            //EmpInfo objEmpInfo = new EmpInfo();
            string ssn = ssnStr;
            //string ss = ssn.Substring(0, 3) + ssn.Substring(4, 2) + ssn.Substring(7, 4);

            //objEmpInfo.SSN = ss;

            //return objEmpInfo;
            return ssn;
        }
        
        public DataSet GetHealthInfoById()
        {
            DbParameter[] param = new DbParameter[1];
            param[0] = GenericDAL.PrepareParameter("empinfoid", DbType.Int32, this.EmpInfoId);


            return ds_EmpInfo.GetHealthInfoById(param);

        }
        public DataSet GetCompanyInfo()
        {
            DbParameter[] param = new DbParameter[1];
            param[0] = GenericDAL.PrepareParameter("CompanyId", DbType.Int32, this.CompanyId);


            return ds_EmpInfo.GetCompanyInfo(param);

        }
    }
}
