using System;
using System.Collections.Generic;
using System.Web;
using System.Web.Configuration;
using SPAR.Tools.Security;

/// <summary>
/// Summary description for ErrHandler
/// </summary>
public class ErrHandler
{
    public ErrHandler()
    {
        //
        // TODO: Add constructor logic here
        //
    }
    public static void WriteError(Exception ex)
    {
        try
        {
            //ErrorLog.RecordError(true, ex, WebConfigurationManager.AppSettings["AppId"].ToString(), "Unhandled Error");
            AppErrorLog UnHError = new AppErrorLog();
            UnHError.RecordUnHandleError(ex, "Unhandled Error");
        }
        catch (Exception ex1)
        {
            throw ex1;
        }

    }    
}
