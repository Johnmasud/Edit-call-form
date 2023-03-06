using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Web;
using SPAR.Tools.Utils;

/// <summary>
/// Summary description for DAL
/// Example 
/// public static DataTable dt_usp_mpdemo_ListOfAssignedJobs(SqlConnection sqlgetconnection)
///   {
///        using (SqlStoredProcedure sp = new SqlStoredProcedure("dbo.usp_mpdemo_ListOfAssignedJobs", sqlgetconnection))
///       {
///            return sp.ExecuteDataTable();
///        }
///   }    
/// </summary>
public class DAL
{
    //************ Function for CFJWTInputs.aspx page
    public static DataTable usp_CallForm_Merch_Info(Int32 iMerchNo, SqlConnection sqlconn)
    {
        //USP_CFJWT_MerchInfomation usp_CallForm_Merch_Info
        using (SqlStoredProcedure sp = new SqlStoredProcedure("dbo.USP_CFJWT_MerchInfomation", sqlconn))
        {
            sp.AddParameterWithValue("@Pmerch_no", SqlDbType.Int, 4, ParameterDirection.Input, iMerchNo);
            return sp.ExecuteDataTable();
        }
    }
    public static DataTable usp_MerchJWTMenu(Int32 Lang_id, Int32 iMerchNo, SqlConnection sqlconn)
    {
        //USP_CFJWT_MerchInfomation usp_CallForm_Merch_Info
        using (SqlStoredProcedure sp = new SqlStoredProcedure("dbo.USP_JWT_Open_Merch_Store_search", sqlconn))
        {
            sp.AddParameterWithValue("@PLang_id", SqlDbType.Int, 12, ParameterDirection.Input, Lang_id);
            sp.AddParameterWithValue("@Pmerch_no", SqlDbType.Int, 4, ParameterDirection.Input, iMerchNo);
            return sp.ExecuteDataTable();
        }
    }
    public static DataTable USP_JWT_MultiVisit_Validate(Int32 Lang_id, Int32 Merch_no, Int32 Job_No, Int32 Wave_No, Int32 Task_No, Int32 Chain_No, Int32 Store_No,String User_id, SqlConnection sqlconn)
    {
        using (SqlStoredProcedure sp18 = new SqlStoredProcedure("dbo.USP_JWT_MultiVisit_Validate_CallForm_Edit_update", sqlconn))
        {

            sp18.AddParameterWithValue("@PLang_id", SqlDbType.Int, 12, ParameterDirection.Input, Lang_id);
            sp18.AddParameterWithValue("@Pmerch_no", SqlDbType.Int, 12, ParameterDirection.Input, Merch_no);
            sp18.AddParameterWithValue("@PJob_No", SqlDbType.Int, 12, ParameterDirection.Input, Job_No);
            sp18.AddParameterWithValue("@PWave_No", SqlDbType.Int, 12, ParameterDirection.Input, Wave_No);
            sp18.AddParameterWithValue("@PTask_No", SqlDbType.Int, 12, ParameterDirection.Input, Task_No);
            sp18.AddParameterWithValue("@PChain_No", SqlDbType.Int, 12, ParameterDirection.Input, Chain_No);
            sp18.AddParameterWithValue("@PStore_No", SqlDbType.Int, 12, ParameterDirection.Input, Store_No);
            sp18.AddParameterWithValue("@PUser_id", SqlDbType.NVarChar, 100, ParameterDirection.Input, User_id);
            
            return sp18.ExecuteDataTable();
        }
    }
    public static DataSet USP_JWT_MultiVisit_Report_CallForm(Int32 Lang_id, Int32 Merch_no, Int32 Job_No, Int32 Wave_No, Int32 Task_No, Int32 Chain_No, Int32 Store_No, SqlConnection sqlconn)
    {
        using (SqlStoredProcedure sp19 = new SqlStoredProcedure("dbo.USP_JWT_MultiVisit_Report_CallForm_Edit_update", sqlconn))
        {

            sp19.AddParameterWithValue("@PLang_id", SqlDbType.Int, 12, ParameterDirection.Input, Lang_id);
            sp19.AddParameterWithValue("@Pmerch_no", SqlDbType.Int, 12, ParameterDirection.Input, Merch_no);
            sp19.AddParameterWithValue("@PJob_No", SqlDbType.Int, 12, ParameterDirection.Input, Job_No);
            sp19.AddParameterWithValue("@PWave_No", SqlDbType.Int, 12, ParameterDirection.Input, Wave_No);
            sp19.AddParameterWithValue("@PTask_No", SqlDbType.Int, 12, ParameterDirection.Input, Task_No);
            sp19.AddParameterWithValue("@PChain_No", SqlDbType.Int, 12, ParameterDirection.Input, Chain_No);
            sp19.AddParameterWithValue("@PStore_No", SqlDbType.Int, 12, ParameterDirection.Input, Store_No);

            return sp19.ExecuteDataSet();
        }
    }

    
    //************ Function for CFJWTValidateSV.aspx page 

    public static DataTable USP_CFJWTValidate_temp(Int32 Lang_id,Int32 Job_No, Int32 Wave_No, Int32 Task_No, Int32 Chain_No, Int32 Store_No, String PVisit_Date, Int32 Merch_no, Int32 POutOfStock_no,String User_id, SqlConnection sqlconn)
    {
        using (SqlStoredProcedure sp1 = new SqlStoredProcedure("dbo.USP_CFJWTValidate_CallForm_Edit", sqlconn))
        {

            sp1.AddParameterWithValue("@PLang_id", SqlDbType.Int, 12, ParameterDirection.Input, Lang_id);
            sp1.AddParameterWithValue("@PJob_No", SqlDbType.Int, 12, ParameterDirection.Input, Job_No);
            sp1.AddParameterWithValue("@PWave_No", SqlDbType.Int, 12, ParameterDirection.Input, Wave_No);
            sp1.AddParameterWithValue("@PTask_No", SqlDbType.Int, 12, ParameterDirection.Input, Task_No);
            sp1.AddParameterWithValue("@PChain_No", SqlDbType.Int, 12, ParameterDirection.Input, Chain_No);
            sp1.AddParameterWithValue("@PStore_No", SqlDbType.Int, 12, ParameterDirection.Input, Store_No);
            sp1.AddParameterWithStringValue("@PVisit_Date", SqlDbType.NVarChar, 50, ParameterDirection.Input, PVisit_Date, false);
            sp1.AddParameterWithValue("@Pmerch_no", SqlDbType.Int, 12, ParameterDirection.Input, Merch_no);
            sp1.AddParameterWithValue("@POutOfStock_no", SqlDbType.Int, 12, ParameterDirection.Input, POutOfStock_no);
            sp1.AddParameterWithValue("@PUser_id", SqlDbType.NVarChar, 100, ParameterDirection.Input, User_id);
            return sp1.ExecuteDataTable();
        }
    }
    public static DataTable CFMerchCellPhoneInsertProcedure(Int32 Merch_no, String Email_Add, String CellPhoneNo, Int32 CellProvider, Int32 Hidden_PhoneStatus, SqlConnection sqlconn)
    {
        using (SqlStoredProcedure sp4 = new SqlStoredProcedure("dbo.USP_CFJWT_Merchinsert", sqlconn))
        {
            sp4.AddParameterWithValue("@Pmerch_no", SqlDbType.Int, 12, ParameterDirection.Input, Merch_no);
            sp4.AddParameterWithValue("@PEmail_Addr", SqlDbType.NVarChar, 60, ParameterDirection.Input, Email_Add);
            sp4.AddParameterWithValue("@PCellphone_No", SqlDbType.NVarChar, 30, ParameterDirection.Input, CellPhoneNo);
            sp4.AddParameterWithValue("@Pmobile_carrier_id", SqlDbType.Int, 12, ParameterDirection.Input, CellProvider);
            sp4.AddParameterWithValue("@PhoneStatus", SqlDbType.Int, 12, ParameterDirection.Input, Hidden_PhoneStatus);
            return sp4.ExecuteDataTable();
           
        }
    }
    public static DataTable USP_CFJWT_Business_RulePhoto(Int32 Lang_id, Int32 Job_No, Int32 Wave_No, Int32 Task_No, Int32 store_id, Int32 Merch_no, SqlConnection sqlconn)
    {
        using (SqlStoredProcedure sp17 = new SqlStoredProcedure("dbo.USP_CFJWT_Business_Rule", sqlconn))
        {

            sp17.AddParameterWithValue("@PLang_id", SqlDbType.Int, 12, ParameterDirection.Input, Lang_id);
            sp17.AddParameterWithValue("@PJob_No", SqlDbType.Int, 12, ParameterDirection.Input, Job_No);
            sp17.AddParameterWithValue("@PWave_No", SqlDbType.Int, 12, ParameterDirection.Input, Wave_No);
            sp17.AddParameterWithValue("@PTask_No", SqlDbType.Int, 12, ParameterDirection.Input, Task_No);
            sp17.AddParameterWithValue("@PStore_id", SqlDbType.Int, 12, ParameterDirection.Input, store_id);
            sp17.AddParameterWithValue("@Pmerch_no", SqlDbType.Int, 12, ParameterDirection.Input, Merch_no);
            return sp17.ExecuteDataTable();
        }
    }
    
    //************ Function for CFJWTInputs.aspx page
     
    public static DataTable USP_CFStore_Manager_Title(SqlConnection sqlconn)
    {
        using (SqlStoredProcedure sp = new SqlStoredProcedure("dbo.USP_CFStore_Manager_Title", sqlconn))
        {
            return sp.ExecuteDataTable();
        }
    }
 
    

    public static DataTable USP_CFJWT_CellPhoneCarrier(SqlConnection sqlconn)
    {
        using (SqlStoredProcedure sp = new SqlStoredProcedure("dbo.USP_CFJWT_CellPhoneCarrier", sqlconn))
        {
            return sp.ExecuteDataTable();
        }
    }

    //************ Function for CFPictureGetFileOption.aspx page

    public static DataTable Get_CFJWTVisit_PhotoProcedure(Int32 Job_No, Int32 Wave_No, Int32 Task_No, Int32 Chain_No, Int32 Store_No, String Job_Visit_Date, Int32 merch_no, String Str_Sv_Panel_id, SqlConnection sqlconn)
    {
        using (SqlStoredProcedure sp11 = new SqlStoredProcedure("dbo.USP_CFJWTVisit_Photo_CallForm_MultiVisit_Update", sqlconn))
        {                                                           
            sp11.AddParameterWithValue("@PJob_No", SqlDbType.Int, 12, ParameterDirection.Input, Job_No);
            sp11.AddParameterWithValue("@PWave_No", SqlDbType.Int, 12, ParameterDirection.Input, Wave_No);
            sp11.AddParameterWithValue("@PTask_No", SqlDbType.Int, 12, ParameterDirection.Input, Task_No);
            sp11.AddParameterWithValue("@PChain_No", SqlDbType.Int, 12, ParameterDirection.Input, Chain_No);
            sp11.AddParameterWithValue("@PStore_No", SqlDbType.Int, 12, ParameterDirection.Input, Store_No);
            sp11.AddParameterWithStringValue("@PVisit_Date", SqlDbType.NVarChar, 50, ParameterDirection.Input, Job_Visit_Date, false);
            sp11.AddParameterWithValue("@Pmerch_no", SqlDbType.Int, 12, ParameterDirection.Input, merch_no);
            sp11.AddParameterWithValue("@Sv_Panel_id", SqlDbType.NVarChar, 100, ParameterDirection.Input, Str_Sv_Panel_id);
            return sp11.ExecuteDataTable();
        }
    }

    //************ Function for CFPictureFileConfirmation.aspx page

    public static DataTable CFPictureFileConfirmationinsert(Int32 Job_No, Int32 Wave_No, Int32 Task_No, Int32 Chain_No, Int32 Store_No, Int32 merch_no, Int32 Lang_Id, String Picture_Name, String Visit_Date, String Comments, String PhotoFileName, String PhotoFilePath, Int32 confirmation_no, Int32 mWidth, Int32 mHeight, String mSize, Int32 visit_no, String Job_Visit_Date, String Pre_Approved_Flag, String Photo_Q_No, String Photo_Prod_upc, String Old_Visit_Date, String Photo_q_Res_Val, String Photo_org_pic_id, String Str_Sv_Panel_id, SqlConnection sqlconn)
    {
        using (SqlStoredProcedure sp2 = new SqlStoredProcedure("dbo.USP_CallForm_Photo_insert_MultiVisit_edit_Update", sqlconn))
        {
            sp2.AddParameterWithValue("@PJob_No", SqlDbType.Int, 12, ParameterDirection.Input, Job_No);
            sp2.AddParameterWithValue("@PWave_No", SqlDbType.Int, 12, ParameterDirection.Input, Wave_No);
            sp2.AddParameterWithValue("@PTask_No", SqlDbType.Int, 12, ParameterDirection.Input, Task_No);
            sp2.AddParameterWithValue("@PChain_No", SqlDbType.Int, 12, ParameterDirection.Input, Chain_No);
            sp2.AddParameterWithValue("@PStore_No", SqlDbType.Int, 12, ParameterDirection.Input, Store_No);
            sp2.AddParameterWithValue("@Pmerch_no", SqlDbType.Int, 12, ParameterDirection.Input, merch_no);
            sp2.AddParameterWithValue("@PLang_Id", SqlDbType.Int, 12, ParameterDirection.Input, Lang_Id);
            sp2.AddParameterWithStringValue("@Picture_Name", SqlDbType.NVarChar, 200, ParameterDirection.Input, Picture_Name, false);
            sp2.AddParameterWithStringValue("@Visit_Date", SqlDbType.NVarChar, 50, ParameterDirection.Input, Visit_Date, false);
            sp2.AddParameterWithStringValue("@Comments", SqlDbType.NVarChar, 300, ParameterDirection.Input, Comments, false);
            sp2.AddParameterWithStringValue("@PhotoFileName", SqlDbType.NVarChar, 200, ParameterDirection.Input, PhotoFileName, false);
            sp2.AddParameterWithStringValue("@PhotoFilePath", SqlDbType.NVarChar, 300, ParameterDirection.Input, PhotoFilePath, false);
            sp2.AddParameterWithValue("@confirmation_no", SqlDbType.Int, 12, ParameterDirection.Input, confirmation_no);
            sp2.AddParameterWithValue("@PmWidth", SqlDbType.Int, 12, ParameterDirection.Input, mWidth);
            sp2.AddParameterWithValue("@PmHeight", SqlDbType.Int, 12, ParameterDirection.Input, mHeight);
            sp2.AddParameterWithValue("@PmFileSize", SqlDbType.NVarChar, 30, ParameterDirection.Input, mSize);
            sp2.AddParameterWithValue("@Pvisit_no", SqlDbType.Int, 12, ParameterDirection.Input, visit_no);
            sp2.AddParameterWithStringValue("@Job_Visit_Date", SqlDbType.NVarChar, 50, ParameterDirection.Input, Job_Visit_Date, false);
            sp2.AddParameterWithStringValue("@Pre_Approved_Flag", SqlDbType.NVarChar, 50, ParameterDirection.Input, Pre_Approved_Flag, false);
            sp2.AddParameterWithStringValue("@PPhoto_Q_No", SqlDbType.NVarChar, 4, ParameterDirection.Input, Photo_Q_No, false);
            sp2.AddParameterWithStringValue("@PPhoto_Prod_upc", SqlDbType.NVarChar, 60, ParameterDirection.Input, Photo_Prod_upc, false);
            sp2.AddParameterWithStringValue("@Old_Visit_Date", SqlDbType.NVarChar, 50, ParameterDirection.Input, Old_Visit_Date, false);
            sp2.AddParameterWithStringValue("@PResponse_Val", SqlDbType.NVarChar, 50, ParameterDirection.Input, Photo_q_Res_Val, false);
            sp2.AddParameterWithStringValue("@Photo_org_pic_id", SqlDbType.NVarChar, 300, ParameterDirection.Input, Photo_org_pic_id, false);
            sp2.AddParameterWithValue("@Sv_Panel_id", SqlDbType.NVarChar, 100, ParameterDirection.Input, Str_Sv_Panel_id);
            return sp2.ExecuteDataTable();
        }
    }
    //************ photo by questions 
    public static DataSet Get_USP_Photo_QuestionCheck_Procedure(Int32 Lang_id, Int32 Job_No, Int32 Wave_No, Int32 Task_No, Int32 Chain_No, Int32 Store_No, Int32 merch_no, String Job_Visit_Date,String Str_Sv_Panel_id, SqlConnection sqlconn)
    {
        using (SqlStoredProcedure sp16 = new SqlStoredProcedure("dbo.USP_CallForm_Photo_q_Access_MultiVisit_Edit_update", sqlconn))
        {
            sp16.AddParameterWithValue("@PLang_id", SqlDbType.Int, 12, ParameterDirection.Input, Lang_id);
            sp16.AddParameterWithValue("@PJob_No", SqlDbType.Int, 12, ParameterDirection.Input, Job_No);
            sp16.AddParameterWithValue("@PWave_No", SqlDbType.Int, 12, ParameterDirection.Input, Wave_No);
            sp16.AddParameterWithValue("@PTask_No", SqlDbType.Int, 12, ParameterDirection.Input, Task_No);
            sp16.AddParameterWithValue("@PChain_No", SqlDbType.Int, 12, ParameterDirection.Input, Chain_No);
            sp16.AddParameterWithValue("@PStore_No", SqlDbType.Int, 12, ParameterDirection.Input, Store_No);
            sp16.AddParameterWithValue("@Pmerch_no", SqlDbType.Int, 12, ParameterDirection.Input, merch_no);
            sp16.AddParameterWithStringValue("@Job_Visit_Date", SqlDbType.NVarChar, 50, ParameterDirection.Input, Job_Visit_Date, false);
            sp16.AddParameterWithValue("@Sv_Panel_id", SqlDbType.NVarChar, 100, ParameterDirection.Input, Str_Sv_Panel_id);
            return sp16.ExecuteDataSet();
        }
    }
    //************ photo by questions -popup
    public static DataTable Get_USP_CallForm_PhotoByQ_PopUPList_Procedure(Int32 Lang_id, Int32 Job_No, Int32 Wave_No, Int32 Task_No, Int32 Chain_No, Int32 Store_No, Int32 merch_no, String Job_Visit_Date, String Q_no,Int32 strQ_Res, String Photo_Prod_upc, SqlConnection sqlconn)
    {
        using (SqlStoredProcedure sp22 = new SqlStoredProcedure("dbo.USP_CF_PhotoByQ_DisplayList", sqlconn))
        {
            sp22.AddParameterWithValue("@PLang_id", SqlDbType.Int, 12, ParameterDirection.Input, Lang_id);
            sp22.AddParameterWithValue("@PJob_No", SqlDbType.Int, 12, ParameterDirection.Input, Job_No);
            sp22.AddParameterWithValue("@PWave_No", SqlDbType.Int, 12, ParameterDirection.Input, Wave_No);
            sp22.AddParameterWithValue("@PTask_No", SqlDbType.Int, 12, ParameterDirection.Input, Task_No);
            sp22.AddParameterWithValue("@PChain_No", SqlDbType.Int, 12, ParameterDirection.Input, Chain_No);
            sp22.AddParameterWithValue("@PStore_No", SqlDbType.Int, 12, ParameterDirection.Input, Store_No);
            sp22.AddParameterWithValue("@Pmerch_no", SqlDbType.Int, 12, ParameterDirection.Input, merch_no);
            sp22.AddParameterWithStringValue("@PVisit_Date", SqlDbType.NVarChar, 50, ParameterDirection.Input, Job_Visit_Date, false);
            sp22.AddParameterWithStringValue("@Q_no", SqlDbType.NVarChar, 50, ParameterDirection.Input, Q_no, false);
            sp22.AddParameterWithValue("@PRes_Val", SqlDbType.Int, 12, ParameterDirection.Input, strQ_Res);
            sp22.AddParameterWithStringValue("@Pseq_no", SqlDbType.NVarChar, 50, ParameterDirection.Input, Photo_Prod_upc, false);
            return sp22.ExecuteDataTable();
        }
    }
    public static DataTable Get_USP_CallForm_PhotoByQ_PopUP_ModifyData_Procedure(Int32 Lang_id, Int32 Job_No, Int32 Wave_No, Int32 Task_No, Int32 Chain_No, Int32 Store_No, Int32 merch_no, String Job_Visit_Date, String Q_no, Int32 strQ_Res, String Photo_Prod_upc,String NewPicture_Name,String Status_flag,String P_id,String Sel_AnsType,String Sel_Q_no, String Move_AnsType, String Move_Q_no, String Ans_val,  SqlConnection sqlconn)
    {
        using (SqlStoredProcedure sp24 = new SqlStoredProcedure("dbo.USP_CF_PhotoByQ_Edit_ModifyData", sqlconn))
        {
            sp24.AddParameterWithValue("@PLang_id", SqlDbType.Int, 12, ParameterDirection.Input, Lang_id);
            sp24.AddParameterWithValue("@PJob_No", SqlDbType.Int, 12, ParameterDirection.Input, Job_No);
            sp24.AddParameterWithValue("@PWave_No", SqlDbType.Int, 12, ParameterDirection.Input, Wave_No);
            sp24.AddParameterWithValue("@PTask_No", SqlDbType.Int, 12, ParameterDirection.Input, Task_No);
            sp24.AddParameterWithValue("@PChain_No", SqlDbType.Int, 12, ParameterDirection.Input, Chain_No);
            sp24.AddParameterWithValue("@PStore_No", SqlDbType.Int, 12, ParameterDirection.Input, Store_No);
            sp24.AddParameterWithValue("@Pmerch_no", SqlDbType.Int, 12, ParameterDirection.Input, merch_no);
            sp24.AddParameterWithStringValue("@PVisit_Date", SqlDbType.NVarChar, 50, ParameterDirection.Input, Job_Visit_Date, false);
            sp24.AddParameterWithStringValue("@Q_no", SqlDbType.NVarChar, 50, ParameterDirection.Input, Q_no, false);
            sp24.AddParameterWithValue("@PRes_Val", SqlDbType.Int, 12, ParameterDirection.Input, strQ_Res);
            sp24.AddParameterWithStringValue("@Prod_upc", SqlDbType.NVarChar, 50, ParameterDirection.Input, Photo_Prod_upc, false);
            sp24.AddParameterWithStringValue("@NewPicture_Name", SqlDbType.NVarChar, 500, ParameterDirection.Input, NewPicture_Name, false);
            sp24.AddParameterWithStringValue("@Status_flag", SqlDbType.NVarChar, 50, ParameterDirection.Input, Status_flag, false);
            sp24.AddParameterWithStringValue("@P_id", SqlDbType.NVarChar, 100, ParameterDirection.Input, P_id, false);
            sp24.AddParameterWithStringValue("@Sel_AnsType", SqlDbType.NVarChar, 10, ParameterDirection.Input, Sel_AnsType, false);
            sp24.AddParameterWithStringValue("@Sel_Q_no", SqlDbType.NVarChar, 10, ParameterDirection.Input, Sel_Q_no, false);
            sp24.AddParameterWithStringValue("@Move_AnsType", SqlDbType.NVarChar, 10, ParameterDirection.Input, Move_AnsType, false);
            sp24.AddParameterWithStringValue("@Move_Q_no", SqlDbType.NVarChar, 10, ParameterDirection.Input, Move_Q_no, false);
            sp24.AddParameterWithStringValue("@Ans_val", SqlDbType.NVarChar, 10, ParameterDirection.Input, Ans_val, false);

            return sp24.ExecuteDataTable();
        }
    }

    //************ photo by questions - display text info 
    public static DataTable Get_USP_CallForm_Photo_Question_Upc_text_Procedure(Int32 Lang_id, Int32 Job_No, Int32 Wave_No, Int32 Task_No, Int32 merch_no, String Photo_Q_No, String Photo_q_Res_Val, String Photo_Prod_upc, SqlConnection sqlconn)
    {
        using (SqlStoredProcedure sp23 = new SqlStoredProcedure("dbo.USP_CallForm_Photo_Question_Upc_text_info_Update", sqlconn))
        {
            sp23.AddParameterWithValue("@PLang_id", SqlDbType.Int, 12, ParameterDirection.Input, Lang_id);
            sp23.AddParameterWithValue("@PJob_No", SqlDbType.Int, 12, ParameterDirection.Input, Job_No);
            sp23.AddParameterWithValue("@PWave_No", SqlDbType.Int, 12, ParameterDirection.Input, Wave_No);
            sp23.AddParameterWithValue("@PTask_No", SqlDbType.Int, 12, ParameterDirection.Input, Task_No);
            sp23.AddParameterWithValue("@Pmerch_no", SqlDbType.Int, 12, ParameterDirection.Input, merch_no);
            sp23.AddParameterWithStringValue("@PQ_no", SqlDbType.NVarChar, 50, ParameterDirection.Input, Photo_Q_No, false);
            sp23.AddParameterWithStringValue("@PAns_val", SqlDbType.NVarChar, 50, ParameterDirection.Input, Photo_q_Res_Val, false);
            sp23.AddParameterWithStringValue("@Prod_UPC_no", SqlDbType.NVarChar, 50, ParameterDirection.Input, Photo_Prod_upc, false);
            return sp23.ExecuteDataTable();
        }
    }
    //************ Function for CFPictureFileConfirmation.aspx page

    public static DataTable Get_CFPhotoSentEmailProcedure(Int32 Job_No, Int32 Wave_No, Int32 Task_No, Int32 Chain_No, Int32 Store_No, Int32 merch_no,String Job_Visit_Date, SqlConnection sqlconn)
    {
        using (SqlStoredProcedure sp3 = new SqlStoredProcedure("dbo.USP_CallForm_Photo_EmailInfo_MultiVisit", sqlconn))
        {
            sp3.AddParameterWithValue("@PJob_No", SqlDbType.Int, 12, ParameterDirection.Input, Job_No);
            sp3.AddParameterWithValue("@PWave_No", SqlDbType.Int, 12, ParameterDirection.Input, Wave_No);
            sp3.AddParameterWithValue("@PTask_No", SqlDbType.Int, 12, ParameterDirection.Input, Task_No);
            sp3.AddParameterWithValue("@PChain_No", SqlDbType.Int, 12, ParameterDirection.Input, Chain_No);
            sp3.AddParameterWithValue("@PStore_No", SqlDbType.Int, 12, ParameterDirection.Input, Store_No);
            sp3.AddParameterWithValue("@Pmerch_no", SqlDbType.Int, 12, ParameterDirection.Input, merch_no);
            sp3.AddParameterWithStringValue("@PVisit_Date", SqlDbType.NVarChar, 50, ParameterDirection.Input, Job_Visit_Date, false);
            return sp3.ExecuteDataTable();
        }
    }
    //*********************************CFCallFormInputs 
    public static DataTable Get_USP_JWT_Call_FormProcedure(Int32 Job_No, Int32 Wave_No, Int32 Task_No, Int32 Store_id, String Prod_Specific, Int32 Work_Type_id, String SS_Callform, String Prod_UPC, SqlConnection sqlconn)
    {
        using (SqlStoredProcedure sp5 = new SqlStoredProcedure("dbo.USP_JWT_Call_Form", sqlconn))
        {
            sp5.AddParameterWithValue("@PJob_No", SqlDbType.Int, 12, ParameterDirection.Input, Job_No);
            sp5.AddParameterWithValue("@PWave_No", SqlDbType.Int, 12, ParameterDirection.Input, Wave_No);
            sp5.AddParameterWithValue("@PTask_No", SqlDbType.Int, 12, ParameterDirection.Input, Task_No);
            sp5.AddParameterWithValue("@PStore_id", SqlDbType.Int, 12, ParameterDirection.Input, Store_id);
            sp5.AddParameterWithValue("@PProd_Specific", SqlDbType.NVarChar, 10, ParameterDirection.Input, Prod_Specific);
            sp5.AddParameterWithValue("@PWork_Type_Id", SqlDbType.Int, 12, ParameterDirection.Input, Work_Type_id);
            sp5.AddParameterWithValue("@PSS_Callform", SqlDbType.NVarChar, 10, ParameterDirection.Input, SS_Callform);
            sp5.AddParameterWithValue("@PProd_UPC", SqlDbType.NVarChar, 20, ParameterDirection.Input, Prod_UPC);
            return sp5.ExecuteDataTable();
        }
    }

    public static DataTable Get_USP_Call_Form_RTS_IssuesProcedure(Int32 Job_No, Int32 Wave_No, Int32 Task_No, Int32 Store_id, SqlConnection sqlconn)
    {
        using (SqlStoredProcedure sp6 = new SqlStoredProcedure("dbo.USP_Call_Form_RTS_Issues", sqlconn))
        {
            sp6.AddParameterWithValue("@PJob_No", SqlDbType.Int, 12, ParameterDirection.Input, Job_No);
            sp6.AddParameterWithValue("@PWave_No", SqlDbType.Int, 12, ParameterDirection.Input, Wave_No);
            sp6.AddParameterWithValue("@PTask_No", SqlDbType.Int, 12, ParameterDirection.Input, Task_No);
            sp6.AddParameterWithValue("@PStore_id", SqlDbType.Int, 12, ParameterDirection.Input, Store_id);
            return sp6.ExecuteDataTable();
        }
    }
  
    public static DataTable Get_USP_CallForm_Reported_ResponsesProcedure(Int32 Lang_id, Int32 Job_No, Int32 Wave_No, Int32 Task_No, Int32 Store_id, Int32 Merch_no, String Visit_Date, SqlConnection sqlconn)
    {
        using (SqlStoredProcedure sp20 = new SqlStoredProcedure("dbo.usp_CF_Reported_Answers_Edit_Modify", sqlconn))
        {
            sp20.AddParameterWithValue("@PLang_id", SqlDbType.Int, 12, ParameterDirection.Input, Lang_id);
            sp20.AddParameterWithValue("@PJob_No", SqlDbType.Int, 12, ParameterDirection.Input, Job_No);
            sp20.AddParameterWithValue("@PWave_No", SqlDbType.Int, 12, ParameterDirection.Input, Wave_No);
            sp20.AddParameterWithValue("@PTask_No", SqlDbType.Int, 12, ParameterDirection.Input, Task_No);
            sp20.AddParameterWithValue("@Pstore_id", SqlDbType.Int, 12, ParameterDirection.Input, Store_id);
            sp20.AddParameterWithValue("@PMerch_no", SqlDbType.Int, 12, ParameterDirection.Input, Merch_no);
            sp20.AddParameterWithValue("@PVisit_Date", SqlDbType.NVarChar, 12, ParameterDirection.Input, Visit_Date);
            return sp20.ExecuteDataTable();
        }
    }
    public static DataTable JWT_VisitDate_CheckProcedure(Int32 Job_No, Int32 Wave_No, Int32 Task_No, Int32 Store_id, String Visit_Date, Int32 Merch_no, SqlConnection sqlconn)
    {
        using (SqlStoredProcedure sp10 = new SqlStoredProcedure("dbo.USP_JWT_VisitDate_Check_Edit", sqlconn))
        {
            sp10.AddParameterWithValue("@PJob_No", SqlDbType.Int, 12, ParameterDirection.Input, Job_No);
            sp10.AddParameterWithValue("@PWave_No", SqlDbType.Int, 12, ParameterDirection.Input, Wave_No);
            sp10.AddParameterWithValue("@PTask_No", SqlDbType.Int, 12, ParameterDirection.Input, Task_No);
            sp10.AddParameterWithValue("@Store_id", SqlDbType.Int, 12, ParameterDirection.Input, Store_id);
            sp10.AddParameterWithValue("@PVisit_Date", SqlDbType.NVarChar, 12, ParameterDirection.Input, Visit_Date);
            sp10.AddParameterWithValue("@PMerch_no", SqlDbType.Int, 12, ParameterDirection.Input, Merch_no);
            return sp10.ExecuteDataTable();
        }
    }

    public static DataTable USP_Start_time(SqlConnection sqlconn)
    {
        using (SqlStoredProcedure sp15 = new SqlStoredProcedure("dbo.USP_Start_time_CallForm", sqlconn))
        {
           
            return sp15.ExecuteDataTable();
        }
    }
    //**************** CFCallFormValidate.aspx   
    //************ inset data from product specific call form 

    public static DataTable USP_JWT_CallForm_TempData(Int32 Lang_id, Int32 Job_No, Int32 Wave_No, Int32 Task_No, Int32 Store_id, Int32 Merch_no, String Strdata1, String Strdata2, String Strdata3, String Strdata4, String Strdata5, String Strdata6, String Strdata7, String Strdata8, SqlConnection sqlconn)
    {
        using (SqlStoredProcedure sp13 = new SqlStoredProcedure("dbo.usp_Upload_CallForm_Temp_Data", sqlconn))
        {

            sp13.AddParameterWithValue("@lang_id", SqlDbType.Int, 12, ParameterDirection.Input, Lang_id);
            sp13.AddParameterWithValue("@Job_No", SqlDbType.Int, 12, ParameterDirection.Input, Job_No);
            sp13.AddParameterWithValue("@Wave_No", SqlDbType.Int, 12, ParameterDirection.Input, Wave_No);
            sp13.AddParameterWithValue("@Task_No", SqlDbType.Int, 12, ParameterDirection.Input, Task_No);
            sp13.AddParameterWithValue("@Store_id", SqlDbType.Int, 12, ParameterDirection.Input, Store_id);
            sp13.AddParameterWithValue("@Merch_no", SqlDbType.Int, 12, ParameterDirection.Input, Merch_no);
            sp13.AddParameterWithValue("@StrData1", SqlDbType.NVarChar, 4000, ParameterDirection.Input, Strdata1);
            sp13.AddParameterWithValue("@StrData2", SqlDbType.NVarChar, 4000, ParameterDirection.Input, Strdata2);
            sp13.AddParameterWithValue("@StrData3", SqlDbType.NVarChar, 4000, ParameterDirection.Input, Strdata3);
            sp13.AddParameterWithValue("@StrData4", SqlDbType.NVarChar, 4000, ParameterDirection.Input, Strdata4);
            sp13.AddParameterWithValue("@StrData5", SqlDbType.NVarChar, 4000, ParameterDirection.Input, Strdata5);
            sp13.AddParameterWithValue("@StrData6", SqlDbType.NVarChar, 4000, ParameterDirection.Input, Strdata6);
            sp13.AddParameterWithValue("@StrData7", SqlDbType.NVarChar, 4000, ParameterDirection.Input, Strdata7);
            sp13.AddParameterWithValue("@StrData8", SqlDbType.NVarChar, 4000, ParameterDirection.Input, Strdata8);

            return sp13.ExecuteDataTable();
        }
    }
                                   
    public static DataTable Get_USP_CallForm_TempDataInsert(Int32 Job_No, Int32 Wave_No, Int32 Task_No, Int32 Store_id, Int32 Merch_no, String Q_No, String Ans_type, String QuestionResponse, SqlConnection sqlconn)
    {
        using (SqlStoredProcedure sp7 = new SqlStoredProcedure("dbo.USP_CallForm_TempDataInsert", sqlconn))
        {
            
            sp7.AddParameterWithValue("@PJob_No", SqlDbType.Int, 12, ParameterDirection.Input, Job_No);
            sp7.AddParameterWithValue("@PWave_No", SqlDbType.Int, 12, ParameterDirection.Input, Wave_No);
            sp7.AddParameterWithValue("@PTask_No", SqlDbType.Int, 12, ParameterDirection.Input, Task_No);
            sp7.AddParameterWithValue("@PStore_id", SqlDbType.Int, 12, ParameterDirection.Input, Store_id);
            sp7.AddParameterWithValue("@PMerch_no", SqlDbType.Int, 12, ParameterDirection.Input, Merch_no);
            sp7.AddParameterWithValue("@PQ_No", SqlDbType.NVarChar, 5, ParameterDirection.Input, Q_No);
            sp7.AddParameterWithValue("@PAns_type", SqlDbType.NVarChar, 5, ParameterDirection.Input, Ans_type);
            sp7.AddParameterWithValue("@PQuestionResponse", SqlDbType.NVarChar, 600, ParameterDirection.Input, QuestionResponse);
            return sp7.ExecuteDataTable();
        }
    }

    public static DataTable USP_CallForm_DataDelete_Temp(Int32 Job_No, Int32 Wave_No, Int32 Task_No, Int32 Store_id, Int32 Merch_no, SqlConnection sqlconn)
    {
        using (SqlStoredProcedure sp8 = new SqlStoredProcedure("dbo.USP_CallForm_DataDelete_Temp", sqlconn))
        {
            sp8.AddParameterWithValue("@PJob_No", SqlDbType.Int, 12, ParameterDirection.Input, Job_No);
            sp8.AddParameterWithValue("@PWave_No", SqlDbType.Int, 12, ParameterDirection.Input, Wave_No);
            sp8.AddParameterWithValue("@PTask_No", SqlDbType.Int, 12, ParameterDirection.Input, Task_No);
            sp8.AddParameterWithValue("@PStore_id", SqlDbType.Int, 12, ParameterDirection.Input, Store_id);
            sp8.AddParameterWithValue("@PMerch_no", SqlDbType.Int, 12, ParameterDirection.Input, Merch_no);
            return sp8.ExecuteDataTable();
        }
    }
    //********************* Confirmation page

    public static DataTable USP_Call_Form_Confirmation_Procedure(Int32 Job_No, Int32 Wave_No, Int32 Task_No, Int32 Store_id, Int32 Merch_no, Int32 visit_no, String Visit_Date, String Time_IN_date, String Time_Out_date, String Visit_time, String HH_Status_Flag, Int32 rad_q_HH_Used, String txt_mileage, String txt_drive, String Data_Col_Method, String overwritetime, Int32 Work_Type_Id, String SS_Callform, String IVR_Start_Time, String Manager_Title, String Manager_name, Int32 Call_Form_Type_No, String StrArray, String user_id, String CUserId, String CIPAddr, String Str_Sv_Panel_id, SqlConnection sqlconn)
    {
        using (SqlStoredProcedure sp9 = new SqlStoredProcedure("dbo.USP_Call_Form_Regular_Confirmation_Edit_update", sqlconn))
        {
            sp9.AddParameterWithValue("@PJob_No", SqlDbType.Int, 12, ParameterDirection.Input, Job_No);
            sp9.AddParameterWithValue("@PWave_No", SqlDbType.Int, 12, ParameterDirection.Input, Wave_No);
            sp9.AddParameterWithValue("@PTask_No", SqlDbType.Int, 12, ParameterDirection.Input, Task_No);
            sp9.AddParameterWithValue("@PStore_id", SqlDbType.Int, 12, ParameterDirection.Input, Store_id);
            sp9.AddParameterWithValue("@PMerch_no", SqlDbType.Int, 12, ParameterDirection.Input, Merch_no);
            sp9.AddParameterWithValue("@Pvisit_no", SqlDbType.Int, 12, ParameterDirection.Input, visit_no);
            sp9.AddParameterWithValue("@PVisit_Date", SqlDbType.VarChar, 25, ParameterDirection.Input, Visit_Date);
            sp9.AddParameterWithValue("@PTime_IN_date", SqlDbType.VarChar, 25, ParameterDirection.Input, Time_IN_date);
            sp9.AddParameterWithValue("@PTime_Out_date", SqlDbType.VarChar, 25, ParameterDirection.Input, Time_Out_date);
            sp9.AddParameterWithValue("@PVisit_time", SqlDbType.NVarChar, 12, ParameterDirection.Input, Visit_time);
            sp9.AddParameterWithValue("@PHH_Status_Flag", SqlDbType.NVarChar, 3, ParameterDirection.Input, HH_Status_Flag);
            sp9.AddParameterWithValue("@Prad_q_HH_Used", SqlDbType.Int, 12, ParameterDirection.Input, rad_q_HH_Used);
            sp9.AddParameterWithValue("@Ptxt_mileage", SqlDbType.NVarChar, 12, ParameterDirection.Input, txt_mileage);
            sp9.AddParameterWithValue("@Ptxt_drive", SqlDbType.NVarChar, 12, ParameterDirection.Input, txt_drive);

            sp9.AddParameterWithValue("@PData_Col_Method", SqlDbType.NVarChar, 5, ParameterDirection.Input, Data_Col_Method);
            sp9.AddParameterWithValue("@Poverwritetime", SqlDbType.NVarChar, 5, ParameterDirection.Input, overwritetime);
            sp9.AddParameterWithValue("@PWork_Type_Id", SqlDbType.Int, 12, ParameterDirection.Input, Work_Type_Id);
            sp9.AddParameterWithValue("@PSS_Callform", SqlDbType.NVarChar, 5, ParameterDirection.Input, SS_Callform);
            sp9.AddParameterWithValue("@PIVR_Start_Time", SqlDbType.VarChar, 25, ParameterDirection.Input, IVR_Start_Time);
            sp9.AddParameterWithValue("@PManager_Title", SqlDbType.NVarChar, 30, ParameterDirection.Input, Manager_Title);
            sp9.AddParameterWithValue("@PManager_name", SqlDbType.NVarChar, 50, ParameterDirection.Input, Manager_name);
            sp9.AddParameterWithValue("@Call_Form_Type_No", SqlDbType.Int, 12, ParameterDirection.Input, Call_Form_Type_No);
            sp9.AddParameterWithValue("@PStrArray", SqlDbType.NVarChar, 200, ParameterDirection.Input, StrArray);
            sp9.AddParameterWithValue("@PUser_id", SqlDbType.NVarChar, 200, ParameterDirection.Input, user_id);
            sp9.AddParameterWithValue("@PCUserId", SqlDbType.NVarChar, 300, ParameterDirection.Input, CUserId);
            sp9.AddParameterWithValue("@PCIPAddr", SqlDbType.NVarChar, 100, ParameterDirection.Input, CIPAddr);
            sp9.AddParameterWithValue("@Sv_Panel_id", SqlDbType.NVarChar, 100, ParameterDirection.Input, Str_Sv_Panel_id);

            return sp9.ExecuteDataTable();
        }
    }
    //********************* call header Edit Confirmation page

    public static DataTable USP_CallHeader_ConfirmationProcedure(Int32 Job_No, Int32 Wave_No, Int32 Task_No, Int32 Store_id, Int32 Merch_no, Int32 visit_no, String source_visit_dt, String source_Time_IN_date, String source_Time_Out_date, String Org_txt_mileage, String Org_txt_drive, String Visit_Date, String Time_IN_date, String Time_Out_date, String Str_txt_mileage, String Str_txt_drive, String user_id, String Str_Sv_Panel_id, SqlConnection sqlconn)
    {
        using (SqlStoredProcedure sp9 = new SqlStoredProcedure("dbo.USP_Call_Form_Regular_Confirmation_Edit_Tempdata", sqlconn))
        {
            sp9.AddParameterWithValue("@PJob_No", SqlDbType.Int, 12, ParameterDirection.Input, Job_No);
            sp9.AddParameterWithValue("@PWave_No", SqlDbType.Int, 12, ParameterDirection.Input, Wave_No);
            sp9.AddParameterWithValue("@PTask_No", SqlDbType.Int, 12, ParameterDirection.Input, Task_No);
            sp9.AddParameterWithValue("@PStore_id", SqlDbType.Int, 12, ParameterDirection.Input, Store_id);
            sp9.AddParameterWithValue("@PMerch_no", SqlDbType.Int, 12, ParameterDirection.Input, Merch_no);
            sp9.AddParameterWithValue("@Pvisit_no", SqlDbType.Int, 12, ParameterDirection.Input, visit_no);
            sp9.AddParameterWithValue("@Psource_visit_dt", SqlDbType.VarChar, 25, ParameterDirection.Input, source_visit_dt);
            sp9.AddParameterWithValue("@Psource_time_in", SqlDbType.VarChar, 25, ParameterDirection.Input, source_Time_IN_date);
            sp9.AddParameterWithValue("@Psource_time_out", SqlDbType.VarChar, 25, ParameterDirection.Input, source_Time_Out_date);
            sp9.AddParameterWithValue("@Psource_visit_miles", SqlDbType.NVarChar, 12, ParameterDirection.Input, Org_txt_mileage);
            sp9.AddParameterWithValue("@Psource_drive_time", SqlDbType.NVarChar, 12, ParameterDirection.Input, Org_txt_drive);
            sp9.AddParameterWithValue("@Ptarget_visit_dt", SqlDbType.VarChar, 25, ParameterDirection.Input, Visit_Date);
            sp9.AddParameterWithValue("@Ptarget_time_in", SqlDbType.VarChar, 25, ParameterDirection.Input, Time_IN_date);
            sp9.AddParameterWithValue("@Ptarget_time_out", SqlDbType.VarChar, 25, ParameterDirection.Input, Time_Out_date);
            sp9.AddParameterWithValue("@Ptarget_visit_miles", SqlDbType.NVarChar, 12, ParameterDirection.Input, Str_txt_mileage);
            sp9.AddParameterWithValue("@Ptarget_drive_time", SqlDbType.NVarChar, 12, ParameterDirection.Input, Str_txt_drive);
            sp9.AddParameterWithValue("@Pmodify_usrid", SqlDbType.NVarChar, 200, ParameterDirection.Input, user_id); 
            sp9.AddParameterWithValue("@Sv_Panel_id", SqlDbType.NVarChar, 100, ParameterDirection.Input, Str_Sv_Panel_id);

            return sp9.ExecuteDataTable();
        }
    }

     //********************* Confirmation page

    public static DataTable USP_Get_UPC_List_New_Procedure(Int32 Job_No, Int32 Wave_No, Int32 Task_No, Int32 Store_id, SqlConnection sqlconn)
    {
        using (SqlStoredProcedure sp10 = new SqlStoredProcedure("dbo.USP_Get_Product_List_Edit", sqlconn))
        {
            sp10.AddParameterWithValue("@PJob_No", SqlDbType.Int, 12, ParameterDirection.Input, Job_No);
            sp10.AddParameterWithValue("@PWave_No", SqlDbType.Int, 12, ParameterDirection.Input, Wave_No);
            sp10.AddParameterWithValue("@PTask_No", SqlDbType.Int, 12, ParameterDirection.Input, Task_No);
            sp10.AddParameterWithValue("@PStore_id", SqlDbType.Int, 12, ParameterDirection.Input, Store_id);
            return sp10.ExecuteDataTable();
        }
    }
    public static DataTable usp_Get_UPC_Questions_Proceudre(Int32 Job_No, Int32 Wave_No, Int32 Task_No, Int32 Store_id, SqlConnection sqlconn)
    {
        using (SqlStoredProcedure sp11 = new SqlStoredProcedure("dbo.usp_Get_Product_Questions_new", sqlconn))
        {
            sp11.AddParameterWithValue("@PJob_No", SqlDbType.Int, 12, ParameterDirection.Input, Job_No);
            sp11.AddParameterWithValue("@PWave_No", SqlDbType.Int, 12, ParameterDirection.Input, Wave_No);
            sp11.AddParameterWithValue("@PTask_No", SqlDbType.Int, 12, ParameterDirection.Input, Task_No);
            sp11.AddParameterWithValue("@PStore_id", SqlDbType.Int, 12, ParameterDirection.Input, Store_id);
            return sp11.ExecuteDataTable();
        }
    }
    public static DataTable JWTQuestionResponse_Proceudre(Int32 Job_No, Int32 Wave_No, Int32 Task_No, SqlConnection sqlconn)
    {
        using (SqlStoredProcedure sp12 = new SqlStoredProcedure("dbo.USP_Get_JWTQuestionResponse", sqlconn))
        {
            sp12.AddParameterWithValue("@PJob_No", SqlDbType.Int, 12, ParameterDirection.Input, Job_No);
            sp12.AddParameterWithValue("@PWave_No", SqlDbType.Int, 12, ParameterDirection.Input, Wave_No);
            sp12.AddParameterWithValue("@PTask_No", SqlDbType.Int, 12, ParameterDirection.Input, Task_No);
            return sp12.ExecuteDataTable();
        }
    }
    
        
    //************ inset data from product specific call form 

    public static DataTable USP_JWT_Product_TempData(Int32 Lang_id, Int32 Job_No, Int32 Wave_No, Int32 Task_No, Int32 Store_id, Int32 Merch_no, String Strdata1, String Strdata2, String Strdata3, String Strdata4, String Strdata5, String Strdata6, String Strdata7, String Strdata8, SqlConnection sqlconn)
    {
        using (SqlStoredProcedure sp13 = new SqlStoredProcedure("dbo.usp_Upload_Grid_Temp_Data_Edit_Update", sqlconn))
        {

            sp13.AddParameterWithValue("@lang_id", SqlDbType.Int, 12, ParameterDirection.Input, Lang_id);
            sp13.AddParameterWithValue("@Job_No", SqlDbType.Int, 12, ParameterDirection.Input, Job_No);
            sp13.AddParameterWithValue("@Wave_No", SqlDbType.Int, 12, ParameterDirection.Input, Wave_No);
            sp13.AddParameterWithValue("@Task_No", SqlDbType.Int, 12, ParameterDirection.Input, Task_No);
            sp13.AddParameterWithValue("@Store_id", SqlDbType.Int, 12, ParameterDirection.Input, Store_id);
            sp13.AddParameterWithValue("@Merch_no", SqlDbType.Int, 12, ParameterDirection.Input, Merch_no);
            sp13.AddParameterWithValue("@StrData1", SqlDbType.NVarChar, 0, ParameterDirection.Input, Strdata1);
            sp13.AddParameterWithValue("@StrData2", SqlDbType.NVarChar, 0, ParameterDirection.Input, Strdata2);
            sp13.AddParameterWithValue("@StrData3", SqlDbType.NVarChar, 0, ParameterDirection.Input, Strdata3);
            sp13.AddParameterWithValue("@StrData4", SqlDbType.NVarChar, 0, ParameterDirection.Input, Strdata4);
            sp13.AddParameterWithValue("@StrData5", SqlDbType.NVarChar, 0, ParameterDirection.Input, Strdata5);
            sp13.AddParameterWithValue("@StrData6", SqlDbType.NVarChar, 0, ParameterDirection.Input, Strdata6);
            sp13.AddParameterWithValue("@StrData7", SqlDbType.NVarChar, 0, ParameterDirection.Input, Strdata7);
            sp13.AddParameterWithValue("@StrData8", SqlDbType.NVarChar, 0, ParameterDirection.Input, Strdata8);
            
            return sp13.ExecuteDataTable();
        }
    }
    //************ reported data from product specific call form 

    public static DataTable Get_Grid_Reported_AnswersProcedure(Int32 Job_No, Int32 Wave_No, Int32 Task_No, Int32 Store_id, Int32 Merch_no, SqlConnection sqlconn)
    {
        using (SqlStoredProcedure sp14 = new SqlStoredProcedure("dbo.usp_Grid_Reported_Answers_modify", sqlconn))
        {
            sp14.AddParameterWithValue("@PJob_no", SqlDbType.Int, 12, ParameterDirection.Input, Job_No);
            sp14.AddParameterWithValue("@PWave_no", SqlDbType.Int, 12, ParameterDirection.Input, Wave_No);
            sp14.AddParameterWithValue("@PTask_no", SqlDbType.Int, 12, ParameterDirection.Input, Task_No);
            sp14.AddParameterWithValue("@Pstore_id", SqlDbType.Int, 12, ParameterDirection.Input, Store_id);
            sp14.AddParameterWithValue("@PMerch_no", SqlDbType.Int, 12, ParameterDirection.Input, Merch_no);
            return sp14.ExecuteDataTable();
        }
    }


    public static DataTable usp_CF_Product_Reported_AnswersProcedure(Int32 Lang_id, Int32 Job_No, Int32 Wave_No, Int32 Task_No, Int32 Store_id, Int32 Merch_no, String Visit_Date, SqlConnection sqlconn)
    {
        using (SqlStoredProcedure sp21 = new SqlStoredProcedure("dbo.usp_CF_Product_Reported_Answers_Edit_Modify_update", sqlconn))
        {
            sp21.AddParameterWithValue("@PLang_id", SqlDbType.Int, 12, ParameterDirection.Input, Lang_id);
            sp21.AddParameterWithValue("@PJob_No", SqlDbType.Int, 12, ParameterDirection.Input, Job_No);
            sp21.AddParameterWithValue("@PWave_No", SqlDbType.Int, 12, ParameterDirection.Input, Wave_No);
            sp21.AddParameterWithValue("@PTask_No", SqlDbType.Int, 12, ParameterDirection.Input, Task_No);
            sp21.AddParameterWithValue("@Pstore_id", SqlDbType.Int, 12, ParameterDirection.Input, Store_id);
            sp21.AddParameterWithValue("@PMerch_no", SqlDbType.Int, 12, ParameterDirection.Input, Merch_no);
            sp21.AddParameterWithValue("@PVisit_Date", SqlDbType.NVarChar, 12, ParameterDirection.Input, Visit_Date);
            return sp21.ExecuteDataTable();
        }
    }

    public static DataTable USP_Product_Confirmation_Procedure(Int32 Lang_id, Int32 Job_No, Int32 Wave_No, Int32 Task_No, Int32 Store_id, Int32 Merch_no, Int32 visit_no, String Visit_Date, String Time_IN_date, String Time_Out_date, String Visit_time, String Manager_Title, String Manager_name, String txt_mileage, String txt_drive, String Data_Col_Method, String IVR_Start_Time, String user_id,String CUserId,String CIPAddr,String Str_Sv_Panel_id, SqlConnection sqlconn)
    {
        using (SqlStoredProcedure sp15 = new SqlStoredProcedure("dbo.USP_Call_Form_Product_Specific_Confirmation_Edit_update", sqlconn))
        {
            sp15.AddParameterWithValue("@PLang_id", SqlDbType.Int, 12, ParameterDirection.Input, Lang_id);
            sp15.AddParameterWithValue("@PJob_No", SqlDbType.Int, 12, ParameterDirection.Input, Job_No);
            sp15.AddParameterWithValue("@PWave_No", SqlDbType.Int, 12, ParameterDirection.Input, Wave_No);
            sp15.AddParameterWithValue("@PTask_No", SqlDbType.Int, 12, ParameterDirection.Input, Task_No);
            sp15.AddParameterWithValue("@PStore_id", SqlDbType.Int, 12, ParameterDirection.Input, Store_id);
            sp15.AddParameterWithValue("@PMerch_no", SqlDbType.Int, 12, ParameterDirection.Input, Merch_no);
            sp15.AddParameterWithValue("@Pvisit_no", SqlDbType.Int, 12, ParameterDirection.Input, visit_no);
            sp15.AddParameterWithValue("@PTime_IN_date", SqlDbType.VarChar, 25, ParameterDirection.Input, Time_IN_date);
            sp15.AddParameterWithValue("@PTime_Out_date", SqlDbType.VarChar, 25, ParameterDirection.Input, Time_Out_date);
            sp15.AddParameterWithValue("@PVisit_time", SqlDbType.NVarChar, 12, ParameterDirection.Input, Visit_time);
            sp15.AddParameterWithValue("@PMgmr_title", SqlDbType.NVarChar, 60, ParameterDirection.Input, Manager_Title);
            sp15.AddParameterWithValue("@PMgmr_name", SqlDbType.NVarChar, 60, ParameterDirection.Input, Manager_name);
            sp15.AddParameterWithValue("@Ptxt_mileage", SqlDbType.NVarChar, 12, ParameterDirection.Input, txt_mileage);
            sp15.AddParameterWithValue("@Ptxt_drive", SqlDbType.NVarChar, 12, ParameterDirection.Input, txt_drive);
            sp15.AddParameterWithValue("@PData_Col_Method", SqlDbType.NVarChar, 5, ParameterDirection.Input, Data_Col_Method);
            sp15.AddParameterWithValue("@PVisit_Date", SqlDbType.VarChar, 25, ParameterDirection.Input, Visit_Date);
            sp15.AddParameterWithValue("@PIVR_Start_Time", SqlDbType.VarChar, 25, ParameterDirection.Input, IVR_Start_Time);
            sp15.AddParameterWithValue("@PModify_Usrid", SqlDbType.NVarChar, 200, ParameterDirection.Input, user_id);
            sp15.AddParameterWithValue("@PCUserId", SqlDbType.NVarChar, 300, ParameterDirection.Input, CUserId);
            sp15.AddParameterWithValue("@PCIPAddr", SqlDbType.NVarChar, 100, ParameterDirection.Input, CIPAddr);
            sp15.AddParameterWithValue("@Sv_Panel_id", SqlDbType.NVarChar, 100, ParameterDirection.Input, Str_Sv_Panel_id);
            return sp15.ExecuteDataTable();
        }
    }
    public static DataTable USP_JWT_Store_Search_Procedure(Int32 Job_No, Int32 Wave_No, Int32 Task_No, String Store_name, String Store_add, String Store_city, String Store_state, String Store_zip, SqlConnection sqlconn)
    {
        using (SqlStoredProcedure sp16 = new SqlStoredProcedure("dbo.USP_JWT_Store_Search", sqlconn))
        {
            sp16.AddParameterWithValue("@PJob_no", SqlDbType.Int, 12, ParameterDirection.Input, Job_No);
            sp16.AddParameterWithValue("@PWave_no", SqlDbType.Int, 12, ParameterDirection.Input, Wave_No);
            sp16.AddParameterWithValue("@PTask_no", SqlDbType.Int, 12, ParameterDirection.Input, Task_No);
            sp16.AddParameterWithValue("@Pstore_name", SqlDbType.NVarChar, 100, ParameterDirection.Input, Store_name);
            sp16.AddParameterWithValue("@Pstore_add", SqlDbType.NVarChar, 100, ParameterDirection.Input, Store_add);
            sp16.AddParameterWithValue("@Pstore_city", SqlDbType.NVarChar, 100, ParameterDirection.Input, Store_city);
            sp16.AddParameterWithValue("@Pstore_state", SqlDbType.NVarChar, 100, ParameterDirection.Input, Store_state);
            sp16.AddParameterWithValue("@Pstore_zip", SqlDbType.NVarChar, 100, ParameterDirection.Input, Store_zip);
 
            return sp16.ExecuteDataTable();
        }
    }

      
}
