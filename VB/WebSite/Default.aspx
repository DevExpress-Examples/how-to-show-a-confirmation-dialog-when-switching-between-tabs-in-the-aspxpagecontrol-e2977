<%@ Page Language="vb" AutoEventWireup="true" CodeFile="Default.aspx.vb" Inherits="_Default" %>

<%@ Register Assembly="DevExpress.Web.v13.1, Version=13.1.4.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
	Namespace="DevExpress.Web.ASPxEditors" TagPrefix="dx" %>
<%@ Register Assembly="DevExpress.Web.v13.1, Version=13.1.4.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
	Namespace="DevExpress.Web.ASPxPopupControl" TagPrefix="dx" %>
<%@ Register Assembly="DevExpress.Web.v13.1, Version=13.1.4.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
	Namespace="DevExpress.Web.ASPxClasses" TagPrefix="dx" %>
<%@ Register Assembly="DevExpress.Web.v13.1, Version=13.1.4.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
	Namespace="DevExpress.Web.ASPxTabControl" TagPrefix="dx" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
	<title>How to show a modal popup window between tab changes</title>

	<script type="text/javascript">
		var tab = null;
		function OnActiveTabChanging(s, e){
			if (tab == null) {
				tab = e.tab;
				popup.Show();
				e.cancel = true;
			}
		}
		function OnCkickOK(s, e){            
			popup.Hide();
			pc.SetActiveTab(tab);
			tab = null;
		}
		function OnCkickCancel(s, e) { 
			tab = null; 
			popup.Hide();
		}        
	</script>

</head>
<body>
	<form id="form1" runat="server">
		<div>
			<dx:ASPxPageControl ID="pc" ClientInstanceName="pc" runat="server" ActiveTabIndex="0"
				Height="130px" Width="152px">
				<TabPages>
					<dx:TabPage>
						<ContentCollection>
							<dx:ContentControl ID="ContentControl1" runat="server">
							</dx:ContentControl>
						</ContentCollection>
					</dx:TabPage>
					<dx:TabPage>
						<ContentCollection>
							<dx:ContentControl ID="ContentControl2" runat="server">
							</dx:ContentControl>
						</ContentCollection>
					</dx:TabPage>
				</TabPages>
				<ClientSideEvents ActiveTabChanging="OnActiveTabChanging" />
			</dx:ASPxPageControl>
			<dx:ASPxPopupControl ID="popup" ClientInstanceName="popup" runat="server" CloseAction="CloseButton"
				Modal="true" PopupHorizontalAlign="WindowCenter" PopupVerticalAlign="WindowCenter">
				<ContentCollection>
					<dx:PopupControlContentControl runat="server">
						Are you sure?
						<table>
							<tr>
								<td>
									<dx:ASPxButton ID="btnOk" runat="server" Text="Ok" AutoPostBack="False" UseSubmitBehavior="False"
										CausesValidation="False">
										<ClientSideEvents Click="OnCkickOK" />
									</dx:ASPxButton>
								</td>
								<td>
									<dx:ASPxButton ID="btnCancel" runat="server" Text="Cancel" AutoPostBack="False" UseSubmitBehavior="False"
										CausesValidation="False">
										<ClientSideEvents Click="OnCkickCancel" />
									</dx:ASPxButton>
								</td>
							</tr>
						</table>
					</dx:PopupControlContentControl>
				</ContentCollection>
			</dx:ASPxPopupControl>
		</div>
	</form>
</body>
</html>
