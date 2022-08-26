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
using ops.evadvantage.BusinessObject;
/// <summary>
/// Summary description for AuthCode
/// </summary>
namespace ops.evadvantage.BLL
{
    public class AuthCode : ops.evadvantage.BusinessObject.AuthCode
    {
        public AuthCode()
        {
            //
            // TODO: Add constructor logic here
            //
        }
        public void SaveData()
        {
            DbParameter[] param = new DbParameter[5];
           
            param[0]=GenericDAL.PrepareParameter("AuthCodeNo",DbType.String,this.AuthCodeNo);
            param[1]=GenericDAL.PrepareParameter("UserId",DbType.Int32,this.UserId);
            param[2] = GenericDAL.PrepareParameter("IssueDate", DbType.DateTime, this.IssueDate);
            param[3] = GenericDAL.PrepareParameter("ExpiredDate", DbType.DateTime, this.ExpiredDate);
            param[4] = GenericDAL.PrepareParameter("Status", DbType.String, this.Status);

            ds_AuthCode.SaveData(param);
        }

        public void SaveDataFromAdmin()
        {
            DbParameter[] param = new DbParameter[5];

            param[0] = GenericDAL.PrepareParameter("VerifyId", DbType.Int32, this.VerifyId);
            param[1] = GenericDAL.PrepareParameter("Company", DbType.String, this.Company);
            param[2] = GenericDAL.PrepareParameter("ExpiredDate", DbType.DateTime, this.ExpiredDate);
            param[3] = GenericDAL.PrepareParameter("SSN", DbType.String, this.SSN);
            if (!string.IsNullOrEmpty(this.IsCreditCard) && this.IsCreditCard.ToLower() == "y")
                param[4] = GenericDAL.PrepareParameter("IsCreditCard", DbType.String, "Y");
            else
                param[4] = GenericDAL.PrepareParameter("IsCreditCard", DbType.String, "N");

            ds_AuthCode.SaveDataForAdmin(param);
        }

        public string GetMaxAuthCode()
        {
            DbParameter[] param = new DbParameter[1];
            param[0] = GenericDAL.PrepareParameter("UserId", DbType.Int32, this.UserId);

            object obj = ds_AuthCode.GetMaxAuthCode(param);
            return obj.ToString();
        }
        public void UpdateData()
        {
            DbParameter[] param = new DbParameter[2];

            param[0] = GenericDAL.PrepareParameter("Status", DbType.String, this.Status);
            param[1] = GenericDAL.PrepareParameter("AuthCodeId", DbType.Int32, this.AuthCodeId);

            ds_AuthCode.UpdateData(param);
        }
        public void UpdateDataByVerifier()
        {
            DbParameter[] param = new DbParameter[6];

            param[0] = GenericDAL.PrepareParameter("Status", DbType.String, this.Status);
            param[1] = GenericDAL.PrepareParameter("AuthCodeId", DbType.Int32, this.AuthCodeId);
            param[2] = GenericDAL.PrepareParameter("VerifyId", DbType.Int32, this.UserId);
            param[3] = GenericDAL.PrepareParameter("Company", DbType.String, this.Company);
            param[4] = GenericDAL.PrepareParameter("IsCreditCard", DbType.String, this.IsCreditCard);
            param[5] = GenericDAL.PrepareParameter("ExpiredDate", DbType.DateTime, this.ExpiredDate);


            ds_AuthCode.UpdateDataByVerifier(param);
        }

        ////21809
        //public void UpdateDataByVerifierNoAuth()
        //{
        //    DbParameter[] param = new DbParameter[5];

        //    param[0] = GenericDAL.PrepareParameter("Status", DbType.String, this.Status);
        //    //param[1] = GenericDAL.PrepareParameter("AuthCodeId", DbType.Int32, this.AuthCodeId);
        //    param[1] = GenericDAL.PrepareParameter("VerifyId", DbType.Int32, this.UserId);
        //    param[2] = GenericDAL.PrepareParameter("Company", DbType.String, this.Company);
        //    param[3] = GenericDAL.PrepareParameter("IsCreditCard", DbType.String, this.IsCreditCard);
        //    param[4] = GenericDAL.PrepareParameter("ExpiredDate", DbType.DateTime, this.ExpiredDate);


        //    ds_AuthCode.UpdateDataByVerifierNoAuth(param);
        //}
        public void UpdateStatus()
        {
            ds_AuthCode.UpdateStatus();
        }
        public DataSet CheckAuthCode(string SSN, int CompanyId)
        {
            DbParameter[] param = new DbParameter[3];

            param[0] = GenericDAL.PrepareParameter("AuthCodeNo", DbType.String, this.AuthCodeNo);
            param[1] = GenericDAL.PrepareParameter("CompanyId", DbType.Int32, CompanyId);
            param[2] = GenericDAL.PrepareParameter("SSN", DbType.String, SSN);
            
            return ds_AuthCode.CheckAuthCode(param);
        }
        //21809
        //public DataSet CheckNoAuthCode(string SSN, int CompanyId)
        //{
        //    DbParameter[] param = new DbParameter[2];

        //    //param[0] = GenericDAL.PrepareParameter("AuthCodeNo", DbType.String, this.AuthCodeNo);
        //    param[0] = GenericDAL.PrepareParameter("CompanyId", DbType.Int32, CompanyId);
        //    param[1] = GenericDAL.PrepareParameter("SSN", DbType.String, SSN);

        //    return ds_AuthCode.CheckNoAuthCode(param);
        //}

        public void SaveDataVerify()
        {
            DbParameter[] param = new DbParameter[5];
            param[0] = GenericDAL.PrepareParameter("VerifierId", DbType.Int32, this.VerifierId);
            param[1] = GenericDAL.PrepareParameter("VerifierDate", DbType.DateTime, this.VerifierDate);
            param[2] = GenericDAL.PrepareParameter("UserId", DbType.Int32, this.UserId);
            param[3] = GenericDAL.PrepareParameter("Company", DbType.String, this.Company);
            param[4] = GenericDAL.PrepareParameter("IsCreditCard", DbType.String, this.IsCreditCard);
            ds_AuthCode.SaveDataVerify(param);
            //ds_ssverify.SaveData(param);
        }
    }
}
