using System;
using System.Data;
using System.Data.SqlClient;
using SPARTools;


/// <summary>
/// Summary description for AppDAL will create Data Access Layer for the application
/// Example dataset creation
/// public static dataset dataset_name(SqlConnection sqlgetconnection)
/// {
///     using (SqlStoredProcedure sp = new SqlStoredProcedure("dbo.spname", sqlgetconnection))
///     {
///         sp.AddParameterWithValue("spparametername", sp_parameter_datatype, length, ParameterDirection, localvariable);
//          return sp.ExecuteDataSet();
///     }
/// }
/// </summary>
public class AppDAL
{
    public static DataTable dt_usp_mpdemo_ListOfAssignedJobs(SqlConnection sqlgetconnection)
    {
        using (SqlStoredProcedure sp = new SqlStoredProcedure("dbo.usp_mpdemo_ListOfAssignedJobs", sqlgetconnection))
        {
            return sp.ExecuteDataTable();
        }
    }
	    
}
