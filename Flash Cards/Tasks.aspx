<%@ Page Title="Tasks" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Tasks.aspx.cs" Inherits="Flash_Cards.Tasks" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <h2><%: Title %>.</h2>
    
    <div class="task-container p-5">
        <select class="form-select form-select-lg mb-3" aria-label=".form-select-lg example">
            <option selected>Select a card set below.</option>
            <option value="1">One</option>
            <option value="2">Two</option>
            <option value="3">Three</option>
        </select>
        <div id="cards_wrap">
        <div class="container">
            <div class="row">
                <div class="col-xs-12 col-sm-6 col-md-3 col-lg-4">
                    <div class="task-card">
                        <div class="icon-box ">
                            <div class="inner-box">
                                <i class="far fa-clone"></i>
                            </div>
                        </div>
                        <h4>Flash Cards</h4>
                        <p>Text here.</p>    
                    </div>
                </div>
                <div class="col-lg-4">
                    <div class="task-card">
                        <div class="icon-box ">
                            <div class="inner-box">
                                <i class="fas fa-paperclip"></i>
                            </div>
                        </div>
                        <h4>Quiz Mode</h4>
                        <p id="direction">Text here.</p>
                    </div>
                </div>
                <div class="clearfix hidden-md hidden-lg"></div>
                <div class="col-lg-4">
                    <div class="task-card">
                        <div class="icon-box ">
                            <div class="inner-box">
                                <i class="fas fa-ruler"></i>
                            </div>
                        </div>
                        <h4>Matching</h4>
                        <p>Text here.</p>  
                    </div>
                </div>
            </div>
        </div>
    </div>
    </div>
</asp:Content>
