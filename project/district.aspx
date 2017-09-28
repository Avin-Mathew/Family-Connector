<%@ Page Title="" Language="C#" MasterPageFile="~/settings.master" AutoEventWireup="true" MaintainScrollPositionOnPostback="true" CodeFile="district.aspx.cs" Inherits="Family_Connector.district" %>


<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
        .style1
        {
            width: 100%;
        }
        .style2
        {
            height: 26px;
        }
        .style3
        {
            height: 30px;
        }
        .style4
        {
            height: 137px;
        }
        .style5
        {
            height: 26px;
            width: 329px;
        }
        .style6
        {
            width: 329px;
        }
        .style7
        {
            height: 30px;
            width: 329px;
        }
        .style8
        {
            height: 137px;
            width: 329px;
        }
        .style9
        {
            width: 329px;
            height: 23px;
        }
        .style10
        {
            height: 23px;
        }
    .style11
    {
        font-size: medium;
        color: #7497BC;
    }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <table class="style1">
        <tr>
            <td class="style6">
                &nbsp;</td>
            <td class="style11">
                <strong>District</strong></td>
            <td>
                &nbsp;</td>
        </tr>
        <tr>
            <td class="style6">
                &nbsp;</td>
            <td>
                &nbsp;</td>
            <td>
                &nbsp;</td>
        </tr>
        <tr>
            <td class="style6">
                <asp:Label ID="Lbl_Country" runat="server" Text="Country"></asp:Label>
            </td>
            <td>
                <asp:DropDownList ID="DropDown_DistrictCountry" runat="server" 
                    AutoPostBack="True" 
                    onselectedindexchanged="DropDown_DistrictCountry_SelectedIndexChanged">
                </asp:DropDownList>
            </td>
            <td>
                <asp:Label ID="Lbl_DistrictCountry" runat="server" ForeColor="Red" 
                    Text="Select Country" Visible="False"></asp:Label>
            </td>
        </tr>
        <tr>
            <td class="style5">
                <asp:Label ID="Lbl_State" runat="server" Text="State"></asp:Label>
                </td>
            <td class="style2">
                <asp:DropDownList ID="DropDown_DistrictState" runat="server" 
                    AutoPostBack="True" 
                    onselectedindexchanged="DropDown_DistrictState_SelectedIndexChanged">
                </asp:DropDownList>
                </td>
            <td class="style2">
                <asp:Label ID="Lbl_DistrictState" runat="server" ForeColor="Red" 
                    Text="Select Country &amp; State" Visible="False"></asp:Label>
                </td>
        </tr>
        <tr>
            <td class="style9">
                <asp:Label ID="Lbl_District" runat="server" Text="District"></asp:Label>
                </td>
            <td class="style10">
                <asp:TextBox ID="Txt_District" runat="server"></asp:TextBox>
                </td>
            <td class="style10">
                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" 
                    ControlToValidate="Txt_District" ErrorMessage="Enter District Name !!!" 
                    ForeColor="Red" ValidationGroup="a"></asp:RequiredFieldValidator>
                </td>
        </tr>
        <tr>
            <td class="style7">
                <asp:Button ID="Btn_AddDistrict" runat="server" Text="Add" 
                    onclick="Btn_AddDistrict_Click" style="height: 26px" ValidationGroup="a" />
            </td>
            <td class="style3">
                <asp:Button ID="Btn_DistrictView" runat="server" Text="View" 
                    onclick="Btn_DistrictView_Click" />
                </td>
            <td class="style3">
                </td>
        </tr>
        <tr>
            <td class="style9">
                &nbsp;</td>
            <td class="style10">
                &nbsp;</td>
            <td class="style10">
                &nbsp;</td>
        </tr>
        <tr>
            <td class="style8">
                <asp:GridView ID="Grd_District" runat="server" AutoGenerateColumns="False" 
                    DataKeyNames="district_id" onrowcancelingedit="Grd_District_RowCancelingEdit" 
                    onrowdeleting="Grd_District_RowDeleting" onrowediting="Grd_District_RowEditing" 
                    onrowupdating="Grd_District_RowUpdating" 
                    onselectedindexchanged="Grd_District_SelectedIndexChanged" CellPadding="4" 
                    ForeColor="#333333" GridLines="None">
                    <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
                    <Columns>
                        <asp:BoundField DataField="district_name" HeaderText="District" />
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
            <td class="style4">
                &nbsp;</td>
            <td class="style4">
                </td>
        </tr>
        <tr>
            <td class="style6">
                &nbsp;</td>
            <td>
                &nbsp;</td>
            <td>
                &nbsp;</td>
        </tr>
        <tr>
            <td class="style6">
                &nbsp;</td>
            <td>
                &nbsp;</td>
            <td>
                &nbsp;</td>
        </tr>
    </table>
</asp:Content>
