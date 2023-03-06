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


public partial class CFJWTInputs_Start : System.Web.UI.Page
{
    protected string Email_Act_Flag;
    protected string Str_internet_Access;
    protected string Ele_Flag;
    protected string Str_Merch_no, Str_User_id, ClientAccessType, Email_Status_Flag, EmailAddress, Collect_Mobile_Email, Mobile_Email, Merch_User, Spar_User, Cellphone_No, AreaCode, ThreeCode, FourCode, Str_carrier_id, ShowButton;
    protected int ClientAccessCode, Lang_id, Version_Browser;
    public string[] vPrompts;
    protected string Job_No, Wave_No, Task_No, Chain_No, Store_No, Str_txt_EmailAdd, Str_txt_Mobile_Email, RBSTORE, Type_Browser;
    

    #region SPARUTILS
    //code block for masterpage app, dont remove
    SPARValues WebAppClass;
    PromptTranslation ptAppTranslation;
   
    protected void Page_PreInit()
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

    #region methods

    static bool IsNumber(string value)
    {
        // Return true if this is a number.
        int number1;
        return int.TryParse(value, out number1);
    }
    
    private bool CheckBrowser()
    {
        bool rValue;
        Type_Browser = Request.Browser.Browser;
        Version_Browser = Request.Browser.MajorVersion;

        if (Type_Browser != "IE")
        {
            pnl_Browser.Visible = true;
            pnl_Version.Visible = false;
            pnl_InputArea.Visible = false;
            rValue = false;
        }
        else
        {
            if (Version_Browser < 4)
            {
                pnl_Version.Visible = true;
                pnl_Browser.Visible = false;
                pnl_InputArea.Visible = false;
                rValue = false;
            }
            else
            {
                pnl_InputArea.Visible = true;
                pnl_Version.Visible = false;
                pnl_Browser.Visible = false;
               rValue = true;
            }
        }

        return rValue;
    }

    #endregion

    #region events
    protected void Page_Load(object sender, EventArgs e)
            {
                        WebAppClass.Set_MerchforForm(this.Merch_no, Convert.ToString(WebAppClass.MerchNo));
                        Str_Merch_no = Convert.ToString(WebAppClass.MerchNo);

                        ShowButton = "NO";
                        Email_Act_Flag = "Y";
                        //******* Checking for browser type
                        CheckBrowser();

                       
                         Response.Write("Merch_noBefore=" + Str_Merch_no + "<BR>");
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
                         //Response.Write("Merch_no=" + Merch_no + "<BR>");
                        Job_No = Request.Form["Job_No"];
                        if (Job_No!="")
                        {
                            txt_jobno.Text=Job_No;
                        }
                         //Response.Write("Job_No=" + Job_No);
                         Wave_No = Request.Form["Wave_No"];
                         //Response.Write("Wave_No=" + Wave_No);
                         if (Wave_No != "")
                         {
                             txt_waveno.Text = Wave_No;
                         }
                        Task_No = Request.Form["Task_No"];
                         //Response.Write("Task_No=" + Task_No);
                         if (Task_No != "")
                         {
                             txt_taskno.Text = Task_No;
                         }
                        Chain_No = Request.Form["Chain_No"];
                         //Response.Write("txt_chainno=" + Chain_No);
                         if (Chain_No != "")
                         {
                             txt_chainno.Text = Chain_No;
                         }
                        Store_No = Request.Form["Store_No"];
                       // Response.Write("txt_storeno=" + Store_No);
                        if (Store_No != "")
                        {
                            txt_storeno.Text = Store_No;
                        }
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


                        Str_txt_EmailAdd = Request.Form["txt_EmailAdd"];
                        //Response.Write("Str_txt_EmailAdd=" + Str_txt_EmailAdd);
                        Str_txt_Mobile_Email = Request.Form["txt_Mobile_Email"];
                       // Response.Write("Str_txt_Mobile_Email=" + Str_txt_Mobile_Email);

                        
                        
                //****** System Rules
                        Collect_Mobile_Email = "NO";
                        DataTable RuleTab = new DataTable();
                        RuleTab = GetSystemRules();
                        if (RuleTab.Rows.Count > 0)
                        {
                            Collect_Mobile_Email = RuleTab.Rows[2][2].ToString();
                        }
                        //Response.Write("VRuleghfhfgh=" + Collect_Mobile_Email + "<BR>");
                        
                //****** Prompts
                        GetPromptTranslation();
                        //strTest=WebAppClass.LoggedUserName;
                       // Response.Write("strTest=" + strTest + "<BR>");
                        Str_User_id = WebAppClass.LoggedUserId;
                        Response.Write("Str_User_id=" + Str_User_id);

                        Lang_id = WebAppClass.LanguageId;
                        //Response.Write(Lang_id);

                //********* Get the Merch mail   
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
                        if (IsNumber(Str_User_id)==true) 
                            {
                                Merch_User="Y";
                                Txt_merch_no.ReadOnly = true;
                                ShowButton = "NO";
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
                            //Response.Write("Merch_User=" + Merch_User);
                       if (Lang_id==6 || Lang_id==7) 
                            {
	                            ShowButton="YES";          
                            }
                            //ShowButton = "YES";                    
                           
                         txt_EmailAdd.Text = EmailAddress;
                        if (Lang_id == 1)
                        {
                                txt_Phone1.Text = AreaCode;
                                txt_Phone2.Text = ThreeCode;
                                txt_Phone3.Text = FourCode;
                                if (AreaCode != "")
                                {
                                    txt_Phone1.ReadOnly=true;
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
                                if (Str_carrier_id =="0")
                                {
                                    DDCellProvider.Items.Insert(0, new ListItem("Select A Provider", "0"));
                                }
                                else
                                {
                                    DDCellProvider.Items.Insert(00, new ListItem("Remove me", "00"));
                                    DDCellProvider.Items.FindByValue("" + Str_carrier_id + "").Selected = true;
                                }
                               if (Cellphone_No=="")
                               {
                                   DDCellProvider.Enabled = false;
                                   DDCellProvider.Items.FindByValue("0").Selected=true;
		                       }
                               
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
        #endregion

        #region SystemPromptandRule

                private void GetPromptTranslation()
                {
                    vPrompts = new string[29];
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

                    ptAppTranslation.DoArrayPromptTranslation(vPrompts);

                    //PromptTranslation GetPromptTranslation = new PromptTranslation("CFJWTInputs.asp", WebAppClass.PromptsLanguageId.ToString(), WebAppClass.LanguageId, WebAppClass.CurrentSQLDBConnection, WebAppClass.MultiLanguageCount);
                    //GetPromptTranslation.DoArrayPromptTranslation(vPrompts);

                }
                private DataTable GetSystemRules()
                {
                            DataTable appDT = new DataTable();
                            string[] VRule;
                            VRule = new string[5];
                            VRule[0] = "Name Format";
                            VRule[1] = "New Date Format";
                            VRule[2] = "Collect Mobile Email";
                            VRule[3] = "SPAR Logo";
                            VRule[4] = "SPAR Copyright";
                            appDT = AppSysRules.Get_RuleValue_ByDescAsDataTable(VRule, WebAppClass.LanguageId, WebAppClass.CurrentSQLDBConnection);
                            return appDT;
                }


        #endregion

       
      
}
