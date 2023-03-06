<%@ Page Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true"  viewStateEncryptionMode="Never"  validateRequest="false" EnableViewStateMac="false" enableViewState="true" CodeFile="CFJWT_Input_Photo_Option.aspx.cs" Inherits="CFJWT_Input_Photo_Option" Title="Untitled Page" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
 





<script type="text/javascript" language="javascript1.1">



function Load()
	{
	     
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
function GetAccess_Call_Form(P_visit_dt,CF_Access,Bus_rule22_MV_Flag,Bus_rule22_MV_Remain,Hour_Time_in,Min_Time_in,Time_in_Status,Hour_Time_out,Min_Time_out,Time_out_Status,Manager_Name,Manager_title,Drive_Time,Visit_Miles)
{
//	    alert("Bus_rule22_MV_Flag=" + Bus_rule22_MV_Flag);
//	    alert("Bus_rule22_MV_Remain=" + Bus_rule22_MV_Remain);
	   document.aspnetForm.Job_Visit_Date.value=P_visit_dt;
	   Separate_Visit_Date(P_visit_dt)
	   document.aspnetForm.Photo_CF_Access.value=CF_Access;
	    document.aspnetForm.Bus_rule22_MV_Flag.value=Bus_rule22_MV_Flag;
	   document.aspnetForm.Bus_rule22_MV_Remain.value=Bus_rule22_MV_Remain;
	   document.aspnetForm.GridAddNewVisit.value=""; 
	   document.aspnetForm.Str_timein_hrs.value=Hour_Time_in
        document.aspnetForm.Str_timein_min.value=Min_Time_in
        document.aspnetForm.Str_cmb_timein.value=Time_in_Status
        document.aspnetForm.Str_timeout_hrs.value=Hour_Time_out
        document.aspnetForm.Str_timeout_min.value=Min_Time_out
        document.aspnetForm.Str_cmb_timeout.value=Time_out_Status
        document.aspnetForm.Str_Manager_Title.value=Manager_title
        document.aspnetForm.Str_txt_Manager_name.value=Manager_Name
        document.aspnetForm.Str_txt_mileage.value=Visit_Miles 
        document.aspnetForm.Str_txt_drive.value=Drive_Time

		//return false;
        document.aspnetForm.action  = "CFJWTValidateSV.aspx";
        document.aspnetForm.submit();
		return true;
}

function GetAccess_Photo(P_visit_dt,CF_Access,PhotoByQ,Bus_rule22_MV_Flag,Bus_rule22_MV_Remain,Hour_Time_in,Min_Time_in,Time_in_Status,Hour_Time_out,Min_Time_out,Time_out_Status,Manager_Name,Manager_title,Drive_Time,Visit_Miles)
{
        // alert("Bus_rule22_MV_Flag=" + Bus_rule22_MV_Flag);
	    // alert("Bus_rule22_MV_Remain=" + Bus_rule22_MV_Remain);
	    // alert("CF_Access=" + CF_Access);
		//return false;
		 Separate_Visit_Date(P_visit_dt)
		 document.aspnetForm.Job_Visit_Date.value=P_visit_dt;
		 document.aspnetForm.Photo_CF_Access.value=CF_Access;
		 document.aspnetForm.GridAddNewVisit.value=""; 
		 document.aspnetForm.Bus_rule22_MV_Flag.value=Bus_rule22_MV_Flag;
	     document.aspnetForm.Bus_rule22_MV_Remain.value=Bus_rule22_MV_Remain;
	  // photo by Question check 
        Photo_By_QuestionFlag=document.aspnetForm.Photo_By_QuestionFlag.value
	   // alert("Photo_By_QuestionFlag=" + Photo_By_QuestionFlag);
	   
	    document.aspnetForm.Str_timein_hrs.value=Hour_Time_in
        document.aspnetForm.Str_timein_min.value=Min_Time_in
        document.aspnetForm.Str_cmb_timein.value=Time_in_Status
        document.aspnetForm.Str_timeout_hrs.value=Hour_Time_out
        document.aspnetForm.Str_timeout_min.value=Min_Time_out
        document.aspnetForm.Str_cmb_timeout.value=Time_out_Status
        document.aspnetForm.Str_Manager_Title.value=Manager_title
        document.aspnetForm.Str_txt_Manager_name.value=Manager_Name
        document.aspnetForm.Str_txt_mileage.value=Visit_Miles 
        document.aspnetForm.Str_txt_drive.value=Drive_Time
 
	    if (PhotoByQ=="Y")
	        {
	                    document.aspnetForm.action = "CFPictureByQuestionList.aspx";
                        document.aspnetForm.submit();
                        return false;	 
	        }
	    else
	        {	
                     document.aspnetForm.action  = "CFPictureGetFileOption.aspx";
                     document.aspnetForm.submit();
	                 return true;
	        }
}
function NextPage()
{
        document.aspnetForm.Bus_rule22_MV_Flag.value="";
        document.aspnetForm.GridAddNewVisit.value="Yes"; 
        document.aspnetForm.action  = "CFJWTValidateSV.aspx";
        document.aspnetForm.submit();
		return true;
}
function DoSubmitBack()
	{
	    //DisableButtons()
    	//document.aspnetForm.action = "CFJWTInputs.aspx";
    	GoToDeletionFlag=document.aspnetForm.GoToDeletionFlag.value
    	//alert("GoToDeletionFlag=" + GoToDeletionFlag);
    	  NewScreenPage=document.aspnetForm.NewScreenPage.value
           StrNewCallFormPathLink=document.aspnetForm.StrNewCallFormPathLink.value
	       if (NewScreenPage=="Y")
             {
                 document.aspnetForm.action=StrNewCallFormPathLink   
             }
            else
            {
                if (GoToDeletionFlag=="app2")
                {
                        // document.aspnetForm.action = "http://app2.sparinc.com/callsdeletion/ivr_deletion_main.asp";
		              //document.aspnetForm.action = "http://dev2k8.sparinc.com/callsdeletion/ivr_deletion_main.asp";
		              document.aspnetForm.action = "https://app4.sparinc.com/callsdeletion/ivr_deletion_main.asp";
                }
                 if (GoToDeletionFlag=="chinaapp1")
                {
                        document.aspnetForm.action = "http://chinaapp2.sparinc.com/callsdeletion/ivr_deletion_main.asp";
		              //document.aspnetForm.action = "http://dev2k8.sparinc.com/callsdeletion/ivr_deletion_main.asp";
                }
                 if (GoToDeletionFlag=="dev2k8")
                {
                          document.aspnetForm.action = "http://dev2k8.sparinc.com/callfromdeletion_production/ivr_deletion_main.asp";
		              //document.aspnetForm.action = "http://dev2k8.sparinc.com/callsdeletion/ivr_deletion_main.asp";
                }
		      
		       
		    }
	    document.aspnetForm.submit();
	    return false;		 
	}
function Separate_Visit_Date(v_date_object)
{

 	v_date_sys_rule=document.aspnetForm.DateFormat.value
  //alert("v_date_object="+ v_date_object);
 //alert("v_date_sys_rule="+ v_date_sys_rule);
 	 
	 	
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
				//alert("LoopValue="+ v_date_format.charAt(i).toUpperCase());
			if((v_date_format.charAt(i).toUpperCase()!='Y')&&(v_date_format.charAt(i).toUpperCase()!="M")&&(v_date_format.charAt(i).toUpperCase()!='D'))
			{
				//alert("1="+ v_date_format.charAt(i).toUpperCase());

				v_delimiter= v_date_format.charAt(i)
				break;	
			}
		}
		//alert("v_delimiter="+ v_delimiter);
		//v_date = eval(v_date_object+ ".value");
		v_date = v_date_object
	     //alert("v_date_format="+ v_date_format);
		dateformatarray = v_date_format.split(v_delimiter)
		var datearray = v_date.split(v_delimiter)
		
	 
		
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
			if (dateformatarray[i] == "yy" || dateformatarray[i] == "yyyy")
			{
				Year_Size=dateformatarray[i]	
				v_year = datearray[i];
			}
		}
            			 
		
// alert("v_month="+ v_month);
// alert("v_day="+ v_day);
// alert("v_year="+ v_year);
		
		                //***** Assign date to hidden variables
		               
                        
          document.aspnetForm.Str_VisitMonth.value=v_month;
          document.aspnetForm.Str_visitday.value=v_day;
          document.aspnetForm.Str_visityear.value=v_year;
}

</script>
<hr color="dodgerblue">
<asp:Table ID="Table1" runat="server" width="100%" BorderWidth="0" bordercolor="dodgerblue">
<asp:TableRow>
    <asp:TableCell HorizontalAlign="Left" >
           <asp:Table ID="Table2" runat="server" width="100%"  BorderWidth="0" bordercolor="dodgerblue">
            <asp:TableRow>
                <asp:TableCell Width="10%" CssClass="reportCriteriaHeader" >
                         <asp:Label ID="Label1" runat="server" Text="Job No."  class="reportCriteriaHeader"></asp:Label>  
                </asp:TableCell>
                  <asp:TableCell Width="90%" CssClass="selectionCriteriaItem" >
                        :<%=Job_No%>
                </asp:TableCell>
            </asp:TableRow> 
             <asp:TableRow>
                <asp:TableCell Width="10%" CssClass="reportCriteriaHeader">
                       <asp:Label ID="Label2" runat="server" Text="Wave No."   CssClass="reportCriteriaHeader"></asp:Label>  
                   
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
<br />
<center>
  
<div id="ShowJWTInfo" runat="server">
 
</div> 
   
<asp:GridView  ID="StoreInfo"   Width="50%" DataKeyNames="visit_dt,Call_Form_Reported,Photo_access,Report_New_Visit,PhotoBy_Question_status,Bus_rule22_status,Bus_rule22_Photo_Remain,Hour_Time_in,Min_Time_in,Time_in_Status,Hour_Time_out,Min_Time_out,Time_out_Status,Manager_Name,Manager_title,Drive_Time,Visit_Miles" Font-Size="Medium"  BorderColor="DodgerBlue"  AutoGenerateColumns="false"   OnRowDataBound="CreateButtonLink" RowStyle-CssClass="reportTableItem"  HeaderStyle-CssClass="reportTableHeadernew"  runat="server">
<Columns>
    <asp:BoundField  ItemStyle-HorizontalAlign="Center" DataFormatString="{0:d}"  DataField="visit_dt" HtmlEncode="false" />
   <asp:BoundField ItemStyle-HorizontalAlign="Center" DataField="Call_Form_Reported"/>
   <asp:BoundField ItemStyle-HorizontalAlign="Center" DataField="Bus_rule22_Photo_Required"/>
   <asp:BoundField ItemStyle-HorizontalAlign="Center" DataField="Photo_no"/>
    
    <asp:TemplateField>
      
     <HeaderTemplate>
     
         <asp:Label ID="nothing" runat="server" Text="" CssClass="reportCriteriaHeader"></asp:Label>  
                
   </HeaderTemplate>
   <ItemTemplate>
     <asp:Button   ID="CFBttton_Status" runat="server" Text="Call Form" CssClass="Button"></asp:Button>&nbsp
     <asp:Button   ID="PhotoBttton_Status" runat="server" Text="Photo Upload" CssClass="Button"></asp:Button>
   </ItemTemplate>
    </asp:TemplateField>
</Columns> 
</asp:GridView>
      
 
<br />
 
<asp:Button   OnClientClick="return DoSubmitBack()" ID="Button3" runat="server" Text="<< Back" CssClass="Button"></asp:Button>
&nbsp&nbsp&nbsp		  
<asp:Button OnClientClick="return NextPage()" ID="Add_New_Visit_Dt" runat="server" Text="Report New Visit" CssClass="Button"></asp:Button>
<br />
<br />
<asp:Label ID="SparLinkTool" runat="server"  Font-Bold="true" ForeColor="Black" SkinID="LabelBlackSkin" ></asp:Label>


 <input id="Merch_no" type="hidden" runat="server" />
<input name="Job_No" type="hidden" value="<%=Job_No%>" />
<input name="Wave_No" type="hidden" value="<%=Wave_No%>" />
<input name="Task_No" type="hidden" value="<%=Task_No%>" />
<input name="Chain_No" type="hidden" value="<%=Chain_No%>" />
<input name="Store_No" type="hidden" value="<%=Store_No%>" />
<input name="Str_Merch_no" type="hidden" value="<%=Str_Merch_no%>" />
<input name="txt_EmailAdd" type="hidden" value="<%=txt_EmailAdd%>" />
<input name="txt_Mobile_Email" type="hidden" value="<%=txt_Mobile_Email%>" />
<input name="txt_Phone1" type="hidden" value="<%=txt_Phone1%>" />  
<input name="txt_Phone2" type="hidden" value="<%=txt_Phone2%>" />  
<input name="txt_Phone3" type="hidden" value="<%=txt_Phone3%>" /> 
<input name="CellProvider" type="hidden" value="<%=CellProvider%>" /> 
<input name="Hidden_PhoneStatus" type="hidden" value="<%=Hidden_PhoneStatus%>" /> 
<input name="Job_Visit_Date" type="hidden" value="" />
<input name="Str_VisitMonth" type="hidden" value="" />
<input name="Str_visitday" type="hidden" value="" />
<input name="Str_visityear" type="hidden" value="" />
<input name="Photo_CF_Access" type="hidden" value="" />
<input name="StrGridDates" type="hidden" value="<%=StrGridDates%>" />
<input name="GridAddNewVisit" type="hidden" value="" />
<input name="Photo_By_QuestionFlag" type="hidden" value="<%=Photo_By_QuestionFlag%>"/>
 <input name="DateFormat" type="hidden" value="<%=DateRule%>" />
 <input name="Bus_rule22_MV_Remain" type="hidden" value="" />
<input name="Bus_rule22_MV_Flag" type="hidden" value="" />
<input name="Bus_rule22_MV_NewVisit" type="hidden" value="<%=Bus_rule22_MV_NewVisit%>" />
<input name="Str_timein_hrs" type="hidden" value="" />
<input name="Str_timein_min" type="hidden" value="" />
<input name="Str_cmb_timein" type="hidden" value="" />
<input name="Str_timeout_hrs" type="hidden" value="" />
<input name="Str_timeout_min" type="hidden" value="" />
<input name="Str_cmb_timeout" type="hidden" value="" />
<input name="Str_Manager_Title" type="hidden" value="" /> 
<input name="Str_txt_Manager_name" type="hidden" value="" />
<input name="Str_txt_mileage" type="hidden" value="" /> 
<input name="Str_txt_drive" type="hidden" value="" />

<input name="NewScreenPage" type="hidden" value="<%=NewScreenPage%>"/>
<input name="StrNewCallFormPathLink" type="hidden" value="<%=StrNewCallFormPathLink%>"/>
<Input type="hidden" name="chainstorelstSA" value="<%=chainstorelstSA%>"/>
<Input type="hidden" name="selchainstoreSA" value="<%=selchainstoreSA%>"/>
<input name="Str_Sv_Panel_id" type="hidden" value="<%=Str_Sv_Panel_id%>" />
<Input type="hidden" name="CFD_VisitDate_Edit" value="<%=CFD_VisitDate_Edit%>"/>
<Input type="hidden" name="GoToDeletionFlag" value="<%=GoToDeletionFlag%>"/>

</center>
</asp:Content>

