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

public partial class CFProductCallFormReport : System.Web.UI.Page
{
    protected string user_id, Email_Active_Flag, Str_Merch_no, Job_No, Wave_No, Task_No, Chain_No, Store_No, txt_EmailAdd, txt_Mobile_Email, POutOfStock_no, Error_Message, Error_Flag, HTMLHeader_info, Collect_Mobile_Email, AddressRule, NameRule, DateRule;
    protected int Error_Message_Flag, BusinessQuestion_Flag, OutOfStock_no, Back_Slash, Dot, Dash, ShowType, Lang_id;
    protected string store_id, Store_Chain_Desc, Store_Store_Name, Store_Street_Addr, Store_City, Store_State, Store_Zip, Data_Required, MeasurementValue, Decimal_Point;
    protected string PMerch_no, CA_merch_no, Merch_First_Name, Merch_Last_Name, Merch_Street_Addr, Merch_Street_Addr2, EnterVisitDate, ProdAnsForNextPage, NewScreenPage;
    protected string Merch_City, Merch_State, Merch_Zip, Merch_Phone_No, Merch_Email_Addr, Task_Desc, Task_Addtl_Desc, CellPhoneNo, Str_Back_RTSAnswers;
    protected string Field_Start_Dt, Field_end_Dt, Key_Comp_Dt, DOA_Dt, Job_Type, Business_Type_id, Work_Type_id, Work_Type_Desc, Max_Mx_Per_Store, CallFormEnded, CFEnd_SelectedProduct;
    protected string Max_Visit_Per_Store_Mx, visit_no, Collect_iVR_Time, night_visits, Mileage_flag, Travel_flag, Data_Col_Method, StrRTSAnswers, AnswersAllFromGrid, AnswersForMenuColor, ProductElementAll;
    protected string All_Data_Received, qdef_skippattern, Collect_Header, Collect_Call_Form, SS_Callform, Prod_Specific, overwritetime, Prod_UPC;
    protected string collect_time_only, Ask_Q_HH_Used, HH_Status_Flag, Collect_Store_Mgr_Name, Product_Check_Flag, Ask_EShelf_Question, Product_Type;
    protected string Call_Form_Type_No, Est_instore_minutes, Business_Rule_Eckerd, Eckerd_Job_Last_question, Bus_Rule22_Photo, ArrayEleSubmit;
    protected string Bus_Rule5_Question, Bus_Rule6_Question, Bus_Rule28_Question, Bus_Rule3_Question, Bus_Rule4_Question, Bus_Rule7_Question, Product_Required;
    protected string JWTInfoText, UseTheCallForm, PhotoButton, Nextbutton, return_Message, Excute_SQL, Merch_Message, No_Question_avaliable, TotalProdCount;
    protected string Date_input, VarDay, Varmonth, StrYear, VarSelect_AM, VarSelect_PM, Strcmb_timein, TodayDate, YearDisplay, All_EleAns_Val, NoNextButton;
    protected string txt_timein_hrsVal, txt_timein_minVal, txt_timeout_hrsVal, txt_timeout_minVal, Visit_Date, txt_Phone1, txt_Phone2, txt_Phone3, CellProvider, Hidden_PhoneStatus;
    protected string Q_No, Q_Text, Q_Text_Short, Q_Type, Ans_Type, Grid_No, skippattern_status, RTS_JWT, STR_RTS_JWT, Used_qty, ShortCallForm;
    protected string Uniq_Ques_Id, stores_specified, prod_upc, prod_activity_id, skip_flag, ElementName, All_ElementName, ArrayAllHtmlElement, ArrayAllQuestionsElement, RTS_Q_No, ArrayRTS_Q_no;
    protected string Prod_Id, Ans_Val, Ans_Text, Nxt_Q_No, Remark, Response_Text_Flag, Ans_Val_High, Ans_Val_Low, JWT, EleAns_Val, JWTInfoRTS, DisplayHeaderInfo, HTMLReportText;
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

        ptAppTranslation = new PromptTranslation("CFProductCallFormReport.aspx", WebAppClass.PromptsLanguageId.ToString(), WebAppClass.LanguageId, WebAppClass.CurrentSQLDBConnection, WebAppClass.MultiLanguageCount);
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
                            //****** Prompts
                            GetPromptTranslation();
                            NewScreenPage = Request.Form["NewScreenPage"];
                            //Response.Write("NewMerchPage=" + NewMerchPage);
                            chainstorelstSA = Request.Form["chainstorelstSA"];
                            selchainstoreSA = Request.Form["selchainstoreSA"];

                            Star_time = Request.Form["Star_time"];
                            //Response.Write("Star_time=" + Star_time);
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
                            //Response.Write("Str_txt_Manager_name=" + Str_txt_Manager_name + "<BR>");
                           
                            Visit_Date = Request.Form["Visit_Date"];
                            //Response.Write("Visit_Date=" + Visit_Date + "<BR>");
                               

                            ProdAnsForNextPage = Request.Form["ProdAnsForNextPage"];
                            //Response.Write("ProdAnsForNextPage=" + ProdAnsForNextPage + "<BR>");

                            AnswersAllFromGrid = Request.Form["AnswersAllFromGrid"];
                            //Response.Write("AnswersAllFromGrid=" + AnswersAllFromGrid + "<BR>");


                            AnswersForMenuColor = Request.Form["AnswersForMenuColor"];
                            //Response.Write("AnswersForMenuColor=" + AnswersForMenuColor + "<BR>");


                            CallFormEnded = Request.Form["CallFormEnded"];
                           // Response.Write("CallFormEnded=" + CallFormEnded + "<BR>");


                            CFEnd_SelectedProduct = Request.Form["CFEnd_SelectedProduct"];
                            //Response.Write("CFEnd_SelectedProduct=" + CFEnd_SelectedProduct + "<BR>");
                            Str_Sv_Panel_id = Request.Form["Str_Sv_Panel_id"];

                            string ReQ_No, ReQ_Text, ReResponse, ReAns_Text, ReProd_id, ReProd_long_desc, OldQNumber, OldProdNumebr;

                            StringBuilder HTMLText = new StringBuilder();
                            HTMLText.Append("<TABLE BORDER=1 width='100%' bordercolor='dodgerblue'>");
                            HTMLText.Append("<TR>");
                                    HTMLText.Append("<TD bgcolor='dodgerblue' colspan='2' align='center' class='reportTableHeader'>");
                                                    HTMLText.Append("<span class='reportTableHeader'>" + vPrompts[19] + "</span>");  
                                    HTMLText.Append("</TD>");  
                                    HTMLText.Append("<TD bgcolor='dodgerblue' align=center class='reportTableHeader'>");
                                                    HTMLText.Append("<span class='reportTableHeader'>" + vPrompts[20] + "</span>");  
                                    HTMLText.Append("</TD>");
                            HTMLText.Append("</TR>");



                            DataTable dt11 = Get_Grid_Reported_Answers(Job_No, Wave_No, Task_No, store_id,Str_Merch_no);
                        
                            //GridReportedProduct
                            //GridReportedProduct.DataSource = dt11;
                            //GridReportedProduct.DataBind();

                            //HTMLText.Append("'>");
                            if (dt11.Rows.Count > 0)
                            {
                                OldQNumber="";
                                OldProdNumebr = "";
                                ReProd_id = "";
                                ReProd_long_desc = "";
                                ReQ_Text = "";
                                ReQ_No = "";
                                ReResponse="";
                                ReAns_Text="";
                                NoNextButton = "";
                                foreach (DataRow myRow in dt11.Rows)
                                {
                                     

                                    if (myRow["Q_No"] != System.DBNull.Value)
                                    {
                                        ReQ_No = Convert.ToString(myRow["Q_No"]);
                                        //Response.Write("ReQ_No=" + ReQ_No + "<BR>");
                                    }
                                    if (myRow["Q_Text"] != System.DBNull.Value)
                                    {
                                        ReQ_Text = Convert.ToString(myRow["Q_Text"]);
                                        //Response.Write("ReQ_Text=" + ReQ_Text + "<BR>");
                                    }
                                    if (myRow["Response"] != System.DBNull.Value)
                                    {
                                        ReResponse = Convert.ToString(myRow["Response"]);
                                        //Response.Write("ReResponse=" + ReResponse + "<BR>");
                                    }
                                    if (myRow["Ans_Text"] != System.DBNull.Value)
                                    {
                                        ReAns_Text = Convert.ToString(myRow["Ans_Text"]);
                                        //Response.Write("ReAns_Text=" + ReAns_Text + "<BR>");
                                    }

                                    if (myRow["Prod_id"] != System.DBNull.Value)
                                    {
                                        ReProd_id = Convert.ToString(myRow["Prod_id"]);
                                       // Response.Write("ReProd_id=" + ReProd_id + "<BR>");
                                    }
                                    if (myRow["Prod_id"] != System.DBNull.Value)
                                    {
                                        ReProd_id = Convert.ToString(myRow["Prod_id"]);
                                        //Response.Write("ReProd_id=" + ReProd_id + "<BR>");
                                    }
                                    if (myRow["Prod_long_desc"] != System.DBNull.Value)
                                    {
                                        ReProd_long_desc = Convert.ToString(myRow["Prod_long_desc"]);
                                        //Response.Write("ReProd_long_desc=" + ReProd_long_desc + "<BR>");
                                    }

                                    if (ReProd_id != OldProdNumebr)
                                    {
                                        HTMLText.Append("<TR>");
                                            HTMLText.Append("<TD bgcolor='#336699' colspan='2' align='center' class='reportTableHeader'>");
                                                HTMLText.Append("" + ReProd_id + "");
                                            HTMLText.Append("</TD>");
                                            HTMLText.Append("<TD align='left' bgcolor='#336699' class='reportTableHeader'>");
                                                HTMLText.Append("" + ReProd_long_desc + "");
                                            HTMLText.Append("</TD>");
                                        HTMLText.Append("</TR>");

                                        OldQNumber="";
                                        OldProdNumebr = ReProd_id;
                                    }// if (ReProd_id != OldProdNumebr)

                                    if (ReQ_No != OldQNumber)
                                    {
                                       
										HTMLText.Append("<TR>");
										HTMLText.Append("<TD class='selectionCriteriaItem'>QNo:</TD>");
										HTMLText.Append(" <TD class='selectionCriteriaItem'>");
										HTMLText.Append("" + ReQ_No + "");
										HTMLText.Append("</TD>");
                                        HTMLText.Append("<TD align='left' class='selectionCriteriaItem'>");
										HTMLText.Append("" + ReQ_Text + "");
										HTMLText.Append("</TD>");
										HTMLText.Append("</TR>");	

										HTMLText.Append("<TR>");
										HTMLText.Append("<TD class='selectionCriteriaItem'>Ans:</TD>");
										HTMLText.Append("<TD class='selectionCriteriaItem'>");
										HTMLText.Append("" + ReQ_No + "");
										HTMLText.Append("</TD>");

                                        OldQNumber = ReQ_No;
                                    }//if (ReQ_No != OldQNumber)
                                    else
                                    { 
										HTMLText.Append("<TR>");
										    HTMLText.Append("<TD>");	
										    HTMLText.Append("</TD>");
										    HTMLText.Append("<TD>");
                                            HTMLText.Append("</TD>");
                                    }// if (ReQ_No != OldQNumber)	
                                    HTMLText.Append("<TD align='left' class='reportTableItem'>");
									            HTMLText.Append("<span class='reportCriteriaHeader'>");
											    HTMLText.Append("" + ReResponse + "");
													if (string.IsNullOrEmpty(ReAns_Text)==false)	
                                                    {
													 HTMLText.Append("-</span>");
													}
												HTMLText.Append("" + ReAns_Text + "");		
												 
												HTMLText.Append("</TD>");
                                            HTMLText.Append("</TR>");	
									 

                                }//foreach

                                HTMLText.Append("</table>");
                                HTMLText.Append("<br /><br />");
                                HTMLText.Append("<span class='selectionCriteriaItem'>" + vPrompts[7] + "</span>");
                                HTMLText.Append("<br /><br />");
                                HTMLText.Append("<span class='selectionCriteriaItem'>" + vPrompts[8] + "</span>");
                                NoNextButton = "YES";
                            }
                            else
                            {
                                HTMLText.Append("<span class='selectionCriteriaItem'>" + vPrompts[15] + "</span>");
                                HTMLText.Append("</table>");
                                NoNextButton = "NO";
                            }// if (dt11.Rows.Count > 0)

                            HTMLReportText = HTMLText.ToString();
                           
    }

    #region Procedures
    //************* Function to get the JWT info
    private DataTable Get_Grid_Reported_Answers(String Job_No, String Wave_No, String Task_No, String Store_id, String Str_Merch_no)
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

        return AppData.Get_Grid_Reported_AnswersClass(iTempJob_No, iTempWave_No, iTempTask_No, iTempStore_id, iTempMerch_no, WebAppClass.CurrentSQLDBConnection);
    }
    #endregion
 private void GetPromptTranslation()
    {
                vPrompts = new string[21];
                vPrompts[0] = "Date:";
                vPrompts[1] ="Internet Call Form";
                vPrompts[2] = "Job No.";
                vPrompts[3] = "Wave No.";
                vPrompts[4] = "Task No.";
                vPrompts[5] = "Chain No.";
                vPrompts[6] = "Store No.";
                vPrompts[7] = "Questions successfully Uploaded!";
                vPrompts[8] = "Click next to receive your confirmation number.";
                vPrompts[9] = "If you are done with a Call Form then please click NEXT";
                vPrompts[10] = "SPAR Group, Inc.";
                vPrompts[11] = "All Rights Reserved.";
                vPrompts[12] = "HELP";
                vPrompts[13] = "Next";
                vPrompts[14] = "Back";
                vPrompts[15] = "No questions saved for this J/W/T/S/C.";
                vPrompts[16] = "Go Back to the Grid";
                vPrompts[17] = "Done with the call form";
                vPrompts[18] = "See the report for the call form.";
                vPrompts[19] = "Product No.";
                vPrompts[20] = "Product Desc.";
               

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
