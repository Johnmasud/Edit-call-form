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

public partial class CFProductCallForm : System.Web.UI.Page
{
    protected string user_id, Email_Active_Flag, Str_Merch_no, Job_No, Wave_No, Task_No, Chain_No, Store_No, txt_EmailAdd, txt_Mobile_Email, POutOfStock_no, Error_Message, Error_Flag, HTMLHeader_info, Collect_Mobile_Email, AddressRule, NameRule, DateRule;
    protected int Error_Message_Flag, BusinessQuestion_Flag, OutOfStock_no, Back_Slash, Dot, Dash, ShowType, Lang_id;
    protected string store_id, Store_Chain_Desc, Store_Store_Name, Store_Street_Addr, Store_City, Store_State, Store_Zip, Data_Required, MeasurementValue, Decimal_Point;
    protected string PMerch_no, CA_merch_no, Merch_First_Name, Merch_Last_Name, Merch_Street_Addr, Merch_Street_Addr2, EnterVisitDate, ProdAnsForNextPage, CallFormEnded;
    protected string Merch_City, Merch_State, Merch_Zip, Merch_Phone_No, Merch_Email_Addr, Task_Desc, Task_Addtl_Desc, CellPhoneNo, Str_Back_RTSAnswers, NewScreenPage;
    protected string Field_Start_Dt, Field_end_Dt, Key_Comp_Dt, DOA_Dt, Job_Type, Business_Type_id, Work_Type_id, Work_Type_Desc, Max_Mx_Per_Store, CFEnd_SelectedProduct;
    protected string Max_Visit_Per_Store_Mx, visit_no, Collect_iVR_Time, night_visits, Mileage_flag, Travel_flag, Data_Col_Method, StrRTSAnswers, AnswersAllFromGrid, AnswersForMenuColor, ProductElementAll, Array_Mandatory_products, Array_Mandatory_ProdId;
    protected string All_Data_Received, qdef_skippattern, Collect_Header, Collect_Call_Form, SS_Callform, Prod_Specific, overwritetime, Prod_UPC;
    protected string collect_time_only, Ask_Q_HH_Used, HH_Status_Flag, Collect_Store_Mgr_Name, Product_Check_Flag, Ask_EShelf_Question, Product_Type, HH_Ans_Display_Hidden_var, CallFormEnded_List;
    protected string Call_Form_Type_No, Est_instore_minutes, Business_Rule_Eckerd, Eckerd_Job_Last_question, Bus_Rule22_Photo, ArrayEleSubmit;
    protected string Bus_Rule5_Question, Bus_Rule6_Question, Bus_Rule28_Question, Bus_Rule3_Question, Bus_Rule4_Question, Bus_Rule7_Question, Product_Required, Reported_Answers_Array, Display_Answers_Array, Reported_seq_no, Report_Answers_Hidden_var;
    protected string JWTInfoText, UseTheCallForm, PhotoButton, Nextbutton, return_Message, Excute_SQL, Merch_Message, No_Question_avaliable,TotalProdCount;
    protected string Date_input, VarDay, Varmonth, StrYear, VarSelect_AM, VarSelect_PM, Strcmb_timein, TodayDate, YearDisplay, All_EleAns_Val, Mandatory_products, Menu_Array_no;
    protected string txt_timein_hrsVal, txt_timein_minVal, txt_timeout_hrsVal, txt_timeout_minVal, Visit_Date, txt_Phone1, txt_Phone2, txt_Phone3, CellProvider, Hidden_PhoneStatus;
    protected string Q_No, Q_Text, Q_Text_Short, Q_Type, Ans_Type, Grid_No, skippattern_status, RTS_JWT, STR_RTS_JWT, Used_qty, ShortCallForm, StrProdNextPage, strMenu_Array_no;
    protected string Uniq_Ques_Id, stores_specified, prod_upc, prod_activity_id, skip_flag, ElementName, All_ElementName, ArrayAllHtmlElement, ArrayAllQuestionsElement, RTS_Q_No, ArrayRTS_Q_no;
    protected string Prod_Id, Ans_Val, Ans_Text, Nxt_Q_No, Remark, Response_Text_Flag, Ans_Val_High, Ans_Val_Low, JWT, EleAns_Val, JWTInfoRTS, DisplayHeaderInfo, DisplayQuestLinkInfo, DisplayAnsTypeInfo, DisplayResponseInfo, DisplayControlInfo, DisplayJWTQuestionsInfo, DisplaySaveHiddenInfo;
    protected string Str_VisitMonth, Str_visitday, Str_visityear, Str_timein_hrs, Str_timein_min, Str_cmb_timein, Str_timeout_hrs, Str_timeout_min, Str_cmb_timeout;
    protected string Str_txt_mileage, Str_txt_drive, Str_rad_q_Past_Midnight, Str_rad_q_HH_Used, Str_rad_q_Ret_store_visit, Str_Manager_Title, Str_txt_Manager_name;
    protected string Str_Radio_EShelf, Str_Ask_EShelf_Question, Str_Bus_Rule3_Question, Str_rad_q_BR3, Str_Bus_Rule4_Question, Str_rad_q_BR4, Str_Bus_Rule5_Question;
    protected string Str_rad_q_BR5, Str_Bus_Rule6_Question, Str_rad_q_BR6, Str_Bus_Rule7_Question, Str_rad_q_BR7, Str_Bus_Rule28_Question, Str_rad_q_BR28, CheckErrorMessage, chainstorelstSA, selchainstoreSA,Str_Sv_Panel_id;
    public string[] vPrompts;
    public DateTime StrDate;
    protected string Star_time, InformationDisplay, DisplayJWTInfo, ShowJWTCheckboxText, STREleSubmitRTS, ArrayEleSubmitRTS;
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

        ptAppTranslation = new PromptTranslation("CFGrid.aspx", WebAppClass.PromptsLanguageId.ToString(), WebAppClass.LanguageId, WebAppClass.CurrentSQLDBConnection, WebAppClass.MultiLanguageCount);
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


                            //************** JWT Display

                           // InformationDisplay = Request.Form["InformationDisplay"];
                            //Response.Write("InformationDisplay=" + InformationDisplay + "<BR>");
                           // JWTInfoRTS = InformationDisplay;
                            //if (showCheck=="on")
                            //{
                            //    ShowChecked = "Checked";
                            //}
                            //else
                            //{
                            //    ShowChecked="";
                            //}
                            ShowJWTCheckboxText = vPrompts[7];
                            StringBuilder HTMLTextSpanDisplay = new StringBuilder();
                            HTMLTextSpanDisplay.Append(InformationDisplay);
                            HTMLTextSpanDisplay.Append("<tr><td  align='left' class='applicationnametd'> <span class='reportTableHeader'>" + vPrompts[69] + "</span> </td></tr>");

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

                            ProdAnsForNextPage = Request.Form["ProdAnsForNextPage"];
                             //Response.Write("ProdAnsForNextPage=" + ProdAnsForNextPage + "<BR>");

                             AnswersAllFromGrid=Request.Form["AnswersAllFromGrid"];
                             //Response.Write("AnswersAllFromGrid=" + AnswersAllFromGrid + "<BR>");
		                    //AnswersAllFromGrid=""

                             AnswersForMenuColor = Request.Form["AnswersForMenuColor"];
		                    //Response.Write "AnswersForMenuColor=" & AnswersForMenuColor & "<BR>"


                             CallFormEnded = Request.Form["CallFormEnded"];
                             //Response.Write("CallFormEnded=" + CallFormEnded + "<BR>");

                             CFEnd_SelectedProduct = Request.Form["CFEnd_SelectedProduct"];
                             //Response.Write("CFEnd_SelectedProduct=" + CFEnd_SelectedProduct + "<BR>");
                             Str_Sv_Panel_id = Request.Form["Str_Sv_Panel_id"];
      //****************************** Visit date 
                             string Visit_Time1,Visit_time, Time_IN_date, Time_Out_date, Visit_Time2,StrVisit_date, DisplayTimeIn, DisplayTimeout, VisitDateDisplay, CalTimeIn, CalTimeOut;

                             DateTime Visit_Date2, Visit_Date1;

                             Visit_Date = clsDateFormat.FunDate_Format(Convert.ToInt32(Str_VisitMonth), Convert.ToInt32(Str_visitday), Str_visityear, ShowType, DateRule, Date_input);
                             VisitDateDisplay = Visit_Date;
                              //Response.Write("VisitDateDisplay=" + VisitDateDisplay + "<BR>");


                             //************ Date Check
                             try
                             {
                                 DataTable dt11 = Get_JWT_VisitDate_Check(Job_No, Wave_No, Task_No, store_id, Visit_Date, Str_Merch_no);
                                 CheckErrorMessage = dt11.Rows[0][0].ToString();
                                 // Response.Write("CheckErrorMessage=" + CheckErrorMessage + "<BR>");
                             }
                             catch (Exception ex)
                             {
                                 throw ex;
                             }
                             if (Collect_iVR_Time == "Y")
                             { 
                                 CalTimeIn = Str_timein_hrs + ":" + Str_timein_min + " " + Str_cmb_timein;
                                 CalTimeOut = Str_timeout_hrs + ":" + Str_timeout_min + " " + Str_cmb_timeout;
                                 // Response.Write("CalTimeIn=" + CalTimeIn + "<BR>");
                                 // Response.Write("CalTimeOut=" + CalTimeOut + "<BR>");
                                 //******************* Calculate the visit time
                                 try
                                 {
                                     Visit_time = clsDateFormat.CalVisit_Time(Convert.ToInt32(Str_VisitMonth), Convert.ToInt32(Str_visitday), Convert.ToInt32(Str_visityear), CalTimeIn, CalTimeOut, Str_rad_q_Past_Midnight);
                                     // Response.Write("Visit_time=" + Visit_time + "<BR>");

                                     Time_IN_date = Visit_Date + " " + Str_timein_hrs + ":" + Str_timein_min + " " + Str_cmb_timein;
                                     Time_Out_date = Visit_Date + " " + Str_timeout_hrs + ":" + Str_timeout_min + " " + Str_cmb_timeout;
                                 }
                                 catch (Exception ex)
                                 {
                                     throw ex;
                                 }
                             }
                             else
                             {
                                 Time_IN_date = null;
                                 Time_Out_date = null;
                                 Visit_time = "Null";
                             }

                             StringBuilder HH_Ans_Text = new StringBuilder();
                             StringBuilder HH_Ans_Display_Text = new StringBuilder();
                             Report_Answers_Hidden_var = "";
                             HH_Ans_Display_Hidden_var = "";

                             //Get the answers for the call form 
                             DataTable dt2 = Get_CF_Product_Answers(Lang_id, Job_No, Wave_No, Task_No, store_id, Visit_Date, Str_Merch_no);

                             StrProdNextPage = "";
                             strMenu_Array_no = "";
                             if (dt2.Rows.Count > 0)
                             {
                                 foreach (DataRow AnsRow in dt2.Rows)
                                 {
                                     CallFormEnded_List = Convert.ToString(AnsRow["CallFormEnded_List"]);
                                     //Response.Write("CallFormEnded_List=" + CallFormEnded_List + "<BR>");

                                     Menu_Array_no = Convert.ToString(AnsRow["Menu_Array_no"]);
                                     //Response.Write("Menu_Array_no=" + Menu_Array_no + "<BR>");

                                     Reported_seq_no = Convert.ToString(AnsRow["seq_no"]);
                                     //Response.Write("Reported_seq_no=" + Reported_seq_no + "<BR>");

                                     Reported_Answers_Array = Convert.ToString(AnsRow["Reported_Answers_Array"]);
                                     //Response.Write("Reported_Answers_Array=" + Reported_Answers_Array + "<BR>");

                                     Display_Answers_Array = Convert.ToString(AnsRow["Display_Answers_Array"]);
                                     //  Response.Write("Display_Answers_Array=" + Display_Answers_Array + "<BR>");

                                     HH_Ans_Text.Append("<INPUT TYPE='hidden' name='ReportedList" + Reported_seq_no + "' value='" + Reported_Answers_Array + "'>");
                                     HH_Ans_Display_Text.Append("<INPUT TYPE='hidden' name='AnsDisplayList" + Reported_seq_no + "' value='" + Display_Answers_Array + "'>");
                                     //HTMLText6.Append("<INPUT TYPE='hidden' name='SavedList" + prod_id + "' value=''>
                                     if (Reported_Answers_Array != "")
                                     {
                                         StrProdNextPage = StrProdNextPage + Reported_seq_no + "|";
                                         strMenu_Array_no = strMenu_Array_no + Menu_Array_no + "|";

                                     }
                                 }
                                 Report_Answers_Hidden_var = HH_Ans_Text.ToString();
                                 HH_Ans_Display_Hidden_var = HH_Ans_Display_Text.ToString();
                                 //Response.Write("Report_Answers_Hidden_var=" + Report_Answers_Hidden_var + "<BR>");
                                 // Response.Write("StrProdNextPage=" + StrProdNextPage + "<BR>");
                             }
                             else
                             {
                                 CheckErrorMessage = "Y";
                                 CheckErrorMessage = "There are no responses reported for this visit.";
                                 No_Question_avaliable = "0";
                             }

                            
                             No_Question_avaliable = "0";
                             if (CheckErrorMessage == "N")
                             {
                                 //****************************** Drop down menu product list
                                 SelectedProduct.DataSource = Get_CFJWTProductList(Job_No, Wave_No, Task_No, store_id);
                                 SelectedProduct.DataTextField = "MenuDisplay";
                                 SelectedProduct.DataValueField = "Array_No";
                                 SelectedProduct.DataBind();

                                 string Selected_Item;
                                 Selected_Item = SelectedProduct.SelectedItem.ToString();
                                 //Response.Write("SelectedItem=" + Selected_Item + "<BR>");

                                 SelectedProduct.Attributes.Add("onchange", "javascript:return DisplayCallForm();");

                                 foreach (ListItem myItem in SelectedProduct.Items)
                                 {
                                     myItem.Attributes.Add("style", "background-color:white");
                                 }
                                 //foreach (ListItem ltItem in SelectedProduct.Items)

                                 //   {
                                 //       ltItem.Value;
                                 //   }



                                 //****************************** Questions for the call form
                                 StringBuilder HTMLText = new StringBuilder();
                                 StringBuilder HTMLText1 = new StringBuilder();
                                 StringBuilder HTMLText2 = new StringBuilder();
                                 StringBuilder HTMLText3 = new StringBuilder();
                                 StringBuilder HTMLText4 = new StringBuilder();
                                 StringBuilder HTMLText5 = new StringBuilder();
                                 StringBuilder HTMLText6 = new StringBuilder();
                                 StringBuilder HTMLText7 = new StringBuilder();

                                 // System.Text.StringBuilder HTMLText = new System.Text.StringBuilder();
                                 //********** Get the questions and responses from Q_hdr and Q
                                 //USP_Get_JWTQuestionResponse(101223,201012,1
                                 
                                 string JWT_Q_No, JWT_Q_Text, JWT_Ans_Type, JWT_Ans_Val, JWT_Ans_Text, JWT_Nxt_Q_No, JWT_Ans_Val_High, JWT_Ans_Val_Low, StrQuestionText, StrJWT_Q_No, StartPoint, StrResponseText, StrResponseText2;
                                 DataTable JWTData = new DataTable();

                                 JWTData = Get_JWTQuestionResponse(Job_No, Wave_No, Task_No);
                                 StrJWT_Q_No = "";
                                 JWT_Q_No = "";
                                 JWT_Q_Text = "";
                                 JWT_Ans_Type = "";
                                 StartPoint = "Y";
                                 JWT_Ans_Text = "";
                                 JWT_Nxt_Q_No = "";
                                 JWT_Ans_Val = "";
                                 Product_Required = "";
                                 if (JWTData.Rows.Count > 0)
                                 {
                                     No_Question_avaliable = "1";

                                     foreach (DataRow EachRow in JWTData.Rows)
                                     {
                                         if (EachRow["Q_No"] != System.DBNull.Value)
                                         {
                                             JWT_Q_No = Convert.ToString(EachRow["Q_No"]);
                                             //Response.Write("prod_upc=" + prod_upc + "<BR>");
                                         }
                                         if (EachRow["Q_Text"] != System.DBNull.Value)
                                         {
                                             JWT_Q_Text = Convert.ToString(EachRow["Q_Text"]);
                                             //Response.Write("prod_upc=" + prod_upc + "<BR>");
                                         }
                                         if (EachRow["Ans_Type"] != System.DBNull.Value)
                                         {
                                             JWT_Ans_Type = Convert.ToString(EachRow["Ans_Type"]);
                                             //Response.Write("prod_upc=" + prod_upc + "<BR>");
                                         }
                                         if (EachRow["Ans_Val"] != System.DBNull.Value)
                                         {
                                             JWT_Ans_Val = Convert.ToString(EachRow["Ans_Val"]);
                                             //Response.Write("prod_upc=" + prod_upc + "<BR>");
                                         }
                                         if (EachRow["Ans_Text"] != System.DBNull.Value)
                                         {
                                             JWT_Ans_Text = Convert.ToString(EachRow["Ans_Text"]);
                                             //Response.Write("prod_upc=" + prod_upc + "<BR>");
                                             JWT_Ans_Text = JWT_Ans_Text.Replace("_", "");
                                         }
                                         if (EachRow["Nxt_Q_No"] != System.DBNull.Value)
                                         {
                                             JWT_Nxt_Q_No = Convert.ToString(EachRow["Nxt_Q_No"]);
                                             //Response.Write("prod_upc=" + prod_upc + "<BR>");
                                         }
                                         if (EachRow["Ans_Val_High"] != System.DBNull.Value)
                                         {
                                             JWT_Ans_Val_High = Convert.ToString(EachRow["Ans_Val_High"]);
                                             //Response.Write("prod_upc=" + prod_upc + "<BR>");
                                         }
                                         if (EachRow["Ans_Val_Low"] != System.DBNull.Value)
                                         {
                                             JWT_Ans_Val_Low = Convert.ToString(EachRow["Ans_Val_Low"]);
                                             //Response.Write("prod_upc=" + prod_upc + "<BR>");
                                         }

                                         if (StrJWT_Q_No != JWT_Q_No)
                                         {
                                             JWT_Q_Text = JWT_Q_Text.Replace("'", "`");
                                             StrQuestionText = "<input type='hidden' name='Q" + JWT_Q_No.Trim() + "' value='" + JWT_Ans_Type + "_" + JWT_Q_Text + "'>";
                                             HTMLText1.Append("" + StrQuestionText + "");
                                             //Response.Write("Q_No=" + Q_No + "<BR>");
                                             if (StartPoint == "N")
                                             {
                                                 HTMLText4.Append("'>");
                                             }
                                             StrResponseText = "<input type='hidden' name='R" + JWT_Q_No.Trim() + "' value='";
                                             HTMLText4.Append("" + StrResponseText + "");

                                             //HTMLText4.Append("|");
                                             StrJWT_Q_No = JWT_Q_No;
                                         }
                                         StrResponseText2 = "" + JWT_Ans_Val + "_" + JWT_Ans_Text + "_" + JWT_Nxt_Q_No + "|";
                                         HTMLText4.Append("" + StrResponseText2 + "");
                                         StartPoint = "N";
                                     }
                                 }
                                 HTMLText4.Append("'>");
                                
                                 //HTMLText = "";
                                 //HTMLText.Append("<table border='1' id='TABLE1' borderColor='dodgerblue' bgcolor='mintcream' align='center' width='100%'> ");
                                 string prod_id, prod_upc, prod_long_desc, HeaderText, QuestionText, Strprod_upc, StrQ_No, StrArray;
                                 int QACount, i, Seq_no;
                                 QACount = 0;
                                 i = 0;
                                 Seq_no = 0;
                                 prod_id = "";
                                 prod_long_desc = "";
                                 Strprod_upc = "";
                                 prod_upc = "";
                                 StrQ_No = "";
                                 StrArray = "";
                                 Product_Type = "";
                                 Array_Mandatory_products = "";
                                 Array_Mandatory_ProdId = "";
                                 DataTable QData = new DataTable();
                                
                                 QData = Get_JWT_Questions(Job_No, Wave_No, Task_No, store_id);
                                 //Response.Write("here");
                                 if (QData.Rows.Count > 0)
                                 {
                                    // Response.Write("here1");
                                     foreach (DataRow myRow in QData.Rows)
                                     {
                                         //Response.Write("here2");
                                         Ans_Val_High = "";
                                         Ans_Val_Low = "";
                                         if (myRow["Product_Type"] != System.DBNull.Value)
                                         {
                                             Product_Type = Convert.ToString(myRow["Product_Type"]);
                                             //Response.Write("prod_upc=" + prod_upc + "<BR>");
                                         }
                                         if (myRow["Product_Required"] != System.DBNull.Value)
                                         {
                                             Product_Required = Convert.ToString(myRow["Product_Required"]);
                                             //Response.Write("Product_Required=" + Product_Required + "<BR>");
                                         }

                                         if (myRow["prod_upc"] != System.DBNull.Value)
                                         {
                                             prod_upc = Convert.ToString(myRow["prod_upc"]);
                                             //Response.Write("prod_upc=" + prod_upc + "<BR>");
                                         }
                                         if (myRow["prod_id"] != System.DBNull.Value)
                                         {
                                             prod_id = Convert.ToString(myRow["prod_id"]);
                                             //Response.Write("prod_id=" + prod_id + "<BR>");
                                         }
                                         if (myRow["prod_long_desc"] != System.DBNull.Value)
                                         {
                                             prod_long_desc = Convert.ToString(myRow["prod_long_desc"]);
                                             //Response.Write("prod_long_desc=" + prod_long_desc + "<BR>");   
                                         }
                                         if (myRow["Q_No"] != System.DBNull.Value)
                                         {
                                             Q_No = Convert.ToString(myRow["Q_No"]);
                                             Q_No = Q_No.Trim();
                                             //Response.Write("Q_No=" + Q_No + "<BR>");
                                         }
                                         if (myRow["Q_Text"] != System.DBNull.Value)
                                         {
                                             Q_Text = Convert.ToString(myRow["Q_Text"]);
                                             //Response.Write("Q_No=" + Q_No + "<BR>");
                                         }
                                         if (myRow["Ans_Type"] != System.DBNull.Value)
                                         {
                                             Ans_Type = Convert.ToString(myRow["Ans_Type"]);
                                             //Response.Write("Q_No=" + Q_No + "<BR>");
                                         }
                                         if (myRow["QACount"] != System.DBNull.Value)
                                         {
                                             QACount = Convert.ToInt32(myRow["QACount"]);
                                             //Response.Write("QACount=" + QACount + "<BR>");
                                         }
                                         if (myRow["Ans_Text"] != System.DBNull.Value)
                                         {
                                             Ans_Text = Convert.ToString(myRow["Ans_Text"]);
                                             //Response.Write("Ans_Text=" + Ans_Text + "<BR>");
                                         }

                                         if (myRow["Data_Required"] != System.DBNull.Value)
                                         {
                                             Data_Required = Convert.ToString(myRow["Data_Required"]);
                                             //Response.Write("Ans_Text=" + Ans_Text + "<BR>");
                                         }
                                         if (myRow["Ans_Val_High"] != System.DBNull.Value)
                                         {
                                             Ans_Val_High = Convert.ToString(myRow["Ans_Val_High"]);
                                             //Response.Write("Ans_Text=" + Ans_Text + "<BR>");
                                         }
                                         if (myRow["Ans_Val_Low"] != System.DBNull.Value)
                                         {
                                             Ans_Val_Low = Convert.ToString(myRow["Ans_Val_Low"]);
                                             //Response.Write("Ans_Text=" + Ans_Text + "<BR>");
                                         }
                                         if (myRow["Ans_Val"] != System.DBNull.Value)
                                         {
                                             Ans_Val = Convert.ToString(myRow["Ans_Val"]);
                                             //Response.Write("Ans_Text=" + Ans_Text + "<BR>");
                                         }
                                         if (myRow["Nxt_Q_No"] != System.DBNull.Value)
                                         {
                                             Nxt_Q_No = Convert.ToString(myRow["Nxt_Q_No"]);
                                             //Response.Write("Ans_Text=" + Ans_Text + "<BR>");
                                         }
                                         if (myRow["Mandatory_products"] != System.DBNull.Value)
                                         {
                                             Mandatory_products = Convert.ToString(myRow["Mandatory_products"]);
                                             Mandatory_products = Mandatory_products.Trim();
                                         }
                                         else
                                         {
                                             Mandatory_products = "";
                                         }
                                         //Response.Write("prod_upcOUT=" + prod_upc + "<BR>");
                                         //Response.Write("Mandatory_products=" + Mandatory_products + "<BR>");
                                         if (Strprod_upc != prod_upc)
                                         {
                                             //******* Header info
                                             HeaderText = prod_id + "-" + prod_long_desc;
                                             HTMLText.Append("" + HeaderText + "~");
                                             Strprod_upc = prod_upc;
                                             i = i + 1;
                                             //Response.Write("i=" + i + "<BR>");
                                             // Response.Write("Mandatory_eeeee=" + Mandatory_products + "<BR>");
                                             if (Mandatory_products == "Y")
                                             {
                                                 
                                                 Array_Mandatory_products = Array_Mandatory_products.Trim() + i + "|";
                                                 Array_Mandatory_ProdId = Array_Mandatory_ProdId.Trim() + prod_id + "|";
                                                 Mandatory_products = "";
                                                // Response.Write("sdasdasdasdasd=" + Array_Mandatory_products + "<BR>");
                                             }
                                            
                                             if (StrArray == "Y")
                                             {
                                                 HTMLText2.Append("|");
                                             }
                                             HTMLText3.Append("|");
                                             //HTMLText4.Append("|");
                                             HTMLText5.Append("|");
                                             HTMLText6.Append("<INPUT TYPE='hidden' name='SavedList" + prod_id + "' value=''><INPUT TYPE='hidden' name='ProductColor" + prod_id + "' value=''>");
                                             HTMLText7.Append("" + prod_id + "");
                                             HTMLText7.Append("|");
                                             StrQ_No = "";

                                         }
                                         
                                         //******* Questions 
                                         if (StrQ_No != Q_No)
                                         {
                                             QuestionText = Q_No + "_" + Ans_Val_High + "_" + Ans_Val_Low + "";
                                             HTMLText2.Append("" + QuestionText.Trim() + "|");
                                             HTMLText3.Append("" + Ans_Type + "_" + QACount + "|");
                                             //Response.Write("Q_No=" + Q_No + "<BR>");
                                             StrQ_No = Q_No;

                                         }
                                         //Response.Write("StrArray=" + StrArray + "<BR>");
                                         //Response.Write("HTMLText2=" + HTMLText2.ToString() + "<BR>");
                                         //Response.Write("Q_No=" + Q_No + "<BR>");
                                         //Response.Write("Ans_Val_High=" + Ans_Val_High + "<BR>");
                                         //Response.Write("Ans_Val_Low=" + Ans_Val_Low + "<BR>");
                                         //******** Responses
                                         //HTMLText4.Append("" + Ans_Text + "|");
                                         //CONTROL values 

                                         HTMLText5.Append("" + Q_No.Trim() + "0" + prod_id + "_" + Data_Required + "," + Ans_Val_High + "," + Ans_Val_Low + "_" + Ans_Val + "_" + Nxt_Q_No + "," + Q_No + ",QList" + prod_id + "");

                                         //Response.Write("i=" + i + "<BR>");
                                         StrArray = "Y";

                                         //Header information
                                     }//foreach (DataRow myRow in QData.Rows)
                                 }

                                 HTMLText2.Append("|");
                                 HTMLText3.Append("|");

                                 HTMLText5.Append("|");

                                 DisplayHeaderInfo = HTMLText.ToString();
                                 DisplayJWTQuestionsInfo = HTMLText1.ToString();
                                 DisplayQuestLinkInfo = HTMLText2.ToString();
                                 DisplayResponseInfo = HTMLText4.ToString();
                                 DisplaySaveHiddenInfo = HTMLText6.ToString();
                                 ProductElementAll = HTMLText7.ToString();
                                 TotalProdCount = Convert.ToString(i);
                                 Response.Write("<BR>");

                                 //Response.Write("Array_Mandatory_products=" + Array_Mandatory_products + "<BR>");
                                 // DisplayAnsTypeInfo = HTMLText3.ToString();
                                 // DisplayResponseInfo = HTMLText4.ToString();
                                 // DisplayControlInfo = HTMLText5.ToString();
                             }//if (CheckErrorMessage=="N")



                           
    }
    #region SystemPromptandRule

    private void GetPromptTranslation()
    {
                vPrompts = new string[112];
                vPrompts[0]="Product number has to be numeric.";
                vPrompts[1]="Product number";
                vPrompts[2]="does not exist.";
                vPrompts[3]="Please select Product from the menu or enter a product number.";
                vPrompts[4]="This is the last product in the list.";
                vPrompts[5]="This is the first product on the list.";
                vPrompts[6]="Minimum product requirements are not met for this store. Please review paperwork and call form data to ensure all products found in store are entered before you can proceed.";
                vPrompts[7]="Please continue with the Internet Call Form.";
                vPrompts[8]="All products have not been answered. You must answer for all products.";
                vPrompts[9]="Please answer";
                vPrompts[10]="cannot have Single quotes.";
                vPrompts[11]="Please enter a valid date for question";
                vPrompts[12]="cannot have Single quotes.";
                vPrompts[13]="cannot have Comma.";
                vPrompts[14]="Please enter a valid date for question";
                vPrompts[15]="has to be numeric.";
                vPrompts[16]="must be a whole number.";
                vPrompts[17]="must be a whole number.";
                vPrompts[18]="value has to be less or equal to";
                vPrompts[19]="Dollar(s) value has to be numeric.";
                vPrompts[20]="Dollar(s) value can not have a period."; 
                vPrompts[21]="Cent(s) value can not be bigger than 99 cent."; 
                vPrompts[22]="Cent(s) value has to be numeric."; 
                vPrompts[23]="Cent(s) value can not have a period.";
                vPrompts[24]="You must enter a value for dollar(s)."; 
                vPrompts[25]="You must enter a value for cent(s)."; 
                vPrompts[26]="value has to be bigger or equal to "; 
                vPrompts[27]="value has to be less or equal to "; 
                vPrompts[28]="Feet(s) value has to be numeric."; 
                vPrompts[29]="Feet(s) value can not have a period."; 
                vPrompts[30]="Inch/Inches value can not be bigger than"; 
                vPrompts[31]="Inch/Inches value can not be less than 0."; 
                vPrompts[32]="Inch/Inches value has to be numeric."; 
                vPrompts[33]="Inch/Inches value can not have a period."; 
                vPrompts[34]="You must enter a value for feet(s)."; 
                vPrompts[35]="You must enter a value for Inch/Inches."; 
                vPrompts[36]="value has to be bigger or equal to "; 
                vPrompts[37]="value has to be less or equal to "; 
                vPrompts[38]="Hour(s) value has to be numeric."; 
                vPrompts[39]="Hour(s) value can not have a period.";
                vPrompts[40]="Minute(s) value can not be bigger than 59."; 
                vPrompts[41]="Minute(s) value can not be less than 0."; 
                vPrompts[42]="Minute(s) value has to be numeric."; 
                vPrompts[43]="Minute(s) value can not have a period."; 
                vPrompts[44]="You must enter a value for Hour(s)."; 
                vPrompts[45]="You must enter a value for Minute(s)."; 
                vPrompts[46]="value has to be bigger or equal to "; 
                vPrompts[47]="value has to be less or equal to ";  
                vPrompts[48]="Month must be between 1 and 12."; 
                vPrompts[49]="Day must be between 1 and 31."; 
                vPrompts[50]="Month";
                vPrompts[51]="does not have 31 days!"; 
                vPrompts[52]="February";
                vPrompts[53]="does not have ";
                vPrompts[54]="days!"; 
                vPrompts[55]="The Product ";
                vPrompts[56]="is a Mandatory for this Job, wave, and task."; 
                vPrompts[57]="The question";
                vPrompts[58]="You can not use the NEXT button any more.";
                vPrompts[59]="You can not use the BACK button any more.";
                vPrompts[60]="If there is only value for cent(s) then enter 0 for dollar(s).";
                vPrompts[61]="If there is only value for dollar(s) then enter 0 for cent(s).";
                vPrompts[62]="If there is only value for Inch/Inches then enter 0 for feet(s).";
                vPrompts[63]="If there is only value for feet(s) then enter 0 for Inch/Inches.";
                vPrompts[64]="If there is only value for Minute(s) then enter 0 for Hour(s).";
                vPrompts[65]="If there is only value for Hour(s) then enter 0 for Minute(s).";
                vPrompts[66]="Date is not in a valid format.";
                vPrompts[67]="Are you sure you answered all the questions on this call form?";
                vPrompts[68]="If NO then please click Cancel.";
                vPrompts[69]="If YES then please click OK to submit your answers.";
                vPrompts[70]="value can not be less than zero.";
                vPrompts[71]="Invalid value entered for question";
                vPrompts[72]="No Product available for J/W/T.";
                vPrompts[73]= "Date:";
                vPrompts[74]= "Internet Call Form";
                vPrompts[75]= "Job No.";
                vPrompts[76]= "Wave No.";
                vPrompts[77]= "Task No.";
                vPrompts[78]= "Chain No.";
                vPrompts[79]= "Store No.";
                vPrompts[80]= "Please wait till the page is finished loading.";
                vPrompts[81]= "Enter Product No.";
                vPrompts[82]= "Select a Product";
                vPrompts[83]= "No Product available for J/W/T.";
                vPrompts[84]= "Product Number:";
                vPrompts[85]= "(Multiple answers allowed)";
                vPrompts[86]= "(Only one answer allowed)";
                vPrompts[87]= "(Enter a numeric value)";
                vPrompts[88]= "(Enter a valid text)";
                vPrompts[89] = "(Enter a date in mm/dd/yy format)";
                vPrompts[90]= "(Enter a numeric value)";
                vPrompts[91]= "QNo.";
                vPrompts[92]= "Ans";
                vPrompts[93]= "(mm/dd/yyyy)";
                vPrompts[94]= "Dollar(s)";
                vPrompts[95]= "Cent(s)";
                vPrompts[96]= "Feet(s)";
                vPrompts[97]= "Inch/Inches";
                vPrompts[98]= "Hour(s)";
                vPrompts[99]= "Minute(s)";
                vPrompts[100]= "SPAR Group, Inc.";
                vPrompts[101]= "All Rights Reserved.";
                vPrompts[102]= "HELP";
                vPrompts[103]= "Next";
                vPrompts[104]= "Back";
                vPrompts[105]= "Reset";
                vPrompts[106] = "Call Form Completed";
                vPrompts[107] = "You are indicating that you were not able to complete your store visit.  You will not be able to report data for any products.";
                vPrompts[108] = "You are indicating that you were not able to complete your store visit.  All data you have already reported for this store will be deleted.";
                vPrompts[109] = "Please answer all mandatory products highlighted in yellow.";
                vPrompts[110] = "Call Form cannot be completed. No data report for any products.";
                vPrompts[111] = "Response"; 
        

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


    private DataTable Get_CFJWTProductList(String Job_No, String Wave_No, String Task_No, String Store_id)
    {
        Int32 iTempJob_No = 0;
        Int32 iTempWave_No = 0;
        Int32 iTempTask_No = 0;
        Int32 iTempStore_id = 0;
     

        iTempJob_No = AppUtils.ConvertToInteger32(Job_No, 0);
        iTempWave_No = AppUtils.ConvertToInteger32(Wave_No, 0);
        iTempTask_No = AppUtils.ConvertToInteger32(Task_No, 0);
        iTempStore_id = AppUtils.ConvertToInteger32(Store_id, 0);

        return AppData.Get_DropDownProductList(iTempJob_No, iTempWave_No, iTempTask_No, iTempStore_id, WebAppClass.CurrentSQLDBConnection);
    }
    private DataTable Get_JWTQuestionResponse(String Job_No, String Wave_No, String Task_No)
    {
        Int32 iTempJob_No = 0;
        Int32 iTempWave_No = 0;
        Int32 iTempTask_No = 0;
 
        iTempJob_No = AppUtils.ConvertToInteger32(Job_No, 0);
        iTempWave_No = AppUtils.ConvertToInteger32(Wave_No, 0);
        iTempTask_No = AppUtils.ConvertToInteger32(Task_No, 0);

        return AppData.Get_JWTQuestionResponseData(iTempJob_No, iTempWave_No, iTempTask_No, WebAppClass.CurrentSQLDBConnection);
    }
    

    private DataTable Get_JWT_Questions(String Job_No, String Wave_No, String Task_No, String Store_id)
    {
        Int32 iTempJob_No = 0;
        Int32 iTempWave_No = 0;
        Int32 iTempTask_No = 0;
        Int32 iTempStore_id = 0;


        iTempJob_No = AppUtils.ConvertToInteger32(Job_No, 0);
        iTempWave_No = AppUtils.ConvertToInteger32(Wave_No, 0);
        iTempTask_No = AppUtils.ConvertToInteger32(Task_No, 0);
        iTempStore_id = AppUtils.ConvertToInteger32(Store_id, 0);

        return AppData.Get_JWT_QuestionsData(iTempJob_No, iTempWave_No, iTempTask_No, iTempStore_id, WebAppClass.CurrentSQLDBConnection);
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
    private DataTable Get_Start_time()
    {

        return AppData.Get_Start_timeClass(WebAppClass.CurrentSQLDBConnection);
    }
    private DataTable Get_CF_Product_Answers(Int32 Lang_id, String Job_No, String Wave_No, String Task_No, String Store_id, String Visit_Date, String Str_Merch_no)
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

        return AppData.Get_USP_CF_ProductAnswerBack(Lang_id, iTempJob_No, iTempWave_No, iTempTask_No, iTempStore_id, iTempMerch_no, Visit_Date, WebAppClass.CurrentSQLDBConnection);
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
