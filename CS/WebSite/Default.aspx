<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Default.aspx.cs" Inherits="_Default" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">

<head runat="server">
    <title></title>
    <script type="text/javascript">
        function gvProducts_EndCallback(s, e) {
            if (s.cpShowDeleteConfirmBox)
                pcConfirm.Show();
        }

        function Yes_Click() {
            pcConfirm.Hide();
            gvProducts.DeleteRow(gvProducts.cpRowIndex);            
        }

        function No_Click() {
            pcConfirm.Hide()
        }
    </script>
</head>
<body>
    <form id="form1" runat="server">
    <div>
        <dx:ASPxGridView ID="gvProducts" runat="server" ClientInstanceName="gvProducts" AutoGenerateColumns="False"
            DataSourceID="dsProducts" KeyFieldName="ProductID" OnCustomButtonCallback="gvProducts_CustomButtonCallback"
            OnInit="gvProducts_Init" OnRowDeleting="gvProducts_RowDeleting" OnCustomErrorText="ASPxGridView1_CustomErrorText">
            <Columns>
                <dx:GridViewCommandColumn VisibleIndex="0" ShowClearFilterButton="True">
                    <CustomButtons>
                        <dx:GridViewCommandColumnCustomButton ID="btDelete" Text="Delete" Visibility="AllDataRows">
                        </dx:GridViewCommandColumnCustomButton>
                    </CustomButtons>
                </dx:GridViewCommandColumn>
                <dx:GridViewDataTextColumn FieldName="ProductID" ReadOnly="True" VisibleIndex="1">
                    <EditFormSettings Visible="False" />
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="ProductName" VisibleIndex="2">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="UnitPrice" VisibleIndex="3">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="UnitsInStock" VisibleIndex="4">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataCheckColumn FieldName="Discontinued" VisibleIndex="5">
                </dx:GridViewDataCheckColumn>
            </Columns>
            <ClientSideEvents EndCallback="gvProducts_EndCallback" />
        </dx:ASPxGridView>
        <dx:ASPxPopupControl ID="pcConfirm" runat="server" ClientInstanceName="pcConfirm"
            Modal="True" PopupHorizontalAlign="WindowCenter" PopupVerticalAlign="WindowCenter"
            HeaderText="Row Deleting">
            <ContentCollection>
                <dx:PopupControlContentControl runat="server" SupportsDisabledAttribute="True">
                    <table width="100%">
                        <tr>
                            <td colspan="2" align="center">
                                Delete Row?
                            </td>
                        </tr>
                        <tr>
                            <td align="center">
                                <a href="javascript:Yes_Click()">Yes</a>
                            </td>
                            <td align="center">
                                <a href="javascript:No_Click()">No</a>
                            </td>
                        </tr>
                    </table>
                </dx:PopupControlContentControl>
            </ContentCollection>
        </dx:ASPxPopupControl>
        <asp:AccessDataSource ID="dsProducts" runat="server" DataFile="~/App_Data/nwind.mdb"
            SelectCommand="SELECT [ProductID], [ProductName], [UnitPrice], [UnitsInStock], [Discontinued] FROM [Products]">
        </asp:AccessDataSource>
    </div>
    </form>
</body>
</html>
