<%@ Page Language="C#"  MasterPageFile="~/MasterPage.master"  Title="SPAR - Internet Call Form Input" EnableViewStateMac="false" AutoEventWireup="true" CodeFile="CFJWTInputs_Start.aspx.cs" 
Inherits="CFJWTInputs_Start"  %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">



<script type="text/javascript" language="javascript1.1">
	function Load()
	{
	   // alert("test");
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
function IsEmpty()
{

}
function validate()
	 {
	    //**************** Disabled the next button
	     DisableButtons()
	    StrConfirm="N"   
	
	    IsEmpty()
	
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
		                                                document.aspnetForm.Hidden_PhoneStatus.value=1;                
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
		document.aspnetForm.action  = "CFJWTValidateSV.aspx";
		document.aspnetForm.submit();
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
	
				if ((document.aspnetForm.ctl00$ContentPlaceHolder1$merch_no.value=="") || (isNaN(document.aspnetForm.ctl00$ContentPlaceHolder1$merch_no.value)) || (eval(document.aspnetForm.ctl00$ContentPlaceHolder1$merch_no.value)==0))
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
</script>
<center>
<asp:Panel ID="pnl_Browser" runat="server" Visible="false">
        		<asp:Label ID="Label21" runat="server"   Font-Bold="true" ForeColor="Red" Text="This application only works with Microsoft Internet Explorer at the moment." SkinID="LabelBlackSkin" ></asp:Label>

</asp:Panel >
<asp:Panel ID="pnl_Version" runat="server" Visible="false" >
        		<asp:Label ID="Label22" runat="server"  Font-Size="Medium"  Font-Bold="true" ForeColor="Red" Text="Please use Internet Explorer 4.0 and above." SkinID="LabelBlackSkin" ></asp:Label>
</asp:Panel >


        &nbsp;
   <asp:Panel ID="pnl_InputArea" runat="server">     
        <table border="0"    id="Table3"  width="100%">
             <tr >
                <td  style="width:50%" class="selectionCriteriaItem" align="right" >
                    <asp:Label ID="Label1" runat="server" Text="Merch no:"  SkinID="LabelBlackSkin"></asp:Label>
                </td>
                <td style="width:50%" align="left">
                     <asp:TextBox  Width="20%"  runat="server" MaxLength="12" Text="" ID="Txt_merch_no" ></asp:TextBox>  
                </td>
             </tr>
        
              <tr>
                <td style="width:50%" class="selectionCriteriaItem" align="right">
                    <asp:Label ID="Label2" runat="server" Text="Job no:" SkinID="LabelBlackSkin"></asp:Label>
                </td>
                <td style="width:50%"  align="left">  
                    <asp:TextBox Width="20%"  runat="server"   MaxLength="12" Text="" ID="txt_jobno" ></asp:TextBox>  
                </td>
             </tr>
             <tr>
                  <td style="width:50%"  class="selectionCriteriaItem" align="right">
                    <asp:Label ID="Label3" runat="server" Text="Wave no:" SkinID="LabelBlackSkin"></asp:Label>
                  </td>
                <td style="width:50%"  align="left">  
                     <asp:TextBox Width="20%"  runat="server"   MaxLength="12" Text="" ID="txt_waveno" ></asp:TextBox>  
                </td>
             </tr>
             <tr>
                 <td style="width:50%"  class="selectionCriteriaItem" align="right">
                    <asp:Label ID="Label4" runat="server" Text="task no:" SkinID="LabelBlackSkin"></asp:Label>
                 </td>
                <td style="width:50%"  align="left">   
                    <asp:TextBox Width="20%"  runat="server"   MaxLength="12" Text="1" ID="txt_taskno" ></asp:TextBox> 
                        <% 
                    	if (ShowButton=="YES") 
                    	{
						%>
						<asp:Button  Visible="false" OnClientClick="return GoToStoreSearch()"   ID="btn_Store_Search" runat="server" Text="STORE SEARCH" CssClass="Button"></asp:Button>
						 
						<%
						}
						%>
                    
                </td>
             </tr>
             
             <tr>
                 <td style="width:50%"  class="selectionCriteriaItem" align="right">
                    <asp:Label ID="Label6" runat="server"  Text="Chain no:" SkinID="LabelBlackSkin"></asp:Label>
                 </td>
                <td style="width:50%"  align="left"> 
                     <asp:TextBox Width="20%"  runat="server"   MaxLength="12" Text="" ID="txt_chainno" ></asp:TextBox> 
                </td>
             </tr>
            <tr>
                  <td style="width:50%" class="selectionCriteriaItem" align="right">
                    <asp:Label ID="Label5" runat="server" Text="Store no:" SkinID="LabelBlackSkin"></asp:Label>
                  </td>
                <td style="width:50%"  align="left">  
                    <asp:TextBox Width="20%"  runat="server"   MaxLength="12" Text="" ID="txt_storeno" ></asp:TextBox> 
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
					                <asp:Button  OnClientClick="return validate()" ID="Submit" runat="server" Text="NEXT >>" CssClass="Button"></asp:Button>
					                <asp:Button  OnClientClick="return ValuesClear()" ID="ResetButton" runat="server" Text="RESET" CssClass="Button"></asp:Button>
					            	
                    </td>
             </tr>
        </table>
</asp:Panel >        
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
					
  
<%
 if (Lang_id ==1)
 {
 %>				 
          <br />
          <br />
          <asp:Label ID="Label13" runat="server"   Font-Bold="true" ForeColor="Red" Text="SPAR now has the ability to communicate with you via a text message on your cell phone!" SkinID="LabelBlackSkin" ></asp:Label>
          <br />
         <asp:Label ID="Label14" runat="server"   Font-Bold="true" ForeColor="Red" Text="If you'd like to take advantage of the convenience of receiving important messages on your cell phone," SkinID="LabelBlackSkin" ></asp:Label>
         <br />
         <asp:Label ID="Label15" runat="server"   Font-Bold="true" ForeColor="Red" Text="simply select your cell phone provider from the list above and enter/verify your cell phone number." SkinID="LabelBlackSkin" ></asp:Label>
        <br />
         <br />
         <asp:Label ID="Label16" runat="server"   Font-Bold="true" ForeColor="Red" Text="Note: SPAR is not responsible for any cost associated to this service." SkinID="LabelBlackSkin" ></asp:Label>
        
        <br />  
        
  <%
}
 else
 {     
 %>  
 <br />
 <asp:Label ID="Label17" runat="server"   Font-Bold="true" ForeColor="Red" Text="Attention merchandisers! Updated Internet Call Form allows photo upload by clicking on `Photo Upload` button." SkinID="LabelBlackSkin" ></asp:Label>
<%
 }
 if (Lang_id !=1)
 {
%>
<BR>
<BR>
<asp:Label ID="Label18" runat="server"   Font-Bold="true" ForeColor="Red" Text="Attention merchandisers! Visit Date will now be collected on the same screen we collect time in and time out." SkinID="LabelBlackSkin" ></asp:Label>

<%
}
%>    
                      
       </center> 
</asp:Content>

