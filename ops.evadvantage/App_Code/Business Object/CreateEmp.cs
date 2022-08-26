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

/// <summary>
/// Summary description for createEmp
/// </summary>
namespace ops.evadvantage.BusinessObject
{
    public class CreateEmp
    {
        public CreateEmp()
        {
            //
            // TODO: Add constructor logic here
            //
        }
        private int m_UserId;
        public int UserId
        {
            get { return m_UserId; }
            set { m_UserId = value; }
        }
        //private int m_EmpInfoId;
        //public int EmpInfoId
        //{
        //    get { return m_EmpInfoId; }
        //    set { m_EmpInfoId = value; }
        //}
        private string m_IsActive;
        public string IsActive
        {
            get { return m_IsActive; }
            set { m_IsActive = value; }
        }
        private int m_UserDetailId;
        public int UserDetailId
        {
            get { return m_UserDetailId; }
            set { m_UserDetailId = value; }
        }
        private string m_UserName;
        public string UserName
        {
            get { return m_UserName; }
            set { m_UserName = value; }
        }
        private string m_Pwd;
        public string Pwd
        {
            get { return m_Pwd; }
            set { m_Pwd = value; }
        }
        private string m_Type;
        public string Type
        {
            get { return m_Type; }
            set { m_Type = value; }
        }
        private string m_SSN;
        public string SSN
        {
            get { return m_SSN; }
            set { m_SSN = value; }
        }
        //private int m_CompanyId;
        //public int CompanyId
        //{
        //    get { return m_CompanyId; }
        //    set { m_CompanyId = value; }
        //}
        private DateTime m_DateOfBirth;
        public DateTime DateOfBirth
        {
            get { return m_DateOfBirth; }
            set { m_DateOfBirth = value; }
        }
        private string m_Email;
        public string Email
        {
            get { return m_Email; }
            set { m_Email = value; }
        }
        private string m_FirstName;
        public string FirstName
        {
            get { return m_FirstName; }
            set { m_FirstName = value; }
        }
        private string m_LastName;
        public string LastName
        {
            get { return m_LastName; }
            set { m_LastName = value; }
        }
        private string m_CompanyName;
        public string CompanyName
        {
            get { return m_CompanyName; }
            set { m_CompanyName = value; }
        }
        private string m_CompanyAdd1;
        public string CompanyAdd1
        {
            get { return m_CompanyAdd1; }
            set { m_CompanyAdd1 = value; }
        }
        private string m_CompanyAdd2;
        public string CompanyAdd2
        {
            get { return m_CompanyAdd2; }
            set { m_CompanyAdd2 = value; }
        }
        private string m_City;
        public string City
        {
            get { return m_City; }
            set { m_City = value; }
        }
        private int m_StateId;
        public int StateId
        {
            get { return m_StateId; }
            set { m_StateId = value; }
        }
        private string m_ZipCode;
        public string ZipCode
        {
            get { return m_ZipCode; }
            set { m_ZipCode = value; }
        }
        private string m_Country;
        public string Country
        {
            get { return m_Country; }
            set { m_Country = value; }
        }
        private string m_WorkTelephone;
        public string WorkTelephone
        {
            get { return m_WorkTelephone; }
            set { m_WorkTelephone = value; }
        }
        private string m_WorkFax;
        public string WorkFax
        {
            get { return m_WorkFax; }
            set { m_WorkFax = value; }
        }
        private string m_TypeOfBusiness;
        public string TypeOfBusiness
        {
            get { return m_TypeOfBusiness; }
            set { m_TypeOfBusiness = value; }
        }
        private string m_ReasonOfVerification;
        public string ReasonOfVerification
        {
            get { return m_ReasonOfVerification; }
            set { m_ReasonOfVerification = value; }
        }
        private int m_QuestionId;
        public int QuestionId
        {
            get { return m_QuestionId; }
            set { m_QuestionId = value; }
        }
        private string m_Ans;
        public string Ans
        {
            get { return m_Ans; }
            set { m_Ans = value; }
        }
        public string EmployeeCompany { get; set; }
    }
}
