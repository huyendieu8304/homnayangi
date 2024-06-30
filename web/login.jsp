<%-- 
    Document   : login
    Created on : Jun 27, 2024, 10:19:58 PM
    Author     : BKC
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Đăng nhập</title>
        <meta name="viewport" content="width=device-width, initial-scale=1">

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

                    <c:set var="cookie" value="${pageContext.request.cookies}"></c:set>
                        <form action="login" method="post" class="login100-form">
                            <span class="login100-form-title">
                                Đăng nhập
                            </span>

                            <div class="wrap-input100">
                                <input class="input100" type="text" 
                                       name="username" 
                                       value="${cookie.cuser.value}"
                                placeholder="Tên người dùng">
                            <span class="focus-input100"></span>
                            <span class="symbol-input100">
                                <!-- <i class="fa fa-envelope" aria-hidden="true"></i> -->
                                <i class="fa-solid fa-user"></i>
                            </span>
                        </div>
                        <div class="error-message"></div>

                        <div class="wrap-input100">
                            <input class="input100" type="password" 
                                   name="password" 
                                   value="${cookie.cpass.value}"
                                   placeholder="Mật khẩu">
                            <span class="focus-input100"></span>
                            <span class="symbol-input100">
                                <i class="fa fa-lock" aria-hidden="true"></i>
                            </span>
                        </div>
                        <div class="error-message"></div>

                        <div style="margin-left: 30px;">
                            <input type="checkbox" name="remember" 
                                   ${(cookie.crem != null ? 'checked': '')}> 
                            <span class="text"> Ghi nhớ tài khoản</span>
                        </div>

                        <!-- error get from servlet -->
                        <div class="error-message">${requestScope.error}</div>

                        <div class="container-login100-form-btn">
                            <button class="login100-form-btn">
                                Đăng nhập
                            </button>
                        </div>
                        <!-- forgot username, password -->
                        <div class="text-center p-t-12">
                            <span class="txt1">
                                Quên
                            </span>
                            <a class="txt2" href="#">
                                tên người dùng / mật khẩu?
                            </a>
                        </div>
                        <!-- forgot username, password -->

                        <div class="text-center p-t-136">
                            <a class="txt2" href="register">
                                Đăng ký tài khoản

                            </a>
                        </div>

                    </form>
                </div>
            </div>
        </div>

        <!--===============================================================================================-->
        <script src="js/main.js"></script>

        <script>
            document.addEventListener('DOMContentLoaded', function () {
                document.querySelector('.login100-form').addEventListener('submit', function (event) {
                    event.preventDefault(); // Prevent default form submission

                    // Clear previous error messages
                    document.querySelectorAll('.error-message').forEach(function (el) {
                        el.textContent = '';
                    });

                    // Retrieve input values
                    var username = document.querySelector('input[name="username"]').value.trim();
                    var password = document.querySelector('input[name="password"]').value.trim(); // Corrected name attribute
                    var remember = document.querySelector('input[name="remember"]').checked;

                    // Initialize validation flag
                    var isValid = true;

                    // Find error message containers
                    var usernameErrorDiv = document.querySelector('input[name="username"]').closest('.wrap-input100').nextElementSibling;
                    var passwordErrorDiv = document.querySelector('input[name="password"]').closest('.wrap-input100').nextElementSibling; // Corrected name attribute

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

                    // If valid, submit the form
                    if (isValid) {
                        event.target.submit();
                    }
                });
            });

        </script>
    </body>
</html>
