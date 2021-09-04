<%@ Page Title="Card Sets" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="CardSets.aspx.cs" Inherits="Flash_Cards.Contact" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <div class="jumbotron">
        <h2><%: Title %></h2>


        <div class="row">
            <div class="col-sm-4">
                <div class="card" style="width: 25rem;">
                    <div class="card-body">
                        <h3 class="card-title text-center">Set title</h3>
                        <p class="card-text">Some quick example text to build on the card title and make up the bulk of the card's content. Some quick example text to build on the card title and make up the bulk of the card's content.</p>
                        <button type="button" class="btn btn-primary fc-button" data-bs-toggle="modal" data-bs-target="#editSetsModal">Edit</button>
                        <button type="button" class="btn btn-dark delete-button">Delete</button>
                    </div>
                </div>
            </div>

            <div class="col-sm-4">
                <div class="card" style="width: 25rem;">
                    <div class="card-body">
                        <h3 class="card-title text-center">Set title</h3>
                        <p class="card-text">Some quick example text to build on the card title and make up the bulk of the card's content. Some quick example text to build on the card title and make up the bulk of the card's content.</p>
                        <button type="button" class="btn btn-primary fc-button" data-bs-toggle="modal" data-bs-target="#editSetsModal">Edit</button>
                        <button type="button" class="btn btn-dark delete-button">Delete</button>
                    </div>
                </div>
            </div>

            <div class="col-sm-4">
                <div class="card" style="width: 25rem;">
                    <div class="card-body">
                        <h3 class="card-title text-center">Set title</h3>
                        <p class="card-text">Some quick example text to build on the card title and make up the bulk of the card's content. Some quick example text to build on the card title and make up the bulk of the card's content.</p>
                        <button type="button" class="btn btn-primary fc-button" data-bs-toggle="modal" data-bs-target="#editSetsModal">Edit</button>
                        <button type="button" class="btn btn-dark delete-button">Delete</button>
                    </div>
                </div>
            </div>

            <div class="col-sm-4">
                <div class="card" style="width: 25rem;">
                    <div class="card-body">
                        <h3 class="card-title text-center">Set title</h3>
                        <p class="card-text">Some quick example text to build on the card title and make up the bulk of the card's content. Some quick example text to build on the card title and make up the bulk of the card's content.</p>
                        <button type="button" class="btn btn-primary fc-button" data-bs-toggle="modal" data-bs-target="#editSetsModal">Edit</button>
                        <button type="button" class="btn btn-dark delete-button">Delete</button>
                    </div>
                </div>
            </div>
        </div>

            <!-- Edit Sets Modal -->
            <div class="modal fade" id="editSetsModal" tabindex="-1" aria-labelledby="editSetsModal" aria-hidden="true">
              <div class="modal-dialog modal-dialog-centered">
                <div class="modal-content">
                  <div class="modal-header">
                    <h5 class="modal-title" id="exampleModalLabel">Edit Set</h5>
                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                  </div>
                  <div class="modal-body">
                    Cards will be here and stuff
                      <br /><br />
                    More Text
                      <br /><br />
                    Other stuff
                      <br /><br />
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
