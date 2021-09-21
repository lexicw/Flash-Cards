<%@ Page Title="Cards" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Cards.aspx.cs" Inherits="Flash_Cards.Cards" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">

    <div class="jumbotron">
        <h2><%: Title %></h2>
        <button class="back-button" runat="server" onclick="JavaScript:window.history.back(1);return false;" title="Back to Card Sets"><i class="fas fa-chevron-left"></i>&nbsp; Back</button>

            <section class="flash-card-div">
              <div class="flash-card" onclick="flip()">
                <div class="front"><h3><asp:Label ID="Label1" runat="server"></asp:Label></h3></div>
                <div class="back"><h3><asp:Label ID="Label2" runat="server"></asp:Label></h3></div>
              </div>
            </section>
        <br />
            <p>&nbsp;</p>
            <div class="table table-responsive">
            <table class="table table-responsive table-bordered" style="background-color: #FFF;">
            <thead>
	            <tr style="background-color: #e3f2fd;">
    	            <td>Card Front</td>
    	            <td>Card Back</td>
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

        <ul class="add-card-list">
          <li class="cards-add-list">Card 1</li>
          <li class="cards-add-list">Card 2</li>
          <li class="cards-add-list">Card 3</li>
        </ul>

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
