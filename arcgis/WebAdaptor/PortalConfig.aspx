<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="PortalConfig.aspx.cs" Inherits="ESRI.ArcGIS.WebAdaptor.PortalConfig"
    Culture="auto" meta:resourcekey="PageResource1" UICulture="auto" validateRequest="false"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html id="portalWholePage" runat="server" xmlns="http://www.w3.org/1999/xhtml">
<head id="portalHead1" runat="server">
<title></title>
<style><%= scriptBody(Server.MapPath("~/css/webadaptor.css") ) %></style>
<!--[if lte IE 8]>
<style>

  .pane {
    border: 2px solid #D0D0D0;
  }
  .statusTable {
    border: 1px solid #D0D0D0;
  }
  a.tooltip:hover span {
    border: 1px solid #D0D0D0;
  }
  input[type=submit] {
    margin: 0 0 0 6px;
  }
</style>
<![endif]-->

<script type="text/javascript">
    function resetDivs() {
        var configureStatus = document.getElementById('configureStatus');
        if (configureStatus != null)
            configureStatus.style.display = "none";
    }

</script>

</head>
  <body onload="resetDivs();">
  <!-- <img id="portalHeaderIMG" runat="server" alt="ArcGIS Web Adaptor" longdesc="ArcGIS Web Adaptor Configuration" /> -->
    <div class="helpHolder">
      <p id="portalHelpLinkElement" runat="server" class="help">
        <asp:HyperLink ID="portalHelpLink" TabIndex="1" runat="server" Text="<%$ Resources:webAdaptor, wa_help %>" Target="_blank"></asp:HyperLink>
        <span> | </span>
        <a href="#" class="tooltip about" id="confighelpt1" tabindex="2"><asp:Literal ID="waAbout" runat="server" Text="<%$ Resources:webAdaptor, wa_about %>"></asp:Literal>
            <span style="width:auto;text-align:justify;">
              <asp:Literal ID="waInfo1" runat="server"></asp:Literal>
                <br />
              <asp:Literal ID="waInfo2" runat="server"></asp:Literal>
            </span>
        </a>
      </p>
    </div>
      <div class="configDialog pane">
        <div class="logoHolder">
          <img alt="Esri Logo" class="logoImg" src="<%= Page.ResolveUrl("~/webadaptor/images/logo.png") %>" />
          <h1>ArcGIS Web Adaptor</h1>
        </div>
        <div class="paneTitleBar"></div>
        <div id="contentHolder" class="paneContent">
          <p>
            <asp:Literal ID="Literal1" runat="server" Text="<%$ Resources:webAdaptor, wa_portal_description1 %>"></asp:Literal>
            <asp:Literal ID="Literal2" runat="server" Text="<%$ Resources:webAdaptor, wa_description2 %>"></asp:Literal>
          </p>
          <form id="portalWebadaptorConfig" method="post" action="portal" runat="server">
          <div>
            <table id="portalTableConfig" runat="server" class="configTable">
              <tr>
                <td width="240">
                  <asp:Label ID="portalUrl" AssociatedControlID="txt_portalUrl" runat="server" Text="<%$ Resources:webAdaptor, wa_portal_portalUrlLabel %>"></asp:Label>
                </td>
                <td>
                  <asp:TextBox runat="server" ID="txt_portalUrl" TabIndex="3" Width="250px"  />
                  <asp:RequiredFieldValidator ID="portalRequiredFieldValidator1" runat="server" ControlToValidate="txt_portalUrl" Text="*" ErrorMessage="<%$ Resources:webAdaptor, wa_portal_urlMissing %>"></asp:RequiredFieldValidator>
                  <a href="#" class="tooltip" id="A1" tabindex="4">?
                    <span>
                      <asp:Literal ID="waPortalConfigToolTip" runat="server" Text="<%$ Resources:webAdaptor, wa_portal_configPagePortalToolTip %>"></asp:Literal>
                    </span>
                  </a>
                </td>
              </tr>
              <tr>
                <td></td>
                <td class="ExampleLabel">
                  <asp:Literal ID="portalExampleUrl" runat="server" Text="<%$ Resources:webAdaptor, wa_portal_exampleUrl %>"></asp:Literal>
                </td>
              </tr>
              <tr>
                <td>
                  <asp:Label ID="Label1" AssociatedControlID="txt_userName" runat="server" Text="<%$ Resources:webAdaptor, wa_userNameLabel %>"></asp:Label>
                </td>
                <td>
                  <asp:TextBox TabIndex="5" runat="server" ID="txt_userName" Width="250px" />
                  <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="txt_userName" ErrorMessage="<%$ Resources:webAdaptor, wa_usernameMissing %>">*</asp:RequiredFieldValidator>
                  <a href="#" tabindex="6" class="tooltip" id="confighelpt12" tabindex="-1">?
                    <span>
                      <asp:Literal ID="waAdminUserNameToolTip" runat="server" Text="<%$ Resources:webAdaptor, wa_portalConfigPageAdminUserNameToolTip%>"></asp:Literal>
                    </span>
                  </a>
                </td>
              </tr>
              <tr>
                <td>
                  <asp:Label ID="Label2" AssociatedControlID="txt_password" runat="server" Text="<%$ Resources:webAdaptor, wa_passwordLabel %>"></asp:Label>
                </td>
                <td>
                  <asp:TextBox TabIndex="7" runat="server" ID="txt_password" TextMode="Password" Width="250px" />
                  <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="txt_password" ErrorMessage="<%$ Resources:webAdaptor, wa_passwordMissing %>">*</asp:RequiredFieldValidator>
                <!--</td>
                <td> -->
                  <a href="#" class="tooltip" id="confighelpt3" tabindex="8">?
                    <span>
                      <asp:Literal ID="waAdminPasswordToolTip" runat="server" Text="<%$ Resources:webAdaptor, wa_portalConfigPageAdminPasswordToolTip%>"></asp:Literal>
                    </span>
                  </a>
                </td>
              </tr>
              <tr>
                <td></td>
              </tr>
              <tr>
                <td colspan="2">
                  <asp:ValidationSummary ID="portalValidationSummary1" HeaderText="<%$ Resources:webAdaptor, wa_portalValidationSum %>" runat="server" />
                </td>
              </tr>
              <tr>
                <td style="width: 500px" colspan="2">
                  <div id="statusTable" class="statusTable">
                    <table>
                      <tr>
                        <td width="40">
                          <img alt="" src="<%= Page.ResolveUrl("~/webadaptor/images/info.png") %>" />
                        </td>
                        <td>
                          <asp:Literal ID="portalStatus" runat="server"></asp:Literal>
                          <asp:Literal ID="portalMachineList" runat="server"></asp:Literal>
                          <asp:Literal ID="portalLastUpdated" runat="server"></asp:Literal>
                          <div id="Div2" runat="server">
                          	<br/>
                          	<asp:Literal ID="portalTxt_svcDirDescPrefix" runat="server" Visible="false" Text="<%$ Resources:webAdaptor, wa_portalURLDesc1%>"></asp:Literal>
                          	<br/>
                          	<asp:HyperLink ID="portalLink_ServiceDirectory" Target="_blank" runat="server" NavigateUrl="~/home" Visible="false" Text="<%$ Resources:webAdaptor, wa_portalURLDesc2 %>"></asp:HyperLink>
                          	<br/>
                          	<asp:Literal ID="portalTxt_svcDirDescSuffix" Visible="false" runat="server" Text="<%$ Resources:webAdaptor, wa_portalURLDesc3 %>"></asp:Literal>
                          </div>                          
                        </td>
                      </tr>
                    </table>
                  </div>
                  <div id="configureStatus" class="statusTable" style="display:none;">
                    <table>
                      <tr>
                        <td width="40">
                          <img alt="" src="<%= Page.ResolveUrl("~/webadaptor/images/info.png") %>" />
                        </td>
                        <td>
                         <div id="div3">
                          	<asp:Literal ID="Literal3" runat="server" Text="<%$ Resources:webAdaptor, wa_portal_loading_message%>"></asp:Literal>
                          	<asp:Literal ID="Literal4" runat="server" Text="<%$ Resources:webAdaptor, wa_portal_loading_message1%>"></asp:Literal>
                          </div>                       
                        </td>
                      </tr>
                    </table>
                  </div>
                </td>
              </tr>
              <tr>
                <td id="tableCellSubmitButton" runat="server" colspan="2">
                  <asp:Button ID="portalConfigurer" TabIndex="9" onClick="Configure" runat="server" Text="<%$ Resources:webAdaptor, wa_submitButton %>" />
                  <asp:Button ID="portalBack" OnClick="Back" TabIndex="10" runat="server" CausesValidation="false" Text="<%$ Resources:webAdaptor, wa_config_prev %>" />
                </td>
              </tr>
            </table>
          </div>
          <asp:HiddenField ID="portalModulus" runat="server"/>
          <asp:HiddenField ID="portalExponent" runat="server" />
          <asp:HiddenField ID="RequestType" runat="server" />
          <asp:HiddenField ID="showPortalWarningMsg" Value="false" runat="server"/>
        </form>
        <div style="clear:both"></div>
      </div>
    </div>

  </body>
</html>
