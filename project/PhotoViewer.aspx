<%@ Page Title="" Language="C#" MasterPageFile="~/User.Master" AutoEventWireup="true" MaintainScrollPositionOnPostback="true" CodeFile="PhotoViewer.aspx.cs" Inherits="PhotoViewer" %>

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
                 <asp:ListView ID="lvPhotoViewer" runat="server" GroupItemCount="1" 
            onselectedindexchanged="db_ccs2ConnectionString">
         <LayoutTemplate>                
             <table ID="groupPlaceholderContainer" runat="server" border="1">                               
                  <tr ID="groupPlaceholder" runat="server">
                  </tr>
             </table>                       
         </LayoutTemplate>
               
         <ItemTemplate>
             <td id="Td4" align="center" style="background-color: #eeeeee;">
                    
                    <asp:Image runat="server" ID="imPhoto" Height="450px" Width="450px" ImageUrl='<%# "~"+Eval("Photo") %>' />
                    <br />
                    <asp:Label ID="DefaultPhotIDLabel" runat="server" 
                            Text='<%# Eval("PhotoName") %>' />
             </td>
        </ItemTemplate>
   
         <GroupTemplate>
              <tr ID="itemPlaceholderContainer" runat="server">
                   <td ID="itemPlaceholder" runat="server">
                   </td>
              </tr>
        </GroupTemplate>
        </asp:ListView>
    </td>
    </tr>
    <tr>
    <td align="center">
        <asp:DataPager ID="DataPager1" runat="server" 
        PagedControlID="lvPhotoViewer" PageSize="1" 
        onprerender="DataPager1_PreRender">
        <Fields>
            <asp:NextPreviousPagerField ButtonType="Link"
            PreviousPageText="<< " NextPageText=" >>" />
         </Fields>
        </asp:DataPager></td>
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

