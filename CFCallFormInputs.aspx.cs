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
 
public partial class CFCallFormInputs : System.Web.UI.Page
{
    protected string user_id, Email_Active_Flag, Str_Merch_no, Job_No, Wave_No, Task_No, Chain_No, Store_No, txt_EmailAdd, txt_Mobile_Email, POutOfStock_no, Error_Message, Error_Flag, HTMLHeader_info, Collect_Mobile_Email, AddressRule, NameRule, DateRule;
    protected int Error_Message_Flag, BusinessQuestion_Flag, OutOfStock_no, Back_Slash, Dot, Dash, ShowType, Lang_id;
    protected string store_id, Store_Chain_Desc, Store_Store_Name, Store_Street_Addr, Store_City, Store_State, Store_Zip, Data_Required, MeasurementValue, Decimal_Point, Str_Visit_Dt_add;
    protected string PMerch_no, CA_merch_no, Merch_First_Name, Merch_Last_Name, Merch_Street_Addr, Merch_Street_Addr2, EnterVisitDate;
    protected string Merch_City, Merch_State, Merch_Zip, Merch_Phone_No, Merch_Email_Addr, Task_Desc, Task_Addtl_Desc, CellPhoneNo, Str_Back_RTSAnswers;
    protected string Field_Start_Dt, Field_end_Dt, Key_Comp_Dt, DOA_Dt, Job_Type, Business_Type_id, Work_Type_id, Work_Type_Desc, Max_Mx_Per_Store;
    protected string Max_Visit_Per_Store_Mx, visit_no, Collect_iVR_Time, night_visits, Mileage_flag, Travel_flag, Data_Col_Method, StrRTSAnswers;
    protected string All_Data_Received, qdef_skippattern, Collect_Header, Collect_Call_Form, SS_Callform, Prod_Specific, overwritetime, Prod_UPC;
    protected string collect_time_only, Ask_Q_HH_Used, HH_Status_Flag, Collect_Store_Mgr_Name, Product_Check_Flag, Ask_EShelf_Question;
    protected string Call_Form_Type_No, Est_instore_minutes, Business_Rule_Eckerd, Eckerd_Job_Last_question, Bus_Rule22_Photo, ArrayEleSubmit;
    protected string Bus_Rule5_Question, Bus_Rule6_Question, Bus_Rule28_Question, Bus_Rule3_Question, Bus_Rule4_Question, Bus_Rule7_Question;
    protected string JWTInfoText, UseTheCallForm, PhotoButton, Nextbutton, return_Message, Excute_SQL, Merch_Message, No_Question_avaliable, Str_Http_URL, Str_HTTP_HOST, Current_URL, Str_SERVER_NAME, RTS_ServerName, RTS_PathName, RTS_Url;
    protected string Date_input, VarDay, Varmonth, StrYear, VarSelect_AM, VarSelect_PM, Strcmb_timein, TodayDate, YearDisplay, All_EleAns_Val;
    protected string txt_timein_hrsVal, txt_timein_minVal, txt_timeout_hrsVal, txt_timeout_minVal, Visit_Date, txt_Phone1, txt_Phone2, txt_Phone3, CellProvider, Hidden_PhoneStatus;
    protected string Q_No, Q_Text, Q_Text_Short, Q_Type, Ans_Type, Grid_No, skippattern_status, RTS_JWT, STR_RTS_JWT, Used_qty, ShortCallForm, Display_Answers_Array;
    protected string Uniq_Ques_Id, stores_specified, prod_upc, prod_activity_id, skip_flag, ElementName, All_ElementName, ArrayAllHtmlElement, ArrayAllQuestionsElement, RTS_Q_No, ArrayRTS_Q_no;
    protected string Prod_Id, Ans_Val, Ans_Text, Nxt_Q_No, Remark, Response_Text_Flag, Ans_Val_High, Ans_Val_Low, JWT, EleAns_Val, JWTInfoRTS, Procedure_JWT_VisitDate_Check, Procedure_FunDate_Format, Procedure_CalVisit_Time, Procedure_CFJWTQuestion, Procedure_CFRTS_Issue;
    protected string Str_VisitMonth, Str_visitday, Str_visityear, Str_timein_hrs, Str_timein_min, Str_cmb_timein, Str_timeout_hrs, Str_timeout_min, Str_cmb_timeout;
    protected string Str_txt_mileage, Str_txt_drive, Str_rad_q_Past_Midnight, Str_rad_q_HH_Used, Str_rad_q_Ret_store_visit, Str_Manager_Title, Str_txt_Manager_name, NewScreenPage, chainstorelstSA, selchainstoreSA;
    protected string Str_Radio_EShelf, Str_Ask_EShelf_Question, Str_Bus_Rule3_Question, Str_rad_q_BR3, Str_Bus_Rule4_Question, Str_rad_q_BR4, Str_Bus_Rule5_Question, Reported_Answers_Array;
    protected string Var_Hidden_Ans, Str_rad_q_BR5, Str_Bus_Rule6_Question, Str_rad_q_BR6, Str_Bus_Rule7_Question, Str_rad_q_BR7, Str_Bus_Rule28_Question, Str_rad_q_BR28, CheckErrorMessage, Str_Sv_Panel_id;
    public string[] vPrompts;
    public DateTime StrDate;
    protected string Star_time, StrInformationDisplay, DisplayJWTInfo, ShowJWTCheckboxText, STREleSubmitRTS, ArrayEleSubmitRTS;
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
      

        ptAppTranslation = new PromptTranslation("CFCallFormInputs.aspx", WebAppClass.PromptsLanguageId.ToString(), WebAppClass.LanguageId, WebAppClass.CurrentSQLDBConnection, WebAppClass.MultiLanguageCount);
        // AppMasterControls ap1 = new AppMasterControls(PageHeader, PageFooter, WebAppClass.LoggedUserName, WebAppClass.CurrentDBDateTime, WebAppClass.LanguageId, WebAppClass.PromptsLanguageId, WebAppClass.PageTitle, WebAppClass.CurrentSQLDBConnection, this.Page, WebAppClass.SPARLogoFileURL);
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
    #region events
 

    
    protected void Page_Load(object sender, EventArgs e)
    {
       // Response.BufferOutput = false;


                WebAppClass.Set_MerchforForm(this.Merch_no, Convert.ToString(WebAppClass.MerchNo));

                //Str_Merch_no = Convert.ToString(WebAppClass.MerchNo);
                Str_Http_URL = Request.ServerVariables["URL"];
                //Response.Write("<BR>Str_Http_URL=" + Str_Http_URL + "<BR>");

                Str_HTTP_HOST = Request.ServerVariables["HTTP_HOST"];
                // Response.Write("<BR>Str_HTTP_HOST=" + Str_HTTP_HOST + "<BR>");


                Current_URL = "http://" + Str_HTTP_HOST.Trim() + "" + Str_Http_URL.Trim() + "";
                // Response.Write("<BR>Current_URL=" + Current_URL + "<BR>");

                Str_SERVER_NAME = Request.ServerVariables["SERVER_NAME"];
                //Response.Write("<BR>Str_SERVER_NAME=" + Str_SERVER_NAME + "<BR>");

                RTS_ServerName = ConfigurationManager.AppSettings["RTSServerName"];
                //Response.Write("RTS_ServerName=" + RTS_ServerName);
                RTS_PathName = ConfigurationManager.AppSettings["RTSPathName"];
                // Response.Write("RTS_PathName=" + RTS_PathName);

                Boolean StrServerhas;
                string Domain1, Domain2, Domain3;
                string[] ArraySERVER_NAME;
                StrServerhas = Str_SERVER_NAME.Contains("com");
                //Response.Write("StrServerhas=" + StrServerhas);
                if (StrServerhas == false)
                {
                    RTS_Url = "http://mi23.sparinc.com/itsnet/its_IssueAddNext.aspx";
                }
                else
                {
                    ArraySERVER_NAME = Str_SERVER_NAME.Split(".".ToCharArray());

                    Domain1 = ArraySERVER_NAME[0];
                    Domain2 = ArraySERVER_NAME[1];
                    Domain3 = ArraySERVER_NAME[2];
                    //Response.Write("Domain1=" + Domain1);
                    //Response.Write("Domain2=" + Domain2);
                    //Response.Write("Domain3=" + Domain3);

                    //RTS_Url = "http://mi23.sparinc.com/itsnet/its_IssueAddNext.aspx";

                    RTS_Url = "http://" + RTS_ServerName.Trim() + "." + Domain2.Trim() + "." + Domain3.Trim() + "" + RTS_PathName + "";
                }
                // Response.Write("RTS_Url=" + RTS_Url);

                //Str_Merch_no = Convert.ToString(WebAppClass.MerchNo);
                //Response.Write("Merch_noBefore=" + Str_Merch_no + "<BR>");


                //****** System Rules
                DataTable RuleTab = new DataTable();
                RuleTab = GetSystemRules();

                AddressRule = RuleTab.Rows[5][2].ToString();
                //Response.Write("AddressRule=" + AddressRule);

                DateRule = RuleTab.Rows[1][2].ToString();
                //Response.Write("DateRule=" + DateRule);

                NameRule = RuleTab.Rows[0][2].ToString();
               // Response.Write("NameRule=" + NameRule);

                MeasurementValue = RuleTab.Rows[6][2].ToString();
               // Response.Write("MeasurementValue=" + MeasurementValue);
               
                Decimal_Point = RuleTab.Rows[8][2].ToString();
               // Response.Write("Decimal_Point=" + Decimal_Point);
        

                //****** Prompts
                GetPromptTranslation();


                //******************************* Date format
                Date_input = "/";
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

                
                //************** JWT Display

                StrInformationDisplay = Request.Form["InformationDisplay"];
                //Response.Write("InformationDisplay=" + InformationDisplay + "<BR>");
                JWTInfoRTS = StrInformationDisplay;
                if (string.IsNullOrEmpty(JWTInfoRTS) == true)
                {
                    JWTInfoRTS = Request.Form["JWTInfoRTS"];
                    StrInformationDisplay = JWTInfoRTS;
                }
                //if (showCheck=="on")
                //{
                //    ShowChecked = "Checked";
                //}
                //else
                //{
                //    ShowChecked="";
                //}
                ShowJWTCheckboxText=vPrompts[7];
                StringBuilder HTMLTextSpanDisplay = new StringBuilder();
                
                HTMLTextSpanDisplay.Append(StrInformationDisplay);
                HTMLTextSpanDisplay.Append("<tr><td  align='left' class='applicationHeader'> <span class='reportTableHeader'>" + vPrompts[69] + "</span> </td></tr>");

                Str_Back_RTSAnswers = "";
                //****** Today's date 
                 DataTable dt10 = Get_Start_time();
                Star_time = dt10.Rows[0][0].ToString().Trim();

                //Star_time = Convert.ToString(Get_Start_time());
                //Response.Write("Star_time=" + Star_time);
                NewScreenPage = Request.Form["NewScreenPage"];
                //Response.Write("NewMerchPage=" + NewMerchPage);
                chainstorelstSA = Request.Form["chainstorelstSA"];
                selchainstoreSA = Request.Form["selchainstoreSA"];
                Lang_id = WebAppClass.LanguageId;
                 //Response.Write(Lang_id);
                Job_No = Request.Form["Job_No"];
                //Response.Write("Job_No=" + Job_No);
                Wave_No = Request.Form["Wave_No"];
                Task_No = Request.Form["Task_No"];
                Task_Desc = Request.Form["Task_Desc"];
                Task_Addtl_Desc = Request.Form["Task_Addtl_Desc"];
                STR_RTS_JWT = "" + Job_No.Trim() + "_" + Wave_No.Trim() + "_" + Task_No.Trim() + "";
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
                //Response.Write("Bus_Rule4_Question=" + Bus_Rule4_Question);
                Bus_Rule7_Question = Request.Form["Bus_Rule7_Question"];

                Str_Sv_Panel_id = Request.Form["Str_Sv_Panel_id"];

                //************************ From the page CFJWTValidate.asp
                // visit date 
                Str_VisitMonth = Request.Form["ctl00$ContentPlaceHolder1$txt_visitmonth"];
                if (string.IsNullOrEmpty(Str_VisitMonth) == true)
                {
                    Str_VisitMonth = Request.Form["Str_VisitMonth"];
                }
                //Response.Write("Str_VisitMonth=" + Str_VisitMonth + "<BR>");

                Str_visitday = Request.Form["ctl00$ContentPlaceHolder1$txt_visitday"];
                if (string.IsNullOrEmpty(Str_visitday) == true)
                {
                    Str_visitday = Request.Form["Str_visitday"];
                }
                //Response.Write("Str_visitday=" + Str_visitday + "<BR>");

                Str_visityear = Request.Form["ctl00$ContentPlaceHolder1$txt_visityear"];
                if (string.IsNullOrEmpty(Str_visityear) == true)
                {
                    Str_visityear = Request.Form["Str_visityear"];
                }
               // Response.Write("Str_visityear=" + Str_visityear + "<BR>");


                //Time in and out     
                Str_timein_hrs = Request.Form["ctl00$ContentPlaceHolder1$txt_timein_hrs"];
                if (string.IsNullOrEmpty(Str_timein_hrs) == true)
                {
                    Str_timein_hrs = Request.Form["Str_timein_hrs"];
                }
                //Response.Write("Str_timein_hrs=" + Str_timein_hrs + "<BR>");
                Str_timein_min = Request.Form["ctl00$ContentPlaceHolder1$txt_timein_min"];
                if (string.IsNullOrEmpty(Str_timein_min) == true)
                {
                    Str_timein_min = Request.Form["Str_timein_min"];
                }
                //Response.Write("Str_timein_min=" + Str_timein_min + "<BR>");
                Str_cmb_timein = Request.Form["ctl00$ContentPlaceHolder1$cmb_timein"];
                if (string.IsNullOrEmpty(Str_cmb_timein) == true)
                {
                    Str_cmb_timein = Request.Form["Str_cmb_timein"];
                }
                //Response.Write("Str_cmb_timein=" + Str_cmb_timein + "<BR>");

                Str_timeout_hrs = Request.Form["ctl00$ContentPlaceHolder1$txt_timeout_hrs"];
                if (string.IsNullOrEmpty(Str_timeout_hrs) == true)
                {
                    Str_timeout_hrs = Request.Form["Str_timeout_hrs"];
                }
                // Response.Write("Str_timeout_hrs=" + Str_timeout_hrs + "<BR>");
                Str_timeout_min = Request.Form["ctl00$ContentPlaceHolder1$txt_timeout_min"];
                if (string.IsNullOrEmpty(Str_timeout_min) == true)
                {
                    Str_timeout_min = Request.Form["Str_timeout_min"];
                }
                // Response.Write("Str_timeout_min=" + Str_timeout_min + "<BR>");
                Str_cmb_timeout = Request.Form["ctl00$ContentPlaceHolder1$cmb_timeout"];
                if (string.IsNullOrEmpty(Str_cmb_timeout) == true)
                {
                    Str_cmb_timeout = Request.Form["Str_cmb_timeout"];
                }
                // Response.Write("Str_cmb_timeout=" + Str_cmb_timeout + "<BR>");
 
                // mileage		

                Str_txt_mileage = Request.Form["ctl00$ContentPlaceHolder1$txt_mileage"];
                if (string.IsNullOrEmpty(Str_txt_mileage) == true)
                {
                    Str_txt_mileage = Request.Form["Str_txt_mileage"];
                }
                // Response.Write("Str_txt_mileage=" + Str_txt_mileage + "<BR>");

                //drive		
                Str_txt_drive = Request.Form["ctl00$ContentPlaceHolder1$txt_drive"];
                if (string.IsNullOrEmpty(Str_txt_drive) == true)
                {
                    Str_txt_drive = Request.Form["Str_txt_drive"];
                }
                //Response.Write("Str_txt_drive=" + Str_txt_drive + "<BR>");

                //Time Question

                Str_rad_q_Past_Midnight = Request.Form["ctl00$ContentPlaceHolder1$rad_q_Past_Midnight"];
                if (string.IsNullOrEmpty(Str_rad_q_Past_Midnight) == true)
                {
                    Str_rad_q_Past_Midnight = Request.Form["Str_rad_q_Past_Midnight"];
                }
                  //Response.Write("Str_rad_q_Past_Midnight=" + Str_rad_q_Past_Midnight + "<BR>");

                //Hand Held Question

                Str_rad_q_HH_Used = Request.Form["ctl00$ContentPlaceHolder1$rad_q_HH_Used"];
                if (string.IsNullOrEmpty(Str_rad_q_HH_Used) == true)
                {
                    Str_rad_q_HH_Used = Request.Form["Str_rad_q_HH_Used"];
                }
                // Response.Write("Str_rad_q_HH_Used=" + Str_rad_q_HH_Used + "<BR>");

                //Time Store Visit

                Str_rad_q_Ret_store_visit = Request.Form["ctl00$ContentPlaceHolder1$rad_q_Ret_store_visit"];
                if (string.IsNullOrEmpty(Str_rad_q_Ret_store_visit) == true)
                {
                    Str_rad_q_Ret_store_visit = Request.Form["Str_rad_q_Ret_store_visit"];
                }
                //Response.Write("Str_rad_q_Ret_store_visit=" + Str_rad_q_Ret_store_visit + "<BR>");

                //For EShelf 	

                Str_Radio_EShelf = Request.Form["ctl00$ContentPlaceHolder1$Radio_EShelf"];
                if (string.IsNullOrEmpty(Str_Radio_EShelf) == true)
                {
                    Str_Radio_EShelf = Request.Form["Str_Radio_EShelf"];
                }
                // Response.Write("Str_Radio_EShelf=" + Str_Radio_EShelf + "<BR>");

                Str_Ask_EShelf_Question = Request.Form["ctl00$ContentPlaceHolder1$Ask_EShelf_Question"];
         
                if (string.IsNullOrEmpty(Str_Ask_EShelf_Question) == true)
                {
                    Str_Ask_EShelf_Question = Request.Form["Str_Ask_EShelf_Question"];
                }
                // Response.Write("Str_Ask_EShelf_Question=" + Str_Ask_EShelf_Question + "<BR>");

                //business rules
               
                // Response.Write("Str_Bus_Rule3_Question=" + Str_Bus_Rule3_Question + "<BR>");

                Str_rad_q_BR3 = Request.Form["ctl00$ContentPlaceHolder1$rad_q_BR3"];
                if (string.IsNullOrEmpty(Str_rad_q_BR3) == true)
                {
                    Str_rad_q_BR3 = Request.Form["Str_rad_q_BR3"];
                }
                // Response.Write("Str_rad_q_BR3=" + Str_rad_q_BR3 + "<BR>");

                
                //Response.Write("Str_Bus_Rule4_Question=" + Str_Bus_Rule4_Question + "<BR>");

                Str_rad_q_BR4 = Request.Form["ctl00$ContentPlaceHolder1$rad_q_BR4"];
                if (string.IsNullOrEmpty(Str_rad_q_BR4) == true)
                {
                    Str_rad_q_BR4 = Request.Form["Str_rad_q_BR4"];
                }
                // Response.Write("Str_rad_q_BR4=" + Str_rad_q_BR4 + "<BR>");

               
                Str_rad_q_BR5 = Request.Form["ctl00$ContentPlaceHolder1$rad_q_BR5"];
                //  Response.Write("Str_rad_q_BR5=" + Str_rad_q_BR5 + "<BR>");

                if (string.IsNullOrEmpty(Str_rad_q_BR5) == true)
                {
                    Str_rad_q_BR5 = Request.Form["Str_rad_q_BR5"];
                }
                // Response.Write("Str_Bus_Rule6_Question=" + Str_Bus_Rule6_Question + "<BR>");
                Str_rad_q_BR6 = Request.Form["ctl00$ContentPlaceHolder1$rad_q_BR6"];
                if (string.IsNullOrEmpty(Str_rad_q_BR6) == true)
                {
                    Str_rad_q_BR6 = Request.Form["Str_rad_q_BR6"];
                }
                //Response.Write("Str_rad_q_BR6=" + Str_rad_q_BR6 + "<BR>");

                
                //Response.Write("Str_Bus_Rule7_Question=" + Str_Bus_Rule7_Question + "<BR>");
                Str_rad_q_BR7 = Request.Form["ctl00$ContentPlaceHolder1$rad_q_BR7"];
                if (string.IsNullOrEmpty(Str_rad_q_BR7) == true)
                {
                    Str_rad_q_BR7 = Request.Form["Str_rad_q_BR7"];
                }
                // Response.Write("Str_rad_q_BR7=" + Str_rad_q_BR7 + "<BR>");

                
                // Response.Write("Str_Bus_Rule28_Question=" + Str_Bus_Rule28_Question + "<BR>");
                Str_rad_q_BR28 = Request.Form["ctl00$ContentPlaceHolder1$rad_q_BR28"];
                if (string.IsNullOrEmpty(Str_rad_q_BR28) == true)
                {
                    Str_rad_q_BR28 = Request.Form["Str_rad_q_BR28"];
                }
               

                Str_Manager_Title = Request.Form["Str_Manager_Title"];
               // Response.Write("Str_Manager_Title=" + Str_Manager_Title + "<BR>");
                Str_txt_Manager_name = Request.Form["Str_txt_Manager_name"];
               // Response.Write("Str_txt_Manager_name=" + Str_txt_Manager_name + "<BR>");
                //Response.Write("Str_rad_q_BR28=" + Str_rad_q_BR28 + "<BR>");
                StrRTSAnswers= "RTS_Ans_" + STR_RTS_JWT;
                 //***** Answers coming from RTS
                Str_Back_RTSAnswers = Request.Form["" + StrRTSAnswers + ""];
                //Response.Write("Str_Back_RTSAnswers=" + Str_Back_RTSAnswers + "<BR>");
                Var_Hidden_Ans = Request.Form["Var_Hidden_Ans"];
                 //***** Cal Visit Time
                

                //EnterVisitDate = "" + Str_VisitMonth + "/" + Str_visitday + "/" + Str_visityear + "";
                //Response.Write("EnterVisitDate=" + EnterVisitDate + "<BR>");
                //DateTime date = DateTime.Now;

                //StrDate = date;
                //ShowType = 0;
                //Visit_Date = Date_Format(date, ShowType, DateRule, Date_input);
                string Visit_Time1, Visit_Time2, Visit_time, StrVisit_date, Time_IN_date, Time_Out_date, DisplayTimeIn, DisplayTimeout, VisitDateDisplay, CalTimeIn, CalTimeOut,Mon_add, Day_add, Year_add;
                string[] ArrayDate_add;        
                
                


                DateTime   Visit_Date2, Visit_Date1 ;
                try
                {
                    Visit_Date = clsDateFormat.FunDate_Format(Convert.ToInt32(Str_VisitMonth), Convert.ToInt32(Str_visitday), Str_visityear, ShowType, DateRule, Date_input);
                    VisitDateDisplay = Visit_Date;
                    //Response.Write("VisitDateDisplay=" + VisitDateDisplay + "<BR>");
                    Procedure_FunDate_Format = "Str_VisitMonth=" + Str_VisitMonth + ",Str_visitday=" + Str_visitday + ",Str_visityear=" + Str_visityear + ",ShowType=" + ShowType + ",DateRule=" + DateRule + ",Date_input=" + Date_input + "";
                }
                catch (Exception ex)
                {
                    throw ex;
                }

                try
                {
                    if (Lang_id == 1)
                    {
                        ArrayDate_add = new string[3];
                        if (string.IsNullOrEmpty(Visit_Date) == false)
                        {
                            ArrayDate_add = Visit_Date.Split("/".ToCharArray());
                            Mon_add = ArrayDate_add[0];
                            Day_add = ArrayDate_add[1];
                            Year_add = ArrayDate_add[2];
                            //Response.Write("Mon_add=" + Mon_add + "<BR>");
                            //Response.Write("Day_add=" + Day_add + "<BR>");
                            //Response.Write("Year_add=" + Year_add + "<BR>");

                            Str_Visit_Dt_add = Mon_add + "/" + Day_add + "/" + "20" + Year_add;
                             //Response.Write("Str_Visit_Dt_add=" + Str_Visit_Dt_add + "<BR>");
                        }
                       
                    }
                    else
                    {
                        Str_Visit_Dt_add = Visit_Date;
                    }
                    //Response.Write("Str_Visit_Dt_add=" + Str_Visit_Dt_add + "<BR>");
                    //Response.Write("Visit_Date=" + Visit_Date + "<BR>");
                    //************ Date Check
                    DataTable dt11 = Get_JWT_VisitDate_Check(Job_No, Wave_No, Task_No, store_id, Str_Visit_Dt_add, Str_Merch_no);
                    CheckErrorMessage = dt11.Rows[0][0].ToString();
                   //Response.Write("CheckErrorMessage=" + CheckErrorMessage + "<BR>");
                    Procedure_JWT_VisitDate_Check = "Job_No=" + Job_No + ",Wave_No=" + Wave_No + ",Task_No=" + Task_No + ",store_id=" + store_id + ",Visit_Date=" + Visit_Date + ",Str_Merch_no=" + Str_Merch_no + "";
                }
                catch (Exception ex)
                {
                    throw ex;
                }
                    //this.textBox3.Text = DateAndTime.DateDiff 
                HTMLTextSpanDisplay.Append("<tr><td align='left'  width='100%'>");
                HTMLTextSpanDisplay.Append("<table border='0'  width='100%'>");
                HTMLTextSpanDisplay.Append("<tr>");
                HTMLTextSpanDisplay.Append("<td class='reportCriteriaHeader'  width='10%' align='left'>" + vPrompts[69] + "</td>");
                HTMLTextSpanDisplay.Append("<td class='selectionCriteriaItem' width='85%' align='left'>:" + Visit_Date + "</td>");
                HTMLTextSpanDisplay.Append("</tr>");
                HTMLTextSpanDisplay.Append("</table>");
                HTMLTextSpanDisplay.Append("</td>");
                HTMLTextSpanDisplay.Append("</tr>");
               
                
                 
                 if (Collect_iVR_Time=="Y")
                    {
                              
                               
                                CalTimeIn  =Str_timein_hrs + ":" + Str_timein_min + " " + Str_cmb_timein;
                                CalTimeOut =Str_timeout_hrs + ":" + Str_timeout_min + " " + Str_cmb_timeout;
                               // Response.Write("CalTimeIn=" + CalTimeIn + "<BR>");
                               // Response.Write("CalTimeOut=" + CalTimeOut + "<BR>");
                                 //******************* Calculate the visit time
                                try
                                {
                                    Visit_time = clsDateFormat.CalVisit_Time(Convert.ToInt32(Str_VisitMonth), Convert.ToInt32(Str_visitday), Convert.ToInt32(Str_visityear), CalTimeIn, CalTimeOut, Str_rad_q_Past_Midnight);
                                    // Response.Write("Visit_time=" + Visit_time + "<BR>");
                                    Procedure_CalVisit_Time = "Str_VisitMonth=" + Str_VisitMonth + ",Str_visitday=" + Str_visitday + ",Str_visityear=" + Str_visityear + ",CalTimeIn=" + CalTimeIn + ",CalTimeOut=" + CalTimeOut + ",Str_rad_q_Past_Midnight=" + Str_rad_q_Past_Midnight + "";
                                }
                                catch (Exception ex)
                                {
                                    throw ex;
                                }
                                DisplayTimeIn ="" + Str_timein_hrs + ":" + Str_timein_min + " " + Str_cmb_timein;
                                DisplayTimeout="" + Str_timeout_hrs + ":" + Str_timeout_min + " " + Str_cmb_timeout;

                                HTMLTextSpanDisplay.Append("<tr><td align='left'  width='100%'>");
                                HTMLTextSpanDisplay.Append("<table border='0'  width='100%'>");
                                HTMLTextSpanDisplay.Append("<tr>");
                                HTMLTextSpanDisplay.Append("<td class='reportCriteriaHeader'  width='10%' align='left'>" + vPrompts[70] + "</td>");
                                HTMLTextSpanDisplay.Append("<td class='selectionCriteriaItem' width='85%' align='left'>:" + DisplayTimeIn + "</td>");
                                HTMLTextSpanDisplay.Append("</tr>");
                                HTMLTextSpanDisplay.Append("</table>");
                                HTMLTextSpanDisplay.Append("</td>");
                                HTMLTextSpanDisplay.Append("</tr>");

                                HTMLTextSpanDisplay.Append("<tr><td align='left'  width='100%'>");
                                HTMLTextSpanDisplay.Append("<table border='0'  width='100%'>");
                                HTMLTextSpanDisplay.Append("<tr>");
                                HTMLTextSpanDisplay.Append("<td class='reportCriteriaHeader'  width='10%' align='left'>" + vPrompts[71] + "</td>");
                                HTMLTextSpanDisplay.Append("<td class='selectionCriteriaItem' width='85%' align='left'>:" + DisplayTimeout + "</td>");
                                HTMLTextSpanDisplay.Append("</tr>");
                                HTMLTextSpanDisplay.Append("</table>");
                                HTMLTextSpanDisplay.Append("</td>");
                                HTMLTextSpanDisplay.Append("</tr>");

                                HTMLTextSpanDisplay.Append("<tr><td align='left'  width='100%'>");
                                HTMLTextSpanDisplay.Append("<table border='0'  width='100%'>");
                                HTMLTextSpanDisplay.Append("<tr>");
                                HTMLTextSpanDisplay.Append("<td class='reportCriteriaHeader'  width='10%' align='left'>" + vPrompts[72] + "</td>");
                                HTMLTextSpanDisplay.Append("<td class='selectionCriteriaItem' width='85%' align='left'>:" + Visit_time + "</td>");
                                HTMLTextSpanDisplay.Append("</tr>");
                                HTMLTextSpanDisplay.Append("</table>");
                                HTMLTextSpanDisplay.Append("</td>");
                                HTMLTextSpanDisplay.Append("</tr>");
                       


                    }
                  else
                     {
                            Time_IN_date = null;
                            Time_Out_date = null;
                            Visit_time = "Null";	
                    }
                    if (Mileage_flag == "Y")
                    {
                        HTMLTextSpanDisplay.Append("<tr><td align='left'  width='100%'>");
                        HTMLTextSpanDisplay.Append("<table border='0'  width='100%'>");
                        HTMLTextSpanDisplay.Append("<tr>");
                        HTMLTextSpanDisplay.Append("<td class='reportCriteriaHeader'  width='10%' align='left'>" + vPrompts[79] + "</td>");
                        HTMLTextSpanDisplay.Append("<td class='selectionCriteriaItem' width='85%' align='left'>:" + Str_txt_mileage + "</td>");
                        HTMLTextSpanDisplay.Append("</tr>");
                        HTMLTextSpanDisplay.Append("</table>");
                        HTMLTextSpanDisplay.Append("</td>");
                        HTMLTextSpanDisplay.Append("</tr>");
                    }
                    if (Travel_flag == "Y")
                    {
                        HTMLTextSpanDisplay.Append("<tr><td align='left'  width='100%'>");
                        HTMLTextSpanDisplay.Append("<table border='0'  width='100%'>");
                        HTMLTextSpanDisplay.Append("<tr>");
                        HTMLTextSpanDisplay.Append("<td class='reportCriteriaHeader'  width='10%' align='left'>" + vPrompts[80] + "</td>");
                        HTMLTextSpanDisplay.Append("<td class='selectionCriteriaItem' width='85%' align='left'>:" + Str_txt_drive + " &nbsp " + vPrompts[36] + " </td>");
                        HTMLTextSpanDisplay.Append("</tr>");
                        HTMLTextSpanDisplay.Append("</table>");
                        HTMLTextSpanDisplay.Append("</td>");
                        HTMLTextSpanDisplay.Append("</tr>");
                    }

                    HTMLTextSpanDisplay.Append("</table>");

                //***********************RTS
                    RTS_JWT=Request.Form["RTS_JWT"];

                    DisplayJWTInfo = HTMLTextSpanDisplay.ToString();
                    
               //9999,200940,1,4384
             //Job_No="500241";                  
             //Wave_No="200940";                  
             //Task_No ="1";
             //store_id = "631078";  
            // Job_No = "9999";
            //Wave_No = "200940";
            //Task_No = "1";
           //store_id = "4384";   
             //Prod_Specific="N";
             //Work_Type_id = "1";                  
             //SS_Callform="N";                 
             Prod_UPC="";
             Data_Required = "";
             Q_No = "";
             Q_Text = "";
             Q_Text_Short = "";
             Q_Type = "";
             Ans_Type = "";
             Grid_No = "";
             skippattern_status = "";
             Uniq_Ques_Id = "";
             stores_specified = "";
             prod_upc = "";
             prod_activity_id = "";
             skip_flag = "";
             Prod_Id = "";
             Ans_Val = "";
             Ans_Text = "";
             Nxt_Q_No = "";
             Remark = "";
             Response_Text_Flag = "";
             Ans_Val_High = "";
             Ans_Val_Low = "";
             JWT = "";
             ElementName = "";
             ArrayEleSubmit="";
             EleAns_Val = "";
             All_EleAns_Val = "";
             STREleSubmitRTS="";
             ArrayEleSubmitRTS = "";
        // USP_JWT_Call_Form 500241,200940,1,631078,'N','1','N',''

 
             DataTable dt = Get_CFJWTQuestion(Job_No, Wave_No, Task_No, store_id, Prod_Specific, Work_Type_id, SS_Callform, Prod_UPC);
             Procedure_CFJWTQuestion = "Job_No=" + Job_No + ",Wave_No=" + Wave_No + ",Task_No=" + Task_No + ",store_id=" + store_id + ",Prod_Specific=" + Prod_Specific + ",Work_Type_id=" + Work_Type_id + ",SS_Callform=" + SS_Callform + ",Prod_UPC=" + Prod_UPC + "";
             No_Question_avaliable = "0";
	       //     IF DBrs.EOF then
			  //         


             //Get the answers for the call form 
             DataTable dt2 = Get_CF_Answers(Lang_id, Job_No, Wave_No, Task_No, store_id, Visit_Date, Str_Merch_no);


             if (dt2.Rows.Count > 0)
             {
                 foreach (DataRow AnsRow in dt2.Rows)
                 {
                     Reported_Answers_Array = Convert.ToString(AnsRow["Reported_Answers_Array"]);
                     //ArrayRTS_Q_no = ArrayRTS_Q_no + "" + Reported_Answers_Array + ",";
                     // Response.Write("Reported_Answers_Array=" + Reported_Answers_Array + "<BR>");

                     Display_Answers_Array = Convert.ToString(AnsRow["Display_Answers_Array"]);
                     //ArrayRTS_Q_no = ArrayRTS_Q_no + "" + Reported_Answers_Array + ",";
                     // Response.Write("Display_Answers_Array=" + Display_Answers_Array + "<BR>");
                 }
             }
             else
             {
                 CheckErrorMessage = "Y";
                 CheckErrorMessage = "There are no responses reported for this visit.";
                 No_Question_avaliable = "0";
             }



        if (CheckErrorMessage=="N")
          {
                 if (dt.Rows.Count > 0)
                 {
                     No_Question_avaliable = "1";


                     TableRow NewRow = null;
                     TableCell NewCell = null;
                     TableCell NewCell2 = null;
                     TableCell NewCell3 = null;
                     TableCell NewCell4 = null;

                     Boolean DisplayResponse, Questiontext;
                     string LoopQ_no, QuestionTypeText, AllHtmlElement, AllQuestionsElement, StrRTS, AllEleHighLow;
                     int A, B,C, output;
                     LoopQ_no = "000";
                     DisplayResponse = true;
                     Questiontext = true;
                     A = 0;
                     All_ElementName = "";
                     AllHtmlElement = "";
                     ArrayAllHtmlElement = "";
                     ArrayAllQuestionsElement = "";
                     AllQuestionsElement = "";
                     AllEleHighLow = "";
                     B = 0;
                     C = 0;
                     foreach (DataRow myRow in dt.Rows)
                     {
                         output = A % 2;
                         
                         
                         QuestionTypeText = "";
                         if (myRow["Data_Required"] != System.DBNull.Value)
                         {
                             Data_Required = Convert.ToString(myRow["Data_Required"]);
                         }
                         if (myRow["Q_No"] != System.DBNull.Value)
                         {
                             Q_No = Convert.ToString(myRow["Q_No"]);
                             //Response.Write("Q_No=" + Q_No + "<BR>");
                         }
                         if (myRow["Q_Text"] != System.DBNull.Value)
                         {
                             Q_Text = Convert.ToString(myRow["Q_Text"]);
                         }
                         if (myRow["Q_Text_Short"] != System.DBNull.Value)
                         {
                             Q_Text_Short = Convert.ToString(myRow["Q_Text_Short"]);
                         }
                         if (myRow["Q_Type"] != System.DBNull.Value)
                         {
                             Q_Type = Convert.ToString(myRow["Q_Type"]);
                         }
                         if (myRow["Ans_Type"] != System.DBNull.Value)
                         {
                             Ans_Type = Convert.ToString(myRow["Ans_Type"]);
                         }
                         if (myRow["Grid_No"] != System.DBNull.Value)
                         {
                             Grid_No = Convert.ToString(myRow["Grid_No"]);
                         }
                         if (myRow["skippattern_status"] != System.DBNull.Value)
                         {
                             skippattern_status = Convert.ToString(myRow["skippattern_status"]);
                         }
                         if (myRow["Uniq_Ques_Id"] != System.DBNull.Value)
                         {
                             // AppUtils.ConvertToInteger32(
                             Uniq_Ques_Id = Convert.ToString(myRow["Uniq_Ques_Id"]);
                         }
                         if (myRow["stores_specified"] != System.DBNull.Value)
                         {
                             stores_specified = Convert.ToString(myRow["stores_specified"]);
                         }
                         if (myRow["prod_upc"] != System.DBNull.Value)
                         {
                             prod_upc = Convert.ToString(myRow["prod_upc"]);
                         }
                         if (myRow["prod_activity_id"] != System.DBNull.Value)
                         {
                             prod_activity_id = Convert.ToString(myRow["prod_activity_id"]);
                         }
                         if (myRow["skip_flag"] != System.DBNull.Value)
                         {
                             skip_flag = Convert.ToString(myRow["skip_flag"]);
                         }
                         if (myRow["Prod_Id"] != System.DBNull.Value)
                         {
                             Prod_Id = Convert.ToString(myRow["Prod_Id"]);
                         }
                         if (myRow["Ans_Val"] != System.DBNull.Value)
                         {
                             Ans_Val = Convert.ToString(myRow["Ans_Val"]);
                         }

                         if (myRow["Ans_Text"] != System.DBNull.Value)
                         {
                             Ans_Text = Convert.ToString(myRow["Ans_Text"]);
                         }

                         if (myRow["Nxt_Q_No"] != System.DBNull.Value)
                         {
                             Nxt_Q_No = Convert.ToString(myRow["Nxt_Q_No"]);
                             Nxt_Q_No = Nxt_Q_No.Trim();
                         }
                         if (myRow["Remark"] != System.DBNull.Value)
                         {
                             Remark = Convert.ToString(myRow["Remark"]);
                         }
                         if (myRow["Response_Text_Flag"] != System.DBNull.Value)
                         {
                             Response_Text_Flag = Convert.ToString(myRow["Response_Text_Flag"]);
                         }
                         if (myRow["Ans_Val_High"] != System.DBNull.Value)
                         {
                             Ans_Val_High = Convert.ToString(myRow["Ans_Val_High"]);
                             Ans_Val_High = Ans_Val_High.Replace(",", ".");
                             //Ans_Val_High = Ans_Val_High.Replace(".", "");
                             Ans_Val_High = Ans_Val_High.Trim();
                             
                             if (Ans_Val_High == "0.0000")
                             {
                                 Ans_Val_High ="0";
                             }
                             //Response.Write("Ans_Val_High=" + Ans_Val_High + "<BR>");
                         }
                         if (myRow["Ans_Val_Low"] != System.DBNull.Value)
                         {
                             Ans_Val_Low = Convert.ToString(myRow["Ans_Val_Low"]);
                             Ans_Val_Low = Ans_Val_Low.Replace(",", ".");
                            
                             if (Ans_Val_Low == "0.0000")
                             {
                                 Ans_Val_Low = "0";
                             }
                             //Response.Write("Ans_Val_Low=" + Ans_Val_Low + "<BR>");
                         }
                         if (myRow["JWT"] != System.DBNull.Value)
                         {
                             JWT = Convert.ToString(myRow["JWT"]);
                         }
                         Q_No = Q_No.Trim();
                         AllQuestionsElement = "" + Q_No + "-" + Ans_Type.Trim() + "";

                         StrRTS = "" + Ans_Val + "" + Q_No + "";
                         if (LoopQ_no != Q_No)
                         {
                             DisplayResponse = true;
                             Questiontext = true;
                             LoopQ_no = Q_No;
                             if (B > 0)
                             {
                                 A = A + 1;
                                 //Response.Write("A=" + A + "<BR>");
                                 ArrayEleSubmitRTS = ArrayEleSubmitRTS.Trim() + "|";
                             }
                         }
                         //Response.Write("LoopQ_no=" + LoopQ_no + "<BR>");
                        // Response.Write("Q_No=" + Q_No + "<BR>");
                        // Response.Write("Ans_Val=" + Ans_Val + "<BR>");

                         if (Ans_Type == "C")
                         {
                             QuestionTypeText = "" + vPrompts[73] + "";
                         }
                         if (Ans_Type == "L")
                         {
                             QuestionTypeText = "" + vPrompts[74] + "";
                         }
                         if (Ans_Type == "R")
                         {
                             QuestionTypeText = "" + vPrompts[75] + "";
                         }
                         if (Ans_Type == "N")
                         {
                             QuestionTypeText = "" + vPrompts[76] + "";
                         }
                         if (Ans_Type == "T")
                         {
                             QuestionTypeText = "" + vPrompts[77] + "";
                         }
                         if (Ans_Type == "D")
                         {
                             QuestionTypeText = "" + vPrompts[78] + "";
                         }

                         //Response.Write("Ans_Val_High=" + Ans_Val_High + "<BR>");
                         //Response.Write("Ans_Val_Low=" + Ans_Val_Low + "<BR>");
                         //Response.Write("Q_Text=" + Q_Text + "<BR>");
                         //Response.Write("Ans_Type=" + Ans_Type + "<BR>");
                         //Add a row to the table

                         //Display the question 
                         if (Questiontext == true)
                         {

                             //first cell
                             NewRow = new TableRow();
                             NewCell = new TableCell();
                             NewCell2 = new TableCell();
                             NewCell3 = new TableCell();
                             NewCell4 = new TableCell();

                             NewCell.Text = "QNo.";
                             NewCell.CssClass = "selectionCriteriaItem";
                             NewCell.BorderWidth = 1;
                             NewCell.BorderColor = System.Drawing.Color.LightBlue;
                             if (A % 2 == 0)
                             {
                                 NewRow.BackColor = System.Drawing.Color.LightYellow;
                             }
                             NewRow.Cells.Add(NewCell);
                             //second cell
                             NewCell2.Text = Q_No;
                             NewCell2.CssClass = "selectionCriteriaItem";
                             NewCell2.BorderWidth = 1;
                             NewCell2.BorderColor = System.Drawing.Color.LightBlue;
                             if (A % 2 == 0)
                             {
                                 NewRow.BackColor = System.Drawing.Color.LightYellow;
                             }
                             NewRow.Cells.Add(NewCell2);
                             QuestionTable.Rows.Add(NewRow);
                             //third cell
                            // NewCell3.Text = Q_Text + "<span style='color:red'><B>" + QuestionTypeText + "</B></span><span id='Response_text" + Q_No + "' style='color:black'></span>";
                             NewCell3.Text = Q_Text + "<span style='color:red'><B>" + QuestionTypeText + "</B></span></span>";
                             NewCell3.CssClass = "selectionCriteriaItem";
                             NewCell3.BorderWidth = 1;
                             NewCell3.BorderColor = System.Drawing.Color.LightBlue;
                             if (A % 2 == 0)
                             {
                                 NewRow.BackColor = System.Drawing.Color.LightYellow;
                             }
                             NewRow.Cells.Add(NewCell3);
                             QuestionTable.Rows.Add(NewRow);

                             NewCell4.Text = "<span style='color:black'><B>" + vPrompts[81] + "</B></span></span>";
                             NewCell3.Width = Unit.Percentage(50); 
                             NewCell4.CssClass = "selectionCriteriaItem";
                             NewCell4.BorderWidth = 1;
                             NewCell4.BorderColor = System.Drawing.Color.LightBlue;
                              
                             NewRow.Cells.Add(NewCell4);
                             QuestionTable.Rows.Add(NewRow);

                             C = 0;
                         }

                         //Answer type 
                         NewRow = new TableRow();
                         NewCell = new TableCell();
                         NewCell2 = new TableCell();
                         NewCell3 = new TableCell();
                         NewCell4 = new TableCell();

                         if (DisplayResponse == true)
                         {
                             NewCell.Text = "Ans";
                         }
                         NewCell.CssClass = "selectionCriteriaItem";
                         NewCell.BorderWidth = 1;
                         NewCell.BorderColor = System.Drawing.Color.LightBlue;
                         if (A % 2 == 0)
                         {
                             NewRow.BackColor = System.Drawing.Color.LightYellow;
                         }
                         NewRow.Cells.Add(NewCell);
                         //second cell
                         if (DisplayResponse == true)
                         {
                             NewCell2.Text = Q_No;
                         }
                         NewCell2.CssClass = "selectionCriteriaItem";
                         NewCell2.BorderWidth = 1;
                         NewCell2.BorderColor = System.Drawing.Color.LightBlue;
                         NewRow.Cells.Add(NewCell2);
                         QuestionTable.Rows.Add(NewRow);
                         //ElementName="rad_qno" & trim(DBrs("Q_No")) & ""
                         //Display the response for question 
                         //CheckButton.ID = "chk_qno" + Q_No + "," + Data_Required + "," + Ans_Val_High + "," + Ans_Val_Low;
                         if (Ans_Type == "C")
                         {
                            
                            
                             // listItem.Value = "22";
                             string Htmltext = "";
                             string ColID = "";
                             string ColText = "";
                             string ColAdd = "";
                             string ColName = "";
                             string SpanText="";
                             string HtmlResponsetext = "";
                             string Colvalue = "";
 
                             ColName = "ctl00$ContentPlaceHolder1$chk_qno" + Q_No + "";
                             ColID = "ctl00$ContentPlaceHolder1$chk_qno" + Q_No + "" + Ans_Val + "";
                             Colvalue = "chk_qno" + Q_No + "" + Ans_Val + "";
                             ColText = "<label for=" + ColID + "><span class='reportTableItem' style='color:red'><B>" + Ans_Val + "</B></span>.<span class='standardText'>" + Ans_Text + "</span></label>";
                            //ColAdd = "onclick=`submitonce('" + Nxt_Q_No + "','" + Q_No + "','" + A + "','" + Ans_Val_High + "','" + Ans_Val_Low + "','" + StrRTS + "');`";
                             SpanText = "<div style='border-top-width:thick;width:20px;float:left;' id='rad_Span" + Q_No + "" + C + "' class='reportTableItem'>";
                             ColAdd = String.Concat("onclick=", '"', "submitonce('", Nxt_Q_No, "','", Q_No, "','", A, "','", Ans_Val_High, "','", Ans_Val_Low, "','", StrRTS + "');", '"');
                             Htmltext = "<input id='" + ColID + "' type='checkbox' name='" + ColName + "' value='" + Colvalue + "'  " + ColAdd + "/>";
                             Htmltext="" + SpanText + "" + Htmltext + "";
                             Htmltext = "" + Htmltext + "</div><span style='color:red'><B>" + Ans_Val + "</B></span>." + Ans_Text + "";
                             //Htmltext = "" + Htmltext + "&nbsp&nbsp<b><span id='AnsResponse_" + Q_No + "" + Ans_Val + "' style='color:green'></span></b>";
                             HtmlResponsetext = "&nbsp&nbsp<b><span id='AnsResponse_" + Q_No + "" + Ans_Val + "' style='color:green'></span></b>";

                             //Response.Write ("Htmltext=" + Htmltext +"<BR>");
                             
                             NewCell3.Text = Htmltext;
                             NewCell3.Width = Unit.Percentage(50);
                             NewCell3.CssClass = "reportTableItem";
                             NewCell3.BorderWidth = 1;
                             NewCell3.BorderColor= System.Drawing.Color.LightBlue;

                             //NewCell3.Controls.Add(CheckButton);
                             
                             if (A % 2 == 0)
                             {
                                 NewRow.BackColor = System.Drawing.Color.LightYellow;
                             }
                             NewRow.Cells.Add(NewCell3);
                             QuestionTable.Rows.Add(NewRow);
                             NewCell4.Text = HtmlResponsetext;
                             NewCell4.Width = Unit.Percentage(50);
                             NewCell4.CssClass = "reportTableItem";
                             NewCell4.BorderWidth = 1;
                             NewCell4.BorderColor = System.Drawing.Color.LightBlue;

                             NewRow.Cells.Add(NewCell4);
                             QuestionTable.Rows.Add(NewRow);
                             EleAns_Val = "chk_qno" + Q_No + "-" + Ans_Val + "";
                             ElementName = "chk_qno" + Q_No + "";
                             AllHtmlElement = "chk_qno" + Q_No + "";
                             AllEleHighLow = "chk_qno" + Q_No + "-" + Ans_Val_High + "-" + Ans_Val_Low + "";
                             STREleSubmitRTS = "chk_qno" + Ans_Val + "" + Q_No + "";
                         }
                         if (Ans_Type == "L")
                         {
                             //RadioButtonList RadioButton = new RadioButtonList();
                             //ListItem item = new ListItem("<span style='color:red'><B>" + Ans_Val + "</B></span>." + Ans_Text + "", "" + Ans_Val + "");
                             //RadioButton.Items.Add(item);
                            // Response.Write("C=" + C + "<BR>");
                            // Response.Write("StrRTS=" + StrRTS + "<BR>");

                             RadioButton RadioBut = new RadioButton();
                             RadioBut.ID = "rad_qno" + Q_No + "" + Ans_Val + "";
                             RadioBut.GroupName = "rad_qno" + Q_No + ""; 
                             //RadioBut.Text = "<span style='color:red'><B>" + Ans_Val + "</B></span>." + Ans_Text + "";
                            // RadioBut.CssClass = "reportTableItem";
                           //  RadioBut.BorderWidth = 1;
                            // RadioBut.BorderColor = System.Drawing.Color.LightBlue;
                             //RadioBut.RenderBeginTag("");
                             

                             RadioBut.Attributes.Add("onclick", "submitonce('" + Nxt_Q_No + "','" + Q_No + "','" + A + "','" + Ans_Val_High + "','" + Ans_Val_Low + "','" + StrRTS + "')");
                             // RadioBut.Width = Unit.Percentage(100);
                             NewCell3.Controls.Add((new LiteralControl("<div id='rad_Span" + Q_No + "" + C + "' style='width:20px;float:left;' class='reportTableItem'>")));
                             NewCell3.Controls.Add(RadioBut);
                             NewCell3.Controls.Add((new LiteralControl("</div>")));
                             NewCell3.Width = Unit.Percentage(50);
                             NewCell3.BorderWidth = 1;
                             NewCell3.CssClass = "reportTableItem";
                             NewCell3.BorderColor = System.Drawing.Color.LightBlue;
                             if (A % 2 == 0)
                             {
                                 NewRow.BackColor = System.Drawing.Color.LightYellow;
                             }

                             NewCell3.Controls.Add((new LiteralControl("<span style='color:red'  ><B>" + Ans_Val + "</B></span>." + Ans_Text + "")));

                             //NewCell3.Attributes.Add("John", "4");
                             NewRow.Cells.Add(NewCell3);
                             QuestionTable.Rows.Add(NewRow);

                             NewCell4.Text = "&nbsp&nbsp<b><span id='AnsResponse_" + Q_No + "" + Ans_Val + "' style='color:green'></span></b>";
                             NewCell4.Width = Unit.Percentage(50);
                             NewCell4.CssClass = "reportTableItem";
                             NewCell4.BorderWidth = 1;
                             NewCell4.BorderColor = System.Drawing.Color.LightBlue;

                             NewRow.Cells.Add(NewCell4);
                             QuestionTable.Rows.Add(NewRow);
                             EleAns_Val = "rad_qno" + Q_No + "-" + Ans_Val + "";
                             ElementName = "rad_qno" + Q_No + "";
                             AllHtmlElement = "rad_qno" + Q_No + "";
                             AllEleHighLow = "rad_qno" + Q_No + "-" + Ans_Val_High + "-" + Ans_Val_Low + "";
                             STREleSubmitRTS = "rad_qno" + Ans_Val + "" + Q_No + "";
                         }
                         if (Ans_Type == "R")
                         {

                             RadioButton RadioBut1 = new RadioButton();

                             RadioBut1.ID = "rad_qno" + Q_No + "" + Ans_Val + "";
                             RadioBut1.GroupName = "rad_qno" + Q_No + "";
                             //RadioBut1.Text = "<span   style='color:red'><B>" + Ans_Val + "</B></span>." + Ans_Text + "";
                             //RadioBut1.CssClass = "reportTableItem";
                             //RadioBut1.BorderWidth = 1;
                             //RadioBut1.BorderColor = System.Drawing.Color.LightBlue;
                             RadioBut1.Attributes.Add("onclick", "submitonce('" + Nxt_Q_No + "','" + Q_No + "','" + A + "','" + Ans_Val_High + "','" + Ans_Val_Low + "','" + StrRTS + "')");
                             //RadioBut1.Width = Unit.Percentage(100);
                             NewCell3.Controls.Add((new LiteralControl("<div id='rad_Span" + Q_No + "" + C + "' style='width:20px;float:left;' class='reportTableItem'>")));
                             NewCell3.Controls.Add(RadioBut1);
                             NewCell3.Controls.Add((new LiteralControl("</div>")));
                             NewCell3.Width = Unit.Percentage(50);
                             NewCell3.BorderWidth = 1;
                             NewCell3.CssClass = "reportTableItem";
                             NewCell3.BorderColor = System.Drawing.Color.LightBlue;

                             if (A % 2 == 0)
                             {
                                 NewRow.BackColor = System.Drawing.Color.LightYellow;
                             }
                             NewCell3.Controls.Add((new LiteralControl("<span style='color:red'  ><B>" + Ans_Val + "</B></span>." + Ans_Text + "")));

                             NewRow.Cells.Add(NewCell3);
                             QuestionTable.Rows.Add(NewRow);

                             NewCell4.Text = "&nbsp&nbsp<b><span id='AnsResponse_" + Q_No + "" + Ans_Val + "' style='color:green'></span></b>";
                             NewCell4.Width = Unit.Percentage(50);
                             NewCell4.CssClass = "reportTableItem";
                             NewCell4.BorderWidth = 1;
                             NewCell4.BorderColor = System.Drawing.Color.LightBlue;

                             NewRow.Cells.Add(NewCell4);
                             QuestionTable.Rows.Add(NewRow);

                             EleAns_Val = "rad_qno" + Q_No + "-" + Ans_Val + "";
                             ElementName = "rad_qno" + Q_No + "";
                             AllHtmlElement = "rad_qno" + Q_No + "";
                             AllEleHighLow = "rad_qno" + Q_No + "-" + Ans_Val_High + "-" + Ans_Val_Low + "";
                             STREleSubmitRTS = "rad_qno" + Ans_Val + "" + Q_No + "";
                         }
                         if (Ans_Type == "T")
                         {

                           
                             if (A % 2 == 0)
                             {
                                 NewRow.BackColor = System.Drawing.Color.LightYellow;
                             }
                           
                             //onkeyup=""EnterText('" & CounterBoxName & "','txt_txt" & trim(DBrs("Q_No")) & "')"
                             TextBox Text = new TextBox();
                             Text.ID = "txt_txt" + Q_No + "";
                             if ((Lang_id == 2) || (Lang_id == 4))
                             {
                                 Text.MaxLength = 600;
                             }
                             else
                             {
                                 Text.MaxLength = 300;
                             }
                             Text.Width = 700;
                             //submitonce('004','001','0','0','0')"
                             Text.Attributes.Add("onchange", "submitonce('" + Nxt_Q_No + "','" + Q_No + "','" + A + "','" + Ans_Val_High + "','" + Ans_Val_Low + "','" + StrRTS + "')");
                             Text.Attributes.Add("onkeyup", "EnterText('ctl00$ContentPlaceHolder1$Counter" + Q_No + "','ctl00$ContentPlaceHolder1$txt_txt" + Q_No + "')");
                             NewCell3.Controls.Add(Text);
                             //Display the answer in the database table q_response_dtl 
                             //NewCell3.Controls.Add((new LiteralControl("&nbsp&nbsp<b><span id='AnsResponse_" + Q_No + "" + Ans_Val + "' style='color:green'></span></b>")));
                             NewCell3.Width = Unit.Percentage(50);
                             NewCell3.BorderWidth = 1;
                             NewCell3.CssClass = "reportTableItem";
                             NewCell3.BorderColor = System.Drawing.Color.LightBlue;
                             NewRow.Cells.Add(NewCell3);
                             QuestionTable.Rows.Add(NewRow);
                             NewCell3.Controls.Add((new LiteralControl("<br />")));

                              
                            
                             TextBox Text1 = new TextBox();
                             Label LabelText4 = new Label();
                             Text1.ID = "Counter" + Q_No + "";
                             Text1.Style.Value = "background-color: #E0E0E0";
                             Text1.Width = Unit.Percentage(3);
                             Text1.Enabled = false;

                             if ((Lang_id == 2)||(Lang_id == 4))
                             {
                                 NewCell3.Controls.Add((new LiteralControl("<font color='black' size='2'>Character Count - 600 maximum</font>")));
                             }
                             else
                             {
                                 NewCell3.Controls.Add((new LiteralControl("<font color='black' size='2'>Character Count - 300 maximum</font>")));
                             }
                             NewCell3.Controls.Add(Text1);
                             LabelText4.Text = "<font color=red size=2><b><I><BR></I></B></font>";
                             NewCell3.Controls.Add(LabelText4);
                           
                             NewRow.Cells.Add(NewCell3);
                             QuestionTable.Rows.Add(NewRow);

                             NewCell4.Text = "&nbsp&nbsp<b><span id='AnsResponse_" + Q_No + "" + Ans_Val + "' style='color:green'></span></b>";
                             NewCell4.Width = Unit.Percentage(50);
                             NewCell4.CssClass = "reportTableItem";
                             NewCell4.BorderWidth = 1;
                             NewCell4.BorderColor = System.Drawing.Color.LightBlue;

                             NewRow.Cells.Add(NewCell4);
                             QuestionTable.Rows.Add(NewRow);

                             EleAns_Val = "txt_txt" + Q_No + "-" + Ans_Val + "";
                             ElementName = "txt_txt" + Q_No + "";
                             AllHtmlElement = "txt_txt" + Q_No + "";
                             AllEleHighLow = "txt_txt" + Q_No + "-" + Ans_Val_High + "-" + Ans_Val_Low + "";
                             STREleSubmitRTS = "txt_txt" + Ans_Val + "" + Q_No + "";
                         }
                         if (Ans_Type == "N")
                         {
                             TextBox Text = new TextBox();

                             //Text.ID = "txt_num" + Q_No + "," + Data_Required + "," + Ans_Val_High + "," + Ans_Val_Low;
                             //submitonce('004','001','0','0','0')"
                             Text.MaxLength = 8;
                             Text.ID = "txt_num" + Q_No + "";
                             Text.Attributes.Add("onchange", "submitonce('" + Nxt_Q_No + "','" + Q_No + "','" + A + "','" + Ans_Val_High + "','" + Ans_Val_Low + "','" + StrRTS + "')");
                             Text.Attributes.Add("onkeypress", "return NumberOnly(event)");
                             Text.Width = 80;
                             NewCell3.Controls.Add(Text);
                             if (A % 2 == 0)
                             {
                                 NewRow.BackColor = System.Drawing.Color.LightYellow;
                             }
                             //Display the answer in the database table q_response_dtl 
                             //NewCell3.Controls.Add((new LiteralControl("&nbsp&nbsp<span id='AnsResponse_" + Q_No + "" + Ans_Val + "' style='color:green'></span>")));
                             NewCell3.Width = Unit.Percentage(50);
                             NewCell3.BorderWidth = 1;
                             NewCell3.CssClass = "reportTableItem";
                             NewCell3.BorderColor = System.Drawing.Color.LightBlue;
                             NewRow.Cells.Add(NewCell3);
                             QuestionTable.Rows.Add(NewRow);

                             NewCell4.Text = "&nbsp&nbsp<b><span id='AnsResponse_" + Q_No + "" + Ans_Val + "' style='color:green'></span></b>";
                             NewCell4.Width = Unit.Percentage(50);
                             NewCell4.CssClass = "reportTableItem";
                             NewCell4.BorderWidth = 1;
                             NewCell4.BorderColor = System.Drawing.Color.LightBlue;

                             NewRow.Cells.Add(NewCell4);
                             QuestionTable.Rows.Add(NewRow);

                             EleAns_Val = "txt_num" + Q_No + "-" + Ans_Val + "";
                             ElementName = "txt_num" + Q_No + "";
                             AllHtmlElement = "txt_num" + Q_No + "";
                             AllEleHighLow = "txt_num" + Q_No + "-" + Ans_Val_High + "-" + Ans_Val_Low + "";
                             STREleSubmitRTS = "txt_num" + Ans_Val + "" + Q_No + "";
                         }
                         if (Ans_Type == "D")
                         {
                             TextBox Text = new TextBox();
                             Label LabelText1 = new Label();
                             Text.ID = "txt_dat" + Q_No + "";
                             //submitonce('004','001','0','0','0')"
                             Text.Attributes.Add("onchange", "submitonce('" + Nxt_Q_No + "','" + Q_No + "','" + A + "','" + Ans_Val_High + "','" + Ans_Val_Low + "','" + StrRTS + "')");
                             Text.Attributes.Add("onkeypress", "return DateNumberOnly(event)");
                             Text.Width = 80;
                             Text.MaxLength = 12;
                             NewCell3.Controls.Add(Text);

                              LabelText1.Text = "<font color=red size=2><b><I>" + DateRule + "</I></B></font>";
                              NewCell3.Controls.Add(LabelText1);
                             if (A % 2 == 0)
                             {
                                 NewRow.BackColor = System.Drawing.Color.LightYellow;
                             }
                             //Display the answer in the database table q_response_dtl 
                             //NewCell3.Controls.Add((new LiteralControl("&nbsp&nbsp<b><span id='AnsResponse_" + Q_No + "" + Ans_Val + "' style='color:green'></span></b>")));
                             NewCell3.Width = Unit.Percentage(50);
                             NewCell3.BorderWidth = 1;
                             NewCell3.CssClass = "reportTableItem";
                             NewCell3.BorderColor = System.Drawing.Color.LightBlue;
                             NewRow.Cells.Add(NewCell3);
                             QuestionTable.Rows.Add(NewRow);

                             NewCell4.Text = "&nbsp&nbsp<b><span id='AnsResponse_" + Q_No + "" + Ans_Val + "' style='color:green'></span></b>";
                             NewCell4.Width = Unit.Percentage(50);
                             NewCell4.CssClass = "reportTableItem";
                             NewCell4.BorderWidth = 1;
                             NewCell4.BorderColor = System.Drawing.Color.LightBlue;

                             NewRow.Cells.Add(NewCell4);
                             QuestionTable.Rows.Add(NewRow);

                             EleAns_Val = "txt_dat" + Q_No + "-" + Ans_Val + "";
                             ElementName = "txt_dat" + Q_No + "";
                             AllHtmlElement = "txt_dat" + Q_No + "";
                             AllEleHighLow = "txt_dat" + Q_No + "-" + Ans_Val_High + "-" + Ans_Val_Low + "";
                             STREleSubmitRTS = "txt_dat" + Ans_Val + "" + Q_No + "";
                         }
                         if (Ans_Type == "P")
                         {
                             //Dollar box
                             TextBox TextDollar = new TextBox();
                             Label LabelText = new Label();
                             TextDollar.MaxLength = 8;
                             TextDollar.Width = 80;
                             TextDollar.ID = "txt_Dol" + Q_No + "";

                             TextDollar.Attributes.Add("onchange", "submitonce('" + Nxt_Q_No + "','" + Q_No + "','" + A + "','" + Ans_Val_High + "','" + Ans_Val_Low + "','" + StrRTS + "')");
                             TextDollar.Attributes.Add("onkeypress", "return NumberOnly(event)"); 
                             NewCell3.Controls.Add(TextDollar);
                             LabelText.Text = "<font color=red size=2><b><I>" + vPrompts[31] + "</I></B></font>";
                             NewCell3.Controls.Add(LabelText);
                             if (A % 2 == 0)
                             {
                                 NewRow.BackColor = System.Drawing.Color.LightYellow;
                             }
                             NewRow.Cells.Add(NewCell3);
                             QuestionTable.Rows.Add(NewRow);

                             //cent box
                             TextBox TextCent = new TextBox();
                             Label LabelText2 = new Label();
                             TextCent.ID = "txt_Cen" + Q_No + "";

                             TextCent.MaxLength = 2;
                             TextCent.Width = 40;
                             TextCent.Attributes.Add("onchange", "submitonce('" + Nxt_Q_No + "','" + Q_No + "','" + A + "','" + Ans_Val_High + "','" + Ans_Val_Low + "','" + StrRTS + "')");
                             TextCent.Attributes.Add("onkeypress", "return NumberOnly(event)"); 
                             NewCell3.Controls.Add(TextCent);
                             LabelText2.Text = "<font color=red size=2><b><I>" + vPrompts[32] + "</I></B></font>";
                             NewCell3.Controls.Add(LabelText2);
                             if (A % 2 == 0)
                             {
                                 NewRow.BackColor = System.Drawing.Color.LightYellow;
                             }
                             //Display the answer in the database table q_response_dtl 
                             //NewCell3.Controls.Add((new LiteralControl("&nbsp&nbsp<b><span id='AnsResponse_" + Q_No + "" + Ans_Val + "' style='color:green'></span></b>")));
                             NewCell3.Width = Unit.Percentage(50);
                             NewCell3.BorderWidth = 1;
                             NewCell3.CssClass = "reportTableItem";
                             NewCell3.BorderColor = System.Drawing.Color.LightBlue;
                             NewRow.Cells.Add(NewCell3);
                             QuestionTable.Rows.Add(NewRow);


                             NewCell4.Text = "&nbsp&nbsp<b><span id='AnsResponse_" + Q_No + "" + Ans_Val + "' style='color:green'></span></b>";
                             NewCell4.Width = Unit.Percentage(50);
                             NewCell4.CssClass = "reportTableItem";
                             NewCell4.BorderWidth = 1;
                             NewCell4.BorderColor = System.Drawing.Color.LightBlue;

                             NewRow.Cells.Add(NewCell4);
                             QuestionTable.Rows.Add(NewRow);


                             EleAns_Val = "txt_Dol" + Q_No + "-" + Ans_Val + "|txt_Cen" + Q_No + "-" + Ans_Val + "";
                             ElementName = "txt_Dol" + Q_No + "|txt_Cen" + Q_No + "";
                             AllHtmlElement = "txt_Dol" + Q_No + "-txt_Cen" + Q_No + "";
                             AllEleHighLow = "txt_Dol" + Q_No + "-" + Ans_Val_High + "-" + Ans_Val_Low + "|txt_Cen" + Q_No + "-" + Ans_Val_High + "-" + Ans_Val_Low + "";
                             STREleSubmitRTS = "txt_Dol" + Ans_Val + "" + Q_No + "|txt_Cen" + Ans_Val + "" + Q_No + "";
                         }
                         if (Ans_Type == "M")
                         {
                             //feet box
                             TextBox TextFeet = new TextBox();
                             Label LabelText = new Label();
                             TextFeet.MaxLength = 8;
                             TextFeet.Width = 80;
                             TextFeet.ID = "txt_Fee" + Q_No + "";
                             TextFeet.Attributes.Add("onchange", "submitonce('" + Nxt_Q_No + "','" + Q_No + "','" + A + "','" + Ans_Val_High + "','" + Ans_Val_Low + "','" + StrRTS + "')");
                             TextFeet.Attributes.Add("onkeypress", "return NumberOnly(event)"); 
                             NewCell3.Controls.Add(TextFeet);
                             LabelText.Text = "<font color=red size=2><b><I>" + vPrompts[33] + "</I></B></font>";
                             NewCell3.Controls.Add(LabelText);
                             if (A % 2 == 0)
                             {
                                 NewRow.BackColor = System.Drawing.Color.LightYellow;
                             }
                             NewRow.Cells.Add(NewCell3);
                             QuestionTable.Rows.Add(NewRow);

                             //Inche box
                             TextBox TextInche = new TextBox();
                             Label LabelText2 = new Label();
                             TextInche.ID = "txt_Inc" + Q_No + "";
                             TextInche.MaxLength = 2;
                             TextInche.Width = 40;
                             TextInche.Attributes.Add("onchange", "submitonce('" + Nxt_Q_No + "','" + Q_No + "','" + A + "','" + Ans_Val_High + "','" + Ans_Val_Low + "','" + StrRTS + "')");
                             TextInche.Attributes.Add("onkeypress", "return NumberOnly(event)"); 
                             NewCell3.Controls.Add(TextInche);
                             LabelText2.Text = "<font color=red size=2><b><I>" + vPrompts[34] + "</I></B></font>";
                             NewCell3.Controls.Add(LabelText2);
                             if (A % 2 == 0)
                             {
                                 NewRow.BackColor = System.Drawing.Color.LightYellow;
                             }
                             //Display the answer in the database table q_response_dtl 
                             //NewCell3.Controls.Add((new LiteralControl("&nbsp&nbsp<b><span id='AnsResponse_" + Q_No + "" + Ans_Val + "' style='color:green'></span></b>")));
                             NewCell3.Width = Unit.Percentage(50);
                             NewCell3.BorderWidth = 1;
                             NewCell3.CssClass = "reportTableItem";
                             NewCell3.BorderColor = System.Drawing.Color.LightBlue;
                             NewRow.Cells.Add(NewCell3);
                             QuestionTable.Rows.Add(NewRow);


                             NewCell4.Text = "&nbsp&nbsp<b><span id='AnsResponse_" + Q_No + "" + Ans_Val + "' style='color:green'></span></b>";
                             NewCell4.Width = Unit.Percentage(50);
                             NewCell4.CssClass = "reportTableItem";
                             NewCell4.BorderWidth = 1;
                             NewCell4.BorderColor = System.Drawing.Color.LightBlue;

                             NewRow.Cells.Add(NewCell4);
                             QuestionTable.Rows.Add(NewRow);

                             EleAns_Val = "txt_Fee" + Q_No + "-" + Ans_Val + "|txt_Inc" + Q_No + "-" + Ans_Val + "";
                             ElementName = "txt_Fee" + Q_No + "|txt_Inc" + Q_No + "";
                             AllHtmlElement = "txt_Fee" + Q_No + "-txt_Inc" + Q_No + "";
                             AllEleHighLow = "txt_Fee" + Q_No + "-" + Ans_Val_High + "-" + Ans_Val_Low + "|txt_Inc" + Q_No + "-" + Ans_Val_High + "-" + Ans_Val_Low + "";
                             STREleSubmitRTS = "txt_Fee" + Ans_Val + "" + Q_No + "|txt_Inc" + Ans_Val + "" + Q_No + "";
                         }
                         if (Ans_Type == "H")
                         {
                             //Hour box
                             TextBox TextHour = new TextBox();
                             Label LabelText = new Label();
                             TextHour.MaxLength = 8;
                             TextHour.Width = 80;
                             TextHour.ID = "txt_Hou" + Q_No + "";
                             TextHour.Attributes.Add("onchange", "submitonce('" + Nxt_Q_No + "','" + Q_No + "','" + A + "','" + Ans_Val_High + "','" + Ans_Val_Low + "','" + StrRTS + "')");
                             TextHour.Attributes.Add("onkeypress", "return NumberOnly(event)"); 
                             NewCell3.Controls.Add(TextHour);
                             LabelText.Text = "<font color=red size=2><b><I>" + vPrompts[35] + "</I></B></font>";
                             NewCell3.Controls.Add(LabelText);
                             if (A % 2 == 0)
                             {
                                 NewRow.BackColor = System.Drawing.Color.LightYellow;
                             }
                             NewRow.Cells.Add(NewCell3);
                             QuestionTable.Rows.Add(NewRow);

                             //Minute box
                             TextBox TextMinute = new TextBox();
                             Label LabelText2 = new Label();
                             TextMinute.MaxLength = 2;
                             TextMinute.Width = 40;
                             TextMinute.ID = "txt_Min" + Q_No + "";
                             TextMinute.Attributes.Add("onchange", "submitonce('" + Nxt_Q_No + "','" + Q_No + "','" + A + "','" + Ans_Val_High + "','" + Ans_Val_Low + "','" + StrRTS + "')");
                             TextMinute.Attributes.Add("onkeypress", "return NumberOnly(event)"); 
                             NewCell3.Controls.Add(TextMinute);
                             LabelText2.Text = "<font color=red size=2><b><I>" + vPrompts[36] + "</I></B></font>";
                             NewCell3.Controls.Add(LabelText2);
                             if (A % 2 == 0)
                             {
                                 NewRow.BackColor = System.Drawing.Color.LightYellow;
                             }
                             //Display the answer in the database table q_response_dtl 
                             //NewCell3.Controls.Add((new LiteralControl("&nbsp&nbsp<b><span id='AnsResponse_" + Q_No + "" + Ans_Val + "' style='color:green'></span></b>")));
                             NewCell3.Width = Unit.Percentage(50);
                             NewCell3.BorderWidth = 1;
                             NewCell3.CssClass = "reportTableItem";
                             NewCell3.BorderColor = System.Drawing.Color.LightBlue;
                             NewRow.Cells.Add(NewCell3);
                             QuestionTable.Rows.Add(NewRow);

                             NewCell4.Text = "&nbsp&nbsp<b><span id='AnsResponse_" + Q_No + "" + Ans_Val + "' style='color:green'></span></b>";
                             NewCell4.Width = Unit.Percentage(50);
                             NewCell4.CssClass = "reportTableItem";
                             NewCell4.BorderWidth = 1;
                             NewCell4.BorderColor = System.Drawing.Color.LightBlue;

                             NewRow.Cells.Add(NewCell4);
                             QuestionTable.Rows.Add(NewRow);

                             EleAns_Val = "txt_Hou" + Q_No + "-" + Ans_Val + "|txt_Min" + Q_No + "-" + Ans_Val + "";
                             ElementName = "txt_Hou" + Q_No + "|txt_Min" + Q_No + "";
                             AllHtmlElement = "txt_Hou" + Q_No + "-txt_Min" + Q_No + "";
                             AllEleHighLow = "txt_Hou" + Q_No + "-" + Ans_Val_High + "-" + Ans_Val_Low + "|txt_Min" + Q_No + "-" + Ans_Val_High + "-" + Ans_Val_Low + "";
                             STREleSubmitRTS = "txt_Hou" + Ans_Val + "" + Q_No + "|txt_Min" + Ans_Val + "" + Q_No + "";
                         }
                         // Response.Write("ElementName=" + ElementName + "<BR>");
                         if (Questiontext == true)
                         {

                             All_ElementName = All_ElementName.Trim() + ElementName.Trim() + "|";
                             ArrayAllHtmlElement = ArrayAllHtmlElement.Trim() + AllHtmlElement.Trim() + "|";
                             ArrayAllQuestionsElement = ArrayAllQuestionsElement.Trim() + AllQuestionsElement + "|";
                             ArrayEleSubmit = ArrayEleSubmit.Trim() + AllEleHighLow.Trim() + "|";
                             //ArrayEleSubmitRTS = ArrayEleSubmitRTS.Trim() + STREleSubmitRTS.Trim() + "|"; 
                             //Response.Write("ArrayAllQuestionsElement=" + ArrayAllQuestionsElement + "<BR>");
                         }
                         if (LoopQ_no == Q_No)
                         {
                             DisplayResponse = false;
                             Questiontext = false;

                         }

                         B = B + 1;
                         C = C + 1;
                         All_EleAns_Val = All_EleAns_Val.Trim() + EleAns_Val.Trim() + "|";
                         ArrayEleSubmitRTS = ArrayEleSubmitRTS.Trim() + STREleSubmitRTS.Trim() + "-";

                     }//End of foreach (DataRow myRow in dt.Rows)
                     //Response.Write("All_ElementName=" + All_ElementName + "<BR>");
                     // Response.Write("ArrayAllHtmlElement=" + ArrayAllHtmlElement + "<BR>");
                     //Response.Write("ArrayAllQuestionsElement=" + ArrayAllQuestionsElement + "<BR>");
                     // Response.Write("ArrayEleSubmit=" + ArrayEleSubmit + "<BR>");
                     // Response.Write("ArrayEleSubmitRTS=" + ArrayEleSubmitRTS + "<BR>");
                     ArrayRTS_Q_no = "";
                     //******************* Get RTS
                     DataTable dt1 = Get_CFRTS_Issue(Job_No, Wave_No, Task_No, store_id);
                     Procedure_CFRTS_Issue = "Job_No=" + Job_No + ",Wave_No=" + Wave_No + ",Task_No=" + Task_No + ",store_id=" + store_id + "";
                     foreach (DataRow RTSRow in dt1.Rows)
                     {
                         RTS_Q_No = Convert.ToString(RTSRow["Q_No"]);
                         ArrayRTS_Q_no = ArrayRTS_Q_no + "" + RTS_Q_No + ",";
                     }

                 } //end of rows.count
           }//if (CheckErrorMessage!="N")
          // Response.Flush();

         
                

   }
    #endregion
    #region SystemPromptandRule

   private void GetPromptTranslation()
    {
            vPrompts = new string[83];
            vPrompts[0]="Internet Call Form";
            vPrompts[1]="Date:";
            vPrompts[2]="Job No.";
            vPrompts[3]="Wave No.";
            vPrompts[4]="Task No.";
            vPrompts[5]="Chain No.";
            vPrompts[6]="Store No.";
            vPrompts[7]="Show Job Information";
            vPrompts[8]="Page Numbers";
            vPrompts[9]="Product";
            vPrompts[10]="Questions";
            vPrompts[11]="(Multiple answers allowed)";
            vPrompts[12]="(Only one answer allowed)";
            vPrompts[13]="(Enter a numeric value)";
            vPrompts[14]="(Enter a valid text)";
            vPrompts[15]="(Enter a date in mm/dd/yy format)";
            vPrompts[16]="QNo.";
            vPrompts[17]="(Multiple answers allowed)";
            vPrompts[18]="(Only one answer allowed)";
            vPrompts[19]="(mm/dd/yy)";
            vPrompts[20]="Submit";
            vPrompts[21]="The Next Product for this Job, Wave, task, store, and Chain can not be access at this time.";
            vPrompts[22]="Please try after an hour.!";
            vPrompts[23]="No questions setup for this Job, Wave, and Tasks";
            vPrompts[24]="2001 SPAR Group, Inc. ";
            vPrompts[25]="All Rights Reserved.";
            vPrompts[26]="The Information for this Job, Wave, and task cannot be access at this time.";
            vPrompts[27]="Please logout and log back in again after an hour.";
            vPrompts[28]="If you are still having problems please call your DMM.!";
            vPrompts[29]="Ans";
            vPrompts[30]="Back";
            vPrompts[31]="Dollar(s)";
            vPrompts[32]="Cent(s)";
            vPrompts[33]="Feet(s)";
            vPrompts[34]="Inche(s)";
            vPrompts[35]="Hour(s)";
            vPrompts[36]="Minute(s)";
            vPrompts[37]="Save";
            vPrompts[38]="Print";

            vPrompts[39]="The question";//0
            vPrompts[40]="has to be numeric.";//1
            vPrompts[41]="value has to be bigger or equal to";//2
            vPrompts[42]="value has to be less or equal to";//3
            vPrompts[43]="Please answer";//4
            vPrompts[44]="Please enter a valid date for question";//5
            vPrompts[45]="Please enter a valid Date";//6
            vPrompts[46]="You must enter both values for question";//7
            vPrompts[47]="Dollar(s) value has to be numeric";//8
            vPrompts[48]="Dollar(s) value can not have a period";//9
            vPrompts[49]="Cent(s) value can not be bigger than 99 cent";//10
            vPrompts[50]="Cent(s) value has to be numeric";//11
            vPrompts[51]="Cent(s) value can not have a period";//12
            vPrompts[52]="Feet(s) value has to be numeric";//13
            vPrompts[53]="Feet(s) value can not have a period";//14
            vPrompts[54]="Inche(s) value can not be bigger than 11";//15
            vPrompts[55]="Inche(s) value can not be less than 0";//16
            vPrompts[56]="Inche(s) value has to be numeric";//17
            vPrompts[57]="Inche(s) value can not have a period";//18
            vPrompts[58]="Hour(s) value has to be numeric";//19
            vPrompts[59]="Hour(s) value can not have a period";//20
            vPrompts[60]="Minute(s) value can not be bigger than 59";//21
            vPrompts[61]="Minute(s) value can not be less than 0";//22
            vPrompts[62]="Minute(s) value has to be numeric";//23
            vPrompts[63]="Minute(s) value can not have a period";//24
            vPrompts[64]="This is an incorrect response to this question.";//25
            vPrompts[65]="Cent(s) value can not be less than zero.";//26
            vPrompts[66]="must be a whole number.";//27
            vPrompts[67]="Invalid value entered for question";//28
            vPrompts[68] = "value can not be less than 0";//29
            vPrompts[69] = "Visit Date";
            vPrompts[70] = "Time In";
            vPrompts[71] = "Time out";
            vPrompts[72] = "Total Minutes";
            vPrompts[73] = "(Multiple answers allowed)";
            vPrompts[74] = "(Only one answer allowed)";
            vPrompts[75] = "(Only one answer allowed)";
            vPrompts[76] = "(Enter a numeric value)";
            vPrompts[77] = "(Enter a valid text)";
            vPrompts[78] = "(Enter a date in mm/dd/yy format)";
            vPrompts[79] = "Total Mileage";
            vPrompts[80] = "Total Drive"; 
            vPrompts[81] = "Response";
            vPrompts[82] = "There are no responses reported for this visit.";
       

            //Response.Write("DateRule=" + DateRule);
        ptAppTranslation.DoArrayPromptTranslation(vPrompts);


    }
    private DataTable GetSystemRules()
    {
        DataTable appDT = new DataTable();
        string[] VRule;
        VRule = new string[9];
        VRule[0] = "Name Format";
        VRule[1] = "New Date Format";
        VRule[2] = "Collect Mobile Email";
        VRule[3] = "SPAR Logo";
        VRule[4] = "SPAR Copyright";
        VRule[5] = "Address Format";
        VRule[6] = "Measurement_Val";
        VRule[7] = "Measurement";
        VRule[8] = "Decimal Points";
        appDT = AppSysRules.Get_RuleValue_ByDescAsDataTable(VRule, WebAppClass.LanguageId, WebAppClass.CurrentSQLDBConnection);
        return appDT;
    }

    #endregion
    #region Procedures
    //************* Function to get the JWT info


    private DataTable Get_CFJWTQuestion(String Job_No, String Wave_No, String Task_No, String Store_id, String Prod_Specific, String Work_Type_Id, String SS_Callform, String Prod_UPC)
    {
        Int32 iTempJob_No = 0;
        Int32 iTempWave_No = 0;
        Int32 iTempTask_No = 0;
        Int32 iTempStore_id = 0;
        Int32 iTempWork_Type_Id = 0;

        iTempJob_No = AppUtils.ConvertToInteger32(Job_No, 0);
        iTempWave_No = AppUtils.ConvertToInteger32(Wave_No, 0);
        iTempTask_No = AppUtils.ConvertToInteger32(Task_No, 0);
        iTempStore_id = AppUtils.ConvertToInteger32(Store_id, 0);
        iTempWork_Type_Id = AppUtils.ConvertToInteger32(Work_Type_Id, 0);
        //iTempCellProvider = AppUtils.ConvertToInteger32(CellProvider, 0);
       // iTempHidden_PhoneStatus = AppUtils.ConvertToInteger32(Hidden_PhoneStatus, 0);

        return AppData.Get_USP_JWT_Call_Form(iTempJob_No, iTempWave_No, iTempTask_No, iTempStore_id, Prod_Specific, iTempWork_Type_Id, SS_Callform, Prod_UPC, WebAppClass.CurrentSQLDBConnection);
    }

    

    private DataTable Get_CFRTS_Issue(String Job_No, String Wave_No, String Task_No, String Store_id)
    {
        Int32 iTempJob_No = 0;
        Int32 iTempWave_No = 0;
        Int32 iTempTask_No = 0;
        Int32 iTempStore_id = 0;
  

        iTempJob_No = AppUtils.ConvertToInteger32(Job_No, 0);
        iTempWave_No = AppUtils.ConvertToInteger32(Wave_No, 0);
        iTempTask_No = AppUtils.ConvertToInteger32(Task_No, 0);
        iTempStore_id = AppUtils.ConvertToInteger32(Store_id, 0);
         
        //iTempCellProvider = AppUtils.ConvertToInteger32(CellProvider, 0);
        // iTempHidden_PhoneStatus = AppUtils.ConvertToInteger32(Hidden_PhoneStatus, 0);

        return AppData.Get_USP_Call_Form_RTS_Issues(iTempJob_No, iTempWave_No, iTempTask_No, iTempStore_id, WebAppClass.CurrentSQLDBConnection);
    }
    private DataTable Get_JWT_VisitDate_Check(String Job_No, String Wave_No, String Task_No, String Store_id, String Visit_Date, String Str_Merch_no)
    {
           Int32 iTempJob_No = 0;
           Int32 iTempWave_No = 0;
           Int32 iTempTask_No = 0;
           Int32 iTempStore_id = 0;
           Int32 iTempMerch_no = 0;
  
          iTempJob_No = AppUtils.ConvertToInteger32(Job_No, 0);
          iTempWave_No = AppUtils.ConvertToInteger32(Wave_No, 0);
          iTempTask_No = AppUtils.ConvertToInteger32(Task_No, 0);
          iTempStore_id = AppUtils.ConvertToInteger32(Store_id, 0);
          iTempMerch_no = AppUtils.ConvertToInteger32(Str_Merch_no, 0);

          return AppData.Get_JWT_VisitDate_CheckClass(iTempJob_No, iTempWave_No, iTempTask_No, iTempStore_id, Visit_Date, iTempMerch_no, WebAppClass.CurrentSQLDBConnection);
    }
    private DataTable Get_CF_Answers(Int32 Lang_id, String Job_No, String Wave_No, String Task_No, String Store_id, String Visit_Date, String Str_Merch_no)
    {
        Int32 iTempJob_No = 0;
        Int32 iTempWave_No = 0;
        Int32 iTempTask_No = 0;
        Int32 iTempStore_id = 0;
        Int32 iTempMerch_no = 0;

        iTempJob_No = AppUtils.ConvertToInteger32(Job_No, 0);
        iTempWave_No = AppUtils.ConvertToInteger32(Wave_No, 0);
        iTempTask_No = AppUtils.ConvertToInteger32(Task_No, 0);
        iTempStore_id = AppUtils.ConvertToInteger32(Store_id, 0);
        iTempMerch_no = AppUtils.ConvertToInteger32(Str_Merch_no, 0);

        return AppData.Get_USP_CF_AnswerBack(Lang_id, iTempJob_No, iTempWave_No, iTempTask_No, iTempStore_id, iTempMerch_no, Visit_Date, WebAppClass.CurrentSQLDBConnection);
    }
    private DataTable Get_Start_time()
    {

        return AppData.Get_Start_timeClass(WebAppClass.CurrentSQLDBConnection);
    }

    //Get_CFMerchCellPhoneInsert
    #endregion
    #region methods
    private string FunDate_Format(int EnterMonth, int EnterDay, string EnterYear, int ShowType, string DateRule, string Date_input)
    {


        string[] ArrayDateRuleF;
        int f, StrMonth, StrDay;
        string StrTodayDate, StrYear;
        StrTodayDate = "";
        
        ArrayDateRuleF = new string[3];
        ArrayDateRuleF = DateRule.Split(Date_input.ToCharArray());
        //DateRule
        for (f = 0; f < ArrayDateRuleF.Length; f++)
        {

            if (ArrayDateRuleF[f].ToUpper() == ("mm").ToUpper())
            {
                StrMonth = EnterMonth;
                StrTodayDate = StrTodayDate + "" + StrMonth;
            }
            if (ArrayDateRuleF[f].ToUpper() == ("dd").ToUpper())
            {
                StrDay = EnterDay;
                StrTodayDate = StrTodayDate + "" + StrDay;
            }
            if (ArrayDateRuleF[f].ToUpper() == ("yyyy").ToUpper())
            {
                StrYear =  EnterYear ;

                StrTodayDate = StrTodayDate + "" + StrYear;
            }
            if (ArrayDateRuleF[f].ToUpper() == ("yy").ToUpper())
            {
                StrYear = EnterYear;
                if (string.IsNullOrEmpty(StrYear) == false)
                {
                        
                        if (StrYear.Length > 3)
                        {
                             StrYear = StrYear.Substring(2, 2);
                        }
                }
                StrTodayDate = StrTodayDate + "" + StrYear;
            }

            if (f != 2)
            {
                StrTodayDate = StrTodayDate + "" + "" + Date_input + "";
            }
        }

        return StrTodayDate;
        //return (int)returnVal;
    }
    private string CalVisit_Time(int EnterMonth, int EnterDay, int EnterYear, string TimeIn, string TimeOut, string Str_rad_q_Past_Midnight)
    {
        string EnterDate, StrTimeInVisit, StrTimeIOutVisit, StrVisit_time;
        DateTime Visit_Date_TimeIn, Visit_Date_TimeOut;

        EnterDate = Convert.ToString(EnterMonth) + "/" + Convert.ToString(EnterDay) + "/" + Convert.ToString(EnterYear) + "";

        StrTimeInVisit = EnterDate + " " + TimeIn + "";
        StrTimeIOutVisit = EnterDate + " " + TimeOut + "";

        Visit_Date_TimeIn = Convert.ToDateTime(StrTimeInVisit);
        Visit_Date_TimeOut = Convert.ToDateTime(StrTimeIOutVisit);

        //Job passed midnight meaning after 12 AM
        if (Str_rad_q_Past_Midnight == "0")
        {
            Visit_Date_TimeOut = Visit_Date_TimeOut.AddDays(1);
        }

        TimeSpan DifferntDate = Visit_Date_TimeOut.Subtract(Visit_Date_TimeIn);
        StrVisit_time = DifferntDate.TotalMinutes.ToString();               

       // Response.Write("Visit_Date_TimeIn=" + Visit_Date_TimeIn + "<BR>");
       // Response.Write("Visit_Date_TimeOut=" + Visit_Date_TimeOut + "<BR>");

        return StrVisit_time;
        //return (int)returnVal;
    }
    #endregion

}
