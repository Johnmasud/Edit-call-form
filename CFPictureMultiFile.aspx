<%@ Page Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" EnableViewStateMac="false" CodeFile="CFPictureMultiFile.aspx.cs" Inherits="CFPictureMultiFile" Title="Internet Call Form Input" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">



<script type="text/javascript"  language="javascript">
//function right(e) {

//            //alert("StartArray1=" +  navigator.appName)		
//            if (navigator.appName == 'Netscape' && (e.which == 3 || e.which == 2))
//            {
//                    //alert("Sorry, you do not have permission to right click.");
//                    return false;
//            }
//            else if (navigator.appName == 'Microsoft Internet Explorer' && (event.button == 2 || event.button == 3)) 
//            {
//                    //alert("Sorry, you do not have permission to right click.");
//                    return false;
//            }
//            
//       
//        
//return true;
//}
//document.onmousedown=right;
//document.onmouseup=right; 
document.oncontextmenu=new Function("return false")
 


//if (navigator.appName == 'Netscape' && 
//(e.which == 3 || e.which == 2))
//return false;
//else if (navigator.appName == 'Microsoft Internet Explorer' && 
//(event.button == 2 || event.button == 3)) {
//alert("Sorry, you do not have permission to right click.");
//return false;
//}
//return true;
//}



 function CheckGoBack(e) 
 {
        var evt = e || window.event; 
        var node = (evt.target) ? evt.target : ((evt.srcElement) ? evt.srcElement : null); 
       // alert("evt=" + node.type);
        var keyCode = evt.charCode || evt.keyCode; 
       // alert("keyCode=" + keyCode);
         if ((keyCode==8) && (node.type!="text"))  
             {
                return false;
             }

 }

 document.onkeydown = CheckGoBack;
 function DoSubmitBack()
	{
	     DisableButtonsBack()
	    Photo_Q_Enable=document.aspnetForm.Photo_Q_Enable.value  
	   if (Photo_Q_Enable=="Y")
	      {
	            	    document.aspnetForm.action = "CFPictureByQuestionList.aspx";
	                    document.aspnetForm.submit();
	                    return false;	
	      }
	       else
	       {
    	                document.aspnetForm.action = "CFPictureGetFileOption.aspx";
	                    document.aspnetForm.submit();
	                    return false;	
	       }
    	 
	}
	
function Load()
{
   // alert("test");
}
//function CuteWebUI_AjaxUploader_OnSelect(files)  
// {  
// alert("test");
////    //unit is b  
////    var maxLimit=1000000;  
////     //1000000=1mb  
////     var sum=0;  
////     for(var i=0;i<files.length;i++)  
////     {  
////         sum=sum+files[i].FileSize;  
////     }  
////     if(sum>maxLimit)  
////     {  
////         alert("Exceeded the maximum upload size limit");  
////         return false;  
////     }  
// }  
function DisableButtonsBack()
	{
		   //*********** Button2 is NEXT
		     var Exists3=document.getElementById("ctl00_ContentPlaceHolder1_GoBack");
	                                             
            if (Exists3!=null)
            {
               document.aspnetForm.ctl00$ContentPlaceHolder1$GoBack.disabled=true;  
            }
            
	        var Exists2=document.getElementById("ctl00_ContentPlaceHolder1_BtnBrowse");
	                                             
            if (Exists2!=null)
            {
               document.aspnetForm.ctl00$ContentPlaceHolder1$BtnBrowse.disabled=true;  
            }
           var Exists5=document.getElementById("ctl00_ContentPlaceHolder1_BtnCancelAll");
            if (Exists5!=null)
            {
               document.aspnetForm.ctl00$ContentPlaceHolder1$BtnCancelAll.disabled=true;  
            }
            var Exists6=document.getElementById("ctl00_ContentPlaceHolder1_SubmitButton");
            if (Exists6!=null)
            {
               document.aspnetForm.ctl00$ContentPlaceHolder1$SubmitButton.disabled=true;  
            }
            
            
	}	
	
function DisableButtons()
	{
		   //*********** Button2 is NEXT
		     var Exists3=document.getElementById("ctl00_ContentPlaceHolder1_GoBack");
	                                             
            if (Exists3!=null)
            {
               document.aspnetForm.ctl00$ContentPlaceHolder1$GoBack.disabled=true;  
            }
            
	        var Exists2=document.getElementById("ctl00_ContentPlaceHolder1_BtnBrowse");
	                                             
            if (Exists2!=null)
            {
               document.aspnetForm.ctl00$ContentPlaceHolder1$BtnBrowse.disabled=true;  
            }
           var Exists5=document.getElementById("ctl00_ContentPlaceHolder1_BtnCancelAll");
            if (Exists5!=null)
            {
               document.aspnetForm.ctl00$ContentPlaceHolder1$BtnCancelAll.disabled=true;  
            }
            var Exists6=document.getElementById("ctl00_ContentPlaceHolder1_SubmitButton11");
            if (Exists6!=null)
            {
               document.aspnetForm.ctl00$ContentPlaceHolder1$SubmitButton.disabled=true;  
            }
            
            
	}	
function AbleButtons()
	{
	          var Exists3=document.getElementById("ctl00_ContentPlaceHolder1_GoBack");
	                                             
            if (Exists3!=null)
            {
               document.aspnetForm.ctl00$ContentPlaceHolder1$GoBack.disabled=false;  
            }
		   //*********** Button2 is NEXT
	        var Exists2=document.getElementById("ctl00_ContentPlaceHolder1_BtnBrowse");
            if (Exists2!=null)
            {
               document.aspnetForm.ctl00$ContentPlaceHolder1$BtnBrowse.disabled=false;  
            }
           var Exists5=document.getElementById("ctl00_ContentPlaceHolder1_BtnCancelAll");
            if (Exists5!=null)
            {
               document.aspnetForm.ctl00$ContentPlaceHolder1$BtnCancelAll.disabled=false;  
            }
            var Exists6=document.getElementById("ctl00_ContentPlaceHolder1_SubmitButton11");
            if (Exists6!=null)
            {
               document.aspnetForm.ctl00$ContentPlaceHolder1$SubmitButton.disabled=false;  
            }
           
            
	}	
 
 


function submitbutton_click()
{
      
    
   
   DisableButtons()
        	//************* Visit date ************************
	    DateRule=document.aspnetForm.DateFormat.value
	 
		if ((document.aspnetForm.ctl00$ContentPlaceHolder1$txt_visitmonth.value=="") || (document.aspnetForm.ctl00$ContentPlaceHolder1$txt_visitday.value=="") || (document.aspnetForm.ctl00$ContentPlaceHolder1$txt_visityear.value==""))
		 {
			alert('<%=vPrompts[0]%>'); 
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
											CorrectDate=CorrectDate+document.aspnetForm.ctl00$ContentPlaceHolder1$txt_visitmonth.value;
										}
										if (JEdate[i] == "dd")
										{
											CorrectDate=CorrectDate+document.aspnetForm.ctl00$ContentPlaceHolder1$txt_visitday.value;
										}
										if (JEdate[i] == "yyyy" || JEdate[i] == "yy" )
										{
											CorrectDate=CorrectDate+document.aspnetForm.ctl00$ContentPlaceHolder1$txt_visityear.value;
										}
									if (i<2) 
										{
											CorrectDate=CorrectDate + "" + delimiter + "";
										}
							}                // end of for 
	                        StrMonth=document.aspnetForm.ctl00$ContentPlaceHolder1$txt_visitmonth.value;
	                        StrDay=document.aspnetForm.ctl00$ContentPlaceHolder1$txt_visitday.value;
	                        StrYear=document.aspnetForm.ctl00$ContentPlaceHolder1$txt_visityear.value;
	                        
							//alert("CorrectDate=" + CorrectDate);
							// put the value in a hidden variable 
							document.aspnetForm.Hidden_date.value=CorrectDate;
							// pass the value to our multilanguage Function
							sys_rule=DateRule
							//alert("year=" +document.TimeValidation.txt_visityear.value);
							//alert("sys_rule=" + sys_rule);
			                StrDateCheck=StrMonth + "" + StrDay + "" + StrYear;  
			                 if (DatecheckNumber(StrDateCheck)==false)
						            {
						               // alert("check");
						                alert('<%=vPrompts[0]%>');
						                AbleButtons()
                                        return false;
						            }     
							if (DateValidation(CorrectDate,sys_rule,'<%=vPrompts[0]%>')==false)
							 {
							    AbleButtons()
								return false;
							 }
			}
			if (result==false)	
			{
				return result;
			}
        //Create the file name for rotate pic
        StrNewPhotoName=""
        filecount=document.aspnetForm.RotateFileCount.value;
//        for( i = 1; i <= filecount; i++ )
//			{
//				 
//				 today = new Date()
//				// alert("today=" + today);
//				var year = today.getYear()
//				var Month = today.getMonth()+1
//				var Day = today.getDate()
//				var Hour = today.getHours()
//				var Minute = today.getMinutes()
//				var Second = today.getSeconds()
//				var MSecond = today.getMilliseconds();
//				var Job_No=document.aspnetForm.Job_No.value
//				 
//				var Wave_No=document.aspnetForm.Wave_No.value
//				var Task_No=document.aspnetForm.Task_No.value
//				var Merch_no=document.aspnetForm.Str_Merch_no.value
//				var store_id=document.aspnetForm.store_id.value
//			  // alert("store_id=" + store_id);
//			     
//				var Picture_Name="" + Job_No + "" + Wave_No + "" + Task_No + "" + Merch_no + "" + store_id + "" + year + "" + Month + "" + Day + "" + Hour + "" + Minute + "" + Second + "" + i + ""	
//				  //alert("Job_No2=" + Job_No);
//				
//				 if (StrNewPhotoName=="") 
//					{
//						StrNewPhotoName=Picture_Name 
//					}
//					else
//					{
//						StrNewPhotoName=StrNewPhotoName + "|"  + Picture_Name
//					} 
//				 		
//			}
		       //document.aspnetForm.StrOriginalFile.value=FileNames
//		 	  document.aspnetForm.RotateFileSave.value=StrNewPhotoName	
  // alert("filecheck=" + document.aspnetForm.RotateFileSave.value);
  // 1 mb is equal to  1,048,576 bytes
            ILang_Id=document.aspnetForm.Lang_id.value;
  
          if (ILang_Id==1)
	         {
	             var maxLimit=3145728;
	         }
            else
            {
                var maxLimit=4718592;
            }
         //alert("maxLimit=" + maxLimit);
          
         TotalFileLen=document.aspnetForm.TotalFileLen.value;
        //alert("TotalFileLen=" + TotalFileLen);
       if(TotalFileLen>maxLimit)  
         {  
             //alert("Exceeded the maximum upload size limit"); 
             
                if (ILang_Id==1)
	            {
	                alert('<%=vPrompts[11]%>'); 
	            }
                else
                {
                    alert('<%=vPrompts[9]%>'); 
                }
             AbleButtons()
             return false;  
         }  
 
    var submitbutton=document.getElementById('ctl00_ContentPlaceHolder1_SubmitButton');
	var uploadobj=document.getElementById('ctl00_ContentPlaceHolder1_Uploader1');
	if(!window.filesuploaded)
	{
	 
		if(uploadobj.getqueuecount()>0)
		{
		     $find("modalProgress").show();	
			uploadobj.startupload();
		
		}
		else
		{
			var uploadedcount=parseInt(submitbutton.getAttribute("itemcount"))||0;
			if(uploadedcount>0)
			{
				return true;
			}
			AbleButtons()
			alert('<%=vPrompts[10]%>'); 
		}
		return false;
	}
	  
	window.filesuploaded=false;
	  //var hiddenControl = '<%= John.ClientID %>';
     // JS_File_Name=document.getElementById(hiddenControl).value;
     
   
	return true;
}

function CuteWebUI_AjaxUploader_OnQueueUI(list)
{
        var maxLimit=1000000;  
        //1000000=1mb  
       var sum=0;  
        //alert("list=" + list) 
        var table = document.getElementById("table1");
       // alert("list1=" + list) 
        RemoveAllRows("table1");
        Filecount=list.length;
      //alert("list2=" + list.length) 
      document.aspnetForm.RotateFileCount.value=Filecount	
        for(var i=0;i<list.length;i++)
        {
                 
                var name=list[i].FileName
                var size=list[i].FileSize 
                var stat=list[i].Status 
                var func=list[i].Cancel;
                var row=table.insertRow(-1);
                 
                sum=sum+size; 
                if (i % 2 == 0)
                    row.style.backgroundColor = "#F8F8F8";
                
                var cellname = row.insertCell(-1);
                cellname.innerHTML="<div style='word-break:break-all;'>" + name + "</div>";
                
                cellname.style.width="50%";
                
                var cellsize = row.insertCell(-1);
                cellsize.innerHTML=size;
                cellsize.style.width="30%";

                var last=row.insertCell(-1);
                last.style.textAlign = "center";
                last.style.width = "20%";
                if(stat=="Queue")
                {      
                        var img = document.createElement('img');
                        img.src = 'images\\x.jpg';
                        img.style.cursor = "pointer";
                        img.onclick=func;
                        last.appendChild(img);
                }
                else
                {
                        last.innerHTML=stat;
                } 
        }      
        //alert("sum=" + sum)
        document.aspnetForm.TotalFileLen.value= sum
        return false;
}

function CuteWebUI_AjaxUploader_OnPostback()
{
	window.filesuploaded=true;
	var submitbutton=document.getElementById('ctl00_ContentPlaceHolder1_SubmitButton');
	submitbutton.click();
	return false;
}

function CuteWebUI_AjaxUploader_OnError(msg)
{
         alert("Global Error: " + msg);
         return false;
}

function CuteWebUI_AjaxUploader_OnTaskError(obj,msg,reason)
{
        alert("File Error: "+ obj.FileName+ " , " + reason);
        return false;
}

function cancelalltasks()
{
       var uploadobj=document.getElementById('ctl00_ContentPlaceHolder1_Uploader1');
       uploadobj.cancelall();
}

function RemoveAllRows(table)
{
    //alert("table=" + table) 
    while(document.getElementById(table).hasChildNodes())
    {
       var x = document.getElementById(table).rows.length;
       
       if (x < 1)
       {
            break;
       }
       else
       {
            document.getElementById(table).deleteRow(x-1);
       }
    }
}

function DeleteItem(row)
{
   var _row = row.parentElement.parentElement;  
   document.getElementById("DataListTable").deleteRow(_row.rowIndex); 
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
<hr color="dodgerblue" />
<asp:Table ID="Table2" runat="server" width="100%" BorderWidth="0" bordercolor="dodgerblue">
<asp:TableRow>
    <asp:TableCell HorizontalAlign="Left" >
           <asp:Table ID="Table7" runat="server" width="100%"  BorderWidth="0" bordercolor="dodgerblue">
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
                       <asp:Label ID="Label10" runat="server" Text="Visit Date."  CssClass="reportCriteriaHeader"></asp:Label>      
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

<asp:Label ID="Photo_By_Q_Message" Font-Bold="true" ForeColor="Red" runat="server" Text=""  SkinID="LabelBlackSkin"></asp:Label>
 <asp:Label ID="Display_QP_Info" Font-Bold="true" ForeColor="Black" runat="server" Text=""  SkinID="LabelBlackSkin"></asp:Label>
 
 
<!-- PROGRESS BAR -->
   <cc1:ModalPopupExtender ID="modalProgress" runat="server"  
                             DropShadow="false"
                             TargetControlID="dummybtn"
                             PopupControlID="panelProgress"
                             BackgroundCssClass="modalBackground"
                             BehaviorID="modalProgress"
                             Y="5"/>
           
    <asp:Panel ID="panelProgress" width="180" runat="server" CssClass="modalPopup" style="display:none;"  >
               <div style="background-color:Orange; border:solid 1px #000000; text-align:center; font-size:12px; font-weight:bold;">
                 <asp:Label runat="server" ID="lblprogress"  Text="Please wait ..."></asp:Label>    
                </div> 
       
    </asp:Panel>
<!-- END OF PROGRESS BAR -->
<span style="display:none;">
<asp:Button runat="server" ID="dummybtn" />

</span>

<br />
<center>
 

  
<cc1:ScriptManager ID="ScriptManager1" runat="server">
             
       </cc1:ScriptManager>
       <br />
 <center>
              <table style="text-align:left;">
                    <tr>
                        <td>
                              <cc1:UpdatePanel ID="UpdatePanel1" runat="server">
                                    <ContentTemplate>
                                        <span style="display:none">
                                        <asp:TextBox ID="John"  runat="server"></asp:TextBox>
                                        </span>
                                            <table>
                                                    <tr>
                                                        <td>
                                                           <table id="table4" style="width:385px; font-size:12px; font-weight:bold; font-family:Arial; text-align:left; border-right:solid 1px DodgerBlue; border-left:solid 1px DodgerBlue; border-top:solid 1px DodgerBlue;">
                                                                        <tr style="height:10px; font-family:Arial; font-size:12px; background-color:DodgerBlue; color:#FFFFFF; text-align:center;">
                                                                            <td style="width:50%;">
                                                                                <asp:Label ID="lblfilename" runat="server" Text="File Name"></asp:Label>
                                                                            </td>
                                                                            <td style="width:30%;"> 
                                                                                <asp:Label ID="lblfilesize" runat="server" Text="File Size (in Bytes)"></asp:Label>
                                                                            </td>
                                                                            <td style="width:20%;">
                                                                                <asp:Label ID="lblRemove" runat="server" Text="Remove"></asp:Label>
                                                                            </td>
                                                                        </tr>  
                                                            </table>  
                                                            <asp:Panel ID="Panel1" ScrollBars="Vertical"  CssClass="AjaxUploaderPanel" runat="server">
                                                                 <table id="table1" style="width:383px; font-size:11px; font-family:Arial; text-align:left;">
                                                                 </table>  
                                                            </asp:Panel>      
                                                        </td>
                                                    </tr>
                                                    
                                                    <tr>
                                                        <td style="text-align:left;">
                                                                <CuteWebUI:UploadAttachments runat="server" ManualStartUpload="true" ID="Uploader1"
                                                                 OnFileUploaded="Uploader_FileUploaded"
                                                                  
                                                                 MultipleFilesUpload="true" 
                                                                 InsertButtonID="BtnBrowse"  
                                                                 CancelButtonID="BtnSelectedFile" 
                                                                 OnPreRender="Attachments1_PreRender" 
                                                                 OnUploadCompleted="Uploader_UploadCompleted" 
                                                                  ValidateOption-MaxSizeKB="3145728"  
                                                                   
                                                                 ValidateOption-AllowedFileExtensions="*.JPG|*.GIF|*.jpeg"   MaxFilesLimit="10" >
                                                                   
                                                                </CuteWebUI:UploadAttachments>
                                                                 
                                                                <asp:Button ID="BtnSelectedFile"  style="visibility:hidden;"  runat="server"  Enabled="false" Text="Cancel Upload"    UseSubmitBehavior="false" /> 
                                                                 <asp:HiddenField ID="JavaMFileRotate" runat="server"   />
                                                         </td>
                                                    </tr>
                                                    
                                             </table>
                                            
                                    </ContentTemplate>
                                   
                              </cc1:UpdatePanel> 
                        </td>
                   </tr>
                  
              </table>
      </center>
 
 <asp:Table ID="Table3" runat="server"  Width="100%" HorizontalAlign="Center" BorderWidth="0" bordercolor="dodgerblue">
     <asp:TableRow>
        <asp:TableCell HorizontalAlign="Center">
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
                                                                        txt_visitmonth.Text = Str_VisitMonth;
															                    %>
															                    <asp:TextBox Width="5%"   runat="server"   MaxLength="2"  ID="txt_visitmonth" ></asp:TextBox> 
															                    <%
                                                                    }
                                                                    if (ArrayDateRule[d].ToUpper() == ("dd").ToUpper())
                                                                    {
                                                                        txt_visitday.Text = Str_visitday;
															                    %>            
															                    <asp:TextBox Width="5%"  runat="server"   MaxLength="2"  ID="txt_visitday" ></asp:TextBox> 
															                    <%
                                                                    }
                                                                //if UCase(trim(DateArray(i))) = UCase("yyyy") then
                                                                    if (ArrayDateRule[d].ToUpper() == ("yy").ToUpper())
                                                                    {
                                                                        txt_visityear.MaxLength = 2;
                                                                        maxlen = 2;		
                                                                        		
                                                                    }
                                                                    if (ArrayDateRule[d].ToUpper() == ("yyyy").ToUpper())
                                                                    {

                                                                        txt_visityear.MaxLength = 4;
                                                                        maxlen = 4;	 			
                                                                    }
                                                                    if (maxlen>0)
                                                                    {
                                                                        txt_visityear.Text = StrYear;
                                                                         
                                                                            %>   
												                            <asp:TextBox Width="6%"  runat="server"  ID="txt_visityear"  ></asp:TextBox>
												                            <%
                                                                                maxlen = 0;
                                                                    }	
                                                      }	
												    %>
												 
											    <span class="selectionCriteriaMDY">&nbsp;(<%=DateRule%>)</span>
        </asp:TableCell>
    </asp:TableRow>
</asp:Table>
<br />
<table>  
 <tr>     
                        <td style="text-indent:3px;">
                              <asp:Button   OnClientClick="return DoSubmitBack()" ID="GoBack" runat="server" Text="<< Back" CssClass="Button"></asp:Button>
                              <asp:Button ID="BtnBrowse" runat="server" Text="Select Files"/> 
                              <asp:Button ID="BtnCancelAll" runat="server" OnClientClick="cancelalltasks();return false;" Text="Remove All Files"/> 
                              <asp:Button runat="server" ID="SubmitButton" OnClick="ConfirmSubmit_Click" OnClientClick="return submitbutton_click();"
                              Text="Save and Upload Files" /> 
                        </td>
                    </tr>
</table>  
 <br />
<asp:Label ID="Label2" Font-Bold="true" ForeColor="Red" runat="server" Text="The maximum number of files you can upload at one time is 10."  SkinID="LabelBlackSkin"></asp:Label>
 <br />

<%
 if (Lang_id ==1)
 {
 %>				 
     <asp:Label ID="Label8" Font-Bold="true" ForeColor="Red" runat="server" Text="The combined file size limit is 3 MB."  SkinID="LabelBlackSkin"></asp:Label>
 <%
 }
 else
 {     
 %>  
     <asp:Label ID="Label9" Font-Bold="true" ForeColor="Red" runat="server" Text="The combined file size limit is 4 MB."  SkinID="LabelBlackSkin"></asp:Label>
 <%
  }
 %>


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

<input name="Lang_id" type="hidden" value="<%=Lang_id%>" />
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
 <input name="DateFormat" type="hidden" value="<%=DateRule%>" />
 <input name="StrOriginalFile" type="hidden" value="" />
<input name="Str_Manager_Title" type="hidden" value="<%=Str_Manager_Title%>" /> 
<input name="Str_txt_Manager_name" type="hidden" value="<%=Str_txt_Manager_name%>" />

 <input name="RotateFileSave" type="hidden" value=""/>
 <asp:HiddenField ID="savePath" runat="server" value="0" />
<input name="hiddentest" id="hiddentest" type="hidden" runat="server" value=""/>
<input name="FileUploadType" type="hidden" value="M"/>
<input name="RotateFileCount" type="hidden" value=""/>
 <asp:HiddenField ID="OriginalFileCount" runat="server" value="1" />
 <input name="TotalFileLen" type="hidden" value=""/>
<input name="Photo_CF_Access" type="hidden" value="<%=Photo_CF_Access%>" />
  <input name="testvar" type="hidden" value="<%=StrFilenames%>"/>
 <input name="Photo_Q_Enable" type="hidden" value="<%=Photo_Q_Enable%>" />
 
<input name="Photo_Q_No" type="hidden" value="<%=Photo_Q_No%>" />
<input name="Photo_q_Res_Val" type="hidden" value="<%=Photo_q_Res_Val%>" />
<input name="Photo_Prod_upc" type="hidden" value="<%=Photo_Prod_upc%>" />

<input name="Photo_Ans_type" type="hidden" value="<%=Photo_Ans_type%>" />

<input name="Photo_upc_desc" type="hidden" value="<%=Photo_upc_desc%>" />
<input name="Photo_q_desc" type="hidden" value="<%=Photo_q_desc%>" />
<input name="Photo_Res_desc" type="hidden" value="<%=Photo_Res_desc%>" />
<input name="Old_Visit_Date" type="hidden" value="<%=Old_Visit_Date%>"/>
<input name="StrGridDates" type="hidden" value="<%=StrGridDates%>" />
<input name="NewScreenPage" type="hidden" value="<%=NewScreenPage%>"/>
<Input type=hidden name="chainstorelstSA" value="<%=chainstorelstSA%>"/>
<Input type=hidden name="selchainstoreSA" value="<%=selchainstoreSA%>"/>
<input name="Str_Sv_Panel_id" type="hidden" value="<%=Str_Sv_Panel_id%>" />
</asp:Content>

