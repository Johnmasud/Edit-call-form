using System;
using System.Collections.Generic;
using System.Web;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using SPAR.Tools.Security;
using SPAR.Tools.Utils;

/// <summary>
/// Summary description for CLSdbData
/// </summary>
public class CLSdbData
{
 SPARValues WebAppClass;

	public CLSdbData()
	{
	
   
	}

    public List<ClsCFJWTSData> GetCFJWTSDataList(Int32 Lang_id, Int32 Job_No, Int32 Wave_No, Int32 Task_No, Int32 Chain_No, Int32 Store_No, Int32 merch_no, String Job_Visit_Date, String Q_no, Int32 strQ_Res, String Photo_Prod_upc) 
 {
  // String DBConnStringCurrent;
  WebAppClass = new SPARValues();
  //WebAppClass.CurrentSQLDBConnection;

         List<ClsCFJWTSData> clsCFJWTSDataList = new List<ClsCFJWTSData>();

        
         //clsMerch_no = 95057;
          DataTable dt = new DataTable();
          //  DataTable dt1 = new DataTable();
 
          int i = 0;

          dt = AppData.Get_CFJWT_PhotoByQ_PopUPList(Lang_id, Job_No, Wave_No, Task_No, Chain_No, Store_No, merch_no, Job_Visit_Date, Q_no,strQ_Res, Photo_Prod_upc, WebAppClass.CurrentSQLDBConnection);

            foreach (DataRow myRow in dt.Rows)
            {
             ClsCFJWTSData info = new ClsCFJWTSData();
             info.photo_file_path = Convert.ToString(myRow["photo_file_path"]);
             info.approval_flag = Convert.ToString(myRow["approval_flag"]);
             info.p_id = Convert.ToString(myRow["p_id"]);
             clsCFJWTSDataList.Add(info);
            }
            return clsCFJWTSDataList;
 }
    public List<ClsCFJWTSData2> GetCFJWTSendDataList(Int32 Lang_id, Int32 Job_No, Int32 Wave_No, Int32 Task_No, Int32 Chain_No, Int32 Store_No, Int32 merch_no, String Job_Visit_Date, String Q_no, Int32 strQ_Res, String Photo_Prod_upc, String NewPicture_Name,String Status_flag, String P_id,String Sel_AnsType,String Sel_Q_no,String Move_AnsType,String Move_Q_no,String Ans_val)
    {
        // String DBConnStringCurrent;
        WebAppClass = new SPARValues();
        //WebAppClass.CurrentSQLDBConnection;

        List<ClsCFJWTSData2> clsCFJWTSDataList2= new List<ClsCFJWTSData2>();
         

        //clsMerch_no = 95057;
        DataTable dt = new DataTable();
        //  DataTable dt1 = new DataTable();

        int i = 0;

        dt = AppData.Get_CFJWT_PhotoByQ_PopUP_ModifyData(Lang_id, Job_No, Wave_No, Task_No, Chain_No, Store_No, merch_no, Job_Visit_Date, Q_no, strQ_Res, Photo_Prod_upc,NewPicture_Name,Status_flag,P_id,Sel_AnsType,Sel_Q_no,Move_AnsType, Move_Q_no,Ans_val, WebAppClass.CurrentSQLDBConnection);

        foreach (DataRow myRow in dt.Rows)
        {
            ClsCFJWTSData2 info2 = new ClsCFJWTSData2();
            info2.ErrorMessage = Convert.ToString(myRow["ErrorMessage"]);
            clsCFJWTSDataList2.Add(info2);
        }
        return clsCFJWTSDataList2;
    }

}