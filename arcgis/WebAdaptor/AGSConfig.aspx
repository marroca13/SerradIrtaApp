<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="AGSConfig.aspx.cs" Inherits="ESRI.ArcGIS.WebAdaptor.ServerConfig"
    Culture="auto" meta:resourcekey="PageResource1" UICulture="auto" validateRequest="false"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html id="wholePage" runat="server" xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
<title>ArcGIS Web Adaptor</title>
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
    
    
<script type="text/javascript" ><%= scriptBody(Server.MapPath("../js/BigInt.js")) %></script>
<script type="text/javascript" ><%= scriptBody(Server.MapPath("../js/RSA.js")) %></script>
<script type="text/javascript" ><%= scriptBody(Server.MapPath("../js/Barrett.js")) %></script>
<script type="text/javascript" ><%= scriptBody(Server.MapPath("../js/admin.js")) %></script>
<script type="text/javascript">
    function Encrypt() {
        var m = document.getElementById('modulus').value;
        var e = document.getElementById('exponent').value;
        return encryptFormData(e, '', m);
    }
</script>
    
</head>
  <body>
    <!-- <img id="agsHeaderIMG" runat="server" alt="ArcGIS Web Adaptor" longdesc="ArcGIS Web Adaptor Configuration" /> -->
    <div class="helpHolder">
      <p id="helpLinkElement" runat="server" class="help">
        <asp:HyperLink ID="helpLink" TabIndex="1" runat="server" Text="<%$ Resources:webAdaptor, wa_help %>" Target="_blank"></asp:HyperLink>
        <span> | </span>
        <a href="#" class="tooltip about" tabindex="2" id="confighelpt1"><asp:Literal ID="waAbout" runat="server" Text="<%$ Resources:webAdaptor, wa_about %>"></asp:Literal>
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
        <p class="center">
          <asp:Literal ID="Literal1" runat="server" Text="<%$ Resources:webAdaptor, wa_description1 %>"></asp:Literal>    
          <asp:Literal ID="Literal2" runat="server" Text="<%$ Resources:webAdaptor, wa_description2 %>"></asp:Literal>
        </p>
        <form id="webadaptorConfig" method="post" onsubmit="return Encrypt();" action="server" runat="server">
          <div>
            <table id="tableConfig" runat="server" class="configTable">
              <tr>
                <td style="width: 250px">
                  <asp:Label ID="siteUrl" AssociatedControlID="txt_siteUrl" runat="server" Text="<%$ Resources:webAdaptor, wa_siteUrlLabel %>"></asp:Label>
                </td>
                <td>
                  <asp:TextBox runat="server" ID="txt_siteUrl" TabIndex="3" Width="250px" />
                  <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="txt_siteUrl" Text="*" ErrorMessage="<%$ Resources:webAdaptor, wa_urlMissing %>"></asp:RequiredFieldValidator>
                <!--</td>
                <td> -->
                  <a href="#" class="tooltip" id="A1" tabindex="4">?
                    <span>
                      <asp:Literal ID="waConfigGisServerToolTip" runat="server" Text="<%$ Resources:webAdaptor, wa_configPageGisServerToolTip %>"></asp:Literal>
                    </span>
                  </a>
                </td>
              </tr>
              <tr>
                <td></td>
                <td class="runAtExample">
                  <asp:Literal ID="exampleUrl" runat="server" Text="<%$ Resources:webAdaptor, wa_exampleUrl %>"></asp:Literal>
                </td>
              </tr>
              <tr>
                <td>
                  <asp:Label ID="Label1" AssociatedControlID="txt_userName" runat="server" Text="<%$ Resources:webAdaptor, wa_userNameLabel %>"></asp:Label>
                </td>
                <td>
                  <asp:TextBox runat="server" ID="txt_userName" TabIndex="5" Width="250px" />
                  <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="txt_userName" ErrorMessage="<%$ Resources:webAdaptor, wa_usernameMissing %>">*</asp:RequiredFieldValidator>
                <!--</td>
                <td> -->
                  <a href="#" class="tooltip" id="confighelpt12" tabindex="6">?
                    <span>
                      <asp:Literal ID="waAdminUserNameToolTip" runat="server" Text="<%$ Resources:webAdaptor, wa_configPageAdminUserNameToolTip%>"></asp:Literal>
                    </span>
                  </a>
                </td>
              </tr>
              <tr>
                <td>
                  <asp:Label ID="Label2" AssociatedControlID="txt_password" runat="server" Text="<%$ Resources:webAdaptor, wa_passwordLabel %>"></asp:Label>
                </td>
                <td>
                  <asp:TextBox runat="server" ID="txt_password" TabIndex="7" TextMode="Password" Width="250px" />
                  <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="txt_password" ErrorMessage="<%$ Resources:webAdaptor, wa_passwordMissing %>">*</asp:RequiredFieldValidator>
                <!--</td>
                <td> -->
                  <a href="#" class="tooltip" id="confighelpt3" tabindex="8">?
                    <span>
                      <asp:Literal ID="waAdminPasswordToolTip" runat="server" Text="<%$ Resources:webAdaptor, wa_configPageAdminPassworkToolTip%>"></asp:Literal>
                    </span>
                  </a>
                </td>
              </tr>
              <tr>
                <td colspan="2" class="enableAdminAccessHolder">
                  <asp:CheckBox ID="cbox_enableAdmin" TabIndex="9" runat="server" Text="<%$ Resources:webAdaptor, wa_enableAdminAccess %>" />
                  <a href="#" class="tooltip" id="confighelpt5" tabindex="10">?
                  <span style="word-wrap: break-word;">
                    <asp:Literal ID="waEnableAdminToolTip" runat="server" Text="<%$ Resources:webAdaptor, wa_configPageEnableAdminToolTip%>"></asp:Literal>
                  </span>
                  </a>
                </td>
              </tr>
              <tr>
                <td></td>
              </tr>
              <tr>
                <td></td>
                <td id="tableCellSubmitButton" runat="server"></td>
              </tr>
              <tr>
                <td></td>
              </tr>
              <tr>
                <td colspan="2">
                  <asp:ValidationSummary ID="ValidationSummary1" HeaderText="<%$ Resources:webAdaptor, wa_validationSum %>" runat="server" />
                </td>
              </tr>
              <tr>
                <td colspan="2">
                  <div class="statusTable">
                    <table>
                      <tr>
                        <td width="50">
                          <img alt="" src="<%= Page.ResolveUrl("~/webadaptor/images/info.png") %>" />
                        </td>
                        <td>
                          <asp:Literal ID="status" runat="server"></asp:Literal>
                          <div id="Div1" runat="server">
                            <asp:Literal ID="machineList" runat="server"></asp:Literal>
                            <asp:Literal ID="lastUpdated" runat="server"></asp:Literal>
                            <div id="Div2" runat="server">
                            	<br/>
                            	<asp:Literal ID="txt_svcDirDescPrefix" runat="server" Visible="false" Text="<%$ Resources:webAdaptor, wa_serviceDirectoryDesc1 %>"></asp:Literal>
                            	<br/>
                            	<asp:HyperLink ID="link_ServiceDirectory" Target="_blank" runat="server" NavigateUrl="~/rest/services" Visible="false" Text="<%$ Resources:webAdaptor, wa_serviceDirectoryDesc2 %>"></asp:HyperLink>                            	
                                <asp:Literal ID="txt_svcDirDescSuffix" Visible="false" runat="server" Text="<%$ Resources:webAdaptor, wa_serviceDirectoryDesc3 %>"></asp:Literal>
                           </div>
                          </div>
                        </td>
                       </tr>
                   </table>
                 </div>
                </td>
              </tr>
            </table>
          </div>
          <div style="clear:both"></div>
          <asp:Button ID="Configurer" OnClick="Configure" runat="server" TabIndex="10" Text="<%$ Resources:webAdaptor, wa_submitButton %>" />
          <asp:Button ID="Button1" OnClick="Back" runat="server" TabIndex="11" CausesValidation="false" Text="<%$ Resources:webAdaptor, wa_config_prev %>" />
          <asp:HiddenField ID="modulus" runat="server"/>
          <asp:HiddenField ID="exponent" runat="server" />
          <asp:HiddenField ID="RequestType" runat="server" />
          <asp:HiddenField ID="showServerWarningMsg" Value="false" runat="server"/>  
        </form>
        <div style="clear:both"></div>
      </div>
    </div>
  
  </body>
</html>
