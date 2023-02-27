<%@ page import="neu.edu.entity.AccountData" %>
<!DOCTYPE html>
<html lang="en">
<%
    AccountData ad = (AccountData) request.getAttribute("profile");
    String username = (String) session.getAttribute("loginUsername");

%>
<head>
    <meta charset="UTF-8">
    <title><%=username%></title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css">
    <script src="https://cdn.bootcss.com/blueimp-md5/2.12.0/js/md5.min.js"></script>
    <link href="../css/stylesheet.css" rel="stylesheet">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js"></script>

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
                <li><a href="post" class="nav-link px-2 text-white fs-4">Home</a></li>
            </ul>
            <div class="d-flex justify-content-center align-items-center">
                <a href="profile" class="btn-link me-2 fs-5">
                    <%
                        out.append(username);
                    %>
                </a>
                <a href="logout" class="nav-link me-2 text-white fs-5">Logout</a>
            </div>

        </div>
    </div>
</header>

<div class="container">

    <div class="py-5 text-center">
        <h2>Account Info</h2>
    </div>

    <div class="row justify-content-md-center">
        <div class="col-8 card">
            <div class="row ">
                <h4 class="mb-1">Account Information</h4>
                <hr class="my-1">

                <div class="col-4">
                    <label for="firstName" class="form-label">First Name</label>
                    <input type="text" class="form-control" id="firstName" value="<%=ad.getFirstName()%>" disabled>
                </div>
                <div class="col-4">
                    <label for="middleName" class="form-label">Middle Name</label>
                    <input type="text" class="form-control" id="middleName" value="<%=ad.getMiddleName()%>" disabled>
                </div>
                <div class="col-md-4">
                    <label for="lastName" class="form-label">Last Name</label>
                    <input type="text" class="form-control" id="lastName" value="<%=ad.getLastName()%>" disabled>
                </div>
                <div class="col-md-4">
                    <label for="gender" class="form-label">Gender</label>
                    <input type="text" class="form-control" id="gender" value="<%=ad.getGender()%>" disabled>
                </div>
                <div class="col-md-8">
                    <label for="username" class="form-label">Username</label>
                    <input type="text" class="form-control" id="username" value="<%=ad.getUsername()%>" disabled>
                </div>

                <hr class="my-1">

                <div class="col-md-12 mb-3">
                    <label for="mobileNumber" class="form-label">Mobile Number</label>
                    <input type="text" class="form-control" id="mobileNumber" value="<%=ad.getMobileNumber()%>" disabled>
                </div>
                <div class="col-md-12 mb-3">
                    <label for="email" class="form-label">Email</label>
                    <input type="text" class="form-control" id="email" value="<%=ad.getEmail()%>" disabled>
                </div>
            </div>
        </div>
        <div class="col-8 text-end pt-3">
            <button type="button" class="btn btn-primary me-2" data-bs-toggle="modal"
                    data-bs-target="#modalUpdateProfile" id="updateProfileButton">Update Profile
            </button>
            <button type="button" class="btn btn-primary" data-bs-toggle="modal"
                    data-bs-target="#modalResetPassword" id="resetPasswordButton">
                Reset Password
            </button>
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

<div class="modal modal-lg bg-secondary py-5 fade" tabindex="-1" role="dialog" id="modalUpdateProfile"
     aria-labelledby="ModalLabel" aria-hidden="true">
    <div class="modal-dialog modal-dialog-scrollable" role="document">
        <div class="modal-content rounded-4 shadow">
            <div class="modal-header p-5 pb-4 border-bottom-0">
                <!-- <h1 class="modal-title fs-5" >Modal title</h1> -->
                <h1 class="text-primary fw-bold mb-0 fs-2">Update Profile</h1>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>

            <div class="modal-body p-5 pt-0">
                <form class="row g-3 needs-validation" method="post" action="updateAccountData?case=updateProfile&username=<%=username%>" id="updateInfoForm"
                      novalidate>
                    <h4 class="mb-1">Account Information</h4>
                    <hr class="my-1">

                    <div class="col-md-4">
                        <label for="firstNameUpdate" class="form-label">* First Name</label>
                        <input type="text" class="form-control" name="firstName" id="firstNameUpdate" value="<%=ad.getFirstName()%>" pattern="[a-zA-Z]{1,15}"
                               maxlength="15"
                               required>
                        <div class="invalid-feedback">
                            Please input a valid first name!
                            (Can only contain lower and uppercase letters)
                        </div>
                    </div>
                    <div class="col-md-4">
                        <label for="middleNameUpdate" class="form-label">Middle Name</label>
                        <input type="text" class="form-control" name="middleName" id="middleNameUpdate" value="<%=ad.getMiddleName()%>" placeholder="Optional"
                               pattern="[a-zA-Z]{1,15}" maxlength="15">
                        <div class="invalid-feedback">
                            Can only contain lower and uppercase letters
                        </div>
                    </div>
                    <div class="col-md-4">
                        <label for="lastNameUpdate" class="form-label">* Last Name</label>
                        <input type="text" class="form-control" name="lastName" id="lastNameUpdate" value="<%=ad.getLastName()%>" pattern="[a-zA-Z]{1,15}"
                               maxlength="15"
                               required>
                        <div class="invalid-feedback">
                            Please input a valid last name!
                            (Can only contain lower and uppercase letters)
                        </div>
                    </div>
                    <div class="col-md-4">
                        <label for="genderUpdate" class="form-label">* Gender</label>
                        <select class="form-select" name="gender" id="genderUpdate" required>
                            <option selected disabled value="">Choose...</option>
                            <option>Female</option>
                            <option>Male</option>
                            <option>Others</option>
                        </select>
                        <div class="invalid-feedback">
                            Please select a valid gender.
                        </div>
                    </div>
                    <h4 class="mb-1">Contact</h4>
                    <hr class="my-1">

                    <div class="col-md-12">
                        <label for="mobileNumberUpdate" class="form-label">* Mobile Number</label>
                        <input type="text" class="form-control" name="mobileNumber" value="<%=ad.getMobileNumber()%>" id="mobileNumberUpdate" pattern="\d{10}"
                               maxlength="10"
                               required>
                        <div class="invalid-feedback">
                            Please input mobile number!
                            (10-digits numbers)
                        </div>
                    </div>
                    <div class="col-md-12">
                        <label for="emailUpdate" class="form-label">* Email</label>
                        <input type="text" class="form-control" name="email" id="emailUpdate"
                               value="<%=ad.getEmail()%>"
                               pattern="[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$"
                               maxlength="30"
                               required>
                        <div class="invalid-feedback">
                            Please input a valid email!
                            (A valid email should be XXX@XXX.XXX format)
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
                        <button class="btn btn-primary" type="submit">Submit</button>
                    </div>
                </form>
            </div>
        </div>
    </div>
</div>

<div class="modal modal-lg bg-secondary py-5 fade" tabindex="-1" role="dialog" id="modalResetPassword"
     aria-labelledby="ModalLabel" aria-hidden="true">
    <div class="modal-dialog modal-dialog-scrollable" role="document">
        <div class="modal-content rounded-4 shadow">
            <div class="modal-header p-5 pb-4 border-bottom-0">
                <!-- <h1 class="modal-title fs-5" >Modal title</h1> -->
                <h1 class="text-primary fw-bold mb-0 fs-2">Update Profile</h1>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>

            <div class="modal-body p-5 pt-0">
                <form class="row g-3 needs-validation" method="post" action="updateAccountData?case=resetPassword&username=<%=username%>" id="resetPasswordForm"
                      novalidate>
                    <h4 class="mb-1">Reset Password</h4>
                    <hr class="my-1">
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
                    <div class="col-12">
                        <button class="btn btn-primary" type="submit">Submit</button>
                    </div>
                </form>
            </div>
        </div>
    </div>
</div>


<script>
    function selectGender(){
        let genderSelector = document.getElementById("genderUpdate");
        genderSelector.querySelector('option[text="<%=ad.getGender()%>"]').selected = true;
    }
</script>
<script>

    const form1 = document.getElementById("updateInfoForm");
    const form2 = document.getElementById("resetPasswordForm")
    const pwd1 = document.getElementById("password1");
    const pwd2 = document.getElementById("password2");

    form1.addEventListener('submit', event => {
        if (!form1.checkValidity()) {
            event.preventDefault();
            event.stopPropagation();
        } else {
            console.log("submit successfully!");
        }
        form1.classList.add('was-validated');
    }, false)

    form2.addEventListener('submit', event => {
        if (!form2.checkValidity()) {
            event.preventDefault();
            event.stopPropagation();
        } else if ((pwd1.value !== pwd2.value)) {
            event.preventDefault();
            event.stopPropagation();
            pwd2.setCustomValidity("Invalid field.");
            document.getElementById("doubleCheck").innerHTML = "Mismatch password!";
        } else {
            pwd1.value = md5(pwd1.value);
            console.log("submit successfully!");
        }
        form2.classList.add('was-validated');
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

</script>
</body>
</html>