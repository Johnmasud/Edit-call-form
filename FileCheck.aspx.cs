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
using System.Reflection;
using System.IO;
using System.Drawing;
using System.Drawing.Imaging;
using System.Drawing.Drawing2D;




public partial class FileCheck : System.Web.UI.Page
{
    protected string FileChecknew, Rotate, Path, StrFileSave;
    protected int PicLen, IntWidth, IntHeight, PicWidth, PicHeight;
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

        ptAppTranslation = new PromptTranslation("CFPictureFileDisplay.aspx", WebAppClass.PromptsLanguageId.ToString(), WebAppClass.LanguageId, WebAppClass.CurrentSQLDBConnection, WebAppClass.MultiLanguageCount);
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
                  
                Rotate ="3";
               
                 
                PicLen = 0;
                PicWidth = 0;
                PicHeight = 0;
                decimal Div_Width, Div_Height;
                decimal Cal_Height, Cal_width;
                Cal_width = 0;
                Cal_Height = 0;
                FileChecknew = "C:\\Copy\\File_upload\\SaveFileCheck.jpg";
                Path = "C:\\Copy\\File_upload\\photo116.jpg";
                StrFileSave = "C:\\Copy\\File_upload\\SaveStrFileSave.jpg";
                System.IO.FileInfo pFileinfo = new System.IO.FileInfo(Path);
         

                //objJpeg.Open("C:\\Apps\\johnTest.jpg");
                Response.Write("before1=" + DateTime.Now + "<BR>");
                if (pFileinfo.Exists)
                {
                    if (pFileinfo.Length > 0)
                    {
                        Bitmap image = new Bitmap(@"" + Path + "");
                        image.Save(FileChecknew);


                        IntWidth = image.Width;
                        Response.Write("IntWidth=" + IntWidth + "<BR>");
                        IntHeight = image.Height;
                        Response.Write("IntHeight=" + IntHeight + "<BR>");

                        if ((IntWidth > 340) && (IntHeight > 200))
                        {
                            Div_Width = (340 / Convert.ToDecimal(IntWidth));


                            Div_Height = (200 / Convert.ToDecimal(IntHeight));

                            if (Div_Width > Div_Height)
                            {
                                Cal_Height = 200;
                                Cal_width = (IntWidth * Div_Height);
                            }
                            if (Div_Height > Div_Width)
                            {
                                Cal_Height = (IntHeight * Div_Width);
                                Cal_width = 340;
                            }
                            Cal_width = Math.Round(Cal_width, 0);
                            Cal_Height = Math.Round(Cal_Height, 0);

                            IntWidth = Convert.ToInt32(Cal_width);
                            IntHeight = Convert.ToInt32(Cal_Height);
                        }



                    

                        
                        Response.Write("Resize=" + DateTime.Now + "<BR>");

                     
                        image = new Bitmap(image, IntWidth, IntHeight); 
                        Graphics oGraphics = Graphics.FromImage(image);

                        oGraphics.SmoothingMode =  SmoothingMode.AntiAlias; oGraphics.InterpolationMode = InterpolationMode.HighQualityBicubic;

                        oGraphics.DrawImage(image, 0, 0, IntWidth, IntHeight);
                        image.RotateFlip(RotateFlipType.Rotate180FlipX);
                        image.Save(StrFileSave);

                        //newBMP.Save(this.GetPhysicalPath + Gen_Copy);



                        image.Dispose();

                        oGraphics.Dispose();

                       
                        Response.Write("done=" + DateTime.Now + "<BR>");
                     
                        //objJpeg.Save(StrFileSave);

                        //objJpeg.Resize(IntWidth, IntHeight, 0);
                        //Rotated file to display to the page
                        // objJpeg.Quality = 4;
                        Response.Write("savefile=" + DateTime.Now + "<BR>");
                        // objJpeg.Save(FileChecknew);
                        //objJpeg.SendBinary(Missing.Value);
                        Response.Write("Done=" + DateTime.Now + "<BR>");
                    }
                }
                //objJpeg.Close();
            }
            static bool IsJpegHeader(string filename)
            {
                using (BinaryReader br = new BinaryReader(File.Open(filename, FileMode.Open)))
                {
                    UInt16 soi = br.ReadUInt16();  // Start of Image (SOI) marker (FFD8)     
                    UInt16 jfif = br.ReadUInt16(); // JFIF marker (FFE0)       
                    return soi == 0xd8ff && jfif == 0xe0ff;
                }
            }

    }
   
 
