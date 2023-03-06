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

public partial class CFPictureGetMultiUpload : System.Web.UI.Page
{
    protected string StrUploadFile;
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
        //BiLingualBar = (SPARBiLingualBar)this.Master.FindControl("SPARBiLingualBar1");
        //WebAppClass = new SPARValues();
        

        //ptAppTranslation = new PromptTranslation("CFJWTInputs.aspx", WebAppClass.PromptsLanguageId.ToString(), WebAppClass.LanguageId, WebAppClass.CurrentSQLDBConnection, WebAppClass.MultiLanguageCount);
        //AppMasterControls ap1 = new AppMasterControls(PageHeader, PageFooter, BiLingualBar, WebAppClass.LoggedUserName, WebAppClass.CurrentDBDateTime, WebAppClass.LanguageId, WebAppClass.PromptsLanguageId, WebAppClass.MultiLanguageCount, WebAppClass.PageTitle, WebAppClass.CurrentSQLDBConnection, this.Page, WebAppClass.SPARLogoFileURL);
        
        //if (WebAppClass.MerchNo > 0)
        //{
        //    PageFooter.ShowSPARToolsURL = false;
        //    PageFooter.ShowMainPageUrl = false;
        //}
    }
    //protected void Page_PreRender(object sender, EventArgs e)
    //{
    //    ptAppTranslation.DoPagePromptTranslation(this.Page);
    //}

    #endregion
    protected void Page_Load(object sender, EventArgs e)
    {
        int StrFileYear, StrFileMonth, StrFileDay, StrFileHour, StrFileMinute, StrFileSecond;
        string Picture_Name, StrSec, StrMin, StrHou;
        string strPath, StrFileNames, StrNewPhotoName, Lang_id;

        Lang_id = Request.QueryString["Lang_id"];
        // Response.Write("Str_VisitMonth=" + Str_VisitMonth + "<BR>")
        //Response.Write(Lang_id);
        string StrFileUpdatePath = ConfigurationManager.AppSettings["FileUpdatePath"];
        StrFileUpdatePath = StrFileUpdatePath + "sparEyesPic" + Convert.ToString(Lang_id) + "\\\\update\\\\";
        //Response.Write("StrFileUpdatePath=" + StrFileUpdatePath);

        strPath = "";
        StrFileNames = "";
        StrNewPhotoName = "";
         
        for (int i = 0; i < Request.Files.Count; i++)
        {
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

            Picture_Name = "" + StrFileYear + "" + StrFileMonth + "" + StrFileDay + "" + StrHou + "" + StrMin + "" + StrSec + "" + i + "";
           // Response.Write("Picture_Name=" + Picture_Name + "<BR>");
            //strPath = "C:\\Photo\\Update\\" + Picture_Name + ".jpg";
            strPath = "" + StrFileUpdatePath + "" + Picture_Name + ".jpg";
             if (StrNewPhotoName=="") 
					{
                        StrNewPhotoName = strPath; 
					}
					else
					{
                        StrNewPhotoName = StrNewPhotoName + "|" + strPath;
					} 
         
            
            HttpPostedFile objFile = Request.Files[i];
            objFile.SaveAs(strPath);

        }
         Response.Write("StrFileNames=" + StrNewPhotoName + "Done");
    }
}
