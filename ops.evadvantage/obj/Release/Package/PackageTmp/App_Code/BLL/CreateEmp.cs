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
using ops.evadvantage.BusinessObject;
using System.Data.Common;
using ops.evadvantage.DAL;

/// <summary>
/// Summary description for createEmp
/// </summary>
namespace ops.evadvantage.BLL
{
    public class CreateEmp:ops.evadvantage.BusinessObject.CreateEmp
    {
        public CreateEmp()
        {
            //
            // TODO: Add constructor logic here
            //
        }
        public DataSet GetCompany()
        {
            return ds_CreateEmp.GetCompany();

        }
        public DataSet GetState()
        {
            return ds_CreateEmp.GetState();

        }
        public DataSet GetQuestion()
        {
            return ds_CreateEmp.GetQuestion();

        }
       
        public DataSet GetUser()
        {
            DbParameter[] param = new DbParameter[3];
            param[0] = GenericDAL.PrepareParameter("UserName", DbType.String, this.UserName);
            param[1] = GenericDAL.PrepareParameter("Pwd", DbType.String, this.Pwd);
            param[2] = GenericDAL.PrepareParameter("Type", DbType.String, this.Type);

            return ds_CreateEmp.GetUser(param);

        }
        public DataSet GetUserName()
        {
            DbParameter[] param = new DbParameter[1];
            param[0] = GenericDAL.PrepareParameter("UserName", DbType.String, this.UserName);
          
            return ds_CreateEmp.GetUserName(param);

        }
        public DataSet GetUserNameForPwd()
        {
            DbParameter[] param = new DbParameter[2];
            param[0] = GenericDAL.PrepareParameter("UserName", DbType.String, this.UserName);
            param[1] = GenericDAL.PrepareParameter("type", DbType.String, this.Type);

            return ds_CreateEmp.GetUserNameForPwd(param);

        }
        public DataSet GetUserDetail()
        {
            DbParameter[] param = new DbParameter[2];
            param[0] = GenericDAL.PrepareParameter("ssn", DbType.String, this.SSN);
            param[1] = GenericDAL.PrepareParameter("dateofbirth", DbType.DateTime, this.DateOfBirth);

            return ds_CreateEmp.GetUserDetail(param);

        }
        public DataSet GetUserEmpInfo()
        {
            DbParameter[] param = new DbParameter[1];
            param[0] = GenericDAL.PrepareParameter("UserId", DbType.Int32, this.UserId);

            return ds_CreateEmp.GetUserEmpInfo(param);

        }
        public DataSet GetUserById()
        {
            DbParameter[] param = new DbParameter[1];
            param[0] = GenericDAL.PrepareParameter("UserId", DbType.Int32, this.UserId);

            return ds_CreateEmp.GetUserById(param);

        }
        public DataSet SelectQuestion()
        {
            DbParameter[] param = new DbParameter[1];
            param[0] = GenericDAL.PrepareParameter("@questionid", DbType.Int32, this.QuestionId);

            return ds_CreateEmp.SelectQuestion(param);

        }
        public int SaveData()
        {
            DbParameter[] param = new DbParameter[4];
            param[0] = GenericDAL.PrepareParameter("UserName", DbType.String, this.UserName);
            param[1] = GenericDAL.PrepareParameter("Pwd", DbType.String, this.Pwd);
            param[2] = GenericDAL.PrepareParameter("Type", DbType.String, this.Type);
            param[3] = GenericDAL.PrepareParameter("IsActive", DbType.String, this.IsActive);
            //param[4] = GenericDAL.PrepareParameter("EmpInfoId", DbType.Int32, this.EmpInfoId);

            object obj=ds_CreateEmp.SaveData(param);
            return Convert.ToInt32(obj);
        }
        public void SaveDetails()
        {
            DbParameter[] param = new DbParameter[20];
            param[0] = GenericDAL.PrepareParameter("UserId",DbType.Int32,this.UserId);
            param[1] = GenericDAL.PrepareParameter("Email", DbType.String, this.Email);
            param[2] = GenericDAL.PrepareParameter("SSN", DbType.String, this.SSN);
            if (this.DateOfBirth == Convert.ToDateTime("1/1/0001"))
            {
                param[3] = GenericDAL.PrepareParameter("DateOfBirth", DbType.DateTime, DBNull.Value);
            }
            else
            {
                param[3] = GenericDAL.PrepareParameter("DateOfBirth", DbType.DateTime, this.DateOfBirth);
            }
           
            //param[4] = GenericDAL.PrepareParameter("CompanyId", DbType.String, this.CompanyId);
            param[4] = GenericDAL.PrepareParameter("FirstName", DbType.String, this.FirstName);
            param[5] = GenericDAL.PrepareParameter("LastName", DbType.String, this.LastName);
            param[6] = GenericDAL.PrepareParameter("CompanyName", DbType.String, this.CompanyName);
            param[7] = GenericDAL.PrepareParameter("CompanyAdd1", DbType.String, this.CompanyAdd1);
            param[8] = GenericDAL.PrepareParameter("CompanyAdd2", DbType.String, this.CompanyAdd2);
            param[9] = GenericDAL.PrepareParameter("City", DbType.String, this.City);
            param[10] = GenericDAL.PrepareParameter("StateId", DbType.Int32, this.StateId);
            param[11] = GenericDAL.PrepareParameter("ZipCode", DbType.String, this.ZipCode);
            param[12] = GenericDAL.PrepareParameter("Country", DbType.String, this.Country);
            param[13] = GenericDAL.PrepareParameter("WorkTelephone", DbType.String, this.WorkTelephone);
            param[14] = GenericDAL.PrepareParameter("WorkFax", DbType.String, this.WorkFax);
            param[15] = GenericDAL.PrepareParameter("TypeOfBusiness", DbType.String, this.TypeOfBusiness);
            param[16] = GenericDAL.PrepareParameter("ReasonOfVerification", DbType.String, this.ReasonOfVerification);
            param[17] = GenericDAL.PrepareParameter("QuestionId", DbType.Int32, this.QuestionId);
            param[18] = GenericDAL.PrepareParameter("Ans", DbType.String, this.Ans);
            if (!string.IsNullOrEmpty(this.EmployeeCompany))
                param[19] = GenericDAL.PrepareParameter("EmployeeCompany", DbType.String, this.EmployeeCompany);
            else
                param[19] = GenericDAL.PrepareParameter("EmployeeCompany", DbType.String, DBNull.Value);

            ds_CreateEmp.SaveDetails(param);
        }
        public void UpdateData()
        {
            DbParameter[] param = new DbParameter[2];
            param[0] = GenericDAL.PrepareParameter("Pwd", DbType.String, this.Pwd);
            param[1] = GenericDAL.PrepareParameter("UserId", DbType.Int32,this.UserId);
            
            ds_CreateEmp.UpdateData(param);
           
        }
        public void UpdateDataForActivate()
        {
            DbParameter[] param = new DbParameter[2];
            param[0] = GenericDAL.PrepareParameter("IsActive", DbType.String, this.IsActive);
            param[1] = GenericDAL.PrepareParameter("UserId", DbType.Int32, this.UserId);

            ds_CreateEmp.UpdateDataForActivate(param);

        }
        public void UpdateDetails()
       {
              

            DbParameter[] param = new DbParameter[17];
            param[0] = GenericDAL.PrepareParameter("UserDetailId", DbType.Int32, this.UserDetailId);
            param[1] = GenericDAL.PrepareParameter("Email", DbType.String, this.Email);
            //param[2] = GenericDAL.PrepareParameter("SSN", DbType.String, this.SSN);
            //if (this.DateOfBirth == Convert.ToDateTime("1/1/0001"))
            //{
            //    param[3] = GenericDAL.PrepareParameter("DateOfBirth", DbType.DateTime, DBNull.Value);
            //}
            //else
            //{
            //    param[3] = GenericDAL.PrepareParameter("DateOfBirth", DbType.DateTime, this.DateOfBirth);
            //}
            //param[4] = GenericDAL.PrepareParameter("CompanyId", DbType.String, this.CompanyId);
            param[2] = GenericDAL.PrepareParameter("FirstName", DbType.String, this.FirstName);
            param[3] = GenericDAL.PrepareParameter("LastName", DbType.String, this.LastName);
            param[4] = GenericDAL.PrepareParameter("CompanyName", DbType.String, this.CompanyName);
            param[5] = GenericDAL.PrepareParameter("CompanyAdd1", DbType.String, this.CompanyAdd1);
            param[6] = GenericDAL.PrepareParameter("CompanyAdd2", DbType.String, this.CompanyAdd2);
            param[7] = GenericDAL.PrepareParameter("City", DbType.String, this.City);
            param[8] = GenericDAL.PrepareParameter("StateId", DbType.Int32, this.StateId);
            param[9] = GenericDAL.PrepareParameter("ZipCode", DbType.String, this.ZipCode);
            param[10] = GenericDAL.PrepareParameter("Country", DbType.String, this.Country);
            param[11] = GenericDAL.PrepareParameter("WorkTelephone", DbType.String, this.WorkTelephone);
            param[12] = GenericDAL.PrepareParameter("WorkFax", DbType.String, this.WorkFax);
            param[13] = GenericDAL.PrepareParameter("TypeOfBusiness", DbType.String, this.TypeOfBusiness);
            param[14] = GenericDAL.PrepareParameter("ReasonOfVerification", DbType.String, this.ReasonOfVerification);
            param[15] = GenericDAL.PrepareParameter("QuestionId", DbType.Int32, this.QuestionId);
            param[16] = GenericDAL.PrepareParameter("Ans", DbType.String, this.Ans);

            ds_CreateEmp.UpdateDetails(param);

        }
        public DataSet GetUserId()
        {
            DbParameter[] param = new DbParameter[1];
            param[0] = GenericDAL.PrepareParameter("SSN", DbType.String, this.SSN);

            return ds_CreateEmp.GetUserId(param);
        }
        public DataSet GetStateById()
        {
            DbParameter[] param = new DbParameter[1];
            param[0] = GenericDAL.PrepareParameter("stateid", DbType.Int32, this.StateId);

            return ds_CreateEmp.GetStateById(param);
        }
        public DataSet GetVerifier()
        {
            DbParameter[] param = new DbParameter[3];
            param[0] = GenericDAL.PrepareParameter("companyname", DbType.String, this.CompanyName);
            param[1] = GenericDAL.PrepareParameter("firstname", DbType.String, this.FirstName);
            param[2] = GenericDAL.PrepareParameter("lastname", DbType.String, this.LastName);


            return ds_CreateEmp.GetVerifier(param);

        }
        public DataSet GetSsu()
        {
            DbParameter[] param = new DbParameter[3];
            param[0] = GenericDAL.PrepareParameter("companyname", DbType.String, this.CompanyName);
            param[1] = GenericDAL.PrepareParameter("firstname", DbType.String, this.FirstName);
            param[2] = GenericDAL.PrepareParameter("lastname", DbType.String, this.LastName);


            return ds_CreateEmp.GetSsu(param);

        }
    }
}