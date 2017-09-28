<%@ Page Title="" Language="C#" MasterPageFile="~/Login.Master" AutoEventWireup="true" MaintainScrollPositionOnPostback="true" CodeFile="visitor_feedback.aspx.cs" Inherits="Family_Connector.feedback" %>


<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
        .style1
        {
            width: 100%;
        }
        .style2
        {
            height: 25px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <table class="style1">
        <tr>
            <td colspan="3" 
                style="text-align: center; font-weight: 700; font-size: medium; color: #7497BC">
                Feedback</td>
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
            <td>
                &nbsp;</td>
        </tr>
        <tr>
            <td>
                                <asp:Label ID="Label5" runat="server" Text="Name"></asp:Label>
                            </td>
            <td>
                                <asp:TextBox ID="Txt_Name" runat="server" 
                    ontextchanged="Txt_Name_TextChanged"></asp:TextBox>
                                </td>
            <td>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" 
                                    ControlToValidate="Txt_Name" ErrorMessage="Enter Name" ForeColor="Red" 
                                    ValidationGroup="a"></asp:RequiredFieldValidator>
                            </td>
            <td>
                &nbsp;</td>
            <td>
                &nbsp;</td>
        </tr>
        <tr>
            <td>
                                <asp:Label ID="Label6" runat="server" Text="Email"></asp:Label>
                            </td>
            <td>
                                <asp:TextBox ID="Txt_Email" runat="server" 
                                    ontextchanged="Txt_Email_TextChanged"></asp:TextBox>
                                </td>
            <td>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" 
                                    ControlToValidate="Txt_Email" ErrorMessage="Enter Email" ForeColor="Red" 
                                    ValidationGroup="a"></asp:RequiredFieldValidator>
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
                                <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" 
                                    ControlToValidate="Txt_Email" ErrorMessage="Invalid Email" ForeColor="Red" 
                                    
                    ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"></asp:RegularExpressionValidator>
                            </td>
            <td>
                &nbsp;</td>
            <td>
                &nbsp;</td>
            <td>
                &nbsp;</td>
        </tr>
        <tr>
            <td>
                                <asp:Label ID="Label7" runat="server" Text="Feedback"></asp:Label>
                            </td>
            <td>
                                <asp:TextBox ID="Txt_Feedback" runat="server" 
                                    ontextchanged="Txt_Feedback_TextChanged" 
                    TextMode="MultiLine"></asp:TextBox>
                                </td>
            <td>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" 
                                    ControlToValidate="Txt_Feedback" 
                    ErrorMessage="Enter Feedback" ForeColor="Red" 
                                    ValidationGroup="a"></asp:RequiredFieldValidator>
                            </td>
            <td>
                &nbsp;</td>
            <td>
                &nbsp;</td>
        </tr>
        <tr>
            <td>
                                <asp:Button ID="Btn_Send" runat="server" 
                    onclick="Btn_Send_Click" Text="Send" 
                                    ValidationGroup="a" />
                            </td>
            <td>
                                <asp:Button ID="Btn_Cancel" runat="server" onclick="Btn_Cancel_Click" 
                                    Text="Cancel" />
                            </td>
            <td>
                &nbsp;</td>
            <td>
                &nbsp;</td>
            <td>
                &nbsp;</td>
        </tr>
        <tr>
            <td>
                                <asp:Label ID="Lbl_Thanks" runat="server" ForeColor="#0066CC" 
                                    Text="Thanks for contacting us" Visible="False"></asp:Label>
                            </td>
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
                <asp:Panel ID="Panel1" runat="server">
                </asp:Panel>
            </td>
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
