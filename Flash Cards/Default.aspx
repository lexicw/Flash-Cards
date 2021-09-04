<%@ Page Title="Home Page" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="Flash_Cards._Default" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <script src="https://code.jquery.com/jquery-3.6.0.js" integrity="sha256-H+K7U5CnXl1h5ywQfKtSj8PCmoN9aaq30gDh27Xc0jk=" crossorigin="anonymous"></script>
    <div class="jumbotron">
        <h2>Get Started</h2>
    </div>

    <ul class="notes-ul">
      <li class="notes-li">
        <a class="sticky-note" href="#" contenteditable>
          <h3>Title #1</h3>
          <p>Text Content #1</p>
        </a>
      </li>
      <li class="notes-li">
        <a class="sticky-note" href="#" contenteditable>
          <h3>Title #2</h3>
          <p>Text Content #2</p>
        </a>
      </li>
      <li class="notes-li">
        <a class="sticky-note" href="#" contenteditable>
          <h3>Title #3</h3>
          <p>Text Content #3</p>
        </a>
      </li>
      <li class="notes-li">
        <a class="sticky-note" href="#" contenteditable>
          <h3>Title #4</h3>
          <p>Text Content #4</p>
        </a>
      </li>
      <li class="notes-li">
        <a class="sticky-note" href="#" contenteditable>
          <h3>Title #5</h3>
          <p>Text Content #5</p>
        </a>
      </li>
      <li class="notes-li">
        <a class="sticky-note" href="#" contenteditable>
          <h3>Title #6</h3>
          <p>Text Content #6</p>
        </a>
      </li>
      <li class="notes-li">
        <a class="sticky-note" href="#" contenteditable>
          <h3>Title #7</h3>
          <p>Text Content #7</p>
        </a>
      </li>
      <li class="notes-li">
        <a class="sticky-note" href="#" contenteditable>
          <h3>Title #8</h3>
          <p>Text Content #8</p>
        </a>
      </li>
      <li class="notes-li">
        <a class="sticky-note" href="#" contenteditable>
          <h3>Title #9</h3>
          <p>Text Content #9</p>
        </a>
      </li>
      <li class="notes-li">
        <a class="sticky-note" href="#" contenteditable>
          <h3>Title #10</h3>
          <p>Text Content #10</p>
        </a>
      </li>
    </ul>



    

    <script>
       
        $(document).ready(function () {
            all_notes = $(".sticky-note");

            all_notes.on("keyup", function () {
                note_title = $(this).find("h2").text();
                note_content = $(this).find("p").text();

                item_key = "list_" + $(this).parent().index();

                data = {
                    title: note_title,
                    content: note_content
                };

                window.localStorage.setItem(item_key, JSON.stringify(data));
            });

            all_notes.each(function (index) {
                data = JSON.parse(window.localStorage.getItem("list_" + index));

                if (data !== null) {
                    note_title = data.title;
                    note_content = data.content;

                    $(this).find("h2").text(note_title);
                    $(this).find("p").text(note_content);
                }
            });
        });

    </script>

</asp:Content>



