<%@ Page Title="" Language="C#" MasterPageFile="~/User.Master" AutoEventWireup="true" MaintainScrollPositionOnPostback="true" CodeFile="newsnevents.aspx.cs" Inherits="Family_Connector.newsnevents" %>


<%@ Register assembly="AjaxControlToolkit" namespace="AjaxControlToolkit" tagprefix="asp" %>


<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
         .modal-inner-wrapper

        {

           width:340px;

         height:340px;

         
        background-color:pink;
      }   

       .modal-inner-wrapper .content

       {

          width:320px; height:320px; background-color:#FFFFFF; border: solid 1px Gray; z-index:9999;

          float:right; margin-top:10px; margin-right:10px;

      }

       .modal-inner-wrapper .content .close

       {

           float:right; 

       }

      .modal-inner-wrapper .content .body

      {

           margin-top:20px;

      }

      .rounded-corners 

       {

          /*FOR OTHER MAJOR BROWSERS*/

      /*moz-border-radius: 5px;

          -webkit-border-radius: 5px;

         -khtml-border-radius: 5px;

          border-radius: 5px;*/

         
     -moz-border-radius: 20px;
    -webkit-border-radius: 20px;
    -khtml-border-radius: 20px;
    -border-radius: 20px;
}
          /*FOR IE*/

         behavior: url(border-radius.htc);

     }

     .rel {

          position: relative;

         z-index: inherit;

          zoom: 1; /* For IE6 */

     }

      .modal-bg{

          background-color:Gray;

         filter:alpha(opacity=50);

         opacity:0.6;

          z-index:999;

      }

      .modal{

          position:absolute;
     }
     .rounded-cornershead
     {
         -moz-border-radius: 5px;
    -webkit-border-radius: 5px;
    -khtml-border-radius: 5px;
    -border-radius: 5px;
    background-color:#CAC6C1;
 height:30px;
  
     } 

      <%-- .style1
       {
           position: absolute;
           left: 416px;
           top: 241px;
       }

       .style2
       {
           position: absolute;
           left: 130px;
           top: 74px;
       }--%>

        .style3
        {
            width: 100%;
        }

   
        .style1
        {
            width: 100%;
        }
        .style2
        {
            height: 23px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <table class="style1">
        <tr>
            <td>
                &nbsp;</td>
            <td style="text-align: center; font-size: medium; font-weight: 700; color: #7497BC">
                News &amp; Events</td>
            <td>
                &nbsp;</td>
        </tr>
        <tr>
            <td>
                &nbsp;</td>
            <td>
                <asp:ToolkitScriptManager ID="ToolkitScriptManager1" runat="server">
                </asp:ToolkitScriptManager>
            </td>
            <td>
                <asp:ImageButton ID="ImageButton2" runat="server" ImageUrl="~/pic/post.jpg" 
                    onclick="ImageButton2_Click" Width="70px" />
            </td>
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
            <td class="style2">
            </td>
            <td class="style2">
            <asp:Repeater ID="RepDetails" runat="server">
<HeaderTemplate>
<table style=" border:1px solid #df5015; width:500px" cellpadding="0">
<tr style="background-color:#df5015; color:White">
<td colspan="2">
<b>News & Events</b>
</td>
</tr>
</HeaderTemplate>
<ItemTemplate>
<tr style="background-color:#EBEFF0">
<td>
<table style="background-color:#EBEFF0;border-top:1px dotted #df5015; width:500px" >
<tr>
<td>
News:
<asp:Label ID="lbltitle" runat="server" Text='<%#Eval("newsnevents_title") %>' Font-Bold="true"/>
</td>
</tr>
</table>
</td>
</tr>
<tr>
<td>
<asp:Label ID="lbldescription" runat="server" Text='<%#Eval("newsnevents_description") %>'/>
</td>
</tr>
<tr>
<td>
<table style="background-color:#EBEFF0;border-top:1px dotted #df5015;border-bottom:1px solid #df5015; width:500px" >
<tr>
<td>Post By: <asp:Label ID="lblUser" runat="server" Font-Bold="true" Text='<%#Eval("name") %>'/></td>
<td>Created Date:<asp:Label ID="lblDate" runat="server" Font-Bold="true" Text='<%#Eval("newsnevents_datentime") %>'/></td>
</tr>
</table>
</td>
</tr>
<tr>
<td colspan="2">&nbsp;</td>
</tr>
</ItemTemplate>
<FooterTemplate>
</table>
</FooterTemplate>
</asp:Repeater></td>
            <td class="style2">
                &nbsp;</td>
        </tr>
        <tr>
            <td class="style2">
                &nbsp;</td>
            <td class="style2">
                &nbsp;</td>
            <td class="style2">
                &nbsp;</td>
        </tr>
        <tr>
            <td class="style2">
            </td>
            <td class="style2">
            </td>
            <td class="style2">
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
            <td class="style2">
            </td>
            <td class="style2">
                <asp:Panel ID="Panel2" runat="server">
                <div class="rel">
            <div class="modal-inner-wrapper rounded-corners">
            <div class="content rounded-corners">
             <div class="rounded-cornershead">
            
                    <table class="style1">
                        <tr>
                            <td>
                                <asp:Label ID="Label2" runat="server" Text="Title"></asp:Label>
                            </td>
                            <td>
                                <asp:TextBox ID="Txt_Title" runat="server"></asp:TextBox>
                            </td>
                            <td>
                                <div class="rounded-cornershead"><div class="close">
                            <asp:ImageButton ID="ImageButton1" runat="server" Height="20px" 
                                ImageUrl="~/pic/closebutton3-th.png" Width="20px" /></div></div></td>
                        </tr>
                        <tr>
                            
                            <td>
                                <asp:Label ID="Label3" runat="server" Text="Description"></asp:Label>
                            </td>
                            <td>
                                <asp:TextBox ID="Txt_Description" runat="server" TextMode="MultiLine"></asp:TextBox>
                            </td>
                            <td>
                                &nbsp;</td>
                        </tr>
                        <tr>
                            <td>
                                &nbsp;</td>
                            <td>
                                <asp:Button ID="Add" runat="server" onclick="Add_Click1" Text="Add" 
                                    ValidationGroup="a" />
                            </td>
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
                    </div></div></div></div>
                </asp:Panel>
                <asp:ModalPopupExtender ID="Panel2_ModalPopupExtender" runat="server" 
                    DynamicServicePath="" Enabled="True" TargetControlID="ImageButton2" PopupControlID="Panel2" BackgroundCssClass="modal-bg">
                </asp:ModalPopupExtender>
            </td>
            <td class="style2">
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
                </td>
            <td>
                &nbsp;</td>
            <td>
                &nbsp;</td>
        </tr>
    </table>
</asp:Content>
