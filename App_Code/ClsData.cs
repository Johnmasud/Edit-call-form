using System;
using System.Collections.Generic;
using System.Web;
using System.Web.SessionState;

/// <summary>
/// Summary description for ClsData
/// </summary>
public class ClsData
{
	public ClsData()
	{

	}
}
 
public class ClsCFJWTSData
{
    string PhotoPath, App_flag, Photo_id;
   
    public string photo_file_path{
        get
        {
            return PhotoPath;
        }
        set
        {
            PhotoPath = value;
        }

    }
    public string approval_flag
    {
        get
        {
            return App_flag;
        }
        set
        {
            App_flag = value;
        }
    }
    public string p_id
    {
        get
        {
            return Photo_id;
        }
        set
        {
            Photo_id = value;
        }
    }
    
}

public class ClsCFJWTSData2
{
    string StrMessage;

    public string ErrorMessage
    {
        get
        {
            return StrMessage;
        }
        set
        {
            StrMessage = value;
        }

    }
}