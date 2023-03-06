using System;
using System.Data;
using System.Configuration;
using System.Collections;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Web.UI.HtmlControls;
using System.IO;

public partial class UploadFile : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        string StrNewFileSave, StrFileApproved;
        StrNewFileSave = "\\\\mi10\\\\EWeb Applications\\\\CallFormInput\\\\sparEyesPic\\\\sparEyesPic1\\\\working\\\\10164820122414341422122295_20126132059451810.jpg";
        StrFileApproved = "\\\\mi10\\\\EWeb Applications\\\\CallFormInput\\\\sparEyesPic\\\\sparEyesPic1\\\\approved\\\\10164820122414341422122295_20126132059451810.jpg";


        File.Copy(StrNewFileSave, StrFileApproved);
    }
}
