<%@ Page Title="Login" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="Flash_Cards.Login" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <div class="jumbotron" style="width: 50%;">
        <main class="form-signin">
            <h2><%: Title %></h2>

            <div class="form-floating">
                <input class="form-control" id="floatingInput" placeholder="Username" />
                <label for="floatingInput">Username</label>
            </div>
            <div class="form-floating">
                <input type="password" class="form-control" id="floatingPassword" placeholder="Password" />
                <label for="floatingPassword">Password</label>
            </div>

            <div class="checkbox mb-3">
                <label>
                    <input type="checkbox" value="remember-me" />
                    Remember me
                </label>
            </div>
            <button class="w-100 btn btn-lg btn-primary fc-button" type="submit">Sign in</button>
        </main>
    </div>
</asp:Content>
