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
using System.IO;
using System.Text;
using System.Net.Mail;

public partial class CFPictureFileConfirmation : System.Web.UI.Page
{
    protected string Job_No, Wave_No, Task_No, Task_Desc, Task_Addtl_Desc, store_id, AddressRule, NameRule, DateRule, Date_input, VarDay, Varmonth, StrYear;
    protected string Chain_No, Store_Chain_Desc, Store_No, Store_Store_Name, Store_Street_Addr, Store_City, Store_State, Store_Zip, Photo_CF_Access, NewScreenPage, StrNewCallFormPathLink;
    protected string CA_merch_no, Str_Merch_no, Merch_First_Name, Merch_Last_Name, Merch_Street_Addr, Merch_Street_Addr2, Merch_City, Merch_State, Merch_Zip, Merch_Phone_No, Merch_Email_Addr;
    protected string Field_Start_Dt, Field_end_Dt, Key_Comp_Dt, DOA_Dt, TodayDate, visit_no, PagePath, StrOriginalFile, Bus_Rule22_Photo, Photo_upload, Photo_Remain;
    protected string Collect_iVR_Time, night_visits, Mileage_flag, Travel_flag, RotateFileSave, Rotate, Str_Manager_Title, Str_txt_Manager_name;
    protected string Job_Type, Business_Type_id, Work_Type_id, Work_Type_Desc, StrImgUrl, StrFileSave, hiddentest, StrRotateFileSave, StrNewFileSave, Photo_Q_Enable, Photo_Q_No, Photo_By_QuestionFlag, Photo_q_Res_Val, Photo_Prod_upc, Photo_upc_desc, Photo_q_desc, Photo_Res_desc, Photo_q_complete;
    protected string Data_Col_Method, overwritetime, All_Data_Received, collect_time_only, Ask_Q_HH_Used, HH_Status_Flag, FileUploadType, Client_Access_Flag, Pre_Approved_Flag, Job_Visit_Date;
    protected string Collect_Header, Collect_Call_Form, SS_Callform, Prod_Specific, qdef_skippattern, Max_Mx_Per_Store, Max_Visit_Per_Store_Mx;
    protected string Collect_Store_Mgr_Name, Product_Check_Flag, Ask_EShelf_Question, Call_Form_Type_No, Est_instore_minutes, Business_Rule_Eckerd, Eckerd_Job_Last_question;
    protected string user_id, PhotoButton, Bus_Rule5_Question, Bus_Rule6_Question, Bus_Rule28_Question, Bus_Rule3_Question, Bus_Rule4_Question, Bus_Rule7_Question, Display_Job_Visit_Date;
    public string[] vPrompts;
    protected string Str_VisitMonth, Str_visitday, Str_visityear, Str_timein_hrs, Str_timein_min, Str_cmb_timein, Str_timeout_hrs, Str_timeout_min, Str_cmb_timeout, StrNewUploadFile, CloudSwitch;
    protected string Str_txt_mileage, Str_txt_drive, Str_rad_q_Past_Midnight, Str_rad_q_HH_Used, Str_rad_q_Ret_store_visit, SelectCheckboxFiles, Visit_Dates, Old_Visit_Date, StrGridDates;
    protected string Str_Radio_EShelf, Str_Ask_EShelf_Question, Str_Bus_Rule3_Question, Str_rad_q_BR3, Str_Bus_Rule4_Question, Str_rad_q_BR4, Str_Bus_Rule5_Question;
    protected string Str_rad_q_BR5, Str_Bus_Rule6_Question, Str_rad_q_BR6, Str_Bus_Rule7_Question, Str_rad_q_BR7, Str_Bus_Rule28_Question, Str_rad_q_BR28, PVisit_Date, Picture_Name, Comments, PhotoFileName, PhotoFilePath, CommentBox;
    protected int Back_Slash, Dot, Dash, ShowType, Lang_id, confirmation_no, Str_Lang_id, mWidth, mHeight;
    protected string PEmail_String, PMerch_Full_Name, PTask_Addtl_Desc, PField_Start_Dt, PField_end_Dt, PTask_Desc, PhotoCounter, StrFile_extension, StrVideoOriginalFileName, Photo_Res_Save_Checked, Photo_Ans_type, Photo_Res_desc_Selected, PRD_origial_file_ex, Photo_org_pic_id,Add_res_Val;
    protected string PStore_Chain_Desc, PStore_Store_Name, PStore_Street_Addr, PStore_City, PStore_State, PStore_Zip, StrEmailSendFlag, StrEmailSendIT, Approved_Folder_Name, StrPhotoOption, StrUserUploadFile, chainstorelstSA, selchainstoreSA, Str_Sv_Panel_id;
    protected string PMerch_Phone_No, PMerch_Email_Addr, PClientServ_PersonNo, EmailInfoText, StrFileUpdatePath, StrFileWorkPath, StrFileApprovedPath, StrFilePathdb, PhotoLink, PhotoEmailLink, StrPhotoLink, LCServername, Str_SERVER_NAME;  
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

        ptAppTranslation = new PromptTranslation("CFPictureFileConfirmation.aspx", WebAppClass.PromptsLanguageId.ToString(), WebAppClass.LanguageId, WebAppClass.CurrentSQLDBConnection, WebAppClass.MultiLanguageCount);
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
                                //****** System Rules
                                DataTable RuleTab = new DataTable();
                                RuleTab = GetSystemRules();

                                AddressRule = RuleTab.Rows[5][2].ToString();
                                //Response.Write("AddressRule=" + AddressRule);

                                DateRule = RuleTab.Rows[1][2].ToString();
                               // Response.Write("DateRule=" + DateRule);

                                NameRule = RuleTab.Rows[0][2].ToString();
                                //Response.Write("NameRule=" + NameRule);

                                //****** Prompts
                                GetPromptTranslation();

                            
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

                                //  int TodayMonth = System.DateTime.Now.Month;
                                // Response.Write("TodayDate =" + TodayDate + "<BR>");

                                Lang_id = WebAppClass.LanguageId;
                                //Response.Write(Lang_id);

                               // Str_User_id = WebAppClass.LoggedUserId;
                                //Response.Write("Str_User_id=" + Str_User_id);
                                StrNewCallFormPathLink = ConfigurationManager.AppSettings["NewCallFormPathLink"];
                                // Response.Write("StrNewCallFormPathLink=" + StrNewCallFormPathLink);
                                Str_SERVER_NAME = Request.ServerVariables["SERVER_NAME"];
                                //Response.Write("<BR>Str_SERVER_NAME=" + Str_SERVER_NAME + "<BR>");
                                LCServername = Str_SERVER_NAME.ToLower();
                                //Response.Write("<BR>LCServername=" + LCServername + "<BR>");

                                if (Lang_id == 1)
                                {
                                    CloudSwitch = ConfigurationManager.AppSettings["CloudSwitchServerUsa"];
                                    //Response.Write("CloudSwitchServerUsa=" + CloudSwitch);
                                }
                                if (Lang_id == 2)
                                {
                                    CloudSwitch = ConfigurationManager.AppSettings["CloudSwitchServerJapan"];
                                   // Response.Write("CloudSwitchServerJapan=" + CloudSwitch);
                                }
                                if (Lang_id == 4)
                                {
                                    CloudSwitch = ConfigurationManager.AppSettings["CloudSwitchServerCanada"];
                                    //Response.Write("CloudSwitchServerCanada=" + CloudSwitch);
                                }
                                if (Lang_id == 5)
                                {
                                    CloudSwitch = ConfigurationManager.AppSettings["CloudSwitchServerTurkey"];
                                    //Response.Write("CloudSwitchServerTurkey=" + CloudSwitch);
                                }
                                if (Lang_id == 6)
                                {
                                    CloudSwitch = ConfigurationManager.AppSettings["CloudSwitchServerSouthAfrica"];
                                    //Response.Write("CloudSwitchServerSouthAfrica=" + CloudSwitch);
                                }
                                if (Lang_id == 7)
                                {
                                    CloudSwitch = ConfigurationManager.AppSettings["CloudSwitchServerIndia"];
                                    //Response.Write("CloudSwitchServerIndia=" + CloudSwitch);
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
                                    //Response.Write("CloudSwitchServerChina=" + CloudSwitch);
                                }
                                if (Lang_id == 11)
                                {
                                    CloudSwitch = ConfigurationManager.AppSettings["CloudSwitchServerLithuania"];
                                   // Response.Write("CloudSwitchServerLithuania=" + CloudSwitch);
                                }
                                if (Lang_id == 12)
                                {
                                    CloudSwitch = ConfigurationManager.AppSettings["CloudSwitchServerAustralia"];
                                    //Response.Write("CloudSwitchServerAustralia=" + CloudSwitch);
                                }
                                if (Lang_id == 13)
                                {
                                    CloudSwitch = ConfigurationManager.AppSettings["CloudSwitchServerUsa"];
                                    //Response.Write("CloudSwitchServerUsa13=" + CloudSwitch);
                                }
                                if (Lang_id == 15)
                                {
                                    CloudSwitch = ConfigurationManager.AppSettings["CloudSwitchServerChina"];
                                    //Response.Write("CloudSwitchServerChina=" + CloudSwitch);
                                }
                                if (Lang_id == 16)
                                {
                                    CloudSwitch = ConfigurationManager.AppSettings["CloudSwitchServerMexico"];
                                   // Response.Write("CloudSwitchServerMexico=" + CloudSwitch);
                                }
                                if (Lang_id == 17)
                                {
                                    CloudSwitch = ConfigurationManager.AppSettings["CloudSwitchServerIndia"];
                                   // Response.Write("CloudSwitchServerIndia=" + CloudSwitch);
                                }
                                if (Lang_id == 19)
                                {
                                    CloudSwitch = ConfigurationManager.AppSettings["CloudSwitchServerBrazil"];
                                   // Response.Write("CloudSwitchServerBrazil=" + CloudSwitch);
                                }
                               // Response.Write("<BR> CloudSwitchmmmm=" + CloudSwitch + "<BR>");

                                if (CloudSwitch == "Y")
                                {
                                    StrFileUpdatePath = ConfigurationManager.AppSettings["FileUpdatePathfsx"];
                                    //Response.Write("StrFileUpdatePath=" + StrFileUpdatePath);

                                    StrFileWorkPath = ConfigurationManager.AppSettings["FileWorkPathfsx"];
                                    //Response.Write("StrFileWorkPath=" + StrFileWorkPath);

                                    StrFileApprovedPath = ConfigurationManager.AppSettings["FileApprovedPathfsx"];
                                    //Response.Write("StrFileApprovedPath=" + StrFileApprovedPath);

                                    PhotoLink = ConfigurationManager.AppSettings["FileApprovedPhotoLinkfsx"];
                                    //Response.Write("PhotoLink=" + PhotoLink);

                                    StrFilePathdb = ConfigurationManager.AppSettings["FilePathdbfsx"];
                                    //Response.Write("StrFileApprovedPath=" + StrFileApprovedPath);
                                }
                                else
                                {

                                    StrFileUpdatePath = ConfigurationManager.AppSettings["FileUpdatePath"];
                                    //Response.Write("StrFileUpdatePath=" + StrFileUpdatePath);

                                    StrFileWorkPath = ConfigurationManager.AppSettings["FileWorkPath"];
                                    //Response.Write("StrFileWorkPath=" + StrFileWorkPath);

                                    StrFileApprovedPath = ConfigurationManager.AppSettings["FileApprovedPath"];
                                    //Response.Write("StrFileApprovedPath=" + StrFileApprovedPath);

                                    PhotoLink = ConfigurationManager.AppSettings["FileApprovedPhotoLink"];
                                    //Response.Write("PhotoLink=" + PhotoLink);

                                    StrFilePathdb = ConfigurationManager.AppSettings["FilePathdb"];
                                    //Response.Write("StrFileApprovedPath=" + StrFileApprovedPath);
                                }

                               
                                //********************** Email flags to send emails
                                StrEmailSendIT = ConfigurationManager.AppSettings["PhotoEmailIT"];
                               // Response.Write("StrEmailSendIT=" + StrEmailSendIT);

                               
                                PhotoEmailLink = ConfigurationManager.AppSettings["FileEmailPhotoLink"];
                               // Response.Write("PhotoEmailLink=" + PhotoEmailLink);
                                bool StrContain = LCServername.Contains("china");
                                // Response.Write("<BR>StrContain=" + StrContain + "<BR>");
                                if (StrContain == true)
                                {
                                    StrNewCallFormPathLink = StrNewCallFormPathLink.Replace("//app1", "//chinaapp1");
                                    PhotoLink = PhotoLink.Replace("//spareyes", "//chinaspareyes");
                                }
                                bool StrContain2 = LCServername.Contains("dev2k8");
                                // Response.Write("<BR>StrContain=" + StrContain + "<BR>");
                                if (StrContain2 == true)
                                {
                                    StrNewCallFormPathLink = StrNewCallFormPathLink.Replace("//app1", "//dev2k8");
                                }

                                if (Lang_id == 1)
                                {
                                    StrEmailSendFlag = ConfigurationManager.AppSettings["PhotoEmailUsa"];
                                   // Response.Write("PhotoEmailUsa=" + StrEmailSendFlag);
                                }
                                if (Lang_id == 2)
                                {
                                    StrEmailSendFlag = ConfigurationManager.AppSettings["PhotoEmailJapan"];
                                   // Response.Write("PhotoEmailJapan=" + StrEmailSendFlag);
                                }
                                if (Lang_id == 4)
                                {
                                    StrEmailSendFlag = ConfigurationManager.AppSettings["PhotoEmailCanada"];
                                    //Response.Write("PhotoEmailCanada=" + StrEmailSendFlag);
                                }
                                if (Lang_id == 5)
                                {
                                    StrEmailSendFlag = ConfigurationManager.AppSettings["PhotoEmailTurkey"];
                                    //Response.Write("PhotoEmailTurkey=" + StrEmailSendFlag);
                                }
                                if (Lang_id == 6)
                                {
                                    StrEmailSendFlag = ConfigurationManager.AppSettings["PhotoEmailSouthAfrica"];
                                    //Response.Write("PhotoEmailSouthAfrica=" + StrEmailSendFlag);
                                }
                                if (Lang_id == 7)
                                {
                                    StrEmailSendFlag = ConfigurationManager.AppSettings["PhotoEmailIndia"];
                                    //Response.Write("PhotoEmailIndia=" + StrEmailSendFlag);
                                }
                                if (Lang_id == 8)
                                {
                                    StrEmailSendFlag = ConfigurationManager.AppSettings["PhotoEmailRomania"];
                                    //Response.Write("PhotoEmailRomania=" + StrEmailSendFlag);
                                }
                                if (Lang_id == 9)
                                {
                                    StrEmailSendFlag = ConfigurationManager.AppSettings["PhotoEmailUsa"];
                                    //Response.Write("PhotoEmailUsa=" + StrEmailSendFlag);
                                }
                                if (Lang_id == 10)
                                {
                                    StrEmailSendFlag = ConfigurationManager.AppSettings["PhotoEmailChina"];
                                    //Response.Write("PhotoEmailChina=" + StrEmailSendFlag);
                                }
                                if (Lang_id == 11)
                                {
                                    StrEmailSendFlag = ConfigurationManager.AppSettings["PhotoEmailLithuania"];
                                    //Response.Write("PhotoEmailLithuania=" + StrEmailSendFlag);
                                }
                                if (Lang_id == 12)
                                {
                                    StrEmailSendFlag = ConfigurationManager.AppSettings["PhotoEmailAustralia"];
                                    //Response.Write("PhotoEmailAustralia=" + StrEmailSendFlag);
                                }
                                if (Lang_id == 13)
                                {
                                    StrEmailSendFlag = ConfigurationManager.AppSettings["PhotoEmailUsa"];
                                    //Response.Write("PhotoEmailUsa=" + StrEmailSendFlag);
                                }
                                if (Lang_id == 15)
                                {
                                    StrEmailSendFlag = ConfigurationManager.AppSettings["PhotoEmailChina"];
                                    //Response.Write("PhotoEmailChina=" + StrEmailSendFlag);
                                }
                                if (Lang_id == 16)
                                {
                                    StrEmailSendFlag = ConfigurationManager.AppSettings["PhotoEmailMexico"];
                                    //Response.Write("PhotoEmailMexico=" + StrEmailSendFlag);
                                }
                                if (Lang_id == 17)
                                {
                                    StrEmailSendFlag = ConfigurationManager.AppSettings["PhotoEmailIndia"];
                                    //Response.Write("PhotoEmailIndia=" + StrEmailSendFlag);
                                }
                                //********************** end of Email flags to send emails
                                //Response.Write("PhotoEmail_1=" + StrEmailSendFlag);
                                if ((Lang_id == 13) || (Lang_id == 17))
                                {
                                    if (Lang_id == 13)
                                    {
                                        StrFileUpdatePath = StrFileUpdatePath + "sparEyesPic13\\\\update\\\\";
                                        StrFileWorkPath = StrFileWorkPath + "sparEyesPic1\\\\working\\\\";
                                        StrFileApprovedPath = StrFileApprovedPath + "sparEyesPic1\\\\approved\\\\";
                                        StrFilePathdb = StrFilePathdb + "sparEyesPic1\\working\\";
                                        //StrFileApprovedPath = StrFileApprovedPath + "sparEyesPic" + Convert.ToString(Lang_id) + "\\\\approved\\\\";
                                        Str_Lang_id = 1;
                                    }

                                    if (Lang_id == 17)
                                    {

                                        StrFileUpdatePath = StrFileUpdatePath + "sparEyesPic17\\\\update\\\\";
                                        StrFileWorkPath = StrFileWorkPath + "sparEyesPic7\\\\working\\\\";
                                        StrFilePathdb = StrFilePathdb + "sparEyesPic7\\working\\";
                                        StrFileApprovedPath = StrFileApprovedPath + "sparEyesPic7\\\\approved\\\\";
                                        Str_Lang_id = 7;
                                        Lang_id = 7;
                                    }

                                }
                                else
                                {
                                    Str_Lang_id = Lang_id;
                                    StrFileUpdatePath = StrFileUpdatePath + "sparEyesPic" + Convert.ToString(Lang_id) + "\\\\update\\\\";
                                    StrFileWorkPath = StrFileWorkPath + "sparEyesPic" + Convert.ToString(Lang_id) + "\\\\working\\\\";
                                    StrFileApprovedPath = StrFileApprovedPath + "sparEyesPic" + Convert.ToString(Lang_id) + "\\\\approved\\\\";
                                    StrFilePathdb = StrFilePathdb + "sparEyesPic" + Convert.ToString(Lang_id) + "\\working\\";
                                }
                                // Response.Write("StrFileUpdatePath=" + StrFileUpdatePath);
                                 //Response.Write("StrFileWorkPath=" + StrFileWorkPath);
                                 //Response.Write("StrFileApprovedPath=" + StrFileApprovedPath);
                                 //Response.Write("StrFilePathdb=" + StrFilePathdb);
                                NewScreenPage = Request.Form["NewScreenPage"];
                                //Response.Write("NewMerchPage=" + NewMerchPage);
                                chainstorelstSA = Request.Form["chainstorelstSA"];
                                selchainstoreSA = Request.Form["selchainstoreSA"];
                                // Response.Write("good job <BR>");
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
                         //***** visit date 
                                Str_VisitMonth = Request.Form["Str_VisitMonth"];
                                // Response.Write("Str_VisitMonth=" + Str_VisitMonth + "<BR>");

                                Str_visitday = Request.Form["Str_visitday"];
                                //Response.Write("Str_visitday=" + Str_visitday + "<BR>");

                                Str_visityear = Request.Form["Str_visityear"];
                                //Response.Write("Str_visityear=" + Str_visityear + "<BR>");

                          //*******Time in and out     
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

                         //******** mileage		

                                Str_txt_mileage = Request.Form["Str_txt_mileage"];
                                //Response.Write("Str_txt_mileage=" + Str_txt_mileage + "<BR>");

                         //******** drive		
                                Str_txt_drive = Request.Form["Str_txt_drive"];
                                // Response.Write("Str_txt_drive=" + Str_txt_drive + "<BR>");

                         //******** Time Question

                                Str_rad_q_Past_Midnight = Request.Form["Str_rad_q_Past_Midnight"];
                                //Response.Write("Str_rad_q_Past_Midnight=" + Str_rad_q_Past_Midnight + "<BR>");

                         //******** Hand Held Question

                                Str_rad_q_HH_Used = Request.Form["Str_rad_q_HH_Used"];
                                //Response.Write("Str_rad_q_HH_Used=" + Str_rad_q_HH_Used + "<BR>");

                         //******** Time Store Visit

                                Str_rad_q_Ret_store_visit = Request.Form["Str_rad_q_Ret_store_visit"];
                                //Response.Write("Str_rad_q_Ret_store_visit=" + Str_rad_q_Ret_store_visit + "<BR>");

                         //******** For EShelf 	

                                Str_Radio_EShelf = Request.Form["Str_Radio_EShelf"];
                                //Response.Write("Str_Radio_EShelf=" + Str_Radio_EShelf + "<BR>");

                                Str_Ask_EShelf_Question = Request.Form["Str_Ask_EShelf_Question"];
                                //Response.Write("Str_Ask_EShelf_Question=" + Str_Ask_EShelf_Question + "<BR>");

                       //******** business rules
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


                      //********Rotate file name 
                                //RotateFileSave = Request.Form["RotateFileSave"];
                                StrRotateFileSave = Request.Form["StrRotateFileSave"];
                              //Response.Write("StrRotateFileSave=" + StrRotateFileSave + "<BR>");
                                StrPhotoOption = Request.Form["Radio_Option_video"];
                               // Response.Write("StrPhotoOption=" + StrPhotoOption);
                               
                      //********Original file name 
                                StrOriginalFile = Request.Form["StrOriginalFile"];
                               // Response.Write("RotateFileSave=" + RotateFileSave + "<BR>");
                               // Response.Write("StrOriginalFile=" + StrOriginalFile + "<BR>");

                                 
                              
                      //******** Selected files from checkbox
                                SelectCheckboxFiles = Request.Form["SelectCheckboxFiles"];
                                // Response.Write("RotateFileSave=" + RotateFileSave + "<BR>");
                               // Response.Write("SelectCheckboxFiles=" + SelectCheckboxFiles + "<BR>");

                  

                                StrFile_extension = "jpg";
                                if (StrPhotoOption == "3")
                                {
                                    StrRotateFileSave = Request.Form["RotateFileSave"];
                                   // Response.Write("RotateFileSave=" + RotateFileSave + "<BR>");
                                     
                                    StrFile_extension = Request.Form["File_extension"];

                                    if ((StrOriginalFile == "") || (StrOriginalFile == null))
                                    {
                                        if (string.IsNullOrEmpty(StrOriginalFile) == true)
                                        {
                                            StrOriginalFile = Context.Items["OriginalFile"].ToString();
                                            StrUserUploadFile = Context.Items["UserUploadFile"].ToString();
                                            StrVideoOriginalFileName = Context.Items["VideoOriginalFileName"].ToString(); 
                                        }
                                    }
                                    SelectCheckboxFiles = StrVideoOriginalFileName;
                                    Button9.Text = "" + vPrompts[57] + "";
                                    Button6.Text = "" + vPrompts[57] + "";
                                    Button10.Text = "" + vPrompts[57] + "";
                                    Button3.Text = "" + vPrompts[57] + "";
                                    Button5.Text = "" + vPrompts[57] + "";
                                    Button7.Text = "" + vPrompts[57] + "";
                                    Button8.Text = "" + vPrompts[57] + "";
                                    Button1.Text = "" + vPrompts[57] + "";
                                }
                                
                      //******* Visit Dates
                                Visit_Dates = Request.Form["Visit_Dates"];
                               // Response.Write("Visit_Dates=" + Visit_Dates + "<BR>");
                               // Response.Write("Visit_Dates=" + Visit_Dates + "<BR>");

                                PhotoCounter = Request.Form["PhotoCounter"];
                               //Response.Write("PhotoCounter=" + PhotoCounter + "<BR>");
                                FileUploadType = Request.Form["FileUploadType"];

                                Client_Access_Flag = Request.Form["Client_Access_Flag"];

                                Pre_Approved_Flag = Request.Form["Pre_Approved_Flag"];
                                Pre_Approved_Flag = "Y";
                                Job_Visit_Date = Request.Form["Job_Visit_Date"];
                                if (string.IsNullOrEmpty(Job_Visit_Date) == true)
                                {
                                    Job_Visit_Date = "0";
                                }
                                if (Job_Visit_Date == "0")
                                {
                                    Label2.Text = "";
                                    Display_Job_Visit_Date = "";
                                    //Response.Write("Job_Visit_Date=" + Job_Visit_Date + "<BR>");
                                }
                                else
                                {
                                    Display_Job_Visit_Date = ":" + Job_Visit_Date;
                                }


                                Photo_CF_Access = Request.Form["Photo_CF_Access"];


                                Old_Visit_Date = Request.Form["Old_Visit_Date"];
                                //Response.Write("Old_Visit_Date=" + Old_Visit_Date);
                                StrGridDates = Request.Form["StrGridDates"];
                                //Response.Write("StrGridDates=" + StrGridDates);
                                //******* photo by questions

                                Photo_Q_No = Request.Form["Photo_Q_No"];
                                Photo_q_Res_Val = Request.Form["Photo_q_Res_Val"];
                                Photo_Prod_upc = Request.Form["Photo_Prod_upc"];
                                Photo_upc_desc = Request.Form["Photo_upc_desc"];
                                Photo_q_desc = Request.Form["Photo_q_desc"];
                                Photo_Res_desc = Request.Form["Photo_Res_desc"];
                                Str_Sv_Panel_id = Request.Form["Str_Sv_Panel_id"];
                                //***********Photo by question - answer type C

                                Photo_Res_Save_Checked = Request.Form["Photo_Res_Save_Checked"];
                                //Response.Write("Photo_Res_Save_Checked=" + Photo_Res_Save_Checked + "<BR>");
                                Photo_Ans_type = Request.Form["Photo_Ans_type"];
                                //Response.Write("Photo_Ans_type=" + Photo_Ans_type + "<BR>");
         
                            
                                Photo_Res_desc_Selected= Request.Form["Photo_Res_desc_Selected"];
                                PRD_origial_file_ex= Request.Form["PRD_origial_file_ex"];
                                 
                                if (PRD_origial_file_ex != "")
                                {
                                    PRD_origial_file_ex = PRD_origial_file_ex.Substring(0, PRD_origial_file_ex.Length - 1);
                                }
                                //Response.Write("PRD_origial_file_ex=" + PRD_origial_file_ex + "<BR>");
                                StringBuilder HTMLText1 = new StringBuilder();
                                string[] ArrayPhoto_Res_desc;
                                int ArrayPRDlen;
                                string Each_Res_desc, DisplayOnce, PRD_Res_val;
                                DisplayOnce = "";
                                if (string.IsNullOrEmpty(Photo_Q_No) == false)
                                {
                                    if (Photo_Q_No != "NULL")
                                    {
                                        if (Photo_Ans_type == "C")
                                        {
                                            ArrayPhoto_Res_desc = Photo_Res_desc_Selected.Split("|".ToCharArray());
                                            StrEmailSendFlag = "N";
                                        }
                                        else
                                        {
                                            ArrayPhoto_Res_desc = Photo_Res_desc.Split("|".ToCharArray());
                                        }
                                        ArrayPRDlen = ArrayPhoto_Res_desc.Length;
                                        ArrayPRDlen = ArrayPRDlen - 1;


                                        // Display_QP_Info
                                        HTMLText1.Append("<Table id='Table5'  width='100%' style='width:100%;'>");
                                        if (string.IsNullOrEmpty(Photo_upc_desc) == false)
                                        {
                                            HTMLText1.Append("<tr>");
                                            HTMLText1.Append("<td width='10%' class='reportCriteriaHeader' >" + vPrompts[52] + "");
                                            HTMLText1.Append("</td>");
                                            HTMLText1.Append(" <td  width='90%' class='selectionCriteriaItem' >:" + Photo_upc_desc + "");
                                            HTMLText1.Append("</td>");
                                            HTMLText1.Append("</tr>");
                                        }

                                        HTMLText1.Append("<tr>");
                                        HTMLText1.Append("<td width='10%' class='reportCriteriaHeader' >" + vPrompts[51] + "");
                                        HTMLText1.Append("</td>");
                                        HTMLText1.Append(" <td  width='90%' class='selectionCriteriaItem' >:" + Photo_q_desc + "");
                                        HTMLText1.Append("</td>");
                                        HTMLText1.Append("</tr>");
                                        for (int s = 0; s < ArrayPRDlen; s++)
                                        {
                                            Each_Res_desc = ArrayPhoto_Res_desc[s];
                                            PRD_Res_val = Each_Res_desc.Substring(0, 1);
                                            HTMLText1.Append("<tr>");
                                            if (DisplayOnce == "")
                                            {
                                                HTMLText1.Append("<td width='10%' class='reportCriteriaHeader' >" + vPrompts[53] + "");
                                                HTMLText1.Append("</td>");
                                                DisplayOnce = "1";
                                            }
                                            else
                                            {
                                                HTMLText1.Append("<td width='10%' class='reportCriteriaHeader' >");
                                                HTMLText1.Append("</td>");
                                            }
                                            if (Photo_Ans_type == "C")
                                            {
                                                HTMLText1.Append(" <td  width='90%' class='selectionCriteriaItem' > : " + Each_Res_desc + "");
                                            }
                                            else
                                            {
                                                HTMLText1.Append(" <td  width='90%' class='selectionCriteriaItem' > :" + Each_Res_desc + "");
                                            }
                                            HTMLText1.Append("</td>");
                                            HTMLText1.Append("</tr>");
                                        }
                                        HTMLText1.Append("</Table>");
                                        Display_QP_Info.Text = HTMLText1.ToString();
                                    }//if (Photo_Q_No != "NULL")
                                }

                               // Response.Write("PhotoEmail_2=" + StrEmailSendFlag);
                                if (string.IsNullOrEmpty(Photo_Q_No) == true)
                                {
                                    Photo_Q_No = null;
                                }
                                if (string.IsNullOrEmpty(Photo_q_Res_Val) == true)
                                {
                                    Photo_q_Res_Val = null;
                                }
                                if (string.IsNullOrEmpty(Photo_Prod_upc) == true)
                                {
                                    Photo_Prod_upc = null;
                                }
                                if (Photo_Q_No != "")
                                {
                                    Photo_By_Q_Message.Text = "";
                                }
                                if (Photo_Ans_type != "C")
                                {
                                    //Photo_q_Res_Val = null;
                                }
                                if (Str_Sv_Panel_id == "")
                                {
                                    Str_Sv_Panel_id = null;
                                }

                             
                                //for (j = 0; j < ArrlenCB; j++)
                                //{
                                //    Each_Val_CB = CType_CB_Array[j];
                                //    Response.Write("Each_Val_CB=" + Each_Val_CB + "<BR>");
                                //}
                                //Photo_q_Res_Val = "1";

                                Photo_Q_Enable = Request.Form["Photo_Q_Enable"];

                //***********  File Check
                     int StrFileYear, StrFileMonth, StrFileDay, StrFileHour, StrFileMinute, StrFileSecond, StrFileMillisecond;
                     int StrConfDay, Curday, Tempday, TempHours, TempMin,TempSec, x;
                     String StrSec, StrMin, StrHou, StrComments, DoitOnce, StrConfirHTML, StrMillisec, mSize;
                     int m;
                     //Response.Write("test=" + StrOriginalFile);  
                     int k, A, CBA;

                     string LoopFile, StrConfirHTMLShow, StrFileApproved, SPC;

                     StrConfirHTMLShow = "";
                    x=1;
                    PVisit_Date = "";
                    StrNewFileSave = "";
                    m = 0;
                //Response.Write("test=" + StrOriginalFile);  
                    Photo_org_pic_id = "";
                    StrConfirHTMLShow = "";
                    DoitOnce = "";
                    Add_res_Val = "";
      //*********************** Check for the selected files from checkbox
       

                    if (Photo_Res_Save_Checked == "")
                    {
                        Photo_Res_Save_Checked = "99|";
                    }

                    string[] CType_CB_Array = Photo_Res_Save_Checked.Split('|');

                    int j, ArrlenCB,p;
                    string Each_Val_CB;

                    ArrlenCB = CType_CB_Array.Length;
                    ArrlenCB = ArrlenCB - 1;

                    p = 0;
                        if (SelectCheckboxFiles != "")
                        {
                           
                            string[] ArrayCheckboxFiles = SelectCheckboxFiles.Split('|');
                            string[] ArrayVisitDates = Visit_Dates.Split('|');
                            string[] ArrayPhotoCount = PhotoCounter.Split('|');
                            //Lang_id

                    
                            A = ArrayCheckboxFiles.Length;

                            for (k = 0; k < A; k++)
                            {
                                LoopFile = ArrayCheckboxFiles[k];
                                PVisit_Date = ArrayVisitDates[k];
                                SPC = ArrayPhotoCount[k];
                                CBA = Convert.ToInt32(SPC);
                                DoitOnce = "";
                                if (StrPhotoOption == "3")
                                {
                                    CommentBox = "";
                                }
                                else
                                {
                                    if (CBA < 10)
                                    {
                                        StrComments = "ctl00$ContentPlaceHolder1$Repeater1$ctl0" + CBA + "$Comments";
                                        CommentBox = Request.Form["" + StrComments + ""].ToString();

                                    }
                                    else
                                    {
                                        StrComments = "ctl00$ContentPlaceHolder1$Repeater1$ctl1" + CBA + "$Comments";
                                        CommentBox = Request.Form["" + StrComments + ""].ToString();

                                    }
                                }
                                CommentBox = CommentBox.Replace("'", "''");
                                //Response.Write("CommentBox=" + CommentBox); 

                                //Response.Write("LoopVisitDates=" + LoopVisitDates + "<BR>");

                                //StrNewUploadFile = "C:\\Photo\\Update\\" + LoopFile + ".jpg";
                                StrNewUploadFile = "" + StrFileUpdatePath + "" + LoopFile + "." + StrFile_extension + "";

                                //Response.Write("StrNewUploadFile=" + StrNewUploadFile + "<BR>");

                                if (File.Exists(StrNewUploadFile))
                                {
                                    //Response.Write("File Exists!=" + StrNewUploadFile);
                                    //***************Confirmation Number                    
                                    //getting day                                   
                                    StrConfDay = DateTime.Now.Day;
                                    Curday = StrConfDay + 10;
                                    Tempday = (Curday) * (100000);
                                    //getting hours                    
                                    TempHours = DateTime.Now.Hour;
                                    //getting mins                    
                                    TempMin = DateTime.Now.Minute;
                                    //getting seconds                    
                                    TempSec = DateTime.Now.Second;
                                    TempMin = TempMin * 100;
                                    TempHours = 50 - TempHours;

                                    confirmation_no = Tempday + TempMin + TempHours + TempSec + k;
                                    //************  New File Name'


                                    m = k + 1;
                                    if (StrPhotoOption == "3")
                                    {
                                        StrConfirHTML = "<span class='reportCriteriaHeader'>" + vPrompts[58] + "" + m + ":</span><span class='selectionCriteriaItem'><B>" + confirmation_no + "</B></span>";
                                    }
                                    else
                                    {
                                        StrConfirHTML = "<span class='reportCriteriaHeader'>" + vPrompts[48] + "" + m + ":</span><span class='selectionCriteriaItem'><B>" + confirmation_no + "</B></span>";
                                    }
                                    StrConfirHTMLShow = StrConfirHTMLShow + "<br />" + StrConfirHTML;
                                    DisplayConfirNo.InnerHtml = StrConfirHTMLShow;
                                    //*************** Photo by question for c type question 

                                       for (j = 0; j < ArrlenCB; j++)
                                        {
                                            Each_Val_CB = CType_CB_Array[j];
                                            if (Each_Val_CB != "99")
                                            {
                                                Photo_q_Res_Val=Each_Val_CB;
                                                Add_res_Val = Photo_q_Res_Val;
                                            }
                                            //Response.Write("Each_Val_CB=" + Each_Val_CB + "<BR>");
                                            

                                                           
                                                            //Response.Write("Tempday=" + Tempday + "<BR>");
                                                            //Response.Write("TempMin=" + TempMin + "<BR>");
                                                            //Response.Write("TempHours=" + TempHours + "<BR>");
                                                            //Response.Write("TempSec=" + TempSec + "<BR>");
                                                            //Response.Write("k=" + k + "<BR>");
                                                            //Response.Write("j=" + j + "<BR>");
                                                            //Response.Write("confirmation_no=" + confirmation_no + "<BR>");

                                                        

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


                                                            // Response.Write("StrAppDay=" + StrAppDay + "<BR>");
                                                            // Response.Write("StrAppMonth=" + StrAppMonth + "<BR>");
                                                            // Response.Write("StrAppYear=" + StrAppYear + "<BR>");

                                                            Approved_Folder_Name = "" + StrAppYear + "" + StrAppMonth + "" + StrAppDay + "";
                                                            // Response.Write("Approved_Folder_Name=" + Approved_Folder_Name + "<BR>");

                                                            Picture_Name = "" + Job_No.Trim() + "" + Wave_No.Trim() + "" + Task_No.Trim() + "" + store_id.Trim() + "" + Str_Merch_no.Trim() + "_" + StrFileYear + "" + StrFileMonth + "" + StrFileDay + "" + StrHou.Trim() + "" + StrMin.Trim() + "" + StrSec.Trim() + "" + StrMillisec.Trim() + "" + k + "" + Add_res_Val + "";
                                                            // Response.Write("Picture_Name=" + Picture_Name + "<BR>");

                                                            PhotoFileName = Picture_Name.Trim() + "." + StrFile_extension + "";
                                                            //StrNewFileSave = "C:\\Photo\\Working\\" + Picture_Name + ".jpg";
                                                            
                                                            StrNewFileSave = "" + StrFileWorkPath.Trim() + "" + Approved_Folder_Name + "\\A\\Photo\\" + Picture_Name.Trim() + "." + StrFile_extension + "";
                                                            // Response.Write("StrNewFileSave=" + StrNewFileSave + "<BR>");
                                                            PhotoFilePath = "" + StrFilePathdb.Trim() + "" + Approved_Folder_Name + "\\A\\Photo\\" + Picture_Name.Trim() + "." + StrFile_extension + "";


                                                            if (Photo_Ans_type == "C")
                                                            {
                                                                if (DoitOnce == "")
                                                                {
                                                                    Photo_org_pic_id = "" + Picture_Name + "_" + PRD_origial_file_ex + "";

                                                                }
                                                            }
                                                            else
                                                            {
                                                                Photo_org_pic_id = null;
                                                            }

                                                            //******** Photo Width and height
                                                            if (StrPhotoOption == "3")
                                                            {
                                                                mWidth = 0;
                                                                mHeight = 0;
                                                            }
                                                            else
                                                            {
                                                                System.Drawing.Image mImg = System.Drawing.Image.FromFile(StrNewUploadFile);
                                                                mWidth = mImg.Width;
                                                                mHeight = mImg.Height;

                                                                //Response.Write("mWidth=" + mWidth + "<BR>");
                                                                //Response.Write("mHeight=" + mHeight + "<BR>");
                                                                mImg.Dispose();
                                                                //string retStatus;
                                                            }
                                                            System.IO.FileInfo pFileInfo = new System.IO.FileInfo(StrNewUploadFile);

                                                            if (pFileInfo.Exists)
                                                            {

                                                                mSize = Convert.ToString(pFileInfo.Length);
                                                            }
                                                            else
                                                            {
                                                                mSize = "0";
                                                            }
                                                            // Response.Write("StrFileApprovedPath=" + StrFileApprovedPath + "<BR>");
                                                            // Response.Write("StrNewUploadFile=" + StrNewUploadFile + "<BR>");
                                                            // Response.Write("StrNewFileSave=" + StrNewFileSave + "<BR>");
                                                            //Response.End();
                                                            //******** Copy the File to Working folder
                                                            File.Copy(StrNewUploadFile, StrNewFileSave);
                                                            //Pre_Approved_Flag
                                                            StrFileApproved = "";
                                                            if (Lang_id == 7)
                                                            {
                                                                //Folder code

                                                                StrFileApproved = "" + StrFileApprovedPath.Trim() + "" + Approved_Folder_Name + "\\A\\Photo\\" + Picture_Name.Trim() + "." + StrFile_extension + "";
                                                                //old
                                                                //StrFileApproved = "" + StrFileApprovedPath.Trim() + "" + Picture_Name.Trim() + ".jpg";
                                                                //PhotoFilePath = PhotoFilePath;
                                                                StrPhotoLink = "" + PhotoLink.Trim() + "" + Str_Lang_id + "/approved/" + Approved_Folder_Name + "/A/Photo/";
                                                                File.Copy(StrNewFileSave, StrFileApproved);
                                                                File.Delete(StrNewFileSave);
                                                                //objFSO.DeleteFile("" & FilePath & "\working\" & Picture_Name & ".jpg")
                                                            }//if (Lang_id == 7)
                                                            else
                                                            {
                                                                if (Pre_Approved_Flag == "Y")
                                                                {
                                                                    StrFileApproved = "" + StrFileApprovedPath.Trim() + "" + Approved_Folder_Name + "\\A\\Photo\\" + Picture_Name.Trim() + "." + StrFile_extension + "";
                                                                    StrPhotoLink = "" + PhotoLink.Trim() + "" + Str_Lang_id + "/approved/" + Approved_Folder_Name + "/A/Photo/";
                                                                    //old
                                                                    //StrFileApproved = "" + StrFileApprovedPath.Trim() + "" + Picture_Name.Trim() + ".jpg";
                                                                    //PhotoFilePath = PhotoFilePath;
                                                                    File.Copy(StrNewUploadFile, StrFileApproved);
                                                                    //File.Delete(StrNewFileSave);
                                                                    StrEmailSendFlag = "N";
                                                                }
                                                            }

                                                            //**************** Validation procedure
                                                            //Job_Visit_Date
                                                            Get_PhotoInsert(Job_No, Wave_No, Task_No, Chain_No, Store_No, Str_Merch_no, Str_Lang_id, Picture_Name, PVisit_Date, CommentBox, StrPhotoLink, PhotoFilePath, confirmation_no, mWidth, mHeight, mSize, visit_no, Job_Visit_Date, Pre_Approved_Flag, Photo_Q_No, Photo_Prod_upc, Old_Visit_Date, Photo_q_Res_Val, Photo_org_pic_id, Str_Sv_Panel_id);

                                                          
                                                          DoitOnce = "Y";
                                                }//end of the for loop photo by questions  
                                                DataSet dt23 = Get_Photo_QuestionCheck(Lang_id, Job_No, Wave_No, Task_No, Chain_No, Store_No, Str_Merch_no, Job_Visit_Date, Str_Sv_Panel_id);
                                                            // ds.Tables[0].Rows.Count
                                                            if (dt23.Tables[0].Rows.Count > 0)
                                                            {
                                                                Photo_q_complete = dt23.Tables[0].Rows[0]["Photo_q_complete"].ToString();
                                                                Photo_By_QuestionFlag = "Y";
                                                            }
                                                            else
                                                            {
                                                                Photo_By_QuestionFlag = "N";

                                                            }
                                                            //Response.Write("Photo_q_complete=" + Photo_q_complete);
                                                                       
                                }
                                else
                                {
                                    Label1.Visible = false;
                                    DisplayConfirNo.InnerHtml = "<span class='reportCriteriaHeader'>" + vPrompts[35] + " </span>";
                                }//if (File.Exists(StrNewUploadFile))
                                StrEmailSendFlag = "N";
                                //**************** Check the file to see if exist in working folder
                               // Response.Write("PhotoEmail_3=" + StrEmailSendFlag);
                                DataTable dt1 = Get_PhotoSentEmail(Job_No, Wave_No, Task_No, Chain_No, Store_No, Str_Merch_no, Job_Visit_Date);
                                PEmail_String = dt1.Rows[0][0].ToString();
                                //Response.Write("PEmail_String=" + PEmail_String + "<BR>");
                                PMerch_Full_Name = dt1.Rows[0]["Merch_Full_Name"].ToString();
                                //Response.Write("PMerch_Full_Name=" + PMerch_Full_Name + "<BR>");
                                PTask_Addtl_Desc = dt1.Rows[0]["Task_Addtl_Desc"].ToString();
                                PField_Start_Dt = dt1.Rows[0]["Field_Start_Dt"].ToString();
                                PField_end_Dt = dt1.Rows[0]["Field_end_Dt"].ToString();
                                PTask_Desc = dt1.Rows[0]["Task_Desc"].ToString();
                                PStore_Chain_Desc = dt1.Rows[0]["Store_Chain_Desc"].ToString();
                                PStore_Store_Name = dt1.Rows[0]["Store_Store_Name"].ToString();
                                PStore_Street_Addr = dt1.Rows[0]["Store_Street_Addr"].ToString();
                                PStore_City = dt1.Rows[0]["Store_City"].ToString();
                                PStore_State = dt1.Rows[0]["Store_State"].ToString();
                                PStore_Zip = dt1.Rows[0]["Store_Zip"].ToString();
                                PMerch_Phone_No = dt1.Rows[0]["Merch_Phone_No"].ToString();
                                PMerch_Email_Addr = dt1.Rows[0]["Merch_Email_Addr"].ToString();
                                PClientServ_PersonNo = dt1.Rows[0]["ClientServ_PersonNo"].ToString();
                                // Response.Write("PMerch_Full_Name=" + PMerch_Full_Name + "<BR>");
                                Bus_Rule22_Photo = dt1.Rows[0]["Bus_Rule22_Photo"].ToString();
                                Photo_Remain = dt1.Rows[0]["Photo_Remain"].ToString();
                                //Response.Write("Bus_Rule22_Photo=" + Bus_Rule22_Photo + "<BR>");
                                // Response.Write("Photo_By_QuestionFlag=" + Photo_By_QuestionFlag + "<BR>");

                                if (Photo_By_QuestionFlag == "Y")
                                {
                                    Bus_Rule22_Photo = "N";
                                }
                                if (Bus_Rule22_Photo.Trim() == "Y")
                                {
                                    Button4.Enabled = false;
                                }
                                if (Bus_Rule22_Photo.Trim() == "N")
                                {
                                    Button4.Enabled = true;
                                }
                                if (File.Exists(StrNewFileSave))
                                {

                                    StringBuilder HTMLText = new StringBuilder();

                                    HTMLText.Append("<!DOCTYPE HTML PUBLIC '-//IETF//DTD HTML//EN'>");
                                    HTMLText.Append("<HTML>");
                                    HTMLText.Append("<TITLE align=center><FONT color=Green>" + vPrompts[14] + "</FONT></TITLE>");
                                    HTMLText.Append("<meta http-equiv='Content-Type' content='text/html; charset=iso-8859-1'>");
                                    //HTMLText.Append("<META content='MSHTML 5.00.2919.6307' name=GENERATOR>"

                                    HTMLText.Append("<BODY bgColor=#ffffff>");
                                    HTMLText.Append("<DIV align=center>");
                                    HTMLText.Append("<U><EM><FONT color=#ff0000>");
                                    HTMLText.Append("<STRONG> " + vPrompts[15] + " </STRONG>");
                                    //HTMLText.Append("<BR><META content='MSHTML 5.00.2919.6307' name=GENERATOR></FONT></EM></U></DIV>"

                                    HTMLText.Append("<DIV>");
                                    HTMLText.Append("<Table class=grid align=Center border=1 width=100% cellpadding=1 cellspacing=1>");

                                    HTMLText.Append("<TR bgcolor='DarkGray'>");
                                    HTMLText.Append("<TD align=Center>");
                                    HTMLText.Append("<STRONG><FONT color=white> " + vPrompts[16] + "</FONT></STRONG>");
                                    HTMLText.Append("</TD>");
                                    HTMLText.Append("</TR>");

                                    HTMLText.Append("<TR bgcolor='DarkGray'><TD class=fieldtitle align=left>");
                                    HTMLText.Append("<STRONG><FONT color=White>" + vPrompts[17] + "</FONT></STRONG>");
                                    HTMLText.Append("</TD></TR>");

                                    HTMLText.Append("<TR bgcolor='white'><TD class=fieldtitle align=left>");
                                    HTMLText.Append("<STRONG><EM> " + vPrompts[3] + "</EM></STRONG>" + Job_No + " " + PTask_Addtl_Desc + "");
                                    HTMLText.Append("</TD></TR>");

                                    HTMLText.Append("<TR bgcolor='white'><TD class=fieldtitle align=left>");
                                    HTMLText.Append("<STRONG><EM>" + vPrompts[4] + "</EM></STRONG>" + Wave_No + " ( " + vPrompts[18] + " " + PField_Start_Dt + " - " + vPrompts[19] + " " + PField_end_Dt + ")");
                                    HTMLText.Append("</TD></TR>");

                                    HTMLText.Append("<TR bgcolor='white'><TD class=fieldtitle align=left>");
                                    HTMLText.Append("<STRONG><EM>" + vPrompts[5] + "</EM></STRONG>" + Task_No + " " + PTask_Desc + "");
                                    HTMLText.Append("</TD></TR>");
                                    //*********** Chain Information		
                                    HTMLText.Append("<TR bgcolor='DarkGray'><TD class=fieldtitle align=left>");
                                    HTMLText.Append("<STRONG><FONT color=White>" + vPrompts[20] + "</FONT></STRONG>");
                                    HTMLText.Append("</TD></TR>");

                                    HTMLText.Append("<TR bgcolor='white'><TD class=fieldtitle align=left>");
                                    HTMLText.Append("<STRONG><EM>" + vPrompts[6] + "</EM></STRONG>" + Chain_No + " " + PStore_Chain_Desc + "");
                                    HTMLText.Append("</TD></TR>");

                                    //************Store Information

                                    HTMLText.Append("<TR bgcolor='DarkGray'><TD class=fieldtitle align=left>");
                                    HTMLText.Append("<STRONG><FONT color=White>" + vPrompts[21] + "</FONT></STRONG>");
                                    HTMLText.Append("</TD></TR>");

                                    HTMLText.Append("<TR bgcolor='white'><TD class=fieldtitle align=left>");
                                    HTMLText.Append("<STRONG><EM>" + vPrompts[7] + "</EM></STRONG>" + Store_No + "");
                                    HTMLText.Append("</TD></TR>");

                                    HTMLText.Append("<TR bgcolor='white'><TD class=fieldtitle align=left>");
                                    HTMLText.Append("<STRONG><EM>" + vPrompts[22] + "</EM></STRONG>" + PStore_Store_Name + "");
                                    HTMLText.Append("</TD></TR>");

                                    string[] ArrayAddress;
                                    int i;
                                    ArrayAddress = new string[3];
                                    ArrayAddress = AddressRule.Split(",".ToCharArray());

                                    for (i = 0; i < ArrayAddress.Length; i++)
                                    {
                                        if (ArrayAddress[i].ToUpper() == ("Street").ToUpper())
                                        {
                                            HTMLText.Append("<TR bgcolor='white'><TD class=fieldtitle align=left>");
                                            HTMLText.Append("<STRONG><EM>" + vPrompts[23] + "</EM></STRONG>" + PStore_Street_Addr + "");
                                            HTMLText.Append("</TD></TR>");
                                        }
                                        if (ArrayAddress[i].ToUpper() == ("City").ToUpper())
                                        {
                                            HTMLText.Append("<TR bgcolor='white'><TD class=fieldtitle align=left>");
                                            HTMLText.Append("<STRONG><EM>" + vPrompts[24] + "</EM></STRONG>" + PStore_City + "");
                                            HTMLText.Append("</TD></TR>");
                                        }
                                        if (ArrayAddress[i].ToUpper() == ("State").ToUpper())
                                        {
                                            HTMLText.Append("<TR bgcolor='white'><TD class=fieldtitle align=left>");
                                            HTMLText.Append("<STRONG><EM>" + vPrompts[25] + "</EM></STRONG>" + PStore_State + "");
                                            HTMLText.Append("</TD></TR>");
                                        }
                                        if (ArrayAddress[i].ToUpper() == ("Zip").ToUpper())
                                        {
                                            HTMLText.Append("<TR bgcolor='white'><TD class=fieldtitle align=left>");
                                            HTMLText.Append("<STRONG><EM>" + vPrompts[26] + "</EM></STRONG>" + PStore_Zip + "");
                                            HTMLText.Append("</TD></TR>");
                                        }
                                    }
                                    //*********** Merch Information
                                    HTMLText.Append("<TR bgcolor='DarkGray'><TD class=fieldtitle align=left>");
                                    HTMLText.Append("<STRONG><FONT color=White>" + vPrompts[27] + "</FONT></STRONG>");
                                    HTMLText.Append("</TD></TR>");

                                    HTMLText.Append("<TR bgcolor='white'><TD class=fieldtitle align=left>");
                                    HTMLText.Append("<STRONG><EM>" + vPrompts[28] + "</EM></STRONG>" + Str_Merch_no + "");
                                    HTMLText.Append("</TD></TR>");

                                    HTMLText.Append("<TR bgcolor='white'><TD class=fieldtitle align=left>");
                                    HTMLText.Append("<STRONG><EM>" + vPrompts[29] + " </EM></STRONG>" + PMerch_Phone_No + "");
                                    HTMLText.Append("</TD></TR>");

                                    HTMLText.Append("<TR bgcolor='white'><TD class=fieldtitle align=left>");
                                    HTMLText.Append("<STRONG><EM>" + vPrompts[30] + "</EM></STRONG>" + PMerch_Email_Addr + "");
                                    HTMLText.Append("</TD></TR>");

                                    HTMLText.Append("<TR bgcolor='white'><TD align=center>");
                                    HTMLText.Append("<STRONG><FONT color=balck><EM>" + vPrompts[31] + "</EM></FONT></STRONG>" + PMerch_Full_Name + "");
                                    HTMLText.Append("</TD></TR>");

                                    HTMLText.Append("<TR bgcolor='white'><TD align=center>");
                                    HTMLText.Append("<STRONG><FONT color=balck><EM>" + vPrompts[32] + "</EM></FONT></STRONG>");
                                    HTMLText.Append("</TD></TR>");

                                    HTMLText.Append("<TR bgcolor='white'><TD align=center>");

                                    //Response.Write "john=" & Cstr(ClientServPersonNo) & "<BR>"
                                    //Htmlmailtexttest ="LID=" + Trim(CStr(LangID)) + "&PID=" + Trim(CStr(Picture_Name)) + "&UID=" + Trim(Cstr(ClientServPersonNo)) + ""

                                    //Response.Write "Htmlmailtexttest=" & Htmlmailtexttest & "<BR>"

                                    //HTMLText.Append("<A href='http://mitest.sparinc.com/callforminput/sparEyesPic/sparEye_callform.asp?" + Htmlmailtexttest +"  '>" & v_Prompt(43) & "</A></font>     "
                                    //http://mi16.sparinc.com/SEMPA/spareyes_multiphotoapprove.aspx?LID=1&PID=9999200846132942037336_2009115151117&UID=14

                                    //HTMLText.Append("<A href='http://mitest.sparinc.com/callforminput/sparEyesPic/sparEye_callform.asp?LID=" + Trim(CStr(LangID)) + "&PID=" + Trim(CStr(Picture_Name)) + "&UID=" + Trim(Cstr(ClientServPersonNo)) + "'>" & v_Prompt(43) & "</A></font>"
                                    //HTMLText.Append("<A href=http://mi2.sparinc.com/sparEyesMulti/sparEye_callform.asp?LID=" + Trim(CStr(LangID)) + "&PID=" + Trim(CStr(Picture_Name)) + "&UID=" + Trim(CStr(ClientServPersonNo)) + ">" & v_Prompt(43) & "</A></font>"
                                    // HTMLText.Append("<A href='http://mi10.sparinc.com/callforminput/sparEyesPic/sparEye_callform.asp?LID=" + Str_Lang_id + "&PID=" + Picture_Name + "&UID=" + PClientServ_PersonNo + "'>" + vPrompts[43] + "</A></font>");
                                    HTMLText.Append("<A href='" + PhotoEmailLink + "?LID=" + Str_Lang_id + "&PID=" + Picture_Name + "&UID=" + PClientServ_PersonNo + "'>" + vPrompts[43] + "</A></font>");
                                    HTMLText.Append("</TD></TR>");

                                    HTMLText.Append("</Table>");
                                    HTMLText.Append("</Body></Html>");
                                    //Htmlmailtext = Trim(Htmlmailtext)

                                    //Response.Write("HTMLText=" + HTMLText + "<BR>");
                                    EmailInfoText = HTMLText.ToString();
                                    //Response.Write("EmailInfoText=" + EmailInfoText + "<BR>");

                                    string EmailFrom, EmailTO, EmailCopy, EmailBC, EmailSubject, EmailBodyMessage, EmailPriority, EmailHost, EmailAddresses;
                                    bool EmailHTMLBody;
                                    //  Response.Write("PEmail_String=" + PEmail_String + "<BR>");

                                    if (string.IsNullOrEmpty(PEmail_String) == false)
                                    {
                                        //Response.Write("StrEmailSendFlag=" + StrEmailSendFlag + "<BR>");
                                        if (Lang_id != 7)
                                        {

                                            EmailFrom = "jmasud@sparinc.com";
                                            EmailTO = PEmail_String;
                                            //EmailTO = "jmasud@sparinc.com";
                                            EmailCopy = "jmasud@sparinc.com";
                                            EmailBC = "jmasud@sparinc.com";
                                            EmailSubject = "Photo Email";
                                            //EmailBodyMessage = "Good Job";
                                            EmailPriority = "normal";
                                            EmailHTMLBody = true;
                                            EmailHost = "";
                                            //*******Need to test for countires
                                            //if (StrEmailSendFlag == "N")
                                            //{
                                            //    if (StrEmailSendIT == "Y")
                                            //    {
                                            //        StrEmailSendFlag = "Y";
                                            //        EmailTO = ConfigurationManager.AppSettings["BccMailID"].ToString();
                                            //    }
                                            //}
                                            //*******Need to test for countires
                                            // AppMail.SendAppMail("jayachandran@muthutech.com", "nandhini@muthutech.com;jayachandran@muthutech.com", string.Empty, string.Empty, "Request for Rate Approval", HTML.ToString(), "normal", true, string.Empty);   
                                            //AppMail.SendAppMail(EmailFrom, EmailTO, EmailCopy, EmailBC, EmailSubject, EmailBodyMessage, EmailPriority, EmailHTMLBody, EmailHost);
                                            
                                            if (StrEmailSendFlag == "Y")
                                            {
                                                string sFromMailID = "";
                                                string sBccMailID = "";

                                                sFromMailID = ConfigurationManager.AppSettings["FromMailID"].ToString();
                                                sBccMailID = ConfigurationManager.AppSettings["BccMailID"].ToString();


                                                MailMessage mail = new MailMessage();
                                                MailAddress from = new MailAddress(sFromMailID);
                                                mail.From = from;
                                                MailAddress to = new MailAddress(EmailTO);
                                                mail.To.Add(to);
                                                if (StrEmailSendIT == "Y")
                                                {
                                                    MailAddress bcc = new MailAddress(sBccMailID);
                                                    mail.Bcc.Add(bcc);
                                                }
                                                mail.Subject = "Photo Approval Notification";
                                                mail.IsBodyHtml = true;
                                                mail.Body = EmailInfoText;
                                                SmtpClient SendEmailOut = new SmtpClient();
                                                SendEmailOut.Send(mail);
                                            }//end of  if (StrEmailSendFlag == "Y")
                                        }//end of  if (StrEmailSendFlag == "Y")
                                    }
                                    //SmtpClient client = new SmtpClient();
                                    //client.Send(mail);
                                    //vPrompts[35]
                                    //vPrompts[30]
                                    if (Photo_Q_Enable == "Y")
                                    {
                                        if (Photo_q_complete == "N")
                                        {
                                            ErrorMessage.Text = vPrompts[55];
                                        }
                                        else
                                        {
                                            if (StrPhotoOption == "3")
                                            {
                                                ErrorMessage.Text = vPrompts[56];
                                            }
                                            else
                                            {
                                                ErrorMessage.Text = vPrompts[35];
                                            }
                                        }
                                    }
                                    else
                                    {
                                        if (StrPhotoOption == "3")
                                        {
                                            ErrorMessage.Text = vPrompts[56];
                                        }
                                        else
                                        {
                                            ErrorMessage.Text = vPrompts[35];
                                        }
                                    }
                                }
                            } //End of for loop


                        }
                        else
                        {
                            ErrorMessage.Text = "No file(s) were selected to upload!";
                            //DisplayConfirNo.InnerHtml = "No file(s) were selected to upload!";
                            //Response.Write("No file(s) were selected to upload!");
                        }//if (SelectCheckboxFiles != "")
                        //Response.Write("test=" + StrOriginalFile);  
                              
                    //*************************** Delete files
                   int d, c;
                   string[] ArrayFiles = StrRotateFileSave.Split('|'); 
                   string[] ArrayFiles1 = StrOriginalFile.Split('|');
                   string ArrayOriginalFile, ArrayRotateFile, StrNewRotateFile, StrNewRotateDisplayFile;
                   c=ArrayFiles1.Length;

                   for (d = 0; d < c; d++)
                   {
                                           ArrayOriginalFile = ArrayFiles1[d];
                                           ArrayRotateFile = ArrayFiles[d];


                                           //StrNewRotateFile = "C:\\Photo\\Update\\" + ArrayRotateFile + ".jpg";
                                           StrNewRotateFile = "" + StrFileUpdatePath.Trim() + "" + ArrayRotateFile.Trim() + ".jpg";
                                          // Response.Write("ArrayOriginalFile1=" + ArrayOriginalFile + "<BR>");
                                           //Response.Write("ArrayOriginalFile2=" + @ArrayOriginalFile + "<BR>");
                                           StrNewRotateDisplayFile = "" + StrFileUpdatePath.Trim() + "" + ArrayRotateFile.Trim() + "DP.jpg";

                                           if (File.Exists(@ArrayOriginalFile))
                                           {
                                                           

                                                           //******** Delete Files

                                                           //StrOriginalFile = Request.Form["StrOriginalFile"];
                                                          // StrRotateFileSave = Request.Form["StrRotateFileSave"];
                                                           //Delete the origional uploaded file
                                                           File.Delete(@ArrayOriginalFile);
                                                           //Delete file from rotate object
                                                           File.Delete(@StrNewRotateFile);

                                           }
                                           if (File.Exists(@StrNewRotateDisplayFile))
                                           {
                                               //******** Delete Files

                                               File.Delete(@StrNewRotateDisplayFile);

                                           }

                                           
                   }//End of for loop

    }
    //************* Function to insert the data

    private DataTable Get_PhotoInsert(String Job_No, String Wave_No, String Task_No, String Chain_No, String Store_No, String Str_Merch_no, Int32 Lang_id, String Picture_Name, String Visit_Date, String Comments, String PhotoFileName, String PhotoFilePath, Int32 confirmation_no, Int32 mWidth, Int32 mHeight, String mSize, String visit_no, String Job_Visit_Date, String Pre_Approved_Flag, String Photo_Q_No, String Photo_Prod_upc, String Old_Visit_Date, String Photo_q_Res_Val, String Photo_org_pic_id, String Str_Sv_Panel_id)
    {
        Int32 iTempMerchNo = 0;
        Int32 iTempJob_No = 0;
        Int32 iTempWave_No = 0;
        Int32 iTempTask_No = 0;
        Int32 iTempChain_No = 0;
        Int32 iTempStore_No = 0;
        Int32 iTempvisit_no = 0;


        iTempMerchNo = AppUtils.ConvertToInteger32(Str_Merch_no, 0);
        iTempJob_No = AppUtils.ConvertToInteger32(Job_No, 0);
        iTempWave_No = AppUtils.ConvertToInteger32(Wave_No, 0);
        iTempTask_No = AppUtils.ConvertToInteger32(Task_No, 0);
        iTempChain_No = AppUtils.ConvertToInteger32(Chain_No, 0);
        iTempStore_No = AppUtils.ConvertToInteger32(Store_No, 0);
        iTempvisit_no = AppUtils.ConvertToInteger32(visit_no, 0);
       //iTempconfirmation_no = AppUtils.ConvertToInteger32(confirmation_no, 0);
        //iTempPOutOfStock_no = AppUtils.ConvertToInteger32(POutOfStock_no, 0);

        return AppData.Get_CFPictureFileConfirmationinsert(iTempJob_No, iTempWave_No, iTempTask_No, iTempChain_No, iTempStore_No, iTempMerchNo, Lang_id, Picture_Name, PVisit_Date, Comments, PhotoFileName, PhotoFilePath, confirmation_no, mWidth, mHeight, mSize, iTempvisit_no, Job_Visit_Date, Pre_Approved_Flag, Photo_Q_No, Photo_Prod_upc,Old_Visit_Date,Photo_q_Res_Val,Photo_org_pic_id,Str_Sv_Panel_id, WebAppClass.CurrentSQLDBConnection);
                                    
    }
   
    //************* Function to insert the data
    private DataTable Get_PhotoSentEmail(String Job_No, String Wave_No, String Task_No, String Chain_No, String Store_No, String Str_Merch_no, String Job_Visit_Date)
    {
        Int32 iTempMerchNo = 0;
        Int32 iTempJob_No = 0;
        Int32 iTempWave_No = 0;
        Int32 iTempTask_No = 0;
        Int32 iTempChain_No = 0;
        Int32 iTempStore_No = 0;


        iTempMerchNo = AppUtils.ConvertToInteger32(Str_Merch_no, 0);
        iTempJob_No = AppUtils.ConvertToInteger32(Job_No, 0);
        iTempWave_No = AppUtils.ConvertToInteger32(Wave_No, 0);
        iTempTask_No = AppUtils.ConvertToInteger32(Task_No, 0);
        iTempChain_No = AppUtils.ConvertToInteger32(Chain_No, 0);
        iTempStore_No = AppUtils.ConvertToInteger32(Store_No, 0);
        //iTempconfirmation_no = AppUtils.ConvertToInteger32(confirmation_no, 0);
        //iTempPOutOfStock_no = AppUtils.ConvertToInteger32(POutOfStock_no, 0);

        return AppData.Get_CFPhotoSentEmail(iTempJob_No, iTempWave_No, iTempTask_No, iTempChain_No, iTempStore_No, iTempMerchNo, Job_Visit_Date, WebAppClass.CurrentSQLDBConnection);

    }
    private DataSet Get_Photo_QuestionCheck(Int32 Lang_id, String Job_No, String Wave_No, String Task_No, String Chain_No, String Store_No, String Str_Merch_no, String Job_Visit_Date, String Str_Sv_Panel_id)
    {
        Int32 iTempJob_No = 0;
        Int32 iTempWave_No = 0;
        Int32 iTempTask_No = 0;
        Int32 iTempChain_No = 0;
        Int32 iTempStore_No = 0;
        Int32 iTempMerchNo = 0;


        iTempJob_No = AppUtils.ConvertToInteger32(Job_No, 0);
        iTempWave_No = AppUtils.ConvertToInteger32(Wave_No, 0);
        iTempTask_No = AppUtils.ConvertToInteger32(Task_No, 0);
        iTempMerchNo = AppUtils.ConvertToInteger32(Str_Merch_no, 0);
        iTempChain_No = AppUtils.ConvertToInteger32(Chain_No, 0);
        iTempStore_No = AppUtils.ConvertToInteger32(Store_No, 0);

        //iTempCellProvider = AppUtils.ConvertToInteger32(CellProvider, 0);
        // iTempHidden_PhoneStatus = AppUtils.ConvertToInteger32(Hidden_PhoneStatus, 0);

        return AppData.Get_USP_Photo_QuestionCheck(Lang_id,iTempJob_No, iTempWave_No, iTempTask_No, iTempChain_No, iTempStore_No, iTempMerchNo, Job_Visit_Date,Str_Sv_Panel_id, WebAppClass.CurrentSQLDBConnection);
    }
    #region SystemPromptandRule

    private void GetPromptTranslation()
    {
         vPrompts = new string[59];
         vPrompts[0]= "Internet Call Form";
         vPrompts[1]= "Date:";
         vPrompts[2]= "Picture Upload";
         vPrompts[3]= "Job No.";
         vPrompts[4]= "Wave No.";
         vPrompts[5]= "Task No.";
         vPrompts[6]= "Chain No.";
         vPrompts[7]= "Store No.";
         vPrompts[8]= "Comments";
         vPrompts[9]= "Picture:";
         vPrompts[10]= "Note: Picture has to be JPG file";
         vPrompts[11]= "2002 SPAR Group, Inc.";
         vPrompts[12]= "All Rights Reserved.";
         vPrompts[13]= "Upload A Picture";
         vPrompts[14]= "RESET/REMODEL EMAIL NOTIFICATION";
         vPrompts[15]= "EMAIL NOTIFICATION ON NEW PHOTO";
         vPrompts[16]= "SPAR GROUP - Internet Call Form Photo Upload";
         vPrompts[17]= "Job Information" ; 
         vPrompts[18]= "FST DT:";  
         vPrompts[19]= "FEnd DT:";
         vPrompts[20]= "Chain Information";
         vPrompts[21]= "Store Information";
         vPrompts[22]= "Store Name:";
         vPrompts[23]= "Street:";
         vPrompts[24]= "City:";
         vPrompts[25]= "State:";
         vPrompts[26]= "Zip:";
         vPrompts[27]= "Merch Information";
         vPrompts[28]= "Merch No:";									
         vPrompts[29]= "Phone No:";
         vPrompts[30]= "Email Address:";
         vPrompts[31]= "A picture has been uploaded by a following merchandiser:";
         vPrompts[32]= "To view and approve the photo, use the spar system tools.";
         vPrompts[33]= "Spar System Tools";
         vPrompts[34]= "ERROR: The picture you trying to upload doesn't exists. Please give the picture a correct path and upload it again.";
         vPrompts[35]= "Note: The Photo has been upload to the system for approval, please continue with either photo upload or the Call Form.";
         vPrompts[36]= "Note: The Photo has been upload to system for approval. Please go back because you don't have the access to the call form.";
         vPrompts[37]="The photo can not be uploaded at this time.";
         vPrompts[38]="Please logout and log back in again after few minutes."; 
         vPrompts[39]="If you are still having problems please call your DMM.";
         vPrompts[40]="Photo Upload";
         vPrompts[41]="Call Form";
         vPrompts[42]="Back";
         vPrompts[43]="Spar System Tools";
         vPrompts[44]= "HELP";
         vPrompts[45]="Confirmation Number(s)";
         vPrompts[46]= "Note: No Photo has been upload to the system for approval, please continue with either photo upload or the Call Form.";
         vPrompts[47]= "Note: No Photo has been upload to the system for approval. Please go back because you don't have the access to the call form.";
         vPrompts[48]= "Photo";
         vPrompts[49] = "Sorry, you do not have permission to right click.";
         vPrompts[50] = "File Upload Failure. Please upload your pictures again.";
         vPrompts[51] = "Question";
         vPrompts[52] = "Item";
         vPrompts[53] = "Response";
         vPrompts[54] = "Please upload your photo for the following:";
         vPrompts[55] = "Please continue uploading the remaining photos.";
         vPrompts[56] = @"Note: The Video has been upload to the system for approval, please continue with either Photo\Video upload or the Call Form.";
         vPrompts[57] = @"Photo\Video Upload";
         vPrompts[58] = "Video";

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
