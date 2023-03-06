using System;
using System.Data;
using System.Configuration;
using System.Collections;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Web.UI.HtmlControls;
using SPAR.Tools.Security;
using SPAR.Tools.MasterControls;
using SPAR.Tools.Utils;
using System.Text;

public partial class CFMerchReportWork : System.Web.UI.Page
{

    protected string Job_No, Wave_No, Task_No, Task_Desc, Task_Addtl_Desc, store_id, AddressRule, NameRule, DateRule, Date_input, VarDay, Varmonth, StrYear;
    protected string Chain_No, Store_Chain_Desc, Store_No, Store_Store_Name, Store_Street_Addr, Store_City, Store_State, Store_Zip;
    protected string CA_merch_no, Str_Merch_no, Merch_First_Name, Merch_Last_Name, Merch_Street_Addr, Merch_Street_Addr2, Merch_City, Merch_State, Merch_Zip, Merch_Phone_No, Merch_Email_Addr;
    protected string Field_Start_Dt, Field_end_Dt, Key_Comp_Dt, DOA_Dt, TodayDate, visit_no, PagePath, StrOriginalFile;
    protected string Collect_iVR_Time, night_visits, Mileage_flag, Travel_flag, RotateFileSave, Rotate, Str_Manager_Title, Str_txt_Manager_name;
    protected string Job_Type, Business_Type_id, Work_Type_id, Work_Type_Desc, StrImgUrl, StrFileSave, StrRotateFileSave;
    protected string Data_Col_Method, overwritetime, All_Data_Received, collect_time_only, Ask_Q_HH_Used, HH_Status_Flag;
    protected string Collect_Header, Collect_Call_Form, SS_Callform, Prod_Specific, qdef_skippattern, Max_Mx_Per_Store, Max_Visit_Per_Store_Mx;
    protected string Collect_Store_Mgr_Name, Product_Check_Flag, Ask_EShelf_Question, Call_Form_Type_No, Est_instore_minutes, Business_Rule_Eckerd, Eckerd_Job_Last_question;
    protected string user_id, PhotoButton, Bus_Rule5_Question, Bus_Rule6_Question, Bus_Rule28_Question, Bus_Rule3_Question, Bus_Rule4_Question, Bus_Rule7_Question;
    public string[] vPrompts;
    protected string Str_VisitMonth, Str_visitday, Str_visityear, Str_timein_hrs, Str_timein_min, Str_cmb_timein, Str_timeout_hrs, Str_timeout_min, Str_cmb_timeout;
    protected string Str_txt_mileage, Str_txt_drive, Str_rad_q_Past_Midnight, Str_rad_q_HH_Used, Str_rad_q_Ret_store_visit, StrServerName;
    protected string Str_Radio_EShelf, Str_Ask_EShelf_Question, Str_Bus_Rule3_Question, Str_rad_q_BR3, Str_Bus_Rule4_Question, Str_rad_q_BR4, Str_Bus_Rule5_Question;
    protected string Str_rad_q_BR5, Str_Bus_Rule6_Question, Str_rad_q_BR6, Str_Bus_Rule7_Question, Str_rad_q_BR7, Str_Bus_Rule28_Question, Str_rad_q_BR28, Hid_JavaFiles, StrRotateFileCount, StrFilenames;
    protected int Back_Slash, Dot, Dash, ShowType, Lang_id;
    public DateTime StrDate;
    private string Str_Request_Method;

    #region SPARUTILS
    //code block for masterpage app, dont remove
    SPARValues WebAppClass;
    PromptTranslation ptAppTranslation;

    protected void Page_PreInit()
    {

        Str_Request_Method = Request.ServerVariables.Get("REQUEST_METHOD").ToString();
        //Response.Write("Str_Request_Method=" + Str_Request_Method + "<BR>");

        if (Str_Request_Method == "GET")
        {
            Response.Redirect("http://mi21.sparinc.com/callformdotnet/CFLoginErrorMessage.aspx");
        }
        SPARHeader PageHeader;
        SPARFooter PageFooter;
        SPARBiLingualBar BiLingualBar;
        PageHeader = (SPARHeader)this.Master.FindControl("SPARHeader1");
        PageFooter = (SPARFooter)this.Master.FindControl("SPARFooter1");
        BiLingualBar = (SPARBiLingualBar)this.Master.FindControl("SPARBiLingualBar1");
        WebAppClass = new SPARValues();
        WebAppClass.PageTitle = "";

        ptAppTranslation = new PromptTranslation("CFPictureGetMultiFile.aspx", WebAppClass.PromptsLanguageId.ToString(), WebAppClass.LanguageId, WebAppClass.CurrentSQLDBConnection, WebAppClass.MultiLanguageCount);
        AppMasterControls ap1 = new AppMasterControls(PageHeader, PageFooter, BiLingualBar, WebAppClass.LoggedUserName, WebAppClass.CurrentDBDateTime, WebAppClass.LanguageId, WebAppClass.PromptsLanguageId, WebAppClass.MultiLanguageCount, WebAppClass.PageTitle, WebAppClass.CurrentSQLDBConnection, this.Page, WebAppClass.SPARLogoFileURL);
        if (WebAppClass.MerchNo > 0)
        {
            PageFooter.ShowSPARToolsURL = false;
            PageFooter.ShowMainPageUrl = false;
        }
    }
    protected void Page_PreRender(object sender, EventArgs e)
    {
        ptAppTranslation.DoPagePromptTranslation(this.Page);
    }

    #endregion

    protected void Page_Load(object sender, EventArgs e)
    {
                                        WebAppClass.Set_MerchforForm(this.Merch_no, Convert.ToString(WebAppClass.MerchNo));
                                        Lang_id = WebAppClass.LanguageId;
                                        StrServerName = ConfigurationManager.AppSettings["ServerName"];

                                        //Response.Write("StrServerName=" + StrServerName);
                                        //****** Prompts
                                        GetPromptTranslation();

                                        //****** System Rules
                                        DataTable RuleTab = new DataTable();
                                        RuleTab = GetSystemRules();

                                        AddressRule = RuleTab.Rows[5][2].ToString();
                                         Response.Write("AddressRule=" + AddressRule);

                                        DateRule = RuleTab.Rows[1][2].ToString();
                                        // Response.Write("DateRule=" + DateRule);

                                        NameRule = RuleTab.Rows[0][2].ToString();
                                        // Response.Write("NameRule=" + NameRule);


                                        //******************************* Date format

                                        Back_Slash = DateRule.IndexOf("/");
                                        //response.write "Back_Slash=" & Back_Slash & "<BR>" 
                                        if (Back_Slash > 0)
                                        {
                                            Date_input = "/";
                                        }
                                        Dot = DateRule.IndexOf(".");
                                        //response.write "Dot=" & Dot & "<BR>" 
                                        if (Dot > 0)
                                        {
                                            Date_input = ".";
                                        }
                                        Dash = DateRule.IndexOf("-");
                                        //response.write "Dot=" & Dot & "<BR>" 
                                        if (Dash > 0)
                                        {
                                            Date_input = "-";
                                        }
                                        //Response.Write("Date_input=" + Date_input + "<BR>");
                                        //****** Today's date 

    }
    #region Procedures
    private DataTable Get_CallFormOpenJWT(String Str_Merch_no)
    {
        Int32 iTempMerchNo = 0;
        Int32 iTempJob_No = 0;
        Int32 iTempWave_No = 0;
        Int32 iTempTask_No = 0;
        Int32 iTempStore_id = 0;


        iTempMerchNo = AppUtils.ConvertToInteger32(Str_Merch_no, 0);

        return AppData.Get_CallFormDataDeleteTemp(iTempJob_No, iTempWave_No, iTempTask_No, iTempStore_id, iTempMerchNo, WebAppClass.CurrentSQLDBConnection);
    }
   
    #endregion
    #region SystemPromptandRule
    private void GetPromptTranslation()
    {
        vPrompts = new string[9];
        vPrompts[0] = "Please enter a valid visit date";
        vPrompts[1] = "The Visit date entered is invalid for this Job,Wave and Task.";
        vPrompts[2] = "The Visit date greater than Today`s date";
        vPrompts[3] = "You can not enter more than 255 charaters in the Comment box.";
        vPrompts[4] = "Please enter a Picture path to upload.";
        vPrompts[5] = "Please select File(s)";
        vPrompts[6] = "Selected file(s) can not be upload it to the system. Please check the file(s) and try again.";
        vPrompts[7] = "Selected File size can not be zero.";
        vPrompts[8] = "The number of selected files exceeds the limit 10.";

        ptAppTranslation.DoArrayPromptTranslation(vPrompts);
    }
    private DataTable GetSystemRules()
    {
        DataTable appDT = new DataTable();
        string[] VRule;
        VRule = new string[6];
        VRule[0] = "Name Format";
        VRule[1] = "New Date Format";
        VRule[2] = "Collect Mobile Email";
        VRule[3] = "SPAR Logo";
        VRule[4] = "SPAR Copyright";
        VRule[5] = "Address Format";
        appDT = AppSysRules.Get_RuleValue_ByDescAsDataTable(VRule, WebAppClass.LanguageId, WebAppClass.CurrentSQLDBConnection);
        return appDT;
    }
    #endregion
}
