<%@ Page Language="C#" MasterPageFile="~/MasterPage.master"   AutoEventWireup="true" EnableViewStateMac="false"  CodeFile="CFPictureGetSingleFile.aspx.cs" Inherits="CFPictureGetSingleFile"   Title="SPAR - Internet Call Form Input" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
<cc1:ScriptManager ID="ScriptManager1" runat="server" AsyncPostBackTimeout="600">
 </cc1:ScriptManager>
 

<script type="text/javascript"  language="javascript">
//function right(e) {

//            //alert("StartArray1=" +  navigator.appName)		
//            if (navigator.appName == 'Netscape' && (e.which == 3 || e.which == 2))
//            {
//                     alert("Sorry, you do not have permission to right click.");
//                    return false;
//            }
//            else if (navigator.appName == 'Microsoft Internet Explorer' && (event.button == 2 || event.button == 3)) 
//            {
//                     
//                     alert("Sorry, you do not have permission to right click.");
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
	    DisableButtons()
    	document.aspnetForm.action = "CFPictureGetFileOption.aspx";
	    document.aspnetForm.submit();
	    return false;		 
	}
function Load()
	{
	   // alert("test");
	}
function DisableButtons()
	{
	     //******* Disabled the buttons
		document.aspnetForm.ctl00$ContentPlaceHolder1$UploadSinglePhoto.disabled=true;
		document.aspnetForm.ctl00$ContentPlaceHolder1$GoBack.disabled=true;
	}
function AbleButtons()
	{
	     //******* abled the buttons
         document.aspnetForm.ctl00$ContentPlaceHolder1$UploadSinglePhoto.disabled=false;
         document.aspnetForm.ctl00$ContentPlaceHolder1$GoBack.disabled=false;
	}
function DoSubmit()
	{
		
		 //DisableButtons()
		DateRule=document.aspnetForm.DateFormat.value
		var StrDateCheck=""
	   // alert("DateRule=" + DateRule);
	    
		//************* Visit date ************************
	 
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
			ILang_Id_Check=document.aspnetForm.Lang_id.value;	
	        //alert("ILang_Id_Check=" + ILang_Id_Check);
	
		StrSingleUpload=document.aspnetForm.ctl00$ContentPlaceHolder1$SingleUpload.value
	   // alert("StrSingleUpload=" + StrSingleUpload);
		if (StrSingleUpload=="")
		{
		    alert('<%=vPrompts[4]%>'); 
		    AbleButtons()
			return false;
		}
		StrFileName=Right(StrSingleUpload,4)	
		 //alert("StrFileName=" + StrFileName);
		POS2=StrFileName.indexOf(".")	
		 //alert("POS2=" + POS2);
		if (POS2<0)
		{
				File_Type=StrFileName.toLowerCase()	
		}
		else
		{
				StrFileName2=Right(StrFileName,3)	
				StrFileName2=StrFileName2.toLowerCase()
				File_Type=StrFileName2	
		}
		if (ILang_Id_Check==2)
			{
				/*if ((File_Type!="jpeg")||(File_Type!="jpg")||(File_Type!="git"))
					{
						alert(document.CFPhoto.error_msg[3].value);
						return false;	
					}*/
				if ((File_Type=="jpeg")||(File_Type=="jpg")||(File_Type=="gif"))
					{
					}
				else
					{
						alert('<%=vPrompts[6]%>'); 
						AbleButtons()
						return false;	
					} 
			}
		else
			{		
				if ((File_Type=="jpg")||(File_Type=="jpeg"))
					{
					}
				else
					{
						alert('<%=vPrompts[5]%>'); 
						AbleButtons()
						return false;	
					} 
			}	
		 //alert("File_Typeout=" + File_Type);	
		//************* Time In/Out ************************
	//return false;
	    //   Rotate File
//				today = new Date()
//				//alert("today=" + today);
//				var year = today.getYear()
//				var Month = today.getMonth()+1
//				var Day = today.getDate()
//				var Hour = today.getHours()
//				var Minute = today.getMinutes()
//				var Second = today.getSeconds()
//				var MSecond = today.getMilliseconds();

//				var Job_No=document.aspnetForm.Job_No.value
//				var Wave_No=document.aspnetForm.Wave_No.value
//				var Task_No=document.aspnetForm.Task_No.value
//				var merch_no=document.aspnetForm.Str_Merch_no.value
//				var store_id=document.aspnetForm.store_id.value
//				
//			
//				var Picture_Name="" + Job_No + "" + Wave_No + "" + Task_No + "" + merch_no + "" + store_id + "" + year + "" + Month + "" + Day + "" + Hour + "" + Minute + "" + Second + "" + MSecond + ""	
//				 //alert("MSecond=" + MSecond);
				   var hiddenControl = '<%= JavaFileRotate.ClientID %>';
                   JS_File_Name=document.getElementById(hiddenControl).value;
                   // alert("JS_File_Name=" + JS_File_Name);
				 document.aspnetForm.RotateFileSave.value=JS_File_Name	
				 
				
				// return false;	
			  //*********** Button2 is NEXT
//           var NEXTExists=document.getElementById("ctl00_ContentPlaceHolder1_UploadSinglePhoto");
//           if (NEXTExists!=null)
//           {
//                document.aspnetForm.ctl00$ContentPlaceHolder1$UploadSinglePhoto.disabled=true;  
//            }
		// alert("done");
		//document.aspnetForm.action = "CFTimeValidate.aspx";
		//document.aspnetForm.submit();
		//************************************
		
		
		//************************************
		
	      $find("modalProgress").show();
	     // alert("done");
		return true;	
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

function CollectManagerInfo()
{
    Ret_store_visit=document.aspnetForm.Ret_store_visit.value
   		 Collect_Store_Mgr_Name=document.aspnetForm.Collect_Store_Mgr_Name.value;
		 
		       
	if (Ret_store_visit=="Y")
					{
					if (Collect_Store_Mgr_Name=="Y")
						    {
						            rad_q_Ret_store_visit_Yes=document.aspnetForm.ctl00$ContentPlaceHolder1$rad_q_Ret_store_visit[0].checked;
						            rad_q_Ret_store_visit_No=document.aspnetForm.ctl00$ContentPlaceHolder1$rad_q_Ret_store_visit[1].checked;    
            						 
						            if (rad_q_Ret_store_visit_Yes==true)
						                {
						                     document.aspnetForm.ctl00$ContentPlaceHolder1$txt_Manager_name.disabled=true;
						                     document.aspnetForm.ctl00$ContentPlaceHolder1$txt_Manager_name.value="";
						                }
						            if (rad_q_Ret_store_visit_No==true)
						                {
						                    document.aspnetForm.ctl00$ContentPlaceHolder1$txt_Manager_name.disabled=false;
                						    
						                }
						      }
					} 
}
function Right(str, n)
{
      if (n <= 0)
          return "";
      else if (n > String(str).length)
          return str;
      else
   {
          var iLen = String(str).length;
          return String(str).substring(iLen, iLen - n);
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
<center>
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
                 <asp:Label runat="server" ID="lblprogress"  Text="Please wait..."></asp:Label>    
                </div> 
       
    </asp:Panel>
<!-- END OF PROGRESS BAR -->
<span style="display:none;">
<asp:Button runat="server" ID="dummybtn" />

</span>


 <cc1:ModalPopupExtender ID="modalMessage" runat="server"  
                             TargetControlID="dummybtn"
                             PopupControlID="panelMessage"
                             OkControlID="btnOK"
                             BackgroundCssClass="modalBackground"
                             DropShadow="false" 
                             Y="200"
                             BehaviorID="modalMessage">
    </cc1:ModalPopupExtender>
                            
    <asp:Panel ID="panelMessage" runat="server" style="display:none;background-color:#FFFFFF;border-color:#000000;" CssClass="modalPopup">
            <div class="groupinformationheader">
                <asp:Label ID="LblTitleMessage" runat="server" style="font-size:12px;"></asp:Label>
            </div>
            
            <table style="margin-top:5px; margin-bottom:5px;">
                 <tr>
                     
                     <td style="text-align:left;">
                            <asp:Label ID="LblMessage" runat="server" SkinID="LabelBlackBoldSkin" style="font-size:12px;"></asp:Label>
                     </td>
                 </tr>
            </table>
            
            <asp:Button ID="btnOK" runat="server" Text="Close" /> 
              
    </asp:Panel>

<hr color="dodgerblue" />
 
<asp:Table Width="100%" ID="Table3" runat="server"  HorizontalAlign="Center" BorderWidth="0" bordercolor="dodgerblue">
  <asp:TableRow >
        <asp:TableCell HorizontalAlign="Right" Width="30%" >
               <asp:Label ID="Label2" runat="server" Text="Photo"   CssClass="selectionCriteriaItem"></asp:Label> 
        </asp:TableCell>   
         <asp:TableCell HorizontalAlign="Left" Width="70%">   
               <asp:FileUpload ID="SingleUpload"    Width="50%" runat="server"     />
                
        </asp:TableCell>
    </asp:TableRow>
     <asp:TableRow>
        <asp:TableCell HorizontalAlign="Right" Width="30%" >
                 <asp:Label ID="Label1" runat="server" Text="Photo Date"   CssClass="selectionCriteriaItem"></asp:Label>
        </asp:TableCell>   
         <asp:TableCell HorizontalAlign="Left" Width="70%" >          
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
															                    <asp:TextBox Width="6%"   runat="server"   MaxLength="2"  ID="txt_visitmonth"  ></asp:TextBox> 
															                    <%
                                                                    }
                                                                    if (ArrayDateRule[d].ToUpper() == ("dd").ToUpper())
                                                                    {
															                    %>            
															                    <asp:TextBox Width="6%"  runat="server"   MaxLength="2"  ID="txt_visitday" ></asp:TextBox> 
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
												                            <asp:TextBox Width="7%"  runat="server"  ID="txt_visityear" ></asp:TextBox>
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
<center>
	 
               <asp:Button   OnClientClick="return DoSubmitBack()" ID="GoBack" runat="server" Text="<< Back" CssClass="Button"></asp:Button>
               &nbsp&nbsp
               <asp:Button  OnClientClick="return DoSubmit()" ID="UploadSinglePhoto"     OnClick="Button2_Click"   runat="server" Text="Upload A Photo" ></asp:Button>
			   &nbsp&nbsp
        <br />
		<br />
		
		
 <%
 if (Lang_id ==1)
 {
 %>				 
     <asp:Label ID="Label8" Font-Bold="true" ForeColor="Red" runat="server" Text="The file size limit is 3 MB."  SkinID="LabelBlackSkin"></asp:Label>  
 <%
 }
 else
 {     
 %>  
  <asp:Label ID="Label9" Font-Bold="true" ForeColor="Red" runat="server" Text="The file size limit is 4 MB."  SkinID="LabelBlackSkin"></asp:Label>
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
 <input name="Str_Manager_Title" type="hidden" value="<%=Str_Manager_Title%>" /> 
<input name="Str_txt_Manager_name" type="hidden" value="<%=Str_txt_Manager_name%>" />

<input name="Lang_id" type="hidden" value="<%=Lang_id%>" />
 <input name="RotateFileSave" type="hidden" value=""/>
 <asp:HiddenField ID="savePath" runat="server" value="0" />
<input name="hiddentest" id="hiddentest" type="hidden" runat="server" value=""/>
<input name="FileUploadType" type="hidden" value="S"/>
<input name="Photo_CF_Access" type="hidden" value="<%=Photo_CF_Access%>" /> 
<asp:HiddenField ID="JavaFileRotate" runat="server" value="0" />
<input name="NewScreenPage" type="hidden" value="<%=NewScreenPage%>"/>
<Input type=hidden name="chainstorelstSA" value="<%=chainstorelstSA%>"/>
<Input type=hidden name="selchainstoreSA" value="<%=selchainstoreSA%>"/>
<input name="Str_Sv_Panel_id" type="hidden" value="<%=Str_Sv_Panel_id%>" />
</center>
</asp:Content>

