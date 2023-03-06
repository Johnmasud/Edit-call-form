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
using System.IO;
using System.Collections.Generic;

public partial class CFPictureFileDisplay : System.Web.UI.Page
{
    protected string Job_No, Wave_No, Task_No, Task_Desc, Task_Addtl_Desc, store_id, AddressRule, NameRule, DateRule, Date_input, VarDay, Varmonth, StrYear;
    protected string Chain_No, Store_Chain_Desc, Store_No, Store_Store_Name, Store_Street_Addr, Store_City, Store_State, Store_Zip, Photo_CF_Access;
    protected string CA_merch_no, Str_Merch_no, Merch_First_Name, Merch_Last_Name, Merch_Street_Addr, Merch_Street_Addr2, Merch_City, Merch_State, Merch_Zip, Merch_Phone_No, Merch_Email_Addr;
    protected string Field_Start_Dt, Field_end_Dt, Key_Comp_Dt, DOA_Dt, TodayDate, visit_no, PagePath, OrigionalFile, StrOriginalFile, StrUserUploadFile;
    protected string Collect_iVR_Time, night_visits, Mileage_flag, Travel_flag, RotateFileSave, Rotate, StrRotateFileSave, StrRotateDisplay,Str_Manager_Title, Str_txt_Manager_name;
    protected string Job_Type, Business_Type_id, Work_Type_id, Work_Type_Desc, StrImgUrl, StrFileSave, hiddentest, StrHTMLDisplay, Client_Access_Flag, Pre_Approved_Flag, Job_Visit_Date, Display_Job_Visit_Date, Old_Visit_Date, StrGridDates;
    protected string Data_Col_Method, overwritetime, All_Data_Received, collect_time_only, Ask_Q_HH_Used, HH_Status_Flag, FileUploadType,Photo_Q_No, Photo_q_Res_Val, Photo_Prod_upc, Photo_upc_desc, Photo_q_desc, Photo_Res_desc, Photo_Q_Enable;
    protected string Collect_Header, Collect_Call_Form, SS_Callform, Prod_Specific, qdef_skippattern, Max_Mx_Per_Store, Max_Visit_Per_Store_Mx, NewScreenPage;
    protected string Collect_Store_Mgr_Name, Product_Check_Flag, Ask_EShelf_Question, Call_Form_Type_No, Est_instore_minutes, Business_Rule_Eckerd, Eckerd_Job_Last_question, CloudSwitch;
    protected string user_id, StrShowPic, StrUserFileName,StrOriginalFileArray, StrArrayRotateFiles, PhotoButton, Bus_Rule5_Question, Bus_Rule6_Question, Bus_Rule28_Question, Bus_Rule3_Question, Bus_Rule4_Question, Bus_Rule7_Question;
    public string[] vPrompts;
    protected string Str_VisitMonth, Str_visitday, Str_visityear, Str_timein_hrs, Str_timein_min, Str_cmb_timein, Str_timeout_hrs, Str_timeout_min, Str_cmb_timeout, Photo_Ans_type;
    protected string Str_txt_mileage, Str_txt_drive, Str_rad_q_Past_Midnight, Str_rad_q_HH_Used, Str_rad_q_Ret_store_visit, Photo_VisitMonth, Photo_visitday, Photo_visityear;
    protected string Str_Radio_EShelf, Str_Ask_EShelf_Question, Str_Bus_Rule3_Question, Str_rad_q_BR3, Str_Bus_Rule4_Question, Str_rad_q_BR4, Str_Bus_Rule5_Question, chainstorelstSA, selchainstoreSA;
    protected string TableId, Str_rad_q_BR5, Str_Bus_Rule6_Question, Str_rad_q_BR6, Str_Bus_Rule7_Question, Str_rad_q_BR7, Str_Bus_Rule28_Question, Str_rad_q_BR28, OriginalFileCheck;
    protected int Back_Slash, Dot, Dash, ShowType, FileCount, Lang_id, Photo_Height, Photo_width;
    protected string StrFileUpdatePath, StrFileWorkPath, StrFileApprovedPath, Str_Sv_Panel_id;
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
            Response.Redirect("http://miweb22.sparinc.com/callformdotnet/CFLoginErrorMessage.aspx");
        }
        SPARHeader PageHeader;
        SPARFooter PageFooter;
        SPARBiLingualBar BiLingualBar;
        PageHeader = (SPARHeader)this.Master.FindControl("SPARHeader1");
        PageFooter = (SPARFooter)this.Master.FindControl("SPARFooter1");
        BiLingualBar = (SPARBiLingualBar)this.Master.FindControl("SPARBiLingualBar1");
        WebAppClass = new SPARValues();
        WebAppClass.PageTitle = "";

        ptAppTranslation = new PromptTranslation("CFPictureFileDisplay.aspx", WebAppClass.PromptsLanguageId.ToString(), WebAppClass.LanguageId, WebAppClass.CurrentSQLDBConnection, WebAppClass.MultiLanguageCount);
        AppMasterControls ap1 = new AppMasterControls(PageHeader, PageFooter, BiLingualBar, WebAppClass.LoggedUserName, WebAppClass.CurrentDBDateTime, WebAppClass.LanguageId, WebAppClass.PromptsLanguageId, WebAppClass.MultiLanguageCount, WebAppClass.PageTitle, WebAppClass.CurrentSQLDBConnection, this.Page, WebAppClass.SPARLogoFileURL);
        if (WebAppClass.MerchNo > 0)
        {
            PageFooter.ShowSPARToolsURL = false;
            PageFooter.ShowMainPageUrl = false;
            PageFooter.CopyRightText = string.Empty;
            PageFooter.AllRightsReservedText = string.Empty;
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
                                    //Response.Write(Lang_id);
                                    if (Lang_id == 1)
                                    {
                                        CloudSwitch = ConfigurationManager.AppSettings["CloudSwitchServerUsa"];
                                       // Response.Write("CloudSwitchServerUsa=" + CloudSwitch);
                                    }
                                    if (Lang_id == 2)
                                    {
                                        CloudSwitch = ConfigurationManager.AppSettings["CloudSwitchServerJapan"];
                                        //Response.Write("CloudSwitchServerJapan=" + CloudSwitch);
                                    }
                                    if (Lang_id == 4)
                                    {
                                        CloudSwitch = ConfigurationManager.AppSettings["CloudSwitchServerCanada"];
                                       // Response.Write("CloudSwitchServerCanada=" + CloudSwitch);
                                    }
                                    if (Lang_id == 5)
                                    {
                                        CloudSwitch = ConfigurationManager.AppSettings["CloudSwitchServerTurkey"];
                                       // Response.Write("CloudSwitchServerTurkey=" + CloudSwitch);
                                    }
                                    if (Lang_id == 6)
                                    {
                                        CloudSwitch = ConfigurationManager.AppSettings["CloudSwitchServerSouthAfrica"];
                                       // Response.Write("CloudSwitchServerSouthAfrica=" + CloudSwitch);
                                    }
                                    if (Lang_id == 7)
                                    {
                                        CloudSwitch = ConfigurationManager.AppSettings["CloudSwitchServerIndia"];
                                       // Response.Write("CloudSwitchServerIndia=" + CloudSwitch);
                                    }
                                    if (Lang_id == 8)
                                    {
                                        CloudSwitch = ConfigurationManager.AppSettings["CloudSwitchServerRomania"];
                                        //Response.Write("CloudSwitchServerRomania=" + CloudSwitch);
                                    }
                                    if (Lang_id == 9)
                                    {
                                        CloudSwitch = ConfigurationManager.AppSettings["CloudSwitchServerUsa"];
                                        //Response.Write("CloudSwitchServerUsa9=" + CloudSwitch);
                                    }
                                    if (Lang_id == 10)
                                    {
                                        CloudSwitch = ConfigurationManager.AppSettings["CloudSwitchServerChina"];
                                       // Response.Write("CloudSwitchServerChina=" + CloudSwitch);
                                    }
                                    if (Lang_id == 11)
                                    {
                                        CloudSwitch = ConfigurationManager.AppSettings["CloudSwitchServerLithuania"];
                                        //Response.Write("CloudSwitchServerLithuania=" + CloudSwitch);
                                    }
                                    if (Lang_id == 12)
                                    {
                                        CloudSwitch = ConfigurationManager.AppSettings["CloudSwitchServerAustralia"];
                                       // Response.Write("CloudSwitchServerAustralia=" + CloudSwitch);
                                    }
                                    if (Lang_id == 13)
                                    {
                                        CloudSwitch = ConfigurationManager.AppSettings["CloudSwitchServerUsa"];
                                        //Response.Write("CloudSwitchServerUsa13=" + CloudSwitch);
                                    }
                                    if (Lang_id == 15)
                                    {
                                        CloudSwitch = ConfigurationManager.AppSettings["CloudSwitchServerChina"];
                                       // Response.Write("CloudSwitchServerChina=" + CloudSwitch);
                                    }
                                    if (Lang_id == 16)
                                    {
                                        CloudSwitch = ConfigurationManager.AppSettings["CloudSwitchServerMexico"];
                                       // Response.Write("CloudSwitchServerMexico=" + CloudSwitch);
                                    }
                                    if (Lang_id == 17)
                                    {
                                        CloudSwitch = ConfigurationManager.AppSettings["CloudSwitchServerIndia"];
                                        //Response.Write("CloudSwitchServerIndia=" + CloudSwitch);
                                    }
                                    if (Lang_id == 19)
                                    {
                                        CloudSwitch = ConfigurationManager.AppSettings["CloudSwitchServerBrazil"];
                                        //Response.Write("CloudSwitchServerBrazil=" + CloudSwitch);
                                    }
                                   // Response.Write("<BR> CloudSwitch=" + CloudSwitch + "<BR>");

                                    if (CloudSwitch == "Y")
                                    {
                                        StrFileUpdatePath = ConfigurationManager.AppSettings["FileUpdatePathfsx"];

                                    }
                                    else
                                    {
                                        StrFileUpdatePath = ConfigurationManager.AppSettings["FileUpdatePath"];
                                    }

                                    StrFileUpdatePath = StrFileUpdatePath + "sparEyesPic" + Convert.ToString(Lang_id) + "\\\\update\\\\";
                                    
                                    //****** Prompts
                                    GetPromptTranslation();

                                    //****** System Rules
                                    DataTable RuleTab = new DataTable();
                                    RuleTab = GetSystemRules();

                                    AddressRule = RuleTab.Rows[5][2].ToString();
                                    //Response.Write("AddressRule=" + AddressRule);

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
                                   
                                    

                                    //********************* Date Function
                                    DateTime date = DateTime.Now;

                                    StrDate = date;
                                    ShowType = 0;
                                    try
                                    {
                                        StrYear = clsDateFormat.Date_Format(date, ShowType, DateRule, Date_input);
                                        //Response.Write("StrYear=" + StrYear + "<BR>");
                                    }
                                    catch (Exception ex)
                                    {
                                        throw ex;
                                    }
                                    //PagePath = "http://localhost:1489/SMP_callform/CFPictureGetSingleFile.aspx";
                                    //OrigionalFile = "C:\\Photo\\Update\\johnTest.jpg";
                                    Rotate = "1";
                                   
                                   // Response.Write("good job <BR>");

                                    NewScreenPage = Request.Form["NewScreenPage"];
                                    //Response.Write("NewMerchPage=" + NewMerchPage);
                                    chainstorelstSA = Request.Form["chainstorelstSA"];
                                    selchainstoreSA = Request.Form["selchainstoreSA"];
                                    Job_No = Request.Form["Job_No"];
                                   // Response.Write("Job_No=" + Job_No);
                                    Wave_No = Request.Form["Wave_No"];
                                    Task_No = Request.Form["Task_No"];
                                    Task_Desc = Request.Form["Task_Desc"];
                                    Task_Addtl_Desc = Request.Form["Task_Addtl_Desc"];

                                    store_id = Request.Form["store_id"];

                                    Chain_No = Request.Form["Chain_No"];
                                    Store_Chain_Desc = Request.Form["Store_Chain_Desc"];
                                    Store_No = Request.Form["Store_No"];
                                    Store_Store_Name = Request.Form["Store_Store_Name"];
                                    Store_Street_Addr = Request.Form["Store_Street_Addr"];
                                    Store_City = Request.Form["Store_City"];
                                    Store_State = Request.Form["Store_State"];
                                    Store_Zip = Request.Form["Store_Zip"];

                                    CA_merch_no = Request.Form["CA_merch_no"];
                                    Str_Merch_no = Request.Form["Str_Merch_no"];
                                    Merch_First_Name = Request.Form["Merch_First_Name"];
                                    Merch_Last_Name = Request.Form["Merch_Last_Name"];
                                    Merch_Street_Addr = Request.Form["Merch_Street_Addr"];
                                    Merch_Street_Addr2 = Request.Form["Merch_Street_Addr2"];
                                    Merch_City = Request.Form["Merch_City"];
                                    Merch_State = Request.Form["Merch_State"];
                                    Merch_Zip = Request.Form["Merch_Zip"];
                                    Merch_Phone_No = Request.Form["Merch_Phone_No"];
                                    Merch_Email_Addr = Request.Form["Merch_Email_Addr"];


                                    Field_Start_Dt = Request.Form["Field_Start_Dt"];
                                    Field_end_Dt = Request.Form["Field_end_Dt"];
                                    Key_Comp_Dt = Request.Form["Key_Comp_Dt"];
                                    DOA_Dt = Request.Form["DOA_Dt"];

                                    TodayDate = Request.Form["TodayDate"];

                                    visit_no = Request.Form["visit_no"];

                                    Collect_iVR_Time = Request.Form["Collect_iVR_Time"];
                                    night_visits = Request.Form["night_visits"];
                                    Mileage_flag = Request.Form["Mileage_flag"];
                                    Travel_flag = Request.Form["Travel_flag"];

                                    Job_Type = Request.Form["Job_Type"];
                                    Business_Type_id = Request.Form["Business_Type_id"];

                                    Work_Type_id = Request.Form["Work_Type_id"];
                                    Work_Type_Desc = Request.Form["Work_Type_Desc"];

                                    Data_Col_Method = Request.Form["Data_Col_Method"];
                                    overwritetime = Request.Form["overwritetime"];
                                    All_Data_Received = Request.Form["All_Data_Received"];
                                    collect_time_only = Request.Form["collect_time_only"];
                                    Ask_Q_HH_Used = Request.Form["Ask_Q_HH_Used"];
                                    HH_Status_Flag = Request.Form["HH_Status_Flag"];

                                    Collect_Header = Request.Form["Collect_Header"];
                                    Collect_Call_Form = Request.Form["Collect_Call_Form"];

                                    SS_Callform = Request.Form["SS_Callform"];
                                    Prod_Specific = Request.Form["Prod_Specific"];
                                    qdef_skippattern = Request.Form["qdef_skippattern"];

                                    Max_Mx_Per_Store = Request.Form["Max_Mx_Per_Store"];
                                    Max_Visit_Per_Store_Mx = Request.Form["Max_Visit_Per_Store_Mx"];

                                    Collect_Store_Mgr_Name = Request.Form["Collect_Store_Mgr_Name"];

                                    Product_Check_Flag = Request.Form["Product_Check_Flag"];

                                    Ask_EShelf_Question = Request.Form["Ask_EShelf_Question"];

                                    Call_Form_Type_No = Request.Form["Call_Form_Type_No"];

                                    Est_instore_minutes = Request.Form["Est_instore_minutes"];
                                    Business_Rule_Eckerd = Request.Form["Business_Rule_Eckerd"];
                                    Eckerd_Job_Last_question = Request.Form["Eckerd_Job_Last_question"];

                                    user_id = Request.Form["user_id"];
                                    PhotoButton = Request.Form["PhotoButton"];
                                    Bus_Rule5_Question = Request.Form["Bus_Rule5_Question"];
                                    Bus_Rule6_Question = Request.Form["Bus_Rule6_Question"];
                                    Bus_Rule28_Question = Request.Form["Bus_Rule28_Question"];
                                    Bus_Rule3_Question = Request.Form["Bus_Rule3_Question"];
                                    Bus_Rule4_Question = Request.Form["Bus_Rule4_Question"];
                                   // Response.Write("Bus_Rule4_Question=" + Bus_Rule4_Question);
                                    Bus_Rule7_Question = Request.Form["Bus_Rule7_Question"];

                                    //************************ From the page CFJWTValidate.asp
                                    // visit date 
                                    Str_VisitMonth = Request.Form["Str_VisitMonth"];
                                   // Response.Write("Str_VisitMonth=" + Str_VisitMonth + "<BR>");

                                    Str_visitday = Request.Form["Str_visitday"];
                                    // Response.Write("Str_visitday=" + Str_visitday + "<BR>");

                                    Str_visityear = Request.Form["Str_visityear"];
                                    // Response.Write("Str_visityear=" + Str_visityear + "<BR>");

                                    //Time in and out     
                                    Str_timein_hrs = Request.Form["Str_timein_hrs"];
                                   // Response.Write("Str_timein_hrs=" + Str_timein_hrs + "<BR>");
                                    Str_timein_min = Request.Form["Str_timein_min"];
                                    //Response.Write("Str_timein_min=" + Str_timein_min + "<BR>");
                                    Str_cmb_timein = Request.Form["Str_cmb_timein"];
                                    //Response.Write("Str_cmb_timein=" + Str_cmb_timein + "<BR>");

                                    Str_timeout_hrs = Request.Form["Str_timeout_hrs"];
                                    //Response.Write("Str_timeout_hrs=" + Str_timeout_hrs + "<BR>");
                                    Str_timeout_min = Request.Form["Str_timeout_min"];
                                   // Response.Write("Str_timeout_min=" + Str_timeout_min + "<BR>");
                                    Str_cmb_timeout = Request.Form["Str_cmb_timeout"];
                                    //Response.Write("Str_cmb_timeout=" + Str_cmb_timeout + "<BR>");

                                    // mileage		

                                    Str_txt_mileage = Request.Form["Str_txt_mileage"];
                                    //Response.Write("Str_txt_mileage=" + Str_txt_mileage + "<BR>");

                                    //drive		
                                    Str_txt_drive = Request.Form["Str_txt_drive"];
                                   // Response.Write("Str_txt_drive=" + Str_txt_drive + "<BR>");

                                    //Time Question

                                    Str_rad_q_Past_Midnight = Request.Form["Str_rad_q_Past_Midnight"];
                                    //Response.Write("Str_rad_q_Past_Midnight=" + Str_rad_q_Past_Midnight + "<BR>");

                                    //Hand Held Question

                                    Str_rad_q_HH_Used = Request.Form["Str_rad_q_HH_Used"];
                                    //Response.Write("Str_rad_q_HH_Used=" + Str_rad_q_HH_Used + "<BR>");

                                    //Time Store Visit

                                    Str_rad_q_Ret_store_visit = Request.Form["Str_rad_q_Ret_store_visit"];
                                    //Response.Write("Str_rad_q_Ret_store_visit=" + Str_rad_q_Ret_store_visit + "<BR>");

                                    //For EShelf 	

                                    Str_Radio_EShelf = Request.Form["Str_Radio_EShelf"];
                                    //Response.Write("Str_Radio_EShelf=" + Str_Radio_EShelf + "<BR>");

                                    Str_Ask_EShelf_Question = Request.Form["Str_Ask_EShelf_Question"];
                                   //Response.Write("Str_Ask_EShelf_Question=" + Str_Ask_EShelf_Question + "<BR>");

                                    //business rules
                                    Str_Bus_Rule3_Question = Request.Form["Str_Bus_Rule3_Question"];
                                    //Response.Write("Str_Bus_Rule3_Question=" + Str_Bus_Rule3_Question + "<BR>");

                                    Str_rad_q_BR3 = Request.Form["Str_rad_q_BR3"];
                                    //Response.Write("Str_rad_q_BR3=" + Str_rad_q_BR3 + "<BR>");

                                    Str_Bus_Rule4_Question = Request.Form["Str_Bus_Rule4_Question"];
                                    //Response.Write("Str_Bus_Rule4_Question=" + Str_Bus_Rule4_Question + "<BR>");

                                    Str_rad_q_BR4 = Request.Form["Str_rad_q_BR4"];
                                    //Response.Write("Str_rad_q_BR4=" + Str_rad_q_BR4 + "<BR>");

                                    Str_Bus_Rule5_Question = Request.Form["Str_Bus_Rule5_Question"];
                                    //Response.Write("Str_Bus_Rule5_Question=" + Str_Bus_Rule5_Question + "<BR>");
                                    Str_rad_q_BR5 = Request.Form["Str_rad_q_BR5"];
                                    //Response.Write("Str_rad_q_BR5=" + Str_rad_q_BR5 + "<BR>");

                                    Str_Bus_Rule6_Question = Request.Form["Str_Bus_Rule6_Question"];
                                    //Response.Write("Str_Bus_Rule6_Question=" + Str_Bus_Rule6_Question + "<BR>");
                                    Str_rad_q_BR6 = Request.Form["Str_rad_q_BR6"];
                                   // Response.Write("Str_rad_q_BR6=" + Str_rad_q_BR6 + "<BR>");

                                    Str_Bus_Rule7_Question = Request.Form["Str_Bus_Rule7_Question"];
                                   // Response.Write("Str_Bus_Rule7_Question=" + Str_Bus_Rule7_Question + "<BR>");
                                    Str_rad_q_BR7 = Request.Form["Str_rad_q_BR7"];
                                    //Response.Write("Str_rad_q_BR7=" + Str_rad_q_BR7 + "<BR>");

                                    Str_Bus_Rule28_Question = Request.Form["Str_Bus_Rule28_Question"];
                                   // Response.Write("Str_Bus_Rule28_Question=" + Str_Bus_Rule28_Question + "<BR>");
                                    Str_rad_q_BR28 = Request.Form["Str_rad_q_BR28"];
                                   // Response.Write("Str_rad_q_BR28=" + Str_rad_q_BR28 + "<BR>");


                                    Str_Manager_Title = Request.Form["Str_Manager_Title"];
                                    //Response.Write("Str_Manager_Title=" + Str_Manager_Title + "<BR>");
                                    Str_txt_Manager_name = Request.Form["Str_txt_Manager_name"];
                                   // Response.Write("Str_txt_Manager_name=" + Str_txt_Manager_name + "<BR>");
                                    //Response.Write("Str_rad_q_BR28=" + Str_rad_q_BR28 + "<BR>");


                                    FileUploadType = Request.Form["FileUploadType"];
                                    //Response.Write("FileUploadType=" + FileUploadType + "<BR>");

                                        Photo_VisitMonth = Request.Form["ctl00$ContentPlaceHolder1$txt_visitmonth"];
                                        //Response.Write("Photo_VisitMonth=" + Photo_VisitMonth + "<BR>");

                                         Photo_visitday = Request.Form["ctl00$ContentPlaceHolder1$txt_visitday"];
                                         //Response.Write("Photo_visitday=" + Photo_visitday + "<BR>");

                                        Photo_visityear = Request.Form["ctl00$ContentPlaceHolder1$txt_visityear"];
                                       // Response.Write("Photo_visityear=" + Photo_visityear + "<BR>");

                                        Client_Access_Flag = Request.Form["Client_Access_Flag"];

                                        Pre_Approved_Flag = Request.Form["Pre_Approved_Flag"];

                                        Job_Visit_Date = Request.Form["Job_Visit_Date"];
                                        if (Job_Visit_Date == "0")
                                        {
                                            Label8.Text = "";
                                            Display_Job_Visit_Date = "";
                                           // Response.Write("Job_Visit_Date=" + Job_Visit_Date + "<BR>");
                                        }
                                        else
                                        {
                                            Display_Job_Visit_Date = ":" + Job_Visit_Date;
                                        }
                                        Old_Visit_Date = Request.Form["Old_Visit_Date"];
                                       // Response.Write("Old_Visit_Date=" + Old_Visit_Date);
                                        StrGridDates = Request.Form["StrGridDates"];
                                        //Response.Write("StrGridDates=" + StrGridDates);

                                        Photo_CF_Access = Request.Form["Photo_CF_Access"];
                             //Rotate file name 
                                    RotateFileSave = Request.Form["RotateFileSave"];
                                  // Response.Write("RotateFileSave=" + RotateFileSave + "<BR>");
                            //Origional file
                                    //savePath = Server.HtmlEncode(SingleUpload.FileName);
                                    //photo by question 
                                    Photo_Q_No = Request.Form["Photo_Q_No"];
                                    Photo_q_Res_Val = Request.Form["Photo_q_Res_Val"];
                                    Photo_Prod_upc = Request.Form["Photo_Prod_upc"];
                                    Photo_upc_desc = Request.Form["Photo_upc_desc"];
                                    Photo_q_desc = Request.Form["Photo_q_desc"];
                                    Photo_Res_desc = Request.Form["Photo_Res_desc"];
                                    Photo_Ans_type = Request.Form["Photo_Ans_type"];
                                    Str_Sv_Panel_id = Request.Form["Str_Sv_Panel_id"];

                                    //if (Photo_Q_No != "")
                                    //{
                                    //    Photo_By_Q_Message.Text = "";
                                    //}
                                    //if (Photo_upc_desc != "")
                                    //{
                                    //    Display_UPC_Desc.Text = Photo_upc_desc;
                                    //}
                                    //if (Photo_q_desc != "")
                                    //{
                                    //    Display_Q_Desc.Text = Photo_q_desc;
                                    //}
                                    //if (Photo_Res_desc != "")
                                    //{
                                    //    Display_Res_Desc.Text = Photo_Res_desc;
                                    //}
                                    StringBuilder HTMLText = new StringBuilder();
                                    string[] ArrayPhoto_Res_desc;
                                    int ArrayPRDlen;
                                    string Each_Res_desc, DisplayOnce, PRD_Res_val;
                                    DisplayOnce = "";
                                    if (string.IsNullOrEmpty(Photo_Q_No) == false)
                                    {
                                        if (Photo_Q_No != "NULL")
                                        {

                                            ArrayPhoto_Res_desc = Photo_Res_desc.Split("|".ToCharArray());
                                            ArrayPRDlen = ArrayPhoto_Res_desc.Length;
                                            ArrayPRDlen = ArrayPRDlen - 1;
                                           

                                            // Display_QP_Info
                                            HTMLText.Append("<Table id='Table5'  width='100%' style='width:100%;'>");
                                            if (string.IsNullOrEmpty(Photo_upc_desc) == false)
                                            {
                                                HTMLText.Append("<tr>");
                                                HTMLText.Append("<td width='10%' class='reportCriteriaHeader' >" + vPrompts[6] + "");
                                                HTMLText.Append("</td>");
                                                HTMLText.Append(" <td  width='90%' class='selectionCriteriaItem' >:" + Photo_upc_desc + "");
                                                HTMLText.Append("</td>");
                                                HTMLText.Append("</tr>");
                                            }

                                            HTMLText.Append("<tr>");
                                            HTMLText.Append("<td width='10%' class='reportCriteriaHeader' >" + vPrompts[7] + "");
                                            HTMLText.Append("</td>");
                                            HTMLText.Append(" <td  width='90%' class='selectionCriteriaItem' >:" + Photo_q_desc + "");
                                            HTMLText.Append("</td>");
                                            HTMLText.Append("</tr>");
                                            for (int s = 0; s < ArrayPRDlen; s++)
                                            {
                                                Each_Res_desc = ArrayPhoto_Res_desc[s];
                                                PRD_Res_val = Each_Res_desc.Substring(0, 1);
                                                HTMLText.Append("<tr>");
                                                    if (DisplayOnce == "")
                                                    {
                                                        HTMLText.Append("<td width='10%' class='reportCriteriaHeader' >" + vPrompts[8] + "");
                                                        HTMLText.Append("</td>");
                                                        DisplayOnce = "1";
                                                    }
                                                    else
                                                    {
                                                        HTMLText.Append("<td width='10%' class='reportCriteriaHeader' >");
                                                        HTMLText.Append("</td>");
                                                    }
                                                    if (Photo_Ans_type == "C")
                                                    {
                                                        HTMLText.Append(" <td  width='90%' class='selectionCriteriaItem' > : <input type='checkbox' name='Ans_val_CB" + PRD_Res_val + "' id='" + PRD_Res_val + "' />" + Each_Res_desc + "");
                                                    }
                                                    else
                                                    {
                                                        HTMLText.Append(" <td  width='90%' class='selectionCriteriaItem' > :" + Each_Res_desc + "");
                                                    }
                                                    HTMLText.Append("</td>");
                                                    HTMLText.Append("</tr>");
                                            }
                                            HTMLText.Append("</Table>");
                                            Display_QP_Info.Text = HTMLText.ToString();
                                        }//if (Photo_Q_No != "NULL")

                                    }
                                    Photo_Q_Enable = Request.Form["Photo_Q_Enable"];

                                    
                                    if (!IsPostBack)
                                    {   
                                                StrOriginalFile = Request.Form["StrOriginalFile"];
                                                if ((StrOriginalFile == "") || (StrOriginalFile==null))
                                                {
                                                    if (string.IsNullOrEmpty(StrOriginalFile) == true)
                                                     {
                                                         StrOriginalFile = Context.Items["OriginalFile"].ToString();
                                                         StrUserUploadFile = Context.Items["UserUploadFile"].ToString();
                                                         //if (null != pageNum)
                                                         //{
                                                         //    PageNumber = (int)Context.Items["pageNum "];
                                                         //} 
                                                         if (FileUploadType == "M")
                                                         {
                                                             if (string.IsNullOrEmpty(RotateFileSave) == true)
                                                             {
                                                                 //StrOriginalFile = Context.Items["OriginalFile"].ToString();
                                                                 RotateFileSave = Context.Items["StrNewRotateFileName"].ToString();
                                                             }
                                                         }
                                                     }
                                                }
                                    }
                                    else
                                    {
                                        StrOriginalFile = Request.Form["StrOriginalFile"];
                                        StrUserUploadFile = Request.Form["StrUserUploadFile"];
                                    }
                                   // Response.Write("StrUserUploadFile=" + StrUserUploadFile + "<BR>");
                                   // hiddentest = Request.Form["ctl00$ContentPlaceHolder1$hiddentest"];
                                   //Response.Write("hiddentest=" + hiddentest + "<BR>");
                             // Save File name
                                   // string[] ArrayFiles;
                                   // StringBuilder HTMLText = new StringBuilder();
                                    //for (int j = 0; j < Repeater1.Items.Count; j++)
                                    //{
                                    //   // Response.Write("sdsda");
                                    //    RadioButtonList rbl = (RadioButtonList)Repeater1.Items[j].Controls[1].Controls[0].FindControl("PhotoOption");
                                    //   rbl.Attributes.Add("onclick", "javascript:DisabledOption()");
                                         
                                    //}
                                  



                                    int i;
                                   // ArrayFiles = new string[30];
                                    string[] ArrayOriginalFiles = StrOriginalFile.Split('|');
                                    string[] ArrayRotateFiles = RotateFileSave.Split('|');
                                    string[] ArrayUserUploadFile = StrUserUploadFile.Split('|');
                                    string Repeater_visitday, Repeater_VisitMonth, Repeater_visityear, itemName, RepeaterCount, ItemValue;
                                    // j = ArrayFiles.Length;
                                    //ArrayFiles = StrOriginalFile.Split('|');
                                    if (!Page.IsPostBack)
                                    {
                                        List<int> mylist = new List<int>();

                                        for (i = 0; i < ArrayOriginalFiles.Length; i++)
                                        {

                                            mylist.Add(i);
                                              
                                        }
                                        Repeater1.DataSource = mylist;
                                        Repeater1.DataBind();
                                    }
                                        
                                    
                                        foreach (RepeaterItem ri in this.Repeater1.Items)
                                        {
                                            RadioButtonList myList = (RadioButtonList)ri.FindControl("PhotoOption");
                                            RepeaterCount= ri.ItemIndex.ToString();
                                            for (int j = 0; j < myList.Items.Count; j++)
                                            {
                                                itemName = myList.Items[j].Text;
                                                ItemValue = myList.SelectedValue.ToString();
                                                if (Client_Access_Flag == "N")
                                                {
                                                    myList.Visible = false;
                                                }
                                                
                                              
                                                 myList.Items[j].Attributes.Add("onclick", "DisabledOption('" + ItemValue + "','" + RepeaterCount + "')");
                                                 myList.Items[j].Attributes.Add("ondblclick", "javascript:Disableddblclick()");
                                            }

                                            //myList.Attributes.Add("onclick", "javascript:DisabledOption()");
                                        }


                                        decimal Div_Width, Div_Height;
                                        decimal Cal_Height, Cal_width;
                                        int New_Pic_Height, New_Pic_width;
                                        Cal_width = 0;
                                        Cal_Height = 0;
                                        New_Pic_Height = 0;
                                        New_Pic_width = 0;
 
                                    FileCount = ArrayOriginalFiles.Length;

                                    for (i = 0; i < ArrayOriginalFiles.Length; i++)
                                    {
                                        StrOriginalFileArray = ArrayOriginalFiles[i];
                                        StrArrayRotateFiles = ArrayRotateFiles[i];
                                        StrUserFileName = ArrayUserUploadFile[i];
                                        
                                        //Response.Write("StrOriginalFileArray=" + StrOriginalFileArray + "<BR>");
                                        //StrRotateFileSave = "C:\\Photo\\Update\\" + StrArrayRotateFiles + ".jpg";
                                        StrRotateFileSave = "" + StrFileUpdatePath + "" + StrArrayRotateFiles + ".jpg";

                                        // Response.Write("RotateFileSave=" + RotateFileSave + "<BR>");
                                        //ImageUrl="CFPictureRotation.aspx?Path=Server.URLEncode(@'C:\Apps\johnTest.jpg')&Rotate=<% = Rotate %>&FileCheck='Response.Write(RotateFileSave)'" 
                                        Rotate = ((RadioButtonList)Repeater1.Items[i].Controls[1].Controls[0].FindControl("PhotoOption")).SelectedItem.Value;
                                         //Response.Write(Rotate);
                                        StrRotateDisplay = "" + StrFileUpdatePath + "" + StrArrayRotateFiles + "DP.jpg";
                                       // ((RadioButtonList)Repeater1.Items[i].Controls[1].Controls[0].FindControl("PhotoOption")).SelectedItem.Attributes.Add("onclick", "javascript:DisabledOption()");
                                          
                                        //RadioButtonList rbClick = (RadioButtonList)e.Item.FindControl("PhotoOption"); 

                                        // rbClick.Attributes.Add("onselect", "javascript:DisabledOption()"); 

                                        //StrImgUrl = "CFPictureRotation.aspx?Path=" + StrOriginalFileArray + "&Rotate=" + Rotate + "&FileCheck=" + StrRotateFileSave + "";
                                        StrImgUrl = "CFPictureRotation.aspx?Path=" + StrOriginalFileArray + "&StrFileSave=" + StrRotateFileSave + "&Rotate=" + Rotate + "&FileCheck=" + StrRotateDisplay + "";
                                        StrImgUrl = StrImgUrl + "";
                                        //StrShowPic = "ShowPic" + i + ".ImageUrl";
                                        //StrShowPic = "ShowPic" + i + "";
                                        //ShowPic.ImageUrl = StrImgUrl;
                                        //Response.Write("StrImgUrl=" + StrImgUrl + "<BR>");
                                       // StrShowPic = StrImgUrl;
                                        //Image lit1 = (Image)item[0].FindControl("ShowPic"); 
                                        //string value1 = lit1.Text;

                                        Repeater_visitday = ((TextBox)Repeater1.Items[i].Controls[1].FindControl("txt_visitday")).Text;
                                        Repeater_VisitMonth = ((TextBox)Repeater1.Items[i].Controls[1].FindControl("txt_visitmonth")).Text;
                                        Repeater_visityear = ((TextBox)Repeater1.Items[i].Controls[1].FindControl("txt_visityear")).Text;

                                        ((TextBox)Repeater1.Items[i].Controls[1].FindControl("txt_visitday")).Attributes.Add("onkeypress", "return DateNumberOnly(event)");
                                        ((TextBox)Repeater1.Items[i].Controls[1].FindControl("txt_visitmonth")).Attributes.Add("onkeypress", "return DateNumberOnly(event)");
                                        ((TextBox)Repeater1.Items[i].Controls[1].FindControl("txt_visityear")).Attributes.Add("onkeypress", "return DateNumberOnly(event)");


                                        

                                        if (Repeater_visitday == "" && Repeater_VisitMonth == "")
                                        {
                                            Repeater_VisitMonth = Photo_VisitMonth;
                                            Repeater_visitday = Photo_visitday;
                                            Repeater_visityear = Photo_visityear;  
                                        }

                                        ((TextBox)Repeater1.Items[i].Controls[1].FindControl("txt_visitmonth")).Text = Repeater_VisitMonth;
                                        ((TextBox)Repeater1.Items[i].Controls[1].FindControl("txt_visitday")).Text = Repeater_visitday;
                                        ((TextBox)Repeater1.Items[i].Controls[1].FindControl("txt_visityear")).Text = Repeater_visityear;
                                        if (File.Exists(StrOriginalFileArray))
                                        {
                                            //FileStream fileStream = new FileStream(StrRotateDisplay, FileMode.Open);
                                            //FileStream File_DisPlay = File.Open(StrRotateDisplay, FileMode.Open);
                                            // FileInfo Fileinfo = new FileInfo(StrRotateDisplay);
                                            // System.IO.FileAttributes. Fileinfo = new FileInfo(StrRotateDisplay);


                                            System.Drawing.Image newImage = System.Drawing.Image.FromFile(StrOriginalFileArray);
                                            Photo_Height = Convert.ToInt32(newImage.Height);
                                            Photo_width = Convert.ToInt32(newImage.Width);

                                            New_Pic_width = Convert.ToInt32(newImage.Width);
                                            New_Pic_Height = Convert.ToInt32(newImage.Height);

                                            if ((Photo_width > 340) && (Photo_Height > 200))
                                            {
                                                Div_Width = (340 / Convert.ToDecimal(Photo_width));


                                                Div_Height = (200 / Convert.ToDecimal(Photo_Height));

                                                if (Div_Width > Div_Height)
                                                {
                                                    Cal_Height = 200;
                                                    Cal_width = (Photo_width * Div_Height);
                                                }
                                                if (Div_Height > Div_Width)
                                                {
                                                    Cal_Height = (Photo_Height * Div_Width);
                                                    Cal_width = 340;
                                                }
                                                Cal_width = Math.Round(Cal_width, 0);
                                                Cal_Height = Math.Round(Cal_Height, 0);

                                                New_Pic_width = Convert.ToInt32(Cal_width);
                                                New_Pic_Height = Convert.ToInt32(Cal_Height);

                                                if (Rotate == "3" || Rotate == "4")
                                                {
                                                    New_Pic_width = Convert.ToInt32(Cal_Height);
                                                    New_Pic_Height = Convert.ToInt32(Cal_width);
                                                }
                                            }
                                           
                                            // ((Panel)Repeater1.Items[i].Controls[1].FindControl("Div_Photo_Image")).Height=200;
                                            //((Panel)Repeater1.Items[i].Controls[1].FindControl("Div_Photo_Image")).Width = 340;

                                            ((System.Web.UI.WebControls.Image)Repeater1.Items[i].Controls[1].FindControl("ShowPic")).Height = New_Pic_Height;
                                            ((System.Web.UI.WebControls.Image)Repeater1.Items[i].Controls[1].FindControl("ShowPic")).Width = New_Pic_width;
                                             newImage.Dispose();
                                             newImage = null;
                                             //System.GC.Collect();
                                            //Photo_Height = 200;
                                            //Photo_width = 340;  
                                        }
                                        else
                                        {
                                            ((System.Web.UI.WebControls.Image)Repeater1.Items[i].Controls[1].FindControl("ShowPic")).Height = 200;
                                            ((System.Web.UI.WebControls.Image)Repeater1.Items[i].Controls[1].FindControl("ShowPic")).Width = 340;
                                        }

                                        if (Client_Access_Flag == "Y")
                                        {
                                            //((Image)Repeater1.Items[i].Controls[1].FindControl("ShowPic")).ImageUrl = StrImgUrl;
                                            ((System.Web.UI.WebControls.Image)Repeater1.Items[i].Controls[1].FindControl("ShowPic")).ImageUrl = StrImgUrl;
                                        }
                                        else
                                        {
                                           
                                            ((Label)Repeater1.Items[i].Controls[1].FindControl("lblUserFileName")).Text = StrUserFileName;
                                            ((System.Web.UI.WebControls.Image)Repeater1.Items[i].Controls[1].FindControl("ShowPic")).Visible = false;
                                            
                                            if (File.Exists(StrOriginalFileArray))
                                            {
                                                File.Copy(StrOriginalFileArray, StrRotateFileSave);
                                            }
                                            //WarningMessage.Text = "We are sorry but there is no picture preview available for this job. The picture review option will be back available to you soon.";
                                            WarningMessage.Text = "Photo preview is not available for this job.";
                                            
                                        }
                                    }
    }

    #region SystemPromptandRule
    private void GetPromptTranslation()
    {
        vPrompts = new string[11];
        vPrompts[0] = "Please enter a valid visit date.";
        vPrompts[1] = "The Visit date entered is invalid for this Job,Wave and Task.";
        vPrompts[2] = "The Visit date greater than Today`s date";
        vPrompts[3] = "You can not enter more than 255 charaters in the Comment box.";
        vPrompts[4] = "Please enter a Picture path to upload.";
        vPrompts[5] = "Please wait ...";
        vPrompts[6] = "Item";
        vPrompts[7] = "Question";
        vPrompts[8] = "Response";
        vPrompts[9] = "Please upload your photo for the following:";
        vPrompts[10]= "You need to select at least one answer option to upload your photo";

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
    #region methods
    private string Date_Format(DateTime StrDate, int ShowType, string DateRule, string Date_input)
    {


        string[] ArrayDateRuleF;
        int f, StrMonth, StrDay;
        string StrTodayDate, StrTodayDate2;
        StrTodayDate = "";
        StrTodayDate2 = "";
        ArrayDateRuleF = new string[3];
        ArrayDateRuleF = DateRule.Split(Date_input.ToCharArray());
        //DateRule
        for (f = 0; f < ArrayDateRuleF.Length; f++)
        {

            if (ArrayDateRuleF[f].ToUpper() == ("mm").ToUpper())
            {
                StrMonth = StrDate.Month;
                StrTodayDate = StrTodayDate + "" + StrMonth;
            }
            if (ArrayDateRuleF[f].ToUpper() == ("dd").ToUpper())
            {
                StrDay = StrDate.Day;
                StrTodayDate = StrTodayDate + "" + StrDay;
            }
            if (ArrayDateRuleF[f].ToUpper() == ("yyyy").ToUpper())
            {
                StrYear = StrDate.Year.ToString();

                StrTodayDate = StrTodayDate + "" + StrYear;
            }
            if (ArrayDateRuleF[f].ToUpper() == ("yy").ToUpper())
            {
                StrYear = StrDate.Year.ToString();
                StrYear = StrYear.Substring(2, 2);
                StrTodayDate = StrTodayDate + "" + StrYear;
            }

            if (f != 2)
            {
                StrTodayDate = StrTodayDate + "" + "" + Date_input + "";
            }
        }
        //Strtime="";
        if (ShowType == 0)
        {
            StrTodayDate2 = StrYear;
        }
        //if (ShowType==1) 
        //{
        //    Strtime = StrDate.FormatDateTime(StrDate, 3);
        //        StrTodayDate2 =StrTodayDate + " " + Strtime;
        //        //Response.Write "StrTodayDate2=" & StrTodayDate2 & "<BR>"
        //}
        if (ShowType == 2)
        {
            StrTodayDate2 = StrTodayDate;
        }


        //'Response.Write "StrTodayDate2=" & StrTodayDate2 & "<BR>"		
        return StrTodayDate2;
        //return (int)returnVal;
    }
    #endregion

   
    
}
