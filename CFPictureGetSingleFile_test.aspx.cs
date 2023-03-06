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

public partial class CFPictureGetSingleFile_test : System.Web.UI.Page
{
    protected string Job_No, Wave_No, Task_No, Task_Desc, Task_Addtl_Desc, store_id, AddressRule, NameRule, DateRule,Date_input, VarDay, Varmonth, StrYear;
    protected string Chain_No, Store_Chain_Desc, Store_No, Store_Store_Name, Store_Street_Addr, Store_City, Store_State, Store_Zip;
    protected string CA_merch_no, Str_Merch_no, Merch_First_Name, Merch_Last_Name, Merch_Street_Addr, Merch_Street_Addr2, Merch_City, Merch_State, Merch_Zip, Merch_Phone_No, Merch_Email_Addr;
    protected string Field_Start_Dt, Field_end_Dt, Key_Comp_Dt, DOA_Dt, TodayDate, visit_no;
    protected string Collect_iVR_Time, night_visits, Mileage_flag, Travel_flag,StrFileSave;
    protected string Job_Type, Business_Type_id, Work_Type_id, Work_Type_Desc,Str_Manager_Title, Str_txt_Manager_name;
    protected string Data_Col_Method, overwritetime, All_Data_Received, collect_time_only, Ask_Q_HH_Used, HH_Status_Flag;
    protected string Collect_Header, Collect_Call_Form, SS_Callform, Prod_Specific, qdef_skippattern, Max_Mx_Per_Store, Max_Visit_Per_Store_Mx;
    protected string Collect_Store_Mgr_Name, Product_Check_Flag, Ask_EShelf_Question, Call_Form_Type_No, Est_instore_minutes, Business_Rule_Eckerd, Eckerd_Job_Last_question;
    protected string user_id, PhotoButton, Bus_Rule5_Question, Bus_Rule6_Question, Bus_Rule28_Question, Bus_Rule3_Question, Bus_Rule4_Question, Bus_Rule7_Question;
    public string[] vPrompts;
    protected string Str_VisitMonth, Str_visitday, Str_visityear, Str_timein_hrs, Str_timein_min, Str_cmb_timein, Str_timeout_hrs, Str_timeout_min, Str_cmb_timeout;
    protected string Str_txt_mileage, Str_txt_drive, Str_rad_q_Past_Midnight, Str_rad_q_HH_Used, Str_rad_q_Ret_store_visit, StrFileUpdatePath;
    protected string Str_Radio_EShelf, Str_Ask_EShelf_Question, Str_Bus_Rule3_Question, Str_rad_q_BR3, Str_Bus_Rule4_Question, Str_rad_q_BR4, Str_Bus_Rule5_Question;
    protected string Str_rad_q_BR5, Str_Bus_Rule6_Question, Str_rad_q_BR6, Str_Bus_Rule7_Question, Str_rad_q_BR7, Str_Bus_Rule28_Question, Str_rad_q_BR28;
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
        Response.Write("Str_Request_Method=" + Str_Request_Method + "<BR>");

        SPARHeader PageHeader;
        SPARFooter PageFooter;
        SPARBiLingualBar BiLingualBar;
        PageHeader = (SPARHeader)this.Master.FindControl("SPARHeader1");
        PageFooter = (SPARFooter)this.Master.FindControl("SPARFooter1");
        BiLingualBar = (SPARBiLingualBar)this.Master.FindControl("SPARBiLingualBar1");
        WebAppClass = new SPARValues();
        WebAppClass.PageTitle = "";

        ptAppTranslation = new PromptTranslation("CFPictureGetSingleFile.aspx", WebAppClass.PromptsLanguageId.ToString(), WebAppClass.LanguageId, WebAppClass.CurrentSQLDBConnection, WebAppClass.MultiLanguageCount);
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
                                           // pnl_Upload_Photo.Visible = true;
                                            WebAppClass.Set_MerchforForm(this.Merch_no, Convert.ToString(WebAppClass.MerchNo));
                                            //****** Prompts
                                            GetPromptTranslation();

                                            //****** System Rules
                                            DataTable RuleTab = new DataTable();
                                            RuleTab = GetSystemRules();

                                            AddressRule = RuleTab.Rows[5][2].ToString();
                                            //Response.Write("AddressRule=" + AddressRule);

                                            DateRule = RuleTab.Rows[1][2].ToString();
                                            //Response.Write("DateRule=" + DateRule);

                                            NameRule = RuleTab.Rows[0][2].ToString();
                                            //Response.Write("NameRule=" + NameRule);
                                            
                                          
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
                                            StrYear = clsDateFormat.Date_Format(date, ShowType, DateRule, Date_input);
                                            //Response.Write("StrYear=" + StrYear + "<BR>");
                                        //***************************** hidden variables
                                       Lang_id = WebAppClass.LanguageId;

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
                                      //  Response.Write("Bus_Rule4_Question=" + Bus_Rule4_Question);
                                        Bus_Rule7_Question = Request.Form["Bus_Rule7_Question"];

                                        //************************ From the page CFJWTValidate.asp
                                        // visit date 
                                        Str_VisitMonth = Request.Form["Str_VisitMonth"];
                                        //Response.Write("Str_VisitMonth=" + Str_VisitMonth + "<BR>");

                                        Str_visitday = Request.Form["Str_visitday"];
                                       // Response.Write("Str_visitday=" + Str_visitday + "<BR>");

                                        Str_visityear = Request.Form["Str_visityear"];
                                        //Response.Write("Str_visityear=" + Str_visityear + "<BR>");

                                        //Time in and out     
                                        Str_timein_hrs = Request.Form["Str_timein_hrs"];
                                        //Response.Write("Str_timein_hrs=" + Str_timein_hrs + "<BR>");
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
                                       // Response.Write("Str_txt_mileage=" + Str_txt_mileage + "<BR>");

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
                                       // Response.Write("Str_Bus_Rule3_Question=" + Str_Bus_Rule3_Question + "<BR>");

                                        Str_rad_q_BR3 = Request.Form["Str_rad_q_BR3"];
                                       // Response.Write("Str_rad_q_BR3=" + Str_rad_q_BR3 + "<BR>");

                                        Str_Bus_Rule4_Question = Request.Form["Str_Bus_Rule4_Question"];
                                        //Response.Write("Str_Bus_Rule4_Question=" + Str_Bus_Rule4_Question + "<BR>");

                                        Str_rad_q_BR4 = Request.Form["Str_rad_q_BR4"];
                                       // Response.Write("Str_rad_q_BR4=" + Str_rad_q_BR4 + "<BR>");

                                        Str_Bus_Rule5_Question = Request.Form["Str_Bus_Rule5_Question"];
                                       // Response.Write("Str_Bus_Rule5_Question=" + Str_Bus_Rule5_Question + "<BR>");
                                        Str_rad_q_BR5 = Request.Form["Str_rad_q_BR5"];
                                       // Response.Write("Str_rad_q_BR5=" + Str_rad_q_BR5 + "<BR>");

                                        Str_Bus_Rule6_Question = Request.Form["Str_Bus_Rule6_Question"];
                                        //Response.Write("Str_Bus_Rule6_Question=" + Str_Bus_Rule6_Question + "<BR>");
                                        Str_rad_q_BR6 = Request.Form["Str_rad_q_BR6"];
                                       // Response.Write("Str_rad_q_BR6=" + Str_rad_q_BR6 + "<BR>");

                                        Str_Bus_Rule7_Question = Request.Form["Str_Bus_Rule7_Question"];
                                        //Response.Write("Str_Bus_Rule7_Question=" + Str_Bus_Rule7_Question + "<BR>");
                                        Str_rad_q_BR7 = Request.Form["Str_rad_q_BR7"];
                                       // Response.Write("Str_rad_q_BR7=" + Str_rad_q_BR7 + "<BR>");

                                        Str_Bus_Rule28_Question = Request.Form["Str_Bus_Rule28_Question"];
                                        //Response.Write("Str_Bus_Rule28_Question=" + Str_Bus_Rule28_Question + "<BR>");
                                        Str_rad_q_BR28 = Request.Form["Str_rad_q_BR28"];
                                       // Response.Write("Str_rad_q_BR28=" + Str_rad_q_BR28 + "<BR>");

                                        Str_Manager_Title = Request.Form["Str_Manager_Title"];
                                        //Response.Write("Str_Manager_Title=" + Str_Manager_Title + "<BR>");
                                        Str_txt_Manager_name = Request.Form["Str_txt_Manager_name"];
                                        //Response.Write("Str_txt_Manager_name=" + Str_txt_Manager_name + "<BR>");
                                        //Response.Write("Str_rad_q_BR28=" + Str_rad_q_BR28 + "<BR>");

                                        StrFileSave = Request.Form["StrFileSave"];
                                      //  Response.Write("StrFileSave=" + StrFileSave + "<BR>");

                                        //if (!IsPostBack)
                                        //{
                                        //    Button2.Enabled = true;
                                        //}
                                        //else
                                        //{
                                        //    Button2.Enabled = false;
                                        //}
                                         
                                    }
#region SystemPromptandRule
    private void GetPromptTranslation()
    {
        vPrompts = new string[7];
        vPrompts[0] = "Please enter a valid visit date";
        vPrompts[1] = "The Visit date entered is invalid for this Job,Wave and Task.";
        vPrompts[2] = "The Visit date greater than Today`s date";
        vPrompts[3] = "You can not enter more than 255 charaters in the Comment box.";
        vPrompts[4] = "Please enter a Picture path to upload.";
        vPrompts[5] = "Picture has to be JPG file.";
        vPrompts[6] = "Picture has to be JPEG,JPG or GIF file.";
        
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
        string StrTodayDate, StrTodayDate2, TestJob_No;
        StrTodayDate = "";
        StrTodayDate2 = "";
        ArrayDateRuleF = new string[3];
        ArrayDateRuleF = DateRule.Split(Date_input.ToCharArray());
        TestJob_No = Request.Form["Job_No"];
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

    protected void Button2_Click(object sender, EventArgs e)
    {

        //Button b = (Button)sender;
        //b.Enabled = false;
        UploadSinglePhoto.Enabled = false;
        //UploadSinglePhoto.Enabled = true;

         //Button2. = false;
         //pnl_Upload_Photo.Visible = false;
       string OrigioalFile;
       int StrFileYear, StrFileMonth, StrFileDay, StrFileHour, StrFileMinute, StrFileSecond;
       string Picture_Name, StrSec, StrMin, StrHou;
       string strPath, StrFileNames, StrNewPhotoName;

      
       StrFileUpdatePath = ConfigurationManager.AppSettings["FileUpdatePath"];
       //Response.Write("StrFileUpdatePath=" + StrFileUpdatePath);
       StrFileUpdatePath = StrFileUpdatePath + "sparEyesPic" + Convert.ToString(Lang_id) + "\\\\update\\\\";
       //Response.Write("StrFileUpdatePath=" + StrFileUpdatePath + "<BR>");

       StrFileYear = System.DateTime.Now.Year;
       StrFileMonth = System.DateTime.Now.Month;
       StrFileDay = System.DateTime.Now.Day;
       StrFileHour = System.DateTime.Now.Hour;
       StrFileMinute = System.DateTime.Now.Minute;
       StrFileSecond = System.DateTime.Now.Second;
       StrSec = Convert.ToString(StrFileSecond);
       StrMin = Convert.ToString(StrFileMinute);
       StrHou = Convert.ToString(StrFileHour);

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

       Picture_Name = "" + StrFileYear + "" + StrFileMonth + "" + StrFileDay + "" + StrHou + "" + StrMin + "" + StrSec + "";


        //Response.Write("test111111111111111111111111<BR>");
        if (SingleUpload.HasFile)
        {

            string fileName = Server.HtmlEncode(SingleUpload.FileName);
            //fileName = "gfghfghfgh.jpg";
            //Response.Write("fileName=" + fileName);
           // fileName = "7543984793847583475" + ".jpg";
            //OrigioalFile = "C:\\Photo\\Update\\" + Picture_Name + ".jpg";
            OrigioalFile = "" + StrFileUpdatePath + "" + Picture_Name + ".jpg";
            
            //Response.Write("OrigioalFile=" + OrigioalFile);
            SingleUpload.SaveAs(OrigioalFile);
           
           //Response.Write(Strhidden);
            savePath.Value = OrigioalFile;
            //StrFileSave.Value = OrigioalFile;
            //HtmlInputHidden hiddentest = (HtmlInputHidden)Page.FindControl("ctl00$ContentPlaceHolder1$hiddentest");
            
            Context.Items["OriginalFile"] = OrigioalFile;
            Server.Transfer("CFPictureFileDisplay.aspx",true);
        }
    }
}
