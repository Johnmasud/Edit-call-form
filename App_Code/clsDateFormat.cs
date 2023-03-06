using System;
using System.Data;
using System.Configuration;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Web.UI.HtmlControls;

/// <summary>
/// Summary description for clsDateFormat
/// </summary>
public class clsDateFormat
{
    public static string Date_Format(DateTime StrDate, int ShowType, string DateRule, string Date_input)
    {
          string StrTodayDate, StrTodayDate2, StrYear1;
          try
          {
                    string[] ArrayDateRuleF;
                    int f, StrMonth, StrDay, StrYear;
                   
                    StrTodayDate = "";
                    StrTodayDate2 = "";
                    ArrayDateRuleF = new string[3];
                    ArrayDateRuleF = DateRule.Split(Date_input.ToCharArray());
                    StrYear = 0;

                    for (f = 0; f < ArrayDateRuleF.Length; f++)
                    {

                        if (ArrayDateRuleF[f].ToUpper() == ("mm").ToUpper())
                        {
                            StrMonth = StrDate.Month;
                            StrTodayDate = StrTodayDate + "" + StrMonth;
                        }
                        if (ArrayDateRuleF[f].ToUpper() == ("dd").ToUpper())
                        {
                            StrDay = StrDate.Day;
                            StrTodayDate = StrTodayDate + "" + StrDay;
                        }
                        if (ArrayDateRuleF[f].ToUpper() == ("yyyy").ToUpper())
                        {
                            StrYear = Convert.ToInt32(StrDate.Year.ToString());

                            StrTodayDate = StrTodayDate + "" + StrYear;
                        }
                        if (ArrayDateRuleF[f].ToUpper() == ("yy").ToUpper())
                        {
                            StrYear1 = StrDate.Year.ToString();
                            StrYear = Convert.ToInt32(StrYear1.Substring(2, 2));
                            StrTodayDate = StrTodayDate + "" + StrYear;
                        }

                        if (f != 2)
                        {
                            StrTodayDate = StrTodayDate + "" + "" + Date_input + "";
                        }
                    }

                    if (ShowType == 0)
                    {
                        StrTodayDate2 = Convert.ToString(StrYear);
                    }

                    if (ShowType == 2)
                    {
                        StrTodayDate2 = StrTodayDate;
                    }
                }
                catch (Exception ex)
                {
                    throw ex;
                }
               return StrTodayDate2;
    }

    public static string FunDate_Format(int EnterMonth, int EnterDay, string EnterYear, int ShowType, string DateRule, string Date_input)
    {

         string StrTodayDate, StrYear;
         try
         {
             string[] ArrayDateRuleF;
             int f, StrMonth, StrDay;

             StrTodayDate = "";

             ArrayDateRuleF = new string[3];
             ArrayDateRuleF = DateRule.Split(Date_input.ToCharArray());

             for (f = 0; f < ArrayDateRuleF.Length; f++)
             {

                 if (ArrayDateRuleF[f].ToUpper() == ("mm").ToUpper())
                 {
                     StrMonth = EnterMonth;
                     StrTodayDate = StrTodayDate + "" + StrMonth;
                 }
                 if (ArrayDateRuleF[f].ToUpper() == ("dd").ToUpper())
                 {
                     StrDay = EnterDay;
                     StrTodayDate = StrTodayDate + "" + StrDay;
                 }
                 if (ArrayDateRuleF[f].ToUpper() == ("yyyy").ToUpper())
                 {
                     StrYear = EnterYear;

                     StrTodayDate = StrTodayDate + "" + StrYear;
                 }
                 if (ArrayDateRuleF[f].ToUpper() == ("yy").ToUpper())
                 {
                     StrYear = EnterYear;
                     if (string.IsNullOrEmpty(StrYear) == false)
                     {

                         if (StrYear.Length > 3)
                         {
                             StrYear = StrYear.Substring(2, 2);
                         }
                     }
                     StrTodayDate = StrTodayDate + "" + StrYear;
                 }

                 if (f != 2)
                 {
                     StrTodayDate = StrTodayDate + "" + "" + Date_input + "";
                 }
             }
         }
         catch (Exception ex)
         {
             throw ex;
         }
        return StrTodayDate;
    }

    public static string CalVisit_Time(int EnterMonth, int EnterDay, int EnterYear, string TimeIn, string TimeOut, string Str_rad_q_Past_Midnight)
    {
        string EnterDate, StrTimeInVisit, StrTimeIOutVisit, StrVisit_time;

        try
        {

            DateTime Visit_Date_TimeIn, Visit_Date_TimeOut;

            EnterDate = Convert.ToString(EnterMonth) + "/" + Convert.ToString(EnterDay) + "/" + Convert.ToString(EnterYear) + "";

            StrTimeInVisit = EnterDate + " " + TimeIn + "";
            StrTimeIOutVisit = EnterDate + " " + TimeOut + "";

            Visit_Date_TimeIn = Convert.ToDateTime(StrTimeInVisit);
            Visit_Date_TimeOut = Convert.ToDateTime(StrTimeIOutVisit);

            //Job passed midnight meaning after 12 AM
            if (Str_rad_q_Past_Midnight == "0")
            {
                Visit_Date_TimeOut = Visit_Date_TimeOut.AddDays(1);
            }

            TimeSpan DifferntDate = Visit_Date_TimeOut.Subtract(Visit_Date_TimeIn);
            StrVisit_time = DifferntDate.TotalMinutes.ToString();
        }
        catch (Exception ex)
        {
            throw ex;
        }
        return StrVisit_time;
    }


}
