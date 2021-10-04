<%@ Page Title="Card Sets" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="CardSets.aspx.cs" Inherits="Flash_Cards.Contact" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <div class="jumbotron">
        <h2><%: Title %></h2>
        <section class="container-fluid container-feed">
            <div class="container">


                <asp:UpdatePanel class="row" ID="panelSets" runat="server">
                    <ContentTemplate>
                        <asp:Repeater ID="rptSets" runat="server">
                            <ItemTemplate>

                                <div class="col-xs-12 col-md-4 col-card">
                                    <div class="card card-shadow">
                                        <div class="card-front">
                                            <div class="card-excerpt">
                                                <div style="float: right;">
                                                    <asp:Label ID="lblID" runat="server" Text='<%#Eval("setId") %>' style="visibility: hidden;" />

                                                    <asp:LinkButton ClientIDMode="AutoID" ID="EditButton" runat="server" OnClick="EditSetBtn_Click" OnClientClick="showModal();" CssClass="icon-buttons"><i class="fas fa-edit" data-toggle="tooltip" data-placement="top" title="Edit Set"></i></asp:LinkButton>

                                                    <button class="icon-buttons"><i class="fas fa-trash-alt" data-toggle="tooltip" data-placement="top" title="Delete Set"></i></button>
                                                </div>
                                                <h3 class="card-title text-center">
                                                    <asp:Label ID="lblCustomerId" runat="server" Text='<%# Eval("setName") %>' /></h3>
                                                <p class="card-text"><%# Eval("description") %></p>
                                            </div>
                                            <div class="card-cta">
                                                <p>
                                                    <a href="/Cards.aspx" type="button" class="btn fc-button btn-light">Go To Cards &nbsp;&nbsp;<i class="fas fa-chevron-right"></i></a>
                                                </p>
                                            </div>
                                        </div>
                                        <div class="card-back">
                                            &nbsp;
                                        </div>
                                    </div>
                                </div>
                            </ItemTemplate>
                        </asp:Repeater>

                        <div role="button" tabindex="0" class="col-xs-12 col-md-4 col-card" data-bs-toggle="modal" data-bs-target="#addSetModal" title="Add New Set">
                            <div class="card add-new-set">
                                <div class="card-front" style="background-color: #fafafa;">
                                    <h2 class="card-btn" style="margin: auto;">Add New Set
                                    <br />
                                        <i class="fas fa-folder-plus" style="font-size: 50px;"></i></h2>
                                </div>
                                <div class="card-back">
                                    &nbsp;
                                </div>
                            </div>
                        </div>
                    </ContentTemplate>
                </asp:UpdatePanel>
            </div>
        </section>

        <!-- Edit Sets Modal -->
        <div class="modal fade" id="editSetsModal" tabindex="-1" aria-labelledby="editSetsModal" aria-hidden="true">
            <div class="modal-dialog modal-dialog-centered">
                <div class="modal-content">
                    <div class="modal-header">
                        <h2 class="modal-title" id="editSetLabel">Edit Set</h2>
                        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                    </div>
                    <div class="modal-body">
                        <div class="mb-3">
                            <label for="editSetNameTxt" class="form-label">Set Name</label>
                            <input class="form-control" id="editSetNameTxt">
                        </div>
                        <div class="mb-3">
                            <label for="editDescTxt" class="form-label">Description</label>
                            <textarea class="form-control" id="editDescTxt" rows="3"></textarea>
                        </div>
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-dark">Save</button>
                        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
                    </div>
                </div>
            </div>
        </div>


        <!-- Add Set Modal -->
        <div class="modal fade" id="addSetModal" tabindex="-1" aria-labelledby="editSetsModal" aria-hidden="true">
            <div class="modal-dialog modal-dialog-centered">
                <div class="modal-content">
                    <div class="modal-header">
                        <h2 class="modal-title" id="addSetLabel">Add New Set</h2>
                        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                    </div>
                    <div class="modal-body">
                        <div class="mb-3">
                            <label runat="server" id="lblNewSetName" for="setNameTxt" class="form-label">Set Name</label>
                            <asp:TextBox runat="server" ID="newSetNameTxt" class="form-control" placeholder="Name of your set."></asp:TextBox>
                        </div>
                        <div class="mb-3">
                            <label runat="server" id="lblNewDesc" for="descTxt" class="form-label">Description</label>
                            <asp:TextBox runat="server" TextMode="MultiLine" class="form-control" ID="newDescText" Rows="3" placeholder="Type your set description here."></asp:TextBox>
                        </div>
                    </div>
                    <div class="modal-footer">
                        <asp:Button ID="addSetBtn" OnClick="AddSetBtn_Click" runat="server" type="button" class="btn btn-dark" Text="Add Set"></asp:Button>
                        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <script type="text/javascript">
        $(function () {
            showModal = function () {
                $("#editSetsModal").modal('show');
            }
        });
    </script>
 
</asp:Content>
