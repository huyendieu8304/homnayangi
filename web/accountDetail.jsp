<%-- 
    Document   : shop
    Created on : Jun 25, 2024, 12:23:27 PM
    Author     : BKC
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Tài khoản</title>

        <meta content="width=device-width, initial-scale=1.0" name="viewport">
        <meta content="" name="keywords">
        <meta content="" name="description">

        <!-- Google Web Fonts -->
        <link rel="preconnect" href="https://fonts.googleapis.com">
        <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
        <link href="https://fonts.googleapis.com/css2?family=Open+Sans:wght@400;600&family=Raleway:wght@600;800&display=swap" rel="stylesheet"> 

        <!-- Icon Font Stylesheet -->
        <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.15.4/css/all.css"/>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.4.1/font/bootstrap-icons.css" rel="stylesheet">

        <!-- Libraries Stylesheet -->
        <link href="lib/lightbox/css/lightbox.min.css" rel="stylesheet">
        <link href="lib/owlcarousel/assets/owl.carousel.min.css" rel="stylesheet">


        <!-- Customized Bootstrap Stylesheet -->
        <link href="css/bootstrap.min.css" rel="stylesheet">

        <!-- Template Stylesheet -->
        <link href="css/style.css" rel="stylesheet">

        <style>
            .error {
                color: red;
            }
        </style>

    </head>
    <body>
        <%@include file="header.jsp" %>

        <!-- Single Page Header start -->
        <div class="container-fluid page-header py-5">
            <h1 class="text-center text-white display-6">Cửa hàng</h1>
            <ol class="breadcrumb justify-content-center mb-0">
                <li class="breadcrumb-item"><a href="home">Trang chủ</a></li>
                <li class="breadcrumb-item active text-white">Cửa hàng</li>
            </ol>
        </div>
        <!-- Single Page Header End -->

        <!-- Fruits Shop Start-->
        <div class="container-fluid fruite py-5">
            <div class="container py-5">
                <!--<h1 class="mb-4">Thông tin tài khoản</h1>-->
                <div class="row g-4">
                    <!-- main part -->
                    <!-- side bar start -->
                    <div class="col-lg-3">
                        <div class="col-lg-12"> <!-- categories -->
                            <div class="mb-3">
                                <h4>Thông tin người dùng</h4>
                                <hr>
                                <h4>Thông tin đơn hàng</h4>

                            </div>
                        </div>
                    </div>
                    <!-- side bar end -->

                    <!-- main part start -->
                    <div class="col-lg-9">
                        <c:set var="account" value="${requestScope.account}"></c:set>
                            <form id="userAccountForm" action="UserAccount" method="post"  onsubmit="return validateForm()">
                                <table class="table">
                                    <tr>
                                        <th scope="col">Tên người dùng</th>
                                        <td>
                                            <input type="text" name="username" id="username" value="${account.username}" style="border: none">
                                        <div id="usernameError" class="error"></div>
                                    </td>
                                </tr>
                                <tr>
                                    <th scope="col">Đổi mật khẩu</th>
                                    <td>
                                        <input type="password" name="oldpass" id="oldpass" placeholder="mật khẩu hiện tại" style="border-radius: 5px; margin-bottom: 10px"> <br>
                                        <input type="password" name="newpass" id="newpass" placeholder="mật khẩu mới" style="border-radius: 5px; margin-bottom: 10px"> <br>
                                        <input type="password" name="confirmnewpass" id="confirmnewpass" placeholder=" xác nhận mật khẩu mới" style="border-radius: 5px; margin-bottom: 10px"><br>
                                        <div id="passwordError" class="error"></div>
                                    </td>
                                </tr>
                                <tr>
                                    <th scope="col">Họ và tên</th>
                                    <td>
                                        <input type="text" name="fullname" id="fullname" value="${account.fullname}" style="border: none">
                                        <div id="fullnameError" class="error"></div>
                                    </td>
                                </tr>
                                <tr>
                                    <th scope="col">Địa chỉ email</th>
                                    <td>
                                        <input type="text" name="email" id="email" value="${account.email}" style="border: none">
                                        <div id="emailError" class="error"></div>
                                    </td>
                                </tr>
                                <tr>
                                    <th scope="col">Số điện thoại</th>
                                    <td>
                                        <input type="text" name="phonenumber" id="phonenumber" value="${account.phoneNumber}" style="border: none">
                                        <div id="phoneNumberError" class="error"></div>
                                    </td>
                                </tr>
                            </table>
                            <div id="resultFromServlet" class="error"></div>
                            <button class="btn border border-secondary rounded-pill px-3 py-1 mb-4 text-primary" type="submit" >Cập nhật tài khoản</button>
                        </form>
                        <div class="row g-4 justify-content-center">

                        </div>

                    </div>
                </div>
                <!-- main part end -->
                <!-- main part end -->
            </div>
        </div>
    </div>
</div>
<!-- Fruits Shop End-->

<%@include file="footer.jsp" %>

<!-- JavaScript Libraries -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0/dist/js/bootstrap.bundle.min.js"></script>
<script src="lib/easing/easing.min.js"></script>
<script src="lib/waypoints/waypoints.min.js"></script>
<script src="lib/lightbox/js/lightbox.min.js"></script>
<script src="lib/owlcarousel/owl.carousel.min.js"></script>

<!-- Template Javascript -->
<script src="js/main.js"></script>

<script>
                            function validateForm() {
                                let isValid = true;

                                const username = document.getElementById('username').value;
                                const oldpass = document.getElementById('oldpass').value;
                                const newpass = document.getElementById('newpass').value;
                                const confirmnewpass = document.getElementById('confirmnewpass').value;
                                const fullname = document.getElementById('fullname').value;
                                const email = document.getElementById('email').value;
                                const phoneNumber = document.getElementById('phonenumber').value;

                                const usernameErrorDiv = document.getElementById('usernameError');
                                const passwordErrorDiv = document.getElementById('passwordError');
                                const fullnameErrorDiv = document.getElementById('fullnameError');
                                const emailErrorDiv = document.getElementById('emailError');
                                const phoneNumberErrorDiv = document.getElementById('phoneNumberError');

                                // Clear previous errors
                                usernameErrorDiv.textContent = '';
                                passwordErrorDiv.textContent = '';
                                fullnameErrorDiv.textContent = '';
                                emailErrorDiv.textContent = '';
                                phoneNumberErrorDiv.textContent = '';

                                // Validate username
                                if (username === '') {
                                    isValid = false;
                                    usernameErrorDiv.textContent = 'Tên người dùng không được bỏ trống.';
                                } else if (!/^[a-zA-Z]/.test(username)) {
                                    isValid = false;
                                    usernameErrorDiv.textContent = 'Tên người dùng phải bắt đầu bằng chữ cái.';
                                } else if (/\s/.test(username)) {
                                    isValid = false;
                                    usernameErrorDiv.textContent = 'Tên người dùng không được chứa khoảng trắng.';
                                }

                                // Validate passwords
                                if (oldpass !== '' || newpass !== '' || confirmnewpass !== '') {
                                    if (newpass === '' || confirmnewpass === '') {
                                        isValid = false;
                                        passwordErrorDiv.textContent = 'Mật khẩu mới và xác nhận mật khẩu mới không được bỏ trống.';
                                    } else if (newpass.length < 6 || confirmnewpass.length < 6) {
                                        isValid = false;
                                        passwordErrorDiv.textContent = 'Mật khẩu mới phải có ít nhất 6 ký tự.';
                                    } else if (!/[a-zA-Z]/.test(newpass) || !/[a-zA-Z]/.test(confirmnewpass)) {
                                        isValid = false;
                                        passwordErrorDiv.textContent = 'Mật khẩu mới phải chứa ít nhất một chữ cái.';
                                    } else if (newpass !== confirmnewpass) {
                                        isValid = false;
                                        passwordErrorDiv.textContent = 'Mật khẩu mới và xác nhận mật khẩu mới không khớp.';
                                    }
                                }

                                // Normalize and validate fullname
                                const normalizedFullname = normalizeFullname(fullname);
                                document.getElementById('fullname').value = normalizedFullname;
                                if (!/^[\p{L}\s]+$/u.test(normalizedFullname)) {
                                    isValid = false;
                                    fullnameErrorDiv.textContent = 'Họ và tên chỉ được chứa chữ cái và khoảng trắng.';
                                }

                                // Validate email
                                if (!/^[^\s@]+@[^\s@]+\.[^\s@]+$/.test(email)) {
                                    isValid = false;
                                    emailErrorDiv.textContent = 'Địa chỉ email không hợp lệ.';
                                }

                                // Validate phone number
                                if (!/^0\d{9}$/.test(phoneNumber)) {
                                    isValid = false;
                                    phoneNumberErrorDiv.textContent = 'Số điện thoại phải có 10 chữ số và bắt đầu bằng số 0.';
                                }

                                if (isValid) {
                                    const xhttp = new XMLHttpRequest();
                                    xhttp.onload = function () {
                                        if (this.status === 200) {
                                            const responseParts = this.responseText.split('|');
                                            if (responseParts[0] === 'success') {
                                                document.getElementById("resultFromServlet").textContent = responseParts[1]; // Hiển thị thông báo lỗi nếu cần
                                            } else if (responseParts[0] === 'error') {
                                                document.getElementById("resultFromServlet").textContent = responseParts[1]; // Hiển thị thông báo lỗi nếu cần
                                            }
                                        } else {
                                            console.error("Request failed with status:", this.status);
                                            document.getElementById("resultFromServlet").textContent = "Request failed.";
                                        }
                                    };

                                    xhttp.open("POST", "UserAccount", true);
                                    xhttp.setRequestHeader("Content-Type", "application/x-www-form-urlencoded");

                                    var formData = new FormData(document.getElementById("userAccountForm"));
                                    var params = new URLSearchParams(formData).toString();
                                    console.log(params);
                                    xhttp.send(params);
                                    
                                    return false;
                                }
                                return isValid;
                            }

                            function normalizeFullname(fullname) {
                                // Remove leading/trailing whitespace, replace multiple spaces with a single space
                                // and capitalize the first letter of each word.
                                return fullname.trim()
                                        .replace(/\s+/g, ' ')
                                        .split(' ')
                                        .map(word => word.charAt(0).toUpperCase() + word.slice(1).toLowerCase())
                                        .join(' ');
                            }
</script>
</body>
</html>
