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
                                    <div class="card card-shadow rounded">
                                        <div class="card-front">
                                            <div class="card-excerpt">
                                                <div style="float: right;">
                                                    <asp:LinkButton ClientIDMode="AutoID" CommandArgument='<%#Eval("setId")%>' SetName='<%#Eval("setName")%>' SetDesc='<%#Eval("description")%>' ID="EditButton" runat="server" OnClick="EditSetBtn_Click" CssClass="icon-buttons"><i class="fas fa-edit icon-zoom" title="Edit Set"></i></asp:LinkButton>

                                                    <asp:LinkButton ID="deleteSetBtn" runat="server" CommandArgument='<%#Eval("setId")%>' OnClientClick="return getConfirmation(this, 'Delete Set?','Are you sure you want to delete this set? This action cannot be reversed.');" OnClick="DeleteSetBtn_Click" CssClass="icon-buttons"><i class="fas fa-trash-alt icon-zoom"" data-toggle="tooltip" data-placement="top" title="Delete Set"></i></asp:LinkButton>
                                                </div>
                                                <h3 class="card-title text-center">
                                                    <asp:Label ID="lblSetName" runat="server" Text='<%# Eval("setName") %>' /></h3>
                                                <p class="card-text"><%# Eval("description") %></p>
                                            </div>
                                            <div class="card-cta">
                                                <p>
                                                    <asp:LinkButton ID="btnGoToCards" OnClick="ButtonGoToCards_Click" runat="server" CommandArgument='<%#Eval("setId")%>' type="button" class="btn fc-button btn-light">Go To Cards &nbsp;&nbsp;<i class="fas fa-chevron-right"></i></asp:LinkButton>
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
                        <h2 class="modal-title" id="editSetLabel">
                            <i class="fas fa-edit text-warning"></i>
                            Edit Set
                        </h2>
                        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                    </div>
                    <div class="modal-body">
                        <div class="mb-3">
                            <label for="editSetNameTxt" class="form-label">Set Name</label>
                            <asp:Textbox runat="server" class="form-control" id="editSetNameTxt" ClientIDMode="Static" />
                        </div>
                        <div class="mb-3">
                            <label for="editDescTxt" class="form-label">Description</label>
                            <asp:TextBox runat="server" class="form-control" id="editDescTxt" maxlength="150" TextMode="MultiLine" Rows="3" ClientIDMode="Static"></asp:TextBox>
                        </div>
                        <asp:HiddenField ID="hdnfldSetId" runat="server" ClientIDMode="Static" />  
                    </div>
                    <div class="modal-footer">
                        <asp:LinkButton ID="editSaveButton" OnClick="SaveEditSetBtn_Click" runat="server" class="btn btn-warning" Text="Save"></asp:LinkButton>
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
                        <h2 class="modal-title" id="addSetLabel">
                            <i class="fas fa-folder-plus text-secondary"></i>
                            Add New Set
                         </h2>
                        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                    </div>
                    <div class="modal-body">
                        <div class="mb-3">
                            <label runat="server" id="lblNewSetName" for="setNameTxt" class="form-label">Set Name</label>
                            <asp:TextBox runat="server" ID="newSetNameTxt" class="form-control" placeholder="Name of your set."></asp:TextBox>
                        </div>
                        <div class="mb-3">
                            <label runat="server" id="lblNewDesc" for="descTxt" class="form-label">Description</label>
                            <asp:TextBox runat="server" TextMode="MultiLine" class="form-control" ID="newDescText" maxlength="150" Rows="3" placeholder="Type your set description here."></asp:TextBox>
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

    <!-- Delete Set Modal -->
        <div class="modal fade" id="deleteSetsModal" tabindex="-1" aria-labelledby="deleteSetsModal" aria-hidden="true">
            <div class="modal-dialog modal-dialog-centered">
                <div class="modal-content">
                    <div class="modal-header">
                        <h2 class="modal-title">
                            <i class="fas fa-exclamation-triangle text-danger"></i>&nbsp;
                            <span id="deleteSetTitle"></span>
                        </h2>
                        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                    </div>
                    <div class="modal-body">
                        <span id="deleteMsg"></span>
                    </div>
                    <div class="modal-footer">
                        <a id="btnConfirm" class="btn btn-danger">Delete</a>
                        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Cancel</button>
                    </div>
                </div>
            </div>
        </div>

    <script>
        $(function () { // Function for setting Edit Sets Modal fields then showing the modal
            showModal = function (setName, setDesc, setId) {
                $("#editSetNameTxt").val(setName);
                $("#editDescTxt").text(setDesc);
                $("#hdnfldSetId").val(setId);
                $("#editSetsModal").modal("show");
            }
        });

        function getConfirmation(sender, title, message) { // Delete Sets Modal Confirmation
            $("#deleteSetTitle").text(title);
            $("#deleteMsg").text(message);
            $('#deleteSetsModal').modal('show');
            $('#btnConfirm').attr('onclick', "$('#deleteSetsModal').modal('hide');setTimeout(function(){" + $(sender).prop('href') + "}, 10);");
            return false;
        }
    </script>
 
</asp:Content>
