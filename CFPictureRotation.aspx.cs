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


public partial class CFPictureRotation : System.Web.UI.Page
{

    protected string FileCheck, Rotate, Path,StrFileSave;
    protected int PicLen,IntWidth,IntHeight,PicWidth,PicHeight;
   

    protected void Page_Load(object sender, EventArgs e)
    {
        FileCheck = Request["FileCheck"];
        Rotate = Request["Rotate"];
        Path = Request["Path"];
        StrFileSave = Request["StrFileSave"];
        PicLen=0;
        PicWidth=0;
        PicHeight = 0;
        decimal Div_Width, Div_Height;
        decimal Cal_Height, Cal_width;
        Cal_width = 0;
        Cal_Height = 0;
       //FileCheck ="C:\\Apps\\5002412009251999996333902009828139633390.jpg";
        System.IO.FileInfo pFileinfo = new System.IO.FileInfo(Path);

       ASPJPEGLib.IASPJpeg objJpeg;
      
       objJpeg = new ASPJPEGLib.ASPJpeg();
       objJpeg.RegKey = "lptnxHm3zT+7bcIaXF822jnwwIATHXI9mnWBGn+U8Xo1TW9pjBuLWRkISf3STsTNPTfc/RGwbGAE";
      
     //objJpeg.Open("C:\\Apps\\johnTest.jpg");
       if (pFileinfo.Exists)
       {
           if (pFileinfo.Length > 0)
           {
               objJpeg.Open(@Path);

               IntWidth = objJpeg.Width;
               IntHeight = objJpeg.Height;

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

               


               if (Rotate == "1")
               {
                   objJpeg.FlipH();
               }
               if (Rotate == "2")
               {
                   objJpeg.FlipV();
               }

               if (Rotate == "3")
               {
                   objJpeg.RotateR();
               }
               if (Rotate == "4")
               {
                   objJpeg.RotateL();
               }
               //PicLen = Convert.(objJpeg.Binary);
               //;
               long filelength;
               
               filelength = 0;
               filelength = pFileinfo.Length;

               if ( filelength > 0 && filelength <= 307200 )
               {
                   objJpeg.Quality = 90;
               }

               if ( filelength > 307200 && filelength <= 409600 )
               {
                   objJpeg.Quality = 80;
               }
               
               if ( filelength > 409600 && filelength <= 512000 )
               {
                   objJpeg.Quality = 70;
               }
               
               if ( filelength > 512000 && filelength <= 614400 )
               {
                   objJpeg.Quality = 60;
               }
               
               if ( filelength > 614400 && filelength <= 1024000 )
               {
                   objJpeg.Quality = 50;
               }

               if ( filelength > 1024000  )
               {
                   objJpeg.Quality = 40;
               }
               
             
               objJpeg.Save(StrFileSave);

               objJpeg.Resize(IntWidth, IntHeight, 0);
               //Rotated file to display to the page
              // objJpeg.Quality = 4;

               objJpeg.Save(FileCheck);
               objJpeg.SendBinary(Missing.Value);
                
           }
       }
       objJpeg.Close();
       objJpeg = null;
      System.GC.Collect(); 
         
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
