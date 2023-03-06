<%@ Page Language="C#" AutoEventWireup="true" CodeFile="CFGetVaribles.aspx.cs" Inherits="CFGetVaribles" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head runat="server">
    <title>Untitled Page</title>
<script type="text/javascript"  language="javascript">
 
function JWT_Validation_Path()
	{
	     var  SubmitToNextPage = document.getElementById("SubmitToNextPage").value;
	   
	   //http://mi11.sparinc.com/pdcs/index.asp
	        Data_Collection_Path= document.getElementById("Data_Collection_Path").value; 
			ProdDataFlag= document.getElementById("ProdDataFlag").value; 
            AssemDataFlag= document.getElementById("AssemDataFlag").value; 
           // alert("ProdDataFlag=" + ProdDataFlag);
           // alert("AssemDataFlag=" + AssemDataFlag);
	   if (ProdDataFlag=="Y")
	   {
	         SubmitToNextPage=Data_Collection_Path
	   }
	   if (AssemDataFlag=="Y")
	   {
	         SubmitToNextPage=Data_Collection_Path
	   }
	    //alert("SubmitToNextPage=" + SubmitToNextPage);
	       //return false;	
        // document.aspnetForm.action =SubmitToNextPage;
        document.aspnetForm.action ="CFJWTInputs.aspx";
	      document.aspnetForm.submit();
	  return false;		 
	}
</script> 
</head>
<body onload="JWT_Validation_Path()">
    <form id="aspnetForm" name="aspnetForm" method="post" runat="server">
    <div>
    
    
  <!--  
 <asp:Button   ID="Submit" runat="server" Text="NEXT >>" CssClass="Button" OnClientClick="return JWT_Validation_Path()" ></asp:Button>				               
		-->			               
                    <input name="Email_Active_Flag" type="hidden" value="Y"  />  
                    <input id="user_id" type="hidden" value="Y" />
                   
                    <input id="EmailAddress" type="hidden" value="test@test1.com"  />
                    <input id="Collect_Mobile_Email" type="hidden" value=""  />
                    <input id="Mobile_Email" type="hidden" value="3332562345@cingularme.com"  />
                    <input name="ILang_Id" type="hidden" value="1"/>
                    <input name="Hidden_PhoneStatus" type="hidden" value="0" />
					<input name="Hidden_Cellphone_Old" type="hidden" value="3332562345" />
					<input name="Hidden_CarrierId_Old" type="hidden" value="10" />
					<input id="Merch_no" type="hidden" runat="server" />
				    <input id="Merch_no_check" type="hidden" value="95057" />
				    <input id="butStatus1" type="hidden" runat="server"/> 
				    <input name="JWT_Input_Page"  type="hidden"   value="Y"/> 
			 
				     <input id="Data_Collection_Path" type="hidden" runat="server"/>
				     <input id="ProdDataFlag" type="hidden" runat="server"/> 
                    <input id="AssemDataFlag" type="hidden" runat="server"/> 
                    
                    <input id="Txt_merch_no" type="hidden" runat="server"/> 
                    <input id="txt_jobno" type="hidden" runat="server"/> 
                    <input id="txt_waveno" type="hidden" runat="server"/> 
                    <input id="txt_taskno" type="hidden" runat="server"/> 
                    <input id="txt_chainno" type="hidden" runat="server"/> 
                    <input id="txt_storeno" type="hidden" runat="server"/> 
                    <input id="SubmitToNextPage" type="hidden" runat="server"/> 
                    
                    <input name="Str_Merch_no" type="hidden" value="<%=Str_Merch_no%>" />
                    <input id="Job_No" type="hidden" runat="server"/> 
                    <input id="Wave_No" type="hidden" runat="server"/> 
                    <input id="Task_No" type="hidden" runat="server"/> 
                    <input id="Chain_No" type="hidden" runat="server"/> 
                    <input id="Store_No" type="hidden" runat="server"/> 
                    
                    <input id="StrOld_Day" type="hidden" runat="server"/> 
                    <input id="StrOld_Month" type="hidden" runat="server"/> 
                    <input id="StrOld_Year" type="hidden" runat="server"/> 
                    
                     <input id="fvar_msno" type="hidden" runat="server"/> 
                    <input id="fvar_jobno" type="hidden" runat="server"/> 
                    <input id="fvar_waveno" type="hidden" runat="server"/> 
                    <input id="fvar_taskno" type="hidden" runat="server"/> 
                    <input id="fvar_chainno" type="hidden" runat="server"/> 
                    <input id="fvar_storeno" type="hidden" runat="server"/> 
                
                    
                    <input name="ctl00$ContentPlaceHolder1$uparm_merch_no" type="hidden" value="<%=Str_Merch_no%>"/>
                    <input name="ctl00$ContentPlaceHolder1$uparm_job_no" type="hidden" value="<%=uparm_Job_no%>"/>
                    <input name="ctl00$ContentPlaceHolder1$uparm_wave_no" type="hidden" value="<%=uparm_Wave_no%>"/>
                    <input name="ctl00$ContentPlaceHolder1$uparm_task_no" type="hidden" value="<%=uparm_Task_no%>"/>
                    <input name="ctl00$ContentPlaceHolder1$uparm_chain_no" type="hidden" value="<%=uparm_Store_no%>"/>
                    <input name="ctl00$ContentPlaceHolder1$uparm_store_no" type="hidden" value="<%=uparm_Chain_no%>"/> 
                    <input name="ctl00$ContentPlaceHolder1$uparm_business_type_id" type="hidden" value="<%=Business_Type_id%>"/>
                    <input name="Return_CallFormPath" type="hidden" value="<%=Return_CallFormPath%>"/>
                    <input name="NewScreenPage" type="hidden" value="Y"/>  
                 
                    
 
                  
    </div>
    </form>
</body>
</html>
