<%@ Page Title="" Language="C#" MasterPageFile="~/User.Master" AutoEventWireup="true" MaintainScrollPositionOnPostback="true" CodeFile="ImageUpload.aspx.cs" Inherits="ImageUpload" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
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
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <table class="style1">
    <tr>
        <td class="style2">
            <strong>Image Upload</strong></td>
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
            <table style="width: 100%">
                <tr>
                    <td align="right">
                        Select a image to upload</td>
                    <td align="left">
                        <asp:FileUpload ID="fuImage" runat="server" />
                    </td>
                </tr>
                <tr>
                    <td align="right">
                        Image name</td>
                    <td align="left">
                        <asp:TextBox ID="txtImageName" runat="server"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td align="right">
                        Make it as Album Cover</td>
                    <td align="left">
                        <asp:CheckBox ID="ckbAlbumCover" runat="server" />
                    </td>
                </tr>
                <tr>
                    <td align="right">
                        &nbsp;</td>
                    <td align="left">
                        <asp:DropDownList ID="ddlAlbum" runat="server" DataSourceID="SqlDataSource1" 
                            DataTextField="AlbumName" DataValueField="AlbumID">
                        </asp:DropDownList>
                        <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
                            ConnectionString="<%$ ConnectionStrings:db_ccs2ConnectionString %>" 
                            
                            SelectCommand="SELECT * FROM [Album] WHERE ([registration_id] = @registration_id)">
                            <SelectParameters>
                                <asp:SessionParameter Name="registration_id" SessionField="regid" 
                                    Type="Int32" />
                            </SelectParameters>
                        </asp:SqlDataSource>
                    </td>
                </tr>
                <tr>
                    <td>
                    </td>
                    <td>
                        <asp:Button ID="btnUpload" runat="server" OnClick="btnUpload_Click" 
                            Text="Upload" />
                        <asp:LinkButton ID="lbGoTo" runat="server" onclick="lbGoTo_Click">Go to Album</asp:LinkButton>
                    </td>
                </tr>
            </table>
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
</table>
</asp:Content>

