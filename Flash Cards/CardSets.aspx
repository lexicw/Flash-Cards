<%@ Page Title="Card Sets" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="CardSets.aspx.cs" Inherits="Flash_Cards.Contact" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <div class="jumbotron">
        <h2><%: Title %></h2>
        <section class="container-fluid container-feed">
            <div class="container">
                <div class="row">
                <asp:Repeater ID="rptSets" runat="server">
                    <ItemTemplate>
                        
                            <div class="col-xs-12 col-md-4 col-card">
                                <div class="card">
                                    <div class="card-front">
                                        <div class="card-excerpt">
                                            <div style="float: right;">
                                                <button type="button" class="icon-buttons" data-bs-toggle="modal" data-bs-target="#editSetsModal"><i class="fas fa-edit"></i></button>
                                                <button class="icon-buttons"><i class="fas fa-trash-alt"></i></button>
                                            </div>
                                            <h3 class="card-title text-center"><asp:Label ID="lblCustomerId" runat="server" Text='<%# Eval("setName") %>' /></h3>
                                            <p class="card-text"><%# Eval("description") %></p>
                                        </div>
                                        <div class="card-cta">
                                            <p>
                                                <button type="button" class="btn btn-primary fc-button">Study This Set &nbsp;&nbsp;<i class="fas fa-chevron-right"></i></button></p>
                                        </div>
                                    </div>
                                    <div class="card-back">
                                        &nbsp;
                                    </div>
                                </div>
                            </div>
                    </ItemTemplate>
                </asp:Repeater>
                </div>
            </div>
        </section>


    <span style="display:flex; justify-content:flex-end; width:100%; padding:0;">
            <button type="button" class="btn btn-lg btn-outline-dark" data-bs-toggle="modal" data-bs-target="#addSetModal">Add New Set +</button>
    </span>







        <!-- Edit Sets Modal -->
        <div class="modal fade" id="editSetsModal" tabindex="-1" aria-labelledby="editSetsModal" aria-hidden="true">
            <div class="modal-dialog modal-dialog-centered">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title" id="editSetLabel">Edit Set</h5>
                        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                    </div>
                    <div class="modal-body">
                        Cards will be here and stuff
                      <br />
                        <br />
                        More Text
                      <br />
                        <br />
                        Other stuff
                      <br />
                        <br />
                        I dunno lol
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
                        <button type="button" class="btn btn-primary">Save changes</button>
                    </div>
                </div>
            </div>
        </div>


        <!-- Add Set Modal -->
        <div class="modal fade" id="addSetModal" tabindex="-1" aria-labelledby="editSetsModal" aria-hidden="true">
            <div class="modal-dialog modal-lg modal-dialog-centered">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title" id="addSetLabel">Add Set</h5>
                        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                    </div>
                    <div class="modal-body">
                        Cards will be here and stuff
                      <br />
                        <br />
                        More Text
                      <br />
                        <br />
                        Other stuff
                      <br />
                        <br />
                        I dunno lol
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
                        <button type="button" class="btn btn-primary">Save changes</button>
                    </div>
                </div>
            </div>
        </div>


    </div>
</asp:Content>
