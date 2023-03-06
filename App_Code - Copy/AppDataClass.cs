using System;
using System.Data;
using SPARTools;
using System.Data.SqlClient;

/// <summary>
/// Summary description for AppDataClass
/// this class is used to create access layer for DAL
/// example
/// public static DataSet Get_DatasetName(SqlConnection sqlgetconnection)
///  {
///    return AppDAL.DatasetName;
///  }
/// </summary>
public class AppDataClass
{
    public static DataTable Get_dt_JobAssigned(SqlConnection sqlgetconnection)
    {
        return AppDAL.dt_usp_mpdemo_ListOfAssignedJobs(sqlgetconnection);
    }
}
