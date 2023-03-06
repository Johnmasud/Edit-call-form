<%@ Page Language="C#" AutoEventWireup="true" CodeFile="SPARSupport.aspx.cs" Inherits="SPARSupport" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>SPAR Support</title>
</head>
<body>
    <form id="form1" runat="server">
     <table border="0" width="60%">
    <tr>
    <td width="100%">
     <fieldset >      
    <font face="Arial" size="3"><b>Problem In Viewing The Web Page</b></font>
    <hr align="left" width="50%" color="#04ACB5">
    <div align="left">
        <table border="0" width="100%">
             <tr>
                <td width="100%">
                    <font face="Verdana" size="2">                                      
                    We are sorry for any inconvenience this may have caused you.
                    <br /><br /> </font>
                    <font face="Verdana" size="2" color="#0033CC">
                   Please send the following Details to SPAR Support Or Your Administrator.<br /><br />                    
                    </font>
                </td>                
            </tr> 
            </table> 
            </div> 
   <font face="Arial" size="3"><b>Technical Information</b></font>
    <hr align="left" width="50%" color="#04ACB5">
    <div align="left" >
        <table border="0" width="100%">
             <tr>
                <td width="34%">
                    <font face="Verdana" size="2">Date</font>
                </td>
                <td width="4%">
                    <font face="Verdana" size="2">:</font>
                </td>
                <td width="66%">
                    <font face="Verdana" size="2">
                        <%= DateTime.Now %></font>
                </td>
            </tr> 
            <tr>
                <td width="34%">
                    <font face="Verdana" size="2">Application Id</font>
                </td>
                <td width="4%">
                    <font face="Verdana" size="2">:</font>
                </td>
                <td width="66%">
                    <font face="Verdana" size="2">
                    <asp:Label ID="LabelApplicationId" runat="server" Text=""></asp:Label></font> 
                </td>
            </tr>
            <tr>
                <td width="34%">
                    <font face="Verdana" size="2">Page</font>
                </td>
                <td width="4%">
                    <font face="Verdana" size="2">:</font>
                </td>
                <td width="66%">
                <font face="Verdana" size="2">
                     <asp:Label ID="Labelpage" runat="server" Text=""></asp:Label></font> 
                </td>
            </tr>           
            <tr>
                <td width="34%" valign="top">
                    <font face="Verdana" size="2" color="#FF3300">Message</font>
                </td>
                <td width="4%" valign="top">
                    <font face="Verdana" size="2">:</font>
                </td>
                <td width="66%" valign="top">
                <font face="Verdana" size="2" color="#FF3300">
                    <asp:Label ID="LabelMessage" runat="server" Text=""></asp:Label></font> 
                </td>
            </tr>  
        </table>
    </div>
    <br />
    <br />
    <font face="Arial" size="3"><b>Browser Information</b></font>
    <hr align="left" width="50%" color="#04ACB5">
    <div align="left">
        <table border="0" width="100%">
            <tr>
                <td width="34%">
                    <font face="Verdana" size="2">Browser Type</font>
                </td>
                <td width="4%">
                    <font face="Verdana" size="2">:</font>
                </td>
                <td width="66%">
                    <font face="Verdana" size="2">
                        <%= Request.Browser.Browser %></font>
                </td>
            </tr>
            <tr>
                <td width="34%">
                    <font face="Verdana" size="2">Version</font>
                </td>
                <td width="4%">
                    <font face="Verdana" size="2">:</font>
                </td>
                <td width="66%">
                    <font face="Verdana" size="2">
                        <%= Request.Browser.Version %></font>
                </td>
            </tr>           
            <tr>
                <td width="34%">
                    <font face="Verdana" size="2">Supports Java Script</font>
                </td>
                <td width="4%">
                    <font face="Verdana" size="2">:</font>
                </td>
                <td width="66%">
                    <font face="Verdana" size="2">
                        <%= Request.Browser.JavaScript %></font>
                </td>
            </tr> 
            <tr>
                <td width="34%">
                    <font face="Verdana" size="2">Supports Cookies</font>
                </td>
                <td width="4%">
                    <font face="Verdana" size="2">:</font>
                </td>
                <td width="66%">
                    <font face="Verdana" size="2">
                        <%= Request.Browser.Cookies%></font>
                </td>
            </tr> 
            <tr>
                <td width="34%">
                    <font face="Verdana" size="2">Platform</font>
                </td>
                <td width="4%">
                    <font face="Verdana" size="2">:</font>
                </td>
                <td width="66%">
                    <font face="Verdana" size="2">
                        <%= Request.Browser.Platform%>                        
                        </font>
                </td>
            </tr>           
        </table>
    </div>
    <br />
    <br />
    <font face="Arial" size="3"><b>User Note</b></font>
    <hr align="left" width="50%" color="#04ACB5">
    <div align="left">
        <table border="0" width="100%">
            <tr>
                <td width="100%">
                    <font face="Verdana" size="2">Requires Cookie and Javascript Enabled in your browser.
                    <br />
                    User Must Properly Login From SPAR Tools/Merch Tools.
                    </font>
                </td>                
            </tr>                       
        </table>
    </div>
    </fieldset>
    </td>
    </tr>
    </table>
    </form>
</body>
</html>
