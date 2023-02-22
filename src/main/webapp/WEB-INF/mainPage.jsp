<%@ page import="neu.edu.entity.Post" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="java.util.Set" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Northeastern University MessageBoard</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet"
          integrity="sha384-GLhlTQ8iRABdZLl6O3oVMWSktQOp6b7In1Zl3/Jr59b6EGGoI1aFkw7cmDA6j6gD" crossorigin="anonymous">
    <link href="css/stylesheet.css" rel="stylesheet">
    <script src="https://cdn.bootcss.com/blueimp-md5/2.12.0/js/md5.min.js"></script>
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js"
            integrity="sha384-w76AqPfDkMBDXo30jS1Sgez6pr3x5MlQ1ZAGC+nuZB+EYdgRZgiwxhTBTkF7CXvN"
            crossorigin="anonymous"></script>
</head>

<body>
<%
    ArrayList<Post> posts = (ArrayList<Post>) request.getAttribute("posts");
    String errorType = (String) request.getAttribute("errorType");
    String errorMessage = (String) request.getAttribute("errorMsg");
    Set<String> likes = (Set<String>) request.getAttribute("likes");
%>
<header class="p-1 text-bg-dark sticky-top">

    <div class="container-fluid">
        <div class="d-flex flex-wrap align-items-center justify-content-center justify-content-lg-start">

            <a class="navbar-brand" href="https://www.northeastern.edu/">
                <img src="Neu_Logo.png" alt="Logo"
                     width="70" height="70"
                     class="d-inline-block align-text-top">
            </a>
            <ul class="nav col-12 col-lg-auto me-lg-auto mb-2 justify-content-center mb-md-0">
                <li><a href="post" class="nav-link px-2 text-white fs-4">Home</a></li>
            </ul>

            <form class="col-12 col-lg-auto mb-3 mb-lg-0 me-lg-3 w-25" role="search">
                <input type="search" class="form-control form-control-dark text-bg-dark" placeholder="Search..."
                       aria-label="Search">
            </form>
            <%
                if (session.getAttribute("LogInUsername") == null) {

            %>
            <div class="text-end">
                <button type="button" class="btn btn-outline-light me-2" data-bs-toggle="modal"
                        data-bs-target="#modalLogin" id="loginButton">Log In
                </button>
                <button type="button" class="btn btn-danger" data-bs-toggle="modal"
                        data-bs-target="#modalSignUp" id="signUpButton">
                    Sign Up
                </button>
            </div>
            <%
            } else {
                String LogInUsername = (String) session.getAttribute("LogInUsername");
            %>
            <div class="d-flex justify-content-center align-items-center">
                <a href="test.html" class="btn-link me-2 fs-5">
                    <%
                        out.append(LogInUsername);
                    %>
                </a>
                <a href="logout" class="nav-link me-2 text-white fs-5">Logout</a>
            </div>
            <%
                }
                ;
            %>
        </div>
    </div>
</header>


<div class="container py-3">
    <main class="bg-light rounded shadow p-3 m-3 ">
        <div class="container">
            <div class="row">
                <div class="col-12 ">
                    <%
                        for (Post post : posts) {
                    %>
                    <div class="card shadow mx-auto mb-2">
                        <div class="card-header">
                            <strong class="mx-auto">
                                <%=post.getfrom_name()%>
                            </strong>
                            <small class="text-muted"><%=post.getDate_time()%>
                            </small>
                        </div>

                        <div class="card-body ">
                            <p class="card-text">
                                <%=post.getContent()%>
                            </p>
                        </div>
                        <div class="card-footer">
                            <div class="d-flex justify-content-end">
                                <div class="p-1 me-3">
                                    <ion-icon <%if(likes!=null && likes.contains(post.getId())){%> class="active" <%}%>>
                                        <a class='red-bg nav-link' onclick="getButton(this)" style="cursor: pointer;" data-like-id="<%=post.getId()%>">
                                            <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 512 512"
                                                 class="s-ion-icon"
                                                 width="40" height="40">
                                                <path d="M256 448l-30.164-27.211C118.718 322.442 48 258.61 48 179.095 48 114.221 97.918 64 162.4 64c36.399 0 70.717 16.742 93.6 43.947C278.882 80.742 313.199 64 349.6 64 414.082 64 464 114.221 464 179.095c0 79.516-70.719 143.348-177.836 241.694L256 448z">
                                                </path>
                                            </svg>
                                        </a>
                                    </ion-icon>
                                </div>
                                <div class="p-1">
                                    <a href="comment?father_id=<%=post.getId()%>" class="nav-link">
                                        <svg xmlns="http://www.w3.org/2000/svg" width="35" height="35"
                                             fill="currentColor" style="transform: translateY(5px);"
                                             class="bi bi-chat-square-dots" viewBox="0 0 16 16">
                                            <path d="M14 1a1 1 0 0 1 1 1v8a1 1 0 0 1-1 1h-2.5a2 2 0 0 0-1.6.8L8 14.333 6.1 11.8a2 2 0 0 0-1.6-.8H2a1 1 0 0 1-1-1V2a1 1 0 0 1 1-1h12zM2 0a2 2 0 0 0-2 2v8a2 2 0 0 0 2 2h2.5a1 1 0 0 1 .8.4l1.9 2.533a1 1 0 0 0 1.6 0l1.9-2.533a1 1 0 0 1 .8-.4H14a2 2 0 0 0 2-2V2a2 2 0 0 0-2-2H2z"/>
                                            <path d="M5 6a1 1 0 1 1-2 0 1 1 0 0 1 2 0zm4 0a1 1 0 1 1-2 0 1 1 0 0 1 2 0zm4 0a1 1 0 1 1-2 0 1 1 0 0 1 2 0z"/>
                                        </svg>
                                    </a>
                                </div>
                            </div>
                        </div>
                    </div>

                    <%
                        }
                        ;
                    %>

                </div>
            </div>
        </div>
    </main>
</div>

<div style="height: 50px;"></div>

<div class="go-top">
    <svg xmlns="http://www.w3.org/2000/svg" width="35" height="35" fill="currentColor" class="bi bi-caret-up-fill"
         viewBox="0 0 16 16">
        <path d="m7.247 4.86-4.796 5.481c-.566.647-.106 1.659.753 1.659h9.592a1 1 0 0 0 .753-1.659l-4.796-5.48a1 1 0 0 0-1.506 0z"/>
    </svg>
</div>


<footer class="fixed-bottom">
    <nav class="p-1 text-bg-dark">
        <div class="container-fluid text-end">
            <p class="mt-3 mb-3 text-light">@ZeyuLiao Assignment3</p>
        </div>
    </nav>
</footer>


<div class=" modal modal-lg bg-secondary py-5 fade" tabindex="-1" role="dialog" id="modalLogin"
     aria-labelledby="ModalLabel" aria-hidden="true">
    <div class="modal-dialog modal-dialog-scrollable" role="document">
        <div class="modal-content rounded-4 shadow">
            <div class="modal-header p-5 pb-4 border-bottom-0">
                <!-- <h1 class="modal-title fs-5" >Modal title</h1> -->
                <h1 class="text-primary fw-bold mb-0 fs-2">Log in</h1>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>

            <div class="modal-body p-5 pt-0">
                <form class="row g-3 needs-validation" method="post" action="login" id="loginForm">

                    <div class="col-md-10">
                        <label for="username" class="form-label">Username</label>
                        <input type="text" class="form-control" name="username" maxlength="15">
                    </div>
                    <div class="col-md-10">
                        <label for="password" class="form-label">Password</label>
                        <input type="password" class="form-control" id="password" name="password" maxlength="20">

                    </div>

                    <div class="col-12">
                        <button class="btn btn-primary" type="submit">Sign in</button>
                    </div>
                </form>
            </div>
        </div>
    </div>
</div>


<div class="modal modal-lg bg-secondary py-5 fade" tabindex="-1" role="dialog" id="modalSignUp"
     aria-labelledby="ModalLabel" aria-hidden="true">
    <div class="modal-dialog modal-dialog-scrollable" role="document">
        <%
            if (("duplicateUser").equals(errorType)) {
        %>
        <div class="alert alert-danger" role="alert">
            <%=errorMessage%>
        </div>
        <%
            }
        %>
        <div class="modal-content rounded-4 shadow">
            <div class="modal-header p-5 pb-4 border-bottom-0">
                <!-- <h1 class="modal-title fs-5" >Modal title</h1> -->
                <h1 class="text-primary fw-bold mb-0 fs-2">Sign Up</h1>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>

            <div class="modal-body p-5 pt-0">
                <form class="row g-3 needs-validation" method="post" action="signup" id="mainForm"
                      novalidate>

                    <h4 class="mb-1">Account Information</h4>
                    <hr class="my-1">

                    <div class="col-md-4">
                        <label for="firstName" class="form-label">* First Name</label>
                        <input type="text" class="form-control" name="firstName" id="firstName" pattern="[a-zA-Z]{1,15}"
                               maxlength="15"
                               required>
                        <div class="invalid-feedback">
                            Please input a valid first name!
                            (Can only contain lower and uppercase letters)
                        </div>
                    </div>
                    <div class="col-md-4">
                        <label for="middleName" class="form-label">Middle Name</label>
                        <input type="text" class="form-control" name="middleName" id="middleName" placeholder="Optional"
                               pattern="[a-zA-Z]{1,15}" maxlength="15">
                        <div class="invalid-feedback">
                            Can only contain lower and uppercase letters
                        </div>
                    </div>
                    <div class="col-md-4">
                        <label for="lastName" class="form-label">* Last Name</label>
                        <input type="text" class="form-control" name="lastName" id="lastName" pattern="[a-zA-Z]{1,15}"
                               maxlength="15"
                               required>
                        <div class="invalid-feedback">
                            Please input a valid last name!
                            (Can only contain lower and uppercase letters)
                        </div>
                    </div>
                    <div class="col-md-4">
                        <label for="gender" class="form-label">* Gender</label>
                        <select class="form-select" name="gender" id="gender" required>
                            <option selected disabled value="">Choose...</option>
                            <option>Female</option>
                            <option>Male</option>
                            <option>Others</option>
                        </select>
                        <div class="invalid-feedback">
                            Please select a valid gender.
                        </div>
                    </div>
                    <div class="col-md-10">
                        <label for="username" class="form-label">* Username</label>
                        <input type="text" class="form-control" name="username" id="username" maxlength="15"
                               pattern="^(?=.*[A-Za-z0-9@#$%^&+=])[A-Za-z0-9@#$%^&+=]{1,}$"
                               required>
                        <div class="invalid-feedback">
                            Please input a valid username!
                        </div>
                    </div>
                    <div class="col-md-10">
                        <label for="password1" class="form-label">* Password</label>
                        <input type="password" class="form-control" name="password" id="password1" maxlength="20"
                               pattern="^(?=.*[A-Za-z0-9@#$%^&+=])[A-Za-z0-9@#$%^&+=]{6,}$" required>
                        <div class="invalid-feedback">
                            Should contain only Alphabets , Numbers , Special characters
                            [!@#$%^&*] , minimum 6 characters
                        </div>
                    </div>
                    <div class="col-md-10">
                        <label for="password2" class="form-label">* Password</label>
                        <input type="password" class="form-control" id="password2" maxlength="20"
                               pattern="^(?=.*[A-Za-z0-9@#$%^&+=])[A-Za-z0-9@#$%^&+=]{6,}$" required>
                        <div class="invalid-feedback" id="doubleCheck">
                            Mismatch password!
                        </div>
                    </div>
                    <h4 class="mb-1">Contact</h4>
                    <hr class="my-1">

                    <div class="col-md-12">
                        <label for="mobileNumber" class="form-label">* Mobile Number</label>
                        <input type="text" class="form-control" name="mobileNumber" id="mobileNumber" pattern="\d{10}"
                               maxlength="10"
                               required>
                        <div class="invalid-feedback">
                            Please input mobile number!
                            (10-digits numbers)
                        </div>
                    </div>
                    <div class="col-md-12">
                        <label for="workNumber" class="form-label">* Work Number</label>
                        <input type="text" class="form-control" name="workNumber" id="workNumber" pattern="\d{10}"
                               maxlength="10"
                               required>
                        <div class="invalid-feedback">
                            Please input work number!
                            (10-digits numbers)
                        </div>
                    </div>
                    <div class="col-md-12">
                        <label for="email" class="form-label">* Email</label>
                        <input type="text" class="form-control" name="email" id="email"
                               pattern="[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$"
                               maxlength="30"
                               required>
                        <div class="invalid-feedback">
                            Please input a valid email!
                            (A valid email should be XXX@XXX.XXX format)
                        </div>
                    </div>
                    <label for="contactPreference">* Contact Preference </label>
                    <div class="col-md-12" id="contactPreference">
                        <div class="form-check form-check-inline">
                            <input class="form-check-input" type="radio" value="SMS" name="contactPreference"
                                   id="smsPreference"
                                   checked>
                            <label class="form-check-label" for="smsPreference">
                                SMS
                            </label>
                        </div>
                        <div class="form-check form-check-inline">
                            <input class="form-check-input" type="radio" value="Email" name="contactPreference"
                                   id="emailPreference">
                            <label class="form-check-label" for="emailPreference">
                                Email
                            </label>
                        </div>
                    </div>


                    <div class="col-12">
                        <div class="form-check">
                            <input class="form-check-input" type="checkbox" value="" id="invalidCheck" required>
                            <label class="form-check-label" for="invalidCheck">
                                Agree to terms and conditions
                            </label>
                            <div class="invalid-feedback">
                                You must agree before submitting.
                            </div>
                        </div>
                    </div>

                    <div class="col-12">
                        <button class="btn btn-primary" type="submit">Submit form</button>
                    </div>
                </form>
            </div>
        </div>
    </div>
</div>


<script>

    <% if("loginError".equals(errorType)){ %>
    document.getElementById("loginButton").click();
    <%} else if("duplicateUser".equals(errorType)) {%>
    document.getElementById("signUpButton").click();
    <%}else if(("notLogin").equals(errorType)){%>
    document.getElementById("loginButton").click();
    <%}%>

    function getButton(button) {
        let icon = button.parentNode;
        let like_id = button.getAttribute("data-like-id")
        icon.onclick = function () {
            var url = $(icon).hasClass('active') ? 'like?action=unlike&userName=<%=session.getAttribute("LogInUsername")%>&like_id='+like_id : 'like?action=like&userName=<%=session.getAttribute("LogInUsername")%>&like_id='+like_id;
            $.post(url, function() {
                // Request has been sent to the server
            });
            <% if(session.getAttribute("LogInUsername") == null){%>
            document.getElementById("loginButton").click();
            return;
            <%}%>
            icon.classList.toggle('active');
        }
    }

    $(function () {

        //Scroll event
        $(window).scroll(function () {
            var scrolled = $(window).scrollTop();
            if (scrolled > 200) $('.go-top').fadeIn('slow');
            if (scrolled < 200) $('.go-top').fadeOut('slow');
        });

        //Click event
        $('.go-top').click(function () {
            $("html, body").animate({scrollTop: "0"}, 500);
        });

    });

</script>

<script>

    const form = document.getElementById('mainForm');
    const pwd1 = document.getElementById("password1");
    const pwd2 = document.getElementById("password2");

    form.addEventListener('submit', event => {
        if (!form.checkValidity()) {
            event.preventDefault();
            event.stopPropagation();
        } else if ((pwd1.value !== pwd2.value)) {
            event.preventDefault();
            event.stopPropagation();
            pwd2.setCustomValidity("Invalid field.");
            document.getElementById("doubleCheck").innerHTML = "Mismatch password!";
        } else {
            console.log("submit successfully!");
        }
        form.classList.add('was-validated');
    }, false)

    function validatePassword() {
        if (pwd1.value !== pwd2.value) {
            pwd2.setCustomValidity("Passwords Don't Match");
        } else {
            pwd2.setCustomValidity('');
        }
    }

    pwd1.onchange = validatePassword;
    pwd2.onkeyup = validatePassword;

    document.getElementById('loginForm').addEventListener('submit', event => {
        document.getElementById('password').value = md5(document.getElementById('password').value);
    })

</script>

</body>

</html>