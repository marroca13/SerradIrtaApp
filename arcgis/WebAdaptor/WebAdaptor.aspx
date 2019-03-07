<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="WebAdaptorConfig.aspx.cs" Inherits="ESRI.ArcGIS.WebAdaptor.WebAdaptor"
    Culture="auto" meta:resourcekey="PageResource1" UICulture="auto" validateRequest="false"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html id="waWholePage" runat="server" xmlns="http://www.w3.org/1999/xhtml">
<head id="waHead1" runat="server"><title></title>
<style><%= scriptBody(Server.MapPath("~/css/webadaptor.css") ) %></style>

<!--[if lte IE 8]>
<style>

  .pane {
    border: 2px solid #D0D0D0;
  }
  .statusTable {
    border: 1px solid #D0D0D0;
  }

</style>
<![endif]-->

</head>
    <script type="text/javascript">
        function setErrorTexts() {
            var waConfigError = document.getElementById('waConfigError').value;
            var portalConfigured = document.getElementById('portalConfigured').value;
            var portalOptions = document.getElementById('portalOptions').value;
            var serverSel = document.getElementById('radio_Server');
            var portalSel = document.getElementById('radio_Portal');
            var showPortalWarningMsg = document.getElementById('showPortalWarningMsg');
            var showServerWarningMsg = document.getElementById('showServerWarningMsg');

            resetDivs();

            if (portalOptions == "server") {
                serverSel.checked = true;
                if (waConfigError != null && waConfigError != "true") {
                    document.getElementById('statusTable').style.display = "block";
                    document.getElementById('waErrorDiv').style.display = "block";
                    document.getElementById('waConfigError1Div').style.display = "block";
                }
                if (showServerWarningMsg != null && showServerWarningMsg.value == "true") {
                    document.getElementById('multipleWATable').style.display = "block";
                }
            } else if (portalOptions == "portal") {
                portalSel.checked = true;
                if (portalConfigured != null && portalConfigured != "true") {
                    document.getElementById('statusTable').style.display = "block";
                    document.getElementById('waPortalPrereqdiv').style.display = "block";
                }
                if (waConfigError != null && waConfigError != "true") {
                    document.getElementById('statusTable').style.display = "block";
                    document.getElementById('waErrorDiv').style.display = "block";
                    document.getElementById('waConfigError2Div').style.display = "block";
                }
                if (showPortalWarningMsg != null && showPortalWarningMsg.value == "true") {
                    document.getElementById('multipleWATable').style.display = "block";
                }
            } else {
                serverSel.checked = true;
                portalOptions.value = "server";
                if (showServerWarningMsg != null && showServerWarningMsg.value == "true") {
                    document.getElementById('multipleWATable').style.display = "block";
                }
            }
        }

        function resetDivs() {
            document.getElementById('waErrorDiv').style.display = "none";
            document.getElementById('waPortalPrereqdiv').style.display = "none";
            document.getElementById('statusTable').style.display = "none";
            document.getElementById('waConfigError1Div').style.display = "none";
            document.getElementById('waConfigError2Div').style.display = "none";
            document.getElementById('multipleWATable').style.display = "none";
        }

        function setPortalOptions(portalOption) {
            resetDivs();
            var waConfigError = document.getElementById('waConfigError').value;
            var showPortalWarningMsg = document.getElementById('showPortalWarningMsg');
            var portalConfigured = document.getElementById('portalConfigured').value;
            var portalOptions = document.getElementById('portalOptions');
            if (portalOption.checked) {
                portalOptions.value = "portal";
                if (portalConfigured != null && portalConfigured != "true") {
                    document.getElementById('statusTable').style.display = "block";
                    document.getElementById('waPortalPrereqdiv').style.display = "block";
                }
                if (waConfigError != null && waConfigError != "true") {
                    document.getElementById('statusTable').style.display = "block";
                    document.getElementById('waErrorDiv').style.display = "block";
                    document.getElementById('waConfigError2Div').style.display = "block";
                }
                if (showPortalWarningMsg != null && showPortalWarningMsg.value == "true") {
                    document.getElementById('multipleWATable').style.display = "block";
                }
            }
        }

        function setServerOptions(serverOption) {
            resetDivs();
            var portalOptions = document.getElementById('portalOptions');
            var waConfigError = document.getElementById('waConfigError').value;
            if (serverOption.checked) {
                portalOptions.value = "server";
                if (waConfigError != null && waConfigError != "true") {
                    document.getElementById('statusTable').style.display = "block";
                    document.getElementById('waErrorDiv').style.display = "block";
                    document.getElementById('waConfigError1Div').style.display = "block";
                }
                if (showServerWarningMsg != null && showServerWarningMsg.value == "true") {
                    document.getElementById('multipleWATable').style.display = "block";
                }
            }
        }

    </script><body onload="setErrorTexts()">
    <!-- <img style="dispaly:none" id="waHeaderIMG" runat="server" alt="ArcGIS Web Adaptor" longdesc="ArcGIS Web Adaptor Configuration" /> -->
      <div class="helpHolder">
        <p id="waHelpLinkElement" runat="server" class="help">
          <asp:HyperLink TabIndex="1" ID="waHelpLink" runat="server" Text="<%$ Resources:webAdaptor, wa_help %>" Target="_blank"></asp:HyperLink>
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
          <p class="center">
            <asp:Label ID="Literal1" runat="server" Text="<%$ Resources:webAdaptor, wa_config_server_or_portal %>" class="LabelText"></asp:Label>
            <asp:Literal ID="Literal2" runat="server" Text="<%$ Resources:webAdaptor, wa_description2 %>"></asp:Literal>
          </p>
          <form id="waConfig" method="post" action="webadaptor" runat="server">
            <div>
              <table id="waTableConfig" runat="server" class="configTable">
                <tr>
                  <td class="radioHolder">
                    <asp:RadioButton TabIndex="3" runat="server" ID="radio_Server" GroupName="selectOptions" onclick="setServerOptions(this);" ></asp:RadioButton>
                    <asp:Label ID="Literal3" AssociatedControlID="radio_Server" runat="server" Text="<%$ Resources:webAdaptor, wa_config_server %>"></asp:Label>
                  </td>                
                </tr>
                <tr>
                  <td class="radioHolder">
                    <asp:RadioButton TabIndex="4"  runat="server" ID="radio_Portal" GroupName="selectOptions" onclick="setPortalOptions(this);"></asp:RadioButton>
                    <asp:Label ID="Literal4" AssociatedControlID="radio_Portal" runat="server" Text="<%$ Resources:webAdaptor, wa_config_portal %>"></asp:Label>
                  </td>
                  <td id="tableCellSubmitButton" runat="server"></td>
                </tr>
                <tr>
				    <td colspan="2">
		               <div id="multipleWATable" class="statusTable" style="background: #ffffcb">
		                  <table>
		                     <tr>
		                    	   <td width="50">
		                        		<img alt="" src="<%= Page.ResolveUrl("~/webadaptor/images/warning.png") %>" />
		                        	</td>
		                        <td>
				    				<div class="HighLightText">
										<asp:Label ID="multipleWATableLabel" Text="<%$ Resources:webAdaptor, wa_config_warning %>" runat="server"/>
						            </div>
						        </td>
			               </tr>
		                 </table>
		               </div>
		             </td>
	            </tr>
                <tr>
                  <td colspan="2">
                    <div id="statusTable" class="statusTable" style="background: #ffffcb">
                      <table>
                        <tr>
                          <td width="50">
                            <img alt="" src="<%= Page.ResolveUrl("~/webadaptor/images/warning.png") %>" />
                          </td>
                          <td>
                            <asp:Label ID="waPortalPrereq" class="HighLightText" runat="server"></asp:Label>
                           <asp:Label ID="waPortalStatus" class="HighLightText" runat="server"></asp:Label>
                    <div id="waErrorDiv" class="ErrorText" runat="server">
						<br/>
                        <div id="waConfigError1Div" class="ErrorText" runat="server">
                            <asp:Label ID="waConfigError1"  runat="server"></asp:Label>
                            <asp:HyperLink ID="waConfigError3" Target="_blank" runat="server" NavigateUrl=""
                         Visible="false" Text="<%$ Resources:webAdaptor, waConfigServerError3 %>"></asp:HyperLink>
                        </div>
                        <div id="waConfigError2Div">
                            <asp:Label ID="waConfigError2"  runat="server"></asp:Label>
                            <asp:HyperLink ID="waConfigError4" Target="_blank" runat="server" NavigateUrl=""
                         Visible="false" Text="<%$ Resources:webAdaptor, waConfigServerError3 %>"></asp:HyperLink>    
                        </div>                       
                     </div>
                     <div id="waPortalPrereqdiv" class="ErrorText" runat="server">
						<br/>
                        <asp:Label ID="waPortalConfigError1"  runat="server"></asp:Label>                       
                        <asp:Label ID="waPortalConfigError2"  runat="server"></asp:Label>
                         <asp:HyperLink ID="waPortalConfigError3" Target="_blank" runat="server" NavigateUrl=""
                         Visible="false" Text="<%$ Resources:webAdaptor, wa_portal_prereq_desc3 %>"></asp:HyperLink>
                     </div>
                          </td>
                        </tr>
                      </table>
                    </div>
                  </td>
                </tr>
                <tr></tr>
                <tr>
                 <td colspan="2">
                    <div id="Div2" class="statusTable">
                      <table>
                        <tr>
                          <td width="50">
                            <img alt="" src="<%= Page.ResolveUrl("~/webadaptor/images/info.png") %>" />
                          </td>
                          <td>
                           <!--  <div id="Div5" class="ErrorText" runat="server">
                                <asp:Literal ID="waStatus" runat="server" Text="<%$ Resources:webAdaptor, wa_config_status %>"></asp:Literal> 
                            </div>-->
                            <div id="Div3" class="ErrorText" runat="server">
                              <asp:Label ID="serverConfigStatus"  runat="server"></asp:Label>
                            </div>
                            <div id="Div4" class="ErrorText" runat="server">
                              <asp:Label ID="portalConfigStatus"  runat="server"></asp:Label>
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
            <asp:Button ID="waNext" TabIndex="5" OnClick="Configure" runat="server" Text="<%$ Resources:webAdaptor, wa_config_next %>"  class="LabelText" />
            <asp:HiddenField ID="portalOptions" Value="server" runat="server"/>
            <asp:HiddenField ID="portalConfigured" Value="" runat="server"/>
            <asp:HiddenField ID="waConfigError" Value="" runat="server"/>
            <asp:HiddenField ID="waConfigTrustLevelError" Value="false" runat="server"/>
            <asp:HiddenField ID="showPortalWarningMsg" Value="false" runat="server"/>
            <asp:HiddenField ID="showServerWarningMsg" Value="false" runat="server"/>
          </form>
          <div style="clear:both"></div>
        </div>
      </div>
  </body>
</html>

