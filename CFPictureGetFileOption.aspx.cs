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


public partial class CFPictureGetFileOption : System.Web.UI.Page
{
    protected string Job_No, Wave_No, Task_No, Task_Desc, Task_Addtl_Desc, store_id, Date_input, NewScreenPage;
    protected string Chain_No, Store_Chain_Desc, Store_No, Store_Store_Name, Store_Street_Addr, Store_City, Store_State, Store_Zip, Photo_CF_Access;
        protected string CA_merch_no, Str_Merch_no, Merch_First_Name, Merch_Last_Name, Merch_Street_Addr, Merch_Street_Addr2, Merch_City, Merch_State, Merch_Zip, Merch_Phone_No, Merch_Email_Addr;
        protected string Field_Start_Dt, Field_end_Dt, Key_Comp_Dt, DOA_Dt, TodayDate, visit_no, Photo_Remain, Client_Access_Flag, Pre_Approved_Flag;
        protected string Collect_iVR_Time, night_visits, Mileage_flag, Travel_flag, Str_Manager_Title, Str_txt_Manager_name;
        protected string Job_Type, Business_Type_id, Work_Type_id, Work_Type_Desc,Bus_Rule22_Photo, Photo_upload;
        protected string Data_Col_Method,overwritetime,All_Data_Received,collect_time_only,Ask_Q_HH_Used,HH_Status_Flag;
        protected string Collect_Header, Collect_Call_Form, SS_Callform, Prod_Specific, qdef_skippattern, Max_Mx_Per_Store, Max_Visit_Per_Store_Mx, Job_Visit_Date, Display_Job_Visit_Date;
        protected string Collect_Store_Mgr_Name,Product_Check_Flag,Ask_EShelf_Question,Call_Form_Type_No,Est_instore_minutes,Business_Rule_Eckerd,Eckerd_Job_Last_question;
        protected string user_id, PhotoButton, Bus_Rule5_Question, Bus_Rule6_Question, Bus_Rule28_Question, Bus_Rule3_Question, Bus_Rule4_Question, Bus_Rule7_Question;
        public string[] vPrompts;
        protected string Str_VisitMonth, Str_visitday, Str_visityear, Str_timein_hrs, Str_timein_min, Str_cmb_timein, Str_timeout_hrs, Str_timeout_min, Str_cmb_timeout, Type_Browser;
        protected string Str_txt_mileage, Str_txt_drive, Str_rad_q_Past_Midnight, Str_rad_q_HH_Used, Str_rad_q_Ret_store_visit, AddressRule, NameRule, DateRule;
        protected string Str_Radio_EShelf, Str_Ask_EShelf_Question, Str_Bus_Rule3_Question, Str_rad_q_BR3, Str_Bus_Rule4_Question, Str_rad_q_BR4, Str_Bus_Rule5_Question;
    protected string Str_rad_q_BR5, Str_Bus_Rule6_Question, Str_rad_q_BR6, Str_Bus_Rule7_Question, Str_rad_q_BR7, Str_Bus_Rule28_Question, Str_rad_q_BR28, chainstorelstSA, selchainstoreSA, Str_Sv_Panel_id;
        protected int Lang_id,Back_Slash, Dot, Dash;
        private string Str_Request_Method;
        protected bool Type_Chrome;  

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

        ptAppTranslation = new PromptTranslation("CFPictureGetFileOption.aspx", WebAppClass.PromptsLanguageId.ToString(), WebAppClass.LanguageId, WebAppClass.CurrentSQLDBConnection, WebAppClass.MultiLanguageCount);
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
                            WebAppClass.Set_MerchforForm(this.Merch_no, Convert.ToString(WebAppClass.MerchNo));
                    //***************************** hidden variables
                            Lang_id = WebAppClass.LanguageId;
                            //Response.Write(Lang_id);
                            Type_Browser = Request.Browser.Browser;
                            Type_Chrome = Request.UserAgent.Contains("Chrome");
                            //Response.Write("Type_Browser=" + Type_Browser + "<BR>");
                            Type_Browser = "IE";

                            string StrFileUpdatePath = ConfigurationManager.AppSettings["FileUpdatePath"];
                            //Response.Write("StrFileUpdatePath=" + StrFileUpdatePath);
                            StrFileUpdatePath = StrFileUpdatePath + "sparEyesPic" + Convert.ToString(Lang_id) + "\\\\update\\\\";
                            //Response.Write("StrFileUpdatePath=" + StrFileUpdatePath + "<BR>");
                            //****** System Rules
                            DataTable RuleTab = new DataTable();
                            RuleTab = GetSystemRules();

                            AddressRule = RuleTab.Rows[5][2].ToString();
                            // Response.Write("AddressRule=" + AddressRule);

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
                            NewScreenPage = Request.Form["NewScreenPage"];
                            chainstorelstSA = Request.Form["chainstorelstSA"];
                            selchainstoreSA = Request.Form["selchainstoreSA"];

                            Job_No= Request.Form["Job_No"];
                            //Response.Write("Job_No=" + Job_No);
                            Wave_No= Request.Form["Wave_No"];
                            Task_No= Request.Form["Task_No"];
                            Task_Desc= Request.Form["Task_Desc"];
                            Task_Addtl_Desc= Request.Form["Task_Addtl_Desc"];

                            store_id= Request.Form["store_id"];

                            Chain_No= Request.Form["Chain_No"];
                            Store_Chain_Desc= Request.Form["Store_Chain_Desc"];
                            Store_No= Request.Form["Store_No"];
                            Store_Store_Name= Request.Form["Store_Store_Name"];
                            Store_Street_Addr= Request.Form["Store_Street_Addr"];
                            Store_City= Request.Form["Store_City"];
                            Store_State= Request.Form["Store_State"];
                            Store_Zip= Request.Form["Store_Zip"];

                            CA_merch_no= Request.Form["CA_merch_no"];
                            Str_Merch_no = Request.Form["Str_Merch_no"];
                            Merch_First_Name= Request.Form["Merch_First_Name"];
                            Merch_Last_Name= Request.Form["Merch_Last_Name"];
                            Merch_Street_Addr= Request.Form["Merch_Street_Addr"];
                            Merch_Street_Addr2= Request.Form["Merch_Street_Addr2"];
                            Merch_City= Request.Form["Merch_City"];
                            Merch_State= Request.Form["Merch_State"];
                            Merch_Zip= Request.Form["Merch_Zip"];
                            Merch_Phone_No= Request.Form["Merch_Phone_No"];
                            Merch_Email_Addr= Request.Form["Merch_Email_Addr"];


                            Field_Start_Dt= Request.Form["Field_Start_Dt"];
                            Field_end_Dt= Request.Form["Field_end_Dt"];
                            Key_Comp_Dt= Request.Form["Key_Comp_Dt"];
                            DOA_Dt= Request.Form["DOA_Dt"];

                            TodayDate = Request.Form["TodayDate"];		
                            			
                            visit_no= Request.Form["visit_no"];

                            Collect_iVR_Time= Request.Form["Collect_iVR_Time"];
                            night_visits= Request.Form["night_visits"];
                            Mileage_flag= Request.Form["Mileage_flag"];
                            Travel_flag= Request.Form["Travel_flag"];

                            Job_Type= Request.Form["Job_Type"];
                            Business_Type_id= Request.Form["Business_Type_id"];

                            Work_Type_id= Request.Form["Work_Type_id"];
                            Work_Type_Desc= Request.Form["Work_Type_Desc"];

                            Data_Col_Method= Request.Form["Data_Col_Method"];
                            overwritetime= Request.Form["overwritetime"];
                            All_Data_Received= Request.Form["All_Data_Received"];
                            collect_time_only= Request.Form["collect_time_only"];
                            Ask_Q_HH_Used= Request.Form["Ask_Q_HH_Used"];
                            HH_Status_Flag= Request.Form["HH_Status_Flag"];

                            Collect_Header= Request.Form["Collect_Header"];
                            Collect_Call_Form= Request.Form["Collect_Call_Form"];

                            SS_Callform= Request.Form["SS_Callform"];
                            Prod_Specific= Request.Form["Prod_Specific"];
                            qdef_skippattern= Request.Form["qdef_skippattern"];

                            Max_Mx_Per_Store= Request.Form["Max_Mx_Per_Store"];
                            Max_Visit_Per_Store_Mx= Request.Form["Max_Visit_Per_Store_Mx"];

                            Collect_Store_Mgr_Name= Request.Form["Collect_Store_Mgr_Name"];

                            Product_Check_Flag= Request.Form["Product_Check_Flag"];

                            Ask_EShelf_Question= Request.Form["Ask_EShelf_Question"];

                            Call_Form_Type_No= Request.Form["Call_Form_Type_No"];

                            Est_instore_minutes= Request.Form["Est_instore_minutes"];
                            Business_Rule_Eckerd= Request.Form["Business_Rule_Eckerd"];
                            Eckerd_Job_Last_question= Request.Form["Eckerd_Job_Last_question"];

                            user_id= Request.Form["user_id"];
                            PhotoButton= Request.Form["PhotoButton"];
                            Bus_Rule5_Question= Request.Form["Bus_Rule5_Question"];
                            Bus_Rule6_Question= Request.Form["Bus_Rule6_Question"];
                            Bus_Rule28_Question= Request.Form["Bus_Rule28_Question"];
                            Bus_Rule3_Question= Request.Form["Bus_Rule3_Question"];
                            Bus_Rule4_Question= Request.Form["Bus_Rule4_Question"];
                            //Response.Write("Bus_Rule4_Question=" + Bus_Rule4_Question);
                            Bus_Rule7_Question = Request.Form["Bus_Rule7_Question"];

                           //************************ From the page CFJWTValidate.asp
                           // visit date 
                            Str_VisitMonth = Request.Form["ctl00$ContentPlaceHolder1$txt_visitmonth"];
                            //Response.Write("Str_VisitMonth=" + Str_VisitMonth + "<BR>");

                            Str_visitday = Request.Form["ctl00$ContentPlaceHolder1$txt_visitday"];
                           // Response.Write("Str_visitday=" + Str_visitday + "<BR>");

                            Str_visityear = Request.Form["ctl00$ContentPlaceHolder1$txt_visityear"];
                           // Response.Write("Str_visityear=" + Str_visityear + "<BR>");

                            if (string.IsNullOrEmpty(Str_VisitMonth) == true)
                            {
                                Str_VisitMonth = Request.Form["Str_VisitMonth"];
                                // Response.Write("Str_VisitMonth=" + Str_VisitMonth + "<BR>");

                                Str_visitday = Request.Form["Str_visitday"];
                                 // Response.Write("Str_visitday=" + Str_visitday + "<BR>");

                                Str_visityear = Request.Form["Str_visityear"];
                                  //Response.Write("Str_visityear=" + Str_visityear + "<BR>");

                            }
                           //Time in and out     
                            Str_timein_hrs = Request.Form["ctl00$ContentPlaceHolder1$txt_timein_hrs"];
                             //Response.Write("Str_timein_hrs=" + Str_timein_hrs + "<BR>");
                            Str_timein_min = Request.Form["ctl00$ContentPlaceHolder1$txt_timein_min"];
                           // Response.Write("Str_timein_min=" + Str_timein_min + "<BR>");
                            Str_cmb_timein = Request.Form["ctl00$ContentPlaceHolder1$cmb_timein"];
                            if (string.IsNullOrEmpty(Str_cmb_timein) == true)
                            {
                                Str_cmb_timein = Request.Form["Str_cmb_timein"];
                            }
                            // Response.Write("Str_cmb_timein=" + Str_cmb_timein + "<BR>");


                            Str_timeout_hrs = Request.Form["ctl00$ContentPlaceHolder1$txt_timeout_hrs"];
                           // Response.Write("Str_timeout_hrs=" + Str_timeout_hrs + "<BR>");
                            Str_timeout_min = Request.Form["ctl00$ContentPlaceHolder1$txt_timeout_min"];
                           // Response.Write("Str_timeout_min=" + Str_timeout_min + "<BR>");
                            Str_cmb_timeout = Request.Form["ctl00$ContentPlaceHolder1$cmb_timeout"];
                            if (string.IsNullOrEmpty(Str_cmb_timeout) == true)
                            {
                                Str_cmb_timeout = Request.Form["Str_cmb_timeout"];
                            }
                           //Response.Write("Str_cmb_timeout=" + Str_cmb_timeout + "<BR>");
                          

                           // mileage		
						 
                            Str_txt_mileage= Request.Form["ctl00$ContentPlaceHolder1$txt_mileage"];
                           // Response.Write("Str_txt_mileage=" + Str_txt_mileage + "<BR>");

		                    //drive		
						     Str_txt_drive= Request.Form["ctl00$ContentPlaceHolder1$txt_drive"];
                            //Response.Write("Str_txt_drive=" + Str_txt_drive + "<BR>");

		                    //Time Question
							 
                            Str_rad_q_Past_Midnight= Request.Form["ctl00$ContentPlaceHolder1$rad_q_Past_Midnight"];
                           // Response.Write("Str_rad_q_Past_Midnight=" + Str_rad_q_Past_Midnight + "<BR>");

		                    //Hand Held Question
							 
                             Str_rad_q_HH_Used= Request.Form["ctl00$ContentPlaceHolder1$rad_q_HH_Used"];
                            // Response.Write("Str_rad_q_HH_Used=" + Str_rad_q_HH_Used + "<BR>");
							
		                    //Time Store Visit
							 
                            Str_rad_q_Ret_store_visit= Request.Form["ctl00$ContentPlaceHolder1$rad_q_Ret_store_visit"];
                             //Response.Write("Str_rad_q_Ret_store_visit=" + Str_rad_q_Ret_store_visit + "<BR>");
	
			                //For EShelf 	
						 
                             Str_Radio_EShelf= Request.Form["ctl00$ContentPlaceHolder1$Radio_EShelf"];
                            // Response.Write("Str_Radio_EShelf=" + Str_Radio_EShelf + "<BR>");
						
                             Str_Ask_EShelf_Question= Request.Form["ctl00$ContentPlaceHolder1$Ask_EShelf_Question"];
                            // Response.Write("Str_Ask_EShelf_Question=" + Str_Ask_EShelf_Question + "<BR>");

                            //business rules
                             Str_Bus_Rule3_Question= Request.Form["ctl00$ContentPlaceHolder1$Bus_Rule3_Question"];
                            // Response.Write("Str_Bus_Rule3_Question=" + Str_Bus_Rule3_Question + "<BR>");

                             Str_rad_q_BR3= Request.Form["ctl00$ContentPlaceHolder1$rad_q_BR3"];
                            // Response.Write("Str_rad_q_BR3=" + Str_rad_q_BR3 + "<BR>");

                             Str_Bus_Rule4_Question= Request.Form["ctl00$ContentPlaceHolder1$Bus_Rule4_Question"];
                             //Response.Write("Str_Bus_Rule4_Question=" + Str_Bus_Rule4_Question + "<BR>");

                             Str_rad_q_BR4= Request.Form["ctl00$ContentPlaceHolder1$rad_q_BR4"];
                            // Response.Write("Str_rad_q_BR4=" + Str_rad_q_BR4 + "<BR>");

                             Str_Bus_Rule5_Question= Request.Form["ctl00$ContentPlaceHolder1$Bus_Rule5_Question"];
                            // Response.Write("Str_Bus_Rule5_Question=" + Str_Bus_Rule5_Question + "<BR>");
                             Str_rad_q_BR5= Request.Form["ctl00$ContentPlaceHolder1$rad_q_BR5"];
                           //  Response.Write("Str_rad_q_BR5=" + Str_rad_q_BR5 + "<BR>");

                             Str_Bus_Rule6_Question= Request.Form["ctl00$ContentPlaceHolder1$Bus_Rule6_Question"];
                            // Response.Write("Str_Bus_Rule6_Question=" + Str_Bus_Rule6_Question + "<BR>");
                             Str_rad_q_BR6= Request.Form["ctl00$ContentPlaceHolder1$rad_q_BR6"];
                             //Response.Write("Str_rad_q_BR6=" + Str_rad_q_BR6 + "<BR>");

                             Str_Bus_Rule7_Question= Request.Form["ctl00$ContentPlaceHolder1$Bus_Rule7_Question"];
                             //Response.Write("Str_Bus_Rule7_Question=" + Str_Bus_Rule7_Question + "<BR>");
                             Str_rad_q_BR7= Request.Form["ctl00$ContentPlaceHolder1$rad_q_BR7"];
                            // Response.Write("Str_rad_q_BR7=" + Str_rad_q_BR7 + "<BR>");

                             Str_Bus_Rule28_Question= Request.Form["ctl00$ContentPlaceHolder1$Bus_Rule28_Question"];
                            // Response.Write("Str_Bus_Rule28_Question=" + Str_Bus_Rule28_Question + "<BR>");
                             Str_rad_q_BR28= Request.Form["ctl00$ContentPlaceHolder1$rad_q_BR28"];
                             //Response.Write("Str_rad_q_BR28=" + Str_rad_q_BR28 + "<BR>");

                             Str_txt_Manager_name  = Request.Form["ctl00$ContentPlaceHolder1$txt_Manager_name"];
                             //Response.Write("Str_txt_Manager_name=" + Str_txt_Manager_name + "<BR>");
                             Str_Manager_Title = Request.Form["ctl00$ContentPlaceHolder1$Manager_Title"];
                            // Response.Write("Str_Manager_Title=" + Str_Manager_Title + "<BR>");
                             //Response.Write("Str_rad_q_BR28=" + Str_rad_q_BR28 + "<BR>");
                             Str_Sv_Panel_id = Request.Form["Str_Sv_Panel_id"];

                             if (string.IsNullOrEmpty(Str_timein_hrs) == true)
                                {
                                   Str_timein_hrs = Request.Form["Str_timein_hrs"];
                                   Str_timein_min = Request.Form["Str_timein_min"];
                                   Str_cmb_timein = Request.Form["Str_cmb_timein"];
                                   Str_timeout_hrs = Request.Form["Str_timeout_hrs"];
                                   Str_timeout_min = Request.Form["Str_timeout_min"];
                                   Str_cmb_timeout = Request.Form["Str_cmb_timeout"];
                                   Str_Manager_Title = Request.Form["Str_Manager_Title"];
                                   Str_txt_Manager_name = Request.Form["Str_txt_Manager_name"];
                                 }

                             Job_Visit_Date = Request.Form["Job_Visit_Date"];

                             if (Job_Visit_Date == "0")
                             {
                                 Label6.Text = "";
                                 Display_Job_Visit_Date = "";
                                // Response.Write("Job_Visit_Date=" + Job_Visit_Date + "<BR>");
                             }
                             else
                             {
                                 Display_Job_Visit_Date = ":" + Job_Visit_Date;
                             }
                            //****** Prompts
                            GetPromptTranslation();


                            Client_Access_Flag = "Y";
                            Pre_Approved_Flag = "N";
                            //****** Today's date 
                            DataTable dt2 = Get_CFJWTVisit_Photo(Job_No, Wave_No, Task_No, Chain_No, Store_No, Job_Visit_Date, Str_Merch_no, Str_Sv_Panel_id);
                            Field_Start_Dt = dt2.Rows[0]["Field_Start_Dt"].ToString();
                            DateTime Start_Dt = Convert.ToDateTime(Field_Start_Dt);
                            Field_Start_Dt = clsDateFormat.Date_Format(Start_Dt, 2, DateRule, Date_input);
                            //Response.Write("Field_Start_Dt=" + Field_Start_Dt + "<BR>");

                            Field_end_Dt = dt2.Rows[0]["Field_end_Dt"].ToString();
                            DateTime end_Dt = Convert.ToDateTime(Field_end_Dt);
                            Field_end_Dt = clsDateFormat.Date_Format(end_Dt, 2, DateRule, Date_input);

                            Max_Mx_Per_Store = dt2.Rows[0]["Max_Mx_Per_Store"].ToString();
                            //Response.Write("PEmail_String=" + PEmail_String + "<BR>");
                            Max_Visit_Per_Store_Mx = dt2.Rows[0]["Max_Visit_Per_Store_Mx"].ToString();
                            Key_Comp_Dt = dt2.Rows[0]["Key_Comp_Dt"].ToString();
                            DateTime Comp_Dt = Convert.ToDateTime(Key_Comp_Dt);
                            Key_Comp_Dt = clsDateFormat.Date_Format(Comp_Dt, 2, DateRule, Date_input);

                            //Response.Write("PEmail_String=" + PEmail_String + "<BR>");
                            DOA_Dt = dt2.Rows[0]["DOA_Dt"].ToString();
                            DateTime SDOA_Dt = Convert.ToDateTime(DOA_Dt);
                            DOA_Dt = clsDateFormat.Date_Format(SDOA_Dt, 2, DateRule, Date_input);
                            TodayDate = dt2.Rows[0]["TodayDate"].ToString();
                            if (string.IsNullOrEmpty(store_id) == true)
                            {
                                store_id = dt2.Rows[0]["store_id"].ToString();
                            }

                            Bus_Rule22_Photo = dt2.Rows[0]["Bus_Rule22_Photo"].ToString();
                            Photo_Remain = dt2.Rows[0]["Photo_Remain"].ToString();
                            if (string.IsNullOrEmpty(Str_Sv_Panel_id) == true)
                            {
                                Str_Sv_Panel_id = dt2.Rows[0]["Sv_panel_id"].ToString();
                            }
                            if (Lang_id == 1)
                            {
                                Client_Access_Flag = dt2.Rows[0]["Client_Access_Flag"].ToString();
                                Pre_Approved_Flag = dt2.Rows[0]["Pre_Approved_Flag"].ToString();
                                // Response.Write("Bus_Rule22_Photo=" + Bus_Rule22_Photo + "<BR>");
                                //Response.Write("Pre_Approved_Flag=" + Pre_Approved_Flag + "<BR>");
                                //Pre_Approved_Flag = "Y";
                            }
                            Photo_CF_Access = Request.Form["Photo_CF_Access"];
        
 
    }
#endregion
#region SystemPromptandRule

    private void GetPromptTranslation()
    {
        vPrompts = new string[2];
        vPrompts[0] = "Select single or multipliable photo upload.";
        vPrompts[1] = "Following option is not available for this browser.";
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
    #region Procedures
    private DataTable Get_CFJWTVisit_Photo(String Job_No, String Wave_No, String Task_No, String Chain_No, String Store_No, String Job_Visit_Date, String Str_Merch_no, String Str_Sv_Panel_id)
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

        return AppData.Get_CFJWTVisit_PhotoDates(iTempJob_No, iTempWave_No, iTempTask_No, iTempChain_No, iTempStore_No,Job_Visit_Date, iTempMerchNo,Str_Sv_Panel_id, WebAppClass.CurrentSQLDBConnection);

    }
    #endregion
    #region methods
    private string Date_Format(DateTime StrDate, int ShowType, string DateRule, string Date_input)
    {


        string[] ArrayDateRuleF;
        int f, StrMonth, StrDay, StrYear;
        string StrTodayDate, StrTodayDate2,StrYear1;
        StrTodayDate = "";
        StrTodayDate2 = "";
        ArrayDateRuleF = new string[3];
        ArrayDateRuleF = DateRule.Split(Date_input.ToCharArray());
        StrYear =0;
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
                StrYear = Convert.ToInt32(StrDate.Year.ToString());

                StrTodayDate = StrTodayDate + "" + StrYear;
            }
            if (ArrayDateRuleF[f].ToUpper() == ("yy").ToUpper())
            {
                StrYear1 = StrDate.Year.ToString();
                StrYear = Convert.ToInt32(StrYear1.Substring(2, 2));
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
            StrTodayDate2 = Convert.ToString(StrYear);
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
