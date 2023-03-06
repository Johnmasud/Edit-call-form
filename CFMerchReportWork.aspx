<%@ Page Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="CFMerchReportWork.aspx.cs" Inherits="CFMerchReportWork" EnableViewStateMac="false" Title="SPAR - Internet Call Form Input" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
<script type="text/javascript"  language="javascript">
function Load()
{
   // alert("test");
}
 var baseText = null;
function showPopup(w,h)
{
   var popUp = document.getElementById("popupcontent");
  popUp.style.top = "200px";
  popUp.style.left = "200px";
   popUp.style.width = w + "px";
   popUp.style.height = h + "px";
 
 
 
   
   popUp.style.visibility = "visible";
}

</script>
<a href="#" onmouseover="showPopup(300,200);" >Open popup</a>


 <div id="popupcontent">This is a popup window!</div>
<input id="Merch_no" type="hidden" runat="server" />
<input name="Str_Merch_no" type="hidden" value="<%=Str_Merch_no%>" />
</asp:Content>

