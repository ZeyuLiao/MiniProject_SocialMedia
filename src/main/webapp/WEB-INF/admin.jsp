<%@ page import="neu.edu.entity.AccountData" %>
<%@ page import="java.util.ArrayList" %>
<!DOCTYPE html>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<%
    ArrayList<AccountData> accountlist = (ArrayList<AccountData>) request.getAttribute("accountlist");
%>

<head>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet"
          integrity="sha384-GLhlTQ8iRABdZLl6O3oVMWSktQOp6b7In1Zl3/Jr59b6EGGoI1aFkw7cmDA6j6gD" crossorigin="anonymous">
    <link href="css/stylesheet.css" rel="stylesheet">
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js"
            integrity="sha384-w76AqPfDkMBDXo30jS1Sgez6pr3x5MlQ1ZAGC+nuZB+EYdgRZgiwxhTBTkF7CXvN"
            crossorigin="anonymous"></script>
</head>
<body>
<header class="p-1 text-bg-dark sticky-top">

    <div class="container-fluid">
        <div class="d-flex flex-wrap align-items-center justify-content-center justify-content-lg-start">

            <a class="navbar-brand" href="https://www.northeastern.edu/">
                <img src="Neu_Logo.png" alt="Logo"
                     width="70" height="70"
                     class="d-inline-block align-text-top">
            </a>
            <ul class="nav col-12 col-lg-auto me-lg-auto mb-2 justify-content-center mb-md-0">
                <li><a href="adminDeleteUser" class="nav-link px-2 text-white fs-4">Accounts</a></li>
            </ul>

            <div class="d-flex justify-content-center align-items-center">
                <a href="#" class="btn-link me-2 fs-5">
                    Admin
                </a>
                <a href="logout" class="nav-link me-2 text-white fs-5">Logout</a>
            </div>

        </div>
    </div>
</header>

<div class="container py-3">
    <main>
        <div class="list-group">
            <% for (AccountData account : accountlist) { %>
            <a class="list-group-item list-group-item-action btn" data-bs-toggle="modal"
               data-username="<%=account.getUsername()%>" data-bs-target="#twoStepConfirmation"
               onclick="delUser(this)">
                <%=account.getUsername() + "  " + account.getFirstName() + "  " + account.getLastName() + "  " + account.getEmail() + "  " + account.getMobileNumber()%>
            </a>
            <% }%>
        </div>
    </main>
</div>


<!-- Modal -->
<div class="modal fade" id="twoStepConfirmation" tabindex="-1" aria-labelledby="twoStepConfirmation" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <h1 class="modal-title fs-5" id="exampleModalLabel">Delete Confirmation</h1>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
            <div class="modal-body" id="modal-body">
                ...
            </div>
            <form class="modal-footer" action="deleteUser" method="post" id="confirmButton">
                <button type="submit" class="btn btn-primary">Delete</button>
                <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Cancel</button>
            </form>
        </div>
    </div>
</div>
<footer class="fixed-bottom">
    <nav class="p-1 text-bg-dark">
        <div class="container-fluid text-end">
            <p class="mt-3 mb-3 text-light">@ZeyuLiao Assignment3</p>
        </div>
    </nav>
</footer>
<script>
    let usertoDelete = "";
    function delUser(button) {
        let username = button.getAttribute("data-username");
        document.getElementById("modal-body").innerHTML = "Do you want to delete the user named: " + username + " ?";
        usertoDelete = username;
    }
</script>
<script>
    const form = document.getElementById("confirmButton");
    form.addEventListener('submit', event => {
        event.preventDefault();
        let actionUrl = form.getAttribute("action");
        actionUrl += "?username=" + usertoDelete;
        console.log(actionUrl);
        form.setAttribute("action", actionUrl);
        form.submit();
    });
</script>
</body>
</html>

