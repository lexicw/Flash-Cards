<%@ Page Title="Study" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Study.aspx.cs" Inherits="Flash_Cards.Cards" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">

    <div class="jumbotron">
        <h2><%: Title %></h2>

            <section class="flash-card-div">
              <div class="flash-card" onclick="flip()">
                <div class="front"><h3><asp:Label ID="Label1" runat="server"></asp:Label></h3></div>
                <div class="back"><h3><asp:Label ID="Label2" runat="server"></asp:Label></h3></div>
              </div>
            </section>

    </div>
    <script>
        function flip() {
            $('.flash-card').toggleClass('flipped');
        }
    </script>


</asp:Content>
