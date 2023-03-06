<%@ Page Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" EnableViewStateMac="false" CodeFile="GetFile.aspx.cs" Inherits="GetFile" Title="Untitled Page" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">


<script type="text/javascript"  language="javascript">

	
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

		 FileCheck=document.getElementById("UploadCtl").SelectedFiles.Count 
		alert("FileCheck=" + FileCheck);
		 //v_error_msg(10)
		 document.getElementById("UploadCtl").Upload();
		
		UploadCtl=document.getElementById("UploadCtl")
		Filetotal=UploadCtl.TotalFileSize 
		alert(Filetotal);
		ServerReplyBack=UploadCtl.ServerReply 
		alert(ServerReplyBack);


//document.getElementById("UploadCtl").Upload();
		
//		return false;
}		 


</script>
<center>

<object id="UploadCtl" style="LEFT: 0px; TOP: 0px"  codebase="/SMP_callform/XUpload.ocx" classid="CLSID:E87F6C8E-16C0-11D3-BEF7-009027438003"  width="540" height="100" enableviewstate= "true">
  <param  name="MaxFileSize" value="3145728"/> 
  <param name="MaxTotalSize" value="3145728"/>  
  <param name="Server" value="localhost"/>
  <param name="Script" value="/SMP_callform/UploadFile.aspx"/>
  <param name="RegKey" value="zBrxVFSQbVsLhoEIzZduDBu566Tt5kVX8TKbtJ9E6X0Zh9DIQr76R6Rj9SW+2YHFJhayfDnYVn2s"/>
  <param name="ViewServerReply" value="False"/> 
 </object>
<br />

 <asp:Button   OnClientClick="return Select_OnClick()" ID="Button2"  runat="server" Text="Select Files" CssClass="Button"></asp:Button>
 &nbsp&nbsp
 <asp:Button   OnClientClick="return Remove_OnClick()" ID="Button5"  runat="server" Text="Remove File" CssClass="Button"></asp:Button>
 &nbsp&nbsp
 <asp:Button   OnClientClick="return RemoveAll_OnClick()" ID="Button6"  runat="server" Text="Remove All Files" CssClass="Button"></asp:Button>
 &nbsp&nbsp
 <asp:Button    ID="Button7"  runat="server" Text="Save and Upload Files" CssClass="Button"  OnClientClick="return Upload_OnClick()"></asp:Button>
 <br />
</center>
</asp:Content>

