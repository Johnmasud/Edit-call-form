using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Web;



/// <summary>
/// Summary description for AppData
/// </summary>
public class AppData
{
         
    //*************** Procedure CFJWTInputs.aspx
    public static DataTable Get_MerchInfo(Int32 iMerchNo, SqlConnection sqlgetconnection)
        {
                try
                {
                    DataTable appDT = new DataTable();
                    appDT = DAL.usp_CallForm_Merch_Info(iMerchNo, sqlgetconnection);
                    return appDT;
                }
                catch (Exception ex)
                {
                    throw ex;
                }
                finally
                {
                    sqlgetconnection.Close();            
                }
        }
        //*************** Procedure CFJWTInputs.aspx
    public static DataTable Get_CellPhoneCarrier(SqlConnection sqlgetconnection)
        {
            try
            {
                DataTable appDT5 = new DataTable();
                appDT5 = DAL.USP_CFJWT_CellPhoneCarrier(sqlgetconnection);
                return appDT5;
            }
            catch (Exception ex)
            {
                throw ex;
            }
            finally
            {
                sqlgetconnection.Close();
            }
        }

    public static DataTable Get_USP_JWT_MultiVisit_Validate(Int32 Lang_id, Int32 Merch_no, Int32 Job_No, Int32 Wave_No, Int32 Task_No, Int32 Chain_No, Int32 Store_No,String User_id, SqlConnection sqlgetconnection)
    {
        try
        {
            DataTable appDT15 = new DataTable();
            appDT15 = DAL.USP_JWT_MultiVisit_Validate(Lang_id, Merch_no, Job_No, Wave_No, Task_No, Chain_No, Store_No,User_id, sqlgetconnection);
            return appDT15;
        }
        catch (Exception ex)
        {
            throw ex;
        }
        finally
        {
            sqlgetconnection.Close();
        }
    }
        //******************* Photo option pages
    public static DataSet Get_USP_JWT_MultiVisit_Report_CallForm(Int32 Lang_id, Int32 Merch_no, Int32 Job_No, Int32 Wave_No, Int32 Task_No, Int32 Chain_No, Int32 Store_No, SqlConnection sqlgetconnection)
     {
        try
        {
            DataSet appDT15 = new DataSet();
            appDT15 = DAL.USP_JWT_MultiVisit_Report_CallForm(Lang_id, Merch_no, Job_No, Wave_No, Task_No, Chain_No, Store_No, sqlgetconnection);
            return appDT15;
        }
        catch (Exception ex)
        {
            throw ex;
        }
        finally
        {
            sqlgetconnection.Close();
        }
    }

   //*************** Procedure CFJWTValidateSV.aspx
    public static DataTable Get_CFJWTValidate(Int32 Lang_id, Int32 Job_No, Int32 Wave_No, Int32 Task_No, Int32 Chain_No, Int32 Store_No, String PVisit_Date, Int32 Merch_no, Int32 POutOfStock_no,String User_id, SqlConnection sqlgetconnection)
        {
            try
            {
                DataTable appDT = new DataTable();
                appDT = DAL.USP_CFJWTValidate_temp(Lang_id,Job_No, Wave_No, Task_No, Chain_No, Store_No, PVisit_Date, Merch_no, POutOfStock_no,User_id, sqlgetconnection);
                return appDT;
            }
            catch (Exception ex)
            {
                throw ex;
            }
            finally
            {
                sqlgetconnection.Close();
            }
        }


    public static DataTable Get_MerchJWTMenu(Int32 Lang_id,Int32 iMerchNo,  SqlConnection sqlgetconnection)
        {
                try
                {
                    DataTable appDT = new DataTable();
                    appDT = DAL.usp_MerchJWTMenu(Lang_id,iMerchNo, sqlgetconnection);
                    return appDT;
                }
                catch (Exception ex)
                {
                    throw ex;
                }
                finally
                {
                    sqlgetconnection.Close();            
                }
        }
    public static DataTable Get_ManagerTitle(SqlConnection sqlgetconnection)
    {
        try
        {
            DataTable appDT2 = new DataTable();
            appDT2 = DAL.USP_CFStore_Manager_Title(sqlgetconnection);
            return appDT2;
        }
        catch (Exception ex)
        {
            throw ex;
        }
        finally
        {
            sqlgetconnection.Close();
        }
    }
    public static DataTable Get_Start_timeClass(SqlConnection sqlgetconnection)
    {
        try
        {
            DataTable appDT10 = new DataTable();
            appDT10 = DAL.USP_Start_time(sqlgetconnection);
            return appDT10;
        }
        catch (Exception ex)
        {
            throw ex;
        }
        finally
        {
            sqlgetconnection.Close();
        }
    }

    public static DataTable Get_JWT_VisitDate_CheckClass(Int32 Job_No, Int32 Wave_No, Int32 Task_No, Int32 Store_id, String Visit_Date, Int32 Merch_no, SqlConnection sqlgetconnection)
    {
        try
        {
            DataTable appDT10 = new DataTable();
            appDT10 = DAL.JWT_VisitDate_CheckProcedure(Job_No, Wave_No, Task_No, Store_id, Visit_Date, Merch_no, sqlgetconnection);
            return appDT10;
        }
        catch (Exception ex)
        {
            throw ex;
        }
        finally
        {
            sqlgetconnection.Close();
        }
    }

    
    public static DataTable Get_CFMerchCellPhoneInsert(Int32 Merch_no, String Email_Add, String CellPhoneNo, Int32 CellProvider, Int32 Hidden_PhoneStatus, SqlConnection sqlgetconnection)
    {
        try
        {
            DataTable appDT3 = new DataTable();
            appDT3 = DAL.CFMerchCellPhoneInsertProcedure(Merch_no, Email_Add, CellPhoneNo, CellProvider, Hidden_PhoneStatus, sqlgetconnection);
            return appDT3;
        }
        catch (Exception ex)
        {
            throw ex;
        }
        finally
        {
            sqlgetconnection.Close();
        }
    }
      public static DataTable Get_ClassBusinessRulePhoto(Int32 Lang_id, Int32 Job_No, Int32 Wave_No, Int32 Task_No, Int32 store_id, Int32 Merch_no, SqlConnection sqlgetconnection)
        {
            try
            {
                DataTable appDT14 = new DataTable();
                appDT14 = DAL.USP_CFJWT_Business_RulePhoto(Lang_id, Job_No, Wave_No, Task_No, store_id, Merch_no, sqlgetconnection);
                return appDT14;
            }
            catch (Exception ex)
            {
                throw ex;
            }
            finally
            {
                sqlgetconnection.Close();
            }
        }
     
    //*************** CFPictureGetFileOption.aspx

    public static DataTable Get_CFJWTVisit_PhotoDates(Int32 Job_No, Int32 Wave_No, Int32 Task_No, Int32 Chain_No, Int32 Store_No, String Job_Visit_Date, Int32 merch_no, String Str_Sv_Panel_id, SqlConnection sqlgetconnection)
    {
        try
        {
            DataTable appDT11 = new DataTable();
            appDT11 = DAL.Get_CFJWTVisit_PhotoProcedure(Job_No, Wave_No, Task_No, Chain_No, Store_No,Job_Visit_Date, merch_no, Str_Sv_Panel_id, sqlgetconnection);
            return appDT11;
        }
        catch (Exception ex)
        {
            throw ex;
        }
        finally
        {
            sqlgetconnection.Close();
        }
    }


    //*************** Procedure CFPictureFileConfirmation.aspx
    public static DataTable Get_CFPictureFileConfirmationinsert(Int32 Job_No, Int32 Wave_No, Int32 Task_No, Int32 Chain_No, Int32 Store_No, Int32 merch_no, Int32 Lang_Id, String Picture_Name, String Visit_Date, String Comments, String PhotoFileName, String PhotoFilePath, Int32 confirmation_no, Int32 mWidth, Int32 mHeight, String mSize, Int32 visit_no, String Job_Visit_Date, String Pre_Approved_Flag, String Photo_Q_No, String Photo_Prod_upc, String Old_Visit_Date, String Photo_q_Res_Val, String Photo_org_pic_id, String Str_Sv_Panel_id, SqlConnection sqlgetconnection)
    {
        try
        {
            DataTable appDT3 = new DataTable();
            appDT3 = DAL.CFPictureFileConfirmationinsert(Job_No, Wave_No, Task_No, Chain_No, Store_No, merch_no, Lang_Id, Picture_Name, Visit_Date, Comments, PhotoFileName, PhotoFilePath, confirmation_no, mWidth, mHeight, mSize, visit_no, Job_Visit_Date, Pre_Approved_Flag, Photo_Q_No, Photo_Prod_upc, Old_Visit_Date, Photo_q_Res_Val, Photo_org_pic_id, Str_Sv_Panel_id, sqlgetconnection);
            return appDT3;
        }
        catch (Exception ex)
        {
            throw ex;
        }
        finally
        {
            sqlgetconnection.Close();
        }
    }
   
    public static DataTable Get_CFPhotoSentEmail(Int32 Job_No, Int32 Wave_No, Int32 Task_No, Int32 Chain_No, Int32 Store_No, Int32 merch_no,String Job_Visit_Date, SqlConnection sqlgetconnection)
    {
        try
        {
            DataTable appDT4 = new DataTable();
            appDT4 = DAL.Get_CFPhotoSentEmailProcedure(Job_No, Wave_No, Task_No, Chain_No, Store_No, merch_no,Job_Visit_Date, sqlgetconnection);
            return appDT4;
        }
        catch (Exception ex)
        {
            throw ex;
        }
        finally
        {
            sqlgetconnection.Close();
        }
    }
    //*************** photo by questions 
    public static DataSet Get_USP_Photo_QuestionCheck(Int32 Lang_id, Int32 Job_No, Int32 Wave_No, Int32 Task_No, Int32 Chain_No, Int32 Store_No, Int32 merch_no, String Job_Visit_Date,String Str_Sv_Panel_id, SqlConnection sqlgetconnection)
    {
        try
        {
            DataSet appDT16 = new DataSet();
            appDT16 = DAL.Get_USP_Photo_QuestionCheck_Procedure(Lang_id,Job_No, Wave_No, Task_No, Chain_No, Store_No, merch_no, Job_Visit_Date,Str_Sv_Panel_id, sqlgetconnection);
            return appDT16;
        }
        catch (Exception ex)
        {
            throw ex;
        }
        finally
        {
            sqlgetconnection.Close();
        }
    }
    //*************** photo by questions -text display info
    public static DataTable App_CFJWT_ByQ_DisplayText(Int32 Lang_id, Int32 Job_No, Int32 Wave_No, Int32 Task_No, Int32 merch_no, String Photo_Q_No, String Photo_q_Res_Val, String Photo_Prod_upc, SqlConnection sqlgetconnection)
    {
        try
        {
            DataTable appDT20 = new DataTable();
            appDT20 = DAL.Get_USP_CallForm_Photo_Question_Upc_text_Procedure(Lang_id, Job_No, Wave_No, Task_No, merch_no, Photo_Q_No, Photo_q_Res_Val, Photo_Prod_upc, sqlgetconnection);
            return appDT20;
        }
        catch (Exception ex)
        {
            throw ex;
        }
        finally
        {
            sqlgetconnection.Close();
        }
    }
    //*************** photo by questions -pop up
    public static DataTable Get_CFJWT_PhotoByQ_PopUPList (Int32 Lang_id, Int32 Job_No, Int32 Wave_No, Int32 Task_No, Int32 Chain_No, Int32 Store_No, Int32 merch_no, String Job_Visit_Date,String Q_no,Int32 strQ_Res, String Photo_Prod_upc, SqlConnection sqlgetconnection)
    {
        try
        {
            DataTable appDT21 = new DataTable();
            appDT21 = DAL.Get_USP_CallForm_PhotoByQ_PopUPList_Procedure(Lang_id, Job_No, Wave_No, Task_No, Chain_No, Store_No, merch_no, Job_Visit_Date, Q_no,strQ_Res, Photo_Prod_upc, sqlgetconnection);
            return appDT21;
        }
        catch (Exception ex)
        {
            throw ex;
        }
        finally
        {
            sqlgetconnection.Close();
        }
    }
    public static DataTable Get_CFJWT_PhotoByQ_PopUP_ModifyData(Int32 Lang_id, Int32 Job_No, Int32 Wave_No, Int32 Task_No, Int32 Chain_No, Int32 Store_No, Int32 merch_no, String Job_Visit_Date, String Q_no, Int32 strQ_Res, String Photo_Prod_upc, String NewPicture_Name, String Status_flag, String P_id, String Sel_AnsType, String Sel_Q_no, String Move_AnsType, String Move_Q_no, String Ans_val, SqlConnection sqlgetconnection)
    {
        try
        {
            DataTable appDT21 = new DataTable();
            appDT21 = DAL.Get_USP_CallForm_PhotoByQ_PopUP_ModifyData_Procedure(Lang_id, Job_No, Wave_No, Task_No, Chain_No, Store_No, merch_no, Job_Visit_Date, Q_no, strQ_Res, Photo_Prod_upc,NewPicture_Name,Status_flag,P_id,Sel_AnsType,Sel_Q_no,Move_AnsType, Move_Q_no,Ans_val, sqlgetconnection);
            return appDT21;
        }
        catch (Exception ex)
        {
            throw ex;
        }
        finally
        {
            sqlgetconnection.Close();
        }
    }
    
    //****************** CFCallFormInputs 
    public static DataTable Get_USP_JWT_Call_Form(Int32 Job_No, Int32 Wave_No, Int32 Task_No, Int32 Store_id, String Prod_Specific, Int32 Work_Type_Id, String SS_Callform, String Prod_UPC, SqlConnection sqlgetconnection)
                                                                                                                  
    {
        try
        {
            DataTable appDT4 = new DataTable();
            appDT4 = DAL.Get_USP_JWT_Call_FormProcedure(Job_No, Wave_No, Task_No, Store_id, Prod_Specific, Work_Type_Id, SS_Callform, Prod_UPC, sqlgetconnection);
            return appDT4;
        }
        catch (Exception ex)
        {
            throw ex;
        }
        finally
        {
            sqlgetconnection.Close();
        }
    }
    public static DataTable Get_USP_Call_Form_RTS_Issues(Int32 Job_No, Int32 Wave_No, Int32 Task_No, Int32 Store_id, SqlConnection sqlgetconnection)
                                                                                                                  
    {
        try
        {
            DataTable appDT4 = new DataTable();
            appDT4 = DAL.Get_USP_Call_Form_RTS_IssuesProcedure(Job_No, Wave_No, Task_No, Store_id, sqlgetconnection);
            return appDT4;
        }
        catch (Exception ex)
        {
            throw ex;
        }
        finally
        {
            sqlgetconnection.Close();
        }
    }
    //*************** Get the reported questions back Get_USP_CF_ProductAnswerBack
    public static DataTable Get_USP_CF_AnswerBack(Int32 Lang_id, Int32 Job_No, Int32 Wave_No, Int32 Task_No, Int32 Store_id, Int32 merch_no, String Visit_Date, SqlConnection sqlgetconnection)
    {
        try
        {
            DataTable appDT17 = new DataTable();
            appDT17 = DAL.Get_USP_CallForm_Reported_ResponsesProcedure(Lang_id, Job_No, Wave_No, Task_No, Store_id, merch_no, Visit_Date, sqlgetconnection);
            return appDT17;
        }
        catch (Exception ex)
        {
            throw ex;
        }
        finally
        {
            sqlgetconnection.Close();
        }
    }
 
    //**************** CFCallFormValidate.aspx
    //*************** Procedure CFJWTValidateSV.aspx
    public static DataTable Get_JWT_CallForm_TempDataClass(Int32 Lang_id, Int32 Job_No, Int32 Wave_No, Int32 Task_No, Int32 Store_id, Int32 Merch_no, String Strdata1, String Strdata2, String Strdata3, String Strdata4, String Strdata5, String Strdata6, String Strdata7, String Strdata8, SqlConnection sqlgetconnection)
    {
        try
        {
            DataTable appDT = new DataTable();
            appDT = DAL.USP_JWT_CallForm_TempData(Lang_id, Job_No, Wave_No, Task_No, Store_id, Merch_no, Strdata1, Strdata2, Strdata3, Strdata4, Strdata5, Strdata6, Strdata7, Strdata8, sqlgetconnection);
            return appDT;
        }
        catch (Exception ex)
        {
            throw ex;
        }
        finally
        {
            sqlgetconnection.Close();
        }
    }
   

     public static DataTable Get_CallFormTempDataInsertProcedure(Int32 Job_No, Int32 Wave_No, Int32 Task_No, Int32 Store_id,Int32 Merch_no, String Q_No, String Ans_type, String QuestionResponse, SqlConnection sqlgetconnection)
                                                                                                                  
    {
        try
        {
            DataTable appDT4 = new DataTable();
            appDT4 = DAL.Get_USP_CallForm_TempDataInsert(Job_No, Wave_No, Task_No, Store_id, Merch_no, Q_No, Ans_type, QuestionResponse, sqlgetconnection);
            return appDT4;
        }
        catch (Exception ex)
        {
            throw ex;
        }
        finally
        {
            sqlgetconnection.Close();
        }
    }
    public static DataTable Get_CallFormDataDeleteTemp(Int32 Job_No, Int32 Wave_No, Int32 Task_No, Int32 Store_id, Int32 Merch_no, SqlConnection sqlgetconnection)
    {
        try
        {
            DataTable appDT6 = new DataTable();
            appDT6 = DAL.USP_CallForm_DataDelete_Temp(Job_No, Wave_No, Task_No, Store_id, Merch_no, sqlgetconnection);
            return appDT6;
        }
        catch (Exception ex)
        {
            throw ex;
        }
        finally
        {
            sqlgetconnection.Close();
        }
    }
    //*************** Procedure CFConfirmation.aspx
    public static DataTable Get_Call_Form_ConfirmationProcedure(Int32 Job_No, Int32 Wave_No, Int32 Task_No, Int32 Store_id, Int32 Merch_no, Int32 visit_no, String Visit_Date, String Time_IN_date, String Time_Out_date, String Visit_time, String HH_Status_Flag, Int32 rad_q_HH_Used, String txt_mileage, String txt_drive, String Data_Col_Method, String overwritetime, Int32 Work_Type_Id, String SS_Callform, String IVR_Start_Time, String Manager_Title, String Manager_name, Int32 Call_Form_Type_No, String StrArray, String user_id, String CUserId, String CIPAddr, String Str_Sv_Panel_id, SqlConnection sqlgetconnection)
    {
        try
        {
            DataTable appDT7 = new DataTable();
            appDT7 = DAL.USP_Call_Form_Confirmation_Procedure(Job_No, Wave_No, Task_No, Store_id, Merch_no, visit_no, Visit_Date, Time_IN_date, Time_Out_date, Visit_time, HH_Status_Flag, rad_q_HH_Used, txt_mileage, txt_drive, Data_Col_Method, overwritetime, Work_Type_Id, SS_Callform, IVR_Start_Time, Manager_Title, Manager_name, Call_Form_Type_No, StrArray, user_id, CUserId, CIPAddr,Str_Sv_Panel_id, sqlgetconnection);
            return appDT7;
        }
        catch (Exception ex)
        {
            throw ex;
        }
        finally
        {
            sqlgetconnection.Close();
        }
    }

    //*************** Procedure Edit visit date CFConfirmation.aspx
    public static DataTable Get_CallHeader_ConfirmationProcedure(Int32 Job_No, Int32 Wave_No, Int32 Task_No, Int32 Store_id, Int32 Merch_no, Int32 visit_no, String source_visit_dt, String source_Time_IN_date, String source_Time_Out_date, String Org_txt_mileage, String Org_txt_drive, String Visit_Date, String Time_IN_date, String Time_Out_date, String Str_txt_mileage, String Str_txt_drive, String user_id, String Str_Sv_Panel_id, SqlConnection sqlgetconnection)
    {
        try
        {
            DataTable appDT22 = new DataTable();
            appDT22 = DAL.USP_CallHeader_ConfirmationProcedure(Job_No, Wave_No, Task_No, Store_id, Merch_no, visit_no, source_visit_dt, source_Time_IN_date, source_Time_Out_date, Org_txt_mileage, Org_txt_drive, Visit_Date, Time_IN_date, Time_Out_date, Str_txt_mileage, Str_txt_drive, user_id, Str_Sv_Panel_id, sqlgetconnection);
            return appDT22;
        }
        catch (Exception ex)
        {
            throw ex;
        }
        finally
        {
            sqlgetconnection.Close();
        }
    }

    public static DataTable Get_DropDownProductList(Int32 Job_No, Int32 Wave_No, Int32 Task_No, Int32 Store_id, SqlConnection sqlgetconnection)
    {
        try
        {
            DataTable appDT8 = new DataTable();
            appDT8 = DAL.USP_Get_UPC_List_New_Procedure(Job_No, Wave_No, Task_No, Store_id, sqlgetconnection);
            return appDT8;
        }
        catch (Exception ex)
        {
            throw ex;
        }
        finally
        {
            sqlgetconnection.Close();
        }
    }
    public static DataTable Get_JWT_QuestionsData(Int32 Job_No, Int32 Wave_No, Int32 Task_No, Int32 Store_id, SqlConnection sqlgetconnection)
    {
        try
        {
            DataTable appDT9 = new DataTable();
            appDT9 = DAL.usp_Get_UPC_Questions_Proceudre(Job_No, Wave_No, Task_No, Store_id, sqlgetconnection);
            return appDT9;
        }
        catch (Exception ex)
        {
            throw ex;
        }
        finally
        {
            sqlgetconnection.Close();
        }
    }

    public static DataTable Get_JWTQuestionResponseData(Int32 Job_No, Int32 Wave_No, Int32 Task_No,  SqlConnection sqlgetconnection)
    {
        try
        {
            DataTable appDT10 = new DataTable();
            appDT10 = DAL.JWTQuestionResponse_Proceudre(Job_No, Wave_No, Task_No, sqlgetconnection);
            return appDT10;
        }
        catch (Exception ex)
        {
            throw ex;
        }
        finally
        {
            sqlgetconnection.Close();
        }
    }
    //*************** Procedure CFJWTValidateSV.aspx
    public static DataTable Get_JWT_Product_TempDataClass(Int32 Lang_id, Int32 Job_No, Int32 Wave_No, Int32 Task_No, Int32 Store_id, Int32 Merch_no,String Strdata1, String Strdata2, String Strdata3, String Strdata4, String Strdata5, String Strdata6, String Strdata7, String Strdata8, SqlConnection sqlgetconnection)
    {
        try
        {
            DataTable appDT = new DataTable();
            appDT = DAL.USP_JWT_Product_TempData(Lang_id, Job_No, Wave_No, Task_No, Store_id, Merch_no, Strdata1, Strdata2, Strdata3, Strdata4, Strdata5, Strdata6, Strdata7, Strdata8, sqlgetconnection);
            return appDT;
        }
        catch (Exception ex)
        {
            throw ex;
        }
        finally
        {
            sqlgetconnection.Close();
        }
    }
   
        //*************** Procedure CFJWTValidateSV.aspx
    public static DataTable Get_Grid_Reported_AnswersClass(Int32 Job_No, Int32 Wave_No, Int32 Task_No, Int32 Store_id, Int32 Merch_no, SqlConnection sqlgetconnection)
    {
        try
        {
            DataTable appDT = new DataTable();
            appDT = DAL.Get_Grid_Reported_AnswersProcedure(Job_No, Wave_No, Task_No, Store_id, Merch_no, sqlgetconnection);
            return appDT;
        }
        catch (Exception ex)
        {
            throw ex;
        }
        finally
        {
            sqlgetconnection.Close();
        }
    }
    //*************** Get the reported questions back Get_USP_CF_ProductAnswerBack
    public static DataTable Get_USP_CF_ProductAnswerBack(Int32 Lang_id, Int32 Job_No, Int32 Wave_No, Int32 Task_No, Int32 Store_id, Int32 merch_no, String Visit_Date, SqlConnection sqlgetconnection)
    {
        try
        {
            DataTable appDT18 = new DataTable();
            appDT18 = DAL.usp_CF_Product_Reported_AnswersProcedure(Lang_id, Job_No, Wave_No, Task_No, Store_id, merch_no, Visit_Date, sqlgetconnection);
            return appDT18;
        }
        catch (Exception ex)
        {
            throw ex;
        }
        finally
        {
            sqlgetconnection.Close();
        }
    }

    public static DataTable Get_Product_ConfirmationProcedure(Int32 Lang_id, Int32 Job_No, Int32 Wave_No, Int32 Task_No, Int32 Store_id, Int32 Merch_no, Int32 visit_no, String Visit_Date, String Time_IN_date, String Time_Out_date, String Visit_time, String Manager_Title, String Manager_name, String txt_mileage, String txt_drive, String Data_Col_Method, String IVR_Start_Time, String user_id, String CUserId, String CIPAddr,String Str_Sv_Panel_id, SqlConnection sqlgetconnection)
    {
        try
        {
            DataTable appDT11 = new DataTable();
            appDT11 = DAL.USP_Product_Confirmation_Procedure(Lang_id,Job_No, Wave_No, Task_No, Store_id, Merch_no, visit_no, Visit_Date, Time_IN_date, Time_Out_date, Visit_time,Manager_Title, Manager_name, txt_mileage, txt_drive, Data_Col_Method, IVR_Start_Time, user_id,CUserId, CIPAddr,Str_Sv_Panel_id,  sqlgetconnection);
            return appDT11;
        }
        catch (Exception ex)
        {
            throw ex;
        }
        finally
        {
            sqlgetconnection.Close();
        }
    }

    public static DataTable Get_JWT_Store_SearchClass(Int32 Job_No, Int32 Wave_No, Int32 Task_No, String Store_name, String Store_add, String Store_city, String Store_state, String Store_zip, SqlConnection sqlgetconnection)
    {
        try
        {
            DataTable appDT12 = new DataTable();
            appDT12 = DAL.USP_JWT_Store_Search_Procedure(Job_No, Wave_No, Task_No, Store_name, Store_add, Store_city, Store_state, Store_zip, sqlgetconnection);
            return appDT12;
        }
        catch (Exception ex)
        {
            throw ex;
        }
        finally
        {
            sqlgetconnection.Close();
        }
    }
   

}
