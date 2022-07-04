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
/// Summary description for ssverify
/// </summary>
/// 
namespace ops.evadvantage.BLL
{
    public class ssverify : ops.evadvantage.BusinessObject.ssverify
    {
        public ssverify()
        {
            //
            // TODO: Add constructor logic here
            //
        }
        public void SaveData()
        {
            DbParameter[] param = new DbParameter[4];
            param[0] = GenericDAL.PrepareParameter("ssVerifierId", DbType.Int32, this.SSVerifierId);
            param[1] = GenericDAL.PrepareParameter("ssVerifierDate", DbType.DateTime, this.SSVerifierDate);
            param[2] = GenericDAL.PrepareParameter("UserId", DbType.Int32, this.UserId);
            param[3] = GenericDAL.PrepareParameter("VerType", DbType.Int32, this.VerType);

            ds_ssverify.SaveData(param);
        }
    }
}
