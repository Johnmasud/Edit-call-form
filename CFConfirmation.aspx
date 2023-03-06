<%@ Page Language="C#" MasterPageFile="~/MasterPage.master" EnableViewStateMac="false" AutoEventWireup="true" CodeFile="CFConfirmation.aspx.cs" Inherits="CFConfirmation"  Title="SPAR - Internet Call Form Input" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
 
<script type="text/javascript"  language="javascript">
function right(e) {
if (navigator.appName == 'Netscape' && (e.which == 3 || e.which == 2))
{
alert("Sorry, you do not have permission to right click.");
return false;
}
else if (navigator.appName == 'Microsoft Internet Explorer' && 
(event.button == 2 || event.button == 3)) {
alert("Sorry, you do not have permission to right click.");
return false;
}
return true;
}

document.onmousedown=right;
document.onmouseup=right;
if (document.layers) window.captureEvents(Event.MOUSEDOWN);
if (document.layers) window.captureEvents(Event.MOUSEUP);
window.onmousedown=right;
window.onmouseup=right;

function CheckGoBack(e) 
{
  var evt = e || window.event; 
 var keyCode = evt.charCode || evt.keyCode; 
//alert("keyCode=" + keyCode);
  if (keyCode==8)
    {
        return false;
    }

}

document.onkeydown = CheckGoBack;

function Load()
	{
	        //alert("Check=" + document.aspnetForm.JWTCheckBoxStatus.value) 
		    JWTCheckBoxStatus=document.aspnetForm.JWTCheckBoxStatus.value;
		    if (JWTCheckBoxStatus!="")
		        {
		          document.aspnetForm.showCheck.checked=true;  
		        }

		    
	            if (document.aspnetForm.showCheck.checked==false)
            			
			            {
				            document.aspnetForm.InformationDisplay.value=ShowDetail.innerHTML
				            ShowDetail.innerHTML=""
			            } 
	            else
			            {
				            document.aspnetForm.InformationDisplay.value=ShowDetail.innerHTML

			            } 
			            
		   // photo by Question check 
	        Photo_By_QuestionFlag=document.aspnetForm.Photo_By_QuestionFlag.value
		   // alert("Photo_By_QuestionFlag=" + Photo_By_QuestionFlag);
		    if (Photo_By_QuestionFlag=="Y")
		        {
		                Storetrackingpopdiv('100','12') 
		         
		                document.aspnetForm.action = "CFPictureByQuestionList.aspx";
	                    document.aspnetForm.submit();
	                    return false;	 
		        }	
	   			
	}
function GetDetail()
	{
	
	if (document.aspnetForm.showCheck.checked)
		{
		  //alert("StartArray1=" +   document.getElementById('ShowDetail').innerHTML)		 
		ShowDetail.innerHTML=document.aspnetForm.InformationDisplay.value
		//document.aspnetForm.InformationDisplay.value=ShowDetail.innerHTML
		}
		
	else
		{
		      //alert("StartArray1=" + ShowDetail.innerHTML)
		     //alert("StartArray2=" + document.aspnetForm.InformationDisplay.value)
			 document.aspnetForm.InformationDisplay.value=ShowDetail.innerHTML;
		
			ShowDetail.innerHTML="";
		} 
	}
function DisableButtons()
	{
	        //******* Disabled the buttons
		    
		    //*********** Button2 is NEXT
		     var ExistNext=document.getElementById("ctl00$ContentPlaceHolder1$Button1");
            if (ExistNext!=null)
            {
               document.aspnetForm.ctl00$ContentPlaceHolder1$Button1.disabled=true;
            }
            //*********** Update is NEXT
	        var ExistRTS=document.getElementById("ctl00$ContentPlaceHolder1$Update");
            if (ExistRTS!=null)
            {
               document.aspnetForm.ctl00$ContentPlaceHolder1$Update.disabled=true;  
            }
              //*********** Button2 is print
	        var ExistsPrint=document.getElementById("ctl00$ContentPlaceHolder1$Button2");
            if (ExistsPrint!=null)
            {
               document.aspnetForm.ctl00$ContentPlaceHolder1$Button2.disabled=true;  
            }
            
	}
function AbleButtons()
	{
	     
		    //*********** Button2 is NEXT
		     var ExistNext=document.getElementById("ctl00$ContentPlaceHolder1$Button1");
            if (ExistNext!=null)
            {
               document.aspnetForm.ctl00$ContentPlaceHolder1$Button1.disabled=false;
            }
            //*********** Update is NEXT
	        var ExistRTS=document.getElementById("ctl00$ContentPlaceHolder1$Update");
            if (ExistRTS!=null)
            {
               document.aspnetForm.ctl00$ContentPlaceHolder1$Update.disabled=false;  
            }
              //*********** Button2 is print
	        var ExistsPrint=document.getElementById("ctl00$ContentPlaceHolder1$Button2");
            if (ExistsPrint!=null)
            {
               document.aspnetForm.ctl00$ContentPlaceHolder1$Button2.disabled=false;  
            }
            
	}
		
function NextPage()
	{
	    DisableButtons()
	    Str_VisitDate_Edit=document.aspnetForm.CFD_VisitDate_Edit.value 
	    StrNewCallFormPathLink=document.aspnetForm.StrNewCallFormPathLink.value
	     ILang_Id=document.aspnetForm.ILang_Id.value
         //  alert("ILang_Id=" + ILang_Id)
            
	    if (Str_VisitDate_Edit=="Y")
	    {
	                 if (ILang_Id==10)
	                    {
	                        
	                          document.aspnetForm.action ="http://app2.sparinc.com/callsdeletion/ivr_deletion_main.asp";
	                    }
	                    else
	                    {
	                          document.aspnetForm.action ="https://app4.sparinc.com/callsdeletion/ivr_deletion_main.asp";
				             // document.aspnetForm.action ="http://dev2k8.sparinc.com/callsdeletion/ivr_deletion_main.asp";
				        }
	    }
	    else
	    {
	        document.aspnetForm.action = "CFJWTInputs.aspx";
	    }
	    document.aspnetForm.submit();
	    return true;	
	}
 
function GoToRTS()
	 {
	    DisableButtons()
	         RTS_Merch_Access=document.aspnetForm.Str_Merch_no.value 
			 //alert("RTS_Merch_Access=" + RTS_Merch_Access);					
		   ILang_Id=document.aspnetForm.ILang_Id.value
           //alert("ILang_Id=" + ILang_Id) 
            
         //document.aspnetForm.action  = "http://mi23.sparinc.com/its/RTS_Merch_Inputs.asp";
         document.aspnetForm.action="http://mi23.sparinc.com/itsnet/its_main.aspx"
		//document.frm_last.action  = "CFJWTInputs.asp";
		//document.TimeValidation.action  = "http://mitest.sparinc.com/its/RTS_Merch_Inputs.asp";
		document.aspnetForm.submit()
		return true
	 }	
function Goto_NewMarkInventory()
	{
	//for Report Your Newmark Inventory 
	//window.open("http://mi10.sparinc.com/NSBO_Manuals/NewDailyActivityResponseForm/DailyActivityResponseForm/DailyActivityResponseForm.htm","openwindow","width=700,height=350,left=0,top=0,toolbar=no,directories=no,status=yes,menubar=no,scrollbars=yes,resizable=yes");
	window.open("http://newmark.vtcus.com","openwindow","width=700,height=350,left=0,top=0,toolbar=yes,directories=no,status=yes,menubar=no,scrollbars=yes,resizable=yes");
	
	} 
function PrintPage(text)
{
    
	text=document
	print(text)
	//AbleButtons()
	return false;
}
//************************ Pop Up ****************************
function Storetrackingpopdiv(w, h) 
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
                popUp.style.left = "50%";
                //popUp.style.width = w + "px";
                //popUp.style.width =popUp.style.width.substr(0,popUp.style.width.indexOf("px"));
               popUp.style.height = h + "px";
                  
 
                  var windowWidth = document.aspnetForm.clientWidth;  
                // alert("windowWidth=" + windowWidth);  
             if (windowWidth==0)  
                {
                    var windowWidth = document.body.clientWidth;  
                   // alert("windowWidth=" + windowWidth);  
                 }
                popUp.style.width=w+ "px";   
                popUp.style.visibility = "visible";
}
</script>


<hr color="dodgerblue">

<asp:Table ID="Table2" runat="server" width="100%" BorderWidth="0" bordercolor="dodgerblue">
<asp:TableRow>
    <asp:TableCell HorizontalAlign="Left" >
           <asp:Table ID="Table3" runat="server" width="100%"  BorderWidth="0" bordercolor="dodgerblue">
            <asp:TableRow>
                <asp:TableCell Width="10%" CssClass="reportCriteriaHeader" >
                         <asp:Label ID="Label7" runat="server" Text="Job No."  class="reportCriteriaHeader"></asp:Label>  
                </asp:TableCell>
                  <asp:TableCell Width="90%" CssClass="selectionCriteriaItem" >
                        :<%=Job_No%>
                </asp:TableCell>
            </asp:TableRow> 
             <asp:TableRow>
                <asp:TableCell Width="10%" CssClass="reportCriteriaHeader">
                        <asp:Label ID="Label6" runat="server" Text="Wave No."   CssClass="reportCriteriaHeader"></asp:Label>   
                </asp:TableCell>
                  <asp:TableCell Width="90%" CssClass="selectionCriteriaItem">
                        :<%=Wave_No%>
                </asp:TableCell>
            </asp:TableRow> 
             <asp:TableRow>
                <asp:TableCell Width="10%" CssClass="reportCriteriaHeader">
                        <asp:Label ID="Label3" runat="server" Text="Task No."  CssClass="reportCriteriaHeader"></asp:Label>   
                </asp:TableCell>
                  <asp:TableCell Width="90%" CssClass="selectionCriteriaItem">
                       :<%=Task_No%>
                </asp:TableCell>
            </asp:TableRow> 
             <asp:TableRow>
                <asp:TableCell Width="10%" CssClass="reportCriteriaHeader">
                         <asp:Label ID="Label4" runat="server" Text="Chain No."  CssClass="reportCriteriaHeader"></asp:Label>     
                </asp:TableCell>
                  <asp:TableCell Width="90%" CssClass="selectionCriteriaItem">
                        :<%=Chain_No%>
                </asp:TableCell>
            </asp:TableRow> 
             <asp:TableRow>
                <asp:TableCell Width="10%" CssClass="reportCriteriaHeader">
                      <asp:Label ID="Label5" runat="server" Text="Store No."  CssClass="reportCriteriaHeader"></asp:Label>      
                </asp:TableCell>
                  <asp:TableCell Width="90%" CssClass="selectionCriteriaItem">
                       :<%=Store_No%>
                </asp:TableCell>
            </asp:TableRow> 
            
         </asp:Table>

    </asp:TableCell>
</asp:TableRow> 
</asp:Table>

<hr color="dodgerblue">

<div id="ITS_MyControl_FullPageDiv" >
</div>
<div id="JWTCS_Info_POPup" style="background-color:Orange; border:solid 1px #000000; text-align:center; font-size:12px; font-weight:bold;">
 <asp:Label runat="server" ID="lblprogress"  Text="Please wait ..."></asp:Label>    
</div>      

<span id="ShowDetail">
    <%=DisplayJWTInfo%>
</span>
<table border="0" cellPadding="1" cellSpacing="1" width="100%">
	<tr>		
		<td align="left" class="selectionCriteriaItem">	
			<input type="checkbox" name="showCheck"   onclick="GetDetail()"/><%=ShowJWTCheckboxText%>
																					   
		</td>	
	</tr>
</table>


<input name="JWTCheckBoxStatus" type="hidden" value="<%=ShowChecked%>" />	
<input name="InformationDisplay" type="hidden" value="" />	
<input name="DisplayJWTInfo" type="hidden" value="<%=DisplayJWTInfo%>" />
<input name="Hidden_date" type="hidden" value="" />	
<input name="Visit_Date" type="hidden" value="<%=Visit_Date%>" />	
<input name="Job_Visit_Date" type="hidden" value="<%=Visit_Date%>" />
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

<input name="Procedure_ConfirmationInsert" type="hidden" value="<%=Procedure_ConfirmationInsert%>" />
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
<input name="ILang_Id" type="hidden" value="<%=Lang_id%>"/>
<input name="Star_time" type="hidden" value="<%=Star_time%>"/>
<input name="confirmation_no" type="hidden" value="<%=confirmation_no%>"/>
<input name="Photo_By_QuestionFlag" type="hidden" value="<%=Photo_By_QuestionFlag%>"/>
<input name="NewScreenPage" type="hidden" value="<%=NewScreenPage%>"/>
<Input type=hidden name="chainstorelstSA" value="<%=chainstorelstSA%>">
<Input type=hidden name="selchainstoreSA" value="<%=selchainstoreSA%>">
<input name="CFD_VisitDate_Edit" type="hidden" value="<%=CFD_VisitDate_Edit%>" />
<input name="StrNewCallFormPathLink" type="hidden" value="<%=StrNewCallFormPathLink%>"/>
<input name="Str_Sv_Panel_id" type="hidden" value="<%=Str_Sv_Panel_id%>" />
<center>

 <br />
 <br />
<%
    if (return_Message == "Error Occurred")
    {
                %>
                  <br /> 
                <%
    
    }
    else
    {
            if (CFD_VisitDate_Edit == "Y")
            {
                 %>			
                       <asp:Label ID="Label8" runat="server"   Font-Bold="true" ForeColor="Red" Text="Changes Submitted. Please wait for the confirmation email." SkinID="LabelBlackSkin" ></asp:Label>
                       <br />
                       <br />
                <%
               }
               else
               {     
                %>
            
                    <asp:Label ID="Label11" runat="server"   Font-Bold="true" ForeColor="Red" Text="Answers are successfully Uploaded!" SkinID="LabelBlackSkin" ></asp:Label>
                     <br />
                      <br />
                     <asp:Label ID="Label1" runat="server"  Font-Bold="true" ForeColor="Red" Text="Thank You!!" SkinID="LabelBlackSkin" ></asp:Label>
                     <br />
                       <br />
               <%
               }
              %>
               
             
             <asp:Label ID="Label2" runat="server"  Font-Bold="true" ForeColor="Red" Text="Your Confirmation Number Is:" SkinID="LabelBlackSkin" ></asp:Label>
             <asp:Label ID="confirm_Number" runat="server"  Font-Bold="true" ForeColor="Black" SkinID="LabelBlackSkin" ></asp:Label>
            
<%
    }
%>
            <br />
            <br />
            <asp:Label ID="WarningMessage" runat="server"  Font-Bold="true" ForeColor="Red" SkinID="LabelBlackSkin" ></asp:Label>
            <br />
            <br />

            <asp:Button OnClientClick="return NextPage()" ID="Button1" runat="server" Text="Next >>" CssClass="Button"></asp:Button>

 
&nbsp &nbsp <asp:Button OnClientClick="return PrintPage()" ID="Button2" runat="server" Text="Print" CssClass="Button" ></asp:Button>
 
 <br />
   <br />
<%

if (Job_No == "100911")
{
	
%>
 <br />
	<TABLE width="100%" align="center" border="0">
		<TR>
			<td align="middle" width="100%"><A class="linkstyle" href="https://mars.sourceinterlink.com">Click here to report your time into M.A.R.S. (Michigan stores excluded)</A>
			</td>
		</TR>
		
	</TABLE>
 <br />
<%
}
%>

<br />
<br />
 
  
<asp:Label ID="HomeLink" runat="server"  Font-Bold="true" ForeColor="Black" SkinID="LabelBlackSkin" ></asp:Label>  

<asp:Label ID="SparLinkTool" runat="server"  Font-Bold="true" ForeColor="Black" SkinID="LabelBlackSkin" ></asp:Label>       
</center>



</asp:Content>

