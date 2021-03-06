﻿<%@ Page Title="Yard eCart Admin Page" Language="C#" MasterPageFile="~/Yarde.Master" AutoEventWireup="true" CodeBehind="CategoryGroup.aspx.cs" Inherits="YardeCart.CategoryGroup" %>
<asp:Content runat="server" ID="BodyContent" ContentPlaceHolderID="MainContent">
    <link rel="stylesheet" href="CSS/screen.css" />

<script src="Scripts/jquery.js"></script>
<script src="Scripts/jquery.validate.js"></script>
    
    <script>
        $(document).ready(function () {
            $('#input[id$=txtcategory]').validate({
                rules:{
                    required: true
                },
                message: {
                    required: "Please enter a username",
                }
            });
        });
    </script>
    
    <script src="scripts/jquery-1.4.3.min.js" type="text/javascript"></script>
    <style type="text/css">
        .web_dialog_overlay
        {
            position: fixed;
            top: 0;
            right: 0;
            bottom: 0;
            left: 0;
            height: 100%;
            width: 100%;
            margin: 0;
            padding: 0;
            background: #000000;
            opacity: .15;
            filter: alpha(opacity=15);
            -moz-opacity: .15;
            z-index: 101;
            display: none;
        }
        .web_dialog
        {
            display: none;
            position: fixed;
            width: 380px;
            height: 180px;
            top: 50%;
            left: 50%;
            margin-left: -190px;
            margin-top: -100px;
            background-color: #ffffff;
            border: 2px solid #336699;
            padding: 0px;
            z-index: 102;
            font-family: Verdana;
            font-size: 10pt;
        }
        .web_dialog_title
        {
            border-bottom: solid 2px #336699;
            background-color: black;
            padding: 4px;
            color: White;
            font-weight:bold;
        }
        .web_dialog_title a
        {
            color: White;
            text-decoration: none;
        }
        .align_right
        {
            text-align: right;
        }
        .auto-style7 {
            height: 31px;
        }
    </style>
    <script type="text/javascript">

        $(document).ready(function () {
            $("#btnAdd").click(function (e) {
                ShowDialog(false);
                e.preventDefault();
            });

            $("#btnShowModal").click(function (e) {
                ShowDialog(true);
                e.preventDefault(); 
            });

            $("#btnClose").click(function (e) {
                $('input[id$=txtcategory]').val('');
                HideDialog();
                e.preventDefault();
            });

            $("#btnSubmit").click(function (e) {
                HideDialog();
                e.preventDefault();
            });
        });

        function ShowDialog(modal) {
            $("#overlay").show();
            $("#dialog").fadeIn(300);

            if (modal) {
                $("#overlay").unbind("click");
            }
            else {
                $("#overlay").click(function (e) {
                    HideDialog();
                });
            }
        }

        function HideDialog() {
            $("#overlay").hide();
            $("#dialog").fadeOut(300);
        }

    </script>

    <div style="padding-top:50px;">
    <table style="height:200px;">
        <tr>
            <td style="font-size: large; height: 25px; width:800px; text-align: center;">Category Group</td>
        </tr>
            <tr>
            <td style="text-align:left; padding-left:50px;" class="auto-style7">            
                <input type="button" id="btnAdd" value="Add Catgory Group" BorderStyle="Groove" BorderWidth="1px" Height="28px" style="font-weight: 700; width:180px;" />
                </td>
        </tr>
    <%--<table id="tblCategory" style="width:900px;">
            <tr><td class="auto-style5">&nbsp;</td></tr>
        <tr>
            <td style="text-align:right; padding-right: 25px;" class="auto-style6">
                <asp:Label ID="Label1" runat="server" Text="Category Group Name"></asp:Label>
            </td>
            <td class="auto-style4">
                <asp:TextBox ID="txtName" runat="server" Height="27px" Width="287px" BorderColor="Black" CssClass="validate[required]" BorderStyle="Solid" BorderWidth="1px" MaxLength="50" TabIndex="1"></asp:TextBox>
                <asp:RequiredFieldValidator ID="reqAlbum" EnableClientScript="true" ControlToValidate="txtName" ErrorMessage="Album name should not be empty" runat="server"></asp:RequiredFieldValidator>
                <asp:Label ID="ErrMsg" runat="server" Text=""  ForeColor="Red"></asp:Label>
            </td>
        </tr>
        <tr>
            <td class="auto-style5">
                &nbsp;
            </td>
            <td>
                <asp:Button ID="btnSave" runat="server" Text="Add" Font-Bold="true" OnClick="btnSave_Click" BorderColor="Black" BorderStyle="Ridge" BorderWidth="1px" Height="32px" Width="105px" TabIndex="2"  />
                &nbsp;&nbsp;&nbsp;&nbsp;
                <asp:Button ID="btnCancel" runat="server" Text="Cancel" Font-Bold="true" CausesValidation="false" BorderColor="Black" BorderStyle="Ridge" BorderWidth="1px" Height="32px" Width="105px" TabIndex="3" OnClick="btnCancel_Click"  />
            </td> 
        </tr>
    </table>--%>
    
    <tr>
            <td>
    <asp:DataList ID="DataList1" runat="server" DataKeyField="CategoryGroupID"
     Width="700px" BorderColor="Tan" BorderWidth="1px" CellPadding="2" ForeColor="Black" OnCancelCommand="DataList1_CancelCommand"
OnDeleteCommand="DataList1_DeleteCommand" OnEditCommand="DataList1_EditCommand"
OnUpdateCommand="DataList1_UpdateCommand">
                <HeaderTemplate>  

                    <table width="100%">  

                        <tr align="left">  

                            <th width="10%">  

                                &nbsp;
                            </th>  

                            <th width="50%">  

                                Category Group Name  

                            </th>  

                            <th>  

                                &nbsp;</th>  

                        </tr>  

                </HeaderTemplate>

              <ItemTemplate>
                    <tr align="left">
                        <td>
                            <asp:label runat="server" ID="lblSNO"></asp:label>
                        </td>
                    <td>
                    <%# DataBinder.Eval(Container.DataItem, "CategoryGroupName") %>
                    </td>
                    <td style="visibility:hidden;">
                    <%# DataBinder.Eval(Container.DataItem, "CategoryGroupID") %>
                    </td>
                        <td>
<asp:LinkButton ID="lnkEdit" runat="server" CommandName="edit"> Edit </asp:LinkButton>
&nbsp;|&nbsp;
<asp:LinkButton ID="lnkDelete" runat="server" CommandName="delete"> Delete </asp:LinkButton>
                    </td>
                    </tr>
               </ItemTemplate>
              <EditItemTemplate>
                    <tr>
                        <td>
                            <asp:TextBox ID="txtId" Visible="false" runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "CategoryGroupID") %>'>
                            </asp:TextBox>
                        </td>
                        <td>
                            <asp:TextBox ID="txtCName" runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "CategoryGroupName") %>'>
                            </asp:TextBox>
                        </td>
                        
                        <td>
<asp:LinkButton ID="lnkUpdate" runat="server" CommandName="update">Update </asp:LinkButton>
<asp:LinkButton ID="lnkCancel" runat="server" CommandName="cancel">Cancel </asp:LinkButton>
</td>
</tr>
</EditItemTemplate>
<FooterTemplate>
</table></FooterTemplate>
<FooterStyle BackColor="Tan" />
<SelectedItemStyle  ForeColor="GhostWhite" /> <AlternatingItemStyle  />
<HeaderStyle  Font-Bold="True" />
</asp:DataList>
<table width="700px" id="tblPaging" runat="server">  

<tr>  

<td height="10px">  

</td>  

</tr>  

<tr id="PagingRow" runat="server">  

<td colspan="3" style="background-color: #3D3D3D; padding-left: 15px;">  

<table width="99%" class="pagingBackground" cellpadding="2" cellspacing="2">  

<tr>  

<td width="20%">  

</td>  

<td align="center" width="50">  

</td>  

<td align="center">  

</td>  

<td align="center" width="20%">  

</td>  

</tr>  

<tr>  

<td width="20%" align="left" style="color: #FFFFFF">  

 &nbsp;  

<asp:Label ID="LabelPageFirstRecord" runat="server"></asp:Label>  

<asp:Label ID="label2" runat="server" Text="-"></asp:Label>  

<asp:Label ID="LabelPageLastRecord" runat="server"></asp:Label>  

<asp:Label ID="label3" runat="server" Text="of"></asp:Label>  

<asp:Label ID="LabelTotalRecords" runat="server"></asp:Label>  

</td>  

<td width="50" align="center">  

</td>  

<td align="center" id="tdPageNumbers" runat="server" style="color: #FFFFFF">  

<asp:LinkButton ID="LinkButtonFirst" runat="server" ForeColor="White" OnClick="LinkButtonFirst_Click" CssClass="PagerLinkStyle">  

First  

</asp:LinkButton>  

<asp:LinkButton ID="LinkButtonPrevious" runat="server" ForeColor="White" CssClass="PagerLinkStyle" OnClick="LinkButtonPrevious_Click">  

Prev
</asp:LinkButton>  

<asp:LinkButton ID="LinkButton1" runat="server" ForeColor="White" CssClass="PagerLinkStyle" OnClick="LinkButton1_Click">1</asp:LinkButton>  

<asp:LinkButton ID="LinkButton2" runat="server" ForeColor="White" CssClass="PagerLinkStyle" OnClick="LinkButton1_Click">2</asp:LinkButton>  

<asp:LinkButton ID="LinkButton3" runat="server" ForeColor="White" CssClass="PagerLinkStyle" OnClick="LinkButton1_Click">3</asp:LinkButton>  

<asp:LinkButton ID="LinkButton4" runat="server" ForeColor="White" CssClass="PagerLinkStyle" OnClick="LinkButton1_Click">4</asp:LinkButton>  

<asp:LinkButton ID="LinkButton5" runat="server" ForeColor="White" CssClass="PagerLinkStyle" OnClick="LinkButton1_Click">5</asp:LinkButton>  

<asp:LinkButton ID="LinkButtonNext" runat="server" ForeColor="White" CssClass="PagerLinkStyle" OnClick="LinkButtonNext_Click">  

    Next

</asp:LinkButton>  

<asp:LinkButton ID="LinkButtonLast" runat="server" ForeColor="White" OnClick="LinkButtonLast_Click" CssClass="PagerLinkStyle">  

    Last

</asp:LinkButton>  

</td>  

<td width="20%" align="right">  

</td>  

</tr>  

<tr>  

<td width="20%">  

</td>  

<td align="center" width="50">  

</td>  

<td align="center">  

</td>  

<td align="center" width="20%">  

</td>  

</tr>  

</table>  

</td>  

</tr>  

</table> 
</td>
        </tr>
    </table>
    </div>
    <div id="output"></div>

    <div id="overlay" class="web_dialog_overlay"></div>

    <div id="dialog" class="web_dialog">
        <table style="width: 100%; border: 0px;" cellpadding="3" cellspacing="0">
            <tr>
                <td class="web_dialog_title">Category Group</td>
                <td class="web_dialog_title align_right">
                    <a href="#" id="btnClose">Close</a>
                </td>
            </tr>
            <tr>
                <td>&nbsp;</td>
                <td>&nbsp;</td>
            </tr>
            <tr>
                <td>&nbsp;</td>
                <td>&nbsp;</td>
            </tr>
            <tr>
                <td colspan="2" style="padding-left: 25px;">
                    <label>Category Group Name</label>
                    <asp:TextBox ID="txtcategory" runat="server" Height="24" Width="300" BorderColor="Black" BorderStyle="Solid" BorderWidth="1px" MaxLength="50"></asp:TextBox>
                </td>
            </tr>
            </tr>
            <tr>
                <td>&nbsp;</td>
                <td>&nbsp;</td>
            </tr>
            <tr>
                <td colspan="2" style="text-align: center;">
                    <asp:Button ID="btnSubmit" Width="100" runat="server" Text="Add" OnClick="btnSave_Click" BorderStyle="Groove" BorderWidth="1px" Height="28px" style="font-weight: 700" TabIndex="16" />
                </td>
            </tr>
        </table>
    </div>
</asp:Content>
<asp:Content ID="Content1" runat="server" contentplaceholderid="head">
</asp:Content>

