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

public partial class CFProductCallFormConfirmation : System.Web.UI.Page
{
    protected string user_id, Email_Active_Flag, Str_Merch_no, Job_No, Wave_No, Task_No, Chain_No, Store_No, txt_EmailAdd, txt_Mobile_Email, POutOfStock_no, Error_Message, Error_Flag, HTMLHeader_info, Collect_Mobile_Email, AddressRule, NameRule, DateRule;
    protected int Error_Message_Flag, BusinessQuestion_Flag, OutOfStock_no, Back_Slash, Dot, Dash, ShowType, Lang_id;
    protected string store_id, Store_Chain_Desc, Store_Store_Name, Store_Street_Addr, Store_City, Store_State, Store_Zip, Data_Required, MeasurementValue, Decimal_Point;
    protected string PMerch_no, CA_merch_no, Merch_First_Name, Merch_Last_Name, Merch_Street_Addr, Merch_Street_Addr2, EnterVisitDate, ProdAnsForNextPage, NewScreenPage;
    protected string Merch_City, Merch_State, Merch_Zip, Merch_Phone_No, Merch_Email_Addr, Task_Desc, Task_Addtl_Desc, CellPhoneNo, Str_Back_RTSAnswers, Str_Visit_Dt_add, LinkPath, RTS_Link_Access, SparToolLink;
    protected string Field_Start_Dt, Field_end_Dt, Key_Comp_Dt, DOA_Dt, Job_Type, Business_Type_id, Work_Type_id, Work_Type_Desc, Max_Mx_Per_Store, CUserId, CIPAddr, IP_address;
    protected string Max_Visit_Per_Store_Mx, visit_no, Collect_iVR_Time, night_visits, Mileage_flag, Travel_flag, Data_Col_Method, StrRTSAnswers, AnswersAllFromGrid, AnswersForMenuColor, ProductElementAll;
    protected string All_Data_Received, qdef_skippattern, Collect_Header, Collect_Call_Form, SS_Callform, Prod_Specific, overwritetime, Prod_UPC;
    protected string collect_time_only, Ask_Q_HH_Used, HH_Status_Flag, Collect_Store_Mgr_Name, Product_Check_Flag, Ask_EShelf_Question, Product_Type;
    protected string Call_Form_Type_No, Est_instore_minutes, Business_Rule_Eckerd, Eckerd_Job_Last_question, Bus_Rule22_Photo, ArrayEleSubmit, Warning_Message, confirmation_no;
    protected string Bus_Rule5_Question, Bus_Rule6_Question, Bus_Rule28_Question, Bus_Rule3_Question, Bus_Rule4_Question, Bus_Rule7_Question, Product_Required;
    protected string JWTInfoText, UseTheCallForm, PhotoButton, Nextbutton, return_Message, Excute_SQL, Merch_Message, No_Question_avaliable, TotalProdCount;
    protected string Date_input, VarDay, Varmonth, StrYear, VarSelect_AM, VarSelect_PM, Strcmb_timein, TodayDate, YearDisplay, All_EleAns_Val, NoNextButton;
    protected string txt_timein_hrsVal, txt_timein_minVal, txt_timeout_hrsVal, txt_timeout_minVal, Visit_Date, txt_Phone1, txt_Phone2, txt_Phone3, CellProvider, Hidden_PhoneStatus;
    protected string Q_No, Q_Text, Q_Text_Short, Q_Type, Ans_Type, Grid_No, skippattern_status, RTS_JWT, STR_RTS_JWT, Used_qty, ShortCallForm, Str_User_id;
    protected string Uniq_Ques_Id, stores_specified, prod_upc, prod_activity_id, skip_flag, ElementName, All_ElementName, ArrayAllHtmlElement, ArrayAllQuestionsElement, RTS_Q_No, ArrayRTS_Q_no;
    protected string Prod_Id, Ans_Val, Ans_Text, Nxt_Q_No, Remark, Response_Text_Flag, Ans_Val_High, Ans_Val_Low, JWT, EleAns_Val, JWTInfoRTS, DisplayHeaderInfo, HTMLReportText;
    protected string Str_VisitMonth, Str_visitday, Str_visityear, Str_timein_hrs, Str_timein_min, Str_cmb_timein, Str_timeout_hrs, Str_timeout_min, Str_cmb_timeout;
    protected string Str_txt_mileage, Str_txt_drive, Str_rad_q_Past_Midnight, Str_rad_q_HH_Used, Str_rad_q_Ret_store_visit, Str_Manager_Title, Str_txt_Manager_name;
    protected string Str_Radio_EShelf, Str_Ask_EShelf_Question, Str_Bus_Rule3_Question, Str_rad_q_BR3, Str_Bus_Rule4_Question, Str_rad_q_BR4, Str_Bus_Rule5_Question;
    protected string Str_rad_q_BR5, Str_Bus_Rule6_Question, Str_rad_q_BR6, Str_Bus_Rule7_Question, Str_rad_q_BR7, Str_Bus_Rule28_Question, Str_rad_q_BR28, CheckErrorMessage, chainstorelstSA, selchainstoreSA,Str_Sv_Panel_id;
    public string[] vPrompts;
    public DateTime StrDate;
    protected string Star_time, InformationDisplay, DisplayJWTInfo, ShowJWTCheckboxText, STREleSubmitRTS, ArrayEleSubmitRTS, Photo_Q_No, Photo_By_QuestionFlag;
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

        ptAppTranslation = new PromptTranslation("CFGridConfirmation.aspx", WebAppClass.PromptsLanguageId.ToString(), WebAppClass.LanguageId, WebAppClass.CurrentSQLDBConnection, WebAppClass.MultiLanguageCount);
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
        //Response.Write("look");
    }

    #endregion

    protected void Page_Load(object sender, EventArgs e)
    {
        try
          {
                        WebAppClass.Set_MerchforForm(this.Merch_no, Convert.ToString(WebAppClass.MerchNo));
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

                        RTS_Link_Access = RuleTab.Rows[9][2].ToString();
                        //Response.Write("RTS_Link_Access=" + RTS_Link_Access);  
                        LinkPath = RuleTab.Rows[10][2].ToString();
                        LinkPath = "http://" + LinkPath + "";

                        //****** Prompts
                        GetPromptTranslation();

                        //****** Spar link
                        StringBuilder HTMLTextlink = new StringBuilder();

                        HTMLTextlink.Append("<table   align='center' border='0' >");
                        HTMLTextlink.Append("<tr>");
                        HTMLTextlink.Append("<td align='center'   width='100%'><a  class='hyperlinkmasterpage' href='" + LinkPath + "'>" + vPrompts[18] + "</a>");
                        HTMLTextlink.Append("</td>");
                        HTMLTextlink.Append("</tr>");
                        HTMLTextlink.Append("</table>");

                        SparToolLink= HTMLTextlink.ToString();

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
                        NewScreenPage = Request.Form["NewScreenPage"];
                        //Response.Write("NewMerchPage=" + NewMerchPage);
                        chainstorelstSA = Request.Form["chainstorelstSA"];
                        selchainstoreSA = Request.Form["selchainstoreSA"];

                        Star_time = Request.Form["Star_time"];
                        // Response.Write("Star_time=" + Star_time);
                        Lang_id = WebAppClass.LanguageId;
                        //Response.Write(Lang_id);
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
                        //Response.Write("visit_no=" + visit_no + "<BR>");

                        Collect_iVR_Time = Request.Form["Collect_iVR_Time"];
                        night_visits = Request.Form["night_visits"];
                        Mileage_flag = Request.Form["Mileage_flag"];
                        Travel_flag = Request.Form["Travel_flag"];

                        Job_Type = Request.Form["Job_Type"];
                        Business_Type_id = Request.Form["Business_Type_id"];

                        Work_Type_id = Request.Form["Work_Type_id"];
                        Work_Type_Desc = Request.Form["Work_Type_Desc"];

                        Data_Col_Method = Request.Form["Data_Col_Method"];
                        //Response.Write("Data_Col_Method=" + Data_Col_Method + "<BR>");

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
                         //Response.Write("Str_txt_drive=" + Str_txt_drive + "<BR>");

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
                        //Response.Write("Str_txt_Manager_name=" + Str_txt_Manager_name + "<BR>");
                       
                        Str_User_id = WebAppClass.LoggedUserId;
                        //Response.Write("Str_User_id=" + Str_User_id + "<BR>");

                        Visit_Date = Request.Form["Visit_Date"];
                       // Response.Write("Visit_Date=" + Visit_Date + "<BR>");

                        Str_Sv_Panel_id = Request.Form["Str_Sv_Panel_id"];
                        //****************************** Visit date 
                        string Visit_time, Time_IN_date, Time_Out_date, VisitDateDisplay, CalTimeIn, CalTimeOut, Mon_add, Day_add, Year_add;
                        string[] ArrayDate_add; 
                      

                            //Visit_Date = clsDateFormat.FunDate_Format(Convert.ToInt32(Str_VisitMonth), Convert.ToInt32(Str_visitday), Str_visityear, ShowType, DateRule, Date_input);
                            VisitDateDisplay = Visit_Date;
                            //Response.Write("VisitDateDisplay=" + VisitDateDisplay + "<BR>");
                            
                            Str_Visit_Dt_add = Visit_Date;
                           
                     
                        if (Collect_iVR_Time == "Y")
                        {
                            CalTimeIn = Str_timein_hrs + ":" + Str_timein_min + " " + Str_cmb_timein;
                            CalTimeOut = Str_timeout_hrs + ":" + Str_timeout_min + " " + Str_cmb_timeout;
                            // Response.Write("CalTimeIn=" + CalTimeIn + "<BR>");
                            // Response.Write("CalTimeOut=" + CalTimeOut + "<BR>");
                            //******************* Calculate the visit time
                            
                                Visit_time = clsDateFormat.CalVisit_Time(Convert.ToInt32(Str_VisitMonth), Convert.ToInt32(Str_visitday), Convert.ToInt32(Str_visityear), CalTimeIn, CalTimeOut, Str_rad_q_Past_Midnight);
                                // Response.Write("Visit_time=" + Visit_time + "<BR>");
                          

                            Time_IN_date = Visit_Date + " " + Str_timein_hrs + ":" + Str_timein_min + " " + Str_cmb_timein;
                            Time_Out_date = Visit_Date + " " + Str_timeout_hrs + ":" + Str_timeout_min + " " + Str_cmb_timeout;

                        }
                        else
                        {
                            Time_IN_date = null;
                            Time_Out_date = null;
                            Visit_time = null;
                        }

                        if (Mileage_flag == "N")
                        {
                            Str_txt_mileage = null;
                        }

                        if (Travel_flag == "N")
                        {
                            Str_txt_drive = null;
                        }

                        Used_qty = "";
                        if (Str_txt_Manager_name == "")
                        {
                            Str_txt_Manager_name = null;
                            Str_Manager_Title = null;
                        }
                        if (Data_Col_Method == "H")
                        {
                            Str_rad_q_HH_Used = "1";
                        }
                        else
                        {
                            Str_rad_q_HH_Used = "0";
                        }

                        if (Call_Form_Type_No == "")
                        {
                            Call_Form_Type_No = "1";
                        }
                        if (HH_Status_Flag == "")
                        {
                            HH_Status_Flag = null;
                        }
                       
                        if (Str_txt_mileage == "")
                        {
                            Str_txt_mileage = null;
                        }
                        if (Str_txt_drive == "")
                        {
                            Str_txt_drive = null;
                        }
                        if (Str_Sv_Panel_id == "")
                        {
                            Str_Sv_Panel_id = null;
                        }

                        if (string.IsNullOrEmpty(Str_txt_Manager_name) == false)
                        {
                            Str_txt_Manager_name = Str_txt_Manager_name.Replace("'", " ");
                        }
                        //Response.Write("Time_IN_date=" + Time_IN_date + "<BR>");
                        //Response.Write("Time_Out_date=" + Time_Out_date + "<BR>");
                        //Response.Write("Visit_time=" + Visit_time + "<BR>");


                        ProdAnsForNextPage = Request.Form["ProdAnsForNextPage"];
                        //Response.Write("ProdAnsForNextPage=" + ProdAnsForNextPage + "<BR>");

                        AnswersAllFromGrid = Request.Form["AnswersAllFromGrid"];
                       // Response.Write("AnswersAllFromGrid=" + AnswersAllFromGrid + "<BR>");


                        AnswersForMenuColor = Request.Form["AnswersForMenuColor"];
                        //Response.Write("AnswersForMenuColor=" + AnswersForMenuColor + "<BR>");

                        IP_address = Request.ServerVariables["REMOTE_ADDR"];
                        if (string.IsNullOrEmpty(IP_address) == true)
                        {
                            CIPAddr = "999.9.9.9";
                        }
                        else
                        {
                            if (IP_address != "")
                            {
                                CIPAddr = IP_address;
                            }
                        }
                       //Response.Write("IP_address=" + IP_address + "<BR>");
                        if (Request.Cookies["SPARSMARTTOOLS"] != null)
                        { 
                            CUserId = Str_User_id;
                        }
                        else
                        {
                            CUserId = Str_Merch_no;
                        }

                        //Response.Write("CUserId=" + CUserId + "<BR>");
                        //Response.Write("CIPAddr=" + CIPAddr + "<BR>");



                        String Output;
                        Output = "" + Job_No + "," + Wave_No + "," + Task_No + "," + store_id + "," + Str_Merch_no + "," + visit_no + "," + Time_IN_date + "," + Time_Out_date + "," + Visit_time + "," + Str_Manager_Title + "," + Str_txt_Manager_name + "," + Str_txt_mileage + "," + Str_txt_drive + "," + Data_Col_Method + "," + Visit_Date + "," + Star_time + "," + Str_User_id + "";
                        //Response.Write("Output=" + Output + "<BR>");   


                        DataTable dt13 = Get_Product_Confirmation(Job_No, Wave_No, Task_No, store_id, Str_Merch_no, visit_no, Time_IN_date, Time_Out_date, Visit_time, Str_Manager_Title, Str_txt_Manager_name, Str_txt_mileage, Str_txt_drive, Data_Col_Method, Str_Visit_Dt_add, Star_time, Str_User_id, CUserId, CIPAddr, Str_Sv_Panel_id);                                                                          
                        Warning_Message = dt13.Rows[0][0].ToString();
                        return_Message = dt13.Rows[0][1].ToString();
                        //confirmation_no = dt13.Rows[0][2].ToString();
                        //Response.Write("Warning_Message=" + Warning_Message + "<BR>");
                       // Response.Write("return_Message=" + return_Message + "<BR>");
                        //Response.Write("confirmation_no=" + confirmation_no + "<BR>");


                        //Execute the photo check by question procedure

                        Photo_By_QuestionFlag = "";

                        DataSet dt23 = Get_Photo_QuestionCheck(Lang_id, Job_No, Wave_No, Task_No, Chain_No, Store_No, Str_Merch_no, Visit_Date, Str_Sv_Panel_id);
                        // ds.Tables[0].Rows.Count
                        if (dt23.Tables[0].Rows.Count > 0)
                        {
                            Photo_By_QuestionFlag = "Y";
                        }
                        else
                        {
                            Photo_By_QuestionFlag = "N";
                            confirmation_no = dt13.Rows[0][2].ToString();
                        }

                        

                    }
                    catch (Exception ex)
                    {
                        throw ex;
                    }

    }
    #region Procedures
    //************* Function to insert the data  USP_Call_Form_Confirmation_User
    private DataTable Get_Product_Confirmation(String Job_No, String Wave_No, String Task_No, String Store_id, String Str_Merch_no, String visit_no, String Time_IN_date, String Time_Out_date, String Visit_time, String Str_Manager_Title, String Str_txt_Manager_name, String txt_mileage, String txt_drive, String Data_Col_Method, String Visit_Date, String Star_time, String Str_User_id, String CUserId, String CIPAddr, String Str_Sv_Panel_id)
    {
        Int32 iTempMerchNo = 0;
        Int32 iTempJob_No = 0;
        Int32 iTempWave_No = 0;
        Int32 iTempTask_No = 0;
        Int32 iTempStore_id = 0;
        Int32 iTempvisit_no = 0;
        //DateTime iTempVisit_Date;
        //DateTime iTempTime_IN_date;
        //DateTime iTempTime_Out_date;
        //Decimal iTemptxt_mileage;
        //Int32 iTemptxt_drive = 0;
        //Int32 iTempVisit_time = 0;
        //DateTime iTempStar_time;


        iTempMerchNo = AppUtils.ConvertToInteger32(Str_Merch_no, 0);
        iTempJob_No = AppUtils.ConvertToInteger32(Job_No, 0);
        iTempWave_No = AppUtils.ConvertToInteger32(Wave_No, 0);
        iTempTask_No = AppUtils.ConvertToInteger32(Task_No, 0);
        iTempStore_id = AppUtils.ConvertToInteger32(Store_id, 0);
        iTempvisit_no = AppUtils.ConvertToInteger32(visit_no, 0);
        //iTempVisit_time = AppUtils.ConvertToInteger32(Visit_time, 0);
  
        //iTempVisit_Date = Convert.ToDateTime(Visit_Date);
 
        //iTempStar_time = Convert.ToDateTime(Star_time);
 
        //iTemptxt_drive = AppUtils.ConvertToInteger32(txt_drive, 0);


        return AppData.Get_Product_ConfirmationProcedure(Lang_id, iTempJob_No, iTempWave_No, iTempTask_No, iTempStore_id, iTempMerchNo, iTempvisit_no, Visit_Date, Time_IN_date, Time_Out_date, Visit_time, Str_Manager_Title, Str_txt_Manager_name, txt_mileage, txt_drive, Data_Col_Method, Star_time, Str_User_id,CUserId, CIPAddr,Str_Sv_Panel_id, WebAppClass.CurrentSQLDBConnection);

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
   
    #endregion
    private void GetPromptTranslation()
    {
        vPrompts = new string[19];
        
        vPrompts[0] =  "Date:";
        vPrompts[1] =  "Internet Call Form";
        vPrompts[2] =  "Job No.";
        vPrompts[3] =  "Wave No.";
        vPrompts[4] =  "Task No.";
        vPrompts[5] =  "Chain No.";
        vPrompts[6] =  "Store No.";
        vPrompts[7] =  "Answers are successfully Uploaded!";
        vPrompts[8] =  "Data error occured during the Confirmation Number!";
        vPrompts[9] =  "You have already answered the Call Form for this visit.";
        vPrompts[10] =  "SPAR Group, Inc.";
        vPrompts[11] =  "All Rights Reserved.";
        vPrompts[12] =  "HELP";
        vPrompts[13] =  "Next";
        vPrompts[14] =  "Back";
        vPrompts[15] =  "You have already reported this visit.";
        vPrompts[16] =  "Thank You!!";
        vPrompts[17] = "Your Confirmation Number Is :";
        vPrompts[18] = "SPAR Tools";

        ptAppTranslation.DoArrayPromptTranslation(vPrompts);


    }
    private DataTable GetSystemRules()
    {
        DataTable appDT = new DataTable();

        string[] VRule;
        VRule = new string[11];
        VRule[0] = "Name Format";
        VRule[1] = "New Date Format";
        VRule[2] = "Collect Mobile Email";
        VRule[3] = "SPAR Logo";
        VRule[4] = "SPAR Copyright";
        VRule[5] = "Address Format";
        VRule[6] = "Measurement_Val";
        VRule[7] = "Measurement";
        VRule[8] = "Decimal Points";
        VRule[9] = "RTS Link Access";
        VRule[10] = "sparmenu";
        appDT = AppSysRules.Get_RuleValue_ByDescAsDataTable(VRule, WebAppClass.LanguageId, WebAppClass.CurrentSQLDBConnection);
        return appDT;
    }
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
                StrYear = EnterYear;

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
