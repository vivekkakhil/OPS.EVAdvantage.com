using System;
using System.Collections.Generic;
using System.Text;
using System.Configuration;
using System.Data;
using System.Data.Odbc;
using Microsoft.Practices.EnterpriseLibrary.Common;
using Microsoft.Practices.EnterpriseLibrary.Data;
using System.Data.Common;
using System.Data.SqlClient;

namespace ops.evadvantage.DAL
{
    /// <summary>
    /// This class is used to Create Database connection based on the provider specified in the config file
    /// </summary>
    public static class GenericDbConnection
    {
        /// <summary>
        /// This method will create a database connection and returns Database to perform database specific tasks
        /// </summary>
        /// <returns>Database</returns>
        public static Database OpenDb()
        {
            //** Connection string for SQL Server 2005 **//
            try
            {
                return DatabaseFactory.CreateDatabase("MemeberShipConnectionString");
            }
            catch (Exception ex)
            {
                throw ex;
            }            
            //** Connection string for DB2 8.2 **//
            //return DatabaseFactory.CreateDatabase("RSPLGNRCConnectionStringDB2");
        }
    }
}
