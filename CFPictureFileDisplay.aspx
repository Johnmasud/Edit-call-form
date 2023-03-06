<%@ Page Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" EnableViewStateMac="false" CodeFile="CFPictureFileDisplay.aspx.cs" Inherits="CFPictureFileDisplay" Title="Internet Call Form Input" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
<cc1:ScriptManager ID="ScriptManager1" runat="server" AsyncPostBackTimeout="600">
 </cc1:ScriptManager>
 
<hr color="dodgerblue" />


<script type="text/javascript"  language="javascript">
 Sys.Application.add_load(page_load);
//Sys.WebForms.PageRequestManager.getInstance().add_endRequest(page_load); 
//document.oncontextmenu=new Function("return false")

 
function clickIE() 
{
           // alert("1=")
        if (document.all) 
          {
             return false;
          }
}
function clickNS(e) 
{
          noLeftClick()
          
         if (document.layers||(document.getElementById&&!document.all)) 
          {
                if (e.which==2||e.which==3)
                     {
                        return false;
                     }
           }
}
if (document.layers) 
{
    document.captureEvents(Event.MOUSEDOWN);
    document.onmousedown=clickNS;
   	
}
else
{
    document.onmouseup=clickNS;
    document.oncontextmenu=clickIE;
}
 
document.oncontextmenu=new Function("return false")

// function right(e) {

//            //alert("StartArray1=" +  navigator.appName)		
//            if (navigator.appName == 'Netscape' && (e.which == 3 || e.which == 2))
//            {
//                    alert("Sorry, you do not have permission to right click.");
//                    return false;
//            }
//            else if (navigator.appName == 'Microsoft Internet Explorer' && (event.button == 2 || event.button == 3)) 
//            {
//                    alert("Sorry, you do not have permission to right click.");
//                    return false;
//            }
//            
 //       noLeftClick()
//        
// return true;
// }
//document.onmousedown=right;
//document.onmouseup=right;

//if (document.layers) window.captureEvents(Event.MOUSEDOWN);
//if (document.layers) window.captureEvents(Event.MOUSEUP);
// window.onmousedown=right;
// window.onmouseup=right;
function noLeftClick()
{
        //alert("noLeftClick=" + event.button); 
         strtest=event.button;
        // alert(strtest);
         var  PageLoadCheck = document.getElementById("CallFormEnd");
          // alert("PageLoadCheck=" + PageLoadCheck);
            if (PageLoadCheck != null)
            {
                 
            }
            else
            {
               
                 
                 if (event.button == 1 || event.button == 0)
                    {
                        //alert("Please wait ...")
                       // alert('<%=vPrompts[5]%>'); 
                         return false;
                    }
            }  
}
  

function CheckGoBack(e) 
 {
        var evt = e || window.event; 
        var node = (evt.target) ? evt.target : ((evt.srcElement) ? evt.srcElement : null); 
         //alert("evt=" + node.type); 
        //116
        var keyCode = evt.charCode || evt.keyCode; 
         
           if ((keyCode==116))  
             {
                 //alert("keyCode=" + keyCode);
                  evt.keyCode =0; 
                  //window.status="You cannot refresh the page";  

                return false;
             }
         if ((keyCode==8))  
             {
               if (node.type=="text")
                 {
                        // alert("what2");
                          return true;
                 }
                if (node.type=="textarea")
                 {
                         //alert("what2");
                          return true;
                 }  
                return false;
            }
          
     
 }

 document.onkeydown = CheckGoBack;

function page_load(sender, e)
{
       sleep(3000)
       //alert("load");
	    $find("modalProgress").hide();
	     return false;
}

//function page_unload(sender, e)
//{
//        //sleep(3000)
//       //alert("unload");
//	    //$find("modalProgress").hide();
//	     return false;
//}
function Disableddblclick()
{
   //alert("Please no double Click!");
    return false;
}
function Load()
	{
//	    alert("hhjjhgjgjhg");
//	    $find("ModalProgress").hide();
	}
function sleep(milliSeconds)
	{ 
        var startTime = new Date().getTime(); // get the current time 
        while (new Date().getTime() < startTime + milliSeconds); // hog cpu 
    } 

function DisableButtons()
	{
	     //******* Disabled the buttons
		document.aspnetForm.ctl00$ContentPlaceHolder1$Button2.disabled=true;
	}
function AbleButtons()
	{
	     //******* abled the buttons
         document.aspnetForm.ctl00$ContentPlaceHolder1$Button2.disabled=false;
	}
function DisabledOption(CheckedVal,RepeatVal)
{
      // alert("CheckedVal=" + CheckedVal);
     // alert("RepeatVal=" + RepeatVal);
      EleNum="0" + Trim(RepeatVal) + "";
      CheckedBoxName="ctl00$ContentPlaceHolder1$Repeater1$ctl" + EleNum + "$PhotoOption";
	 // alert("CheckedBoxName=" + CheckedBoxName);
	   CheckedBoxChecked=eval("document.aspnetForm." + CheckedBoxName + "[CheckedVal].checked")
      //alert("CheckedBoxChecked=" + CheckedBoxChecked);" + Trim(CheckedVal) + "
     //FileCount=document.aspnetForm.FileCount.value
	    //alert("FileCount=" + FileCount);
	   if (CheckedBoxChecked==false)
	   { 
            $find("modalProgress").show();
       }
    return false;
}	
function DoSubmit()
	{
	    DisableButtons()
        var StrVisitDate=""
        var PCounter=""
        var SelectFiles=""
        var StrDateCheck=""
		FileCount=document.aspnetForm.FileCount.value
	    //alert("FileCount=" + FileCount);
	    
	    DateRule=document.aspnetForm.DateFormat.value
	    
	    UploadOriginalFile=document.aspnetForm.StrOriginalFile.value
		//alert("Numb_Photo=" + Numb_Photo);
		
		UploadRotateFileSave=document.aspnetForm.StrRotateFileSave.value
		RotateFileSaveArray = UploadRotateFileSave.split("|");
		
		UploadFilesArray = UploadOriginalFile.split("|");
		for(q = 0; q <FileCount; q++ )
			{
			        J=0
					J= q+1
			            //Check the checkbox 
			            if (q<10)
			            {
			                  Num="0" + q
			            }
			            else
			            {
			                Num=q
			            }
			         //alert("Num=" + Num);
//			            R=eval("document.aspnetForm.ctl00$ContentPlaceHolder1$Repeater1$ctl01$PhotoOption.length")
//			            eval("document.aspnetForm.ctl00$ContentPlaceHolder1$Repeater1$ctl01$PhotoOption
//						//alert("R=" + R)	
//						LenRotate=String(R)
//						alert("LenRotate=" + LenRotate)	
			            //radioCheck=document.aspnetForm.ctl00$ContentPlaceHolder1$Repeater1$ctl01$PhotoOption[1].checked;
			          //  alert("radioCheck=" + radioCheck);
			            CheckedBoxName="ctl00$ContentPlaceHolder1$Repeater1$ctl" + Num + "$CBSavePic";
			            //alert("CheckedBoxName=" + CheckedBoxName);
						CheckedBoxChecked=eval("document.aspnetForm." + CheckedBoxName + ".checked")
			        //alert("CheckedBoxChecked=" + CheckedBoxChecked);
			        if (CheckedBoxChecked==true)
						{
						      //Files that user selected from checkbox
						            FilePath = RotateFileSaveArray[q].valueOf()
									//alert("FilePath=" + FilePath);
									if (SelectFiles=="") 
									{
										   SelectFiles=FilePath 
									}
									else
									{
										   SelectFiles=SelectFiles + "|"  + FilePath
									} 	
									
						       //Check the Comment box 
						        CommentsName="ctl00$ContentPlaceHolder1$Repeater1$ctl" + Num + "$Comments"
								CommentsText=eval("document.aspnetForm." + CommentsName + ".value")
							   // alert("CommentsText=" + CommentsText);
							    
							    Comments_Len=CommentsText.length	
								//alert("Comments_Len=" + Comments_Len);
								
								if (Comments_Len> 253)
								{
									 alert('<%=vPrompts[3]%>'); 
									 AbleButtons()
									return false;	
								}
							    
							    //ctl00$ContentPlaceHolder1$Repeater1$ctl00$txt_visitmonth
                                //ctl00$ContentPlaceHolder1$Repeater1$ctl00$txt_visitday
                                //ctl00$ContentPlaceHolder1$Repeater1$ctl00$txt_visityear
							     //******Date Validation	
											//** Month	
											visitmonthName="ctl00$ContentPlaceHolder1$Repeater1$ctl" + Num + "$txt_visitmonth";
											VisitMonthVal=eval("document.aspnetForm." + visitmonthName + ".value")
											VisitMonthVal=Trim(VisitMonthVal);
											//alert("VisitMonthVal=" + VisitMonthVal);
											//** day
											visitdayName="ctl00$ContentPlaceHolder1$Repeater1$ctl" + Num + "$txt_visitday";
											VisitDayVal=eval("document.aspnetForm." + visitdayName + ".value")
											VisitDayVal=Trim(VisitDayVal);
											//alert("VisitDayVal=" + VisitDayVal);
											//** Year	
											visityearName="ctl00$ContentPlaceHolder1$Repeater1$ctl" + Num + "$txt_visityear";
											VisitYearVal=eval("document.aspnetForm." + visityearName + ".value")
											VisitYearVal=Trim(VisitYearVal);
											//alert("VisitYearVal=" + VisitYearVal);
									        
										if ((VisitMonthVal=="") || (VisitDayVal=="") || (VisitYearVal==""))
											{
												alert("Photo " + J + ":<%=vPrompts[0]%>"); 
												AbleButtons()
												return false;
											}
											else
											{
													        var	delimiter,date_format,JEdate,i, CorrectDate
		
						                                    var result=true;
                                    		
						                                    CorrectDate="";
						                                    delimiter="";
						                                    date_format = DateRule;
						                                    POS_Dot=date_format.indexOf(".")	
						                                    if (POS_Dot>0)
						                                    {
							                                    delimiter="."
						                                    }
						                                    POS_Back_slash=date_format.indexOf("/")	
						                                    if (POS_Back_slash>0)
						                                    {
							                                    delimiter="/"
						                                    }
						                                    POS_Dash=date_format.indexOf("-")	
						                                    if (POS_Dash>0)
						                                    {
							                                    delimiter="-"
						                                    }
						                                    JEdate = date_format.split(delimiter);

						                                    for(i=0; i<JEdate.length; i++)
							                                    {
										                                    if (JEdate[i] == "mm")
										                                    {
											                                    CorrectDate=CorrectDate + VisitMonthVal;
										                                    }
										                                    if (JEdate[i] == "dd")
										                                    {
											                                    CorrectDate=CorrectDate + VisitDayVal;
										                                    }
										                                    if (JEdate[i] == "yyyy" || JEdate[i] == "yy" )
										                                    {
											                                    CorrectDate=CorrectDate + VisitYearVal;
										                                    }
									                                    if (i<2) 
										                                    {
											                                    CorrectDate=CorrectDate + "" + delimiter + "";
										                                    }
							                                    }                // end of for 
											
											        //alert("CorrectDate=" + CorrectDate);
        											
        											StrDateCheck=VisitMonthVal + "" + VisitDayVal + "" + VisitYearVal;  
									        //Visit_date
												        if (StrVisitDate=="") 
												        {
													        StrVisitDate=CorrectDate 
													        PCounter=q 
												        }
												        else
												        {
													        StrVisitDate=StrVisitDate + "|"  + CorrectDate
													        PCounter=PCounter + "|" + q  
												        } 
												       // alert("Counterout=" + PCounter);	 
        											
									            sys_rule=DateRule
							                    //alert("year=" +document.TimeValidation.txt_visityear.value);
							                    //alert("sys_rule=" + sys_rule);
                    			               if (DatecheckNumber(StrDateCheck)==false)
						                            {
						                               // alert("check");
						                                alert('Photo ' + J + ':<%=vPrompts[0]%>');
						                                AbleButtons()
                                                        return false;
						                            }     
						            
							                    if (DateValidation(CorrectDate,sys_rule,"Photo " + J + ":<%=vPrompts[0]%>")==false)
							                     {
							                        AbleButtons()
								                    return false;
							                     }   
							    }//if ((VisitMonthVal=="") || (VisitDayVal=="") || (VisitYearVal==""))
						}//if (CheckedBoxChecked==true)
			        
			}//for loop
 
	    
	     document.aspnetForm.PhotoCounter.value=PCounter
		 document.aspnetForm.Visit_Dates.value=StrVisitDate
		
		 //alert("SelectFiles=" + SelectFiles);
		
		 //alert("PCounter=" + PCounter);
		//alert("PCounter=" + document.CFPhotoDisplay.PhotoCounter.value);
		//return false;
		document.aspnetForm.SelectCheckboxFiles.value=SelectFiles;
		//ApplicationType=document.aspnetForm.ApplicationType.value
		 
		if (Photo_BYQCheckBoxList()==false)
			{
				 alert('<%=vPrompts[10]%>')
				AbleButtons()
				return false;
			}
				  
				 //document.aspnetForm.RotateFileSave.value=Picture_Name	
       // return false;
        $find("modalProgress").show();
		document.aspnetForm.action = "CFPictureFileConfirmation.aspx";
	   document.aspnetForm.submit();
		return false;	
	}
	
	function  Photo_BYQCheckBoxList()
	{
	   
           //alert("Photo_BYQCheckBoxList");
            Photo_Q_No=document.aspnetForm.Photo_Q_No.value
        
            Photo_q_Res_Val=document.aspnetForm.Photo_q_Res_Val.value
           // alert("Photo_Q_No=" + Photo_Q_No);
           // alert("Photo_q_Res_Val=" + Photo_q_Res_Val);
            Photo_Res_desc=document.aspnetForm.Photo_Res_desc.value
            
            Photo_Ans_type=document.aspnetForm.Photo_Ans_type.value
          // alert("Photo_Ans_type=" + Photo_Ans_type);
            StrResChecked="";
            Eachdesc="";
            StrResDescSelected="";
            RD_File_ex="";
             if (Photo_Q_No!="")
             {
                 if (Photo_Ans_type=="C")
                    {
                            // alert("in");
                             
                            ArrEach_Res_Val = Photo_q_Res_Val.split(",");
                           // alert("ArrEach_Res_Val=" + ArrEach_Res_Val);
                           ArrEach_Res_desc = Photo_Res_desc.split("|");
                           
                            
                              for(r=0; r<ArrEach_Res_Val.length; r++)
							  {
								  EachVal=ArrEach_Res_Val[r] 
								// alert("EachVal=" + EachVal);
								 
								  Eachdesc=ArrEach_Res_desc[r] 
								//  alert("Eachdesc=" + Eachdesc);
								  CBname="Ans_val_CB" + EachVal
								  CB_Status=eval("document.aspnetForm." + CBname + ".checked")
                                //  alert("CB_Status=" + CB_Status);
                                  if (CB_Status==true)
                                  {
                                   StrResChecked=StrResChecked + EachVal + "|";
                                   StrResDescSelected=StrResDescSelected + Eachdesc + "|";
                                   RD_File_ex=RD_File_ex + EachVal + "x";
                                  }
                                  
                              }
                         //Photo_Res_Save_Checked 
                       //  alert("StrResChecked=" + StrResChecked);  
                                
                              document.aspnetForm.Photo_Res_Save_Checked.value=StrResChecked
                              document.aspnetForm.Photo_Res_desc_Selected.value=StrResDescSelected
                              document.aspnetForm.PRD_origial_file_ex.value=RD_File_ex
                              
                    }
             
             }
              if (Photo_Ans_type=="C")
                {
                     if (StrResChecked=="")
                     {
                        return false;
                     }
                 }
                 else
                 {
                    return true;
                 }
             
	}
	
function DateValidation(v_date_object, v_date_sys_rule, v_error_msg)
	{
		
		//alert("v_date_object=" + v_date_object)
		//alert("v_date_sys_rule=" + v_date_sys_rule)
		//alert("v_error_msg=" + v_error_msg)
		
		var v_date_format
		var v_date
		var datearray
		var dateformatarray
		var v_month
		var v_day
		var v_year
		var i
		var v_delimiter
		v_date_format = v_date_sys_rule
		for(i=0; i<v_date_format.length; i++)
		{
			if((v_date_format.charAt(i).toUpperCase()!='Y')&&(v_date_format.charAt(i).toUpperCase()!="M")&&(v_date_format.charAt(i).toUpperCase()!='D'))
			{
				v_delimiter= v_date_format.charAt(i)
				break;	
			}
		}
		//alert("v_date_format=" + v_date_format)
		
		v_date =v_date_object
		dateformatarray = v_date_format.split(v_delimiter)
		var datearray = v_date.split(v_delimiter)
		
		if ((dateformatarray.length) != (datearray.length))
		{
			alert(v_error_msg);
			//eval(v_date_object + ".focus()")
			result = false;
			return false;
		}
		
		for(i=0; i<dateformatarray.length; i++)
		{
			if (dateformatarray[i] == "mm")
			{
			v_month = datearray[i];
			}
			if (dateformatarray[i] == "dd")
			{
			v_day = datearray[i];
			}
			if (dateformatarray[i] == "yyyy")
			{
				v_year = datearray[i];
				Year_added_val=""
			}
			if (dateformatarray[i] == "yy")
			{
				v_year = datearray[i];
				Year_added_val="20"
			}
		}

		//alert("v_month=" + v_month)
		//alert("v_day=" + v_day)
		//alert("v_year=" + v_year)
		
		for(i=0; i<v_day.length; i++)
		{
			if(isNaN(v_day.charAt(i)))
			{
				alert(v_error_msg)
				//eval(v_date_object + ".focus()")
				result = false;
				return false;
			}
		}
		for(i=0; i<v_month.length; i++)
		{
			if(isNaN(v_month.charAt(i)))
			{
				alert(v_error_msg)
				//eval(v_date_object + ".focus()")
				result = false;
				return false;
			}
		}
		for(i=0; i<v_year.length; i++)
		{
			if(isNaN(v_year.charAt(i)))
			{
				alert(v_error_msg)
				//eval(v_date_object + ".focus()")
				result = false;
				return false;
			}
		}
		if((v_month=="") || (v_day=="") || (v_year==""))
		{
			alert(v_error_msg)
			//eval(v_date_object + ".focus()")
			result = false;
			return false;
		}
		if (v_month <1 || v_month >12)
		{
			alert(v_error_msg);
			//eval(v_date_object + ".focus()")
			result = false;
			return false;
		}
		if (isNaN(v_month ))
		{
			alert(v_error_msg);
			//eval(v_date_object + ".focus()")
			result = false;
			return false;
		}
		if (v_day<1 || v_day>31)
		{
			alert(v_error_msg);
			//eval(v_date_object + ".focus()")
			result = false;
			return false;
		}
		if (isNaN(v_day))
		{
			alert(v_error_msg);
			//eval(v_date_object + ".focus()")
			result = false;
			return false;
		}
		if (isNaN(v_year))
		{
			alert(v_error_msg);
			//eval(v_date_object + ".focus()")
			result = false;
			return false;
		}
		if ((v_year < 0) || (v_year.length < 2) || (v_year.length > 4))
		{
			alert(v_error_msg+11);
			//eval(v_date_object + ".focus()")
			result = false;
			return false;
		}
		if ((v_month ==4 || v_month ==6 || v_month ==9 || v_month ==11) && v_day==31)
		{
			alert (v_error_msg)
			//eval(v_date_object + ".focus()")
			result = false;
			return false;
		}
		
		if (v_month  == 2)
		{
			isleap = (v_year %4 == 0 && (v_year % 100 != 0 || v_year % 400 == 0));
			if (v_day>29 || (v_day==29 && !isleap))
			{
				alert (v_error_msg);
				//eval(v_date_object + ".focus()")
				result = false;
				return false;
			} 
		} 
		/*Check for visit date */
		
		
		TodayDate=document.aspnetForm.TodayDate.value;
		
		
		if (v_year.length==2)
		{
			v_year="20" + v_year
		}
		visit_dt=v_month + "/" + v_day + "/" + v_year 
		
		//alert("visit_dt=" + visit_dt)
		//alert("TodayDate=" + TodayDate)
		
		if (Date.parse(TodayDate)<Date.parse(visit_dt))
			{
				//alert("The Visit date greater than Todays date")
				alert('<%=vPrompts[2]%>');
				return false;
			}
		FieldStartDt=document.aspnetForm.Field_Start_Dt.value
		FieldendDt=document.aspnetForm.Field_end_Dt.value
		KeyCompDt=document.aspnetForm.Key_Comp_Dt.value
		DOADt=document.aspnetForm.DOA_Dt.value
		
		//alert("FieldStartDt=" + FieldStartDt)
		/*Field start date*/
			
				FieldStartDtArray = FieldStartDt.split(v_delimiter)
				
						for(i=0; i<dateformatarray.length; i++)
							{
								if (dateformatarray[i] == "mm")
								{
								FS_month = FieldStartDtArray[i];
								}
								if (dateformatarray[i] == "dd")
								{
								FS_day = FieldStartDtArray[i];
								}
								if ((dateformatarray[i] == "yyyy")||(dateformatarray[i] == "yy"))
								{
								FS_year = FieldStartDtArray[i];
								}
							}
							if (FS_year.length==2)
		                    {
			                    FS_year="20" + FS_year
		                    }
				FieldStartDt=FS_month + "/"	+ FS_day + "/" + FS_year 			
				//alert("FieldStartDt=" + FieldStartDt)
				
		/*Field End date*/
			
				FieldendDtArray = FieldendDt.split(v_delimiter)
						for(i=0; i<dateformatarray.length; i++)
							{
								if (dateformatarray[i] == "mm")
								{
								FE_month = FieldendDtArray[i];
								}
								if (dateformatarray[i] == "dd")
								{
								FE_day = FieldendDtArray[i];
								}
								if ((dateformatarray[i] == "yyyy")||(dateformatarray[i] == "yy"))
								{
								FE_year = FieldendDtArray[i];
								}
							}
				FieldendDt=FE_month + "/"	+ FE_day + "/" + FE_year 			
	
				//alert("FieldendDt=" + FieldendDt)

			/*DOADt date*/
			
				DOADtArray = DOADt.split(v_delimiter)
						for(i=0; i<dateformatarray.length; i++)
							{
								if (dateformatarray[i] == "mm")
								{
								DO_month = DOADtArray[i];
								}
								if (dateformatarray[i] == "dd")
								{
								DO_day = DOADtArray[i];
								}
								if ((dateformatarray[i] == "yyyy")||(dateformatarray[i] == "yy"))
								{
								DO_year = DOADtArray[i];
								}
							}
							if (DO_year.length==2)
		                    {
			                    DO_year="20" + DO_year
		                    }
				DOADt=DO_month + "/"	+ DO_day + "/" + DO_year 
				
				//alert("FieldStartDt=" + FieldStartDt)
				//alert("DOADt=" + DOADt)
			    //alert("visit_dt=" + visit_dt)
			    //alert("TodayDate=" + TodayDate)
				//return false;

		if ((Date.parse(visit_dt)<Date.parse(FieldStartDt)) || (Date.parse(visit_dt)>Date.parse(DOADt)))
			{
				//alert("The Visit date entered is invalid for this Job,Wave and Task.")
				alert('<%=vPrompts[1]%>');
				return false;
			}
		
	}
//************************* Trim function *******************************
function Trim(str) {
	var resultStr = "";
	
	resultStr = TrimLeft(str);
	resultStr = TrimRight(resultStr);
	
	return resultStr;
}
function TrimLeft(str) {
	var resultStr = "";
	var i = len = 0;

	// Return immediately if an invalid value was passed in
	if (str+"" == "undefined" || str == null)	
		return null;

	// Make sure the argument is a string
	str += "";

	if (str.length == 0) 
		resultStr = "";
	else {	
  		// Loop through string starting at the beginning as long as there are spaces.
//	  	len = str.length - 1;
		len = str.length;
		
  		while ((i <= len) && (str.charAt(i) == " "))
			i++;

   		// When the loop is done, we're sitting at the first non-space char,
 		// so return that char plus the remaining chars of the string.
  		resultStr = str.substring(i, len);
  	}

  	return resultStr;
}
function TrimRight(str) 
{
	var resultStr = "";
	var i = 0;

	// Return immediately if an invalid value was passed in
	if (str+"" == "undefined" || str == null)	
		return null;

	// Make sure the argument is a string
	str += "";
	
	if (str.length == 0) 
		resultStr = "";
	else {
  		// Loop through string starting at the end as long as there are spaces.
  		i = str.length - 1;
  		while ((i >= 0) && (str.charAt(i) == " "))
 			i--;
 			
 		// When the loop is done, we're sitting at the last non-space char,
 		// so return that char plus all previous chars of the string.
  		resultStr = str.substring(0, i + 1);
  	}
  	
  	return resultStr;  	
}

function CalcKeyCode(aChar) 
{
  var code = aChar.charCodeAt(0);
  return code;
}

function DatecheckNumber(val) 
 {
    //alert("val=" + val);
  
  var strLength = val.length;
  //alert("strLength=" + strLength);
  	for (w=0; w<strLength; w++)
	 {
	    	   //alert("w=" + w);
	    	   Valnum = val.charAt(w);
	    	    //alert("Valnum=" + Valnum);
	    	  var cCode = CalcKeyCode(Valnum);
             //alert("code=" + cCode);
              if (cCode < 48 || cCode > 57 ) 
                  {
                   // break;
                   // alert("wrong");
                   return false;
                  }
             //alert("What=" + Valnum);
     }  
}
function DateNumberOnly(evt)
{
	var e = event || evt; // for trans-browser compatibility
	var charCode = e.which || e.keyCode;
   //alert("charCode=" + charCode);
    //***** charCode=13 is Enter key
    if (charCode==13)
	{
		return false;
    }
                       
	if (charCode > 31 && (charCode < 48 || charCode > 57))
	{
		return false;
    }
	return true;
}

</script>
<asp:Table ID="Table2" runat="server" width="100%" BorderWidth="0" bordercolor="dodgerblue">
<asp:TableRow>
    <asp:TableCell HorizontalAlign="Left" >
           <asp:Table ID="Table1" runat="server" width="100%"  BorderWidth="0" bordercolor="dodgerblue">
            <asp:TableRow>
                <asp:TableCell Width="10%" CssClass="reportCriteriaHeader" >
                        <asp:Label ID="Label3" runat="server" Text="Job No."  class="reportCriteriaHeader"></asp:Label>  
                </asp:TableCell>
                  <asp:TableCell Width="90%" CssClass="selectionCriteriaItem" >
                        :<%=Job_No%>
                </asp:TableCell>
            </asp:TableRow> 
             <asp:TableRow>
                <asp:TableCell Width="10%" CssClass="reportCriteriaHeader">
                <asp:Label ID="Label4" runat="server" Text="Wave No."   CssClass="reportCriteriaHeader"></asp:Label>  
                           
                </asp:TableCell>
                  <asp:TableCell Width="90%" CssClass="selectionCriteriaItem">
                        :<%=Wave_No%>
                </asp:TableCell>
            </asp:TableRow> 
             <asp:TableRow>
                <asp:TableCell Width="10%" CssClass="reportCriteriaHeader">
                <asp:Label ID="Label5" runat="server" Text="Task No."  CssClass="reportCriteriaHeader"></asp:Label>     
                </asp:TableCell>
                  <asp:TableCell Width="90%" CssClass="selectionCriteriaItem">
                       :<%=Task_No%>
                </asp:TableCell>
            </asp:TableRow> 
             <asp:TableRow>
                <asp:TableCell Width="10%" CssClass="reportCriteriaHeader">
                 <asp:Label ID="Label6" runat="server" Text="Chain No."  CssClass="reportCriteriaHeader"></asp:Label>     
                         
                </asp:TableCell>
                  <asp:TableCell Width="90%" CssClass="selectionCriteriaItem">
                        :<%=Chain_No%>
                </asp:TableCell>
            </asp:TableRow> 
             <asp:TableRow>
                <asp:TableCell Width="10%" CssClass="reportCriteriaHeader">
                <asp:Label ID="Label7" runat="server" Text="Store No."  CssClass="reportCriteriaHeader"></asp:Label>     
                
                </asp:TableCell>
                  <asp:TableCell Width="90%" CssClass="selectionCriteriaItem">
                       :<%=Store_No%>
                </asp:TableCell>
            </asp:TableRow> 
             <asp:TableRow>
                <asp:TableCell Width="10%" CssClass="reportCriteriaHeader">
                       <asp:Label ID="Label8" runat="server" Text="Visit Date."  CssClass="reportCriteriaHeader"></asp:Label>      
                </asp:TableCell>
                  <asp:TableCell Width="90%" CssClass="selectionCriteriaItem">
                       <%=Display_Job_Visit_Date%>
                </asp:TableCell>
            </asp:TableRow> 
         </asp:Table>

    </asp:TableCell>
</asp:TableRow> 
</asp:Table>

<hr color="dodgerblue" />
 <asp:Label ID="Display_QP_Info" Font-Bold="true" ForeColor="Black" runat="server" Text=""  SkinID="LabelBlackSkin"></asp:Label>
 
<center>

 <!-- PROGRESS BAR -->
               <cc1:ModalPopupExtender ID="modalProgress" runat="server"  
                                         TargetControlID="dummybtn"
                                         PopupControlID="panelProgress"
                                         BackgroundCssClass="modalBackground"
                                         BehaviorID="modalProgress"
                                         DropShadow="true"
                                         Y="5"/>
                 <span style="display:none;">
                  <asp:Button runat="server" ID="dummybtn" />
                 </span>      
                <asp:Panel   ScrollBars="None" ID="panelProgress" width="180" runat="server" CssClass="modalPopup" style="display:none;"  >
                           <div style="background-color:Orange; border:solid 1px #000000; text-align:center; font-size:12px; font-weight:bold;">
                             <asp:Label runat="server" ID="lblprogress"  Text="Please wait ..."></asp:Label>    
                            </div> 
                            
               </asp:Panel>
               
            <!-- END OF PROGRESS BAR -->


  <cc1:UpdatePanel ID="UpdatePanel1" runat="server">
            <ContentTemplate>
            
            <%
                //Response.Write("test=" + StrOriginalFile);  
                  //  int k;
                   // string[] ArrayFiles1 = StrOriginalFile.Split('|');
                   // for (k = 0; k < ArrayFiles1.Length; k++)
                 //   {
                  //      string TableId = "<asp:Image runat='server' ID='ShowPic" + k + "' Height='200' Width='340'  />"  ;
                   //     Response.Write(TableId);
            %>
           <asp:Label ID="WarningMessage" runat="server"  Font-Bold="true" ForeColor="Red"  Font-Size="Medium" SkinID="LabelBlackSkin" ></asp:Label>
                 <br />
                       <br />  
                       <br />   
             <asp:Repeater ID="Repeater1"   runat="server" >
                      <ItemTemplate>
                                
                       
                               <asp:table  runat="server"  id='tabel1'  BorderColor="Black"  BorderWidth="0"  cellpadding="1" cellspacing="1" width="100%">
                                         <asp:TableRow>
                                                    <asp:TableCell BorderWidth="0"  Width="30%" HorizontalAlign="Right" CssClass="selectionCriteriaItem">
                                                   
                                                    </asp:TableCell>
                                                    <asp:TableCell  Width="20%" HorizontalAlign="left" BorderWidth="0">
                                                    <asp:CheckBox runat="server" ID="CBSavePic"  Checked="true" />  
                                                     <asp:Label ID="Label2"  runat="server" Text="Save the photo"   CssClass="selectionCriteriaItem"></asp:Label>           
                                                    </asp:TableCell>
                                          </asp:TableRow>
                                          
                                         <asp:TableRow >
                                                <asp:TableCell BorderWidth="0"  Width="30%" HorizontalAlign="Right" CssClass="selectionCriteriaItem">
                                                </asp:TableCell>
                                                <asp:TableCell BorderWidth="0"  Width="30%" HorizontalAlign="Center" CssClass="selectionCriteriaItem">
                                                          
                                                           <asp:Label ID="lblUserFileName" runat="server"    Font-Bold="true" ForeColor="blue"  ></asp:Label>
                                                            
                                                            <div runat='server' id="Div_Photo_Image" style="height:200;width:340" >
                                                                 <asp:Image runat='server' ID='ShowPic'  Height="200" Width="340" /> 
                                                            </div>     
                                                               
                                               </asp:TableCell>
                                                <asp:TableCell BorderWidth="0"  Width="40%" HorizontalAlign="Left" CssClass="selectionCriteriaItem">
                                                          <asp:table  runat="server" id="table1" BorderColor="Black"  BorderWidth="0" >  
                                                                <asp:TableRow> 
                                                                        <asp:TableCell  Width="50%" HorizontalAlign="Left" CssClass="selectionCriteriaItem">
                                                                           
                                              	                                         <asp:RadioButtonList   runat="server"  ID="PhotoOption"   AutoPostBack="true"   >
                                                                                                  <asp:ListItem  Value="0"  Text="Original" Selected="True"    > </asp:ListItem>
                                                                                                  <asp:ListItem  Value="1" Text="Rotate Horizontally" > </asp:ListItem>
                                                                                                  <asp:ListItem  Value="2" Text="Rotate Vertically"> </asp:ListItem>
                                                                                                  <asp:ListItem  Value="3" Text="Rotate Right"> </asp:ListItem>
                                                                                                  <asp:ListItem  Value="4" Text="Rotate Left"> </asp:ListItem>
                                                                                          </asp:RadioButtonList>
                                                                                          
                                                                         </asp:TableCell>
                                                                  </asp:TableRow>
                                                           </asp:table>
                                                </asp:TableCell>		
                                          </asp:TableRow>
                                          <asp:TableRow>
                                                    <asp:TableCell BorderWidth="0"  Width="30%" HorizontalAlign="Right" CssClass="selectionCriteriaItem">
                                                   
                                                    </asp:TableCell>
                                                    <asp:TableCell  Width="20%" HorizontalAlign="left" BorderWidth="0">
                                                     <asp:Label ID="Label3"  runat="server" Text="Comments"   CssClass="selectionCriteriaItem"></asp:Label>           
                                                    </asp:TableCell>
                                          </asp:TableRow>
                                          <asp:TableRow>
                                                    <asp:TableCell HorizontalAlign="Right" Width="30%" BorderWidth="0" >       
                                                    </asp:TableCell>
                                                    <asp:TableCell BorderWidth="0"  Width="30%" HorizontalAlign="Right" CssClass="selectionCriteriaItem">
                                                    <asp:TextBox ID="Comments" Height="150" Width="330" runat="server" Columns="40" rows="8" textmode="multiline"></asp:TextBox> 
                                                    </asp:TableCell>
                                                    
                                          </asp:TableRow>
                                          <asp:TableRow>
                                                 <asp:TableCell BorderWidth="0"  Width="30%" HorizontalAlign="Right" CssClass="selectionCriteriaItem">
                                                 
                                                </asp:TableCell>
                                                 <asp:TableCell  HorizontalAlign="left" BorderWidth="0">
                                                 <asp:Label ID="Label1" runat="server" Text="Photo Date:"   CssClass="selectionCriteriaItem"></asp:Label> 
                                                            
                                                              <%
                                            											   
                                                                                                string[] ArrayDateRule;
                                                                                                int d,maxlen;
                                                                                                
                                                                                                ArrayDateRule = new string[3];
                                                                                                ArrayDateRule = DateRule.Split(Date_input.ToCharArray());
                                                                                                //DateRule
                                                                                                maxlen =0;
                                                                                                for (d = 0; d < ArrayDateRule.Length; d++)
                                                                                                {
                                                                                                                if (ArrayDateRule[d].ToUpper() == ("mm").ToUpper())
                                                                                                                {
															                                                                %>
															                                                                <asp:TextBox Width="10%"   runat="server"   MaxLength="2"  ID="txt_visitmonth" ></asp:TextBox> 
															                                                                <%
                                                                                                                }
                                                                                                                if (ArrayDateRule[d].ToUpper() == ("dd").ToUpper())
                                                                                                                {
															                                                                %>            
															                                                                <asp:TextBox Width="10%"  runat="server"   MaxLength="2"  ID="txt_visitday" ></asp:TextBox> 
															                                                                <%
                                                                                                                }
                                                                                                            //if UCase(trim(DateArray(i))) = UCase("yyyy") then
                                                                                                                if (ArrayDateRule[d].ToUpper() == ("yy").ToUpper())
                                                                                                                {
                                                                                                                   // txt_visityear.MaxLength = 2;
                                                                                                                    maxlen = 2;				
                                                                                                                }
                                                                                                                if (ArrayDateRule[d].ToUpper() == ("yyyy").ToUpper())
                                                                                                                {

                                                                                                                   //txt_visityear.MaxLength = 4;
                                                                                                                    maxlen = 4;	 			
                                                                                                                }
                                                                                                                if (maxlen>0)
                                                                                                                {
                                                                                                                   //txt_visityear.Text = StrYear;
                                                                                                                        %>   
												                                                                        <asp:TextBox Width="16%"  runat="server"     ID="txt_visityear" ></asp:TextBox>
												                                                                        <%
                                                                                                                            maxlen = 0;
                                                                                                                }	
                                                                                                  }	
												                                                %>
                                            												 
											                                                <span class="selectionCriteriaMDY">&nbsp;(<%=DateRule%>)</span>
                                                    </asp:TableCell>
                                         </asp:TableRow>									
                                </asp:table>   
                              </ItemTemplate>
                        </asp:Repeater>                     
               <%
                     //   }        
               %>         		  
            </ContentTemplate>
   </cc1:UpdatePanel>
   
   <br />
              <asp:Button   OnClientClick="return DoSubmit()" ID="Button2"   runat="server" Text="Save" CssClass="Button"></asp:Button>
			   &nbsp&nbsp
 </center>  
 
<input name="Hidden_date" type="hidden" value="" />	
<input name="Visit_Date" type="hidden" value="" />	
<input name="txt_midnight" type="hidden" value="" />
<input name="Job_No" type="hidden" value="<%=Job_No%>" />
<input name="Wave_No" type="hidden" value="<%=Wave_No%>" />
<input name="Task_No" type="hidden" value="<%=Task_No%>" />
<input name="Task_Desc" type="hidden" value="<%=Task_Desc%>" />
<input name="Task_Addtl_Desc" type="hidden" value="<%=Task_Addtl_Desc%>" />

<input name="Job_Visit_Date" type="hidden" value="<%=Job_Visit_Date%>" />
<input name="Client_Access_Flag" type="hidden" value="<%=Client_Access_Flag%>" />
<input name="Pre_Approved_Flag" type="hidden" value="<%=Pre_Approved_Flag%>" />

<input name="store_id" type="hidden" value="<%=store_id%>" />

<input name="Chain_No" type="hidden" value="<%=Chain_No%>" />
<input name="Store_Chain_Desc" type="hidden" value="<%=Store_Chain_Desc%>" />
<input name="Store_No" type="hidden" value="<%=Store_No%>" />
<input name="Store_Store_Name" type="hidden" value="<%=Store_Store_Name%>" />
<input name="Store_Street_Addr" type="hidden" value="<%=Store_Street_Addr%>" />
<input name="Store_City" type="hidden" value="<%=Store_City%>" />
<input name="Store_State" type="hidden" value="<%=Store_State%>" />
<input name="Store_Zip" type="hidden" value="<%=Store_Zip%>" />

<input name="CA_merch_no"  type="hidden" value="<%=CA_merch_no%>" />
<input id="Merch_no" type="hidden" runat="server" />
<input name="Str_Merch_no" type="hidden" value="<%=Str_Merch_no%>" />

<input name="Merch_First_Name" type="hidden" value="<%=Merch_First_Name%>" />
<input name="Merch_Last_Name" type="hidden" value="<%=Merch_Last_Name%>" />
<input name="Merch_Street_Addr" type="hidden" value="<%=Merch_Street_Addr%>" />
<input name="Merch_Street_Addr2" type="hidden" value="<%=Merch_Street_Addr2%>" />
<input name="Merch_City" type="hidden" value="<%=Merch_City%>" />
<input name="Merch_State" type="hidden" value="<%=Merch_State%>" />
<input name="Merch_Zip" type="hidden" value="<%=Merch_Zip%>" />
<input name="Merch_Phone_No" type="hidden" value="<%=Merch_Phone_No%>" />
<input name="Merch_Email_Addr" type="hidden" value="<%=Merch_Email_Addr%>" />


<input name="Field_Start_Dt" type="hidden" value="<%=Field_Start_Dt%>" />
<input name="Field_end_Dt" type="hidden" value="<%=Field_end_Dt%>" />
<input name="Key_Comp_Dt" type="hidden" value="<%=Key_Comp_Dt%>" />
<input name="DOA_Dt" type="hidden" value="<%=DOA_Dt%>" />		
	
<input name="TodayDate" type="hidden" value="<%=TodayDate%>" />		
			
<input name="visit_no" type="hidden" value="<%=visit_no%>" />

<input name="Collect_iVR_Time" type="hidden" value="<%=Collect_iVR_Time%>" />
<input name="night_visits" type="hidden" value="<%=night_visits%>" />
<input name="Mileage_flag" type="hidden" value="<%=Mileage_flag%>" />
<input name="Travel_flag" type="hidden" value="<%=Travel_flag%>" />

<input name="Job_Type" type="hidden" value="<%=Job_Type%>" />
<input name="Business_Type_id" type="hidden" value="<%=Business_Type_id%>" />

<input name="Work_Type_id" type="hidden" value="<%=Work_Type_id%>" />
<input name="Work_Type_Desc" type="hidden" value="<%=Work_Type_Desc%>" />

<input name="Data_Col_Method" type="hidden" value="<%=Data_Col_Method%>" />
<input name="overwritetime" type="hidden" value="<%=overwritetime%>" />
<input name="All_Data_Received" type="hidden" value="<%=All_Data_Received%>" />
<input name="collect_time_only" type="hidden" value="<%=collect_time_only%>" />
<input name="Ask_Q_HH_Used" type="hidden" value="<%=Ask_Q_HH_Used%>" />
<input name="HH_Status_Flag" type="hidden" value="<%=HH_Status_Flag%>" />

<input name="Collect_Header" type="hidden" value="<%=Collect_Header%>" />
<input name="Collect_Call_Form" type="hidden" value="<%=Collect_Call_Form%>" />

<input name="SS_Callform" type="hidden" value="<%=SS_Callform%>" />
<input name="Prod_Specific" type="hidden" value="<%=Prod_Specific%>" />
<input name="qdef_skippattern" type="hidden" value="<%=qdef_skippattern%>" />

<input name="Max_Mx_Per_Store" type="hidden" value="<%=Max_Mx_Per_Store%>" />
<input name="Max_Visit_Per_Store_Mx" type="hidden" value="<%=Max_Visit_Per_Store_Mx%>" />

<input name="Collect_Store_Mgr_Name" type="hidden" value="<%=Collect_Store_Mgr_Name%>" />

<input name="Product_Check_Flag" type="hidden" value="<%=Product_Check_Flag%>" />

<input name="Ask_EShelf_Question" type="hidden" value="<%=Ask_EShelf_Question%>" />

<input name="Call_Form_Type_No" type="hidden" value="<%=Call_Form_Type_No%>" />

<input name="Est_instore_minutes" type="hidden" value="<%=Est_instore_minutes%>" />
<input name="Business_Rule_Eckerd" type="hidden" value="<%=Business_Rule_Eckerd%>" />
<input name="Eckerd_Job_Last_question" type="hidden" value="<%=Eckerd_Job_Last_question%>" />

<input name="user_id" type="hidden" value="<%=user_id%>" />
<input name="PhotoButton" type="hidden" value="<%=PhotoButton%>" />
<input name="Bus_Rule5_Question" type="hidden" value="<%=Bus_Rule5_Question%>" />
<input name="Bus_Rule6_Question" type="hidden" value="<%=Bus_Rule6_Question%>" />
<input name="Bus_Rule28_Question" type="hidden" value="<%=Bus_Rule28_Question%>" />
<input name="Bus_Rule3_Question" type="hidden" value="<%=Bus_Rule3_Question%>" />
<input name="Bus_Rule4_Question" type="hidden" value="<%=Bus_Rule4_Question%>"  />
<input name="Bus_Rule7_Question" type="hidden" value="<%=Bus_Rule7_Question%>"  />

<%//From page CFJWTValidateSV.aspx %>

<input name="Str_VisitMonth" type="hidden" value="<%=Str_VisitMonth%>" />
<input name="Str_visitday" type="hidden" value="<%=Str_visitday%>" />
<input name="Str_visityear" type="hidden" value="<%=Str_visityear%>" />
<input name="Str_timein_hrs" type="hidden" value="<%=Str_timein_hrs%>" />
<input name="Str_timein_min" type="hidden" value="<%=Str_timein_min%>" />
<input name="Str_cmb_timein" type="hidden" value="<%=Str_cmb_timein%>" />
<input name="Str_timeout_hrs" type="hidden" value="<%=Str_timeout_hrs%>" />
<input name="Str_timeout_min" type="hidden" value="<%=Str_timeout_min%>" />
<input name="Str_cmb_timeout" type="hidden" value="<%=Str_cmb_timeout%>" />
<input name="Str_txt_mileage" type="hidden" value="<%=Str_txt_mileage%>" />
<input name="Str_txt_drive" type="hidden" value="<%=Str_txt_drive%>" />
<input name="Str_rad_q_Past_Midnight" type="hidden" value="<%=Str_rad_q_Past_Midnight%>" />
<input name="Str_rad_q_HH_Used" type="hidden" value="<%=Str_rad_q_HH_Used%>" />
<input name="Str_rad_q_Ret_store_visit" type="hidden" value="<%=Str_rad_q_Ret_store_visit%>" />
<input name="Str_Radio_EShelf" type="hidden" value="<%=Str_Radio_EShelf%>" />
<input name="Str_Ask_EShelf_Question" type="hidden" value="<%=Str_Ask_EShelf_Question%>" />
<input name="Str_Bus_Rule3_Question" type="hidden" value="<%=Str_Bus_Rule3_Question%>" />
<input name="Str_rad_q_BR3" type="hidden" value="<%=Str_rad_q_BR3%>" />
<input name="Str_Bus_Rule4_Question" type="hidden" value="<%=Str_Bus_Rule4_Question%>" />
<input name="Str_rad_q_BR4" type="hidden" value="<%=Str_rad_q_BR4%>" />
<input name="Str_Bus_Rule5_Question" type="hidden" value="<%=Str_Bus_Rule5_Question%>" />
<input name="Str_rad_q_BR5" type="hidden" value="<%=Str_rad_q_BR5%>" />
<input name="Str_Bus_Rule6_Question" type="hidden" value="<%=Str_Bus_Rule6_Question%>" />
<input name="Str_rad_q_BR6" type="hidden" value="<%=Str_rad_q_BR6%>" />
<input name="Str_Bus_Rule7_Question" type="hidden" value="<%=Str_Bus_Rule7_Question%>" />
<input name="Str_rad_q_BR7" type="hidden" value="<%=Str_rad_q_BR7%>" />
<input name="Str_Bus_Rule28_Question" type="hidden" value="<%=Str_Bus_Rule28_Question%>" /> 
<input name="Str_rad_q_BR28" type="hidden" value="<%=Str_rad_q_BR28%>" />
<input name="Str_Manager_Title" type="hidden" value="<%=Str_Manager_Title%>" /> 
<input name="Str_txt_Manager_name" type="hidden" value="<%=Str_txt_Manager_name%>" />
 <input name="DateFormat" type="hidden" value="<%=DateRule%>" />
 <input name="RotateFileSave" type="hidden" value="<%=RotateFileSave%>"/>
 <asp:HiddenField ID="savePath" runat="server" value="0" />
<input name="StrOriginalFile" id="hiddentest" type="hidden" value="<%=StrOriginalFile%>"/>  
<input name="StrRotateFileSave" id="hidden1" type="hidden" value="<%=RotateFileSave%>"/> 
<input name="StrUserUploadFile" id="hidden5" type="hidden" value="<%=StrUserUploadFile%>"/> 
  
<input name="FileCount" type="hidden" value="<%=FileCount%>" id="Hidden2" /> 
<input name="SelectCheckboxFiles" type="hidden" value="" ID="Hidden86" /> 
<input name="PhotoCounter" type="hidden" value="" ID="Hidden3" /> 
<input name="Visit_Dates" type="hidden" value="" ID="Hidden4" /> 
 <input name="Photo_CF_Access" type="hidden" value="<%=Photo_CF_Access%>" />
   <input name="Photo_Q_Enable" type="hidden" value="<%=Photo_Q_Enable%>" />

 <input name="Photo_Q_No" type="hidden" value="<%=Photo_Q_No%>" />
<input name="Photo_q_Res_Val" type="hidden" value="<%=Photo_q_Res_Val%>" />
<input name="Photo_Prod_upc" type="hidden" value="<%=Photo_Prod_upc%>" />

<input name="Photo_upc_desc" type="hidden" value="<%=Photo_upc_desc%>" />
<input name="Photo_q_desc" type="hidden" value="<%=Photo_q_desc%>" />
<input name="Photo_Res_desc" type="hidden" value="<%=Photo_Res_desc%>" />
 <input name="Photo_Ans_type" type="hidden" value="<%=Photo_Ans_type%>" />
 
  <input name="Photo_Res_Save_Checked" type="hidden" value="" />
 <input name="PRD_origial_file_ex" type="hidden" value="" />
  <input name="Photo_Res_desc_Selected" type="hidden" value="" />
 
  <input name="FileUploadType" type="hidden" value="<%=FileUploadType%>"/>  
  <input name="Old_Visit_Date" type="hidden" value="<%=Old_Visit_Date%>"/>
  <input name="StrGridDates" type="hidden" value="<%=StrGridDates%>" />
  <input name="NewScreenPage" type="hidden" value="<%=NewScreenPage%>"/>
  <Input type=hidden name="chainstorelstSA" value="<%=chainstorelstSA%>"/>
<Input type=hidden name="selchainstoreSA" value="<%=selchainstoreSA%>"/>
  <input name="CallFormEnd"  id="CallFormEnd" type="hidden" value="0"/>
  <input name="Str_Sv_Panel_id" type="hidden" value="<%=Str_Sv_Panel_id%>" />
</asp:Content>

