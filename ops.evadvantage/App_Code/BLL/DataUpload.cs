using System;
using System.Data;
using System.Configuration;
//using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
//using System.Xml.Linq;
using System.Data.Common;
using ops.evadvantage.DAL;

/// <summary>
/// Summary description for DataUpload
/// </summary>
/// 
namespace ops.evadvantage.BLL
{
    public class DataUpload:ops.evadvantage.BusinessObject.DataUpload
    {
        public DataUpload()
        {
            //
            // TODO: Add constructor logic here
            //
        }
        public void UploadData1()
        {
            DbParameter[] param=new DbParameter[1];
            param[0]=GenericDAL.PrepareParameter("path",DbType.String,this.Path);

            ds_DataUpload.UploadData1(param);
        }
        public void UploadData(string sql)
        {
            ds_DataUpload.UploadData(sql);
        }
        public void MoveData()
        {
            ds_DataUpload.MoveData();
        }
        public DataSet GetUploadStatus()
        {
            DbParameter[] param = new DbParameter[3];
            param[0] = GenericDAL.PrepareParameter("companyname", DbType.String, this.CompanyName);
            if (this.FromDt == Convert.ToDateTime("1/1/0001 12:00:00 AM"))
            {
                param[1] = GenericDAL.PrepareParameter("from", DbType.DateTime, DBNull.Value);
            }
            else
            {
                param[1] = GenericDAL.PrepareParameter("from", DbType.DateTime, this.FromDt);
            }
            if (this.ToDt == Convert.ToDateTime("1/1/0001 12:00:00 AM"))
            {
                param[2] = GenericDAL.PrepareParameter("to", DbType.DateTime, DBNull.Value);
            }
            else
            {
                param[2] = GenericDAL.PrepareParameter("to", DbType.DateTime, this.ToDt);
            }


            return ds_DataUpload.GetUploadStatus(param);
            
        }
    }
}
