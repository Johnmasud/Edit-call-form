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

public partial class CFStoreSearchSV : System.Web.UI.Page
{
    protected string Job_No, Wave_No, Task_No, Task_Desc, Task_Addtl_Desc, store_id, Date_input;
    protected string Chain_No, Store_Chain_Desc, Store_No, Store_Store_Name, Store_Street_Addr, Store_City, Store_State, Store_Zip;
    protected string CA_merch_no,Str_Merch_no, Merch_First_Name, Merch_Last_Name, Merch_Street_Addr, Merch_Street_Addr2, Merch_City, Merch_State, Merch_Zip, Merch_Phone_No, Merch_Email_Addr;
    protected string Field_Start_Dt, Field_end_Dt, Key_Comp_Dt, DOA_Dt, TodayDate, visit_no;
    protected string Collect_iVR_Time, night_visits, Mileage_flag, Travel_flag, Str_Manager_Title, Str_txt_Manager_name;
    protected string Job_Type, Business_Type_id, Work_Type_id, Work_Type_Desc;
    protected string Data_Col_Method, overwritetime, All_Data_Received, collect_time_only, Ask_Q_HH_Used, HH_Status_Flag;
    protected string Collect_Header, Collect_Call_Form, SS_Callform, Prod_Specific, qdef_skippattern, Max_Mx_Per_Store, Max_Visit_Per_Store_Mx;
    protected string Collect_Store_Mgr_Name, Product_Check_Flag, Ask_EShelf_Question, Call_Form_Type_No, Est_instore_minutes, Business_Rule_Eckerd, Eckerd_Job_Last_question;
    protected string user_id, PhotoButton, Bus_Rule5_Question, Bus_Rule6_Question, Bus_Rule28_Question, Bus_Rule3_Question, Bus_Rule4_Question, Bus_Rule7_Question;
    public string[] vPrompts;
    protected string Str_VisitMonth, Str_visitday, Str_visityear, Str_timein_hrs, Str_timein_min, Str_cmb_timein, Str_timeout_hrs, Str_timeout_min, Str_cmb_timeout;
    protected string Str_txt_mileage, Str_txt_drive, Str_rad_q_Past_Midnight, Str_rad_q_HH_Used, Str_rad_q_Ret_store_visit, AddressRule, NameRule, DateRule, State_Length;
    protected string Str_Radio_EShelf, Str_Ask_EShelf_Question, Str_Bus_Rule3_Question, Str_rad_q_BR3, Str_Bus_Rule4_Question, Str_rad_q_BR4, Str_Bus_Rule5_Question;
    protected string Str_rad_q_BR5, Str_Bus_Rule6_Question, Str_rad_q_BR6, Str_Bus_Rule7_Question, Str_rad_q_BR7, Str_Bus_Rule28_Question, Str_rad_q_BR28, JWTInfoText, JWTMatchStoreOutput;
    protected int Lang_id, Back_Slash, Dot, Dash;
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


        ptAppTranslation = new PromptTranslation("CFStoreSearchSV.aspx", WebAppClass.PromptsLanguageId.ToString(), WebAppClass.LanguageId, WebAppClass.CurrentSQLDBConnection, WebAppClass.MultiLanguageCount);
        // AppMasterControls ap1 = new AppMasterControls(PageHeader, PageFooter, WebAppClass.LoggedUserName, WebAppClass.CurrentDBDateTime, WebAppClass.LanguageId, WebAppClass.PromptsLanguageId, WebAppClass.PageTitle, WebAppClass.CurrentSQLDBConnection, this.Page, WebAppClass.SPARLogoFileURL);
        AppMasterControls ap1 = new AppMasterControls(PageHeader, PageFooter, BiLingualBar, WebAppClass.LoggedUserName, WebAppClass.CurrentDBDateTime, WebAppClass.LanguageId, WebAppClass.PromptsLanguageId, WebAppClass.MultiLanguageCount, WebAppClass.PageTitle, WebAppClass.CurrentSQLDBConnection, this.Page, WebAppClass.SPARLogoFileURL);
        if (WebAppClass.MerchNo > 0)
        {
            PageFooter.ShowSPARToolsURL = false;
            PageFooter.ShowMainPageUrl = false;
        }
    }
    #endregion
    #region events
    protected void Page_Load(object sender, EventArgs e)
    {
                        WebAppClass.Set_MerchforForm(this.Merch_no, Convert.ToString(WebAppClass.MerchNo));

                       
                        Str_Merch_no = Request.Form["ctl00$ContentPlaceHolder1$Txt_merch_no"];
                        //Response.Write("Str_Merch_no=" + Str_Merch_no + "<BR>");
                        Job_No = Request.Form["ctl00$ContentPlaceHolder1$txt_jobno"];
                        //Response.Write("Job_No=" + Job_No);
                        Wave_No = Request.Form["ctl00$ContentPlaceHolder1$txt_waveno"];
                       // Response.Write("Wave_No=" + Wave_No);
                        Task_No = Request.Form["ctl00$ContentPlaceHolder1$txt_taskno"];
                        //Response.Write("Task_No=" + Task_No);
                        Chain_No = Request.Form["ctl00$ContentPlaceHolder1$txt_chainno"];
                        //Response.Write("txt_chainno=" + Chain_No);
                        Store_No = Request.Form["ctl00$ContentPlaceHolder1$txt_storeno"];
                        //Response.Write("txt_storeno=" + Store_No);
                        if (string.IsNullOrEmpty(Job_No) == true)
                        {
                            Str_Merch_no = Request.Form["Str_Merch_no"];
                            //Response.Write("Str_Merch_no=" + Str_Merch_no + "<BR>");
                            // Response.Write("Merch_no=" + Merch_no + "<BR>");
                            Job_No = Request.Form["Job_No"];
                            // Response.Write("Job_No=" + Job_No);
                            Wave_No = Request.Form["Wave_No"];
                            //Response.Write("Wave_No=" + Wave_No);
                            Task_No = Request.Form["Task_No"];
                            //Response.Write("Task_No=" + Task_No);
                            Chain_No = Request.Form["Chain_No"];
                            //Response.Write("txt_chainno=" + Chain_No);
                            Store_No = Request.Form["Store_No"];
                            
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

                        State_Length = RuleTab.Rows[6][2].ToString();
                        // Response.Write("MeasurementValue=" + MeasurementValue);

                        //****** Prompts
                        GetPromptTranslation();

                        // System.Text.StringBuilder JWTInfoText = new System.Text.StringBuilder();
                        StringBuilder HTMLText = new StringBuilder();
                        StringBuilder HTMLTextSpanDisplay = new StringBuilder();
                        // System.Text.StringBuilder HTMLText = new System.Text.StringBuilder();

                        //HTMLText = "";
                        HTMLText.Append("<table border='1' id='TABLE1' borderColor='dodgerblue' bgcolor='mintcream' align='center' width='100%'> ");
                        HTMLText.Append("<tr>");
                        HTMLText.Append("<td  align='left' class='applicationnametd'>");
                        HTMLText.Append("<span class='reportTableHeader'>" + vPrompts[21] + "</span>");
                        HTMLText.Append("</td>");
                        HTMLText.Append("</tr>");

                        HTMLText.Append("<tr>");
                        HTMLText.Append("<td align=left  width='100%'>");
                        // Job Information
                        HTMLText.Append("<table border='0'  width='100%'>");
                        HTMLText.Append("<tr>");
                        HTMLText.Append("<td class='reportCriteriaHeader'  width='10%' align=left>" + vPrompts[1] + "");
                        HTMLText.Append("</td>");
                        HTMLText.Append("<td class='selectionCriteriaItem' width='90%' align=left>:" + Job_No + "");
                     
                        HTMLText.Append("</td>");
                        HTMLText.Append("</tr>");
                        HTMLText.Append("</table>	");
                        HTMLText.Append("</td>");
                        HTMLText.Append("</tr>");

                        HTMLText.Append("<tr>");
                        HTMLText.Append("<td align=left  width='100%'>");
                        // wave Information
                        HTMLText.Append("<table border='0'  width='100%'>");
                        HTMLText.Append("<tr>");
                        HTMLText.Append("<td class='reportCriteriaHeader'  width='10%' align=left>" + vPrompts[2] + "");
                        HTMLText.Append("</td>");
                        HTMLText.Append("<td class='selectionCriteriaItem' width='90%' align=left>:" + Wave_No + "");
                        HTMLText.Append("</td>");
                        HTMLText.Append("</tr>");
                        HTMLText.Append("</table>	");
                        HTMLText.Append("</td>");
                        HTMLText.Append("</tr>");

                        HTMLText.Append("<tr>");
                        HTMLText.Append("<td align=left  width='100%'>");
                        // Task Information
                        HTMLText.Append("<table border='0'  width='100%'>");
                        HTMLText.Append("<tr>");
                        HTMLText.Append("<td class='reportCriteriaHeader'  width='10%' align=left>" + vPrompts[3] + "");
                        HTMLText.Append("</td>");
                        HTMLText.Append("<td class='selectionCriteriaItem' width='90%' align=left>:" + Task_No + "");
                        HTMLText.Append("</td>");
                        HTMLText.Append("</tr>");
                        HTMLText.Append("</table>	");
                        HTMLText.Append("</td>");
                        HTMLText.Append("</tr>");

                        HTMLText.Append("<tr>");
                        HTMLText.Append("<td  align='left' class='applicationnametd'>");
                        HTMLText.Append(" <span class='reportTableHeader'>" + vPrompts[6] + "</span> ");
                        HTMLText.Append("</td>");
                        HTMLText.Append("</tr>");

                        HTMLText.Append("<tr>");
                        HTMLText.Append("<td align=left  width='100%'>");
                        HTMLText.Append("<table border='0'  width='100%'>");
                        HTMLText.Append("<tr>");
                        HTMLText.Append("<td class='reportCriteriaHeader'  width='10%' align=left>" + vPrompts[0] + "");
                        HTMLText.Append("</td>");
                        HTMLText.Append("<td class='selectionCriteriaItem' width='90%' align=left>:" + Str_Merch_no + "");
                       
                        HTMLText.Append("</td>");
                        HTMLText.Append("</tr>");
                        HTMLText.Append("</table>");
                        HTMLText.Append("</td>");
                        HTMLText.Append("</tr>");
                        //header ---- Store Search Criteria
                        HTMLText.Append("<tr>");
                        HTMLText.Append("<td  align='left' class='applicationnametd'>");
                        HTMLText.Append(" <span class='reportTableHeader'>" + vPrompts[7] + "</span> ");
                        HTMLText.Append("</td>");
                        HTMLText.Append("</tr>");
                        HTMLText.Append("</table>");
                        HTMLText.Append("<table border='1' id='TABLE1' borderColor='dodgerblue' bgcolor='mintcream' align='center' width='100%'> ");
                        HTMLText.Append("<tr>");
                        HTMLText.Append("<td class='reportCriteriaHeader'  width='20%' align=left>" + vPrompts[8] + "");
                        HTMLText.Append("</td>");
                        HTMLText.Append("<td class='selectionCriteriaItem' width='80%' align=left>");
                        HTMLText.Append("<input type='text' name='txtstore_name' id='store_name' size='50' maxlength='25'>");
                        HTMLText.Append("</td>");
                        HTMLText.Append("</tr>");

                        HTMLText.Append("<tr>");
                        HTMLText.Append("<td class='reportCriteriaHeader'  width='20%' align=left>" + vPrompts[9] + "");
                        HTMLText.Append("</td>");
                        HTMLText.Append("<td class='selectionCriteriaItem' width='80%' align=left>");
                        HTMLText.Append("<input type='text' name='txtstore_add' id='store_add' size='50' maxlength='55'>");
                        HTMLText.Append("</td>");
                        HTMLText.Append("</tr>");

                        HTMLText.Append("<tr>");
                        HTMLText.Append("<td class='reportCriteriaHeader'  width='20%' align=left>" + vPrompts[10] + "");
                        HTMLText.Append("</td>");
                        HTMLText.Append("<td class='selectionCriteriaItem' width='80%' align=left>");
                        HTMLText.Append("<input type='text' name='txtstore_city' id='store_city' size='50' maxlength='25'>");
                        HTMLText.Append("</td>");
                        HTMLText.Append("</tr>");

                        HTMLText.Append("<tr>");
                        HTMLText.Append("<td class='reportCriteriaHeader'  width='20%' align=left>" + vPrompts[11] + "");
                        HTMLText.Append("</td>");
                        HTMLText.Append("<td class='selectionCriteriaItem' width='80%' align=left>");
                        HTMLText.Append("<input type='text' name='txtstore_state' id='store_state' size='5'  maxlength='" + State_Length + "'>");
                        HTMLText.Append("</td>");
                        HTMLText.Append("</tr>");

                        HTMLText.Append("<tr>");
                        HTMLText.Append("<td class='reportCriteriaHeader'  width='20%' align=left>" + vPrompts[12] + "");
                        HTMLText.Append("</td>");
                        HTMLText.Append("<td class='selectionCriteriaItem' width='80%' align=left>");
                        HTMLText.Append("<input type='text' name='txtstore_zip' id='store_zip' size='10'  maxlength='7'> <I><font size='2'>format: 02345</I></font>");
                        HTMLText.Append("</td>");
                        HTMLText.Append("</tr>");

                        HTMLText.Append("</table>");
                        //Response.Write("HTMLText=" + HTMLText + "<BR>");
                        JWTInfoText = HTMLText.ToString();
    }
    #endregion
    protected void Button2_Click(object sender, EventArgs e)
    {
        string Store_name, Store_add, Store_city, Store_state, Store_zip, CheckErrorMessage;
        string Strstore_no, Strchain_no, Strstore_id, Strstore_name, StrStreet_Addr, Strcity, Strstate, Strzip;
        Strchain_no = "";
        Strstore_no = "";
        Strstore_name = "";
        StrStreet_Addr = "";
        Strcity = "";
        Strstate = "";
        Strzip = "";

        Store_name = Request.Form["txtstore_name"];
       //Response.Write("Store_name=" + Store_name);
        Store_add = Request.Form["txtstore_add"];
       //Response.Write("Store_add=" + Store_add);
        Store_city = Request.Form["txtstore_city"];
        //Response.Write("Store_city=" + Store_city);
        Store_state = Request.Form["txtstore_state"];
        //Response.Write("Store_state=" + Store_state);
        Store_zip = Request.Form["txtstore_zip"];
        //Response.Write("Store_zip=" + Store_zip);

        DataTable dt15 = Get_JWT_Store_Search(Job_No, Wave_No, Task_No, Store_name, Store_add, Store_city, Store_state, Store_zip);

        if (dt15.Rows.Count > 0)
        {
                // System.Text.StringBuilder JWTInfoText = new System.Text.StringBuilder();
                StringBuilder HTMLText1 = new StringBuilder();

                // System.Text.StringBuilder HTMLText = new System.Text.StringBuilder();

                //HTMLText = "";
                HTMLText1.Append("<table border='1' id='TABLE1' borderColor='dodgerblue'   align='center' width='100%'>");
                HTMLText1.Append("<tr>");
                HTMLText1.Append("<TD colspan='7' align='left' bgcolor='#336699' class='reportTableHeader'>" + vPrompts[13] + "");
                HTMLText1.Append("</td>");
                HTMLText1.Append("</tr>");



                HTMLText1.Append("<TR >");
                HTMLText1.Append("<TD align='left' bgcolor='#336699' class='reportTableHeader'>" + vPrompts[14] + "");
                HTMLText1.Append("</TD>");
                HTMLText1.Append("<TD align='left' bgcolor='#336699' class='reportTableHeader'>" + vPrompts[15] + "");
                HTMLText1.Append("</TD>");
                HTMLText1.Append("<TD align='left' bgcolor='#336699' class='reportTableHeader'>" + vPrompts[16] + "");
                HTMLText1.Append("</TD>");
                HTMLText1.Append("<TD align='left' bgcolor='#336699' class='reportTableHeader'>" + vPrompts[17] + "");
                HTMLText1.Append("</TD>");
                HTMLText1.Append("<TD align='left' bgcolor='#336699' class='reportTableHeader'>" + vPrompts[18] + "");
                HTMLText1.Append("</TD>");
                HTMLText1.Append("<TD align='left' bgcolor='#336699' class='reportTableHeader'>" + vPrompts[19] + "");
                HTMLText1.Append("</TD>");
                HTMLText1.Append("<TD align='left' bgcolor='#336699' class='reportTableHeader'>" + vPrompts[20] + "");
                HTMLText1.Append("</TD>");
                HTMLText1.Append("</TR>");
                
               
            foreach (DataRow myRow in dt15.Rows)
            {
                if (myRow["store_no"] != System.DBNull.Value)
                {
                    Strstore_no = Convert.ToString(myRow["store_no"]);
                    //Response.Write("Strstore_no=" + Strstore_no);
                }
                if (myRow["chain_no"] != System.DBNull.Value)
                {
                    Strchain_no = Convert.ToString(myRow["chain_no"]);
                   // Response.Write("Strchain_no=" + Strchain_no + "<BR>");
                }
                if (myRow["store_id"] != System.DBNull.Value)
                {
                    Strstore_id = Convert.ToString(myRow["store_id"]);
                   //Response.Write("Strstore_id=" + Strstore_id + "<BR>");
                }
                if (myRow["store_name"] != System.DBNull.Value)
                {
                    Strstore_name = Convert.ToString(myRow["store_name"]);
                   // Response.Write("Strstore_name=" + Strstore_name + "<BR>");
                }
                if (myRow["Street_Addr"] != System.DBNull.Value)
                {
                    StrStreet_Addr = Convert.ToString(myRow["Street_Addr"]);
                   // Response.Write("StrStreet_Addr=" + StrStreet_Addr + "<BR>");
                }
                if (myRow["city"] != System.DBNull.Value)
                {
                    Strcity = Convert.ToString(myRow["city"]);
                    //Response.Write("Strcity=" + Strcity + "<BR>");
                }
                if (myRow["state"] != System.DBNull.Value)
                {
                    Strstate = Convert.ToString(myRow["state"]);
                   // Response.Write("Strstate=" + Strstate + "<BR>");
                }
                if (myRow["zip"] != System.DBNull.Value)
                {
                    Strzip = Convert.ToString(myRow["zip"]);
                    //Response.Write("Strzip=" + Strzip + "<BR>");
                }

                HTMLText1.Append("<TR><TD><INPUT TYPE='RADIO' id='RBSTORE' NAME='RBSTORE' VALUE='" + Strchain_no + "-" + Strstore_no + "'>" + Strchain_no + "");
                HTMLText1.Append("<TD class='selectionCriteriaItem'>" + Strstore_no + "</TD>");
                HTMLText1.Append("<TD class='selectionCriteriaItem'>" + Strstore_name + "</TD>");
                HTMLText1.Append("<TD class='selectionCriteriaItem'>" + StrStreet_Addr + "</TD>");
                HTMLText1.Append("<TD class='selectionCriteriaItem'>" + Strcity + "</TD>");
                HTMLText1.Append("<TD class='selectionCriteriaItem'>" + Strstate + "</TD>");
                HTMLText1.Append("<TD class='selectionCriteriaItem'>" + Strzip + "</TD></TR>");

            }//end of  foreach (DataRow myRow in dt15.Rows)
            HTMLText1.Append("</table>");
            HTMLText1.Append("<input type='button' name='btnSelect' id='btnSelect'  value='SELECT' Class='Button' onclick='GoToMainPage()'/>");
		

            JWTMatchStoreOutput = HTMLText1.ToString();

        }//end of if (dt.Rows.Count > 0)
        else
        {
            JWTMatchStoreOutput = "Sorry! No records found!";
            //Response.Write("Sorry! No records found!"); 
        }
    }
    private DataTable Get_JWT_Store_Search(String Job_No, String Wave_No, String Task_No, String Store_name, String Store_add, String Store_city, String Store_state, String Store_zip)
    {
        Int32 iTempJob_No = 0;
        Int32 iTempWave_No = 0;
        Int32 iTempTask_No = 0;
        

        iTempJob_No = AppUtils.ConvertToInteger32(Job_No, 0);
        iTempWave_No = AppUtils.ConvertToInteger32(Wave_No, 0);
        iTempTask_No = AppUtils.ConvertToInteger32(Task_No, 0);


        return AppData.Get_JWT_Store_SearchClass(iTempJob_No, iTempWave_No, iTempTask_No, Store_name, Store_add, Store_city, Store_state, Store_zip, WebAppClass.CurrentSQLDBConnection);
    }
    #region SystemPromptandRule

    private void GetPromptTranslation()
    {
        vPrompts = new string[22];
	    vPrompts[0]= "MS No.";
	    vPrompts[1]= "Job No.";
	    vPrompts[2]= "Wave No.";
	    vPrompts[3]= "Task No.";
	    vPrompts[4]= "Chain No.";
	    vPrompts[5]= "Store No.";
	    vPrompts[6]= "MS Information";
	    vPrompts[7]= "Store Search Criteria";
	    vPrompts[8]= "Name:";
	    vPrompts[9]= "Address:";
	    vPrompts[10]= "City:";
	    vPrompts[11]= "State:";
	    vPrompts[12]= "ZIP:";
	    vPrompts[13]= "Matching Stores!";
	    vPrompts[14]= "Chain No";
	    vPrompts[15]= "Store No";
	    vPrompts[16]= "Store Name";
	    vPrompts[17]= "Address";
	    vPrompts[18]= "City";
	    vPrompts[19]= "State";
	    vPrompts[20]= "Zip";
        vPrompts[21] = "Job Information";
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
        VRule[6] = "State Length";
        
        appDT = AppSysRules.Get_RuleValue_ByDescAsDataTable(VRule, WebAppClass.LanguageId, WebAppClass.CurrentSQLDBConnection);
        return appDT;
    }
#endregion
   
    #region methods
    private string Date_Format(DateTime StrDate, int ShowType, string DateRule, string Date_input)
    {


        string[] ArrayDateRuleF;
        int f, StrMonth, StrDay, StrYear;
        string StrTodayDate, StrTodayDate2, StrYear1;
        StrTodayDate = "";
        StrTodayDate2 = "";
        ArrayDateRuleF = new string[3];
        ArrayDateRuleF = DateRule.Split(Date_input.ToCharArray());
        StrYear = 0;
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
