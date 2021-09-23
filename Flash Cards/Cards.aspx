<%@ Page Title="Cards" Language="C#" MasterPageFile="~/Site.Master" MaintainScrollPositionOnPostback="true" smartnavigation="true" AutoEventWireup="true" CodeBehind="Cards.aspx.cs" Inherits="Flash_Cards.Cards" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">

    <div class="jumbotron">
        <h2><%: Title %></h2>
        <button class="back-button" runat="server" onclick="history.go(-1); return false;" title="Back to Card Sets"><i class="fas fa-chevron-left"></i>&nbsp; Back</button>

            <%--<section class="flash-card-div">
              <div class="flash-card" onclick="flip()">
                <div class="front"><h3><asp:Label ID="Label1" runat="server"></asp:Label></h3></div>
                <div class="back"><h3><asp:Label ID="Label2" runat="server"></asp:Label></h3></div>
              </div>
            </section>--%>
        <br />
            <p>&nbsp;</p>
            <div class="table table-responsive">
            <table class="table table-responsive table-bordered" style="background-color: #FFF;">
            <thead>
	            <tr style="background-color: #e3f2fd;">
    	            <td><b>Card Front</b></td>
    	            <td><b>Card Back</b></td>
    	            <td width="25px;"></td>
                </tr>
            </thead>
            <tbody id="TextBoxContainer">
            </tbody>
               <td><input name="DynamicTextBox" type="text" class="form-control" /></td><td><input name="DynamicTextBox" type="text" class="form-control" /></td><td><button type="button" class="btn btn-danger remove"><i class="fas fa-times"></i></button></td>
            <tfoot>
            </tfoot>
            </table>
                <button id="btnAdd" type="button" class="btn btn-secondary" style="float: left; margin-left: 5px; margin-bottom: 5px;"><i class="fas fa-plus"></i></button>
                <button id="btnSave" type="button" class="btn btn-dark" style="float: left; margin-left: 5px; margin-bottom: 5px;">Save Cards</button>
            </div>

        <asp:GridView CssClass="card-gridview" ID="cardGridView" runat="server" AutoGenerateColumns="false" AllowPaging="true" ForeColor="#000"
            OnPageIndexChanging="OnPaging" PageSize="8" OnRowDataBound="OnRowDataBound" OnRowEditing="OnRowEditing" OnRowCancelingEdit="OnRowCancelingEdit" OnRowUpdating="OnRowUpdating" OnRowDeleting="OnRowDeleting" EmptyDataText="No records has been added.">
            <Columns>
                <asp:BoundField ItemStyle-Width="50%" DataField="front" HeaderText="Card Front" />
                <asp:BoundField ItemStyle-Width="50%" DataField="back" HeaderText="Card Back" />
                 <asp:TemplateField>
                    <EditItemTemplate>
                        <div style="width:50px;">
                        <asp:LinkButton ID="ButtonUpdate" runat="server" CommandName="Update" Text="" CssClass="fas fa-check-circle card-button-update" />
                        <asp:LinkButton ID="ButtonCancel" runat="server" CommandName="Cancel" Text="" CssClass="fas fa-times-circle card-button-cancel" />
                        </div>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <div style="width:50px;">
                        <asp:LinkButton ID="ButtonEdit" runat="server" CommandName="Edit" Text="" CssClass="fas fa-edit card-button-edit" />
                        <asp:LinkButton ID="ButtonDelete" runat="server" CommandName="Delete" Text="" CssClass="fas fa-trash-alt card-delete-button" />
                        </div>
                    </ItemTemplate>
                 </asp:TemplateField>
            </Columns>
            <PagerStyle HorizontalAlign="Right" CssClass="grid-paging" />
        </asp:GridView>



    </div>
    <script>
        function flip() {
            $('.flash-card').toggleClass('flipped');
        }



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
    </script>


</asp:Content>
