﻿<%@ Page Title="Yard eCart Ad posts" Language="C#" MasterPageFile="~/Yarde.Master" AutoEventWireup="true" CodeBehind="EditAdpost.aspx.cs" Inherits="YardeCart.EditAdpost" %>
<%@ Register Assembly="SlimeeLibrary" Namespace="SlimeeLibrary" TagPrefix="cc1" %>

<asp:Content runat="server" ID="BodyContent" ContentPlaceHolderID="MainContent">
    <!--// plugin-specific resources //-->
<script src='Scripts/jquery.form.js' type="text/javascript" lang="javascript"></script>
<script src='Scripts/jquery.MetaData.js' type="text/javascript" lang="javascript"></script>
<script src='Scripts/jquery.MultiFile.js' type="text/javascript" lang="javascript"></script>
<script src='Scripts/jquery.blockUI.js' type="text/javascript" lang="javascript"></script>
<script src='Scripts/jquery.latest.js' type="text/javascript" lang="javascript"></script>

    <script>
        $(function () {
            $('#<%=FileUpload1.ClientID %>').change(function () {
                var fileExtension = ['jpeg', 'jpg', 'png', 'gif', 'bmp'];
                if ($.inArray($(this).val().split('.').pop().toLowerCase(), fileExtension) == -1) {
                    alert("Only '.jpeg','.jpg', '.png', '.gif', '.bmp' formats are allowed.");
                    $(this).val("");
                }
                
            })
        });
        //$(document).ready(function () {
        //    $('#MainContent_remove1').click(function () {
                
         //       alert("hi " + '"<=this.remove1.Attributes["imgpath"].ToString() %>"');
         //       var fso = ActiveXObject("Scripting");

          //  });
        //});
    </script>
    
    <div id="form-content" style="vertical-align:central; padding-left:100px;padding-top:50px;">
    
        <table style="width: 789px" >
           <tr>
                    <td colspan="2" class="auto-style21">
                 <div class="divHeadForm" style="text-align:left;">
               <h3> Edit your Ad</h3>
                     <p> &nbsp;</p>
            </div>
                        </td>
                    </tr>
            <tr>
                <td class="auto-style16" ><label class="label" style="width:150px;" for="txtTitle">Title</label></td>
                <td colspan="5" class="auto-style12" >&nbsp;&nbsp;<asp:TextBox class="input" ID="txtTitle" runat="server" CssClass="validate[required]" Height="24px" Width="400px" BorderColor="Black" BorderStyle="Solid" BorderWidth="1px" MaxLength="100" TabIndex="1"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td class="auto-style17"><label class="label" for="txtDesc">Description</label></td>
                <td colspan="5" class="auto-style13">&nbsp;&nbsp;<asp:TextBox class="textarea" ID="txtDesc" runat="server" MaxLength="1000" TextMode="MultiLine" BorderWidth="1px" BorderColor="Black" BorderStyle="Solid" Height="50px" Width="400px" TabIndex="2" ></asp:TextBox></td>
            </tr>
            <tr>
                <td class="auto-style17" ><label class="label" for="txtKeywords">Keywords</label></td>
                <td colspan="5" class="auto-style13" >&nbsp;&nbsp;<asp:TextBox class="textarea" ID="txtKeywords" runat="server" TextMode="MultiLine" BorderWidth="1px" Height="50px" Width="400px" BorderColor="Black" BorderStyle="Solid" MaxLength="1000" TabIndex="3" ></asp:TextBox></td>
            </tr>
            <tr>
                <td class="auto-style18" ><label class="label" for="ddlCategory">Category</label></td>
                <td  style="padding-top: 5px" colspan="5" class="auto-style14">&nbsp;&nbsp;<asp:DropDownList ID="ddlCategory" runat="server" CssClass="validate[required] radio" style="border:solid 1px; transform-style:flat;" BorderColor="Black" Height="24px" Width="400px" TabIndex="4"></asp:DropDownList>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>
                <td class="auto-style14" >
                    <asp:Label ID="ErrCategory" ForeColor="Red" runat="server" ></asp:Label>
                </td>
            </tr>
            <tr>
                <td class="auto-style18" ><label class="label" for="txtPrice">Price</label></td>
                <td colspan="5" class="auto-style14" >&nbsp;&nbsp;<asp:TextBox class="input" ID="txtPrice" runat="server" CssClass="validate[required]" BorderWidth="1px" Height="20px"  TabIndex="5"></asp:TextBox></td>
            </tr>
            <tr>
                <td class="auto-style18" ><label class="label" for="DatePicker1">Show Till Date</label></td>
                <td colspan="5" class="auto-style14" >&nbsp;
                    <cc1:DatePicker ID="DatePicker1" runat="server"  Width="100px" PaneWidth="200px" EnableViewState="true" BorderColor="Black" BorderStyle="Solid" BorderWidth="1px" Height="20px" TabIndex="6">
            <PaneTableStyle BorderColor="#707070" BorderWidth="1px" BorderStyle="Solid" />
            <PaneHeaderStyle BackColor="#0099FF" />
            <TitleStyle ForeColor="White" Font-Bold="true" />
            <NextPrevMonthStyle ForeColor="White" Font-Bold="true" />
            <NextPrevYearStyle ForeColor="#E0E0E0" Font-Bold="true" />
            <DayHeaderStyle BackColor="#E8E8E8" />
            <TodayStyle BackColor="#FFFFCC" ForeColor="#000000" Font-Underline="false" BorderColor="#FFCC99"/>
            <AlternateMonthStyle BackColor="#F0F0F0" ForeColor="#707070" Font-Underline="false"/>
            <MonthStyle BackColor="" ForeColor="#000000" Font-Underline="false"/>
        </cc1:DatePicker>

                </td>

            </tr>
            <tr>
                <td class="auto-style19" ><label class="label" for="txtVidolink">Youtube Video link</label></td>
                <td colspan="5" class="auto-style15" >&nbsp;&nbsp;<asp:TextBox class="input" ID="txtVidolink" runat="server" Width="399px" BorderWidth="1px" Height="20px" MaxLength="50" TabIndex="7"></asp:TextBox></td>
            </tr>
            <tr>
                <td class="auto-style20" >&nbsp;</td>
                <td colspan="5" >&nbsp;</td>
            </tr>
            <tr>
                <td class="auto-style20" >Add Image Ad</td>
                <td colspan="5" >&nbsp;
                    <asp:FileUpload ID="FileUpload1" runat="server" Height="24px" Width="400px" BorderWidth="1px" BorderStyle="Solid" TabIndex="8"/>
                    <%--<input type="file" id="file1" class="multi accept-gif|jpg|png|bmp max-5 maxSize-1m" multiple="multiple" runat="server"/>--%>
                </td>
            </tr>
            
            <tr>
                <td class="auto-style22" ></td>
                <td colspan="5" class="auto-style11" >&nbsp;
                    <asp:Button ID="btnUpload" runat="server" Text="Upload" OnClick="btnUpload_Click" BorderStyle="Groove" BorderWidth="1px" Height="25px" style="font-weight: 700" Width="105px" TabIndex="9" />
                    &nbsp;&nbsp;<asp:Label ID="errFile1" ForeColor="Red" runat="server" ></asp:Label>
                </td>
            </tr>
            <tr>
                <td class="auto-style20" >&nbsp;</td>
                <td id="ImgHtml" runat="server" rowspan="4" style="vertical-align: top; text-align: left; " class="auto-style9" >
                    <img alt="" src="" id="img1" runat="server" height="75" width="100"/>
                    <asp:LinkButton ID="remove1" runat="server" OnClick="remove1_Click" TabIndex="10" >Remove</asp:LinkButton>&nbsp;</td>
                <td id="ImgHtml1" runat="server" rowspan="4" style="vertical-align: top; text-align: left" class="auto-style10">
                    <img alt="" src="" id="img2" runat="server" height="75" width="100"/>
                    <asp:LinkButton ID="remove2" runat="server" OnClick="remove2_Click" TabIndex="11" >Remove</asp:LinkButton>&nbsp;</td>
                <td id="ImgHtml2" runat="server" rowspan="4" style="vertical-align: top; text-align: left" class="auto-style10">
                    <img alt="" src="" id="img3" runat="server" height="75" width="100"/>
                    <asp:LinkButton ID="remove3" runat="server" OnClick="remove3_Click" TabIndex="12" >Remove</asp:LinkButton>&nbsp;</td>
                <td id="ImgHtml3" runat="server" rowspan="4" style="vertical-align: top; text-align: left" class="auto-style10">
                    <img alt="" src="" id="img4" runat="server" height="75" width="100"/>
                    <asp:LinkButton ID="remove4" runat="server" OnClick="remove4_Click" TabIndex="13" >Remove</asp:LinkButton>&nbsp;</td>
                <td id="ImgHtml4" runat="server" rowspan="4" style="vertical-align: top; text-align: left" class="auto-style8">
                    <img alt="" src="" id="img5" runat="server" height="75" width="100"/>
                    <asp:LinkButton ID="remove5" runat="server" OnClick="remove5_Click" TabIndex="14" >Remove</asp:LinkButton>&nbsp;</td>
            </tr>
        </table>
        <table style="width: 789px" >
            <tr>
                <td style="vertical-align:central; text-align:center;">
                    <br />
                    <br />
                    <asp:Button ID="btnSaveAd" runat="server" Text="Save Post " OnClick="btnSaveAd_Click" BorderStyle="Groove" BorderWidth="1px" Height="28px" style="font-weight: 700" Width="105px" TabIndex="15" />
                    </td>
            </tr>

            </table>
    </div>

</asp:Content>
<asp:Content ID="Content1" runat="server" contentplaceholderid="head">
    <style type="text/css">
        .auto-style8 {
            width: 109px;
        }
        .auto-style9 {
            height: 100px;
            width: 96px;
        }
        .auto-style10 {
            width: 95px;
        }
        .auto-style11 {
            height: 38px;
        }
        .auto-style12 {
            height: 40px;
        }
        .auto-style13 {
            height: 65px;
        }
        .auto-style14 {
            height: 35px;
        }
        .auto-style15 {
            height: 42px;
        }
        .auto-style16 {
            height: 40px;
            width: 125px;
        }
        .auto-style17 {
            height: 65px;
            width: 125px;
        }
        .auto-style18 {
            height: 35px;
            width: 125px;
        }
        .auto-style19 {
            height: 42px;
            width: 125px;
        }
        .auto-style20 {
            width: 125px;
        }
        .auto-style21 {
            height: 38px;
            width: 152px;
        }
        .auto-style22 {
            height: 38px;
            width: 125px;
        }
    </style>
</asp:Content>
