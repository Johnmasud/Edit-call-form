<%@ Page Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" EnableViewStateMac="false" CodeFile="CFPictureGetMultiFile.aspx.cs" Inherits="CFPictureGetMultiFile" Title="SPAR - Internet Call Form Input" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">



<script type="text/javascript"  language="javascript">
function Load()
{
   // alert("test");
}
function DisableButtons()
	{
		   //*********** Button2 is NEXT
	        var Exists2=document.getElementById("ctl00$ContentPlaceHolder1$Button2");
            if (Exists2!=null)
            {
               document.aspnetForm.ctl00$ContentPlaceHolder1$Button2.disabled=true;  
            }
           var Exists5=document.getElementById("ctl00$ContentPlaceHolder1$Button5");
            if (Exists5!=null)
            {
               document.aspnetForm.ctl00$ContentPlaceHolder1$Button5.disabled=true;  
            }
            var Exists6=document.getElementById("ctl00$ContentPlaceHolder1$Button6");
            if (Exists6!=null)
            {
               document.aspnetForm.ctl00$ContentPlaceHolder1$Button6.disabled=true;  
            }
            var Exists7=document.getElementById("ctl00$ContentPlaceHolder1$Button7");
            if (Exists7!=null)
            {
               document.aspnetForm.ctl00$ContentPlaceHolder1$Button7.disabled=true;  
            }
            
	}	
function AbleButtons()
	{
		   //*********** Button2 is NEXT
	        var Exists2=document.getElementById("ctl00$ContentPlaceHolder1$Button2");
            if (Exists2!=null)
            {
               document.aspnetForm.ctl00$ContentPlaceHolder1$Button2.disabled=false;  
            }
           var Exists5=document.getElementById("ctl00$ContentPlaceHolder1$Button5");
            if (Exists5!=null)
            {
               document.aspnetForm.ctl00$ContentPlaceHolder1$Button5.disabled=false;  
            }
            var Exists6=document.getElementById("ctl00$ContentPlaceHolder1$Button6");
            if (Exists6!=null)
            {
               document.aspnetForm.ctl00$ContentPlaceHolder1$Button6.disabled=false;  
            }
            var Exists7=document.getElementById("ctl00$ContentPlaceHolder1$Button7");
            if (Exists7!=null)
            {
               document.aspnetForm.ctl00$ContentPlaceHolder1$Button7.disabled=false;  
            }
            
	}	
function Select_OnClick() 
{ 
    document.getElementById("UploadCtl").Select(); 
    return false; 
} 
 
function Remove_OnClick() 
{ 
		 FileCheck=document.getElementById("UploadCtl").SelectedFiles.Count 
		//alert("FileCheck=" + FileCheck);
		if (FileCheck==0)
		{
			//alert(document.CFPhoto.error_msg[7].value); 
			return false;
		}
		document.getElementById("UploadCtl").RemoveHighlighted(); 
		return false; 
} 
 
function RemoveAll_OnClick() 
{ 
    document.getElementById("UploadCtl").RemoveAll(); 
    return false; 
} 
 
function Upload_OnClick() 
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
	
							//alert("CorrectDate=" + CorrectDate);
							// put the value in a hidden variable 
							document.aspnetForm.Hidden_date.value=CorrectDate;
							// pass the value to our multilanguage Function
							sys_rule=DateRule
							//alert("year=" +document.TimeValidation.txt_visityear.value);
							//alert("sys_rule=" + sys_rule);
			
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
        
         

        //************* File Upload ************************
         FileCheck=document.getElementById("UploadCtl").SelectedFiles.Count 
		 //alert("FileCheck=" + FileCheck);
		 //v_error_msg(10)
		 
		//UploadCtl.TotalFileSize</FONT> 
		if (FileCheck==0)
		{
			alert('<%=vPrompts[5]%>'); 
			AbleButtons()
			return false;
		}
		if (FileCheck>10)
		{
			alert('<%=vPrompts[8]%>'); 
			AbleButtons()
			return false;
		}
		

		 FileCheck=document.getElementById("UploadCtl").SelectedFiles.Count 
		 //alert("FileCheck=" + FileCheck);
		 //v_error_msg(10)
		 document.getElementById("UploadCtl").Upload();
		
		UploadCtl=document.getElementById("UploadCtl")
		 //alert(UploadCtl.Version) 
		Filetotal=UploadCtl.TotalFileSize 
		 //alert(Filetotal);
		ServerReplyBack=UploadCtl.ServerReply 
		 alert(ServerReplyBack);
		StrNewPhotoName=""
		
		for( i = 1; i <= UploadCtl.SelectedFiles.Count; i++ )
			{
				myFile = UploadCtl.SelectedFiles(i);
				Filesize=myFile.size 
				// alert( myFile.size );
				 //alert("i=" + i);
				 today = new Date()
				// alert("today=" + today);
				var year = today.getYear()
				var Month = today.getMonth()+1
				var Day = today.getDate()
				var Hour = today.getHours()
				var Minute = today.getMinutes()
				var Second = today.getSeconds()
				 
				var Job_No=document.aspnetForm.Job_No.value
				 
				var Wave_No=document.aspnetForm.Wave_No.value
				var Task_No=document.aspnetForm.Task_No.value
				var Merch_no=document.aspnetForm.Str_Merch_no.value
				var store_id=document.aspnetForm.store_id.value
			  // alert("store_id=" + store_id);
			     
				var Picture_Name="" + Job_No + "" + Wave_No + "" + Task_No + "" + Merch_no + "" + store_id + "" + year + "" + Month + "" + Day + "" + Hour + "" + Minute + "" + Second + "" + i + ""	
				  //alert("Job_No2=" + Job_No);
				
				 if (StrNewPhotoName=="") 
					{
						StrNewPhotoName=Picture_Name 
					}
					else
					{
						StrNewPhotoName=StrNewPhotoName + "|"  + Picture_Name
					} 
				 if (Filesize==0)
					{
						alert('<%=vPrompts[7]%>'); 
						AbleButtons()
						return false;
					}				
			}
		  POS=ServerReplyBack.indexOf("StrFileNames=")
			  //alert("POS=" + POS);
			  if (POS<0)
			  {
				        alert('<%=vPrompts[6]%>'); 
				        AbleButtons()
						return false;
			  }
			  POS=POS+13
			   POS2=ServerReplyBack.indexOf("Done")
			 // alert("POS2=" + POS2);
			//POS=eval(POS+1)
			//alert("POS=" + POS);
			// POS2=Client2.length;
			FileNames=ServerReplyBack.substring(POS,POS2)
		   //alert("FileNames=" + FileNames);
		 
		 	 document.aspnetForm.StrOriginalFile.value=FileNames
		 	 document.aspnetForm.RotateFileSave.value=StrNewPhotoName	
		//StrFileNames
            //StrFileNamesLoop=document.aspnetForm.RotateFileSave.value;
             //alert("StrFileNamesLoop=" + StrFileNamesLoop);


	    document.aspnetForm.action = "CFPictureFileDisplay.aspx";
	    document.aspnetForm.submit();
		return false;	
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
            
         </asp:Table>

    </asp:TableCell>
</asp:TableRow> 
</asp:Table>

<hr color="dodgerblue" />
<br />
<center>
<!--
<object id="UploadCtl" style="LEFT: 0px; TOP: 0px"  codebase="/Bin/XUpload.ocx" classid="CLSID:E87F6C8E-16C0-11D3-BEF7-009027438003"  width="540" height="100" enableviewstate="true">
  <param name="MaxFileSize" value="3145728"/> 
  <param name="MaxTotalSize" value="3145728"/>  
  <param name="Server" value="localhost"/> 
  <param name="RegKey" value="zBrxVFSQbVsLhoEIzZduDBu566Tt5kVX8TKbtJ9E6X0Zh9DIQr76R6Rj9SW+2YHFJhayfDnYVn2s"/>
  
   <param name="Script" value="/SMP_callform/CFPictureGetMultiUpload.aspx?Job_No=<%=Job_No%>&Wave_No=<%=Wave_No%>&Task_No=<%=Task_No%>" />
    <!-- Disable Popup menu. All operations are performed with script
    <param name="EnablePopupMenu" value="false" />
    <param name="ShowProgress" value="True"/> 
    <param name="ViewServerReply" value="True"/>
    
    <param name="HtmlForm" value="aspnetForm"/>
    <param name="Filter" value="Images (.jpg)|*.jpg"/> 
</object>
 -->

 <object id="UploadCtl" style="LEFT: 0px; TOP: 0px"  codebase="/callformdotnet/XUpload.ocx" classid="CLSID:E87F6C8E-16C0-11D3-BEF7-009027438003"  width="540" height="100" enableviewstate= "true">
  <param  name="MaxFileSize" value="3145728"/> 
  <param name="MaxTotalSize" value="3145728"/> 
  <param name="MaxFileCount" value="10" /> 
  <param name="Server" value="<%=StrServerName%>"/>
  <param name="Script" value="/callformdotnet/CFPictureGetMultiUpload.aspx?Lang_id=<%=Lang_id%>"/>
  <param name="RegKey" value="zBrxVFSQbVsLhoEIzZduDBu566Tt5kVX8TKbtJ9E6X0Zh9DIQr76R6Rj9SW+2YHFJhayfDnYVn2s"/>
  <param name="ViewServerReply" value="False"/> 
  <param name="ShowProgress" value="True"/> 
  <param name="Filter" value="Images (.jpg)|*.jpg"/> 
 </object>
 
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

 <asp:Button   OnClientClick="return Select_OnClick()" ID="Button2"  runat="server" Text="Select Files" CssClass="Button"></asp:Button>
 &nbsp&nbsp
 <asp:Button   OnClientClick="return Remove_OnClick()" ID="Button5"  runat="server" Text="Remove File" CssClass="Button"></asp:Button>
 &nbsp&nbsp
 <asp:Button   OnClientClick="return RemoveAll_OnClick()" ID="Button6"  runat="server" Text="Remove All Files" CssClass="Button"></asp:Button>
 &nbsp&nbsp
 <asp:Button    ID="Button7"  runat="server" Text="Save and Upload Files" CssClass="Button"  OnClientClick="return Upload_OnClick()"></asp:Button>
 <br />
<asp:Label ID="Label2" Font-Bold="true" ForeColor="Red" runat="server" Text="The maximum number of files you can upload at one time is 10."  SkinID="LabelBlackSkin"></asp:Label>
 <br />
<asp:Label ID="Label8" Font-Bold="true" ForeColor="Red" runat="server" Text="The combined file size limit is 3 MB."  SkinID="LabelBlackSkin"></asp:Label>



 </center>
 

<input name="Hidden_date" type="hidden" value="" />	
<input name="Visit_Date" type="hidden" value="" />	
<input name="txt_midnight" type="hidden" value="" />
<input name="Job_No" type="hidden" value="<%=Job_No%>" />
<input name="Wave_No" type="hidden" value="<%=Wave_No%>" />
<input name="Task_No" type="hidden" value="<%=Task_No%>" />
<input name="Task_Desc" type="hidden" value="<%=Task_Desc%>" />
<input name="Task_Addtl_Desc" type="hidden" value="<%=Task_Addtl_Desc%>" />


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

</asp:Content>

