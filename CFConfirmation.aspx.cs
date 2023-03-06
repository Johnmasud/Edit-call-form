using System;
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

public partial class CFConfirmation : System.Web.UI.Page
{
    protected string Str_User_id, user_id, Email_Active_Flag, Str_Merch_no, Job_No, Wave_No, Task_No, Chain_No, Store_No, txt_EmailAdd, txt_Mobile_Email, POutOfStock_no, Error_Message, Error_Flag, HTMLHeader_info, Collect_Mobile_Email, AddressRule, NameRule, DateRule;
    protected int Error_Message_Flag, BusinessQuestion_Flag, OutOfStock_no, Back_Slash, Dot, Dash, ShowType, Lang_id, URL_status;
    protected string store_id, Store_Chain_Desc, Store_Store_Name, Store_Street_Addr, Store_City, Store_State, Store_Zip, Data_Required, MeasurementValue, Decimal_Point;
    protected string PMerch_no, CA_merch_no, Merch_First_Name, Merch_Last_Name, Merch_Street_Addr, Merch_Street_Addr2, Strcookie, NewScreenPage;
    protected string Merch_City, Merch_State, Merch_Zip, Merch_Phone_No, Merch_Email_Addr, Task_Desc, Task_Addtl_Desc, CellPhoneNo, LinkPath;
    protected string Field_Start_Dt, Field_end_Dt, Key_Comp_Dt, DOA_Dt, Job_Type, Business_Type_id, Work_Type_id, Work_Type_Desc, Max_Mx_Per_Store;
    protected string Max_Visit_Per_Store_Mx, visit_no, Collect_iVR_Time, night_visits, Mileage_flag, Travel_flag, Data_Col_Method;
    protected string All_Data_Received, qdef_skippattern, Collect_Header, Collect_Call_Form, SS_Callform, Prod_Specific, overwritetime, Prod_UPC;
    protected string collect_time_only, Ask_Q_HH_Used, HH_Status_Flag, Collect_Store_Mgr_Name, Product_Check_Flag, Ask_EShelf_Question;
    protected string Call_Form_Type_No, Est_instore_minutes, Business_Rule_Eckerd, Eckerd_Job_Last_question, Bus_Rule22_Photo, ArrayEleSubmit;
    protected string Bus_Rule5_Question, Bus_Rule6_Question, Bus_Rule28_Question, Bus_Rule3_Question, Bus_Rule4_Question, Bus_Rule7_Question;
    protected string JWTInfoText, UseTheCallForm, PhotoButton, Nextbutton, return_Message, Excute_SQL, Merch_Message, No_Question_avaliable;
    protected string Date_input, VarDay, Varmonth, StrYear, VarSelect_AM, VarSelect_PM, Strcmb_timein, TodayDate, YearDisplay, CUserId, CIPAddr;
    protected string txt_timein_hrsVal, txt_timein_minVal, txt_timeout_hrsVal, txt_timeout_minVal, Visit_Date,source_visit_dt, txt_Phone1, txt_Phone2, txt_Phone3, CellProvider, Hidden_PhoneStatus;
    protected string Q_No, Q_Text, Q_Text_Short, Q_Type, Ans_Type, Grid_No, skippattern_status, RTS_JWT, STR_RTS_JWT, Used_qty, ShortCallForm, Procedure_ConfirmationInsert;
    protected string Uniq_Ques_Id, stores_specified, prod_upc, prod_activity_id, skip_flag, ElementName, All_ElementName, ArrayAllHtmlElement, ArrayAllQuestionsElement, RTS_Q_No, ArrayRTS_Q_no;
    protected string Prod_Id, Ans_Val, Ans_Text, Nxt_Q_No, Remark, Response_Text_Flag, Ans_Val_High, Ans_Val_Low, JWT, Cuser_id, Str_Manager_Title, Str_txt_Manager_name;
    protected string Str_VisitMonth, Str_visitday, Str_visityear, Str_timein_hrs, Str_timein_min, Str_cmb_timein, Str_timeout_hrs, Str_timeout_min, Str_cmb_timeout;
    protected string Str_txt_mileage, Str_txt_drive, Str_rad_q_Past_Midnight, Str_rad_q_HH_Used, Str_rad_q_Ret_store_visit, chainstorelstSA, selchainstoreSA;
    protected string Str_Radio_EShelf, Str_Ask_EShelf_Question, Str_Bus_Rule3_Question, Str_rad_q_BR3, Str_Bus_Rule4_Question, Str_rad_q_BR4, Str_Bus_Rule5_Question, CFD_VisitDate_Edit;
    protected string Str_rad_q_BR5, Str_Bus_Rule6_Question, Str_rad_q_BR6, Str_Bus_Rule7_Question, Str_rad_q_BR7, Str_Bus_Rule28_Question, Str_rad_q_BR28, Str_Sv_Panel_id, StrNewCallFormPathLink;
    protected string Org_VisitMonth, Org_visitday, Org_visityear, Org_timein_hrs, Org_timein_min, Org_cmb_timein, Org_timeout_hrs, Org_timeout_min, Org_cmb_timeout, Org_txt_mileage, Org_txt_drive, Modify_CallVisit_Flag;
    public string[] vPrompts;
    public DateTime StrDate;
    protected string Star_time, StrInformationDisplay, HPStrArray, DisplayJWTInfo, ShowJWTCheckboxText, showCheckStatus, ShowChecked, RTS_Link_Access, Warning_Message, confirmation_no, Photo_By_QuestionFlag, LCServername, Str_SERVER_NAME;
    private string Str_Request_Method, Photo_Q_No;

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

        ptAppTranslation = new PromptTranslation("CFConfirmation.aspx", WebAppClass.PromptsLanguageId.ToString(), WebAppClass.LanguageId, WebAppClass.CurrentSQLDBConnection, WebAppClass.MultiLanguageCount);
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

    protected void Page_Load(object sender, EventArgs e)
    {
                        WebAppClass.Set_MerchforForm(this.Merch_no, Convert.ToString(WebAppClass.MerchNo));

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
                        //Response.Write("NameRule=" + NameRule);

                        MeasurementValue = RuleTab.Rows[6][2].ToString();
                        //Response.Write("MeasurementValue=" + MeasurementValue);

                        Decimal_Point = RuleTab.Rows[8][2].ToString();
                        //Response.Write("Decimal_Point=" + Decimal_Point);

                        StrNewCallFormPathLink = ConfigurationManager.AppSettings["NewCallFormPathLink"];
                        // Response.Write("StrNewCallFormPathLink=" + StrNewCallFormPathLink);


                        RTS_Link_Access=RuleTab.Rows[9][2].ToString();
                       //Response.Write("RTS_Link_Access=" + RTS_Link_Access);  
                        LinkPath = RuleTab.Rows[10][2].ToString();
                        LinkPath = "http://" + LinkPath + "";

                        Lang_id = WebAppClass.LanguageId;
                        //Response.Write(Lang_id);

                        Str_SERVER_NAME = Request.ServerVariables["SERVER_NAME"];
                        //Response.Write("<BR>Str_SERVER_NAME=" + Str_SERVER_NAME + "<BR>");
                        LCServername = Str_SERVER_NAME.ToLower();
                        //Response.Write("<BR>LCServername=" + LCServername + "<BR>");
                        bool StrContain = LCServername.Contains("china");
                        // Response.Write("<BR>StrContain=" + StrContain + "<BR>");
                        if (StrContain == true)
                        {
                            StrNewCallFormPathLink = StrNewCallFormPathLink.Replace("//app1", "//chinaapp1");
                        }
                        bool StrContain2 = LCServername.Contains("dev2k8");
                        // Response.Write("<BR>StrContain=" + StrContain + "<BR>");
                        if (StrContain2 == true)
                        {
                            StrNewCallFormPathLink = StrNewCallFormPathLink.Replace("//app1", "//dev2k8");
                        }

                        if (Lang_id != 1)
                        {
                            if (Lang_id != 13)
                            {
                                StrNewCallFormPathLink = StrNewCallFormPathLink.Replace("webreportms", "sparinc");
                                //ElementAnswer = ElementAnswer.Replace("\n", " ");  
                            }
                        }
                        // Response.Write("StrNewCallFormPathLink=" + StrNewCallFormPathLink);

                     


                        //****** Prompts
                        GetPromptTranslation();

                        //****** Spar link
                        StringBuilder HTMLTextlink = new StringBuilder();

                        HTMLTextlink.Append("<table   align='center' border='0' >");
                        HTMLTextlink.Append("<tr>");
                        HTMLTextlink.Append("<td align='center'   width='100%'><a  class='hyperlinkmasterpage' href='" + LinkPath + "'>" + vPrompts[69] + "</a>");
                        HTMLTextlink.Append("</td>");
                        HTMLTextlink.Append("</tr>");
                        HTMLTextlink.Append("</table>");

                        SparLinkTool.Text = HTMLTextlink.ToString();

                        StringBuilder HTMLTextlink2 = new StringBuilder();

                        HTMLTextlink2.Append("<table   align='center' border='0' >");
                        HTMLTextlink2.Append("<tr>");
                        HTMLTextlink2.Append("<td align='center'   width='100%'><a  class='hyperlinkmasterpage' href='http://mi11.sparinc.com/callsdeletion/ivr_deletion_main.asp'>" + vPrompts[70] + "</a>");
                        HTMLTextlink2.Append("</td>");
                        HTMLTextlink2.Append("</tr>");
                        HTMLTextlink2.Append("</table>");

                        HomeLink.Text = HTMLTextlink2.ToString();



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

                        //Display JWT INfo
                        ShowJWTCheckboxText = vPrompts[7];
                        DisplayJWTInfo = Request.Form["DisplayJWTInfo"]; 
                        
                        //Response.Write("StrInformationDisplay=" + StrInformationDisplay + "<BR>");
                        if (string.IsNullOrEmpty(DisplayJWTInfo) == true)
                        {
                            DisplayJWTInfo = Request.Form["InformationDisplay"];
                            DisplayJWTInfo = DisplayJWTInfo + "</table>";
                        }
                        
                        //checkbox
                        showCheckStatus = Request.Form["showCheck"];
                        //Response.Write("showCheckStatus=" + showCheckStatus);

                        if (showCheckStatus == "on")
                        {
                            ShowChecked = "Checked";
                        }
                        else
                        {
                            ShowChecked = "";
                        }
                        NewScreenPage = Request.Form["NewScreenPage"];
                        //Response.Write("NewMerchPage=" + NewMerchPage);
                        chainstorelstSA = Request.Form["chainstorelstSA"];
                        selchainstoreSA = Request.Form["selchainstoreSA"];
                        //********************************* hidden variables *****************************
                        Star_time = Request.Form["Star_time"];
                        //Response.Write("Star_time=" + Star_time);
                        Str_User_id = WebAppClass.LoggedUserId;
                        //Response.Write("Str_User_id=" + Str_User_id);

                     
                        CFD_VisitDate_Edit = Convert.ToString(Request.Form["CFD_VisitDate_Edit"]);
                        //Response.Write("CFD_VisitDate_Edit=" + CFD_VisitDate_Edit + "<BR>");

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
                        //Response.Write("Str_VisitMonth=" + Str_VisitMonth + "<BR>");

                        Str_visitday = Request.Form["Str_visitday"];
                        //Response.Write("Str_visitday=" + Str_visitday + "<BR>");

                        Str_visityear = Request.Form["Str_visityear"];
                         //Response.Write("Str_visityear=" + Str_visityear + "<BR>");

                        //*******Time in and out     
                        Str_timein_hrs = Request.Form["Str_timein_hrs"];
                          //Response.Write("Str_timein_hrs=" + Str_timein_hrs + "<BR>");
                        Str_timein_min = Request.Form["Str_timein_min"];
                         //Response.Write("Str_timein_min=" + Str_timein_min + "<BR>");
                        Str_cmb_timein = Request.Form["Str_cmb_timein"];
                         //Response.Write("Str_cmb_timein=" + Str_cmb_timein + "<BR>");

                        Str_timeout_hrs = Request.Form["Str_timeout_hrs"];
                         //Response.Write("Str_timeout_hrs=" + Str_timeout_hrs + "<BR>");
                        Str_timeout_min = Request.Form["Str_timeout_min"];
                          //Response.Write("Str_timeout_min=" + Str_timeout_min + "<BR>");
                        Str_cmb_timeout = Request.Form["Str_cmb_timeout"];
                        //Response.Write("Str_cmb_timeout=" + Str_cmb_timeout + "<BR>");

                        //******** mileage		

                        Str_txt_mileage = Request.Form["Str_txt_mileage"];
                      // Response.Write("Str_txt_mileage=" + Str_txt_mileage + "<BR>");

                        //******** drive		
                        Str_txt_drive = Request.Form["Str_txt_drive"];
                       // Response.Write("Str_txt_drive=" + Str_txt_drive + "<BR>");


        
                        Org_VisitMonth= Request.Form["Org_VisitMonth"];
                         //Response.Write("Org_VisitMonth=" + Org_VisitMonth + "<BR>");
                        Org_visitday= Request.Form["Org_visitday"];
                         //Response.Write("Org_visitday=" + Org_visitday + "<BR>");
                        Org_visityear= Request.Form["Org_visityear"];
                         //Response.Write("Org_visityear=" + Org_visityear + "<BR>");

                        Org_timein_hrs= Request.Form["Org_timein_hrs"];
                         //Response.Write("Org_timein_hrs=" + Org_timein_hrs + "<BR>");
                        Org_timein_min= Request.Form["Org_timein_min"];
                         //Response.Write("Org_timein_min=" + Org_timein_min + "<BR>");
                        Org_cmb_timein= Request.Form["Org_cmb_timein"];
                        //Response.Write("Org_cmb_timein=" + Org_cmb_timein + "<BR>");
                        Org_timeout_hrs= Request.Form["Org_timeout_hrs"];
                         //Response.Write("Org_timeout_hrs=" + Org_timeout_hrs + "<BR>");
                        Org_timeout_min= Request.Form["Org_timeout_min"];
                         //Response.Write("Org_timeout_min=" + Org_timeout_min + "<BR>");
                        Org_cmb_timeout= Request.Form["Org_cmb_timeout"];
                         //Response.Write("Org_cmb_timeout=" + Org_cmb_timeout + "<BR>");
                        Org_txt_mileage= Request.Form["Org_txt_mileage"];
                        // Response.Write("Org_txt_mileage=" + Org_txt_mileage + "<BR>");
                        Org_txt_drive= Request.Form["Org_txt_drive"];
                        // Response.Write("Org_txt_drive=" + Org_txt_drive + "<BR>");
                        Modify_CallVisit_Flag = Request.Form["Modify_CallVisit_Flag"];
                        // Response.Write("Modify_CallVisit_Flag=" + Modify_CallVisit_Flag + "<BR>");

                        //******** Time Question
                        Str_rad_q_Past_Midnight = Request.Form["ctl00$ContentPlaceHolder1$rad_q_Past_Midnight"];
                        if (string.IsNullOrEmpty(Str_rad_q_Past_Midnight) == true)
                        {
                            Str_rad_q_Past_Midnight = Request.Form["Str_rad_q_Past_Midnight"];
                        }
                        
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
                       if (string.IsNullOrEmpty(Str_txt_Manager_name) == false)
                       {
                           if (Str_txt_Manager_name != "")
                           {
                               Str_txt_Manager_name = Str_txt_Manager_name.ToUpper();
                           }
                       }
                        //Response.Write("BeforeStr_txt_mileage=" + Str_txt_mileage + "<BR>");
                       Str_Sv_Panel_id = Request.Form["Str_Sv_Panel_id"];
                      // Response.Write("Str_Sv_Panel_id=" + Str_Sv_Panel_id + "<BR>");
                        
                       string IP_address, Visit_Time1, Visit_Time2, Visit_time, StrVisit_date, Time_IN_date, Time_Out_date, Strcookie, CalTimeIn, CalTimeOut, source_CalTimeIn, source_CalTimeOut, source_Visit_time, source_Time_IN_date, source_Time_Out_date;
                        DateTime Visit_Date2, Visit_Date1;

                        source_Time_IN_date = "";
                        source_Time_Out_date = "";
                        source_Visit_time = "";
                        source_visit_dt = "";
                        try
                        {
                            Visit_Date = clsDateFormat.FunDate_Format(Convert.ToInt32(Str_VisitMonth), Convert.ToInt32(Str_visitday), Str_visityear, ShowType, DateRule, Date_input);
                            if (CFD_VisitDate_Edit == "Y")
                            {
                                source_visit_dt = clsDateFormat.FunDate_Format(Convert.ToInt32(Org_VisitMonth), Convert.ToInt32(Org_visitday), Org_visityear, ShowType, DateRule, Date_input);
                            }
                        }
                        catch (Exception ex)
                        {
                            throw ex;
                        }
                             // Response.Write("Visit_Date=" + Visit_Date + "<BR>");
                        //FromDate = DateTime.Parse(this.textBox1.Text);
                        //ToDate = DateTime.Parse(this.textBox2.Text);

                        //this.textBox3.Text = DateAndTime.DateDiff 


                        if (Collect_iVR_Time == "Y")
                        {
                            CalTimeIn = Str_timein_hrs + ":" + Str_timein_min + " " + Str_cmb_timein;
                            CalTimeOut = Str_timeout_hrs + ":" + Str_timeout_min + " " + Str_cmb_timeout;
                            try
                            {
                                Visit_time = clsDateFormat.CalVisit_Time(Convert.ToInt32(Str_VisitMonth), Convert.ToInt32(Str_visitday), Convert.ToInt32(Str_visityear), CalTimeIn, CalTimeOut, Str_rad_q_Past_Midnight);
                                Time_IN_date = Visit_Date + " " + Str_timein_hrs + ":" + Str_timein_min + " " + Str_cmb_timein;
                                Time_Out_date = Visit_Date + " " + Str_timeout_hrs + ":" + Str_timeout_min + " " + Str_cmb_timeout;
                                if (CFD_VisitDate_Edit == "Y")
                                {
                                    source_CalTimeIn = Org_timein_hrs + ":" + Org_timein_min + " " + Org_cmb_timein;
                                    source_CalTimeOut = Org_timeout_hrs + ":" + Org_timeout_min + " " + Org_cmb_timeout;
                                    // Response.Write("source_CalTimeIn=" + source_CalTimeIn + "<BR>");
                                    // Response.Write("source_CalTimeIn=" + source_CalTimeIn + "<BR>");
                                    source_Visit_time = clsDateFormat.CalVisit_Time(Convert.ToInt32(Org_VisitMonth), Convert.ToInt32(Org_visitday), Convert.ToInt32(Org_visityear), source_CalTimeIn, source_CalTimeOut, Str_rad_q_Past_Midnight);
                                    source_Time_IN_date = source_visit_dt + " " + Org_timein_hrs + ":" + Org_timein_min + " " + Org_cmb_timein;
                                    source_Time_Out_date = source_visit_dt + " " + Org_timeout_hrs + ":" + Org_timeout_min + " " + Org_cmb_timeout;
                                }

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
                            Visit_time = null;
                            source_Time_IN_date = null;
                            source_Time_Out_date = null;
                            source_Visit_time = null;
                        }
                       // Response.Write("source_visit_dt=" + source_visit_dt + "<BR>");
                       
                      //  Response.Write("source_CalTimeOut=" + source_CalTimeOut + "<BR>");
                       // Response.Write("source_Visit_time=" + source_Visit_time + "<BR>");
                       // Response.Write("source_Time_IN_date=" + source_Time_IN_date + "<BR>");
                        // Response.Write("source_Time_Out_date=" + source_Time_Out_date + "<BR>"); 
                            


                       if (Mileage_flag=="N")
                            {
                                Str_txt_mileage =null;
                                Org_txt_mileage=null;    
  
                            }
	                   
	                    if (Travel_flag=="N") 
                            {
                                Str_txt_drive = null;
                                Org_txt_drive = null; 
                            }
	                    
                            Used_qty = "";
                            if (Str_txt_Manager_name== "")
                            {
                                Str_txt_Manager_name = null;
                                Str_Manager_Title = null;
		                    }
                        if (Data_Col_Method=="H")
                            {
                             Str_rad_q_HH_Used = "1";
                            }  
			            else
                            {
                             Str_rad_q_HH_Used = "0";
                            }

                        if (Call_Form_Type_No=="")
                            {
                                Call_Form_Type_No = "1";
						    }
                       if (HH_Status_Flag == "")
                            {
                                HH_Status_Flag = null;
                            }
                       if (Str_Sv_Panel_id == "")
                            {
                                Str_Sv_Panel_id = null;
                            }

                            

                            Strcookie = "";
                            HPStrArray = null;
                            if (Request.Cookies["SPARSMARTTOOLS"] != null)
                            {
                                     Strcookie = Convert.ToString(Request.Cookies["SPARSMARTTOOLS"].Value);
                                     IP_address = Request.ServerVariables["REMOTE_ADDR"];
                                    // Response.Write("Strcookie=" + Strcookie + "<BR>");
                                    // Response.Write("IP_address=" + IP_address + "<BR>");
                                     
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
                                     CUserId = Str_User_id;
                            }
                            else
                            {
                                    IP_address=Request.ServerVariables["REMOTE_ADDR"];
                                    //Response.Write("IP_address=" + IP_address + "<BR>");
                                    CUserId = Str_Merch_no;
                                    CIPAddr = IP_address;
                            }


                  
                            Procedure_ConfirmationInsert = "Job_No=" + Job_No + ",Wave_No=" + Wave_No + ",Task_No=" + Task_No + ",store_id=" + store_id + ",Str_Merch_no=" + Str_Merch_no + ",visit_no=" + visit_no + ",Visit_Date=" + Visit_Date + ",Time_IN_date=" + Time_IN_date + ",Time_Out_date=" + Time_Out_date + ",Visit_time=" + Visit_time + ",HH_Status_Flag=" + HH_Status_Flag + ",Str_rad_q_HH_Used=" + Str_rad_q_HH_Used + ",Str_txt_mileage=" + Str_txt_mileage + ",Str_txt_drive=" + Str_txt_drive + ",Data_Col_Method=" + Data_Col_Method + ",overwritetime=" + overwritetime + ",Work_Type_id=" + Work_Type_id + ",SS_Callform=" + SS_Callform + ",Star_time=" + Star_time + ",Str_Manager_Title=" + Str_Manager_Title + ",Str_txt_Manager_name=" + Str_txt_Manager_name + ",Call_Form_Type_No=" + Call_Form_Type_No + ",HPStrArray=" + HPStrArray + ",Str_User_id=" + Str_User_id + ",CUserId=" + CUserId + ",CIPAddr=" + CIPAddr + "";
                            // Response.Write("Procedure_ConfirmationInsert=" + Procedure_ConfirmationInsert + "<BR>");
                            // Response.End();

                    //Execute the Confirmation procedure
                        //Get_Call_Form_ConfirmationInsert(Job_No, Wave_No, Task_No, store_id, Str_Merch_no, visit_no, Visit_Date, Time_IN_date, Time_Out_date, Visit_time, HH_Status_Flag, Str_rad_q_HH_Used, Str_txt_mileage, Str_txt_drive, Data_Col_Method, overwritetime, Work_Type_id, SS_Callform, Star_time, Str_Manager_Title, Str_txt_Manager_name, Call_Form_Type_No, HPStrArray, Str_User_id, CUserId, CIPAddr);
                             DataTable dt12;
                            if (CFD_VisitDate_Edit == "Y")
                             {
                                  dt12 = Fun_CallHeader_ConfirmationProcedure(Job_No, Wave_No, Task_No, store_id, Str_Merch_no, visit_no, source_visit_dt, source_Time_IN_date, source_Time_Out_date, Org_txt_mileage, Org_txt_drive, Visit_Date, Time_IN_date, Time_Out_date, Str_txt_mileage, Str_txt_drive, Str_User_id, Str_Sv_Panel_id);
                             }
                             else
                             {
                                  dt12 = Get_Call_Form_ConfirmationInsert(Job_No, Wave_No, Task_No, store_id, Str_Merch_no, visit_no, Visit_Date, Time_IN_date, Time_Out_date, Visit_time, HH_Status_Flag, Str_rad_q_HH_Used, Str_txt_mileage, Str_txt_drive, Data_Col_Method, overwritetime, Work_Type_id, SS_Callform, Star_time, Str_Manager_Title, Str_txt_Manager_name, Call_Form_Type_No, HPStrArray, Str_User_id, CUserId, CIPAddr, Str_Sv_Panel_id);
                             }
                             
                        Warning_Message = dt12.Rows[0][0].ToString();
                        return_Message = dt12.Rows[0][1].ToString();
                        confirmation_no = dt12.Rows[0][2].ToString();
                        //Response.Write("Warning_Message=" + Warning_Message + "<BR>");
                        //Response.Write("return_Message=" + return_Message + "<BR>");
                         //Response.Write("confirmation_no=" + confirmation_no + "<BR>");

                        Photo_By_QuestionFlag = "";
                        if (CFD_VisitDate_Edit == "Y")
                        {
                            Photo_By_QuestionFlag = "N";
                        }
                        else
                        {
                            DataSet dt23 = Get_Photo_QuestionCheck(Lang_id, Job_No, Wave_No, Task_No, Chain_No, Store_No, Str_Merch_no, Visit_Date, Str_Sv_Panel_id);
                            // ds.Tables[0].Rows.Count
                            if (dt23.Tables[0].Rows.Count > 0)
                            {
                                Photo_By_QuestionFlag = "Y";
                                confirmation_no = "";
                            }
                            else
                            {
                                Photo_By_QuestionFlag = "N";

                            }
                        }
                        WarningMessage.Text = Warning_Message;
                        confirm_Number.Text = confirmation_no;

    }
    #region Procedures

    //************* Function to insert the data  USP_Call_Form_Confirmation_User
    private DataTable Fun_CallHeader_ConfirmationProcedure(String Job_No, String Wave_No, String Task_No, String Store_id, String Str_Merch_no, String visit_no, String source_visit_dt, String source_Time_IN_date, String source_Time_Out_date, String Org_txt_mileage, String Org_txt_drive, String Visit_Date, String Time_IN_date, String Time_Out_date, String Str_txt_mileage, String Str_txt_drive,String user_id, String Str_Sv_Panel_id)
    {
        Int32 iTempMerchNo = 0;
        Int32 iTempJob_No = 0;
        Int32 iTempWave_No = 0;
        Int32 iTempTask_No = 0;
        Int32 iTempStore_id = 0;
        Int32 iTempvisit_no = 0;
        //string iTempVisit_Date;
        //DateTime iTempTime_IN_date;
        //DateTime iTempTime_Out_date;
        //Decimal iTemptxt_mileage;
        Int32 iTemptxt_drive = 0;
        //Int32 iTempVisit_time = 0;
        Int32 iTemprad_q_HH_Used = 0;
        //DateTime iTempStar_time;
        Int32 iTempWork_Type_Id = 0;
        Int32 iTempCall_Form_Type_No = 0;

        iTempMerchNo = AppUtils.ConvertToInteger32(Str_Merch_no, 0);
        iTempJob_No = AppUtils.ConvertToInteger32(Job_No, 0);
        iTempWave_No = AppUtils.ConvertToInteger32(Wave_No, 0);
        iTempTask_No = AppUtils.ConvertToInteger32(Task_No, 0);
        iTempStore_id = AppUtils.ConvertToInteger32(Store_id, 0);
     
        iTempvisit_no = AppUtils.ConvertToInteger32(visit_no, 0);
  
        iTempCall_Form_Type_No = AppUtils.ConvertToInteger32(Call_Form_Type_No, 0);
       // iTemptxt_drive = AppUtils.ConvertToInteger32(Str_txt_drive, 0);


        return AppData.Get_CallHeader_ConfirmationProcedure(iTempJob_No, iTempWave_No, iTempTask_No, iTempStore_id, iTempMerchNo, iTempvisit_no, source_visit_dt, source_Time_IN_date, source_Time_Out_date, Org_txt_mileage, Org_txt_drive, Visit_Date, Time_IN_date, Time_Out_date, Str_txt_mileage, Str_txt_drive, user_id, Str_Sv_Panel_id, WebAppClass.CurrentSQLDBConnection);
                                                         
    }
    //************* Function to insert the data  USP_Call_Form_Confirmation_User
    private DataTable Get_Call_Form_ConfirmationInsert(String Job_No, String Wave_No, String Task_No, String Store_id, String Str_Merch_no, String visit_no, String Visit_Date, String Time_IN_date, String Time_Out_date, String Visit_time, String HH_Status_Flag, String rad_q_HH_Used, String txt_mileage, String txt_drive, String Data_Col_Method, String overwritetime, String Work_Type_Id, String SS_Callform, String Star_time, String Manager_Title, String Manager_name, String Call_Form_Type_No, String StrArray, String user_id, String CUserId, String CIPAddr, String Str_Sv_Panel_id)
    {
        Int32 iTempMerchNo = 0;
        Int32 iTempJob_No = 0;
        Int32 iTempWave_No = 0;
        Int32 iTempTask_No = 0;
        Int32 iTempStore_id = 0;
        Int32 iTempvisit_no = 0;
        //string iTempVisit_Date;
        //DateTime iTempTime_IN_date;
        //DateTime iTempTime_Out_date;
        //Decimal iTemptxt_mileage;
        Int32 iTemptxt_drive = 0;
        //Int32 iTempVisit_time = 0;
        Int32 iTemprad_q_HH_Used = 0;
        //DateTime iTempStar_time;
        Int32 iTempWork_Type_Id = 0;
        Int32 iTempCall_Form_Type_No = 0;

        iTempMerchNo = AppUtils.ConvertToInteger32(Str_Merch_no, 0);
        iTempJob_No = AppUtils.ConvertToInteger32(Job_No, 0);
        iTempWave_No = AppUtils.ConvertToInteger32(Wave_No, 0);
        iTempTask_No = AppUtils.ConvertToInteger32(Task_No, 0);
        iTempStore_id = AppUtils.ConvertToInteger32(Store_id, 0);

        iTempvisit_no = AppUtils.ConvertToInteger32(visit_no, 0);
        //iTempVisit_time = AppUtils.ConvertToInteger32(Visit_time, 0);
        iTemprad_q_HH_Used = AppUtils.ConvertToInteger32(rad_q_HH_Used, 0);
        //iTemptxt_mileage = Convert.ToDecimal(txt_mileage);
        //iTemptxt_drive = AppUtils.ConvertToInteger32(txt_drive, 0);
        iTempWork_Type_Id = AppUtils.ConvertToInteger32(Work_Type_Id, 0);
        //iTempVisit_Date = Convert.ToDateTime(Visit_Date);
        //iTempVisit_Date = Visit_Date;
        //iTempTime_IN_date =Convert.ToDateTime(Time_IN_date);
        //iTempTime_Out_date = Convert.ToDateTime(Time_Out_date);

        //iTempStar_time = Convert.ToDateTime(Star_time);
        iTempCall_Form_Type_No = AppUtils.ConvertToInteger32(Call_Form_Type_No, 0);
        iTemptxt_drive = AppUtils.ConvertToInteger32(txt_drive, 0);


        return AppData.Get_Call_Form_ConfirmationProcedure(iTempJob_No, iTempWave_No, iTempTask_No, iTempStore_id, iTempMerchNo, iTempvisit_no, Visit_Date, Time_IN_date, Time_Out_date, Visit_time, HH_Status_Flag, iTemprad_q_HH_Used, txt_mileage, txt_drive, Data_Col_Method, overwritetime, iTempWork_Type_Id, SS_Callform, Star_time, Manager_Title, Manager_name, iTempCall_Form_Type_No, StrArray, user_id, CUserId, CIPAddr, Str_Sv_Panel_id, WebAppClass.CurrentSQLDBConnection);

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

        return AppData.Get_USP_Photo_QuestionCheck(Lang_id, iTempJob_No, iTempWave_No, iTempTask_No, iTempChain_No, iTempStore_No, iTempMerchNo, Job_Visit_Date,Str_Sv_Panel_id, WebAppClass.CurrentSQLDBConnection);
    }
   
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
    #region SystemPromptandRule

    private void GetPromptTranslation()
    {
        vPrompts = new string[71];
        vPrompts[0] = "Internet Call Form";
        vPrompts[1] = "Date:";
        vPrompts[2] = "Job No.";
        vPrompts[3] = "Wave No.";
        vPrompts[4] = "Task No.";
        vPrompts[5] = "Chain No.";
        vPrompts[6] = "Store No.";
        vPrompts[7] = "Show Job Information";
        vPrompts[8] = "Page Numbers";
        vPrompts[9] = "Product";
        vPrompts[10] = "Questions";
        vPrompts[11] = "(Multiple answers allowed)";
        vPrompts[12] = "(Only one answer allowed)";
        vPrompts[13] = "(Enter a numeric value)";
        vPrompts[14] = "(Enter a valid text)";
        vPrompts[15] = "(Enter a date in mm/dd/yy format)";
        vPrompts[16] = "QNo.";
        vPrompts[17] = "(Multiple answers allowed)";
        vPrompts[18] = "(Only one answer allowed)";
        vPrompts[19] = "(mm/dd/yy)";
        vPrompts[20] = "Submit";
        vPrompts[21] = "The Next Product for this Job, Wave, task, store, and Chain can not be access at this time.";
        vPrompts[22] = "Please try after an hour.!";
        vPrompts[23] = "No questions setup for this Job, Wave, and Tasks";
        vPrompts[24] = "2001 SPAR Group, Inc. ";
        vPrompts[25] = "All Rights Reserved.";
        vPrompts[26] = "The Information for this Job, Wave, and task cannot be access at this time.";
        vPrompts[27] = "Please logout and log back in again after an hour.";
        vPrompts[28] = "If you are still having problems please call your DMM.!";
        vPrompts[29] = "Ans";
        vPrompts[30] = "Back";
        vPrompts[31] = "Dollar(s)";
        vPrompts[32] = "Cent(s)";
        vPrompts[33] = "Feet(s)";
        vPrompts[34] = "Inche(s)";
        vPrompts[35] = "Hour(s)";
        vPrompts[36] = "Minute(s)";
        vPrompts[37] = "Save";
        vPrompts[38] = "Print";

        vPrompts[39] = "The question";//0
        vPrompts[40] = "has to be numeric.";//1
        vPrompts[41] = "value has to be bigger or equal to";//2
        vPrompts[42] = "value has to be less or equal to";//3
        vPrompts[43] = "Please answer";//4
        vPrompts[44] = "Please enter a valid date for question";//5
        vPrompts[45] = "Please enter a valid Visit Date";//6
        vPrompts[46] = "You must enter both values for question";//7
        vPrompts[47] = "Dollar(s) value has to be numeric";//8
        vPrompts[48] = "Dollar(s) value can not have a period";//9
        vPrompts[49] = "Cent(s) value can not be bigger than 99 cent";//10
        vPrompts[50] = "Cent(s) value has to be numeric";//11
        vPrompts[51] = "Cent(s) value can not have a period";//12
        vPrompts[52] = "Feet(s) value has to be numeric";//13
        vPrompts[53] = "Feet(s) value can not have a period";//14
        vPrompts[54] = "Inche(s) value can not be bigger than 11";//15
        vPrompts[55] = "Inche(s) value can not be less than 0";//16
        vPrompts[56] = "Inche(s) value has to be numeric";//17
        vPrompts[57] = "Inche(s) value can not have a period";//18
        vPrompts[58] = "Hour(s) value has to be numeric";//19
        vPrompts[59] = "Hour(s) value can not have a period";//20
        vPrompts[60] = "Minute(s) value can not be bigger than 59";//21
        vPrompts[61] = "Minute(s) value can not be less than 0";//22
        vPrompts[62] = "Minute(s) value has to be numeric";//23
        vPrompts[63] = "Minute(s) value can not have a period";//24
        vPrompts[64] = "This is an incorrect response to this question.";//25
        vPrompts[65] = "Cent(s) value can not be less than zero.";//26
        vPrompts[66] = "must be a whole number.";//27
        vPrompts[67] = "Invalid value entered for question";//28
        vPrompts[68] = "value can not be less than 0";//29
        vPrompts[69] = "SPAR Tools";
        vPrompts[70] = "Home";

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

    #endregion

}
