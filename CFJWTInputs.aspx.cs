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



public partial class CFJWTInputs : System.Web.UI.Page
{
    protected string Email_Act_Flag, Str_internet_Access, Ele_Flag, Str_Merch_no, Str_User_id, ClientAccessType, Email_Status_Flag, EmailAddress, Collect_Mobile_Email, Mobile_Email, Merch_User, Spar_User, Cellphone_No, AreaCode, ThreeCode, FourCode, Str_carrier_id, ShowButton, CFD_VisitDate_Edit;
    protected int ClientAccessCode, Lang_id, Version_Browser, Check_MerchApp;
    public string[] vPrompts;
    protected string Wave_No, Task_No, Chain_No, Store_No, Str_txt_EmailAdd, Str_txt_Mobile_Email, RBSTORE, Type_Browser, LinkPath, Check_SparApp, Search_Merch_no, Merch_no_check, butStatus, LogInUserId, NewScreenPage, chainstorelstSA,  selchainstoreSA;
    private string Job_No, Str_Request_Method, Str_Http_Referer,SparLink_Text;
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

       
        //System.GC.Collect()
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

            ptAppTranslation = new PromptTranslation("CFJWTInputs.aspx", WebAppClass.PromptsLanguageId.ToString(), WebAppClass.LanguageId, WebAppClass.CurrentSQLDBConnection, WebAppClass.MultiLanguageCount);
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
    #region events
            protected void Page_Load(object sender, EventArgs e)
            {
			if (Convert.ToString(Request.Form["Job_No"]) == null)
                {
				
                 ViewState["JobNo"] =  Convert.ToString(Request.Form["jobno"]);
                ViewState["WaveNo"] = Convert.ToString(Request.Form["waveno"]);
                ViewState["TaskNo"] = Convert.ToString(Request.Form["taskno"]);
                ViewState["ChainNo"] = Convert.ToString(Request.Form["chainno"]);
                ViewState["StoreNo"] = Convert.ToString(Request.Form["storeno"]);
                ViewState["MerchNo"] = Convert.ToString(Request.Form["merchno"]);
                CFD_VisitDate_Edit = Convert.ToString(Request.Form["CFD_VisitDate_Edit"]);
				}

                //Response.Write("CFD_VisitDate_Edit=" + CFD_VisitDate_Edit + "<BR>");
              // Response.Write("J");
				// Response.End();
                 
                        WebAppClass.Set_MerchforForm(this.Merch_no, Convert.ToString(WebAppClass.MerchNo));


                        //Type_Browser = Request.UserAgent.ToString();
                        Type_Chrome = Request.UserAgent.Contains("Chrome");
                        
                       // Response.Write("Type_Chrome=" + Type_Chrome + "<BR>");
                        //Response.Write("FilePath=" + FilePath);
                        ShowButton = "NO";
                        Email_Act_Flag = "Y";
                        Type_Browser = Request.Browser.Browser;
                       // Response.Write("Type_Browser=" + Type_Browser + "<BR>");
                        Version_Browser = Request.Browser.MajorVersion;
                        // Type_Browser = "IE";
                        // Version_Browser=8;
                       //Response.Write("Version_Browser=" + Version_Browser + "<BR>");
                        //Response.Write("Email_Active_Flag=" + Email_Active_Flag);
                        //Merch_no = Request.Form["Merch_no"];
                        //Response.Write("Lang_id=" + Lang_id);
                            
                        //********* Browser check 
                        //if (Type_Browser != "IE")
                        //{
                        //   if (Type_Chrome == false)
                        //    {
                        //        pnl_Browser.Visible = true;
                        //        //Response.End();
                        //        pnl_InputArea.Visible = false;
                        //   }
                        //}
                        //if (Type_Browser == "IE")
                        //{
                        //    if (Version_Browser < 4)
                        //    {
                        //        pnl_InputArea.Visible = false;
                        //    }
                        //}
                
               string jobno11 = Request.Form["jobno"];
             //  Response.Write("jobno11=" + jobno11 + "<BR>");
                        NewScreenPage = Request.Form["NewScreenPage"];
                        chainstorelstSA = Request.Form["chainstorelstSA"];
                       // Response.Write("chainstorelstSA=" + chainstorelstSA + "<BR>");
                         selchainstoreSA = Request.Form["selchainstoreSA"];
                       //  Response.Write("selchainstoreSA=" + selchainstoreSA + "<BR>");
              //************** Lang Id

                        Lang_id = WebAppClass.LanguageId;
                        // Response.Write(Lang_id);
                         //Response.End();
                        LogInUserId = WebAppClass.LoggedUserId;

              //********** Get merch Number
                         Str_Merch_no = Request.Form["Str_Merch_no"];
                         butStatus = Request.Form["ctl00$ContentPlaceHolder1$butStatus1"];
                         Search_Merch_no = Request.Form["ctl00$ContentPlaceHolder1$Txt_merch_no"];
                         if ((Str_Merch_no == "")||(string.IsNullOrEmpty(Str_Merch_no) == true))
                         {
                             Str_Merch_no = Convert.ToString(WebAppClass.MerchNo);
                             
                             //Response.Write("Merch_noBefore=" + Str_Merch_no + "<BR>");
                         }
               //*********** Research stores
                         if (string.IsNullOrEmpty(Str_Merch_no) == false)
                         {
                                if (Str_Merch_no == "0")
                                {
                                     if (string.IsNullOrEmpty(Search_Merch_no) == false)
                                     {
                                         Str_Merch_no = Search_Merch_no;
                                         butStatus = Request.Form["butStatus"];
                                     }
                                 }
                         }
                        
                         //Str_Merch_no = "99999";
                        if (string.IsNullOrEmpty(Str_Merch_no) == true)
                        {  
                            Str_Merch_no = "";
                          
                        }
                        if (Str_Merch_no != "")
                        {
                            if (Str_Merch_no != "0")
                            {
                                Txt_merch_no.Text = Str_Merch_no;
                            }
                           
                        }
                       
            //********** Get Job Number
                         //Response.Write("Merch_no=" + Merch_no + "<BR>");
                        Job_No = Request.Form["Job_No"];
                        if (Job_No!="")
                        {
                            txt_jobno.Text=Job_No;
                        }
            //********** Get wave Number
                         //Response.Write("Job_No=" + Job_No);
                         Wave_No = Request.Form["Wave_No"];
                         //Response.Write("Wave_No=" + Wave_No);
                         if (Wave_No != "")
                         {
                             txt_waveno.Text = Wave_No;
                         }

           //********** Get Task Number

                        Task_No = Request.Form["Task_No"];
                         //Response.Write("Task_No=" + Task_No);
                         if (Task_No != "")
                         {
                             txt_taskno.Text = Task_No;
                         }
            //********** Get Chain Number

                        Chain_No = Request.Form["Chain_No"];
                         //Response.Write("txt_chainno=" + Chain_No);
                         if (Chain_No != "")
                         {
                             txt_chainno.Text = Chain_No;
                         }
           //********** Get Store Number  
                        Store_No = Request.Form["Store_No"];
                       // Response.Write("txt_storeno=" + Store_No);
                        if (Store_No != "")
                        {
                            txt_storeno.Text = Store_No;
                        }
           //********** Store search button - return values
                        RBSTORE = "";
                        string[] StrRadioButton;
                        RBSTORE = Request.Form["SelectedSC"];
                        //Response.Write("RBSTORE=" + RBSTORE);
                        if (string.IsNullOrEmpty(RBSTORE) == false)
                        {
                            //StrRadioButton = new string[2];
                            StrRadioButton=RBSTORE.Split("-".ToCharArray());
                            Chain_No = StrRadioButton[0];
                            txt_chainno.Text = Chain_No;
                            //Response.Write("Chain_Noqq=" + Chain_No);
                            Store_No = StrRadioButton[1];
                            txt_storeno.Text = Store_No;
                            //Response.Write("Store_No=" + Store_No);
		                }	

           //*********** Get Email address and Mobile
                        Str_txt_EmailAdd = Request.Form["txt_EmailAdd"];
                        //Response.Write("Str_txt_EmailAdd=" + Str_txt_EmailAdd);
                        Str_txt_Mobile_Email = Request.Form["txt_Mobile_Email"];
                       // Response.Write("Str_txt_Mobile_Email=" + Str_txt_Mobile_Email);

                        
                        
           //********** System Rules
                        Collect_Mobile_Email = "NO";
                        DataTable RuleTab = new DataTable();
                        RuleTab = GetSystemRules();
                        if (RuleTab.Rows.Count > 0)
                        {
                            Collect_Mobile_Email = RuleTab.Rows[2][2].ToString();
                            LinkPath= RuleTab.Rows[5][2].ToString();
                            LinkPath = "http://" + LinkPath + "";
                        }
                        //Response.Write("VRuleghfhfgh=" + Collect_Mobile_Email + "<BR>");
                       // Response.Write("LinkPath=" + LinkPath + "<BR>");
           //****** Prompts
                        GetPromptTranslation();
                        //strTest=WebAppClass.LoggedUserName;
                       // Response.Write("strTest=" + strTest + "<BR>");
                        Str_User_id = WebAppClass.LoggedUserId;
                        //Response.Write("Str_User_id=" + Str_User_id);
           //Link to the spartool

                        //****** Spar link
                        //StringBuilder HTMLText = new StringBuilder();

                       // HTMLText.Append("<table   align='center' border='0' >");
                       // HTMLText.Append("<tr>");
                       // HTMLText.Append("<td align='center'   width='100%'><a  class='hyperlinkmasterpage' href='" + LinkPath + "'>" + vPrompts[31] + "</a>");
                      //  HTMLText.Append("</td>");
                      //  HTMLText.Append("</tr>");
                       // HTMLText.Append("</table>");

                      //  SparLinkTool.Text = HTMLText.ToString();

          //********* Get the Phone information   
                       DataTable dtMerchEmail;
                        dtMerchEmail = Get_MerchEmail();

                        if (dtMerchEmail.Rows.Count > 0)
                        {
                            Str_internet_Access = dtMerchEmail.Rows[0]["internet_Access"].ToString();
                            EmailAddress = dtMerchEmail.Rows[0]["Email_addr"].ToString();
                            Mobile_Email = dtMerchEmail.Rows[0]["Mobile_Email"].ToString();
                            Str_carrier_id = dtMerchEmail.Rows[0]["mobile_carrier_id"].ToString();
                            Cellphone_No = dtMerchEmail.Rows[0]["Cellphone_No"].ToString();
                            AreaCode = dtMerchEmail.Rows[0]["AreaCode"].ToString();
                            ThreeCode = dtMerchEmail.Rows[0]["ThreeCode"].ToString();
                            FourCode = dtMerchEmail.Rows[0]["FourCode"].ToString();
                        }
                        txt_EmailAdd.Text = EmailAddress;
                       //Response.Write("Str_internet_Access=" + Str_internet_Access);
                       // Response.Write("EmailAddress=" + EmailAddress);
                        // Response.Write("Mobile_Email=" + Mobile_Email);
                       //  Response.Write("Cellphone_No=" + Cellphone_No);
                       //  Response.Write("AreaCode=" + AreaCode);
                      //  Response.Write("ThreeCode=" + ThreeCode);
                       //  Response.Write("FourCode=" + FourCode);
                        
                        //Str_User_id.Insert(dofunction
                        //nubmer=TrueChar=False 
                        Email_Status_Flag = "N";
                        Merch_User = "";
                        Spar_User = "";
                        if (Str_Merch_no != "")
                        {
                                if (Str_Merch_no != "0")
                                {

                                    //if (Lang_id == 5 || Lang_id == 16)
                                    //{
                                        Merch_no_check = Str_Merch_no;
                                        Merch_JWT_Info.DataSource = Get_MerchJWTMenu();
                                        Merch_JWT_Info.DataValueField = "JWTSC_Value";

                                        Merch_JWT_Info.DataTextField = "JWTSC_Text";

                                        Merch_JWT_Info.DataBind();
                                        //" + vPrompts[16] + "
                                        Merch_JWT_Info.Items.Insert(0, "" + vPrompts[30] + "");
                                        Merch_JWT_Info.Attributes.Add("onchange", "javascript:return SavePopup();");
                                        //Merch_JWT_Info.Text.Replace(" ", HttpUtility.HtmlDecode("&nbsp;"));
                                        foreach (ListItem myItem in Merch_JWT_Info.Items)
                                        {
                                            myItem.Text = myItem.Text.Replace(" ", HttpUtility.HtmlDecode("&nbsp;"));

                                            // Response.Write("EmployeeID=");
                                        }
                                   // }
                                }
                            else
                                {
                                    Merch_JWT_Info.Items.Insert(0, "" + vPrompts[29] + "");
                                }
                        }
                        else
                        {
                            Merch_JWT_Info.Items.Insert(0, "" + vPrompts[29] + "");
                        }
                        Button_JWTSC.Visible = false;
            //*********** decide the login from Merch or spar tools 
                            
                      
                        if (IsNumber(Str_User_id)==true) 
                            {
                                   Merch_User="Y";
                                   ShowButton = "NO";
                                   Txt_merch_no.ReadOnly = true;
                                
                                   if (Lang_id==5)
                                   {
                                            txt_jobno.ReadOnly = true;
                                            txt_waveno.ReadOnly = true;
                                            txt_taskno.ReadOnly = true;
                                            txt_chainno.ReadOnly = true;
                                            txt_storeno.ReadOnly = true;      
                                   }
                            }
                        else
	                        {
                                Spar_User = "Y";
                                Txt_merch_no.ReadOnly = false;
                                ShowButton = "NO";
	                        }

                        if (Merch_User == "Y")
                            {
                                if (Lang_id != 4)
                                {
                                    Email_Status_Flag = "Y"; // Report option flag  
                                }  
                            }
                           
                        //Machine test mode
                            if (Str_Merch_no == "0" && Str_User_id == "sys:dev")
                            {
                                Spar_User = "";
                                Txt_merch_no.ReadOnly = false;
                                ShowButton = "NO";
                                Email_Status_Flag = "Y";
                            }
                            //Response.Write("nubmer=" + Str_User_id);
                            //Response.Write("Spar_User=" + Spar_User);
                       if (Lang_id==6 || Lang_id==7) 
                            {
	                            ShowButton="YES";          
                            }
                            //ShowButton = "YES";                    
           //**************Store Search Button
                            if (ShowButton == "YES")
                            {
                                but_StoreSearch.Visible = true;
                            }
                            else
                            {
                                but_StoreSearch.Visible = false;
                            }

                            if (Lang_id == 1 || Lang_id == 13)
                            //  if (Lang_id == 1 || Lang_id == 13 || Lang_id == 2)
                            {
                                txt_Phone1.Text = AreaCode;
                                txt_Phone2.Text = ThreeCode;
                                txt_Phone3.Text = FourCode;
                                if (AreaCode != "")
                                {
                                    txt_Phone1.ReadOnly = true;
                                }
                                if (ThreeCode != "")
                                {
                                    txt_Phone2.ReadOnly = true;
                                }
                                if (FourCode != "")
                                {
                                    txt_Phone3.ReadOnly = true;
                                }
                                //Remove me Select A Provider 

                                //DDCellProvider.SelectedItem.Value = "0";
                                //***** Drop down menu Carrier
                                DDCellProvider.DataSource = GetCellPhoneInfo();
                                DDCellProvider.DataValueField = "mobile_carrier_id";
                                DDCellProvider.DataTextField = "mobile_carrier_desc";

                                DDCellProvider.DataBind();
                                if (Str_carrier_id == "0")
                                {
                                    DDCellProvider.Items.Insert(0, new ListItem("Select A Provider", "0"));
                                }
                                else
                                {
                                    if ((string.IsNullOrEmpty(Str_carrier_id) == false))
                                    {
                                        DDCellProvider.Items.Insert(00, new ListItem("Remove me", "00"));
                                        DDCellProvider.Items.FindByValue("" + Str_carrier_id + "").Selected = true;
                                    }
                                }
                                if ((string.IsNullOrEmpty(Cellphone_No) == true))
                                {
                                    DDCellProvider.Enabled = false;

                                    if (Str_carrier_id == "0")
                                    {
                                        DDCellProvider.Items.FindByValue("0").Selected = true;
                                    }
                                }



                            }//end of if (Lang_id == 1 || Lang_id == 13)
                        if (Convert.ToString(Request.Form["Job_No"]) == null)
                        {
                            txt_jobno.Text = Convert.ToString(ViewState["JobNo"]);
                            txt_waveno.Text = Convert.ToString(ViewState["WaveNo"]);
                            txt_taskno.Text = Convert.ToString(ViewState["TaskNo"]);
                            txt_chainno.Text = Convert.ToString(ViewState["ChainNo"]);
                            txt_storeno.Text = Convert.ToString(ViewState["StoreNo"]);
                            Txt_merch_no.Text = Convert.ToString(ViewState["MerchNo"]);
                        }
                        if (Convert.ToString(Request.Form["Job_No"]) != null)
                        {
                            txt_jobno.Text = Convert.ToString(Request.Form["Job_No"]);
                            txt_waveno.Text = Convert.ToString(Request.Form["Wave_No"]);
                            txt_taskno.Text = Convert.ToString(Request.Form["Task_No"]);
                            txt_chainno.Text = Convert.ToString(Request.Form["Chain_No"]);
                            txt_storeno.Text = Convert.ToString(Request.Form["Store_No"]);
                            Txt_merch_no.Text = Convert.ToString(Request.Form["Str_Merch_no"]);
                        }
                }
        #endregion
        #region Procedures
                private DataTable Get_MerchEmail()
                    {
                        Int32 iTempMerchNo = 0;
                        iTempMerchNo = AppUtils.ConvertToInteger32(Str_Merch_no, 0);
                       // return AppData.Get_MerchInfo(iTempMerchNo, WebAppClass.CurrentSQLDBConnection);
                        return AppData.Get_MerchInfo(iTempMerchNo, WebAppClass.CurrentSQLDBConnection);
                    }

       // USP_CFJWT_CellPhoneCarrier
                private DataTable GetCellPhoneInfo()
                    {
                        return AppData.Get_CellPhoneCarrier(WebAppClass.CurrentSQLDBConnection);
                    }
                private DataTable Get_MerchJWTMenu()
                {
                    Int32 iTempMerchNo = 0;
                    Int32 iTempLang_id = 0;

                    iTempMerchNo = AppUtils.ConvertToInteger32(Str_Merch_no, 0);
                    iTempLang_id = Lang_id;

                    return AppData.Get_MerchJWTMenu(iTempLang_id,iTempMerchNo,WebAppClass.CurrentSQLDBConnection);
                }
    private DataTable Get_CFJWTMultiVisit_validation(Int32 Lang_id, String Str_Merch_no, String Job_No, String Wave_No, String Task_No, String Chain_No, String Store_No, String LogInUserId)
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

                    return AppData.Get_USP_JWT_MultiVisit_Validate(Lang_id, iTempStr_Merch_no, iTempJob_No, iTempWave_No, iTempTask_No, iTempChain_No, iTempStore_No,LogInUserId, WebAppClass.CurrentSQLDBConnection);
                }
        #endregion

        #region SystemPromptandRule

                private void GetPromptTranslation()
                {
                     
                    vPrompts = new string[32];
                    vPrompts[0] = "Please enter a valid Merch number";
                    vPrompts[1] = "Please enter a valid Job number";
                    vPrompts[2] = "Please enter a valid Wave number";
                    vPrompts[3] = "Please enter a valid Task number";
                    vPrompts[4] = "Please enter a valid Chain number";
                    vPrompts[5] = "Please enter a valid Visit Date";
                    vPrompts[6] = "Please enter a valid Store number";
                    vPrompts[7] = "is not a valid Task number.";
                    vPrompts[8] = "Invalid E-mail Address";
                    vPrompts[9] = "Do you want to provide your email address to SPAR.";
                    vPrompts[10] = "Using the Internet Call Form requires an email address- please enter yours here.";
                    vPrompts[11] = "Invalid Mobile E-mail Address";
                    vPrompts[12] = "NEXT";
                    vPrompts[13] = "RESET";
                    vPrompts[14] = "Invalid Cell Phone";
                    vPrompts[15] ="By providing your cell phone information you are agreeing to allow SPAR to send you";
		            vPrompts[16] ="text messages, and that you will not be reimbursed for any associated cost.";
                    vPrompts[17] ="To Accept, Click OK";
                    vPrompts[18] ="If you would rather not, Click Cancel";
                    vPrompts[19] ="You are changing your cell phone information";
		            vPrompts[20] ="Click OK to confirm";
                    vPrompts[21] ="Click Cancel to disregard";
                    vPrompts[22] ="By removing your cell phone information you will no longer receive text messages from SPAR.";
                    vPrompts[23] ="Click OK to continue or Cancel to change your selection";
                    vPrompts[24] ="You must provide a cell Phone Number.";
                    vPrompts[25] ="Click Cancel to disregard";
                    vPrompts[26] ="You are about to remove cell phone information";
                    vPrompts[27] = "This application only works with Microsoft Internet Explorer at the moment. ";
                    vPrompts[28] = "Please use Internet Explorer 4.0 and above.";
                    vPrompts[29] = "No Data Found";
                    vPrompts[30] = "- - Select Job/Wave/Task/Chain/Store - -";
                    vPrompts[31] = "SPAR Tools";
                    ptAppTranslation.DoArrayPromptTranslation(vPrompts);

                    //PromptTranslation GetPromptTranslation = new PromptTranslation("CFJWTInputs.asp", WebAppClass.PromptsLanguageId.ToString(), WebAppClass.LanguageId, WebAppClass.CurrentSQLDBConnection, WebAppClass.MultiLanguageCount);
                    //GetPromptTranslation.DoArrayPromptTranslation(vPrompts);

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
                            VRule[5] = "sparmenu";
                            appDT = AppSysRules.Get_RuleValue_ByDescAsDataTable(VRule, WebAppClass.LanguageId, WebAppClass.CurrentSQLDBConnection);
                            return appDT;
                }


        #endregion

#region methods
    protected void DropDownList1_DataBound(object sender, EventArgs e)
    {
        
        foreach (ListItem myItem in Merch_JWT_Info.Items)
        {

            Response.Write("EmployeeID=");
        } 
    }

static bool IsNumber(string value)
{
    // Return true if this is a number.
    int number1;
    return int.TryParse(value, out number1);
}
 #endregion

    protected void JWT_Validation_Path(object sender, EventArgs e)
    {
	
        int Error_Message_Flag;
        string Str_job_no, Str_Wave_No, Str_Task_No, Str_Chain_No, Str_Store_No, return_Error_Flag, Multi_visit_job_Flag, Old_Day, Old_Month, Old_Year, Old_Hour_Time_in, Old_Min_Time_in, Old_Time_in_Status, Old_Hour_Time_out, Old_Min_Time_out, Old_Time_out_Status,Old_Manager_Name,Old_Manager_title;
        string Old_Visit_Miles, Old_Drive_Time;

        Str_job_no = Request.Form["ctl00$ContentPlaceHolder1$txt_jobno"];
        Str_Wave_No = Request.Form["ctl00$ContentPlaceHolder1$txt_waveno"];
        Str_Task_No = Request.Form["ctl00$ContentPlaceHolder1$txt_taskno"];
        Str_Chain_No = Request.Form["ctl00$ContentPlaceHolder1$txt_chainno"];
        Str_Store_No = Request.Form["ctl00$ContentPlaceHolder1$txt_storeno"];
		
        //**************** Validation procedure
        DataTable dt = Get_CFJWTMultiVisit_validation(Lang_id, Str_Merch_no, Str_job_no, Str_Wave_No, Str_Task_No, Str_Chain_No, Str_Store_No, LogInUserId);
        //Error_Message = dt.Rows[0][0].ToString();
        Error_Message_Flag = dt.Columns.Count;
       // Response.Write("Error_Message_Flagww=" + Error_Message_Flag + "<BR>");
       // Context.Items["Photo_Visit_dt"] = OrigioalFile;
        if (Error_Message_Flag == 1)
        {
           Server.Transfer("CFJWTValidateSV.aspx", true);
        }
        else
        {
            Multi_visit_job_Flag = dt.Rows[0]["Multi_visit_job"].ToString();
            return_Error_Flag = dt.Rows[0]["return_Error"].ToString();
            Old_Day = dt.Rows[0]["Old_Day"].ToString();
            Old_Month = dt.Rows[0]["Old_Month"].ToString();
            Old_Year = dt.Rows[0]["Old_Year"].ToString();

            Old_Hour_Time_in = dt.Rows[0]["Old_Hour_Time_in"].ToString();
            Old_Min_Time_in = dt.Rows[0]["Old_Min_Time_in"].ToString();
            Old_Time_in_Status = dt.Rows[0]["Old_Time_in_Status"].ToString();
            Old_Hour_Time_out = dt.Rows[0]["Old_Hour_Time_out"].ToString();
            Old_Min_Time_out = dt.Rows[0]["Old_Min_Time_out"].ToString();
            Old_Time_out_Status = dt.Rows[0]["Old_Time_out_Status"].ToString();
            Old_Manager_Name = dt.Rows[0]["Old_Manager_Name"].ToString();
            Old_Manager_title = dt.Rows[0]["Old_Manager_title"].ToString();
            Old_Visit_Miles = dt.Rows[0]["Old_Visit_Miles"].ToString();
            Old_Drive_Time = dt.Rows[0]["Old_Drive_Time"].ToString();
           // Response.Write("Multi_visit_job=" + Multi_visit_job_Flag + "<BR>");
            //Response.Write("Multi_visit_job=" + return_Error_Flag + "<BR>");
            //Response.Write("Old_Day=" + Old_Day + "<BR>");
            //Response.Write("Old_Month=" + Old_Month + "<BR>");
            //Response.Write("Old_Year=" + Old_Year + "<BR>");

            Context.Items["Old_Day"] = Old_Day;
            Context.Items["Old_Month"] = Old_Month;
            Context.Items["Old_Year"] = Old_Year;

            Context.Items["Old_Hour_Time_in"] = Old_Hour_Time_in;
            Context.Items["Old_Min_Time_in"] = Old_Min_Time_in;
            Context.Items["Old_Time_in_Status"] = Old_Time_in_Status;
            Context.Items["Old_Hour_Time_out"] = Old_Hour_Time_out;
            Context.Items["Old_Min_Time_out"] = Old_Min_Time_out;
            Context.Items["Old_Time_out_Status"] = Old_Time_out_Status;

            Context.Items["Old_Manager_Name"] = Old_Manager_Name;
            Context.Items["Old_Manager_title"] = Old_Manager_title;

            Context.Items["Old_Visit_Miles"] = Old_Visit_Miles;
            Context.Items["Old_Drive_Time"] = Old_Drive_Time;

            if (Multi_visit_job_Flag == "Y" && return_Error_Flag == "0")
            {
               Server.Transfer("CFJWT_Input_Photo_Option.aspx", true);
            }
            else
            {
               Server.Transfer("CFJWTValidateSV.aspx", true);
            }
           
           
            
        }
    }
}
