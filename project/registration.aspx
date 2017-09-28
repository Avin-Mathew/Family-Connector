<%@ Page Title="" Language="C#" MasterPageFile="~/Login.Master" AutoEventWireup="true"  MaintainScrollPositionOnPostback="true" CodeFile="registration.aspx.cs" Inherits="Family_Connector.Registration" %>
<%@ Register assembly="AjaxControlToolkit" namespace="AjaxControlToolkit" tagprefix="asp" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
        .style1
        {
            height: 26px;
        }
        .style2
        {
            width: 100%;
        }
        .style3
        {
            height: 23px;
        }
        .style4
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
        <td colspan="3" class="style4">
            <strong>Registration</strong></td>
    </tr>
    <tr>
        <td colspan="2">
            &nbsp;</td>
        <td>
            &nbsp;</td>
    </tr>
    <tr>
        <td colspan="2">
            <asp:Panel ID="Panel1" runat="server" GroupingText="Family Details">
                <table class="style2">
                    <tr>
                        <td>
                            <asp:Label ID="Lbl_Grp" runat="server" Text="Group"></asp:Label>
                        </td>
                        <td>
                            <asp:DropDownList ID="DropDown_Group" runat="server" AutoPostBack="True" 
                                onselectedindexchanged="DropDown_Group_SelectedIndexChanged">
                            </asp:DropDownList>
                        </td>
                        <td>
                            <asp:Label ID="Lbl_Group" runat="server" ForeColor="Red" Text="Select Family Group !!!" 
                                Visible="False"></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <asp:Label ID="Lbl_Head" runat="server" Text="Family Head"></asp:Label>
                        </td>
                        <td>
                            <asp:DropDownList ID="DropDown_Family_Head" runat="server" AutoPostBack="True" 
                                onselectedindexchanged="DropDown_Family_Head_SelectedIndexChanged">
                            </asp:DropDownList>
                        </td>
                        <td>
                            <asp:Label ID="Lbl_Father" runat="server" ForeColor="Red" 
                                Text="Select Family Head !!!" Visible="False"></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <asp:Label ID="Lbl_Relation" runat="server" Text="Relationship With The Head"></asp:Label>
                        </td>
                        <td>
                            <asp:DropDownList ID="DropDown_Relationship" runat="server" AutoPostBack="True" 
                                onselectedindexchanged="DropDown_Relationship_SelectedIndexChanged">
                            </asp:DropDownList>
                        </td>
                        <td>
                            <asp:Label ID="Label21" runat="server" ForeColor="Red" 
                                Text="Select Relationship With The Family Head !!!" Visible="False"></asp:Label>
                        </td>
                    </tr>
                </table>
            </asp:Panel>
        </td>
        <td>
            &nbsp;</td>
    </tr>
    <tr>
        <td colspan="2">
            &nbsp;</td>
        <td>
            &nbsp;</td>
    </tr>
    <tr>
        <td colspan="2">
            <asp:Panel ID="Panel4" runat="server" GroupingText="Personal Details">
                <table class="style2">
                    <tr >
                        <td >
                            <asp:Label ID="Lbl_Fname" runat="server" Text="First Name"></asp:Label>
                        </td>
                        <td>
                            <asp:TextBox ID="Txt_Fname" runat="server" 
                                ontextchanged="Txt_Fname_TextChanged"></asp:TextBox>
                        </td>
                        <td>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" 
                                ControlToValidate="Txt_Fname" ErrorMessage="First Name Cannot Be Empty" 
                                ForeColor="Red" ValidationGroup="a"></asp:RequiredFieldValidator>
                        </td>
                        <td>
                            <asp:Label ID="Lbl_Lname" runat="server" Text="Last Name"></asp:Label>
                        </td>
                        <td>
                            <asp:TextBox ID="Txt_Lname" runat="server"></asp:TextBox>
                        </td>
                        <td rowspan="2">
                            &nbsp;</td>
                        <td rowspan="2">
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" 
                                ControlToValidate="Txt_Lname" ErrorMessage="Last Name Cannot Be Empty" 
                                ForeColor="Red" ValidationGroup="a"></asp:RequiredFieldValidator>
                        </td>
                        <td rowspan="2">
                            <asp:Label ID="Lbl_Nick" runat="server" Text="Nick Name (If Any)"></asp:Label>
                        </td>
                        <td>
                            <asp:TextBox ID="Txt_Nick" runat="server"></asp:TextBox>
                        </td>
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
                        <td>
                            &nbsp;</td>
                    </tr>
                    <tr>
                        <td>
                            <asp:Label ID="Lbl_Gender" runat="server" Text="Gender"></asp:Label>
                        </td>
                        <td>
                            <asp:RadioButtonList ID="RBL_Gender" runat="server">
                                <asp:ListItem>Male</asp:ListItem>
                                <asp:ListItem>Female</asp:ListItem>
                            </asp:RadioButtonList>
                        </td>
                        <td>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" 
                                ControlToValidate="RBL_Gender" ErrorMessage="Select Gender !!!" ForeColor="Red" 
                                ValidationGroup="a"></asp:RequiredFieldValidator>
                        </td>
                        <td>
                            <asp:Label ID="Label23" runat="server" 
                                Text="Marital Status"></asp:Label>
                        </td>
                        <td colspan="2">
                            <asp:RadioButtonList ID="RBL_Marital" runat="server" 
                                AutoPostBack="True">
                                <asp:ListItem>Single</asp:ListItem>
                                <asp:ListItem>Married</asp:ListItem>
                            </asp:RadioButtonList>
                        </td>
                        <td>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" 
                                ControlToValidate="RBL_Marital" ErrorMessage="Select Marital Status !!!" 
                                ForeColor="Red"></asp:RequiredFieldValidator>
                        </td>
                        <td>
                            <asp:Label ID="lbl_dob" runat="server" 
                                Text="Date Of Birth"></asp:Label>
                        </td>
                        <td>
                            <asp:TextBox ID="Txt_DOB" runat="server"></asp:TextBox>
                            <asp:CalendarExtender ID="Txt_DOB_CalendarExtender" runat="server" 
                                Enabled="True" TargetControlID="Txt_DOB">
                            </asp:CalendarExtender>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <asp:Label ID="Lbl_Bgrp" runat="server" 
                                Text="Blood Group"></asp:Label>
                        </td>
                        <td>
                            <asp:DropDownList ID="DropDown_BldGrp" runat="server" 
                                AutoPostBack="True">
                            </asp:DropDownList>
                        </td>
                        <td>
                            &nbsp;</td>
                        <td>
                            <asp:Label ID="Lbl_Profession" runat="server" 
                                Text="Profession"></asp:Label>
                        </td>
                        <td colspan="2">
                            <asp:TextBox ID="Txt_Profession" runat="server" 
                                ontextchanged="TextBox4_TextChanged"></asp:TextBox>
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
                            &nbsp;</td>
                        <td>
                            &nbsp;</td>
                        <td>
                            &nbsp;</td>
                        <td>
                            &nbsp;</td>
                        <td colspan="2">
                            &nbsp;</td>
                        <td>
                            &nbsp;</td>
                        <td>
                            &nbsp;</td>
                        <td>
                            &nbsp;</td>
                    </tr>
                </table>
            </asp:Panel>
        </td>
        <td>
            &nbsp;</td>
    </tr>
        <tr>
        <td colspan="2">
                            &nbsp;</td>
        <td>
                            &nbsp;</td>
        </tr>
    <tr>
        <td colspan="2">
                            <asp:Panel ID="Panel3" runat="server" 
                                GroupingText="Communication Details">
                                <table class="style2">
                                    <tr>
                                        <td>
                                            <asp:Label ID="Lbl_Address" runat="server" 
                                                Text="Address"></asp:Label>
                                        </td>
                                        <td>
                                            <asp:TextBox ID="Txt_Address" runat="server" 
                                                Height="48px" TextMode="MultiLine" Width="339px"></asp:TextBox>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>
                                            <asp:Label ID="Lbl_Country" runat="server" 
                                                Text="Country"></asp:Label>
                                        </td>
                                        <td>
                                            <asp:DropDownList ID="DropDown_Country" runat="server" 
                                                AutoPostBack="True" 
                                                onselectedindexchanged="DropDown_Country_SelectedIndexChanged">
                                            </asp:DropDownList>
                                        </td>
                                        <td>
                                            <asp:Label ID="Lbl_State" runat="server" Text="State"></asp:Label>
                                        </td>
                                        <td>
                                            <asp:DropDownList ID="DropDown_State" runat="server" 
                                                AutoPostBack="True" 
                                                onselectedindexchanged="DropDown_State_SelectedIndexChanged">
                                            </asp:DropDownList>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>
                                            <asp:Label ID="Lbl_District" runat="server" 
                                                Text="District"></asp:Label>
                                        </td>
                                        <td>
                                            <asp:DropDownList ID="DropDown_District" runat="server" 
                                                AutoPostBack="True">
                                            </asp:DropDownList>
                                        </td>
                                        <td>
                                            <asp:Label ID="Lbl_Pin" runat="server" 
                                                Text="Zip / Pincode"></asp:Label>
                                        </td>
                                        <td>
                                            <asp:TextBox ID="Txt_Pin" runat="server" 
                                                ontextchanged="Txt_Pin_TextChanged" MaxLength="6"></asp:TextBox>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td rowspan="2">
                                            <asp:Label ID="Lbl_Telephone" runat="server" 
                                                Text="Telephone"></asp:Label>
                                        </td>
                                        <td>
                                            <asp:Label ID="Label15" runat="server" Text="Home:"></asp:Label>
                                            <asp:TextBox ID="Txt_Home" runat="server" MaxLength="11"></asp:TextBox>
                                            <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" 
                                                ControlToValidate="Txt_Home" ErrorMessage="Not Valid" 
                                                ForeColor="Red" ValidationExpression="[0-9]{10,12}" ValidationGroup="a"></asp:RegularExpressionValidator>
                                        </td>
                                        <td rowspan="2">
                                            <asp:Label ID="Lbl_Email" runat="server" Text="Email"></asp:Label>
                                        </td>
                                        <td>
                                            <asp:TextBox ID="Txt_Email" runat="server"></asp:TextBox>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>
                                            <asp:Label ID="Label16" runat="server" Text="Mobile:"></asp:Label>
                                            <asp:TextBox ID="Txt_Mobile" runat="server" 
                                                MaxLength="10"></asp:TextBox>
                                            <asp:RegularExpressionValidator ID="RegularExpressionValidator3" runat="server" 
                                                ControlToValidate="Txt_Mobile" ErrorMessage="Not Valid" 
                                                ForeColor="Red" ValidationExpression="[0-9]{10,12}" ValidationGroup="a"></asp:RegularExpressionValidator>
                                        </td>
                                        <td>
                                            <asp:RegularExpressionValidator ID="RegularExpressionValidator2" runat="server" ControlToValidate="Txt_Email" 
                                                ErrorMessage="Invalid Email !!!" ForeColor="Red" 
                                                ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*" 
                                                ValidationGroup="a"></asp:RegularExpressionValidator>
                                        </td>
                                    </tr>
                                </table>
                            </asp:Panel>
        </td>
        <td>
                            &nbsp;</td>
    </tr>
        <tr>
        <td class="style3" colspan="2">
            &nbsp;</td>
        <td class="style3">
            &nbsp;</td>
        <td>
        </td>
        </tr>
        <tr>
        <td class="style3">
            <asp:Label ID="Lbl_Writeup" runat="server" Text="Family Writeup"></asp:Label>
            </td>
        <td class="style3">
            <asp:TextBox ID="Txt_WriteUp" runat="server" TextMode="MultiLine" Height="80px" 
                Width="287px"></asp:TextBox>
            <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" 
                                ControlToValidate="Txt_WriteUp" ErrorMessage="Write About Your Family !!!" 
                                ForeColor="Red"></asp:RequiredFieldValidator>
            </td>
        <td class="style3">
            &nbsp;</td>
        <td>
        </td>
        </tr>
        <tr>
        <td class="style3" colspan="2" align="center">
            <asp:Button ID="Btn_Submit" runat="server" Text="Submit" 
                                onclick="Btn_Submit_Click" ValidationGroup="a" />
            <asp:Button ID="Btn_Cancel" runat="server" Text="Cancel" 
                onclick="Btn_Cancel_Click" />
            </td>
        <td class="style3">
            &nbsp;</td>
        <td>
        </td>
        </tr>
    <tr>
        <td class="style3" colspan="2">
                            <asp:Label ID="Label22" runat="server" ForeColor="#0000CC" 
                                
                                
                Text="*If You Are Married Into The Family Enter Your Husband's Name In The Family Head...."></asp:Label>
            <asp:ToolkitScriptManager ID="ToolkitScriptManager1" runat="server">
            </asp:ToolkitScriptManager>
                        </td>
        <td class="style3">
            &nbsp;</td>
        <td>
        </td>
    </tr>
    </table>
</asp:Content>
