<%@ Page Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="CFStoreSearchSV.aspx.cs" Inherits="CFStoreSearchSV" EnableViewStateMac="false" Title="SPAR - Internet Call Form Input"  %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
<center>
<script type="text/javascript"  language="javascript">
function Load()
	{
	   // alert("test");
	}
function DoSubmitBack()
	{
    	document.aspnetForm.action = "CFJWTInputs.aspx";
	    document.aspnetForm.submit();
	    return false;		 
	}
	
function GoToPhotoPage()
	{
		 //document.aspnetForm.action = "CFPictureGetFileSV.asp";
		 document.aspnetForm.action = "CFPictureGetFileOption.aspx"
	     document.aspnetForm.submit();
		 return false;		
	}

function GoToMainPage()
{
		ValueOfElement=""
		RadioValue = false;
		k=document.aspnetForm.RBSTORE.length;
		//alert("k=" + k);
		LenCheck=String(k)
		if (LenCheck=="undefined")
			{
					RadioValue=document.aspnetForm.RBSTORE.checked;
					if (RadioValue==true)
						{
							ValueOfElement=document.aspnetForm.RBSTORE.value;
						}
			}
		else
			{
					for (j=0; j<k; j++)
					{
						RadioValue=document.aspnetForm.RBSTORE[j].checked;
						if (RadioValue==true)
							{
								ValueOfElement=document.aspnetForm.RBSTORE[j].value;
								// alert("ValueOfElement=" + ValueOfElement);
								 document.aspnetForm.SelectedSC.value=ValueOfElement;
								break;
							}
					}
			}	
		if (RadioValue == false)
		{
			alert("Please select a store!");
			return false;
		}
     
	document.aspnetForm.action = "CFJWTInputs.aspx";
	document.aspnetForm.submit();
	return true;	
}
</script>

<%=JWTInfoText%>
</center>
<asp:Table BorderColor="DodgerBlue"  BorderWidth="1"  Width="100%" runat="server">
<asp:TableRow>
<asp:TableCell>
<asp:Button     ID="Button2" OnClick="Button2_Click"  runat="server" Text="Search" CssClass="Button"></asp:Button>
&nbsp&nbsp
<asp:Button   OnClientClick="return DoSubmitBack()" ID="Button1"   runat="server" Text="Back" CssClass="Button"></asp:Button>
 
 
 
</asp:TableCell>
</asp:TableRow>

</asp:Table>

<br />
 <%=JWTMatchStoreOutput%>
 <input id="Merch_no" type="hidden" runat="server" />
<input name="Str_Merch_no" type="hidden" value="<%=Str_Merch_no%>" />
<input name="Job_No" type="hidden" value="<%=Job_No%>" />
<input name="Wave_No" type="hidden" value="<%=Wave_No%>" />
<input name="Task_No" type="hidden" value="<%=Task_No%>" />
<input name="Chain_No" type="hidden" value="<%=Chain_No%>" />
<input name="Store_No" type="hidden" value="<%=Store_No%>" />
<input name="SelectedSC" type="hidden" value="" />
</asp:Content>

