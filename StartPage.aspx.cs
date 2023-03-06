using System;
using System.Collections;
using System.Configuration;
using System.Data;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using SPARTools;
using System.Collections.Specialized;

public partial class StartPage : System.Web.UI.Page
{
    SPARValues WebAppClass;
    protected void Page_Load(object sender, EventArgs e)
    {
        
       
    }
    protected void Page_PreInit()
    {
        try
        {
            WebAppClass = new SPARValues(this.Page);
        }
        catch (Exception ex)
        {
            ErrorLog.RecordError(false, ex, ConfigurationManager.AppSettings["AppId"].ToString(), "Error In Start Page");
        }
        
    }
   
    
   
}
