<%@ Page Language="C#"  MasterPageFile="~/MasterPage.master"  Title="SPAR - Internet Call Form Input" EnableViewStateMac="false" AutoEventWireup="true" CodeFile="CFJWTInputs.aspx.cs" 
Inherits="CFJWTInputs"  %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
<cc1:ScriptManager ID="ScriptManager1" runat="server" AsyncPostBackTimeout="600">
 </cc1:ScriptManager>


<script type="text/javascript" language="javascript1.1">
function Load()
	{
	    StrMerch_check=document.aspnetForm.ctl00$ContentPlaceHolder1$butStatus1.value;
	    // alert("StrMerch_check=" + StrMerch_check);
	    if (trim(StrMerch_check)!="")
	    {
	      Loadtrackingpopdiv('192','100')
	    }
	}
function DisableButtons()
	{
	     //******* Disabled the buttons
		//ctl00$ContentPlaceHolder1$Button2" value="Next >>"
		document.aspnetForm.ctl00$ContentPlaceHolder1$Submit.disabled=true;
	}
function AbleButtons()
	{
	     //ctl00$ContentPlaceHolder1$Button2" value="Next >>"
		document.aspnetForm.ctl00$ContentPlaceHolder1$Submit.disabled=false;
	}
	function validate()
	 {
	    //**************** Disabled the next button 
	     //DisableButtons()
	      
	    StrConfirm="N"   
	 
		if ((document.aspnetForm.ctl00$ContentPlaceHolder1$Txt_merch_no.value=="") || (isNaN(document.aspnetForm.ctl00$ContentPlaceHolder1$Txt_merch_no.value)) || (eval(document.aspnetForm.ctl00$ContentPlaceHolder1$Txt_merch_no.value)==0))
		 {
			 alert('<%=vPrompts[0]%>');
			 AbleButtons()
			 return false;
		 }
		if ((document.aspnetForm.ctl00$ContentPlaceHolder1$txt_jobno.value=="") || (isNaN(document.aspnetForm.ctl00$ContentPlaceHolder1$txt_jobno.value)) || (eval(document.aspnetForm.ctl00$ContentPlaceHolder1$txt_jobno.value)==0))
		 {
			alert('<%=vPrompts[1]%>');
			AbleButtons()
			return false;
		 }
		var job_no=document.aspnetForm.ctl00$ContentPlaceHolder1$txt_jobno.value;
		var wave_no=document.aspnetForm.ctl00$ContentPlaceHolder1$txt_waveno.value;
		
		if ((document.aspnetForm.ctl00$ContentPlaceHolder1$txt_waveno.value=="") || (isNaN(document.aspnetForm.ctl00$ContentPlaceHolder1$txt_waveno.value)) || (eval(document.aspnetForm.ctl00$ContentPlaceHolder1$txt_waveno.value)==0))
		 {
			alert('<%=vPrompts[2]%>');
			AbleButtons()
			return false;
		 }
		if ((document.aspnetForm.ctl00$ContentPlaceHolder1$txt_taskno.value=="") || (isNaN(document.aspnetForm.ctl00$ContentPlaceHolder1$txt_taskno.value)) || (eval(document.aspnetForm.ctl00$ContentPlaceHolder1$txt_taskno.value)==0))
			{
				alert('<%=vPrompts[3]%>');
				AbleButtons()
				return false;
			}
		else
		
			{
				TaskValue=document.aspnetForm.ctl00$ContentPlaceHolder1$txt_taskno.value
				//TaskLen=TaskValue.length
				//if (TaskLen>2)
				  if(TaskValue>255)
					{
						alert("" + TaskValue + " " + '<%=vPrompts[7]%>'  + "")
						AbleButtons()
						return false;
					}
			}
		if ((document.aspnetForm.ctl00$ContentPlaceHolder1$txt_chainno.value=="") || (isNaN(document.aspnetForm.ctl00$ContentPlaceHolder1$txt_chainno.value)) || (eval(document.aspnetForm.ctl00$ContentPlaceHolder1$txt_chainno.value)==0))
		 {
			alert('<%=vPrompts[4]%>');
			AbleButtons()
			return false;
		 }
		if ((document.aspnetForm.ctl00$ContentPlaceHolder1$txt_storeno.value=="") || (isNaN(document.aspnetForm.ctl00$ContentPlaceHolder1$txt_storeno.value)) || (eval(document.aspnetForm.ctl00$ContentPlaceHolder1$txt_storeno.value)==0))
		 {
			alert('<%=vPrompts[6]%>');
			AbleButtons()
			return false;
		 }
		
		user_id=document.aspnetForm.user_id.value;
		//alert("user_id=" + user_id);
		Email_Active_Flag=document.aspnetForm.Email_Active_Flag.value
		
		ILang_Id=document.aspnetForm.ILang_Id.value
		if (user_id=="")
		{
		//alert("Email_Active_Flag=" + Email_Active_Flag);
							if (ILang_Id!="4") 
								{
												if (Email_Active_Flag=="Y") 
													{
																emailCheck=document.aspnetForm.ctl00$ContentPlaceHolder1$txt_EmailAdd.value
																//alert("emailCheck=" + emailCheck);
																if (emailCheck!="") 
																	{ 
																			var emailID=document.aspnetForm.ctl00$ContentPlaceHolder1$txt_EmailAdd
																			
																			if (echeck(emailID.value)==false)
																				{
																					//alert("emailIDvalue=" + emailID.value);
																					emailID.focus()
																					AbleButtons()
																					return false;
																				}
																			
																	}
																if (emailCheck=="") 
																	{ 
	
																		//document.QGrid.Done_Call_Form_Next.value ==true
																		alert('<%=vPrompts[10]%>');
																		var emailID=document.aspnetForm.ctl00$ContentPlaceHolder1$txt_EmailAdd
																		emailID.focus()
																		AbleButtons()
																		return false						
																	}
													}
												if (Email_Active_Flag=="N") 
													{
															emailCheck=document.aspnetForm.txt_EmailAdd.value
															if (emailCheck!="") 
																		{ 
																				var emailID=document.aspnetForm.ctl00$ContentPlaceHolder1$txt_EmailAdd
																				
																				if (echeck(emailID.value)==false)
																					{
																						//alert("emailIDvalue=" + emailID.value);
																						emailID.focus()
																						AbleButtons()
																						return false;
																					}
																				
																		}
													}
											
								}//ending ILang_Id is not equal to 4
		}
		//alert("good");
		Collect_Mobile_Email=document.aspnetForm.Collect_Mobile_Email.value
	   // alert("Collect_Mobile_Email=" + Collect_Mobile_Email);
		if (Collect_Mobile_Email=="Yes") 
		{	
				Mobile_Email_Check=document.aspnetForm.ctl00$ContentPlaceHolder1$txt_Mobile_Email.value
				 //alert("Mobile_Email_Check=" + Mobile_Email_Check);
				if (Mobile_Email_Check!="") 
					{ 
							var emailID=document.aspnetForm.ctl00$ContentPlaceHolder1$txt_Mobile_Email
							//alert("Mobile_test=" + emailID);
							
							if (MobileEcheck(emailID.value)==false)
								{
								//emailID.value=""
								emailID.focus()
								AbleButtons()
								return false
								}
							
					}	 
		}
        if (user_id=="")
		{
		                    if (ILang_Id=="1") 
		                     {
		                                                document.aspnetForm.Hidden_PhoneStatus.value=0;                
		                                                Hidden_Cellphone_Old=document.aspnetForm.Hidden_Cellphone_Old.value
		                                               // alert("Hidden_Cellphone_Old=" + Hidden_Cellphone_Old); 
						                                Hidden_CarrierId_Old=document.aspnetForm.Hidden_CarrierId_Old.value
		                                                //alert("Hidden_CarrierId_Old=" + Hidden_CarrierId_Old);     
						                                 DDCellProvider=document.aspnetForm.ctl00$ContentPlaceHolder1$DDCellProvider.value
		                                                 
						                                
		                                                txt_Phone1=document.aspnetForm.ctl00$ContentPlaceHolder1$txt_Phone1.value
		                                                //alert("txt_Phone1=" + txt_Phone1);
		                                                txt_Phone2=document.aspnetForm.ctl00$ContentPlaceHolder1$txt_Phone2.value
		                                                //alert("txt_Phone2=" + txt_Phone2);
		                                                txt_Phone3=document.aspnetForm.ctl00$ContentPlaceHolder1$txt_Phone3.value
		                                                //alert("txt_Phone3=" + txt_Phone3);
		                                                if ((txt_Phone1!="")||(txt_Phone2!="")||(txt_Phone3!="")) 
		                                                {
		                                                     if ((txt_Phone1=="")||(txt_Phone2=="")||(txt_Phone3=="")) 
		                                                        {
		                                                            //alert(document.aspnetForm.error_msg[12].value); 
		                                                            alert('<%=vPrompts[14]%>');
		                                                            AbleButtons()
		                                                            return false;
		                                                        }
		                                                      if (isNaN(txt_Phone1)||isNaN(txt_Phone2)||isNaN(txt_Phone3))
		                                                        {
		                                                             alert('<%=vPrompts[14]%>');
		                                                             AbleButtons()
		                                                             return false;
		                                                        }   
		                                                     if ((txt_Phone1.length<3)||(txt_Phone2.length<3)||(txt_Phone3.length<4))
		                                                        {
		                                                             alert('<%=vPrompts[14]%>');
		                                                             AbleButtons()
		                                                             return false;
		                                                        }
		                                                }   
                    		                             if (Hidden_Cellphone_Old!="") 
                    		                             {
                    		                             
                    		                                    if ((txt_Phone1=="")||(txt_Phone2=="")||(txt_Phone3=="")) 
		                                                            {
		                                                                //alert(document.aspnetForm.error_msg[22].value); 
		                                                                alert('<%=vPrompts[24]%>');
		                                                                AbleButtons()
		                                                                return false;
		                                                            }  
		                                                            NewCellPhone="" + txt_Phone1 + "" + txt_Phone2 + "" + txt_Phone3 + ""
		                                                           //alert(NewCellPhone);  
		                                                           
		                                                        if (Hidden_Cellphone_Old!=NewCellPhone)
                    		                                        {
                    		                                            StrConfirm="B" 
                    		                                             //alert("same phone");  
                    		                                        }  
                    		                             }
                    		                            if (Hidden_CarrierId_Old==0)
                    		                            {
                    		                                    
                    		                                     if (DDCellProvider!="0")
                    		                                     {
                    		                                     
                    		                                                    if ((txt_Phone1=="")||(txt_Phone2=="")||(txt_Phone3=="")) 
		                                                                            {
		                                                                                //alert(document.aspnetForm.error_msg[22].value); 
		                                                                                alert('<%=vPrompts[24]%>');
		                                                                                AbleButtons()
		                                                                                return false;
		                                                                            }   
                    		                                                    StrConfirm="A"   
                    		                                     }
                    		                            }
                    		                            
                    		                            if (Hidden_CarrierId_Old>0)
                    		                            {
                    		                                    if (Hidden_CarrierId_Old!=DDCellProvider)
                    		                                    {
                    		                                        StrConfirm="A" 
                    		                                    }
		                                                }
		                                                if (DDCellProvider=="00")
                    		                                     {
                    		                                     //alert("CellProvider=" + DDCellProvider);
                    		                                                    if ((txt_Phone1=="")||(txt_Phone2=="")||(txt_Phone3=="")) 
		                                                                            {
		                                                                                //alert(document.aspnetForm.error_msg[22].value); 
		                                                                                alert('<%=vPrompts[24]%>');
		                                                                                AbleButtons()
		                                                                                return false;
		                                                                            }   
                    		                                                    StrConfirm="X"   
                    		                                     }
 
		                       }//if (ILang_Id=="1") 
		 }//if (user_id=="")
		//*************************		
		
		//******* Message for providing provider 
	   if (StrConfirm=="A")
	     {  
                        var ok=confirm("<%=vPrompts[15]%> \n <%=vPrompts[16]%> \n <%=vPrompts[17]%> \n <%=vPrompts[18]%>")
                        if (ok)
                            {
                                 document.aspnetForm.Hidden_PhoneStatus.value=1;
                                 strPhoneStatus=document.aspnetForm.Hidden_PhoneStatus.value;
                                //alert("strPhoneStatus=" + strPhoneStatus);
                            }
                        else
                            {
                                document.aspnetForm.Hidden_PhoneStatus.value=0;
                                 strPhoneStatus=document.aspnetForm.Hidden_PhoneStatus.value;
                                 //alert("strPhoneStatus=" + strPhoneStatus);
                            }
           }	
		  if (StrConfirm=="X")
		 {  
                        var ok=confirm("<%=vPrompts[22]%> \n <%=vPrompts[23]%>")
                        if (ok)
                            {
                                 document.aspnetForm.Hidden_PhoneStatus.value=2;
                                 strPhoneStatus=document.aspnetForm.Hidden_PhoneStatus.value;
                                //alert("strPhoneStatus=" + strPhoneStatus);
                            }
                        else
                            {
                                document.aspnetForm.Hidden_PhoneStatus.value=0;
                                 strPhoneStatus=document.aspnetForm.Hidden_PhoneStatus.value;
                                 //alert("strPhoneStatus=" + strPhoneStatus);
                                 AbleButtons()
                                 return false;
                            }
           }	
		 if (StrConfirm=="B")
		 {  
                        var ok=confirm(" <%=vPrompts[19]%> \n <%=vPrompts[20]%> \n <%=vPrompts[21]%>")
                        if (ok)
                            {
                                 document.aspnetForm.Hidden_PhoneStatus.value=1;
                                 strPhoneStatus=document.aspnetForm.Hidden_PhoneStatus.value;
                                //alert("strPhoneStatus=" + strPhoneStatus);
                            }
                        else
                            {
                                document.aspnetForm.Hidden_PhoneStatus.value=3;
                                 strPhoneStatus=document.aspnetForm.Hidden_PhoneStatus.value;
                                 //alert("strPhoneStatus=" + strPhoneStatus);
                            }
           }	
		//return false;
		document.aspnetForm.ctl00$ContentPlaceHolder1$butStatus1.value="";
//		document.aspnetForm.action  = "CFJWTValidateSV.aspx";
//		document.aspnetForm.submit();
        $find("modalProgress").show();	
		return true;
}

function ValuesClear()
{
	document.aspnetForm.ctl00$ContentPlaceHolder1$txt_jobno.value=""
	document.aspnetForm.ctl00$ContentPlaceHolder1$txt_waveno.value=""
	document.aspnetForm.ctl00$ContentPlaceHolder1$txt_taskno.value=""	
	document.aspnetForm.ctl00$ContentPlaceHolder1$txt_chainno.value=""
	document.aspnetForm.ctl00$ContentPlaceHolder1$txt_storeno.value=""
    return false;
}
function echeck(str) {

			str=trim(str)
		var at="@"
		var dot="."
		var lat=str.indexOf(at)
		var lstr=str.length
		var ldot=str.indexOf(dot)
		if (str.indexOf(at)==-1){
		  //alert("Invalid E-mail ID")
		  alert('<%=vPrompts[8]%>');
		   return false
		}
	
		if (str.indexOf(at)==-1 || str.indexOf(at)==0 || str.indexOf(at)==lstr){
		   //alert("Invalid E-mail ID")
		   alert('<%=vPrompts[8]%>');
		   return false
		}

		if (str.indexOf(dot)==-1 || str.indexOf(dot)==0 || str.indexOf(dot)==lstr){
		    //alert("Invalid E-mail ID")
		    alert(document.aspnetForm.error_msg[8].value)
		    return false
		}

		 if (str.indexOf(at,(lat+1))!=-1){
		   //alert("Invalid E-mail ID")
		   alert('<%=vPrompts[8]%>');
		    return false
		 }

		 if (str.substring(lat-1,lat)==dot || str.substring(lat+1,lat+2)==dot){
		    //alert("Invalid E-mail ID")
		    alert('<%=vPrompts[8]%>');
		    return false
		 }

		 if (str.indexOf(dot,(lat+2))==-1){
		    //alert("Invalid E-mail ID")
		    alert('<%=vPrompts[8]%>');
		    return false
		 }
		
		 if (str.indexOf(" ")!=-1){
		    //alert("Invalid E-mail ID")
		    alert('<%=vPrompts[8]%>');
		    return false
		 }

 		 return true					
	}
	
function GoToStoreSearch()
	{
	
				if ((document.aspnetForm.ctl00$ContentPlaceHolder1$Txt_merch_no.value=="") || (isNaN(document.aspnetForm.ctl00$ContentPlaceHolder1$Txt_merch_no.value)) || (eval(document.aspnetForm.ctl00$ContentPlaceHolder1$Txt_merch_no.value)==0))
				 {
					alert('<%=vPrompts[0]%>');
					return false;
				 }
				if ((document.aspnetForm.ctl00$ContentPlaceHolder1$txt_jobno.value=="") || (isNaN(document.aspnetForm.ctl00$ContentPlaceHolder1$txt_jobno.value)) || (eval(document.aspnetForm.ctl00$ContentPlaceHolder1$txt_jobno.value)==0))
				 {
					alert('<%=vPrompts[1]%>');
					return false;
				 }

				var job_no=document.aspnetForm.ctl00$ContentPlaceHolder1$txt_jobno.value;
				var wave_no=document.aspnetForm.ctl00$ContentPlaceHolder1$txt_waveno.value;
	
		
				if ((document.aspnetForm.ctl00$ContentPlaceHolder1$txt_waveno.value=="") || (isNaN(document.aspnetForm.ctl00$ContentPlaceHolder1$txt_waveno.value)) || (eval(document.aspnetForm.ctl00$ContentPlaceHolder1$txt_waveno.value)==0))
				 {
					alert('<%=vPrompts[2]%>');
					return false;
				 }
				if ((document.aspnetForm.ctl00$ContentPlaceHolder1$txt_taskno.value=="") || (isNaN(document.aspnetForm.ctl00$ContentPlaceHolder1$txt_taskno.value)) || (eval(document.aspnetForm.ctl00$ContentPlaceHolder1$txt_taskno.value)==0))
				 {
					alert('<%=vPrompts[3]%>');
					return false;
				 }
				
				job_no=document.aspnetForm.ctl00$ContentPlaceHolder1$txt_jobno.value;
				wave_no=document.aspnetForm.ctl00$ContentPlaceHolder1$txt_waveno.value;
				task_no=document.aspnetForm.ctl00$ContentPlaceHolder1$txt_taskno.value;
				
			document.aspnetForm.action = "CFStoreSearchSV.aspx";
			document.aspnetForm.submit();
			return false;	
			
	}
function Store_validation()
{
            	if ((document.aspnetForm.ctl00$ContentPlaceHolder1$Txt_merch_no.value=="") || (isNaN(document.aspnetForm.ctl00$ContentPlaceHolder1$Txt_merch_no.value)) || (eval(document.aspnetForm.ctl00$ContentPlaceHolder1$Txt_merch_no.value)==0))
				 {
					alert('<%=vPrompts[0]%>');
					return false;
				 }
                document.aspnetForm.action = "CFMerchReportWork.aspx";
			    document.aspnetForm.submit();
			    return false;	
}	
function LTrim(value)
	{
		while(value.charAt(0) == " ")
		{
		  value = value.substring(1,value.length);
		}
		return(value);
	} // End LTrim

function RTrim(value)
	{
		while(value.charAt(value.length - 1) == " ")
		{
		  value = value.substring(0,value.length - 1);
		}
		return(value);
	} // End RTrim

function trim(value) 
	{ 
		var data;
		data = LTrim(value);
		data = RTrim(data);
		return data;
	}//End trim	
function MobileEcheck(str) {

		var at="@"
		var dot="."
		var lat=str.indexOf(at)
		var lstr=str.length
		var ldot=str.indexOf(dot)
		if (str.indexOf(at)==-1){
		  //alert("Invalid E-mail ID")
		  alert('<%=vPrompts[11]%>');
		   return false
		}

		if (str.indexOf(at)==-1 || str.indexOf(at)==0 || str.indexOf(at)==lstr){
		   //alert("Invalid E-mail ID")
		  alert('<%=vPrompts[11]%>');
		   return false
		}

		if (str.indexOf(dot)==-1 || str.indexOf(dot)==0 || str.indexOf(dot)==lstr){
		    //alert("Invalid E-mail ID")
		    alert('<%=vPrompts[11]%>');
		    return false
		}

		 if (str.indexOf(at,(lat+1))!=-1){
		   //alert("Invalid E-mail ID")
		   alert('<%=vPrompts[11]%>');
		    return false
		 }

		 if (str.substring(lat-1,lat)==dot || str.substring(lat+1,lat+2)==dot){
		    //alert("Invalid E-mail ID")
		    alert('<%=vPrompts[11]%>');
		    return false
		 }

		 if (str.indexOf(dot,(lat+2))==-1){
		    //alert("Invalid E-mail ID")
		    alert('<%=vPrompts[11]%>');
		    return false
		 }
		
		 if (str.indexOf(" ")!=-1){
		    //alert("Invalid E-mail ID")
		  alert('<%=vPrompts[11]%>');
		    return false
		 }

 		 return true					
	}
	
//************************ Pop Up ****************************
function Storetrackingpopdiv(w, h) 
{
     strojhn=document.aspnetForm.ctl00$ContentPlaceHolder1$Merch_JWT_Info.length;
    //alert("strojhn=" + strojhn);
    
    if ((document.aspnetForm.ctl00$ContentPlaceHolder1$Txt_merch_no.value=="") || (isNaN(document.aspnetForm.ctl00$ContentPlaceHolder1$Txt_merch_no.value)) || (eval(document.aspnetForm.ctl00$ContentPlaceHolder1$Txt_merch_no.value)==0))
	 {
		alert('<%=vPrompts[0]%>');
		return false;
	 }
	 
	document.aspnetForm.ctl00$ContentPlaceHolder1$butStatus1.value="1";  
	Merch_JWT_menu=document.aspnetForm.ctl00$ContentPlaceHolder1$Merch_JWT_Info.value;
	//alert("Merch_JWT_menu=" + Merch_JWT_menu);
	 TextBox_MerchNo=document.aspnetForm.ctl00$ContentPlaceHolder1$Txt_merch_no.value; 
    // alert("Search_Merch_no=" + TextBox_MerchNo);
     StrMerch_check=document.aspnetForm.Merch_no_check.value; 
      // alert("StrMerch_check=" + StrMerch_check);      
    if (trim(TextBox_MerchNo)==trim(StrMerch_check)) 
    {
        Merch_JWT_menu="No Refresh";
    }
    else
    {
        Merch_JWT_menu="No Data Found";
    }    
            
	if (Merch_JWT_menu=="No Data Found")
    {
           
             
            //Str_Merch_no
             var objMyCtrl = document.getElementById("ITS_MyControl_FullPageDiv");
                objMyCtrl.style.visibility = "hidden";
                
              var popUp = document.getElementById("JWTCS_Info_POPup");
              popUp.style.visibility = "hidden";
  
            document.aspnetForm.action = "CFJWTInputs.aspx";
			document.aspnetForm.submit();
			return false;	
    }
    else
    {
             var objMyCtrl = document.getElementById("ITS_MyControl_FullPageDiv");
                 objMyCtrl.style.visibility = "visible";
                
                var popUp = document.getElementById("JWTCS_Info_POPup");
                var ScrollTop = document.body.scrollTop;
                if (ScrollTop == 0) {
                    if (window.pageYOffset)
                        ScrollTop = window.pageYOffset;
                    else
                        ScrollTop = (document.body.parentElement) ? document.body.parentElement.scrollTop : 0;
                }

                //popUp.style.top = ScrollTop + 50; //"200px";
                popUp.style.top = "10%"; 
                popUp.style.left = "10%";
                //popUp.style.width = w + "px";
                //popUp.style.width =popUp.style.width.substr(0,popUp.style.width.indexOf("px"));
               popUp.style.height = h + "px";
                
                //Test document.getElementById("divName").innerHTML.length;
                
                
                        var popUpMenuWidth=document.getElementById("ctl00_ContentPlaceHolder1_Merch_JWT_Info").clientWidth;
                       
                       // alert("popUpMenuWidth=" + popUpMenuWidth); 
                       // popUpMenuWidth="1385"
                     //var popUpWidth=document.getElementById("JWTCS_Info_POPup").clientWidth;
                       
                       //alert("popUpWidth=" + popUpWidth); 
                        
                          var windowWidth = document.aspnetForm.clientWidth;  
                        // alert("windowWidth=" + windowWidth);  
                           if (windowWidth==0)  
                        {
                            var windowWidth = document.body.clientWidth;  
                           // alert("windowWidth=" + windowWidth);  
                       }
                       // alert("windowWidth=" + windowWidth);  
                         
                       // var popUpLeft = ((windowWidth - popUpWidth) / 2); 
                          var popUpLeft = (Math.floor((windowWidth - popUpMenuWidth) / 2)).toString() + "px";  
                        // alert("popUpLeft=" + popUpLeft);     
                          var popUpLeftCheck = (Math.floor((windowWidth - popUpMenuWidth) / 2)).toString();  
                        //alert("popUpLeftCheck=" + popUpLeft);  
                       //  popUpLeftCheck="1"
                          MenuWidth= parseInt(popUpLeftCheck)+ parseInt(popUpMenuWidth);
                         // alert("MenuWidth=" + MenuWidth); 
                            
                        if (popUpLeftCheck>0)
                        {
                                popUp.style.left=popUpLeft;
                                
                               if (MenuWidth>=windowWidth)
                                {
                                     windowWidth=windowWidth-50;
                                     popUp.style.width=windowWidth+ "px";
                                     //document.getElementById("Bot_TD").setAttribute("class", "Button_Align");
                                     // document.getElementById('Bot_TD').style.cssText = 'text-align: left;' 
                                     //alert("MenuWidth>=windowWidth")
                                     document.getElementById("ctl00_ContentPlaceHolder1_Merch_JWT_Info").style.width=windowWidth;

                                }
                           //  alert("normal")
                             
                        }
                        else
                        { 
                              windowWidth=windowWidth-50;
                              popUp.style.left = "2%";
                              popUp.style.width=windowWidth+ "px";
                              //document.getElementById("Bot_TD").setAttribute("class", "Button_Align");
                             // document.getElementById('Bot_TD').style.cssText = 'text-align: left;' 
                             //alert("5percent")
                             document.getElementById("ctl00_ContentPlaceHolder1_Merch_JWT_Info").style.width=windowWidth;

                        }

                //End test
//                   var windowHeight = document.body.offsetHeight;   
//                   var windowWidth = document.body.offsetWidth;   
//                   var popUpWidth = popUp.style.width.substr(0, popUp.style.width.indexOf("px"));   
//                   var popUpHeight = popUp.style.height.substr(0,popUp.style.height.indexOf("px")); 
//                   popUp.style.left = (Math.floor((windowWidth - popUpWidth) / 2)).toString() + "px";


                popUp.style.visibility = "visible";
    }
   
     
}
function hidePopup()
{
 var objMyCtrl = document.getElementById("ITS_MyControl_FullPageDiv");
    objMyCtrl.style.visibility = "hidden";
    
  var popUp = document.getElementById("JWTCS_Info_POPup");
  popUp.style.visibility = "hidden";
  return false;
}
function SavePopup()
{

        user_id=document.aspnetForm.user_id.value;
		//alert("user_id=" + user_id);
		Email_Active_Flag=document.aspnetForm.Email_Active_Flag.value;
		ILang_Id=document.aspnetForm.ILang_Id.value;
		
        Collect_MerchPOPupinfo=document.aspnetForm.ctl00$ContentPlaceHolder1$Merch_JWT_Info.value;
       //Collect_MerchPOPCheck=RemoveSpaces(Collect_MerchPOPupinfo) 
        
        //alert("Collecee" + Collect_MerchPOPCheck + "HH");
        
       if (trim(Collect_MerchPOPupinfo)=="- - Select Job/Wave/Task/Chain/Store - -")                                    
       {
            //alert("good job") 
            return false;        
       }
    
        //alert("Collect_MerchPOPupinfo=" + Collect_MerchPOPupinfo);
        ArrayEleList = Collect_MerchPOPupinfo.split("/");
		 //alert("ArrayEleList=" + ArrayEleList);
		arraylength = ArrayEleList.length
	    //alert("arraylength=" + arraylength) 
		arraylength=eval(arraylength)

        //******** Job no
             Ele_Jobno = ArrayEleList[0].valueOf()
            // alert("Ele_Jobno=" + Ele_Jobno) 
             if (isNaN(Ele_Jobno)==true)
             {
                   return false;   
             }
            var JobExists=document.getElementById("ctl00_ContentPlaceHolder1_txt_jobno");
            //alert("JobExists=" + JobExists) 
            if (JobExists!=null)
            {
               document.aspnetForm.ctl00$ContentPlaceHolder1$txt_jobno.value=Ele_Jobno ;
            }
       //********wave no
             Ele_waveno = ArrayEleList[1].valueOf()
            // alert("Ele_waveno=" + Ele_waveno) 
        
            var waveExists=document.getElementById("ctl00_ContentPlaceHolder1_txt_waveno");
            //alert("waveExists=" + waveExists) 
            if (waveExists!=null)
            {
               document.aspnetForm.ctl00$ContentPlaceHolder1$txt_waveno.value=Ele_waveno ;
            }  
       //********Task no
             Ele_Task = ArrayEleList[2].valueOf()
            // alert("Ele_Task=" + Ele_Task) 
        
            var TaskExists=document.getElementById("ctl00_ContentPlaceHolder1_txt_taskno");
            //alert("TaskExists=" + TaskExists) 
            if (TaskExists!=null)
            {
               document.aspnetForm.ctl00$ContentPlaceHolder1$txt_taskno.value=Ele_Task ;
            }
       //********Chain no
             Ele_chainno = ArrayEleList[3].valueOf()
             //alert("Ele_chainno=" + Ele_chainno) 
        
            var chainExists=document.getElementById("ctl00_ContentPlaceHolder1_txt_chainno");
           // alert("chainExists=" + chainExists) 
            if (chainExists!=null)
            {
               document.aspnetForm.ctl00$ContentPlaceHolder1$txt_chainno.value=Ele_chainno ;
            }   
       //********Store no
             Ele_storeno = ArrayEleList[4].valueOf()
             //alert("Ele_storeno=" + Ele_storeno) 
        
            var storeExists=document.getElementById("ctl00_ContentPlaceHolder1_txt_storeno");
            //alert("storeExists=" + storeExists) 
            if (storeExists!=null)
            {
               document.aspnetForm.ctl00$ContentPlaceHolder1$txt_storeno.value=Ele_storeno ;
            }   
          //********Email address
            // Ele_Email_add= ArrayEleList[5].valueOf()
            // alert("Ele_Email_add=" + Ele_Email_add) 
        
//            var EmailExists=document.getElementById("ctl00_ContentPlaceHolder1_txt_EmailAdd");
//           // alert("EmailExists=" + EmailExists) 
//            if (EmailExists!=null)
//            {
//               document.aspnetForm.ctl00$ContentPlaceHolder1$txt_EmailAdd.value=Ele_Email_add ;
//            }      
//            if (user_id=="")
//		    {
//                if (ILang_Id=="1") 
//                 {
//                              //********Phone number
//                                 Ele_Phone_no= ArrayEleList[6].valueOf()
//                                 alert("Ele_Phone_no=" + Ele_Phone_no) 
//                                 AreaCode=Ele_Phone_no.substring(0,3)
//                                 alert("AreaCode=" + AreaCode)  
//                                 ThreeCode=Ele_Phone_no.substring(3,6)
//                                 alert("ThreeCode=" + ThreeCode) 
//                                 FourCode=Ele_Phone_no.substring(6,10)
//                                 alert("FourCode=" + FourCode) 
//                                 
//                                var Phone1Exists=document.getElementById("ctl00_ContentPlaceHolder1_txt_Phone1");
//                                alert("Phone1Exists=" + Phone1Exists) 
//                                if (Phone1Exists!=null)
//                                {
//                                   document.aspnetForm.ctl00$ContentPlaceHolder1$txt_Phone1.value=AreaCode ;
//                                }     
//                                var Phone2Exists=document.getElementById("ctl00_ContentPlaceHolder1_txt_Phone2");
//                                alert("Phone2Exists=" + Phone1Exists) 
//                                if (Phone2Exists!=null)
//                                {
//                                   document.aspnetForm.ctl00$ContentPlaceHolder1$txt_Phone2.value=ThreeCode ;
//                                }     
//                                var Phone3Exists=document.getElementById("ctl00_ContentPlaceHolder1_txt_Phone3");
//                                alert("Phone3Exists=" + Phone3Exists) 
//                                if (Phone3Exists!=null)
//                                {
//                                   document.aspnetForm.ctl00$ContentPlaceHolder1$txt_Phone3.value=FourCode ;
//                                }     
//                                 
//                 }
//            }
            
    var popUp = document.getElementById("JWTCS_Info_POPup");
        popUp.style.visibility = "hidden";
   var objMyCtrl = document.getElementById("ITS_MyControl_FullPageDiv");
       objMyCtrl.style.visibility = "hidden";
    
  return false;
}
function Loadtrackingpopdiv(w, h) 
{
                 var objMyCtrl = document.getElementById("ITS_MyControl_FullPageDiv");
                 objMyCtrl.style.visibility = "visible";
                
                var popUp = document.getElementById("JWTCS_Info_POPup");
                var ScrollTop = document.body.scrollTop;
                if (ScrollTop == 0) 
                {
                    if (window.pageYOffset)
                        ScrollTop = window.pageYOffset;
                    else
                        ScrollTop = (document.body.parentElement) ? document.body.parentElement.scrollTop : 0;
                }

                //popUp.style.top = ScrollTop + 50; //"200px";
                   popUp.style.top = "10%"; 
                   popUp.style.left = "10%";
                  // popUp.style.width = w + "px";
                 //   popUp.style.width =popUp.style.width.substr(0,popUp.style.width.indexOf("px"));
                  popUp.style.height = h + "px";
                
             //   popUp.style.width="300px"
                        var BC_Td = document.getElementById("Bot_TD");
                 //****** Menu Width
                          var popUpMenuWidth=document.getElementById("ctl00_ContentPlaceHolder1_Merch_JWT_Info").clientWidth;
                        //alert("popUpMenuWidth=" + popUpMenuWidth); 
                         // popUpMenuWidth="1400"
                         //var popUpWidth=document.getElementById("JWTCS_Info_POPup").clientWidth;
                         // alert("popUpWidth=" + popUpWidth); 
                  //******Window Width     
                          var windowWidth = document.aspnetForm.clientWidth;  
                        //alert("windowWidth=" + windowWidth);
                        if (windowWidth==0)  
                        {
                            var windowWidth = document.body.clientWidth;  
                        }
                       // alert("windowWidth=" + windowWidth); 
                       // var popUpLeft = ((windowWidth - popUpWidth) / 2); 
                          var popUpLeft = (Math.floor((windowWidth - popUpMenuWidth) / 2)).toString() + "px";  
                          var popUpLeftCheck = (Math.floor((windowWidth - popUpMenuWidth) / 2)).toString();  
                          
                        // alert("popUpLeftCheck=" + popUpLeftCheck); 
                          MenuWidth= parseInt(popUpLeftCheck)+ parseInt(popUpMenuWidth);
                          // alert("MenuWidth=" + MenuWidth); 
                          // document.getElementById('Merch_JWT_Info').style.width='1300'  
                         

                        if (popUpLeftCheck>0)
                        {
                              popUp.style.left=popUpLeft;
                              
                               if (MenuWidth>=windowWidth)
                                {
                                      windowWidth=windowWidth-50;
                                      popUp.style.width=windowWidth+ "px";
                                      //alert("MenuWidth>=windowWidth");  
                                    // document.getElementById('Bot_TD').style.cssText = 'text-align: left;' 
                                     document.getElementById("ctl00_ContentPlaceHolder1_Merch_JWT_Info").style.width=windowWidth;

                                }
                              //alert("normal")
                             
                        }
                        else
                        { 
                              windowWidth=windowWidth-50;
                              popUp.style.left = "2%";
                              popUp.style.width=windowWidth+ "px";
                              //document.getElementById("Bot_TD").setAttribute("class", "Button_Align");
                             // document.getElementById("Bot_TD").setAttribute('style', 'text-align: left;'); 
                               // document.getElementById('Bot_TD').style.cssText = 'text-align: left;' 
                                document.getElementById("ctl00_ContentPlaceHolder1_Merch_JWT_Info").style.width=windowWidth;

                              //alert("5percent")
                        }

                       
                //End test
   
               
                   popUp.style.visibility = "visible";
                   
}
function RemoveSpaces(string) 
{
      alert("string=" + string + "HH");
 return string.replace(" ","");
}

</script>
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


<asp:Panel ID="pnl_Browser" runat="server" Visible="false">
        		<asp:Label ID="Label21" runat="server"   Font-Bold="true" ForeColor="Red" Text="This application only works with Google Chrome or Microsoft Internet Explorer 5.0 and above." SkinID="LabelBlackSkin" ></asp:Label>

</asp:Panel >
 
<div id="ITS_MyControl_FullPageDiv" >
</div>
<div id="JWTCS_Info_POPup" style="visibility:hidden"  class="Div_Color" >
      <table bgcolor="#f5fffa"    cellpadding="0" cellspacing="0">
                
             <tr bgcolor="#0066FF">
                    <td width="96%" height="10%" class="PopHeaderText" align="center">
                        &nbsp;
                       <asp:Label ID="Label19" runat="server" Text="Get Assignments"></asp:Label>
                        
                    </td>
                    <td align="right"  width="4%" height="10%">
                         <img src="Images/x.jpg" onclick="return hidePopup();">
                    </td>
            </tr>                
               <tr  >
                   <td colspan="2" align="center" valign="top">
                          <table style="width: 100%;" class="grid" border="1" cellspacing="1" bordercolor="dodgerblue">
                              <tr>
                                       
                                        <td style="width: 100%;" align="center">
                                              <asp:DropDownList  style="font-family: Courier"  runat="server" ID="Merch_JWT_Info"   >
                                                 <asp:ListItem  ></asp:ListItem>
                                                 <asp:ListItem ></asp:ListItem>
                                              </asp:DropDownList>   
                                        </td>
                                </tr>
                        </table>
               </td>
            </tr>
             <tr>
                        <td align="center"  id="Bot_TD"  colspan="2">
                             
                            <asp:Button  OnClientClick="return hidePopup()" ID="Button1" runat="server" Text="Close"  CssClass="Button" ></asp:Button>
                        </td>
                </tr>        
        </table> 
</div>        




        &nbsp;
     <%--<asp:Panel ID="pnl_InputArea" runat="server">--%>
   <asp:Panel ID="pnl_InputArea" runat="server" style="visibility:hidden">      
        <table border="0"    id="Table3"  width="100%">
             <tr >
                <td  style="width:50%" class="selectionCriteriaItem" align="right" >
                    <asp:Label ID="Label1" runat="server" Text="Merch no:"  SkinID="LabelBlackSkin"></asp:Label>
                    
                </td>
                <td style="width:50%" align="left">
                     <asp:TextBox  Width="20%"  runat="server" MaxLength="10" Text="" ID="Txt_merch_no"  EnableViewState="true"></asp:TextBox>
                  
                      
                      <asp:Button  OnClientClick="Storetrackingpopdiv('1100','100');return false" ID="Button_JWTSC" runat="server" Text="Get Assignments" CssClass="Button"></asp:Button> 
                     
                </td>
             </tr>
        
              <tr>
                <td style="width:50%" class="selectionCriteriaItem" align="right">
                    <asp:Label ID="Label2" runat="server" Text="Job no:" SkinID="LabelBlackSkin"></asp:Label>
                </td>
                <td style="width:50%"  align="left">  
                    <asp:TextBox Width="20%"  runat="server"   MaxLength="10" Text="" ID="txt_jobno" EnableViewState="true" ></asp:TextBox>  
                     
                </td>
             </tr>
             <tr>
                  <td style="width:50%"  class="selectionCriteriaItem" align="right">
                    <asp:Label ID="Label3" runat="server" Text="Wave no:" SkinID="LabelBlackSkin"></asp:Label>
                  </td>
                <td style="width:50%"  align="left">  
                     <asp:TextBox Width="20%"  runat="server"   MaxLength="10" Text="" ID="txt_waveno"  EnableViewState="true"></asp:TextBox>  
                </td>
             </tr>
             <tr>
                 <td style="width:50%"  class="selectionCriteriaItem" align="right">
                    <asp:Label ID="Label4" runat="server" Text="task no:" SkinID="LabelBlackSkin"></asp:Label>
                 </td>
                <td style="width:50%"  align="left">   
                    <asp:TextBox Width="20%"  runat="server"   MaxLength="10" Text="1" ID="txt_taskno"  EnableViewState="true"></asp:TextBox> 
                    
					 <asp:Button  OnClientClick="return GoToStoreSearch()"   ID="but_StoreSearch" runat="server" Text="STORE SEARCH" CssClass="Button"></asp:Button>
			 
                </td>
             </tr>
             
             <tr>
                 <td style="width:50%"  class="selectionCriteriaItem" align="right">
                    <asp:Label ID="Label6" runat="server"  Text="Chain no:" SkinID="LabelBlackSkin"></asp:Label>
                 </td>
                <td style="width:50%"  align="left"> 
                     <asp:TextBox Width="20%"  runat="server"   MaxLength="10" Text="" ID="txt_chainno" EnableViewState="true" ></asp:TextBox> 
                </td>
             </tr>
            <tr>
                  <td style="width:50%" class="selectionCriteriaItem" align="right">
                    <asp:Label ID="Label5" runat="server" Text="Store no:" SkinID="LabelBlackSkin"></asp:Label>
                  </td>
                <td style="width:50%"  align="left">  
                    <asp:TextBox Width="20%"  runat="server"   MaxLength="10" Text="" ID="txt_storeno" EnableViewState="true"></asp:TextBox> 
                </td>
             </tr>
             <tr>
                   <% 
                 if (Email_Status_Flag == "Y")
                     {    
                    %>
                            <td style="width:50%" class="selectionCriteriaItem" align="right">
                                <asp:Label ID="Label7" runat="server" Text="Email Address:" SkinID="LabelBlackSkin"></asp:Label>
                            </td>
                            <td style="width:50%"  align="left">  
                                 <asp:TextBox Width="40%"  runat="server"   MaxLength="60"   ID="txt_EmailAdd" ></asp:TextBox>
                                <asp:Label ID="Label10" runat="server" Text="(Required)" SkinID="LabelRedBoldXSkin" ></asp:Label>
                            </td>
                   <%
                     }  
                   %>
           </tr>
           <tr>
                   <% 
                 if (Collect_Mobile_Email == "YES")
                     {    
                    %>
                            <td style="width:50%"  class="selectionCriteriaItem" align="right"> 
                            <asp:Label ID="Label8" runat="server" Text="Mobile Email Address:" SkinID="LabelBlackSkin" ></asp:Label>
                            </td>
                            <td style="width:50%" align="left">  
                                <asp:TextBox Width="40%"  runat="server"   MaxLength="60"   ID="txt_Mobile_Email" ></asp:TextBox>
                                <asp:Label ID="Label9" runat="server" Text="(Optional)" SkinID="LabelRedBoldXSkin" ></asp:Label>
                            </td>
                   <%
                     }  
                   %>
           </tr>
            <% 
                // Cell Phone
         if (Lang_id ==1)
             {
                         if (Spar_User == "")
                         {
                                    %> 
                                        <tr>
			                                        <td style="width:50%" class="selectionCriteriaItem" align="right"> 
			                                            <asp:Label ID="Label11" runat="server" Text="Cell Phone:" SkinID="LabelBlackSkin" ></asp:Label>
                                                    </td>
                                                    <td style="width:50%"  align="left">  
                                                        (<asp:TextBox Width="7%"  runat="server"   MaxLength="3"  ID="txt_Phone1" ></asp:TextBox>)
                                                        <asp:TextBox Width="7%"  runat="server"   MaxLength="3" Text="" ID="txt_Phone2" ></asp:TextBox>-
                                                        <asp:TextBox Width="7%"  runat="server"   MaxLength="4" Text="" ID="txt_Phone3" ></asp:TextBox>
                                                         
                                                    </td>
                                         </tr>
                                          <tr>
			                                        <td style="width:50%" class="selectionCriteriaItem" align="right"> 
			                                            <asp:Label ID="Label12" runat="server" Text="Cell Phone Provider:" SkinID="LabelBlackSkin" ></asp:Label>
                                                    </td>
                                                    <td style="width:50%"  align="left">  
                                                                <asp:DropDownList Width="40%"  runat="server" ID="DDCellProvider" >
                                                                        <asp:ListItem></asp:ListItem>
                                                                </asp:DropDownList>  
                                                         
                                                    </td>
                                         </tr>
                                         
                                         
                                    <%
                            }
             }  
            %>
             <tr>
					<td colspan="2" align="center">
					                 <%--<asp:Button  OnClientClick="return validate()" ID="Submit" runat="server" Text="NEXT >>" CssClass="Button" OnClick="JWT_Validation_Path" ></asp:Button>--%>
					                <asp:Button   ID="Submit" runat="server" Text="NEXT >>" CssClass="Button" OnClick="JWT_Validation_Path" ></asp:Button>
					                <asp:Button  OnClientClick="return ValuesClear()" ID="ResetButton" runat="server" Text="RESET" CssClass="Button"></asp:Button>
					               
					            	
                    </td>
             </tr>
        </table>
       
                    <input name="Email_Active_Flag" type="hidden" value="<%=Email_Act_Flag%>"  />  
                    <input id="user_id" type="hidden" value="<%=Spar_User%>" />
                   
                    <input id="EmailAddress" type="hidden" value="<%=EmailAddress%>"  />
                    <input id="Collect_Mobile_Email" type="hidden" value="<%=Collect_Mobile_Email%>"  />
                    <input id="Mobile_Email" type="hidden" value="<%=Mobile_Email%>"  />
                    <input name="ILang_Id" type="hidden" value="<%=Lang_id%>"/>
                    <input name="Hidden_PhoneStatus" type="hidden" value="0" />
					<input name="Hidden_Cellphone_Old" type="hidden" value="<%=Cellphone_No%>" />
					<input name="Hidden_CarrierId_Old" type="hidden" value="<%=Str_carrier_id%>" />
					<input id="Merch_no" type="hidden" runat="server" />
				    <input id="Merch_no_check" type="hidden" value="<%=Merch_no_check%>" />
				    <input id="butStatus1" type="hidden" runat="server"/> 
				    <input name="JWT_Input_Page"  type="hidden"   value="Y"/>  
				     <input name="NewScreenPage" type="hidden" value="<%=NewScreenPage%>"/>   
                    <Input type="hidden" name="chainstorelstSA" value="<%=chainstorelstSA%>"/>
<Input type="hidden" name="selchainstoreSA" value="<%=selchainstoreSA%>"/>
<Input type="hidden" name="CFD_VisitDate_Edit" value="<%=CFD_VisitDate_Edit%>"/>


 
</asp:Panel > 
<%

if (Spar_User == "Y")
{
%>  
    <br />
    <asp:Label ID="SparLinkTool" runat="server"  Font-Bold="true" ForeColor="Black" SkinID="LabelBlackSkin" ></asp:Label>  
<%
}
%>  
                       
       </center> 
     <script>
    document.getElementById("<%=Submit.ClientID%>").click();
</script>  
</asp:Content>

