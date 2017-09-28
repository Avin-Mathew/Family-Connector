<%@ Page Title="" Language="C#" MasterPageFile="~/User.Master" AutoEventWireup="true" MaintainScrollPositionOnPostback="true" CodeFile="Albums.aspx.cs" Inherits="Albums" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <style type="text/css">
        .style1
        {
            width: 100%;
        }
        .style2
        {
            font-size: medium;
            text-align: center;
            color: #7497BC;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <table class="style1">
        <tr>
            <td class="style2">
                <strong>Albums</strong></td>
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
                <asp:ListView ID="lvAlbums" runat="server"
            DataSourceID="SqlDataSource1" GroupItemCount="3" 
            InsertItemPosition="LastItem">            
            <LayoutTemplate>                
                    <table border="1">
                       <tr ID="groupPlaceholder" runat="server">
                       </tr>
                    </table>                       
            </LayoutTemplate>                                              
            <GroupTemplate>
                    <tr>
                        <td ID="itemPlaceholder" runat="server">
                        </td>
                    </tr>
             </GroupTemplate>             
             <ItemTemplate>
                    <td id="Td3" width="150px" height="150px" align="center" style="background-color: #e8e8e8;color: #333333;">
                    <asp:HiddenField ID="hfPhotoID" runat="server" Value='<%# Eval("DefaultPhotID") %>' />
                    <a href='<%# "Photos.aspx?AlbumID="+Eval("AlbumID") %>'> 
                    <asp:Image CssClass="Timg" runat="server" ID="imPhoto" ImageUrl='<%# "ThumbNail.ashx?ImURL="+Eval("Photo") %>' />
                    </a>
                    <br />                    
                    <b><asp:Label ID="lblAlbumName" runat="server" Text='<%# Eval("AlbumName") %>'></asp:Label>   </b>
                    </td>                
                </ItemTemplate>
                
                <InsertItemTemplate>
                <td id="Td3" width="150px" height="150px" runat="server" align="center" style="background-color: #e8e8e8;color: #333333;">
                <a href="CreateAlbum.aspx">                    
                    Create New Album
                </a>
                </td>              
                </InsertItemTemplate>             
            </asp:ListView>

        <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
            ConnectionString="<%$ ConnectionStrings:db_ccs2ConnectionString %>" 
            
        
                    
                    SelectCommand="SELECT Album.AlbumID, Album.DefaultPhotID, Album.AlbumName, PhotAlbum.Photo, Album.status FROM Album INNER JOIN PhotAlbum ON Album.DefaultPhotID = PhotAlbum.PhotoID WHERE (Album.status = 'approved')" 
                    onselecting="SqlDataSource1_Selecting">
        </asp:SqlDataSource></td>
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

