using System;
using System.Web;
using System.Collections;
using System.Web.Services;
using System.Web.Services.Protocols;
using System.Collections.Generic;
using SPAR.Tools.Security;
using SPAR.Tools.Utils;
using System.Web.Script.Services;
using System.Web.Script.Serialization;
using System.IO;
using System.Configuration;

/// <summary>
/// Summary description for WebService
/// </summary>
[WebService(Namespace = "http://tempuri.org/")]
[WebServiceBinding(ConformsTo = WsiProfiles.BasicProfile1_1)]
[ScriptService]
public class WebService : System.Web.Services.WebService {
    SPARValues WebAppClass;
    private int Lang_id;
    public WebService () {

        //Uncomment the following line if using designed components 
        //InitializeComponent(); 
    }

    [WebMethod]
    public static List<ClsCFJWTSData> GetJWTList(Int32 Lang_id, Int32 Job_No, Int32 Wave_No, Int32 Task_No, Int32 Chain_No, Int32 Store_No, Int32 merch_no, String Job_Visit_Date, String Q_no, Int32 strQ_Res, String Photo_Prod_upc)
    {
        int Classmerch_no, Classlang_id;
        String DBConnectionString;
 
        List<ClsCFJWTSData> clsCFJWTSDataList = new List<ClsCFJWTSData>();

        CLSdbData clsdbData = new CLSdbData();
 
        clsCFJWTSDataList = clsdbData.GetCFJWTSDataList(Lang_id,Job_No,Wave_No,Task_No,Chain_No,Store_No,merch_no,Job_Visit_Date,Q_no,strQ_Res,Photo_Prod_upc);
        return clsCFJWTSDataList;
    }
    [WebMethod]
    [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
    public string GetWinner(string winnerType)
    {
        string test;
        test = "123";
        return new JavaScriptSerializer().Serialize(test);
    }
    [WebMethod]
    [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
    public string JustTest(int Lang_id,int Job_No,int Wave_No,int Task_No,int Chain_No,int Store_No,int Merch_no,string Visit_Date,string Q_no,int strQ_Res,string Prod_upc)
    {
        int Classmerch_no, Classlang_id;
        String DBConnectionString;

        List<ClsCFJWTSData> clsCFJWTSDataList = new List<ClsCFJWTSData>();

        CLSdbData clsdbData = new CLSdbData();
        //clsCFJWTSDataList = clsdbData.GetCFJWTSDataList(1,101449,201521,1,2821,1,95057,"01/11/16","001","");

        clsCFJWTSDataList = clsdbData.GetCFJWTSDataList(Lang_id, Job_No, Wave_No, Task_No, Chain_No, Store_No, Merch_no, Visit_Date, Q_no,strQ_Res,Prod_upc);

         return new JavaScriptSerializer().Serialize(clsCFJWTSDataList);
        //return clsCFJWTSDataList.ToString();
    }
    [WebMethod]
    [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
    public string SendDataToDataBase(int Lang_id, int Job_No, int Wave_No, int Task_No, int Chain_No, int Store_No, int Merch_no, string Visit_Date, string Q_no, int strQ_Res, string Prod_upc, string PhotoDelMovArray,string TodayDate)
    
    {
        int Classmerch_no, Classlang_id;
        String DBConnectionString;

        List<ClsCFJWTSData2> clsCFJWTSDataList2 = new List<ClsCFJWTSData2>();

        CLSdbData clsdbData = new CLSdbData();

        int StrFileYear, StrFileMonth, StrFileDay, StrFileHour, StrFileMinute, StrFileSecond, StrFileMillisecond;
        int StrConfDay, Curday, Tempday, TempHours, TempMin, TempSec, x;
        String StrSec, StrMin, StrHou, StrComments, DoitOnce, StrConfirHTML, StrMillisec, mSize, StrFileApprovedPath, StrFile_extension;
        String StrFileProductionPath, StrFilePathdb, StrFileExitPathdb, StrFileApproved, NewPicture_Name;
        int m, Str_Lang_id;

        Str_Lang_id = Lang_id;
        StrFile_extension = "jpg";
        StrFilePathdb = "";
        StrFileApprovedPath = "";
        NewPicture_Name = "";
        StrFileProductionPath = ConfigurationManager.AppSettings["FileApprovedPath"];
        //Response.Write("StrFileApprovedPath=" + StrFileApprovedPath);

        if ((Lang_id == 13) || (Lang_id == 17))
        {
            if (Lang_id == 13)
            {
                StrFileApprovedPath = StrFileProductionPath + "sparEyesPic1\\\\approved\\\\";
                StrFilePathdb = StrFileProductionPath + "sparEyesPic1\\\\approved\\\\";
                Str_Lang_id = 1;
            }

            if (Lang_id == 17)
            {
                StrFileApprovedPath = StrFileProductionPath + "sparEyesPic7\\\\approved\\\\";
                StrFilePathdb = StrFileProductionPath + "sparEyesPic7\\\\approved\\\\";
                Str_Lang_id = 7; 
            }

        }
        else
        {
            StrFileApprovedPath = StrFileProductionPath + "sparEyesPic" + Convert.ToString(Lang_id) + "\\\\approved\\\\";
            StrFilePathdb = StrFileProductionPath + "sparEyesPic" + Convert.ToString(Lang_id) + "\\\\approved\\\\";
        }              
        
        string[] ArrayQuestions;
        string[] ArrayEachQ;
        string[] ArrayCheckBox;
        string EachElement, Status_flag, P_id, Sel_AnsType, Sel_Q_no, Move_AnsType, Move_Q_no, Ans_val, Approved_Folder_Name, Picture_Name, CBAns_val;
        int Arraylen, k, Add_res_Val, ArrBClen; 
        //int i;
        k = 0; 
        Add_res_Val=1; 
        //ArrayAddress = new string[3];
        ArrayQuestions = PhotoDelMovArray.Split("~".ToCharArray());
        Arraylen = ArrayQuestions.Length;
         Arraylen = Arraylen - 1;

        for (int i = 0; i < Arraylen; i++)
        {
            EachElement = ArrayQuestions[i];

            ArrayEachQ = EachElement.Split("-".ToCharArray());
            Status_flag = ArrayEachQ[0];
            P_id = ArrayEachQ[1];
            Sel_AnsType = ArrayEachQ[2];
            Sel_Q_no = ArrayEachQ[3];
            Move_AnsType = ArrayEachQ[4];
            Move_Q_no = ArrayEachQ[5];
            Ans_val = ArrayEachQ[6];


            StrFileYear = System.DateTime.Now.Year;
            StrFileMonth = System.DateTime.Now.Month;
            StrFileDay = System.DateTime.Now.Day;
            StrFileHour = System.DateTime.Now.Hour;
            StrFileMinute = System.DateTime.Now.Minute;
            StrFileSecond = System.DateTime.Now.Second;
            StrFileMillisecond = System.DateTime.Now.Millisecond;

            StrSec = Convert.ToString(StrFileSecond);
            StrMin = Convert.ToString(StrFileMinute);
            StrHou = Convert.ToString(StrFileHour);
            StrMillisec = Convert.ToString(StrFileMillisecond);

            if (Convert.ToString(StrFileSecond).Length == 1)
            {
                StrSec = "0" + StrSec + "";
            }
            if (Convert.ToString(StrFileMinute).Length == 1)
            {
                StrMin = "0" + StrMin + "";
            }
            if (Convert.ToString(StrFileHour).Length == 1)
            {
                StrHou = "0" + StrHou + "";
            }
            string StrAppDay, StrAppMonth, StrAppYear;

            StrAppDay = System.DateTime.Now.ToString("dd");
            StrAppMonth = System.DateTime.Now.ToString("MM");
            StrAppYear = System.DateTime.Now.ToString("yyyy");

            //********** date function 

            int StrLenM, StrLenD;

            string[] ArrayDate;
            //int i;
            //ArrayAddress = new string[3];
            ArrayDate = TodayDate.Split("/".ToCharArray());
            StrAppMonth = ArrayDate[0];
            StrAppDay = ArrayDate[1];
            StrAppYear = ArrayDate[2];

            StrLenM = StrAppMonth.Length;
            if (StrLenM < 2)
            {
                StrAppMonth = "0" + StrAppMonth;
            }
            StrLenD = StrAppDay.Length;
            if (StrLenD < 2)
            {
                StrAppDay = "0" + StrAppDay;
            }

            Approved_Folder_Name = "" + StrAppYear + "" + StrAppMonth + "" + StrAppDay + "";
            // Response.Write("Approved_Folder_Name=" + Approved_Folder_Name + "<BR>");

            Picture_Name = "" + Job_No + "" + Wave_No + "" + Task_No + "" + Chain_No + "" + Store_No + "" + Merch_no + "_" + StrFileYear + "" + StrFileMonth + "" + StrFileDay + "" + StrHou.Trim() + "" + StrMin.Trim() + "" + StrSec.Trim() + "" + StrMillisec.Trim() + "" + k + "" + Add_res_Val + "";
            // Response.Write("Picture_Name=" + Picture_Name + "<BR>");
          
             ArrayCheckBox = Ans_val.Split("|".ToCharArray());
             ArrBClen = ArrayCheckBox.Length;
             ArrBClen = ArrBClen - 1;
        
              for (int a = 0; a < ArrBClen; a++)
               {
                   if (Move_AnsType == "C")
                   {
                       if (ArrBClen > 1)
                       {
                           if (a > 0)
                           {
                               CBAns_val = ArrayCheckBox[a];
                               NewPicture_Name = "" + Picture_Name + "" + CBAns_val + "";
                               StrFileExitPathdb = "" + StrFilePathdb.Trim() + "" + Approved_Folder_Name + "\\" + P_id.Trim() + "." + StrFile_extension + "";
                               StrFileApproved = "" + StrFileApprovedPath.Trim() + "" + Approved_Folder_Name + "\\" + Picture_Name.Trim() + "." + StrFile_extension + "";
                               File.Copy(StrFileExitPathdb, StrFileApproved);
                           }
                       }
                   }

                   //(File.Exists NewPicture_Name Status_flag P_id , Sel_AnsType ,  Sel_Q_no,  Move_AnsType, Move_Q_no , Ans_val  

                  clsCFJWTSDataList2 = clsdbData.GetCFJWTSendDataList(Str_Lang_id, Job_No, Wave_No, Task_No, Chain_No, Store_No, Merch_no, Visit_Date, Q_no, strQ_Res, Prod_upc,NewPicture_Name,Status_flag,P_id,Sel_AnsType,Sel_Q_no,Move_AnsType, Move_Q_no,Ans_val);
                   NewPicture_Name = "";
               }
                            
            

           
        }
        //clsCFJWTSDataList = clsdbData.GetCFJWTSDataList(1,101449,201521,1,2821,1,95057,"01/11/16","001","");

        //clsCFJWTSDataList2 = clsdbData.GetCFJWTSendDataList(Str_Lang_id, Job_No, Wave_No, Task_No, Chain_No, Store_No, Merch_no, Visit_Date, Q_no, strQ_Res, Prod_upc, PhotoDelMovArray);

        return new JavaScriptSerializer().Serialize(clsCFJWTSDataList2);
        //return clsCFJWTSDataList.ToString();
    }
}

