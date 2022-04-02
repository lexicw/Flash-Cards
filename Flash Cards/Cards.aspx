<%@ Page Title="Cards" Language="C#" MasterPageFile="~/Site.Master" MaintainScrollPositionOnPostback="true" SmartNavigation="true" AutoEventWireup="true" CodeBehind="Cards.aspx.cs" Inherits="Flash_Cards.Cards" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">

    <div class="jumbotron">
        <asp:LinkButton class="back-button" runat="server" OnClick="Back_Click" title="Back to Card Sets"><i class="fas fa-chevron-left"></i>&nbsp;Back</asp:LinkButton>

        <%--<section class="flash-card-div">
              <div class="flash-card" onclick="flip()">
                <div class="front"><h3><asp:Label ID="Label1" runat="server"></asp:Label></h3></div>
                <div class="back"><h3><asp:Label ID="Label2" runat="server"></asp:Label></h3></div>
              </div>
            </section>--%>
        <br />
        <br />
        <br />
        <h3 runat="server" id="setTitle" style="text-align: center;">Card Set Title</h3>
        <%--        <ul class="nav nav-tabs">
          <li class="nav-item">
            <a id="YourCardsLink" class="nav-link active" aria-current="page">Your Cards</a>
          </li>
          <li class="nav-item">
            <a id="AddNewLink" class="nav-link bold">Add New Cards</a>
          </li>
        </ul>--%>
        <div id="CardTable" class="mb-5">
            <asp:GridView CssClass="card-gridview" ID="cardGridView" runat="server" AutoGenerateColumns="false" AllowPaging="true" ForeColor="#000" AllowSorting="true" OnSorting="GridView_Sorting" EnableViewState="true"
                OnPageIndexChanging="OnPaging" PageSize="10" OnRowDataBound="OnRowDataBound" OnRowEditing="OnRowEditing" OnRowCancelingEdit="OnRowCancelingEdit" OnRowUpdating="OnRowUpdating" OnRowDeleting="OnRowDeleting" EmptyDataText="This set is currently empty. Add cards to begin using this set.">
                <Columns>
                    <asp:BoundField ItemStyle-Width="50%" DataField="front" HeaderText="Card Front" SortExpression="front" />
                    <asp:BoundField ItemStyle-Width="50%" DataField="back" HeaderText="Card Back" SortExpression="back" />

                    <asp:TemplateField>
                        <EditItemTemplate>
                            <div style="width: 90px; text-align: center;">
                                <asp:LinkButton ID="ButtonSwap" runat="server" OnClick="OnRowSwap" Text="" CssClass="fas fa-exchange-alt card-button-swap" data-bs-toggle="tooltip" data-placement="top" title="Swap Front & Back" />
                                <asp:LinkButton ID="ButtonUpdate" runat="server" CommandName="Update" Text="" CssClass="fas fa-check-circle card-button-update" data-bs-toggle="tooltip" data-placement="top" title="Update Card" />
                                <asp:LinkButton ID="ButtonCancel" runat="server" CommandName="Cancel" Text="" CssClass="fas fa-times-circle card-button-cancel" data-bs-toggle="tooltip" data-placement="top" title="Cancel Edit" />
                            </div>
                        </EditItemTemplate>
                        <ItemTemplate>
                            <div style="width: 70px; float: right;">
                                <asp:LinkButton ID="ButtonEdit" runat="server" CommandName="Edit" Text="" CssClass="fas fa-edit card-button-edit" data-bs-toggle="tooltip" data-placement="top" title="Edit Card" />
                                <asp:LinkButton ID="ButtonDelete" runat="server" CommandName="Delete" Text="" CssClass="fas fa-trash-alt card-delete-button" data-bs-toggle="tooltip" data-placement="top" title="Delete Card" />
                            </div>
                        </ItemTemplate>
                    </asp:TemplateField>
                </Columns>
                <PagerStyle HorizontalAlign="Right" CssClass="grid-paging" />
            </asp:GridView>
        </div>

        <div id="AddNewCard">
            <div class="table table-responsive">
                <table class="table table-responsive table-bordered" style="background-color: #FFF; border: 1px solid #aaaaaa;">
                    <thead>
                        <tr style="background-color: #c0e0f4;">
                            <td><b>Card Front</b></td>
                            <td><b>Card Back</b></td>
                            <td width="25px;"></td>
                        </tr>
                    </thead>
                    <tbody id="TextBoxContainer">
                    </tbody>
                    <td>
                        <input name="DynamicTextBox" type="text" class="form-control" /></td>
                    <td>
                        <input name="DynamicTextBox" type="text" class="form-control" /></td>
                    <td>
                        <button type="button" class="btn btn-danger remove"><i class="fas fa-times"></i></button>
                    </td>
                    <tfoot>
                    </tfoot>
                </table>
                <div>
                    <button id="btnAdd" type="button" class="btn btn-secondary btn-sm" style="margin-left: 5px; margin-bottom: 5px;"><i class="fas fa-plus"></i></button>
                    <button id="btnSave" type="button" class="btn btn-dark btn-lg float-end" style="margin-left: 5px; margin-bottom: 5px;">Save Cards</button>
                </div>
            </div>
        </div>

    </div>

    <script>
        function flip() {
            $('.flash-card').toggleClass('flipped');
        }

        $(document).ready(function () {
            $(".card-gridview th:eq(0), .card-gridview th:eq(1)").append("&nbsp;&nbsp;<i class='fas fa-caret-down'></i>");
        });

        $(function () {
            $("#btnAdd").bind("click", function () {
                var div = $("<tr />");
                div.html(GetDynamicTextBox(""));
                $("#TextBoxContainer").append(div);
            });
            $("body").on("click", ".remove", function () {
                $(this).closest("tr").remove();
            });
        });
        function GetDynamicTextBox(value) {
            return '<td><input name = "DynamicTextBox" type="text" value = "' + value + '" class="form-control" /></td>' + '<td><input name = "DynamicTextBox" type="text" value = "' + value + '" class="form-control" /></td>' + '<td><button type="button" class="btn btn-danger remove"><i class="fas fa-times"></i></button></td>'
        }
        //$(function () {
        //    $("#AddNewLink").on("click", function () {
        //        $(this).addClass('active');
        //        $('#YourCardsLink').removeClass('active');
        //        $('#CardTable').addClass('invisible');
        //        $('#AddNewCard').removeClass('invisible');
        //    });
        //    $("#YourCardsLink").on("click", function () {
        //        $(this).addClass('active');
        //        $('#AddNewLink').removeClass('active');
        //        $('#AddNewCard').addClass('invisible');
        //        $('#CardTable').removeClass('invisible');
        //    });
        //});

    </script>

</asp:Content>
