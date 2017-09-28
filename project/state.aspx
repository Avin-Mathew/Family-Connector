<%@ Page Title="" Language="C#" MasterPageFile="~/settings.master" AutoEventWireup="true" MaintainScrollPositionOnPostback="true" CodeFile="state.aspx.cs" Inherits="Family_Connector.state" %>
<%@ Register assembly="AjaxControlToolkit" namespace="AjaxControlToolkit" tagprefix="asp" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
        .style1
        {
            width: 100%;
        }
        .style2
        {
            height: 30px;
        }
        .style3
        {
            height: 23px;
        }
    .style4
    {
        font-size: medium;
        color: #7497BC;
    }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <table class="style1">
        <tr>
            <td>
                &nbsp;</td>
            <td class="style4">
                <strong>State</strong></td>
            <td>
                &nbsp;</td>
        </tr>
        <tr>
            <td>
                &nbsp;</td>
            <td class="style4">
                &nbsp;</td>
            <td>
                &nbsp;</td>
        </tr>
        <tr>
            <td>
                <asp:Label ID="Lbl_CountryState" runat="server" Text="Country"></asp:Label>
            </td>
            <td>
                <asp:DropDownList ID="DropDown_CountryState" runat="server" AutoPostBack="True" 
                    onselectedindexchanged="DropDown_CountryState_SelectedIndexChanged">
                </asp:DropDownList>
            </td>
            <td>
                <asp:Label ID="Label1" runat="server" ForeColor="Red" 
                    Text="Select Country First !!!"></asp:Label>
            </td>
        </tr>
        <tr>
            <td class="style3">
            </td>
            <td class="style3">
            </td>
            <td class="style3">
            </td>
        </tr>
        <tr>
            <td class="style2">
                <asp:Label ID="Lbl_State" runat="server" Text="State"></asp:Label>
            </td>
            <td class="style2">
                <asp:TextBox ID="Txt_State" runat="server"></asp:TextBox>
            </td>
            <td class="style2">
                <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" 
                    ControlToValidate="Txt_State" ErrorMessage="Please Enter State Name !!!" 
                    ForeColor="Red" ValidationGroup="a"></asp:RequiredFieldValidator>
            </td>
        </tr>
        <tr>
            <td class="style3">
                </td>
            <td class="style3">
                </td>
            <td class="style3">
                </td>
        </tr>
        <tr>
            <td>
                <asp:Button ID="Btn_AddState" runat="server" onclick="Btn_AddState_Click" 
                    Text="Add" ValidationGroup="a" />
            </td>
            <td>
                <asp:Button ID="Btn_ViewState" runat="server" onclick="Btn_ViewState_Click" 
                    Text="View" />
            </td>
            <td>
                &nbsp;</td>
        </tr>
        <tr>
            <td class="style3">
                &nbsp;</td>
            <td class="style3">
                </td>
            <td class="style3">
                </td>
        </tr>
        <tr>
            <td>
                <asp:GridView ID="Grd_State" runat="server" AutoGenerateColumns="False" 
                    DataKeyNames="state_id" onrowcancelingedit="Grd_State_RowCancelingEdit" 
                    onrowdeleting="Grd_State_RowDeleting" onrowediting="Grd_State_RowEditing" 
                    onrowupdating="Grd_State_RowUpdating" CellPadding="4" ForeColor="#333333" 
                    GridLines="None">
                    <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
                    <Columns>
                        <asp:BoundField DataField="state_name" HeaderText="State" />
                        <asp:CommandField ShowEditButton="True" />
                        <asp:CommandField ShowDeleteButton="True" />
                    </Columns>
                    <EditRowStyle BackColor="#999999" />
                    <FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                    <HeaderStyle BackColor="#7497BC" Font-Bold="True" ForeColor="White" />
                    <PagerStyle BackColor="#284775" ForeColor="White" HorizontalAlign="Center" />
                    <RowStyle BackColor="#F7F6F3" ForeColor="#333333" />
                    <SelectedRowStyle BackColor="#E2DED6" Font-Bold="True" ForeColor="#333333" />
                    <SortedAscendingCellStyle BackColor="#E9E7E2" />
                    <SortedAscendingHeaderStyle BackColor="#506C8C" />
                    <SortedDescendingCellStyle BackColor="#FFFDF8" />
                    <SortedDescendingHeaderStyle BackColor="#6F8DAE" />
                </asp:GridView>
            </td>
            <td>
                &nbsp;</td>
            <td>
                &nbsp;</td>
        </tr>
        <tr>
            <td>
                &nbsp;</td>
            <td>
                &nbsp;</td>
            <td>
                &nbsp;</td>
        </tr>
    </table>
</asp:Content>
