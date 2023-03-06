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


public partial class CFJWT_Input_Photo_Option : System.Web.UI.Page
{
    protected string StrGridDates, Str_Merch_no, user_id, Email_Active_Flag, Job_No, Wave_No, Task_No, Chain_No, Store_No, txt_EmailAdd, txt_Mobile_Email, POutOfStock_no, Error_Message, Error_Flag, HTMLHeader_info, Collect_Mobile_Email, AddressRule, NameRule, DateRule;
    protected int Error_Message_Flag, BusinessQuestion_Flag, Back_Slash, Dot, Dash, ShowType, Lang_id;
    public string[] vPrompts;
    protected string Date_input, txt_Phone1, txt_Phone2, txt_Phone3, CellProvider, Hidden_PhoneStatus, CellPhoneNo, Photo_By_QuestionFlag, strJob_Visit_Date, Bus_rule22_MV_NewVisit, Bus_rule22_Photo_Required, NewScreenPage, StrNewCallFormPathLink, chainstorelstSA, selchainstoreSA, Str_Sv_Panel_id;
    protected string Display_Prod_Data_btn, Display_Assembly_btn, Business_Type_id, EnableVideo_OptionFlag, CFD_VisitDate_Edit, GoToDeletionFlag;
    private string Str_Request_Method, Str_Http_Referer, LinkPath, LCServername, Str_SERVER_NAME;
    protected bool Type_Chrome;
    
    #region SPARUTILS
    //code block for masterpage app, dont remove
    SPARValues WebAppClass;
    PromptTranslation ptAppTranslation;

    protected void Page_PreInit()
    {

        HttpCookie appcookies = null;
        appcookies = HttpContext.Current.Request.Cookies["spartoolsnew"];
        //Response.Write("appcookies=" + appcookies.Value);

        Str_Http_Referer = Request.ServerVariables["HTTP_REFERER"];
        //Response.Write("<BR>Str_Http_Referer=" + Str_Http_Referer + "<BR>");
        Str_Request_Method = Request.ServerVariables.Get("REQUEST_METHOD").ToString();



        string fullpath = Request.ServerVariables.Get("SERVER_NAME");
        //Response.Write("fullpath=" + fullpath + "<BR>");
        fullpath = "http://" + fullpath;
        //if (Request.Cookies["spartoolsnew"] != null)
        //{
        //    Response.Write("GooD");
        //}
        if (appcookies != null)
        {
            Str_Request_Method = "NoMessage";
        }
        //Response.Write("fullpath=" + fullpath + "<BR>");
        // Response.Write("Str_Request_Method=" + Str_Request_Method + "<BR>");
        //Response.End();
        if ((Str_Request_Method == "GETT") && String.IsNullOrEmpty(Str_Http_Referer))
        {
            //Response.Redirect("https://mi12.sparinc.com/MXToolsLogin/MXSparmenu.asp"); 
            Response.Redirect("" + fullpath + "/callformdotnet/CFLoginErrorMessage.aspx");
            //Response.Redirect("http://localhost:1406/SMP_callform/CFLoginErrorMessage.aspx"); 

        }
        else
        {
            SPARHeader PageHeader;
            SPARFooter PageFooter;
            SPARBiLingualBar BiLingualBar;
            PageHeader = (SPARHeader)this.Master.FindControl("SPARHeader1");
            PageFooter = (SPARFooter)this.Master.FindControl("SPARFooter1");
            BiLingualBar = (SPARBiLingualBar)this.Master.FindControl("SPARBiLingualBar1");
            WebAppClass = new SPARValues();
            WebAppClass.PageTitle = "";

            ptAppTranslation = new PromptTranslation("CFJWT_Input_Photo_Option.aspx", WebAppClass.PromptsLanguageId.ToString(), WebAppClass.LanguageId, WebAppClass.CurrentSQLDBConnection, WebAppClass.MultiLanguageCount);
            AppMasterControls ap1 = new AppMasterControls(PageHeader, PageFooter, BiLingualBar, WebAppClass.LoggedUserName, WebAppClass.CurrentDBDateTime, WebAppClass.LanguageId, WebAppClass.PromptsLanguageId, WebAppClass.MultiLanguageCount, WebAppClass.PageTitle, WebAppClass.CurrentSQLDBConnection, this.Page, WebAppClass.SPARLogoFileURL);

            //Response.Write("Merch_PreInit=" + WebAppClass.MerchNo + "<BR>");
            if (WebAppClass.MerchNo > 0)
            {
                PageFooter.ShowSPARToolsURL = false;
                PageFooter.ShowMainPageUrl = false;
            }
        }

    }
    protected void Page_PreRender(object sender, EventArgs e)
    {
        ptAppTranslation.DoPagePromptTranslation(this.Page);
        //if (WebAppClass.CurrentSQLDBConnection.State == ConnectionState.Open)
        //{
        //    WebAppClass.CurrentSQLDBConnection.Close();
        //    WebAppClass.CurrentSQLDBConnection.Close();
        //}
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
        // Response.Write("AddressRule=" + AddressRule);

        DateRule = RuleTab.Rows[1][2].ToString();
          //Response.Write("DateRule=" + DateRule);

        NameRule = RuleTab.Rows[0][2].ToString();
        //Response.Write("NameRule=" + NameRule);
        LinkPath = RuleTab.Rows[6][2].ToString();
        LinkPath = "http://" + LinkPath + "";


        //****** Prompts
        GetPromptTranslation();

        //****** Spar link
        StringBuilder HTMLTextlink = new StringBuilder();

        HTMLTextlink.Append("<table   align='center' border='0' >");
        HTMLTextlink.Append("<tr>");
        HTMLTextlink.Append("<td align='center'   width='100%'><a  class='hyperlinkmasterpage' href='" + LinkPath + "'>" + vPrompts[4] + "</a>");
        HTMLTextlink.Append("</td>");
        HTMLTextlink.Append("</tr>");
        HTMLTextlink.Append("</table>");

        SparLinkTool.Text = HTMLTextlink.ToString();

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
        GoToDeletionFlag = "app2";
        StrNewCallFormPathLink = ConfigurationManager.AppSettings["NewCallFormPathLink"];
        Str_SERVER_NAME = Request.ServerVariables["SERVER_NAME"];
       // Response.Write("<BR>Str_SERVER_NAME=" + Str_SERVER_NAME + "<BR>");
        LCServername = Str_SERVER_NAME.ToLower();
       // Response.Write("<BR>LCServername=" + LCServername + "<BR>");
        bool StrContain = LCServername.Contains("china");
      //  Response.Write("<BR>StrContain=" + LCServername + "<BR>");
        if (StrContain == true)
        {
            StrNewCallFormPathLink = StrNewCallFormPathLink.Replace("//app1", "//chinaapp1");
            GoToDeletionFlag = "chinaapp1";
        }

        bool StrContain2 = LCServername.Contains("dev2k8");
        //  Response.Write("<BR>StrContain=" + LCServername + "<BR>");
        if (StrContain2 == true)
        {
            StrNewCallFormPathLink = StrNewCallFormPathLink.Replace("//app1", "//dev2k8");
            GoToDeletionFlag = "dev2k8";
        }

        // Response.Write("StrNewCallFormPathLink=" + StrNewCallFormPathLink);
        NewScreenPage = Request.Form["NewScreenPage"];
        //Response.Write("NewMerchPage=" + NewMerchPage);
        chainstorelstSA = Request.Form["chainstorelstSA"];
        selchainstoreSA = Request.Form["selchainstoreSA"];
        Str_Sv_Panel_id = Request.Form["Str_Sv_Panel_id"];
        CFD_VisitDate_Edit = Convert.ToString(Request.Form["CFD_VisitDate_Edit"]);
       // Response.Write("CFD_VisitDate_Edit=" + CFD_VisitDate_Edit + "<BR>");
        //********************* Variables from the CFPictureGetFileOption2
        Lang_id = WebAppClass.LanguageId;
        //Response.Write(Lang_id);
        if (Lang_id != 1)
        {
            if (Lang_id != 13)
            {
                StrNewCallFormPathLink = StrNewCallFormPathLink.Replace("webreportms", "sparinc");
                //ElementAnswer = ElementAnswer.Replace("\n", " ");  
            }
        }
        user_id = Request.Form["user_id"];
        //Response.Write("user_id=" + user_id);

        Job_No = Request.Form["ctl00$ContentPlaceHolder1$txt_jobno"];
        // Response.Write("Job_No=" + Job_No);

        if (string.IsNullOrEmpty(Job_No) == true)
        {

            //Response.Write("Email_Active_Flag=" + Email_Active_Flag);
            Str_Merch_no = Request.Form["Str_Merch_no"];
            //Response.Write("Merch_no=" + Str_Merch_no + "<BR>");
            Job_No = Request.Form["Job_No"];
            // Response.Write("Job_No=" + Job_No);
            Wave_No = Request.Form["Wave_No"];
            //Response.Write("Wave_No=" + Wave_No);
            Task_No = Request.Form["Task_No"];
            //Response.Write("Task_No=" + Task_No);
            Chain_No = Request.Form["Chain_No"];
            //Response.Write("txt_chainno=" + Chain_No);
            Store_No = Request.Form["Store_No"];
            //Response.Write("txt_storeno=" + Store_No);
            txt_EmailAdd = Request.Form["txt_EmailAdd"];
            //Response.Write("txt_EmailAdd=" + txt_EmailAdd);
            txt_Mobile_Email = Request.Form["txt_Mobile_Email"];
        }
        else
        {
            Email_Active_Flag = Request.Form["Email_Active_Flag"];
            //Response.Write("Email_Active_Flag=" + Email_Active_Flag);


            Str_Merch_no = Request.Form["ctl00$ContentPlaceHolder1$Txt_merch_no"];
            //Response.Write("Str_Merch_no=" + Str_Merch_no + "<BR>");
            //Merch_no.Value = Str_Merch_no;
            Job_No = Request.Form["ctl00$ContentPlaceHolder1$txt_jobno"];
            // Response.Write("Job_No=" + Job_No);
            Wave_No = Request.Form["ctl00$ContentPlaceHolder1$txt_waveno"];
            //Response.Write("Wave_No=" + Wave_No);
            Task_No = Request.Form["ctl00$ContentPlaceHolder1$txt_taskno"];
            //Response.Write("Task_No=" + Task_No);
            Chain_No = Request.Form["ctl00$ContentPlaceHolder1$txt_chainno"];
            //Response.Write("txt_chainno=" + Chain_No);
            Store_No = Request.Form["ctl00$ContentPlaceHolder1$txt_storeno"];
            //Response.Write("txt_storeno=" + Store_No);
            txt_EmailAdd = Request.Form["ctl00$ContentPlaceHolder1$txt_EmailAdd"];
            //Response.Write("txt_EmailAdd=" + txt_EmailAdd);
            txt_Mobile_Email = Request.Form["ctl00$ContentPlaceHolder1$txt_Mobile_Email"];
            //Response.Write("txt_Mobile_Email=" + txt_Mobile_Email);

            //**** cell phone 
            txt_Phone1 = Request.Form["ctl00$ContentPlaceHolder1$txt_Phone1"];
            // Response.Write("txt_Phone1=" + txt_Phone1);

            txt_Phone2 = Request.Form["ctl00$ContentPlaceHolder1$txt_Phone2"];
            // Response.Write("txt_Phone2=" + txt_Phone2);

            txt_Phone3 = Request.Form["ctl00$ContentPlaceHolder1$txt_Phone3"];
            // Response.Write("txt_Phone3=" + txt_Phone3);

            CellProvider = Request.Form["ctl00$ContentPlaceHolder1$DDCellProvider"];
            //Response.Write("CellProvider=" + CellProvider);


            Hidden_PhoneStatus = Request.Form["Hidden_PhoneStatus"];

            CellPhoneNo = "" + txt_Phone1 + "" + txt_Phone2 + "" + txt_Phone3 + "";
            // Response.Write("CellPhoneNo=" + CellPhoneNo);
                  

            Get_CFJWTInsertMerchInfo(Str_Merch_no, txt_EmailAdd, CellPhoneNo, CellProvider, Hidden_PhoneStatus);
        }
        // Response.Write("Hidden_PhoneStatus=" + Hidden_PhoneStatus);
        int RecordCount = 0;

        DataSet dt = Get_CFJWTMultiVisit_Report_CallForm(Lang_id, Str_Merch_no, Job_No, Wave_No, Task_No, Chain_No, Store_No);
        StrGridDates = "";
        string str = ""; 
        if (dt.Tables.Count > 0)
        {

            RecordCount = dt.Tables[0].Rows.Count;
            //Response.Write("RecordCount2=" + RecordCount2);
            if (RecordCount > 0)
            {
                StoreInfo.DataSource = dt;

                StoreInfo.DataBind();

                GridViewRow row = StoreInfo.HeaderRow;

                //StoreInfo.HeaderRow.Cells[3].Visible = false;
                Bus_rule22_MV_NewVisit = dt.Tables[0].Rows[0]["Bus_rule22_status"].ToString();
                //Response.Write("Bus_rule22_MV_NewVisit=" + Bus_rule22_MV_NewVisit  +"<BR>");

                Bus_rule22_Photo_Required = dt.Tables[0].Rows[0]["Bus_rule22_Photo_Required"].ToString();
               // Response.Write("Bus_rule22_Photo_Required=" + Bus_rule22_Photo_Required + "<BR>");

               // Display_Prod_Data_btn = dt.Tables[0].Rows[0]["Display_Prod_Data_btn"].ToString();
                //  Response.Write("Display_Prod_Data_btn=" + Display_Prod_Data_btn  +"<BR>");

               // Display_Assembly_btn = dt.Tables[0].Rows[0]["Display_Assembly_btn"].ToString();
                // Response.Write("Display_Assembly_btn=" + Display_Assembly_btn  +"<BR>");
               // Business_Type_id = dt.Tables[0].Rows[0]["Business_Type_id"].ToString();
                //  Response.Write("Business_Type_id=" + Business_Type_id + "<BR>"); 
               // EnableVideo_OptionFlag = dt.Tables[0].Rows[0]["EnableVideo_Option"].ToString();
                // Response.Write("EnableVideo_OptionFlag=" + EnableVideo_OptionFlag + "<BR>"); 

               // Str_Sv_Panel_id = dt.Tables[0].Rows[0]["Str_Sv_Panel_id"].ToString();
                // Response.Write("Str_Sv_Panel_id=" + Str_Sv_Panel_id);

                row.Cells[0].Text = vPrompts[0];
                row.Cells[1].Text = vPrompts[1];
                if (Bus_rule22_Photo_Required== "0")
                {
                    row.Cells[2].Text = vPrompts[2];
                 
                }
                else
                {
                    row.Cells[2].Text = vPrompts[3];
                    row.Cells[3].Text = vPrompts[2];
                }

                
              

                foreach (GridViewRow gvr in StoreInfo.Rows)
                 {
                     str = gvr.Cells[0].Text;
                     StrGridDates = StrGridDates.Trim() + str.Trim() + "|";
                     if (Bus_rule22_Photo_Required == "0")
                     {
                         gvr.Cells[2].Visible = false;

                     }
                    
                 }
                
                 //Response.Write("StrArrayDates=" + StrArrayDates);
                 
            }
            else
            {
                ShowJWTInfo.InnerHtml = "<span class='reportCriteriaHeader' >No error data avaiable for this Summary Report.</span>";
            }
        }

        //Execute the photo check by question procedure

        Photo_By_QuestionFlag = "";
        strJob_Visit_Date = "";
        DataSet dt25 = Get_Photo_QuestionCheck(Lang_id, Job_No, Wave_No, Task_No, Chain_No, Store_No, Str_Merch_no, strJob_Visit_Date, Str_Sv_Panel_id);
        // ds.Tables[0].Rows.Count
        if (dt25.Tables[0].Rows.Count > 0)
        {
            Photo_By_QuestionFlag = "Y";
        }
        else
        {
            Photo_By_QuestionFlag = "N";
        }

    }
    #region SystemPromptandRule

    private void GetPromptTranslation()
    {
        vPrompts = new string[5];
        vPrompts[0] = "Visit Date";
        vPrompts[1] = "Call Form Reported";
        vPrompts[2] = "No. of Photos Uploaded";
        vPrompts[3] = "No. of Photos Required";
        vPrompts[4] = "SPAR Tools";
       

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
        VRule[6] = "sparmenu";
        appDT = AppSysRules.Get_RuleValue_ByDescAsDataTable(VRule, WebAppClass.LanguageId, WebAppClass.CurrentSQLDBConnection);
        return appDT;
    }

    #endregion
    #region Procedures
     
    private DataSet Get_CFJWTMultiVisit_Report_CallForm(Int32 Lang_id, String Str_Merch_no, String Job_No, String Wave_No, String Task_No, String Chain_No, String Store_No)
    {
        Int32 iTempLang_id = 0;
        Int32 iTempStr_Merch_no = 0;
        Int32 iTempJob_No = 0;
        Int32 iTempWave_No = 0;
        Int32 iTempTask_No = 0;
        Int32 iTempChain_No = 0;
        Int32 iTempStore_No = 0;

        //iTempLang_id = AppUtils.ConvertToInteger32(Lang_id, 0);
        iTempStr_Merch_no = AppUtils.ConvertToInteger32(Str_Merch_no, 0);
        iTempJob_No = AppUtils.ConvertToInteger32(Job_No, 0);
        iTempWave_No = AppUtils.ConvertToInteger32(Wave_No, 0);
        iTempTask_No = AppUtils.ConvertToInteger32(Task_No, 0);
        iTempChain_No = AppUtils.ConvertToInteger32(Chain_No, 0);
        iTempStore_No = AppUtils.ConvertToInteger32(Store_No, 0);
        //iTempCellProvider = AppUtils.ConvertToInteger32(CellProvider, 0);
        // iTempHidden_PhoneStatus = AppUtils.ConvertToInteger32(Hidden_PhoneStatus, 0);

        return AppData.Get_USP_JWT_MultiVisit_Report_CallForm(Lang_id, iTempStr_Merch_no, iTempJob_No, iTempWave_No, iTempTask_No, iTempChain_No, iTempStore_No, WebAppClass.CurrentSQLDBConnection);
    }
    private DataTable Get_CFJWTInsertMerchInfo(String Str_Merch_no, String txt_EmailAdd, String CellPhoneNo, String CellProvider, String Hidden_PhoneStatus)
    {
        Int32 iTempMerchNo = 0;

        Int32 iTempCellProvider = 0;
        Int32 iTempHidden_PhoneStatus = 0;


        iTempMerchNo = AppUtils.ConvertToInteger32(Str_Merch_no, 0);
        iTempCellProvider = AppUtils.ConvertToInteger32(CellProvider, 0);
        iTempHidden_PhoneStatus = AppUtils.ConvertToInteger32(Hidden_PhoneStatus, 0);

        return AppData.Get_CFMerchCellPhoneInsert(iTempMerchNo, txt_EmailAdd, CellPhoneNo, iTempCellProvider, iTempHidden_PhoneStatus, WebAppClass.CurrentSQLDBConnection);
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
    protected void CreateButtonLink(object sender, GridViewRowEventArgs e)
    {
        string P_visit_dt, Call_Form_Access, Photo_Access, P_visit_dt2, ArraySaveDates, Report_New_Visit, PhotoBy_Question_status, Bus_rule22_status, Bus_rule22_Photo_Remain, Bus_rule22_Multi_visit_Flag, Bus_rule22_MV_Remain, Bus_rule22_MV_Flag, Bus_rule22_Disable_CF_Access;
        string Hour_Time_in, Min_Time_in, Time_in_Status, Hour_Time_out, Min_Time_out, Time_out_Status, Manager_Name, Manager_title, Drive_Time, Visit_Miles;
        DateTime dt ;
        Report_New_Visit = "";
        Bus_rule22_Disable_CF_Access = "";
        Bus_rule22_MV_Flag = "N";
        Bus_rule22_MV_Remain = "";
        
        if (e.Row.RowType == DataControlRowType.DataRow)
        {
            P_visit_dt = Convert.ToString(StoreInfo.DataKeys[e.Row.RowIndex].Values[0]);
            Call_Form_Access = Convert.ToString(StoreInfo.DataKeys[e.Row.RowIndex].Values[1]);
            Photo_Access = Convert.ToString(StoreInfo.DataKeys[e.Row.RowIndex].Values[2]);
            Report_New_Visit = Convert.ToString(StoreInfo.DataKeys[e.Row.RowIndex].Values[3]);
            PhotoBy_Question_status = Convert.ToString(StoreInfo.DataKeys[e.Row.RowIndex].Values[4]);
            Bus_rule22_status= Convert.ToString(StoreInfo.DataKeys[e.Row.RowIndex].Values[5]);
            Bus_rule22_Photo_Remain = Convert.ToString(StoreInfo.DataKeys[e.Row.RowIndex].Values[6]);

            Hour_Time_in= Convert.ToString(StoreInfo.DataKeys[e.Row.RowIndex].Values[7]);
            Min_Time_in= Convert.ToString(StoreInfo.DataKeys[e.Row.RowIndex].Values[8]);
            Time_in_Status= Convert.ToString(StoreInfo.DataKeys[e.Row.RowIndex].Values[9]);
            Hour_Time_out= Convert.ToString(StoreInfo.DataKeys[e.Row.RowIndex].Values[10]);
            Min_Time_out= Convert.ToString(StoreInfo.DataKeys[e.Row.RowIndex].Values[11]);
            Time_out_Status= Convert.ToString(StoreInfo.DataKeys[e.Row.RowIndex].Values[12]);
            Manager_Name= Convert.ToString(StoreInfo.DataKeys[e.Row.RowIndex].Values[13]);
            Manager_title = Convert.ToString(StoreInfo.DataKeys[e.Row.RowIndex].Values[14]);
            Drive_Time = Convert.ToString(StoreInfo.DataKeys[e.Row.RowIndex].Values[15]);
            Visit_Miles = Convert.ToString(StoreInfo.DataKeys[e.Row.RowIndex].Values[16]);

            //Response.Write("Visit_Miles=" + Visit_Miles + "<BR>");
           // Response.Write("Drive_Time=" + Drive_Time + "<BR>");
            //Response.Write("Hour_Time_out=" + Hour_Time_out + "<BR>");
            //Response.Write("Min_Time_out=" + Min_Time_out + "<BR>");
            //Response.Write("Time_out_Status=" + Time_out_Status + "<BR>");
            //Response.Write("Manager_Name=" + Manager_Name + "<BR>");
            //Response.Write("Manager_title=" + Manager_title + "<BR>");
            //Response.Write("PhotoBy_Question_status=" + PhotoBy_Question_status);
            //Response.Write("Photo_Access=" + Photo_Access);
            //Response.Write("Call_Form_Access=" + Call_Form_Access);
            //Response.Write("Bus_rule22_status=" + Bus_rule22_status);
            //Response.Write("Bus_rule22_Photo_Remain=" + Bus_rule22_Photo_Remain + "<BR>");

          Button btnButton = (Button)e.Row.FindControl("CFBttton_Status");
          if (Bus_rule22_status == "Y")
          {
              if (Bus_rule22_Photo_Remain != "0")
              {
                  Bus_rule22_Disable_CF_Access = "Yes";
                  Bus_rule22_MV_Flag = "Y";
                  Bus_rule22_MV_Remain = Bus_rule22_Photo_Remain;
              }
              else
              {
                  Bus_rule22_MV_Flag = "N";
                  Bus_rule22_MV_Remain = Bus_rule22_Photo_Remain;
              }   
          }

          if (Call_Form_Access == "Yes")
          {
              //btnButton.Enabled = false;
          }
          if (Bus_rule22_Disable_CF_Access == "Yes")
          {
              //btnButton.Enabled = false;
          }
         // Response.Write("P_visit_dt=" + P_visit_dt);   
         // dt = Convert.ToDateTime(P_visit_dt);
         // Response.Write("dt=" + dt);  
         // P_visit_dt2 = String.Format("{0:d}", dt);

         // Response.Write("CFD_VisitDate_Editinsdie=" + CFD_VisitDate_Edit + "<BR>");
         
          //Response.Write("P_visit_dt=" + P_visit_dt2);
          btnButton.Attributes.Add("onclick", "return GetAccess_Call_Form('" + P_visit_dt + "','" + Call_Form_Access + "','" + Bus_rule22_MV_Flag + "','" + Bus_rule22_MV_Remain + "','" + Hour_Time_in + "','" + Min_Time_in + "','" + Time_in_Status + "','" + Hour_Time_out + "','" + Min_Time_out + "','" + Time_out_Status + "','" + Manager_Name + "','" + Manager_title + "','" + Drive_Time + "','" + Visit_Miles + "')");
         
          Button btnButton2 = (Button)e.Row.FindControl("PhotoBttton_Status");

          if (CFD_VisitDate_Edit != "Y")
          {
              btnButton2.Attributes.Add("onclick", "return GetAccess_Photo('" + P_visit_dt + "','" + Call_Form_Access + "','" + PhotoBy_Question_status + "','" + Bus_rule22_MV_Flag + "','" + Bus_rule22_MV_Remain + "','" + Hour_Time_in + "','" + Min_Time_in + "','" + Time_in_Status + "','" + Hour_Time_out + "','" + Min_Time_out + "','" + Time_out_Status + "','" + Manager_Name + "','" + Manager_title + "','" + Drive_Time + "','" + Visit_Miles + "')");
              if (PhotoBy_Question_status == "D")
              {
                  btnButton2.Enabled = false;
              }
          }
          else
          {
              btnButton2.Visible = false;
              btnButton.Text = "Call Header";
          }
   
         if (Report_New_Visit == "Yes")
          {
              Add_New_Visit_Dt.Enabled = false;
          }
          Add_New_Visit_Dt.Visible = false;
       

       }
       //Context.Items["MV_Bus_rule22_Flag"] = Bus_rule22_MV_Flag;
       //Context.Items["MV_Photo_Remain"] = Bus_rule22_MV_Remain;
       //Response.Write("Report_New_Visitout=" + Report_New_Visit);
       //Button btnButton3 = (Button)e.Row.FindControl("Add_New_Visit_Dt");
       //if (Report_New_Visit == "Yes")
       //{
       //    btnButton3.Enabled = false;
       //}

    }
}
