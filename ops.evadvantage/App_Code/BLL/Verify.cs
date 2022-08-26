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
/// Summary description for Verify
/// </summary>
/// 
namespace ops.evadvantage.BLL
{
    public class Verify:ops.evadvantage.BusinessObject.Verify
    {
        public Verify()
        {
            //
            // TODO: Add constructor logic here
            //
        }
        public void SaveData()
        {
            DbParameter[] param = new DbParameter[5];
            param[0] = GenericDAL.PrepareParameter("VerifierId", DbType.Int32, this.VerifierId);
            param[1] = GenericDAL.PrepareParameter("VerifierDate", DbType.DateTime, this.VerifierDate);
            param[2] = GenericDAL.PrepareParameter("UserId", DbType.Int32, this.UserId);
            param[3] = GenericDAL.PrepareParameter("Company", DbType.String, this.Company);
            param[4] = GenericDAL.PrepareParameter("IsCreditCard", DbType.String, this.IsCreditCard);

            ds_Verify.SaveData(param);
        }
    }
}
