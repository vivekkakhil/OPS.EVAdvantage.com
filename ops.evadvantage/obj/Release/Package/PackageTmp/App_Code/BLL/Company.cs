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
using EVA.DAL;

/// <summary>
/// Summary description for Company
/// </summary>
/// 
namespace EVA.BLL
{
    public class Company : EVA.BusinessObject.Company
    {
        public Company()
        {
            //
            // TODO: Add constructor logic here
            //
        }
        public void SaveData()
        {
            DbParameter[] param = new DbParameter[2];
            param[0] = GenericDAL.PrepareParameter("CompanyCode", DbType.String, this.CompanyCode);
            param[1] = GenericDAL.PrepareParameter("CompanyName", DbType.String, this.CompanyName);

            ds_Company.SaveData(param);
        }
        public DataSet GetMaxCompanyCode()
        {
            return ds_Company.GetMaxCompanyCode();
        }
        public void Delete()
        {
            DbParameter[] param = new DbParameter[1];
            param[0] = GenericDAL.PrepareParameter("CompanyId", DbType.Int32, this.CompanyId);
            

            ds_Company.Delete(param);
        }
    }
}