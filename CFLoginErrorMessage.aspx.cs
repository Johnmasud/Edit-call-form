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

public partial class CFLoginErrorMessage : System.Web.UI.Page
{
    protected string today,Today_Date;

    protected void Page_Load(object sender, EventArgs e)
    {
        DateTime today = DateTime.Now;
        Today_Date = today.ToString();
       // Response.Write("Today_Date=" + Today_Date + "<BR>");
        Showdate.Text = Today_Date;
    }
}
