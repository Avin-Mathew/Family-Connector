<%@ Page Title="" Language="C#" MasterPageFile="~/User.Master" AutoEventWireup="true" MaintainScrollPositionOnPostback="true" CodeFile="Photos.aspx.cs" Inherits="Photos" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <style type="text/css">
        .style1
        {
            width: 100%;
        }
         
    .Timg {
 
  margin: 10px 10px 10px 10px;
  padding: 4px;
  border-top: 1px solid #ddd;
  border-left: 1px solid #ddd;
  border-bottom: 1px solid #c0c0c0;
  border-right: 1px solid #c0c0c0;
  background: #fff;
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
                <strong>Picture Gallery</strong></td>
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
                <table style="background-color:#8a979e">
            <tr>
                <td valign="top" cellspacing="5"> Album Name:
                    <asp:Label ID="lblAlbumName" runat="server"></asp:Label><br />                
                    <asp:Image CssClass="Timg" runat="server" ID="imAlbumPhoto" /><br />
                    No of Pictures: <asp:Label ID="lblNoofPicz" runat="server"></asp:Label> 
                    <br />
                    <a href="Albums.aspx">Back to Albums</a>
                    <br />
                    <asp:LinkButton ID="lbUploadPhotos" runat="server" 
                        onclick="lbUploadPhotos_Click" Visible="False">Upload Photos</asp:LinkButton>                   
                </td>
                <td>
    
            <asp:ListView ID="lvPhotos" runat="server" DataKeyNames="AlbumID" 
            DataSourceID="SqlDataSource1" GroupItemCount="3" 
                        onselectedindexchanged="lvPhotos_SelectedIndexChanged">            
            <LayoutTemplate>               
                   <table ID="groupPlaceholderContainer" runat="server" border="0" cellpadding="0" cellspacing="0">
                         <tr ID="groupPlaceholder" runat="server">
                         </tr>
                   </table>                        
            </LayoutTemplate>                        
            <GroupTemplate>
                    <tr ID="itemPlaceholderContainer" runat="server">
                        <td ID="itemPlaceholder" runat="server">
                        </td>
                    </tr>
                </GroupTemplate>           
                <ItemTemplate>
                    <td id="Td1" runat="server" align="center" style="background-color: #e8e8e8;color: #333333;">                    
                    <a href='<%# "PhotoViewer.aspx?PhotoID="+Eval("PhotoID")+"&AlbumID="+ Eval("AlbumID") %>'> 
                    <asp:Image CssClass="Timg" runat="server" ID="imPhoto" ImageUrl='<%# "ThumbNail.ashx?ImURL="+Eval("Photo") %>' />
                    </a>
                    </td>                
                </ItemTemplate>             
            </asp:ListView>
                   <asp:HiddenField ID="hfAlbumID" runat="server" />
             </td>
             </tr>               
            </table>
            <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
                ConnectionString="<%$ ConnectionStrings:db_ccs2ConnectionString %>" 
            SelectCommand="SELECT [PhotoID], [Photo], [PhotoName], [AlbumID] FROM [PhotAlbum] WHERE ([AlbumID] = @AlbumID) ORDER By [PhotoID] ASC" 
            onselected="SqlDataSource1_Selected" onselecting="SqlDataSource1_Selecting">
                <SelectParameters>
                    <asp:QueryStringParameter DefaultValue="1" Name="AlbumID" 
                        QueryStringField="AlbumID" Type="Int32" />
                </SelectParameters>
            </asp:SqlDataSource>
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
    </table>
</asp:Content>

