<%@ Page Title="" Language="C#" MasterPageFile="~/Login.Master" AutoEventWireup="true" MaintainScrollPositionOnPostback="true" CodeFile="login.aspx.cs" Inherits="Family_Connector.login" %>


<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
        .style1
        {
            width: 100%;
        }
        .style2
        {
            font-size: medium;
            color: #7497BC;
            text-align: center;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <table class="style1">
        <tr>
            <td>
                &nbsp;</td>
            <td class="style2" colspan="3">
                <strong>Login</strong></td>
        </tr>
        <tr>
            <td>
                &nbsp;</td>
            <td>
                &nbsp;</td>
            <td>
                &nbsp;</td>
            <td>
                &nbsp;</td>
        </tr>
        <tr>
            <td>
                &nbsp;</td>
            <td>
                <asp:Label ID="Lbl_Username" runat="server" Text="Username"></asp:Label>
            </td>
            <td>
                <asp:TextBox ID="Txt_Username" runat="server" 
                    ontextchanged="Txt_Username_TextChanged"></asp:TextBox>
            </td>
            <td>
                &nbsp;</td>
        </tr>
        <tr>
            <td>
                &nbsp;</td>
            <td>
                <asp:Label ID="Lbl_Password" runat="server" Text="Password"></asp:Label>
            </td>
            <td>
                <asp:TextBox ID="Txt_Password" runat="server" TextMode="Password" 
                    ontextchanged="Txt_Password_TextChanged"></asp:TextBox>
            </td>
            <td>
                &nbsp;</td>
        </tr>
        <tr>
            <td>
                &nbsp;</td>
            <td>
                <asp:Label ID="Lbl_Invalid" runat="server" ForeColor="Red" 
                    Text="Invalid Login !!!"></asp:Label>
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
                <asp:Button ID="Btn_Login" runat="server" Text="Login" 
                    onclick="Btn_Login_Click" />
                <asp:LinkButton ID="LinkButton1" runat="server" onclick="LinkButton1_Click">New User ???</asp:LinkButton>
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
            <td>
                &nbsp;</td>
        </tr>
    </table>
</asp:Content>
