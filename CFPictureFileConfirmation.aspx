<%@ Page Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" EnableViewStateMac="false" CodeFile="CFPictureFileConfirmation.aspx.cs" Inherits="CFPictureFileConfirmation" Title="Internet Call Form Input" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">

<script type="text/javascript"  language="javascript">
//function right(e) {

//            //alert("StartArray1=" +  navigator.appName)		
//            if (navigator.appName == 'Netscape' && (e.which == 3 || e.which == 2))
//            {
//                    //alert('<%=vPrompts[49]%>');
//                    return false;
//            }
//            else if (navigator.appName == 'Microsoft Internet Explorer' && (event.button == 2 || event.button == 3)) 
//            {
//                     //alert('<%=vPrompts[49]%>');
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
 
function Load()
	{
	   
		    Photo_CF_Access=document.aspnetForm.Photo_CF_Access.value
		    //alert("Photo_CF_Access=" + Photo_CF_Access);
		     if (Photo_CF_Access=="Yes")
		        {
		                    var Exists5=document.getElementById("ctl00_ContentPlaceHolder1_Button4");
                            if (Exists5!=null)
                            {
                               document.aspnetForm.ctl00$ContentPlaceHolder1$Button4.disabled=true;  
                               //document.aspnetForm.ctl00$ContentPlaceHolder1$Button4.style.background='#CCCCCC'; 
                               document.aspnetForm.ctl00$ContentPlaceHolder1$Button4.className='ButtonDisabledJava';  
                            }    
		        }
		    Bus_Rule22_Photo=document.aspnetForm.Bus_Rule22_Photo.value
		 
		    if (Bus_Rule22_Photo=="Y")
		        {
		                    var Exists4=document.getElementById("ctl00_ContentPlaceHolder1_Button4");
		                   
                            if (Exists4!=null)
                            {
                            
                               document.aspnetForm.ctl00$ContentPlaceHolder1$Button4.disabled=true; 
                              // document.aspnetForm.ctl00$ContentPlaceHolder1$Button4.style.background='#CCCCCC'; 
                               document.aspnetForm.ctl00$ContentPlaceHolder1$Button4.className='ButtonDisabledJava';   
                            }    
		        }
		     Photo_Q_Enable=document.aspnetForm.Photo_Q_Enable.value
		  //  alert("Bus_Rule22_Photo=" + Bus_Rule22_Photo);
		    if (Photo_Q_Enable=="Y")
		        {
		                    var Exists4=document.getElementById("ctl00_ContentPlaceHolder1_Button4");
                            if (Exists4!=null)
                            {
                               document.aspnetForm.ctl00$ContentPlaceHolder1$Button4.disabled=true;  
                               //document.aspnetForm.ctl00$ContentPlaceHolder1$Button4.style.background='#CCCCCC'; 
                                document.aspnetForm.ctl00$ContentPlaceHolder1$Button4.className='ButtonDisabledJava';  
                            }    
		        }
		        
	}
function DisableButtons()
	{
		   //*********** Button2 is NEXT
	        var Exists1=document.getElementById("ctl00_ContentPlaceHolder1_Button1");
            if (Exists1!=null)
            {
               document.aspnetForm.ctl00$ContentPlaceHolder1$Button1.disabled=true;  
            }
           var Exists2=document.getElementById("ctl00_ContentPlaceHolder1_Button2");
            if (Exists2!=null)
            {
               document.aspnetForm.ctl00$ContentPlaceHolder1$Button2.disabled=true;  
            }
            var Exists3=document.getElementById("ctl00_ContentPlaceHolder1_Button3");
            if (Exists3!=null)
            {
               document.aspnetForm.ctl00$ContentPlaceHolder1$Button3.disabled=true;  
            }
            var Exists4=document.getElementById("ctl00_ContentPlaceHolder1_Button4");
            if (Exists4!=null)
            {
               document.aspnetForm.ctl00$ContentPlaceHolder1$Button4.disabled=true;  
            }
             var Exists5=document.getElementById("ctl00_ContentPlaceHolder1_Button5");
            if (Exists5!=null)
            {
               document.aspnetForm.ctl00$ContentPlaceHolder1$Button5.disabled=true;  
            }
             var Exists6=document.getElementById("ctl00_ContentPlaceHolder1_Button6");
            if (Exists6!=null)
            {
               document.aspnetForm.ctl00$ContentPlaceHolder1$Button6.disabled=true;  
            }
             var Exists7=document.getElementById("ctl00_ContentPlaceHolder1_Button7");
            if (Exists7!=null)
            {
               document.aspnetForm.ctl00$ContentPlaceHolder1$Button7.disabled=true;  
            }
              var Exists8=document.getElementById("ctl00_ContentPlaceHolder1_Button8");
            if (Exists8!=null)
            {
               document.aspnetForm.ctl00$ContentPlaceHolder1$Button8.disabled=true;  
            }
            
	}
function AbleButtons()
	{
	     //******* abled the buttons
         document.aspnetForm.ctl00$ContentPlaceHolder1$Button2.disabled=false;
	}
		
function DoSubmit(Page_direction)
	{
        //************* Time In/Out ************************
	    DisableButtons()	  
				 //document.aspnetForm.RotateFileSave.value=Picture_Name	

		document.aspnetForm.action =Page_direction;
	    document.aspnetForm.submit();
		return true;	
	}
function Goback(Page_direction)
{
        DisableButtons()	
        document.aspnetForm.action =Page_direction;
        NewScreenPage=document.aspnetForm.NewScreenPage.value
        StrNewCallFormPathLink=document.aspnetForm.StrNewCallFormPathLink.value
        if (NewScreenPage=="Y")
         {
             document.aspnetForm.action=StrNewCallFormPathLink   
         }
	    document.aspnetForm.submit();
		return true;    
}
</script>

<hr color="dodgerblue" />

<asp:Table ID="Table2" runat="server" width="100%" BorderWidth="0" bordercolor="dodgerblue">
<asp:TableRow>
    <asp:TableCell HorizontalAlign="Left" >
           <asp:Table ID="Table3" runat="server" width="100%"  BorderWidth="0" bordercolor="dodgerblue">
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
                       <asp:Label ID="Label2" runat="server" Text="Visit Date."  CssClass="reportCriteriaHeader"></asp:Label>      
                </asp:TableCell>
                  <asp:TableCell Width="90%" CssClass="selectionCriteriaItem">
                        <%=Display_Job_Visit_Date%>
                </asp:TableCell>
            </asp:TableRow> 
         </asp:Table>

    </asp:TableCell>
</asp:TableRow> 
</asp:Table>

<hr  color="dodgerblue" />

 <asp:Label ID="Photo_By_Q_Message" Font-Bold="true" ForeColor="Red" runat="server" Text=""  SkinID="LabelBlackSkin"></asp:Label>
 <asp:Label ID="Display_QP_Info" Font-Bold="true" ForeColor="Black" runat="server" Text=""  SkinID="LabelBlackSkin"></asp:Label>
 
 
<center>

 <%
  	if (Bus_Rule22_Photo=="Y")
    {
    %>
            <br />
           <asp:Label ID="Label8" runat="server" Text="Minimum photo(s) required is:"  CssClass="reportCriteriaHeader"></asp:Label>     
           <span class="selectionCriteriaItem"><%=Photo_Remain%></span>  
           <br />
       
    <%
    } 
    %>        
   

               <asp:table  runat="server" id="table6" BorderColor="Black"  BorderWidth="0"  cellpadding="1" cellspacing="1" width="100%">
                         <asp:TableRow>
                                <asp:TableCell   Width="70%" HorizontalAlign="Right" CssClass="selectionCriteriaItem">
                                       
                               </asp:TableCell>
                                <asp:TableCell  Width="30%" HorizontalAlign="Left" CssClass="selectionCriteriaItem">
                                          <asp:table  runat="server" id="table1" BorderColor="Black"  BorderWidth="0" >  
                                                <asp:TableRow> 
                                                        <asp:TableCell  Width="50%" HorizontalAlign="Left" CssClass="selectionCriteriaItem">
                                              	             
                                                         </asp:TableCell>
                                                  </asp:TableRow>
                                           </asp:table>
                                </asp:TableCell>		
                          </asp:TableRow>										
                </asp:table>  
                <br />
                <asp:Label ID="Label1" runat="server"  Font-Underline="true" Text="Confirmation Number(s)"   CssClass="reportCriteriaHeader"></asp:Label> 
                 <br />
                 
                <div id="DisplayConfirNo"  runat="server"></div>
                 <br />
                 <asp:Label ID="ErrorMessage" runat="server" Font-Bold="true" ForeColor="Red"  SkinID="LabelBlackSkin" ></asp:Label>
                   <br />
                   <br />
                  		  
        <% 
          if (FileUploadType == "M")
           {
               if (Convert.ToInt32(Max_Visit_Per_Store_Mx.Trim()) == 1)
               {
                       if (Photo_Q_Enable == "Y")
                       {
                               %>
                               <asp:Button   OnClientClick="return DoSubmit('CFPictureByQuestionList.aspx')" ID="Button5"  runat="server" Text="Photo Upload" CssClass="Button"></asp:Button>
			                   &nbsp&nbsp
                               <%       
                        }
                        else
                        {
                               %>
                               <asp:Button   OnClientClick="return DoSubmit('CFPictureGetFileOption.aspx')" ID="Button7"  runat="server" Text="Photo Upload" CssClass="Button"></asp:Button>
			                   &nbsp&nbsp
                               <% 
                        }      
               }
               else
               {
                       if (Photo_Q_Enable == "Y")
                       {
                               %>
                               <asp:Button   OnClientClick="return DoSubmit('CFPictureByQuestionList.aspx')" ID="Button8"  runat="server" Text="Photo Upload" CssClass="Button"></asp:Button>
			                   &nbsp&nbsp
                               <%       
                        }
                        else
                        { 
                               %>
                               <asp:Button   OnClientClick="return DoSubmit('CFJWT_Input_Photo_Option.aspx')" ID="Button1"  runat="server" Text="Photo Upload" CssClass="Button"></asp:Button>
			                   &nbsp&nbsp
                               <% 
                       } 
                }     
           }
           if (FileUploadType == "S")
           {
                        if (Convert.ToInt32(Max_Visit_Per_Store_Mx.Trim()) == 1)
                       {
                                if (Photo_Q_Enable == "Y")
                               {
                                       %>
                                       <asp:Button   OnClientClick="return DoSubmit('CFPictureByQuestionList.aspx')" ID="Button9"  runat="server" Text="Photo Upload" CssClass="Button"></asp:Button>
			                           &nbsp&nbsp
                                       <%       
                                }
                                else
                                {
                                       %>
                                       <asp:Button   OnClientClick="return DoSubmit('CFPictureGetFileOption.aspx')" ID="Button6"  runat="server" Text="Photo Upload" CssClass="Button"></asp:Button>
			                           &nbsp&nbsp
                                       <%  
                                }
                       }
                       else
                       {
                              if (Photo_Q_Enable == "Y")
                                {
                                       %>
                                       <asp:Button   OnClientClick="return DoSubmit('CFPictureByQuestionList.aspx')" ID="Button10"  runat="server" Text="Photo Upload" CssClass="Button"></asp:Button>
			                           &nbsp&nbsp
                                       <%       
                                }
                                else
                                {
                                       %>
                                       <asp:Button   OnClientClick="return DoSubmit('CFJWT_Input_Photo_Option.aspx')" ID="Button3"  runat="server" Text="Photo Upload" CssClass="Button"></asp:Button>
			                           &nbsp&nbsp
                                       <%  
                               } 
                      }    
           } 
        %>
         <asp:Button OnClientClick="return DoSubmit('CFJWTValidateSV.aspx')" ID="Button4"  runat="server" Text="Next >>" CssClass="Button"></asp:Button>
			   &nbsp&nbsp
			   
        <asp:Button OnClientClick="return Goback('CFJWTInputs.aspx')" ID="Button2"  runat="server" Text="<< Back" CssClass="Button"></asp:Button>
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
<input name="Photo_Confirmation_page" type="hidden" value="Y" /> 

<input name="Client_Access_Flag" type="hidden" value="<%=Client_Access_Flag%>" />
<input name="Pre_Approved_Flag" type="hidden" value="<%=Pre_Approved_Flag%>" />
<input name="Job_Visit_Date" type="hidden" value="<%=Job_Visit_Date%>" />

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
<asp:HiddenField ID="savePath" runat="server" value="0"/>
<input name="StrOriginalFile" id="hiddentest" type="hidden" value="<%=StrOriginalFile%>"/> 
<input name="FileUploadType" type="hidden" value="<%=FileUploadType%>" />  
<input name="Bus_Rule22_Photo" type="hidden" value="<%=Bus_Rule22_Photo%>" />  
<input name="Photo_CF_Access" type="hidden" value="<%=Photo_CF_Access%>" />
<input name="Photo_Q_No" type="hidden" value="<%=Photo_Q_No%>" />
 

<input name="Photo_q_Res_Val" type="hidden" value="<%=Photo_q_Res_Val%>" />
<input name="Photo_Q_Enable" type="hidden" value="<%=Photo_Q_Enable%>" />
<input name="Photo_Prod_upc" type="hidden" value="<%=Photo_Prod_upc%>" />
<input name="Photo_upc_desc" type="hidden" value="<%=Photo_upc_desc%>" />
<input name="Photo_q_desc" type="hidden" value="<%=Photo_q_desc%>" />
<input name="Photo_Res_desc" type="hidden" value="<%=Photo_Res_desc%>" />
<input name="Old_Visit_Date" type="hidden" value="<%=Old_Visit_Date%>"/>  
<input name="StrGridDates" type="hidden" value="<%=StrGridDates%>" /> 
<input name="NewScreenPage" type="hidden" value="<%=NewScreenPage%>"/>
<input name="StrNewCallFormPathLink" type="hidden" value="<%=StrNewCallFormPathLink%>"/>
 <Input type=hidden name="chainstorelstSA" value="<%=chainstorelstSA%>"/>
<Input type=hidden name="selchainstoreSA" value="<%=selchainstoreSA%>"/>
<input name="Str_Sv_Panel_id" type="hidden" value="<%=Str_Sv_Panel_id%>" />
</asp:Content>

