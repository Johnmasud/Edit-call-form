using System;
using System.Collections.Generic;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class SPARSupport : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        GetGeneralMessage();
    }
    private void GetGeneralMessage()
    {
        string sAppId = "-";
        string sAppPage = "-";
        string sMessage = "-";

        if (Request.QueryString["appid"] != "" && Request.QueryString["appid"] != null)
        {
            sAppId = Request.QueryString["appid"];
        }
        if (Request.QueryString["apppage"] != "" && Request.QueryString["apppage"] != null)
        {
            sAppPage = Request.QueryString["apppage"];
        }
        if (Request.QueryString["cm"] != "" && Request.QueryString["cm"] != null)
        {
            sMessage = Request.QueryString["cm"];
        }
        this.LabelApplicationId.Text = sAppId;
        this.Labelpage.Text = sAppPage;
        this.LabelMessage.Text = sMessage;

    }  
}
