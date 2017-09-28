<%@ Page Title="" Language="C#" MasterPageFile="~/User.Master" AutoEventWireup="true" MaintainScrollPositionOnPostback="true" CodeFile="Home.aspx.cs" Inherits="Home" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <style type="text/css">
        .style1
        {
            width: 100%;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <table class="style1">
        <tr>
            <td>
                <asp:Label ID="Label1" runat="server" Text="Welcome"></asp:Label>
&nbsp;<asp:Label ID="Label2" runat="server" ForeColor="#FF3300" Text="Label"></asp:Label>
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
        <tr>
            <td>
                <asp:Panel ID="Panel1" runat="server">
                    <asp:FormView ID="FormView1" runat="server" CellPadding="4" 
                        DataKeyNames="registration_id" 
                        onitemupdating="FormView1_ItemUpdating" 
                        onmodechanging="FormView1_ModeChanging" ForeColor="#333333">
                        <EditItemTemplate>
                            <table class="style1">
                                <tr>
                                    <td>
                                        <asp:Label ID="Label11" runat="server" Text="Address"></asp:Label>
                                    </td>
                                    <td>
                                        <asp:TextBox ID="TextBox1" runat="server" 
                                            Text='<%# Eval("registration_address") %>'></asp:TextBox>
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <asp:Label ID="Label12" runat="server" Text="Country"></asp:Label>
                                    </td>
                                    <td>
                                        <asp:DropDownList ID="DropDownList1" runat="server" AutoPostBack="True" 
                                            onselectedindexchanged="DropDownList1_SelectedIndexChanged" >
                                             
                                            
                                        </asp:DropDownList>
                                        <asp:Label ID="Label19" runat="server" Text='<%# Eval("country_name") %>' 
                                            Visible="False"></asp:Label>
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <asp:Label ID="Label13" runat="server" Text="State"></asp:Label>
                                    </td>
                                    <td>
                                        <asp:DropDownList ID="DropDownList2" runat="server" AutoPostBack="True" 
                                            onselectedindexchanged="DropDownList2_SelectedIndexChanged" >
                                           
                                        </asp:DropDownList>
                                        <asp:Label ID="Label20" runat="server" Text='<%# Eval("state_name") %>' 
                                            Visible="False"></asp:Label>
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <asp:Label ID="Label14" runat="server" Text="District"></asp:Label>
                                    </td>
                                    <td>
                                        <asp:DropDownList ID="DropDownList3" runat="server" AutoPostBack="True" >
                                           
                                        </asp:DropDownList>
                                        <asp:Label ID="Label21" runat="server" Text='<%# Eval("district_name") %>' 
                                            Visible="False"></asp:Label>
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <asp:Label ID="Label15" runat="server" Text="Pincode"></asp:Label>
                                    </td>
                                    <td>
                                        <asp:TextBox ID="TextBox3" runat="server" 
                                            Text='<%# Eval("registration_pincode") %>'></asp:TextBox>
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <asp:Label ID="Label16" runat="server" Text="Phone1"></asp:Label>
                                    </td>
                                    <td>
                                        <asp:TextBox ID="TextBox4" runat="server" 
                                            Text='<%# Eval("registration_landline") %>'></asp:TextBox>
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <asp:Label ID="Label17" runat="server" Text="Mobile"></asp:Label>
                                    </td>
                                    <td>
                                        <asp:TextBox ID="TextBox5" runat="server" 
                                            Text='<%# Eval("registration_mobile") %>'></asp:TextBox>
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <asp:Label ID="Label18" runat="server" Text="Emailid"></asp:Label>
                                    </td>
                                    <td>
                                        <asp:TextBox ID="TextBox6" runat="server" 
                                            Text='<%# Eval("registration_email") %>'></asp:TextBox>
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        &nbsp;</td>
                                    <td>
                                        <asp:LinkButton ID="LinkButton2" runat="server" CommandName="update">update</asp:LinkButton>
                                        &nbsp;
                                        <asp:LinkButton ID="LinkButton3" runat="server" CommandName="cancel">cancel</asp:LinkButton>
                                    </td>
                                </tr>
                            </table>
                        </EditItemTemplate>
                        <EditRowStyle BackColor="#999999" />
                        <FooterStyle BackColor="#5D7B9D" ForeColor="White" Font-Bold="True" />
                        <HeaderStyle BackColor="#7497BC" Font-Bold="True" ForeColor="White" />
                        <ItemTemplate>
                            <table class="style1">
                                <tr>
                                    <td>
                                        <asp:Label ID="Label3" runat="server" Text='<%# Eval("name") %>'></asp:Label>
                                    </td>
                                    <td>
                                        &nbsp;</td>
                                </tr>
                                <tr>
                                    <td>
                                        Address</td>
                                    <td>
                                        <asp:Label ID="Label4" runat="server" 
                                            Text='<%# Eval("registration_address") %>'></asp:Label>
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        &nbsp;</td>
                                    <td>
                                        <asp:Label ID="Label5" runat="server" Text='<%# Eval("district_name") %>'></asp:Label>
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        &nbsp;</td>
                                    <td>
                                        <asp:Label ID="Label6" runat="server" Text='<%# Eval("state_name") %>'></asp:Label>
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        Pincode</td>
                                    <td>
                                        <asp:Label ID="Label7" runat="server" 
                                            Text='<%# Eval("registration_pincode") %>'></asp:Label>
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        Lanline1</td>
                                    <td>
                                        <asp:Label ID="Label8" runat="server" 
                                            Text='<%# Eval("registration_landline") %>'></asp:Label>
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        Mobile</td>
                                    <td>
                                        <asp:Label ID="Label9" runat="server" Text='<%# Eval("registration_mobile") %>'></asp:Label>
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        Email</td>
                                    <td>
                                        <asp:Label ID="Label10" runat="server" Text='<%# Eval("registration_email") %>'></asp:Label>
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        &nbsp;</td>
                                    <td>
                                        &nbsp;</td>
                                </tr>
                                <tr>
                                    <td>
                                        <asp:LinkButton ID="LinkButton1" runat="server" CommandName="edit">edit</asp:LinkButton>
                                    </td>
                                    <td>
                                        &nbsp;</td>
                                </tr>
                            </table>
                        </ItemTemplate>
                        <PagerStyle BackColor="#284775" ForeColor="White" HorizontalAlign="Center" />
                        <RowStyle BackColor="#F7F6F3" ForeColor="#333333" />
                    </asp:FormView>
                </asp:Panel>
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
        <tr>
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
        </tr>
        <tr>
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
        </tr>
        <tr>
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
        </tr>
    </table>
</asp:Content>

