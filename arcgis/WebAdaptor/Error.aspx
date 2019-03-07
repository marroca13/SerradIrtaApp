<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Error.aspx.cs" Inherits="ESRI.ArcGIS.WebAdaptor.webadaptor.Error" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
<style><%= scriptBody(Server.MapPath("~/css/webadaptor.css") ) %></style>

  <title><asp:Literal ID="Literal1" runat="server" Text="<%$ Resources:webAdaptor, wa_application_error %>" /></title>
</head>
<body>
    <div class="helpHolder">
      <p id="helpLinkElement" runat="server" class="help">
      </p>
    </div>
    <div class="configDialog pane">
	   <div class="logoHolder">
	     <img alt="Esri Logo" class="logoImg" src="<%= Page.ResolveUrl("~/webadaptor/images/logo.png") %>" />
	     <h1>ArcGIS Web Adaptor</h1>
	   </div>
	   <div class="paneTitleBar"></div>
	<div id="contentHolder" class="paneContent">

<div id="Div2" class="statusTable" style="background: #FFCDCD; padding-top: 5px; margin-top: 14px">
                      <table>
                        <tr>
                          <td width="50">
                            <img alt="" src="<%= Page.ResolveUrl("~/webadaptor/images/error.png") %>" />
                          </td>
                          <td>
							<p class="errorLabel">
							    <asp:Literal runat="server" Text="" ID="ErrorMSG"></asp:Literal>
                                <asp:HyperLink ID="helpLink" Target="_blank" runat="server" NavigateUrl=""
                                        Visible="false"></asp:HyperLink>
							</p> 
                          </td>
                        </tr>
                      </table>
                    </div>

	</div>
      </div>
</body>
</html>
