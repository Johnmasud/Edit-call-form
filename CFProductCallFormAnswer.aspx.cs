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

public partial class CFProductCallFormAnswer : System.Web.UI.Page
{
    protected string user_id, Email_Active_Flag, Str_Merch_no, Job_No, Wave_No, Task_No, Chain_No, Store_No, txt_EmailAdd, txt_Mobile_Email, POutOfStock_no, Error_Message, Error_Flag, HTMLHeader_info, Collect_Mobile_Email, AddressRule, NameRule, DateRule;
    protected int Error_Message_Flag, BusinessQuestion_Flag, OutOfStock_no, Back_Slash, Dot, Dash, ShowType, Lang_id;
    protected string store_id, Store_Chain_Desc, Store_Store_Name, Store_Street_Addr, Store_City, Store_State, Store_Zip, Data_Required, MeasurementValue, Decimal_Point;
    protected string PMerch_no, CA_merch_no, Merch_First_Name, Merch_Last_Name, Merch_Street_Addr, Merch_Street_Addr2, EnterVisitDate, ProdAnsForNextPage, CallFormEnded, CFEnd_SelectedProduct;
    protected string Merch_City, Merch_State, Merch_Zip, Merch_Phone_No, Merch_Email_Addr, Task_Desc, Task_Addtl_Desc, CellPhoneNo, Str_Back_RTSAnswers, NewScreenPage;
    protected string Field_Start_Dt, Field_end_Dt, Key_Comp_Dt, DOA_Dt, Job_Type, Business_Type_id, Work_Type_id, Work_Type_Desc, Max_Mx_Per_Store;
    protected string Max_Visit_Per_Store_Mx, visit_no, Collect_iVR_Time, night_visits, Mileage_flag, Travel_flag, Data_Col_Method, StrRTSAnswers, AnswersAllFromGrid, AnswersForMenuColor, ProductElementAll;
    protected string All_Data_Received, qdef_skippattern, Collect_Header, Collect_Call_Form, SS_Callform, Prod_Specific, overwritetime, Prod_UPC;
    protected string collect_time_only, Ask_Q_HH_Used, HH_Status_Flag, Collect_Store_Mgr_Name, Product_Check_Flag, Ask_EShelf_Question, Product_Type;
    protected string Call_Form_Type_No, Est_instore_minutes, Business_Rule_Eckerd, Eckerd_Job_Last_question, Bus_Rule22_Photo, ArrayEleSubmit;
    protected string Bus_Rule5_Question, Bus_Rule6_Question, Bus_Rule28_Question, Bus_Rule3_Question, Bus_Rule4_Question, Bus_Rule7_Question, Product_Required;
    protected string JWTInfoText, UseTheCallForm, PhotoButton, Nextbutton, return_Message, Excute_SQL, Merch_Message, No_Question_avaliable, TotalProdCount;
    protected string Date_input, VarDay, Varmonth, StrYear, VarSelect_AM, VarSelect_PM, Strcmb_timein, TodayDate, YearDisplay, All_EleAns_Val;
    protected string txt_timein_hrsVal, txt_timein_minVal, txt_timeout_hrsVal, txt_timeout_minVal, Visit_Date, txt_Phone1, txt_Phone2, txt_Phone3, CellProvider, Hidden_PhoneStatus;
    protected string Q_No, Q_Text, Q_Text_Short, Q_Type, Ans_Type, Grid_No, skippattern_status, RTS_JWT, STR_RTS_JWT, Used_qty, ShortCallForm;
    protected string Uniq_Ques_Id, stores_specified, prod_upc, prod_activity_id, skip_flag, ElementName, All_ElementName, ArrayAllHtmlElement, ArrayAllQuestionsElement, RTS_Q_No, ArrayRTS_Q_no;
    protected string Prod_Id, Ans_Val, Ans_Text, Nxt_Q_No, Remark, Response_Text_Flag, Ans_Val_High, Ans_Val_Low, JWT, EleAns_Val, JWTInfoRTS, DisplayHeaderInfo, DisplayQuestLinkInfo, DisplayAnsTypeInfo, DisplayResponseInfo, DisplayControlInfo, DisplayJWTQuestionsInfo, DisplaySaveHiddenInfo;
    protected string Str_VisitMonth, Str_visitday, Str_visityear, Str_timein_hrs, Str_timein_min, Str_cmb_timein, Str_timeout_hrs, Str_timeout_min, Str_cmb_timeout;
    protected string Str_txt_mileage, Str_txt_drive, Str_rad_q_Past_Midnight, Str_rad_q_HH_Used, Str_rad_q_Ret_store_visit, Str_Manager_Title, Str_txt_Manager_name;
    protected string Str_Radio_EShelf, Str_Ask_EShelf_Question, Str_Bus_Rule3_Question, Str_rad_q_BR3, Str_Bus_Rule4_Question, Str_rad_q_BR4, Str_Bus_Rule5_Question, StrAns_val;
    protected string Str_rad_q_BR5, Str_Bus_Rule6_Question, Str_rad_q_BR6, Str_Bus_Rule7_Question, Str_rad_q_BR7, Str_Bus_Rule28_Question, Str_rad_q_BR28, CheckErrorMessage, Count_Message, chainstorelstSA, selchainstoreSA,Str_Sv_Panel_id;
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

        ptAppTranslation = new PromptTranslation("CFGridLoadAnswer.aspx", WebAppClass.PromptsLanguageId.ToString(), WebAppClass.LanguageId, WebAppClass.CurrentSQLDBConnection, WebAppClass.MultiLanguageCount);
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
                               // Response.Write("ProdAnsForNextPage=" + ProdAnsForNextPage + "<BR>");
     
                                AnswersAllFromGrid = Request.Form["InputidsAnswersAll"];
                                //Response.Write("AnswersAllFromGrid=" + AnswersAllFromGrid + "<BR>");
                                

                                AnswersForMenuColor = Request.Form["AnswersForMenuColor"];
                               // Response.Write("AnswersForMenuColor=" + AnswersForMenuColor + "<BR>");

                                CallFormEnded = Request.Form["CallFormEnded"];
                               // Response.Write("CallFormEnded=" + CallFormEnded + "<BR>");

                                CFEnd_SelectedProduct = Request.Form["CFEnd_SelectedProduct"];
                             //   Response.Write("CFEnd_SelectedProduct=" + CFEnd_SelectedProduct + "<BR>");
                                Str_Sv_Panel_id = Request.Form["Str_Sv_Panel_id"];
                                string[] ArrayQAns;
                                string[] ArrayEle;
                                //int i;
                                //ArrayAddress = new string[3];
                                ArrayQAns = AnswersAllFromGrid.Split("|".ToCharArray());

                                string StrProcedure,EachElement, Q_no, Ans_type, ElementAnswer, StrElement, DollarVal, CentVal, FeetVal, IncheVal, HourVal, MinuteVal;
                                int Arraylen, StrLen, Var_Max_Val, StrResult;

                                decimal CalMeasurement, CalNum, CalMinute;
                                string Strdata8, Strdata7, Strdata6, Strdata5, Strdata4, Strdata3, Strdata2, Strdata1, Ans_Value, ID_Name, StrAnswer, StrCount, DataReady, Strflag1, Strflag2, Strflag3, Strflag4, Strflag5, Strflag6, Strflag7, Strflag8;

                                StrAnswer="";
								Var_Max_Val=8000;
								StrCount="1";
								DataReady="No";
								Strflag1="";
								Strflag2="";
								Strflag3="";
								Strflag4="";
								Strflag5="";
								Strflag6="";
								Strflag7="";
                                Strflag8="";
                                Strdata1=""; 
                                Strdata2="";
                                Strdata3="";
                                Strdata4="";
                                Strdata5="";
                                Strdata6="";
                                Strdata7="";
                                Strdata8="";
                                ElementAnswer = "";
                                Arraylen = ArrayQAns.Length;
                                //Arraylen = Arraylen - 1;
                                //Response.Write("Arraylen=" + Arraylen + "<BR>");
                                for (int i = 0; i < Arraylen; i++)
                                {
                                    EachElement = ArrayQAns[i];
                                    //Response.Write("EachElement=" + EachElement + "<BR><BR>NEW<BR>");
                                   

                                    //Response.Write("EachElement=" + EachElement + "<BR>");
                                    ArrayEle = EachElement.Split(",".ToCharArray());
                                    ID_Name = ArrayEle[0];
                                    Ans_Value = ArrayEle[1];
                                    Ans_Type = ID_Name.Substring(0, 1);
                                    StrAns_val = ID_Name.Substring(4, 1);
                                   
                                  //Response.Write("ID_Name=" + ID_Name + "<BR>");
                                  //Response.Write("Ans_Value=" + Ans_Value + "<BR>");
                                  //Response.Write("StrAns_val=" + StrAns_val + "<BR>");

                                    if (Ans_Value != "Disabled")
                                    {
                                                StrAnswer = StrAnswer.Trim() + EachElement.Trim() + "|";
                                                StrLen = StrAnswer.Length;

                                                StrResult = Var_Max_Val - StrLen;
                                                  //Response.Write("Var_Max_Val=" + Var_Max_Val + "<BR>");
                                               // Response.Write("StrLen=" + StrLen + "<BR>");
										         //Response.Write("StrResult=" + StrResult + "<BR>");
                                                if (StrResult<300)
                                                {
                                                     //Response.Write("below<BR>");
                                                   //DataReady = "YES";
                                                   //Var_Max_Val = 4000;  
                                                    if (Ans_Type == "P" || Ans_Type == "M" || Ans_Type == "H")
                                                    {
                                                        if (StrAns_val != "0")
                                                        {
                                                            //Response.Write("Price");
                                                            //StrAnswer = StrAnswer.Trim() + EachElement.Trim() + "|";
                                                            DataReady = "YES";
                                                            Var_Max_Val = 8000;
                                                        }
                                                    }
                                                    else
                                                    {
                                                         //Response.Write("Normal");
                                                        DataReady = "YES";
                                                        Var_Max_Val = 8000;
                                                    }
										         }
                                                // Response.Write("DataReady=" + DataReady + "<BR>");
                                               //  Response.Write("Var_Max_Val=" + Var_Max_Val + "<BR>");
                                                 if (DataReady == "YES")
                                                 {
                                                                if (Strflag1=="")
                                                                {
																        Strdata1=StrAnswer;
																         //Response.Write("<br>Strdata1=" + Strdata1 + "<BR>");
																        Strflag1="Done";
                                                                        DataReady = "No";
                                                                      
														        }
                                                                if (Strflag2=="" && DataReady=="YES" && Strflag1=="Done")
                                                                 {
																            Strdata2=StrAnswer;
                                                                            //Response.Write("<br>Strdata2=" + Strdata2 + "<BR>");
																            Strflag2="Done";
                                                                            DataReady = "No";
                                                                 }
                                                                if (Strflag3=="" && DataReady=="YES" && Strflag2=="Done" && Strflag1=="Done")
                                                                {
																        Strdata3=StrAnswer;
                                                                        //Response.Write("<br>Strdata3=" + Strdata3 + "<BR>");
																        Strflag3="Done";
																        DataReady="No";
														        }
                                                                if (Strflag4 == "" && DataReady == "YES" && Strflag3 == "Done" && Strflag2 == "Done" && Strflag1 == "Done")
                                                                {
 
																        Strdata4=StrAnswer;
																        Strflag4="Done";
																        DataReady="No";
														        }
														        if (Strflag5=="" && DataReady=="YES" && Strflag4=="Done" && Strflag3=="Done" && Strflag2=="Done" && Strflag1=="Done")
                                                                {       
																        Strdata5=StrAnswer;
																        Strflag5="Done";
																        DataReady="No";
														        }  
														        if (Strflag6=="" && DataReady=="YES" && Strflag5=="Done" && Strflag4=="Done" && Strflag3=="Done" && Strflag2=="Done" && Strflag1=="Done")
                                                                {
																        Strdata6=StrAnswer;
																        Strflag6="Done";
																        DataReady="No";
                                                                }   
														        if (Strflag7=="" && DataReady=="YES" && Strflag6=="Done" && Strflag5=="Done" && Strflag4=="Done" && Strflag3=="Done" && Strflag2=="Done" && Strflag1=="Done") 
                                                                {
																        Strdata7=StrAnswer;
																        Strflag7="Done";
																        DataReady="No";
														        }   
														        if (Strflag8=="" && DataReady=="YES" && Strflag7=="Done" && Strflag6=="Done" && Strflag5=="Done" && Strflag4=="Done" && Strflag3=="Done" && Strflag2=="Done" && Strflag1=="Done")
                                                                {
																      	Strdata8=StrAnswer;
																		Strflag8="Done";
                                                                        DataReady = "No";
                                                                }  
                                                       StrAnswer = "";
                                                 }
                                    }//if (Ans_Value != "Disabled")
                                }//for
                                if (Strflag1=="")
                                {
										Strdata1=StrAnswer;
										StrAnswer="";
                                }
								if (Strflag2=="")
                                {
										Strdata2=StrAnswer;
										StrAnswer="";
                                }
								if (Strflag3=="") 
                                {
										Strdata3=StrAnswer;
										StrAnswer="";
								}
								if (Strflag4=="")
                                {
										Strdata4=StrAnswer;
										StrAnswer="";
								}
								if (Strflag5=="") 
                                {
										Strdata5=StrAnswer;
										StrAnswer="";
								}
								if (Strflag6=="") 
                                {
										Strdata6=StrAnswer;
										StrAnswer="";
								}
								if (Strflag7=="")
                                {
										Strdata7=StrAnswer;
										StrAnswer="";
								} 
								if (Strflag8=="")
                                {
										Strdata8=StrAnswer;
                                        StrAnswer = "";
								}
                               //Response.Write("Strdata1=" + Strdata1 + "<BR>");
                               // Response.Write("Strdata2=" + Strdata2 + "<BR>");
                               // Response.Write("Strdata3=" + Strdata3 + "<BR>");
                               //  Response.Write("Strdata4=" + Strdata4 + "<BR>");
                               //Response.Write("Strdata5=" + Strdata5 + "<BR>");
                               //Response.Write("Strdata6=" + Strdata6 + "<BR>");
                               // Response.Write("Strdata7=" + Strdata7 + "<BR>");
                               // Response.Write("Strdata8=" + Strdata8 + "<BR>");


                                StrProcedure = "" + Lang_id + "," + Job_No + "," + Wave_No + "," + Task_No + "," + store_id + "," + Str_Merch_no + "," + Strdata1 + "," + Strdata2 + "," + Strdata3 + "," + Strdata4 + "," + Strdata5 + "," + Strdata6 + "," + Strdata7 + "," + Strdata8 + "";
                              //  Response.Write("StrProcedure=" + StrProcedure + "<BR>");
                                //**************** Insert data to temp procedure

                                //if (Lang_id == 1)
                                //{
                                    DataTable dt25 = Get_JWT_Product_TempData(Lang_id, Job_No, Wave_No, Task_No, store_id, Str_Merch_no, Strdata1, Strdata2, Strdata3, Strdata4, Strdata5, Strdata6, Strdata7, Strdata8);

                                    Count_Message = dt25.Rows[0][0].ToString();
                                    return_Message = dt25.Rows[0][1].ToString();
                                   // Response.Write("Count_Message=" + Count_Message + "<BR>");
                                  //  Response.Write("return_Message=" + return_Message + "<BR>");
                                    if (Count_Message != "9999999")
                                    {
                                         Button2.Visible = false;
                                         Button5.Visible = false;
                                         Button6.Visible = false;
                                         Label1.Visible = false;
                                         Label2.Visible = false;
                                         Label8.Visible = false;
                                         BackBnt.Visible = true;
                                         MessageLab1.Visible = true;
                                    }
                                //}
                                //else
                                //{
                                //    Get_JWT_Product_TempData(Lang_id, Job_No, Wave_No, Task_No, store_id, Str_Merch_no, Strdata1, Strdata2, Strdata3, Strdata4, Strdata5, Strdata6, Strdata7, Strdata8);
                                //}
                                
    }

    #region SystemPromptandRule

    #region Procedures
    //************* Function to get the JWT info
    private DataTable Get_JWT_Product_TempData(int Lang_id, String Job_No, String Wave_No, String Task_No, String Store_id, String Str_Merch_no, String Strdata1, String Strdata2, String Strdata3, String Strdata4, String Strdata5, String Strdata6, String Strdata7, String Strdata8)
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

        return AppData.Get_JWT_Product_TempDataClass(Lang_id, iTempJob_No, iTempWave_No, iTempTask_No, iTempStore_id, iTempMerch_no, Strdata1, Strdata2, Strdata3, Strdata4, Strdata5, Strdata6, Strdata7, Strdata8, WebAppClass.CurrentSQLDBConnection);
    }
    #endregion

    private void GetPromptTranslation()
    {
                vPrompts = new string[107];
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
                vPrompts[18]="value has to less or equal to";
                vPrompts[19]="Dollar(s) value has to be numeric.";
                vPrompts[20]="Dollar(s) value can not have a period."; 
                vPrompts[21]="Cent(s) value can not be bigger than 99 cent."; 
                vPrompts[22]="Cent(s) value has to be numeric."; 
                vPrompts[23]="Cent(s) value can not have a period.";
                vPrompts[24]="You must enter a value for dollar(s)."; 
                vPrompts[25]="You must enter a value for cent(s)."; 
                vPrompts[26]="value has to bigger or equal to "; 
                vPrompts[27]="value has to less or equal to "; 
                vPrompts[28]="Feet(s) value has to be numeric."; 
                vPrompts[29]="Feet(s) value can not have a period."; 
                vPrompts[30]="Inch/Inches value can not be bigger than"; 
                vPrompts[31]="Inch/Inches value can not be less than 0."; 
                vPrompts[32]="Inch/Inches value has to be numeric."; 
                vPrompts[33]="Inch/Inches value can not have a period."; 
                vPrompts[34]="You must enter a value for feet(s)."; 
                vPrompts[35]="You must enter a value for Inch/Inches."; 
                vPrompts[36]="value has to bigger or equal to "; 
                vPrompts[37]="value has to less or equal to "; 
                vPrompts[38]="Hour(s) value has to be numeric."; 
                vPrompts[39]="Hour(s) value can not have a period.";
                vPrompts[40]="Minute(s) value can not be bigger than 59."; 
                vPrompts[41]="Minute(s) value can not be less than 0."; 
                vPrompts[42]="Minute(s) value has to be numeric."; 
                vPrompts[43]="Minute(s) value can not have a period."; 
                vPrompts[44]="You must enter a value for Hour(s)."; 
                vPrompts[45]="You must enter a value for Minute(s)."; 
                vPrompts[46]="value has to bigger or equal to "; 
                vPrompts[47]="value has to less or equal to ";  
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
                vPrompts[89]= "(Enter a date in mm/dd/yyyy format)";
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
    

}
