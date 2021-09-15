<%@ Page Title="Login" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="Flash_Cards.Login" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <link rel="stylesheet" href="https://pro.fontawesome.com/releases/v5.10.0/css/all.css" integrity="sha384-AYmEC3Yw5cVb3ZcuHtOA93w35dYTsvhLPVnYs9eStHfGJvOvKxVfELGroGkvsg+p" crossorigin="anonymous"/>
    <style>
    .main-head{
        height: 150px;
        background: #FFF;
   
    }

    .sidenav {
        height: 100%;
        background-color: #337ab7;
        overflow-x: hidden;
        padding-top: 20px;
    }


    .main {
        padding: 0px 10px;
    }

    .signin-button {
    width: 100%;
    color: #FFF;
    margin: auto;
    margin-bottom: 2px;
    display: block;
    background-color: #337ab7;
}
    .signin-button:hover, .signin-button:focus {
        background-color: #245580;
        color: #FFF;
    }

    @media screen and (max-height: 450px) {
        .sidenav {padding-top: 15px;}
    }

    @media screen and (max-width: 450px) {
        .login-form{
            margin-top: 10%;
        }

        .register-form{
            margin-top: 10%;
        }
    }

    @media screen and (min-width: 768px){
        .main{
            margin-left: 40%; 
        }

        .sidenav{
            width: 40%;
            position: fixed;
            z-index: 1;
            top: 0;
            left: 0;
        }

        .login-form{
            margin-top: 80%;
        }

        .register-form{
            margin-top: 20%;
        }
    }


    .login-main-text{
        margin-top: 20%;
        padding: 60px;
        color: #fff;
    }

    .login-main-text h2{
        font-weight: 300;

    }

    .stripe-bg {
        background-image: linear-gradient(45deg, #e3f2fd 25%, #ffffff 25%, #ffffff 50%, #e3f2fd 50%, #e3f2fd 75%, #ffffff 75%, #ffffff 100%);
        background-size: 28.28px 28.28px;
        width: 100%;
        padding: 75px;
        position: fixed;
        top: 0px;
        overflow-y: hidden;
        z-index: -1;
    }

    .fa-square {
        font-size: 50px;
    }

    .login-msg {
        color: red;
    }

    </style>

    <div class="sidenav">
         <div class="login-main-text">
            <h2>Flash Cards<br> Login Page</h2>

            <p><i class="fas fa-square"></i> <i class="far fa-square"></i> <i class="fas fa-square"></i> <i class="far fa-square"></i> <i class="fas fa-square"></i></p>
            <p>Login or register from here to access.</p>
         </div>
      </div>
    
      <div class="main">
         <div class="col-md-6 col-sm-12">
            <div class="login-form">
               <form>
                  <div class="form-floating mb-3">
                     <asp:TextBox runat="server" id="userNameTxt" type="text" class="form-control" placeholder="User Name"></asp:TextBox>
                      <label for="userNameTxt">User Name</label>
                  </div>
                  <div class="form-floating">
                     <asp:TextBox runat="server" id="passwordTxt" type="password" class="form-control" placeholder="Password"></asp:TextBox>
                      <label for="passwordTxt">Password</label>
                  </div>
                   <div class="form-check mt-2 mb-2">
                      <input class="form-check-input" type="checkbox" value="" id="flexCheckDefault">
                      <label class="form-check-label" for="flexCheckDefault">
                        Remember Me
                      </label>
                    </div>
                   <asp:Label CssClass="login-msg" ID="loginMsg" runat="server"></asp:Label>  
                  <asp:Button runat="server" type="submit" class="btn signin-button" onclick="LoginBtn_Click" Text="Log in"></asp:Button>
               </form>
            </div>
         </div>
      </div>

</asp:Content>
