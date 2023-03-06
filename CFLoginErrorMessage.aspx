<%@ Page Language="C#" AutoEventWireup="true" EnableViewStateMac="false" CodeFile="CFLoginErrorMessage.aspx.cs"  Inherits="CFLoginErrorMessage" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head runat="server">
    <title>Untitled Page</title>
</head>
<body  bgcolor="mintcream">
    <form id="form1" runat="server">
    <div>
     <table borderColor="dodgerblue" width="100%" border="1" height=60 ID="Table1">
            <tr> 
               <TD rowSpan="3"><IMG height="70" src="https://mi12.sparinc.com/includes/images/sparlogo/1/logoglobe.gif" width="115"></TD>
	
                <td  height="30" colspan="2" align="middle" bordercolor="dodgerblue" bgcolor="dodgerblue"> 
                        <table width="100%" border="0" cellpadding="0" cellspacing="0" ID="Table2">
                            <tr> 
                                <td width="50%" align="left" class="headerUserDate"></td>
                                <td width="50%" align="right" ><span style='color:white;'><b><asp:Label ID="Showdate" runat="server"></asp:Label></b></span> </td>
                            </tr>
                        </table>
                </td>
            </tr>
            <tr> 
                    <td width="100%"  align="center" bordercolor="dodgerblue"   bgcolor="#336699"    > <span style='color:white;'><b>Internet Call Form</b> </span>
                    </td>             
            </tr>
       </table>
        <center>
        <br />
         <span style='color:red;' ><b>
         <asp:Label ID="Label8" runat="server" Text="Invalid merch number. Please login again!"  CssClass="reportCriteriaHeader"></asp:Label> </b> </span>
         </center>
    </div>
    </form>
</body>
</html>
