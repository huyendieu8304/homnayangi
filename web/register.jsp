<%-- 
    Document   : register
    Created on : Jun 27, 2024, 11:15:08 PM
    Author     : BKC
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Đăng kí</title>

        <meta name="viewport" content="width=device-width, initial-scale=1">
        <!-- Include jQuery -->
        <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css">

        <link rel="stylesheet" type="text/css" href="css/util.css">
        <link rel="stylesheet" type="text/css" href="css/main.css">
        <!--===============================================================================================-->
        <style>
            .error-message {
                text-align: center;
                font-family: Poppins-Regular;
                font-size: 13px;
                line-height: 1.5;
                color: red;
                font-size: 0.875em;
                margin-top: 5px;
            }
        </style>
    </head>
    <body>
        <div class="limiter">
            <div class="container-login100">
                <div class="wrap-login100">
                    <div class="login100-pic js-tilt" data-tilt>
                        <!-- <img src="images/img-01.png" alt="IMG"> -->
                        <img src="img/logo.svg" alt="">
                    </div>

                    <form class="login100-form" id="registerForm">
                        <span class="login100-form-title">
                            Đăng kí tài khoản
                        </span>
                        <div class="error-message" id="errorFromServlet"></div>
                        <div class="wrap-input100 ">
                            <input class="input100" type="text" name="username" placeholder="Tên người dùng">
                            <span class="focus-input100"></span>
                            <span class="symbol-input100">
                                <!-- <i class="fa fa-envelope" aria-hidden="true"></i> -->
                                <i class="fa-solid fa-user"></i>
                            </span>
                        </div>
                        <div class="error-message"></div>

                        <div class="wrap-input100 ">
                            <input class="input100" type="password" name="password" placeholder="Mật khẩu">
                            <span class="focus-input100"></span>
                            <span class="symbol-input100">
                                <i class="fa fa-lock" aria-hidden="true"></i>
                            </span>
                        </div>
                        <div class="error-message"></div>

                        <div class="wrap-input100 ">
                            <input class="input100" type="text" name="fullname" placeholder="Họ và tên">
                            <span class="focus-input100"></span>
                            <span class="symbol-input100">
                                <i class="fa-solid fa-user"></i>
                            </span>
                        </div>
                        <div class="error-message"></div>

                        <div class="wrap-input100 ">
                            <input class="input100" type="text" name="email" placeholder="Địa chỉ Email">
                            <span class="focus-input100"></span>
                            <span class="symbol-input100">
                                <i class="fa fa-envelope" aria-hidden="true"></i>
                            </span>
                        </div>
                        <div class="error-message"></div>

                        <div class="wrap-input100 ">
                            <input class="input100" type="text" name="phonenumber" placeholder="Số điện thoại">
                            <span class="focus-input100"></span>
                            <span class="symbol-input100">
                                <i class="fa-solid fa-phone"></i>
                            </span>
                        </div>
                        <div class="error-message"></div>

                        <div class="container-login100-form-btn">
                            <button class="login100-form-btn" type="submit">Đăng kí</button>
                        </div>

                        <div class="text-center p-t-136">
                            <a class="txt2" href="login">
                                Tôi đã có tài khoản
                            </a>
                        </div>
                    </form>
                </div>
            </div>
        </div>

        <!--===============================================================================================-->
        <script src="js/main.js"></script>

        <script>
            function capitalizeWords(str) {
                return str.replace(/\b\w/g, function (match) {
                    return match.toUpperCase();
                });
            }

            document.addEventListener('DOMContentLoaded', function () {
                document.querySelector('.login100-form').addEventListener('submit', function (event) {
                    event.preventDefault(); // Prevent default form submission

                    // Clear previous error messages
                    document.querySelectorAll('.error-message').forEach(function (el) {
                        el.textContent = '';
                    });

                    // Retrieve input values
                    var username = document.querySelector('input[name="username"]').value.trim();
                    var password = document.querySelector('input[name="password"]').value.trim();
                    var fullnameInput = document.querySelector('input[name="fullname"]');
                    var fullname = fullnameInput.value.trim(); // Get current value
                    var email = document.querySelector('input[name="email"]').value.trim();
                    var phonenumber = document.querySelector('input[name="phonenumber"]').value.trim();

                    // Initialize validation flag
                    var isValid = true;

                    // Find error message containers
                    var usernameErrorDiv = document.querySelector('input[name="username"]').closest('.wrap-input100').nextElementSibling;
                    var passwordErrorDiv = document.querySelector('input[name="password"]').closest('.wrap-input100').nextElementSibling;
                    var fullnameErrorDiv = document.querySelector('input[name="fullname"]').closest('.wrap-input100').nextElementSibling;
                    var emailErrorDiv = document.querySelector('input[name="email"]').closest('.wrap-input100').nextElementSibling;
                    var phonenumberErrorDiv = document.querySelector('input[name="phonenumber"]').closest('.wrap-input100').nextElementSibling;

                    // Validate username
                    if (username === '') {
                        isValid = false;
                        usernameErrorDiv.textContent = 'Tên người dùng không được bỏ trống.';
                    } else if (!/^[a-zA-Z]/.test(username)) {
                        isValid = false;
                        usernameErrorDiv.textContent = 'Tên người dùng phải bắt đầu bằng chữ cái.';
                    }

                    // Validate password
                    if (password === '') {
                        isValid = false;
                        passwordErrorDiv.textContent = 'Mật khẩu không được bỏ trống.';
                    } else if (password.length < 6) {
                        isValid = false;
                        passwordErrorDiv.textContent = 'Mật khẩu phải có ít nhất 6 ký tự.';
                    } else if (!/[a-zA-Z]/.test(password)) {
                        isValid = false;
                        passwordErrorDiv.textContent = 'Mật khẩu phải chứa ít nhất một chữ cái.';
                    }

                    // Validate fullname (allowing Unicode characters)
                    if (fullname === '') {
                        isValid = false;
                        fullnameErrorDiv.textContent = 'Họ và tên không được bỏ trống.';
                    } else if (!/^[\p{L}\s]+$/u.test(fullname)) {
                        isValid = false;
                        fullnameErrorDiv.textContent = 'Họ và tên chỉ được chứa chữ cái và khoảng trắng.';
                    } else {
                        // Capitalize each word in fullname
                        var normalizedFullname = capitalizeWords(fullname);
                        fullnameInput.value = normalizedFullname;
                    }
                    // Validate fullname
//                    if (fullname === '') {
//                        isValid = false;
//                        fullnameErrorDiv.textContent = 'Họ và tên không được bỏ trống.';
//                    } else if (!/^[a-zA-Z\s]+$/.test(fullname)) {
//                        isValid = false;
//                        fullnameErrorDiv.textContent = 'Họ và tên chỉ được chứa chữ cái và khoảng trắng.';
//                    } else if (!/[a-zA-Z]/.test(fullname)) {
//                        isValid = false;
//                        fullnameErrorDiv.textContent = 'Họ và tên phải chứa ít nhất một chữ cái.';
//                    } else {
//                        // Capitalize each word in fullname
//                        var normalizedFullname = capitalizeWords(fullname);
//                        fullnameInput.value = normalizedFullname;
//                    }

                    // Validate email
                    if (email === '') {
                        isValid = false;
                        emailErrorDiv.textContent = 'Địa chỉ email không được bỏ trống.';
                    } else if (!/^[^\s@]+@[^\s@]+\.[^\s@]+$/.test(email)) {
                        isValid = false;
                        emailErrorDiv.textContent = 'Địa chỉ email không hợp lệ.';
                    }

                    // Validate phonenumber
                    if (phonenumber === '') {
                        isValid = false;
                        phonenumberErrorDiv.textContent = 'Số điện thoại không được bỏ trống.';
                    } else if (!/^0\d{9}$/.test(phonenumber)) {
                        isValid = false;
                        phonenumberErrorDiv.textContent = 'Số điện thoại phải bắt đầu bằng số 0 và gồm 10 chữ số.';
                    }

                    // If valid, proceed with AJAX
                    if (isValid) {
                        const xhttp = new XMLHttpRequest();
                        xhttp.onload = function () {
                            if (this.status === 200) {
                                const responseParts = this.responseText.split('|');
                                if (responseParts[0] === 'success') {
                                    alert(responseParts[1]); // Hiển thị thông báo thành công
                                    window.location.href = 'login'; // Chuyển hướng đến trang đăng nhập
                                } else if (responseParts[0] === 'error') {
                                    document.getElementById("errorFromServlet").textContent = responseParts[1]; // Hiển thị thông báo lỗi nếu cần
                                }
                            } else {
                                console.error("Request failed with status:", this.status);
                                document.getElementById("errorFromServlet").textContent = "Request failed.";
                            }
                        };

                        xhttp.open("POST", "register");
                        xhttp.setRequestHeader("Content-Type", "application/x-www-form-urlencoded");

                        var formData = new FormData(event.target);
                        var params = new URLSearchParams(formData).toString();
                        console.log(params);
                        xhttp.send(params);
                    }
                });
            });
        </script>
    </body>
</html>
