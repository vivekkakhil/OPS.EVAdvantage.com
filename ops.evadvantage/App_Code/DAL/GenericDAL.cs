using System;
using System.Collections;
using System.Collections.Generic;
using System.Text;

using System.Data;
using System.Data.Common;

using Microsoft.Practices.EnterpriseLibrary.Common;
using Microsoft.Practices.EnterpriseLibrary.Data;

namespace ops.evadvantage.DAL
{
    /// <summary>
    /// This class provides basic functionality to perform database specific operations
    /// </summary>
    public static class GenericDAL
    {
        #region Private Fields

        private static DbCommand cmd = null;
        private static DataSet ds = null;
        private static Database db = null;
        private static DbConnection dbCon = null;
        private static DbTransaction dbTrans = null;
        private static DataTable dt = null;

        #endregion Private Fields

        /// <summary>
        /// This function will create the Database connection from DatabaseFactory taking configuration settings from config file
        /// </summary>
        private static void OpenDataBase()
        {
            try
            {
                if (db == null)
                    db = GenericDbConnection.OpenDb();
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }

        /// <summary>
        /// Create and get DbTransaction object for the connection
        /// </summary>
        /// <returns></returns>
        public static DbTransaction BeginDBTransaction()
        {
            try
            {
                dbCon = CreateDbConnection();
                dbCon.Open();
                dbTrans = dbCon.BeginTransaction();
                return dbTrans;
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }

        /// <summary>
        /// Get the connection object for the Database
        /// </summary>
        /// <returns>DbConnection</returns>
        public static DbConnection CreateDbConnection()
        {
            try
            {
                OpenDataBase();
                dbCon = db.CreateConnection();

                return dbCon;
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }

        /// <summary>
        /// To commit transaction associated with the connection
        /// </summary>
        public static void CommitDBTransaction()
        {
            dbTrans.Commit();
        }

        /// <summary>
        /// To rollback transaction associated with the connection
        /// </summary>
        public static void RollbackDBTransaction()
        {
            dbTrans.Rollback();
        }

        /// <summary>
        /// returns DbProviderFactory to perform some functionality e.g. CreateDbParameter etc.
        /// </summary>
        /// <returns></returns>
        public static DbProviderFactory GetDbProviderFactory()
        {
            try
            {
                OpenDataBase();
                return db.DbProviderFactory;
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }


        /// <summary>
        /// Overloaded method to receive DbParameter
        /// </summary>
        /// <param name="paramName">Name of the parameter</param>
        /// <param name="dbType">database type</param>
        /// <param name="val">parameter value</param>
        /// <returns></returns>
        public static DbParameter PrepareParameter(string paramName, DbType dbType, object val)
        {
            return PrepareParameter(paramName, dbType, ParameterDirection.Input, val);
        }

        /// <summary>
        /// Overloaded method to receive DbParameter
        /// </summary>
        /// <param name="paramName">Name of the parameter</param>
        /// <param name="dbType">database type</param>
        /// <param name="direction">parameter direction e.g. input or output</param>
        /// <param name="val">parameter value</param>
        /// <returns></returns>
        public static DbParameter PrepareParameter(string paramName, DbType dbType, ParameterDirection direction, object val)
        {
            return PrepareParameter(paramName, dbType, direction, null, DataRowVersion.Current, val, 0);
        }

        /// <summary>
        /// Overloaded method to receive DbParameter
        /// </summary>
        /// <param name="paramName">Name of the parameter</param>
        /// <param name="dbType">database type</param>
        /// <param name="direction">parameter direction e.g. input or output</param>
        /// <param name="val">parameter value</param>
        /// <returns></returns>
        public static DbParameter PrepareParameter(string paramName, DbType dbType, ParameterDirection direction, int size)
        {
            return PrepareParameter(paramName, dbType, direction, null, DataRowVersion.Current, null, size);
        }

        /// <summary>
        /// Overloaded method to receive DbParameter
        /// </summary>
        /// <param name="paramName">Name of the parameter</param>
        /// <param name="dbType">database type</param>
        /// <param name="direction">parameter direction e.g. input or output</param>
        /// <param name="sourceColumn">column name in the database</param>
        /// <param name="datarowVersion">datarow version e.g. Current etc.</param>
        /// <param name="val">parameter value</param>
        /// <returns></returns>
        public static DbParameter PrepareParameter(string paramName, DbType dbType, ParameterDirection direction, string sourceColumn, DataRowVersion datarowVersion, object val, int size)
        {
            DbParameter param = GetDbProviderFactory().CreateParameter();

            param = ConfigureParameter(param, paramName, dbType, size, direction, true, 0, 0, sourceColumn, datarowVersion, val);

            return param;
        }

        /// <summary>
        /// Overloaded method which returns DbCommand
        /// </summary>
        /// <param name="commandText">command text for the DbCommand</param>
        /// <param name="isStoredProc">boolean value indicating whether command type is stored procedure or text</param>
        /// <param name="param">collection of parameters</param>
        /// <param name="dbTrans">transaction object for the command</param>
        /// <returns>DbCommand</returns>
        private static DbCommand PrepareDBCommand(string commandText, bool isStoredProc, DbParameter[] param)
        {
            try
            {
                if (isStoredProc == true)
                {
                    cmd = db.GetStoredProcCommand(commandText);
                    if (param != null)
                    {
                        foreach (DbParameter par in param)
                        {
                            if (par.Direction == ParameterDirection.Output)
                            {
                                db.AddOutParameter(cmd, par.ParameterName, par.DbType, par.Size);
                            }
                            else
                            {
                                db.AddParameter(cmd, par.ParameterName, par.DbType, par.Direction, par.ParameterName, par.SourceVersion, par.Value);
                            }
                        }
                    }
                }
                else
                {
                    cmd = db.GetSqlStringCommand(commandText);
                }
            }
            catch (Exception ex)
            {
                throw ex;
            }
            return cmd;
        }

        /// <summary>
        /// Overloaded method which returns DataSet
        /// </summary>
        /// <param name="commandText">command text for the DbCommand</param>
        /// <param name="isStoredProc">boolean value indicating whether command type is stored procedure or text</param>
        /// <param name="param">collection of parameters</param>
        /// <param name="dbTrans">transaction object for the command</param>
        /// <returns>DataSet</returns>
        public static DataSet ExecuteDataSet(string commandText, bool isStoredProc, DbParameter[] param, DbTransaction dbTrans)
        {
            try
            {
                OpenDataBase();

                cmd = PrepareDBCommand(commandText, isStoredProc, param);

                if (dbTrans != null)
                    ds = db.ExecuteDataSet(cmd, dbTrans);
                else
                    ds = db.ExecuteDataSet(cmd);
                return ds;
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }
        /// <summary>
        /// 
        /// </summary>
        /// <param name="commandText"></param>
        /// <param name="isStoredProc"></param>
        /// <param name="param"></param>
        /// <param name="dbTrans"></param>
        /// <returns></returns>
        public static DataTable ExecuteDataTable(string commandText, bool isStoredProc, DbParameter[] param, DbTransaction dbTrans)
        {
            try
            {
                OpenDataBase();

                cmd = PrepareDBCommand(commandText, isStoredProc, param);

                if (dbTrans != null)
                    ds = db.ExecuteDataSet(cmd, dbTrans);
                else
                    ds = db.ExecuteDataSet(cmd);
                dt = ds.Tables[0];
                return dt;
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }
        /// <summary>
        /// Overloaded method which returns DataSet
        /// </summary>
        /// <param name="commandText">command text for the DbCommand</param>
        /// <param name="isStoredProc">boolean value indicating whether command type is stored procedure or text</param>
        /// <param name="param">collection of parameters</param>
        /// <returns>DataSet</returns>
        public static DataSet ExecuteDataSet(string commandText, bool isStoredProc, DbParameter[] param)
        {
            ds = ExecuteDataSet(commandText, isStoredProc, param, null);
            return ds;
        }
        /// <summary>
        /// 
        /// </summary>
        /// <param name="commandText"></param>
        /// <param name="isStoredProc"></param>
        /// <param name="param"></param>
        /// <returns></returns>
        public static DataTable ExecuteDataTable(string commandText, bool isStoredProc, DbParameter[] param)
        {
            dt = ExecuteDataTable(commandText, isStoredProc, param, null);
            return dt;
        }
        /// <summary>
        /// Overloaded method which returns DataSet
        /// </summary>
        /// <param name="commandText">command text for the DbCommand</param>
        /// <param name="isStoredProc">boolean value indicating whether command type is stored procedure or text</param>
        /// <returns>DataSet</returns>
        public static DataSet ExecuteDataSet(string commandText, bool isStoredProc)
        {
            ds = ExecuteDataSet(commandText, isStoredProc, null);

            return ds;
        }
        /// <summary>
        /// 
        /// </summary>
        /// <param name="commandText"></param>
        /// <param name="isStoredProc"></param>
        /// <returns></returns>
        public static DataTable ExecuteDataTable(string commandText, bool isStoredProc)
        {
            dt = ExecuteDataTable(commandText, isStoredProc, null);

            return dt;
        }
        /// <summary>
        /// Overloaded method which returns affected rows for insert,update or delete on database
        /// </summary>
        /// <param name="commandText">command text for the DbCommand</param>
        /// <param name="isStoredProc">boolean value indicating whether command type is stored procedure or text</param>
        /// <param name="param">collection of parameters</param>
        /// <param name="dbTrans">transaction object for the command</param>
        /// <returns>int</returns>
        public static int ExecuteNonQuery(string commandText, bool isStoredProc, DbParameter[] param, DbTransaction dbTrans)
        {
            try
            {
                OpenDataBase();

                cmd = PrepareDBCommand(commandText, isStoredProc, param);

                int rowsAffected = 0;
                if (dbTrans != null)
                    rowsAffected = db.ExecuteNonQuery(cmd, dbTrans);
                else
                    rowsAffected = db.ExecuteNonQuery(cmd);

                return rowsAffected;
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }

        /// <summary>
        /// Return output parameter value
        /// </summary>
        /// <param name="param"></param>
        /// <param name="paramName"></param>
        /// <returns></returns>
        public static object GetParameterValue(DbParameter param, string paramName)
        {
            return GetParameterValue(cmd, param, paramName);
        }

        /// <summary>
        /// Return output parameter value as an object to the calling function
        /// </summary>
        /// <param name="cmd"></param>
        /// <param name="param"></param>
        /// <param name="paramName"></param>
        /// <returns></returns>
        private static object GetParameterValue(DbCommand cmd, DbParameter param, string paramName)
        {
            object obj = null;
            if (param.Direction == ParameterDirection.Output)
            {
                obj = GetParameterValue(cmd, paramName);
            }
            return obj;
        }

        /// <summary>
        /// Get output paramter value from the base class database
        /// </summary>
        /// <param name="cmd"></param>
        /// <param name="paramName"></param>
        /// <returns></returns>
        private static object GetParameterValue(DbCommand cmd, string paramName)
        {
            return db.GetParameterValue(cmd, paramName);
        }

        /// <summary>
        /// Overloaded method which returns affected rows for insert,update or delete on database
        /// </summary>
        /// <param name="commandText">command text for the DbCommand</param>
        /// <param name="isStoredProc">boolean value indicating whether command type is stored procedure or text</param>
        /// <param name="param">collection of parameters</param>
        /// <returns>int</returns>
        public static int ExecuteNonQuery(string commandText, bool isStoredProc, DbParameter[] param)
        {
            int rowsAffected = ExecuteNonQuery(commandText, isStoredProc, param, null);
            return rowsAffected;
        }

        /// <summary>
        /// Overloaded method which returns affected rows for insert,update or delete on database
        /// </summary>
        /// <param name="commandText">command text for the DbCommand</param>
        /// <param name="isStoredProc">boolean value indicating whether command type is stored procedure or text</param>
        /// <returns>int</returns>
        public static int ExecuteNonQuery(string commandText, bool isStoredProc)
        {
            int rowsAffected = ExecuteNonQuery(commandText, isStoredProc, null);

            return rowsAffected;
        }

        /// <summary>
        /// Overloaded method which returns an object from the result set first row, first column
        /// </summary>
        /// <param name="commandText">command text for the DbCommand</param>
        /// <param name="isStoredProc">boolean value indicating whether command type is stored procedure or text</param>
        /// <param name="param">collection of parameters</param>
        /// <param name="dbTrans">transaction object for the command</param>
        /// <returns>object</returns>
        public static object ExecuteScalar(string commandText, bool isStoredProc, DbParameter[] param, DbTransaction dbTrans)
        {
            try
            {
                OpenDataBase();

                cmd = PrepareDBCommand(commandText, isStoredProc, param);

                object obj = null;

                if (dbTrans != null)
                    obj = db.ExecuteScalar(cmd, dbTrans);
                else
                    obj = db.ExecuteScalar(cmd);
                return obj;
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }

        private static object[] PrepareParamObjects(DbParameter[] param)
        {
            ArrayList arr = new ArrayList();
            foreach (DbParameter par in param)
            {
                arr.Add(par.Value);
            }
            object[] obj = arr.ToArray();

            return obj;
        }

        /// <summary>
        /// Overloaded method which returns an object from the result set first row, first column
        /// </summary>
        /// <param name="commandText">command text for the DbCommand</param>
        /// <param name="isStoredProc">boolean value indicating whether command type is stored procedure or text</param>
        /// <param name="param">collection of parameters</param>
        /// <returns>object</returns>
        public static object ExecuteScalar(string commandText, bool isStoredProc, DbParameter[] param)
        {
            object obj = ExecuteScalar(commandText, isStoredProc, param, null);
            return obj;
        }

        /// <summary>
        /// Overloaded method which returns an object from the result set first row, first column
        /// </summary>
        /// <param name="commandText">command text for the DbCommand</param>
        /// <param name="isStoredProc">boolean value indicating whether command type is stored procedure or text</param>
        /// <returns>object</returns>
        public static object ExecuteScalar(string commandText, bool isStoredProc)
        {
            object obj = ExecuteScalar(commandText, isStoredProc, null);

            return obj;
        }

        public static DbParameter ConfigureParameter(DbParameter param, string name, DbType dbType, int size, ParameterDirection direction, bool nullable, byte precision, byte scale, string sourceColumn, DataRowVersion sourceVersion, object value)
        {
            param.ParameterName = name;
            param.DbType = dbType;
            param.Size = size;
            //param.Value = (value == null) ? DBNull.Value : value;
            param.Value = value;
            param.Direction = direction;
            param.IsNullable = nullable;
            param.SourceColumn = sourceColumn;
            param.SourceVersion = sourceVersion;

            return param;
        }

    }
}
