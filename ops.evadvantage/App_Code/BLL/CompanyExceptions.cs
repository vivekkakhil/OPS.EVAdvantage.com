using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data;
using System.Data.SqlClient;

/// <summary>
/// Summary description for CompanyExceptions
/// </summary>
/// 
public class CompanyExceptions
{
    public int CompanyID { get; set; }
    public string ExceptionText { get; set; }

	public CompanyExceptions(){}
    


    public DataTable GetExecptionByCompany()
    {
        try
        {
            SqlParameter[] p = new SqlParameter[1];
            p[0] = new SqlParameter("@CompanyID", this.CompanyID);

            DataTable dt = ops.evadvantage.DAL.GenericDAL.ExecuteDataTable("CompanyExceptions_SelectByCompanyID", true, p);
            return dt;
        }
        catch (Exception ex)
        {
            return null;
        }
    }

    public int InsertUpdate()
    {
        try
        {
            SqlParameter[] p = new SqlParameter[2];
            p[0] = new SqlParameter("@CompanyID", this.CompanyID);
            p[1] = new SqlParameter("@ExceptionText", this.ExceptionText);

            return ops.evadvantage.DAL.GenericDAL.ExecuteNonQuery("CompanyExceptions_InsertUpdate", true, p);
        }
        catch (Exception ex)
        {
            return 0;
        }
    }

}
