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

public partial class CFPictureByQuestionList : System.Web.UI.Page
{
    protected string Job_No, Wave_No, Task_No, Task_Desc, Task_Addtl_Desc, store_id, Date_input, DisplayJWTQuestionsInfo, DisplayResponseInfo, DisplayPQListInfo, DisplayProdList, DisplayProdqList, DisplaySaveBacklist, DisplaySavelist;
    protected string Chain_No, Store_Chain_Desc, Store_No, Store_Store_Name, Store_Street_Addr, Store_City, Store_State, Store_Zip, Photo_CF_Access;
    protected string CA_merch_no, Str_Merch_no, Merch_First_Name, Merch_Last_Name, Merch_Street_Addr, Merch_Street_Addr2, Merch_City, Merch_State, Merch_Zip, Merch_Phone_No, Merch_Email_Addr;
    protected string Field_Start_Dt, Field_end_Dt, Key_Comp_Dt, DOA_Dt, TodayDate, visit_no, Photo_Remain, Client_Access_Flag, Pre_Approved_Flag, NewScreenPage, StrNewCallFormPathLink, Prod_upc, StrJavaVal;
    protected string Collect_iVR_Time, night_visits, Mileage_flag, Travel_flag, Str_Manager_Title, Str_txt_Manager_name, Photo_Q_No, Photo_By_QuestionFlag, Photo_q_text, Photo_q_Res_Val, Photo_Ans_Text, Photo_Prod_upc, Photo_Prod_desc;
    protected string Job_Type, Business_Type_id, Work_Type_id, Work_Type_Desc, Bus_Rule22_Photo, Photo_upload, Photo_q_Confirmation_No, StrFileApprovedPhotoLink;
    protected string Data_Col_Method, overwritetime, All_Data_Received, collect_time_only, Ask_Q_HH_Used, HH_Status_Flag, strPhoto_no, LinkText;
    protected string Collect_Header, Collect_Call_Form, SS_Callform, Prod_Specific, qdef_skippattern, Max_Mx_Per_Store, Max_Visit_Per_Store_Mx, Job_Visit_Date, RTS_Link_Access;
    protected string Collect_Store_Mgr_Name, Product_Check_Flag, Ask_EShelf_Question, Call_Form_Type_No, Est_instore_minutes, Business_Rule_Eckerd, Eckerd_Job_Last_question;
    protected string user_id, PhotoButton, Bus_Rule5_Question, Bus_Rule6_Question, Bus_Rule28_Question, Bus_Rule3_Question, Bus_Rule4_Question, Bus_Rule7_Question, Photo_q_complete;
    public string[] vPrompts;
    protected string Str_VisitMonth, Str_visitday, Str_visityear, Str_timein_hrs, Str_timein_min, Str_cmb_timein, Str_timeout_hrs, Str_timeout_min, Str_cmb_timeout, Type_Browser;
    protected string Str_txt_mileage, Str_txt_drive, Str_rad_q_Past_Midnight, Str_rad_q_HH_Used, Str_rad_q_Ret_store_visit, AddressRule, NameRule, DateRule, CloudSwitch;
    protected string Str_Radio_EShelf, Str_Ask_EShelf_Question, Str_Bus_Rule3_Question, Str_rad_q_BR3, Str_Bus_Rule4_Question, Str_rad_q_BR4, Str_Bus_Rule5_Question, chainstorelstSA, selchainstoreSA;
    protected string Str_rad_q_BR5, Str_Bus_Rule6_Question, Str_rad_q_BR6, Str_Bus_Rule7_Question, Str_rad_q_BR7, Str_Bus_Rule28_Question, Str_rad_q_BR28, StrSwitchServerFlag, AppleIpadUsed, Display_Job_Visit_Date;
    protected int Lang_id, Back_Slash, Dot, Dash;
    private string Str_Request_Method;
    protected bool Type_Chrome, Stripad, StripadChrome;
    protected string JWTInfoText, UseTheCallForm, Nextbutton, return_Message, Excute_SQL, Merch_Message, No_Question_avaliable, Str_Http_URL, Str_HTTP_HOST, Current_URL, Str_SERVER_NAME, RTS_ServerName, RTS_PathName, RTS_Url, Photo_q_CF_type_No, DisplayProdUPCList, Str_Sv_Panel_id, LCServername;

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
            PageFooter.CopyRightText = string.Empty;
            PageFooter.AllRightsReservedText = string.Empty;
        }
        if (WebAppClass.LanguageId.Equals(18))
        {
            PageFooter.CopyRightText = "";
            PageFooter.AllRightsReservedText = "";
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


        Str_Http_URL = Request.ServerVariables["URL"];
        Str_HTTP_HOST = Request.ServerVariables["HTTP_HOST"];
        Current_URL = "http://" + Str_HTTP_HOST.Trim() + "" + Str_Http_URL.Trim() + "";
        Str_SERVER_NAME = Request.ServerVariables["SERVER_NAME"];
        RTS_ServerName = ConfigurationManager.AppSettings["RTSServerName"];
        RTS_PathName = ConfigurationManager.AppSettings["RTSPathName"];
        Boolean StrServerhas;
        string Domain1, Domain2, Domain3,StrFileUpdatePath ;
        string[] ArraySERVER_NAME;
        StrServerhas = Str_SERVER_NAME.Contains("com");        
        if (StrServerhas == false)
        {
            RTS_Url = "http://mi23.sparinc.com/itsnet/its_main.aspx";
        }
        else
        {
            ArraySERVER_NAME = Str_SERVER_NAME.Split(".".ToCharArray());

            Domain1 = ArraySERVER_NAME[0];
            Domain2 = ArraySERVER_NAME[1];
            Domain3 = ArraySERVER_NAME[2];
            RTS_Url = "http://" + RTS_ServerName.Trim() + "." + Domain2.Trim() + "." + Domain3.Trim() + "/itsnet/its_main.aspx";
        }

        //***************************** hidden variables
        Lang_id = WebAppClass.LanguageId;
       // Lang_id = 2;
        //Response.Write(Lang_id);
        Type_Browser = Request.Browser.Browser;
        Type_Chrome = Request.UserAgent.Contains("Chrome");
        //Response.Write("Type_Browser=" + Type_Browser + "<BR>");
        Type_Browser = "IE";
        Type_Browser = Request.UserAgent.ToString();
        //Response.Write("HasChrome=" + Type_Browser + "<BR>");

        Stripad = Request.UserAgent.ToLower().Contains("ipad");
        StripadChrome = Request.UserAgent.ToLower().Contains("crios");
       // Response.Write("Stripad=" + Stripad + "<BR>");
         //Response.Write("StripadChrome=" + StripadChrome + "<BR>");
        AppleIpadUsed = "N";
        if ((StripadChrome == true) && (StripadChrome == true))
        {
            AppleIpadUsed = "Y";
        }
        //Response.Write("AppleIpadUsed=" + AppleIpadUsed + "<BR>");

        if (Lang_id == 1)
        {
            CloudSwitch = ConfigurationManager.AppSettings["CloudSwitchServerUsa"];
          //  Response.Write("CloudSwitchServerUsa=" + CloudSwitch);
        }
        if (Lang_id == 2)
        {
            CloudSwitch = ConfigurationManager.AppSettings["CloudSwitchServerJapan"];
          //  Response.Write("CloudSwitchServerJapan=" + CloudSwitch);
        }
        if (Lang_id == 4)
        {
            CloudSwitch = ConfigurationManager.AppSettings["CloudSwitchServerCanada"];
          //  Response.Write("CloudSwitchServerCanada=" + CloudSwitch);
        }
        if (Lang_id == 5)
        {
            CloudSwitch = ConfigurationManager.AppSettings["CloudSwitchServerTurkey"];
           // Response.Write("CloudSwitchServerTurkey=" + CloudSwitch);
        }
        if (Lang_id == 6)
        {
            CloudSwitch = ConfigurationManager.AppSettings["CloudSwitchServerSouthAfrica"];
          //  Response.Write("CloudSwitchServerSouthAfrica=" + CloudSwitch);
        }
        if (Lang_id == 7)
        {
            CloudSwitch = ConfigurationManager.AppSettings["CloudSwitchServerIndia"];
          //  Response.Write("CloudSwitchServerIndia=" + CloudSwitch);
        }
        if (Lang_id == 8)
        {
            CloudSwitch = ConfigurationManager.AppSettings["CloudSwitchServerRomania"];
         //   Response.Write("CloudSwitchServerRomania=" + CloudSwitch);
        }
        if (Lang_id == 9)
        {
            CloudSwitch = ConfigurationManager.AppSettings["CloudSwitchServerUsa"];
           // Response.Write("CloudSwitchServerUsa9=" + CloudSwitch);
        }
        if (Lang_id == 10)
        {
            CloudSwitch = ConfigurationManager.AppSettings["CloudSwitchServerChina"];
           // Response.Write("CloudSwitchServerChina=" + CloudSwitch);
        }
        if (Lang_id == 11)
        {
            CloudSwitch = ConfigurationManager.AppSettings["CloudSwitchServerLithuania"];
           // Response.Write("CloudSwitchServerLithuania=" + CloudSwitch);
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
          //  Response.Write("CloudSwitchServerMexico=" + CloudSwitch);
        }
        if (Lang_id == 17)
        {
            CloudSwitch = ConfigurationManager.AppSettings["CloudSwitchServerIndia"];
            //Response.Write("CloudSwitchServerIndia=" + CloudSwitch);
        }
        if (Lang_id == 19)
        {
            CloudSwitch = ConfigurationManager.AppSettings["CloudSwitchServerBrazil"];
           // Response.Write("CloudSwitchServerBrazil=" + CloudSwitch);
        }
       // Response.Write("<BR> CloudSwitch=" + CloudSwitch + "<BR>");

        if (CloudSwitch == "Y")
        {
            StrFileUpdatePath = ConfigurationManager.AppSettings["FileUpdatePathfsx"];
            //Response.Write("StrFileUpdatePath=" + StrFileUpdatePath);


            StrFileApprovedPhotoLink = ConfigurationManager.AppSettings["FileApprovedPhotoLinkfsx"];
        }
        else
        {
            StrFileUpdatePath = ConfigurationManager.AppSettings["FileUpdatePath"];
            //Response.Write("StrFileUpdatePath=" + StrFileUpdatePath);
            

            StrFileApprovedPhotoLink = ConfigurationManager.AppSettings["FileApprovedPhotoLink"];
            
        }
        //Switching server for photo
      //  StrFileUpdatePath = StrFileUpdatePath + "sparEyesPic" + Convert.ToString(Lang_id) + "\\\\update\\\\";
        // Response.Write("StrFileUpdatePath=" + StrFileUpdatePath + "<BR>");

       // StrFileApprovedPhotoLink = StrFileApprovedPhotoLink + "" + Convert.ToString(Lang_id) + "\\\\update\\\\";
        // Response.Write("StrFileApprovedPhotoLink=" + StrFileApprovedPhotoLink + "<BR>");

        if (Lang_id == 1)
        {
            StrSwitchServerFlag = ConfigurationManager.AppSettings["PhotoSwitchServerUsa"];
            // Response.Write("PhotoEmailUsa=" + StrSwitchServerFlag);
        }
        if (Lang_id == 2)
        {
            StrSwitchServerFlag = ConfigurationManager.AppSettings["PhotoSwitchServerJapan"];
            // Response.Write("PhotoEmailJapan=" + StrSwitchServerFlag);
        }
        if (Lang_id == 4)
        {
            StrSwitchServerFlag = ConfigurationManager.AppSettings["PhotoSwitchServerCanada"];
            //Response.Write("PhotoEmailCanada=" + StrSwitchServerFlag);
        }
        if (Lang_id == 5)
        {
            StrSwitchServerFlag = ConfigurationManager.AppSettings["PhotoSwitchServerTurkey"];
            //Response.Write("PhotoEmailTurkey=" + StrSwitchServerFlag);
        }
        if (Lang_id == 6)
        {
            StrSwitchServerFlag = ConfigurationManager.AppSettings["PhotoSwitchServerSouthAfrica"];
            //Response.Write("PhotoEmailSouthAfrica=" + StrSwitchServerFlag);
        }
        if (Lang_id == 7)
        {
            StrSwitchServerFlag = ConfigurationManager.AppSettings["PhotoSwitchServerIndia"];
            //Response.Write("PhotoEmailIndia=" + StrSwitchServerFlag);
        }
        if (Lang_id == 8)
        {
            StrSwitchServerFlag = ConfigurationManager.AppSettings["PhotoSwitchServerRomania"];
            //Response.Write("PhotoEmailRomania=" + StrSwitchServerFlag);
        }
        if (Lang_id == 9)
        {
            StrSwitchServerFlag = ConfigurationManager.AppSettings["PhotoSwitchServerUsa"];
            //Response.Write("PhotoEmailUsa=" + StrSwitchServerFlag);
        }
        if (Lang_id == 10)
        {
            StrSwitchServerFlag = ConfigurationManager.AppSettings["PhotoSwitchServerChina"];
            //Response.Write("PhotoEmailChina=" + StrSwitchServerFlag);
        }
        if (Lang_id == 11)
        {
            StrSwitchServerFlag = ConfigurationManager.AppSettings["PhotoSwitchServerLithuania"];
            //Response.Write("PhotoEmailLithuania=" + StrSwitchServerFlag);
        }
        if (Lang_id == 12)
        {
            StrSwitchServerFlag = ConfigurationManager.AppSettings["PhotoSwitchServerAustralia"];
            //Response.Write("PhotoEmailAustralia=" + StrSwitchServerFlag);
        }
        if (Lang_id == 13)
        {
            StrSwitchServerFlag = ConfigurationManager.AppSettings["PhotoSwitchServerUsa"];
            //Response.Write("PhotoEmailUsa=" + StrSwitchServerFlag);
        }
        if (Lang_id == 15)
        {
            StrSwitchServerFlag = ConfigurationManager.AppSettings["PhotoSwitchServerChina"];
            //Response.Write("PhotoEmailChina=" + StrSwitchServerFlag);
        }
        if (Lang_id == 16)
        {
            StrSwitchServerFlag = ConfigurationManager.AppSettings["PhotoSwitchServerMexico"];
            //Response.Write("PhotoEmailMexico=" + StrSwitchServerFlag);
        }
        if (Lang_id == 17)
        {
            StrSwitchServerFlag = ConfigurationManager.AppSettings["PhotoSwitchServerIndia"];
            //Response.Write("PhotoEmailIndia=" + StrSwitchServerFlag);
        }


        //****** System Rules
        DataTable RuleTab = new DataTable();
        RuleTab = GetSystemRules();

        AddressRule = RuleTab.Rows[5][2].ToString();
        // Response.Write("AddressRule=" + AddressRule);

        DateRule = RuleTab.Rows[1][2].ToString();
        // Response.Write("DateRule=" + DateRule);

        NameRule = RuleTab.Rows[0][2].ToString();
        //Response.Write("NameRule=" + NameRule);
        RTS_Link_Access = RuleTab.Rows[6][2].ToString();
       // Response.Write("RTS_Link_Access=" + RTS_Link_Access);  
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
        StrNewCallFormPathLink = ConfigurationManager.AppSettings["NewCallFormPathLink"];
        // Response.Write("StrNewCallFormPathLink=" + StrNewCallFormPathLink);
        // Response.Write("StrNewCallFormPathLink=" + StrNewCallFormPathLink);
        if (Lang_id != 1)
        {
            if (Lang_id != 13)
            {
                StrNewCallFormPathLink = StrNewCallFormPathLink.Replace("webreportms", "sparinc");
                //ElementAnswer = ElementAnswer.Replace("\n", " ");  
            }
        }

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


        NewScreenPage = Request.Form["NewScreenPage"];
        //Response.Write("NewMerchPage=" + NewMerchPage);
        chainstorelstSA = Request.Form["chainstorelstSA"];
        selchainstoreSA = Request.Form["selchainstoreSA"];
        Job_No = Request.Form["Job_No"];
        //Response.Write("Job_No=" + Job_No);
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
        //Response.Write("Str_timein_min=" + Str_timein_min + "<BR>");
        Str_cmb_timein = Request.Form["ctl00$ContentPlaceHolder1$cmb_timein"];
        //Response.Write("Str_cmb_timein=" + Str_cmb_timein + "<BR>");

        Str_timeout_hrs = Request.Form["ctl00$ContentPlaceHolder1$txt_timeout_hrs"];
        // Response.Write("Str_timeout_hrs=" + Str_timeout_hrs + "<BR>");
        Str_timeout_min = Request.Form["ctl00$ContentPlaceHolder1$txt_timeout_min"];
        // Response.Write("Str_timeout_min=" + Str_timeout_min + "<BR>");
        Str_cmb_timeout = Request.Form["ctl00$ContentPlaceHolder1$cmb_timeout"];
        // Response.Write("Str_cmb_timeout=" + Str_cmb_timeout + "<BR>");

        // mileage		

        Str_txt_mileage = Request.Form["ctl00$ContentPlaceHolder1$txt_mileage"];
        // Response.Write("Str_txt_mileage=" + Str_txt_mileage + "<BR>");

        //drive		
        Str_txt_drive = Request.Form["ctl00$ContentPlaceHolder1$txt_drive"];
        //Response.Write("Str_txt_drive=" + Str_txt_drive + "<BR>");

        //Time Question

        Str_rad_q_Past_Midnight = Request.Form["ctl00$ContentPlaceHolder1$rad_q_Past_Midnight"];
        // Response.Write("Str_rad_q_Past_Midnight=" + Str_rad_q_Past_Midnight + "<BR>");

        //Hand Held Question

        Str_rad_q_HH_Used = Request.Form["ctl00$ContentPlaceHolder1$rad_q_HH_Used"];
        // Response.Write("Str_rad_q_HH_Used=" + Str_rad_q_HH_Used + "<BR>");

        //Time Store Visit

        Str_rad_q_Ret_store_visit = Request.Form["ctl00$ContentPlaceHolder1$rad_q_Ret_store_visit"];
        //Response.Write("Str_rad_q_Ret_store_visit=" + Str_rad_q_Ret_store_visit + "<BR>");

        //For EShelf 	

        Str_Radio_EShelf = Request.Form["ctl00$ContentPlaceHolder1$Radio_EShelf"];
        // Response.Write("Str_Radio_EShelf=" + Str_Radio_EShelf + "<BR>");

        Str_Ask_EShelf_Question = Request.Form["ctl00$ContentPlaceHolder1$Ask_EShelf_Question"];
        // Response.Write("Str_Ask_EShelf_Question=" + Str_Ask_EShelf_Question + "<BR>");

        //business rules
        Str_Bus_Rule3_Question = Request.Form["ctl00$ContentPlaceHolder1$Bus_Rule3_Question"];
        // Response.Write("Str_Bus_Rule3_Question=" + Str_Bus_Rule3_Question + "<BR>");

        Str_rad_q_BR3 = Request.Form["ctl00$ContentPlaceHolder1$rad_q_BR3"];
        // Response.Write("Str_rad_q_BR3=" + Str_rad_q_BR3 + "<BR>");

        Str_Bus_Rule4_Question = Request.Form["ctl00$ContentPlaceHolder1$Bus_Rule4_Question"];
        //Response.Write("Str_Bus_Rule4_Question=" + Str_Bus_Rule4_Question + "<BR>");

        Str_rad_q_BR4 = Request.Form["ctl00$ContentPlaceHolder1$rad_q_BR4"];
        // Response.Write("Str_rad_q_BR4=" + Str_rad_q_BR4 + "<BR>");

        Str_Bus_Rule5_Question = Request.Form["ctl00$ContentPlaceHolder1$Bus_Rule5_Question"];
        // Response.Write("Str_Bus_Rule5_Question=" + Str_Bus_Rule5_Question + "<BR>");
        Str_rad_q_BR5 = Request.Form["ctl00$ContentPlaceHolder1$rad_q_BR5"];
        //  Response.Write("Str_rad_q_BR5=" + Str_rad_q_BR5 + "<BR>");

        Str_Bus_Rule6_Question = Request.Form["ctl00$ContentPlaceHolder1$Bus_Rule6_Question"];
        // Response.Write("Str_Bus_Rule6_Question=" + Str_Bus_Rule6_Question + "<BR>");
        Str_rad_q_BR6 = Request.Form["ctl00$ContentPlaceHolder1$rad_q_BR6"];
        //Response.Write("Str_rad_q_BR6=" + Str_rad_q_BR6 + "<BR>");

        Str_Bus_Rule7_Question = Request.Form["ctl00$ContentPlaceHolder1$Bus_Rule7_Question"];
        //Response.Write("Str_Bus_Rule7_Question=" + Str_Bus_Rule7_Question + "<BR>");
        Str_rad_q_BR7 = Request.Form["ctl00$ContentPlaceHolder1$rad_q_BR7"];
        // Response.Write("Str_rad_q_BR7=" + Str_rad_q_BR7 + "<BR>");

        Str_Bus_Rule28_Question = Request.Form["ctl00$ContentPlaceHolder1$Bus_Rule28_Question"];
        // Response.Write("Str_Bus_Rule28_Question=" + Str_Bus_Rule28_Question + "<BR>");
        Str_rad_q_BR28 = Request.Form["ctl00$ContentPlaceHolder1$rad_q_BR28"];
        //Response.Write("Str_rad_q_BR28=" + Str_rad_q_BR28 + "<BR>");

        Str_txt_Manager_name = Request.Form["ctl00$ContentPlaceHolder1$txt_Manager_name"];
        //Response.Write("Str_txt_Manager_name=" + Str_txt_Manager_name + "<BR>");
        Str_Manager_Title = Request.Form["ctl00$ContentPlaceHolder1$Manager_Title"];
        // Response.Write("Str_Manager_Title=" + Str_Manager_Title + "<BR>");
        //Response.Write("Str_rad_q_BR28=" + Str_rad_q_BR28 + "<BR>");

        Job_Visit_Date = Request.Form["Job_Visit_Date"];
         //Response.Write("Job_Visit_Date=" + Job_Visit_Date + "<BR>");
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
        Str_Sv_Panel_id = Request.Form["Str_Sv_Panel_id"];
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
       // Response.Write("Max_Visit_Per_Store_Mx=" + Max_Visit_Per_Store_Mx + "<BR>");
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
        if (string.IsNullOrEmpty(Str_Sv_Panel_id) == true)
        {
            Str_Sv_Panel_id = dt2.Rows[0]["Sv_panel_id"].ToString();
        }
        Bus_Rule22_Photo = dt2.Rows[0]["Bus_Rule22_Photo"].ToString();
        Photo_Remain = dt2.Rows[0]["Photo_Remain"].ToString();

      //  if ((Lang_id == 1) || (Lang_id == 12))
      //  {
            Client_Access_Flag = dt2.Rows[0]["Client_Access_Flag"].ToString();
            Pre_Approved_Flag = dt2.Rows[0]["Pre_Approved_Flag"].ToString();
            // Response.Write("Bus_Rule22_Photo=" + Bus_Rule22_Photo + "<BR>");
            //Response.Write("Pre_Approved_Flag=" + Pre_Approved_Flag + "<BR>");
            //Pre_Approved_Flag = "Y";
       // }
        Photo_CF_Access = Request.Form["Photo_CF_Access"];


       // Response.Write("Job_Visit_Date=" + Job_Visit_Date + "<BR>");
        //Execute the photo check by question procedure
        //*******************q_no,q_text,Response_Val,Ans_Text,q_order_no,Prod_upc,Prod_desc
        int RecordCount = 0;

        DataSet dt = Get_Photo_QuestionCheck(Lang_id, Job_No, Wave_No, Task_No, Chain_No, Store_No, Str_Merch_no, Job_Visit_Date, Str_Sv_Panel_id);
        string StrProd_text = "";
        string strQ_text = "";
        string GV_q_no, D_q_no, Prod_no, D_prod_no, strQ_Res, StrQuestionText, StrResponseText, StrResponseText2, StartPoint, StrQArrtxt, StrAllQuestion;
        string Q_Ans_type, HiddenstrQ_text, Q_Res_val, ProdList_Array, Prod_q_list_Array, Prod_q_SaveBacklist, SaveList, Hid_prod_no, HiddenstrUPC_text, StrUPCText,StrAllProdList;

        int i, q, Pos;
        StringBuilder HTMLText1 = new StringBuilder();
        StringBuilder HTMLText2 = new StringBuilder();
        StringBuilder HTMLText3 = new StringBuilder();
        //************ Save info
        StringBuilder HTMLText4 = new StringBuilder();
        StringBuilder HTMLText5 = new StringBuilder();
        StringBuilder HTMLText6 = new StringBuilder();
        StringBuilder HTMLText7 = new StringBuilder();
        StringBuilder HTMLText8 = new StringBuilder();

        Photo_q_complete = "";
        D_q_no = "000";
        GV_q_no = "";
        Prod_no = "";
        StartPoint = "";
        D_prod_no = "1";
        StrQArrtxt="";
        Prod_q_list_Array = "";
        Prod_q_SaveBacklist = "";
        SaveList = "";
        Hid_prod_no = "";
        StrAllProdList = ""; 
        if (dt.Tables.Count > 0)
        {

             //Lang_id = 2;
            RecordCount = dt.Tables[0].Rows.Count;
            //Response.Write("RecordCount2=" + RecordCount2);
            if (RecordCount > 0)
            {

                StrAllQuestion = "<input type='hidden' id='AllQuestionArray' value='";
                HTMLText3.Append("" + StrAllQuestion + "");


                

                PhotoQGrid.DataSource = dt;
                //Min. Photo Required
                if ((Lang_id == 1) || (Lang_id == 13))
                {
                    
                         BoundField test = new BoundField();
                         test.DataField = "Min_Photo_Req";
                         test.HeaderText = "New Header";
                        // test.ItemStyle = "Center";
                         PhotoQGrid.Columns.Add(test);
                       // PhotoQGrid.Columns.RemoveAt(6);
                    // this will add a column at the end after the photo button
                         PhotoQGrid.Columns.Insert(4, PhotoQGrid.Columns[5]); 
                }
                
                PhotoQGrid.DataBind();

                GridViewRow row = PhotoQGrid.HeaderRow;

                Photo_q_CF_type_No = dt.Tables[0].Rows[0]["Photo_q_CF_type_No"].ToString();
               // Response.Write("Photo_q_CF_type_No=" + Photo_q_CF_type_No);

                Photo_q_Confirmation_No = dt.Tables[0].Rows[0]["Confirmation_no"].ToString();
                // Response.Write("Photo_q_Confirmation_No=" + Photo_q_Confirmation_No);

                Photo_q_complete = dt.Tables[0].Rows[0]["Photo_q_complete"].ToString();
               // Response.Write("Photo_q_complete=" + Photo_q_complete);
                Prod_no = "0";
            

                row.Cells[0].Text = vPrompts[4];
                row.Cells[1].Text = vPrompts[5];
                row.Cells[2].Text = vPrompts[6];
                row.Cells[3].Text = vPrompts[7];
                
               // Response.Write("Lang_id=" + Lang_id + "<BR>");

                if ((Lang_id == 1) || (Lang_id == 13))
                {
                    //add Minimum Photo Requirement only for USA
                    row.Cells[4].Text = vPrompts[38]; //Min. Photo Required
                    //row.Cells[4].Text = vPrompts[14]; //Min. Photo Required
                    // PhotoQGrid.HeaderRow.Cells[4].Visible = false;
                    PhotoQGrid.HeaderRow.Cells[6].Visible = false;

                }
                else
                {
                    //PhotoQGrid.HeaderRow.Cells[4].Visible = false;
                    //PhotoQGrid.HeaderRow.Cells[6].Visible = false;
                }
                

                Display_Q_Confirmation_No.Text = Photo_q_Confirmation_No;
                if (Photo_q_CF_type_No == "1")
                {
                    Prod_q_list_Array = "<input type='hidden' id='ProdqList0' value='";
                    HTMLText5.Append("" + Prod_q_list_Array + "");

                    PhotoQGrid.HeaderRow.Cells[0].Visible = false;
                    i = 0;
                    q = 0;
                    foreach (GridViewRow gvr in PhotoQGrid.Rows)
                    {
                        // Response.Write("i=" + i);
                        if ((Lang_id == 1) || (Lang_id == 13))
                        {
                            
                            gvr.Cells[6].Visible = false;
                            gvr.Cells[4].Attributes.CssStyle["text-align"] = "center";
                        }
                        
                        
                        strQ_text = gvr.Cells[1].Text;
                        //Response.Write("strQ_text=" + strQ_text + "<BR>");

                        strQ_Res = gvr.Cells[2].Text;
                        //Response.Write("strQ_Res=" + strQ_Res + "<BR>");

                        GV_q_no = strQ_text.Substring(0, 3);
                        // Response.Write("GV_q_no=" + GV_q_no + "<BR>");
                        //StrGridDates = StrGridDates.Trim() + str.Trim() + "|";
                        Q_Ans_type = dt.Tables[0].Rows[i]["Ans_type"].ToString();
                        //Response.Write("Q_Ans_type=" + Q_Ans_type);
                        if (Q_Ans_type == "R" || Q_Ans_type == "C" || Q_Ans_type == "L")
                        {
                            Pos = strQ_Res.IndexOf("-");
                            Q_Res_val = strQ_Res.Substring(0, Pos);
                            //Response.Write("Q_Res_val=" + Q_Res_val + "<BR>");
                        }
                        else
                        {
                            Q_Res_val = "0";
                        }
                        Prod_no = "0";
  
                        HiddenstrQ_text = "" + Q_Ans_type + "_" + strQ_text + "";
                        StrQuestionText = "<input type='hidden' id='Q" + GV_q_no.Trim() + "_" + Prod_no + "' value='" + HiddenstrQ_text + "'>";
                        HTMLText1.Append("" + StrQuestionText + "");

                        Prod_q_SaveBacklist = "<input type='hidden' id='SaveBacklist0_" + GV_q_no.Trim() + "' value=''>";
                        HTMLText6.Append("" + Prod_q_SaveBacklist + "");




                        strPhoto_no = "";
                        strPhoto_no = gvr.Cells[3].Text;
                        //Response.Write("strPhoto_no=" + strPhoto_no + "<BR>");
                        if (Convert.ToInt32(strPhoto_no) > 0)
                        {
                            Prod_upc = "";
                            StrJavaVal = "'" + Lang_id + "','" + Job_No + "','" + Wave_No + "','" + Task_No + "','" + Chain_No + "','" + Store_No + "','" + Str_Merch_no + "','" + Job_Visit_Date.Trim() + "','" + GV_q_no + "','" + Q_Res_val + "','" + Prod_no + "'";
                            StrJavaVal = "onclick=" + '"' + "PhotoPopUp(" + StrJavaVal + ");return false;" + '"' + "";
                            // Response.Write("StrJavaVal=" + StrJavaVal + "<BR>");
                            LinkText = "<a id='PNLink' href='#' " + StrJavaVal + " style='text-decoration:underline'>" + strPhoto_no + " - " + vPrompts[37] + "</a>";
                            // Response.Write("LinkText=" + LinkText + "<BR>");
                            gvr.Cells[3].Text = LinkText;
                        }


                        gvr.Cells[0].Visible = false;
                        if (GV_q_no == D_q_no)
                        {
                            // Response.Write("test");
                            PhotoQGrid.Rows[i].Cells[1].Text = "";
                           // PhotoQGrid.Rows[i].Cells[4].Text = "";
                            q = i - 1;
                            PhotoQGrid.Rows[q].Cells[1].Style.Add("border-bottom-width", "1px");
                            PhotoQGrid.Rows[q].Cells[1].Style.Add("border-bottom-color", "white");
                            PhotoQGrid.Rows[q].Cells[1].Style.Add("border-bottom-style", "solid");

                          //  PhotoQGrid.Rows[q].Cells[4].Style.Add("border-bottom-width", "1px");
                           // PhotoQGrid.Rows[q].Cells[4].Style.Add("border-bottom-color", "white");
                           // PhotoQGrid.Rows[q].Cells[4].Style.Add("border-bottom-style", "solid");

                        }
                        if (GV_q_no != D_q_no)
                        {
                            if (StartPoint == "N")
                            {
                                HTMLText2.Append("'>");
                            }

                            StrResponseText = "<input type='hidden' id='R" + GV_q_no.Trim() + "_" + Prod_no + "' value='";
                            HTMLText2.Append("" + StrResponseText + "");

                            StrQArrtxt = "" + GV_q_no.Trim() + "|";
                            HTMLText3.Append("" + StrQArrtxt + "");
                            HTMLText5.Append("" + StrQArrtxt + "");

                        }
                        // PhotoQGrid.Rows[1].Cells[2].Visible = false;
                        // PhotoQGrid.Rows[1].Cells[1].BorderColor = System.Drawing.Color.MintCream;  
                        // PhotoQGrid.Rows[2].Cells[1].Text = "";
                        //PhotoQGrid.Rows[2].Cells[4].Text = "";
                        StrResponseText2 = "" + strQ_Res.Trim() + "|";
                        HTMLText2.Append("" + StrResponseText2 + "");
                        StartPoint = "N";
                        i = i + 1;
                        D_q_no = GV_q_no;
                    }
                    HTMLText2.Append("'>");
                    HTMLText3.Append("'>");
                    HTMLText5.Append("'>");
                    ProdList_Array = "<input type='hidden' id='AllProdList' value='0'>";
                    SaveList = "<input type='hidden' id='Savelist0' value=''>";
                    HTMLText7.Append("" + SaveList + "");
                    HTMLText4.Append("" + ProdList_Array + "");
                    //Response.Write("StrArrayDates=" + StrArrayDates);
                    Display_Q_Confirmation_Msg.Text = "" + vPrompts[8] + "";
                   // PhotoQGrid.Columns["ColumnName"].DisplayIndex = 2;
                

                }
                else
                {
                    Display_Q_Confirmation_Msg.Text = "" + vPrompts[9] + "";
                    i = 0;
                    q = 0;
                    foreach (GridViewRow gvr in PhotoQGrid.Rows)
                    {

                        // Response.Write("i=" + i);
                        if ((Lang_id == 1) || (Lang_id == 13))
                        {

                            gvr.Cells[6].Visible = false;
                            gvr.Cells[4].Attributes.CssStyle["text-align"] = "center";
                        }

                        //Response.Write("i=" + i);
                        strQ_text = gvr.Cells[1].Text;
                        //Response.Write("strQ_text=" + strQ_text + "<BR>");
                        GV_q_no = strQ_text.Substring(0, 3);
                         //Response.Write("GV_q_no=" + GV_q_no + "<BR>");

                        strQ_Res = gvr.Cells[2].Text;
                        //Response.Write("strQ_Res=" + strQ_Res + "<BR>");

                        StrProd_text = gvr.Cells[0].Text;
                        //Response.Write("StrProd_text=" + StrProd_text + "<BR>");
                        //Prod_no = StrProd_text.Substring(0, 1);
                        // Response.Write("Prod_no=" + Prod_no + "<BR>");
                        Prod_no = dt.Tables[0].Rows[i]["seq_no"].ToString();
                       // Response.Write("Prod_no=" + Prod_no + "<BR>");


                        Q_Ans_type = dt.Tables[0].Rows[i]["Ans_type"].ToString();
                        //Response.Write("Q_Ans_type=" + Q_Ans_type);
                        if (Q_Ans_type == "R" || Q_Ans_type == "C" || Q_Ans_type == "L")
                        {
                            Pos = strQ_Res.IndexOf("-");
                            Q_Res_val = strQ_Res.Substring(0, Pos);
                            //Response.Write("Q_Res_val=" + Q_Res_val + "<BR>");
                        }
                        else
                        {
                            Q_Res_val = "0";
                        }

                        HiddenstrQ_text = "" + Q_Ans_type + "_" + strQ_text + "";
                        StrQuestionText = "<input type='hidden' id='Q" + GV_q_no.Trim() + "_" + Prod_no + "' value='" + HiddenstrQ_text + "'>";
                        HTMLText1.Append("" + StrQuestionText + "");

                        Prod_q_SaveBacklist = "<input type='hidden' id='SaveBacklist0_" + GV_q_no.Trim() + "' value=''>";
                        HTMLText6.Append("" + Prod_q_SaveBacklist + "");


                        //StrGridDates = StrGridDates.Trim() + str.Trim() + "|";
                        strPhoto_no = "";
                        strPhoto_no = gvr.Cells[3].Text;
                        //Response.Write("strPhoto_no=" + strPhoto_no + "<BR>");
                        if (Convert.ToInt32(strPhoto_no) > 0)
                        {
                            Prod_upc = Prod_no;
                            StrJavaVal = "'" + Lang_id + "','" + Job_No + "','" + Wave_No + "','" + Task_No + "','" + Chain_No + "','" + Store_No + "','" + Str_Merch_no + "','" + Job_Visit_Date.Trim() + "','" + GV_q_no + "','" + Q_Res_val + "','" + Prod_upc + "'";
                            StrJavaVal = "onclick=" + '"' + "PhotoPopUp(" + StrJavaVal + ");return false;" + '"' + "";
                            // Response.Write("StrJavaVal=" + StrJavaVal + "<BR>");
                            LinkText = "<a id='PNLink' href='#' " + StrJavaVal + " style='text-decoration:underline'>" + strPhoto_no + " - " + vPrompts[37] + "</a>";
                            // Response.Write("LinkText=" + LinkText + "<BR>");
                            gvr.Cells[3].Text = LinkText;
                        }

                        if (GV_q_no == D_q_no)
                        {
                            //  Response.Write("test");

                            if (Prod_no == D_prod_no)
                            {
                                PhotoQGrid.Rows[i].Cells[0].Text = "";
                                PhotoQGrid.Rows[i].Cells[1].Text = "";
                                //PhotoQGrid.Rows[i].Cells[4].Text = "";
                                q = i - 1;
                                PhotoQGrid.Rows[q].Cells[0].Style.Add("border-bottom-width", "1px");
                                PhotoQGrid.Rows[q].Cells[0].Style.Add("border-bottom-color", "white");
                                PhotoQGrid.Rows[q].Cells[0].Style.Add("border-bottom-style", "solid");

                                PhotoQGrid.Rows[q].Cells[1].Style.Add("border-bottom-width", "1px");
                                PhotoQGrid.Rows[q].Cells[1].Style.Add("border-bottom-color", "white");
                                PhotoQGrid.Rows[q].Cells[1].Style.Add("border-bottom-style", "solid");

                               // PhotoQGrid.Rows[q].Cells[4].Style.Add("border-bottom-width", "1px");
                               // PhotoQGrid.Rows[q].Cells[4].Style.Add("border-bottom-color", "white");
                               // PhotoQGrid.Rows[q].Cells[4].Style.Add("border-bottom-style", "solid");
                            }

                        }
                        if (Prod_no != Hid_prod_no)
                        {
                            StrAllProdList = StrAllProdList + "" + Prod_no + "|";
                            HiddenstrUPC_text = "" + StrProd_text + "";
                            StrUPCText = "<input type='hidden' id='P" + Prod_no + "' value='" + HiddenstrUPC_text + "'>";
                            HTMLText8.Append("" + StrUPCText + "");
                            D_q_no = "000";
                            if (Prod_q_list_Array != "")
                            {
                                HTMLText5.Append("'>");   
                            }
                            Prod_q_list_Array = "<input type='hidden' id='ProdqList" + Prod_no + "' value='";
                            HTMLText5.Append("" + Prod_q_list_Array + "");

                        }
                       // Response.Write("GV_q_no=" + GV_q_no + "<BR>");
                       // Response.Write("D_q_no=" + D_q_no + "<BR>");

                        if (GV_q_no != D_q_no)
                        {
                            if (StartPoint == "N")
                            {
                                HTMLText2.Append("'>");
                                
                            }

                            StrResponseText = "<input type='hidden' id='R" + GV_q_no.Trim() + "_" + Prod_no + "' value='";
                            HTMLText2.Append("" + StrResponseText + "");

                            StrQArrtxt = "" + GV_q_no.Trim() + "|";
                            HTMLText3.Append("" + StrQArrtxt + "");
                            HTMLText5.Append("" + StrQArrtxt + "");

                        }
                        StrResponseText2 = "" + strQ_Res.Trim() + "|";
                        HTMLText2.Append("" + StrResponseText2 + "");
                        StartPoint = "N";

                        // PhotoQGrid.Rows[1].Cells[2].Visible = false;
                        // PhotoQGrid.Rows[1].Cells[1].BorderColor = System.Drawing.Color.MintCream;  
                        // PhotoQGrid.Rows[2].Cells[1].Text = "";
                        //PhotoQGrid.Rows[2].Cells[4].Text = "";
                        i = i + 1;
                        D_q_no = GV_q_no;
                        D_prod_no = Prod_no;
                        Hid_prod_no = Prod_no;
                    }
                    HTMLText2.Append("'>");
                    HTMLText3.Append("'>");
                    HTMLText5.Append("'>");
                    ProdList_Array = "<input type='hidden' id='AllProdList' value='" + StrAllProdList + "'>";
                    SaveList = "<input type='hidden' id='Savelist0' value=''>";
                    HTMLText7.Append("" + SaveList + "");
                    HTMLText4.Append("" + ProdList_Array + "");
                }
                if (Photo_q_complete == "Y")
                {
                    Display_Q_Confirmation_Msg.Text = "" + vPrompts[13] + "";
                    Display_Q_Confirmation_Msg2.Text = "";
                }

                DisplayJWTQuestionsInfo = HTMLText1.ToString();
                //Question response
                DisplayResponseInfo = HTMLText2.ToString();
                //all the Questions for loop array 
                DisplayPQListInfo = HTMLText3.ToString();
                //List of product names
                DisplayProdList = HTMLText4.ToString();
                //List of product with question list
                DisplayProdqList = HTMLText5.ToString();
                //save each question and product list
                DisplaySaveBacklist = HTMLText6.ToString();
                //each product save list final    
                DisplaySavelist = HTMLText7.ToString();

                //UPC Prod list    
                DisplayProdUPCList = HTMLText8.ToString();
            }
            else
            {
                ShowJWTInfo.InnerHtml = "<span class='reportCriteriaHeader' >No error data avaiable for this J/W/T.</span>";
            }
        }
    }
    #region Procedures
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


    #region SystemPromptandRule
    private void GetPromptTranslation()
    {
        vPrompts = new string[39];
        vPrompts[0] = "Please enter a valid visit date";
        vPrompts[1] = "The Visit date entered is invalid for this Job,Wave and Task.";
        vPrompts[2] = "The Visit date greater than Today`s date";
        vPrompts[3] = "You can not enter more than 255 charaters in the Comment box.";
        vPrompts[4] = "Product(s)";
        vPrompts[5] = "Question(s)";
        vPrompts[6] = "Response(s)";
        vPrompts[7] = "No. of Photos Uploaded";
        vPrompts[8] = "Please upload your photo for the following question(s)";
        vPrompts[9] = "Please upload your photo for the following item(s) and question(s)";
        vPrompts[10] = "You must upload photos for each question in order to be paid for your work. Are you sure you want to continue?";
        vPrompts[11] = "Click Cancel to continue with photo upload.";
        vPrompts[12] = "Click OK to navigate away from this screen.";
        vPrompts[13] = "All required photos are now submitted. Click one of the buttons below to proceed.";
        vPrompts[14] = "(Multiple answers allowed)";
        vPrompts[15] = "(Only one answer allowed)";
        vPrompts[16] = "(Enter a numeric value)";
        vPrompts[17] = "(Enter a valid text)";
        vPrompts[18] = "(Enter a date in mm/dd/yy format)";
        vPrompts[19] = "(Enter a numeric value)";
        vPrompts[20] = "Dollar(s)";
        vPrompts[21] = "Cent(s)";
        vPrompts[22] = "Feet(s)";
        vPrompts[23] = "Inch/Inches";
        vPrompts[24] = "Hour(s)";
        vPrompts[25] = "Minute(s)";
        vPrompts[26] = "Question";
        vPrompts[27] = "Delete";
        vPrompts[28] = "Product";
        vPrompts[29] = "Please wait while the system is processing your request.";
        vPrompts[30] = "Response";
        vPrompts[31] = "Error occurred: The system was unable to delete the photo(s).";
        vPrompts[32] = "The selected photos have been modified successfully.";
        vPrompts[33] = "Please select a photo to delete.";
        vPrompts[34] = "Save";
        vPrompts[35] = "Cancel";
        vPrompts[36] = "Please wait";
        vPrompts[37] = "Edit";
        vPrompts[38] = "Min. Photo Required";
        
        

        ptAppTranslation.DoArrayPromptTranslation(vPrompts);
    }
    private DataTable GetSystemRules()
    {
        DataTable appDT = new DataTable();
        string[] VRule;
        VRule = new string[7];
        VRule[0] = "Name Format";
        VRule[1] = "New Date Format";
        VRule[2] = "Collect Mobile Email";
        VRule[3] = "SPAR Logo";
        VRule[4] = "SPAR Copyright";
        VRule[5] = "Address Format";
        VRule[6] = "RTS Link Access";
        appDT = AppSysRules.Get_RuleValue_ByDescAsDataTable(VRule, WebAppClass.LanguageId, WebAppClass.CurrentSQLDBConnection);
        return appDT;
    }
    #endregion

    protected void CreateButtonLink(object sender, GridViewRowEventArgs e)
    {
        string Photo_q_no, Photo_Res_Val, Photo_Prod_upc, Photo_upc_desc, Photo_q_desc, Photo_Res_desc;

        if (e.Row.RowType == DataControlRowType.DataRow)
        {
            Photo_q_no = Convert.ToString(PhotoQGrid.DataKeys[e.Row.RowIndex].Values[0]);
            Photo_Res_Val = Convert.ToString(PhotoQGrid.DataKeys[e.Row.RowIndex].Values[1]);
            Photo_Prod_upc = Convert.ToString(PhotoQGrid.DataKeys[e.Row.RowIndex].Values[2]);
            //Report_New_Visit = Convert.ToString(PhotoQGrid.DataKeys[e.Row.RowIndex].Values[3]);
            Photo_upc_desc = Convert.ToString(PhotoQGrid.DataKeys[e.Row.RowIndex].Values[3]);
            Photo_q_desc = Convert.ToString(PhotoQGrid.DataKeys[e.Row.RowIndex].Values[4]);
            Photo_Res_desc = Convert.ToString(PhotoQGrid.DataKeys[e.Row.RowIndex].Values[5]);

            Photo_upc_desc ="";
            Photo_q_desc = "";
            Photo_Res_desc ="";
            // Response.Write("Photo_upc_desc=" + Photo_upc_desc);
            //Response.Write("Photo_q_desc=" + Photo_q_desc);
            //Response.Write("Photo_Res_desc=" + Photo_Res_desc);


            Button btnButton2 = (Button)e.Row.FindControl("PhotoBttton_Status");
          //  Response.Write("btnButton2=" + btnButton2 + "<BR>");

            btnButton2.Attributes.Add("onclick", "return QuestionByPhoto_Access('" + Photo_q_no + "','" + Photo_Res_Val + "','" + Photo_Prod_upc + "','" + Photo_upc_desc + "','" + Photo_q_desc + "','" + Photo_Res_desc + "')");
            //if (Report_New_Visit == "Yes")
            //{
            //    Add_New_Visit_Dt.Enabled = false;
            //}


        }
    }
}
