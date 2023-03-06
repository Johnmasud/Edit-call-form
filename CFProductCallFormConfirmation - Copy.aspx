<%@ Page Language="C#" MasterPageFile="~/MasterPage.master" EnableViewStateMac="false" AutoEventWireup="true" CodeFile="CFProductCallFormConfirmation.aspx.cs"   enableEventValidation="false" Inherits="CFProductCallFormConfirmation" Title="SPAR - Internet Call Form Input" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
<script type="text/javascript"  language="javascript">
function right(e) {
if (navigator.appName == 'Netscape' && 
(e.which == 3 || e.which == 2))
return false;
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

function DisableButtons()
	{
	     //******* Disabled the buttons
        //"ctl00$ContentPlaceHolder1$Button1" value="Next >>"
        document.aspnetForm.ctl00$ContentPlaceHolder1$Button1.disabled=true;
	}
function AbleButtons()
	{
        //******* Disabled the buttons
        //"ctl00$ContentPlaceHolder1$Button1" value="Next >>"
        document.aspnetForm.ctl00$ContentPlaceHolder1$Button1.disabled=true;
	}
	
function Load()
	{
	   // alert("test");
	}
function Done_Button()
	{
	    DisableButtons()
	   document.aspnetForm.action = "CFJWTInputs.aspx";
	   document.aspnetForm.submit();
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
                        <asp:Label ID="Label3" runat="server" Text="Job No."  CssClass="reportCriteriaHeader"></asp:Label>  
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
<table BORDER='0'>
	<tr>
		<td ALIGN='center' class="reportCriteriaHeader">
			<%
			if (return_Message=="Data load")
			{
			    %>
			     <asp:Label ID="Label1" runat="server" Text="Answers are successfully Uploaded!"  CssClass="reportCriteriaHeader"></asp:Label> 
			      <br />
			      <br />
			      <asp:Label ID="Label10" runat="server" Text="Thank You!!"  CssClass="selectionCriteriaItem"></asp:Label>
			      <br />
			      <asp:Label ID="Label11" runat="server" Text="Your Confirmation Number Is :"  CssClass="selectionCriteriaItem"></asp:Label>
			       <span class="reportCriteriaHeader"><%=confirmation_no%></span>    
			    <%
                
			}
			if (return_Message=="Data error occured")
            {
			    %>
			      <asp:Label ID="Label2" runat="server" Text="Data error occured during the Confirmation Number!"  CssClass="reportCriteriaHeader"></asp:Label>     
			    <%
			}
			if (return_Message=="Data Is There")
            {
			    %>
			      <asp:Label ID="Label8" runat="server" Text="You have already answered the Call Form for this visit."  CssClass="reportCriteriaHeader"></asp:Label>     
			      <br />
			      <br />
			      <asp:Label ID="Label12" runat="server" Text="Your Confirmation Number Is :"  CssClass="selectionCriteriaItem"></asp:Label>
			      <span class="reportCriteriaHeader"><%=confirmation_no%></span>    
			    <%
		    }
			if (return_Message=="Visit Data Is There") 
            {
			    %>
			      <asp:Label ID="Label9" runat="server" Text="You have already reported this visit."  CssClass="reportCriteriaHeader"></asp:Label>     
			      <br />
			      <br />
			      <asp:Label ID="Label13" runat="server" Text="Your Confirmation Number Is :"  CssClass="selectionCriteriaItem"></asp:Label>
			      <span class="reportCriteriaHeader"><%=confirmation_no%></span>    
			    <%
			}
			%>
			
		</td>
	</tr>
	<tr>

		<td ALIGN='center' class="reportCriteriaHeader">
			<%
                if (Warning_Message != "")
                {	    
			        %>
			        
			        <br /><%=Warning_Message%>
			        <br />
			        <br />
			        <%
                }
			%>
		</td>
	</tr>				
</table>

<input name="AnswersForMenuColor" type="hidden" value="<%=AnswersForMenuColor%>"/>
<input name="TotalProdCount" type="hidden" value="<%=TotalProdCount%>"/>	
<input name="AllProdNames" type="hidden"  value="<%=ProductElementAll%>"/>
<input name="Product_Required" type="hidden" value="<%=Product_Required%>"/>
 
<input name="JWTInfoRTS" type="hidden" value="<%=JWTInfoRTS%>" />	
<input name="Hidden_date" type="hidden" value="" />	
<input name="Visit_Date" type="hidden" value="<%=Visit_Date%>" />	
<input name="txt_midnight" type="hidden" value="" />
<input name="Job_No" type="hidden" value="<%=Job_No%>" />
<input name="Wave_No" type="hidden" value="<%=Wave_No%>" />
<input name="Task_No" type="hidden" value="<%=Task_No%>" />
<input name="Task_Desc" type="hidden" value="<%=Task_Desc%>" />
<input name="Task_Addtl_Desc" type="hidden" value="<%=Task_Addtl_Desc%>" />
<input name="Product_Type" type="hidden" value="<%=Product_Type%>"/>

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
<input name="ILang_Id" type="hidden" value="<%=Lang_id%>"/>

<input name="Star_time" type="hidden" value="<%=Star_time%>"/>
<%//From page CFCallFormInputs.aspx %>

<input name="DateRule" type="hidden" value="<%=DateRule%>"/>
<input name="Decimal_Point" type="hidden" value="<%=Decimal_Point%>"/>
<input name="MeasurementValue" type="hidden" value="<%=MeasurementValue%>"/>
<input name="CallForm_Elements" type="hidden" value="<%=All_ElementName%>"/>
<input name="ArrayAllHtmlElement" type="hidden" value="<%=ArrayAllHtmlElement%>"/>
<input name="ArrayAllQuestionsElement" type="hidden" value="<%=ArrayAllQuestionsElement%>"/>
<input name="ArrayEleSubmit" type="hidden" value="<%=ArrayEleSubmit%>"/>
<input name="All_EleAns_Val" type="hidden" value="<%=All_EleAns_Val%>"/>
<input name="CallFormAnswers" type="hidden" value=""/>
<input name="ArrayEleSubmitRTS" type="hidden" value="<%=ArrayEleSubmitRTS%>"/>

<%//For RTS%>
<input name="Client_id" type="hidden" value="0"/>
<input name="RTS_JWT_For" type="hidden" value="<%=STR_RTS_JWT%>"/>
<input name="RTS_JWT" type="hidden" value="<%=STR_RTS_JWT%>"/>
<input name="RTS_Ans_<%=STR_RTS_JWT%>" type="hidden" value="<%=Str_Back_RTSAnswers%>"/>
<input name="RTS_Ans_Save" type="hidden" value=""/>
<input type="hidden" name="Issue_Questions" value="<%=ArrayRTS_Q_no%>"/>
<input name="Here_RTS_Issue" type="hidden" value=""/>
<input name="RTS_Issue_Q_no" type="hidden" value=""/>
<input name="Call_Type" type="hidden" value="NEW"/>
<input name="IssueCategory" type="hidden" value="2"/>
<input name="group" type="hidden" value="2"/>
<input name="source" type="hidden" value="4"/>

<input name="Save_One_Answer" type="hidden" value=""/> 
<input name="CF_ILang_Id" type="hidden" value="<%=Lang_id%>"/>
<input name="ShortCallForm" type="hidden" value="<%=ShortCallForm%>" id="Hidden1"/>
<input name="Used_qty" type="hidden" value="<%=Used_qty%>" id="Hidden2"/>
<input name="Date_input" type="hidden" value="<%=Date_input%>" id="Hidden3"/>
<input name="Price_Rule" type="hidden" value="<%=Decimal_Point%>"/>
<input name="Inch_Max_Val" type="hidden" value="<%=MeasurementValue%>"/>
<input name="CheckTo_Erase_Answers" type="hidden" value=""/>
<input name="AnswersAllFromGrid" type="hidden" value="<%=AnswersAllFromGrid%>"/>
<input name="ProdAnsForNextPage" type="hidden" value="<%=ProdAnsForNextPage%>"/>

<br />
<br />
  
<asp:Button  OnClientClick="return Done_Button()" ID="Button1"  runat="server" Text="Next >>" CssClass="Button"></asp:Button>             
  
</center>
</asp:Content>

