<%-- Document : header Created on : Jun 23, 2024, 1:54:45 PM Author : BKC --%>

<%@page contentType="text/html" pageEncoding="UTF-8" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>

    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <!--<title>JSP Page</title>-->
        <meta content="width=device-width, initial-scale=1.0" name="viewport">
        <meta content="" name="keywords">
        <meta content="" name="description">

        <!-- Google Web Fonts -->
        <link rel="preconnect" href="https://fonts.googleapis.com">
        <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
        <link
            href="https://fonts.googleapis.com/css2?family=Open+Sans:wght@400;600&family=Raleway:wght@600;800&display=swap"
            rel="stylesheet">

        <!-- Icon Font Stylesheet -->
        <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.15.4/css/all.css" />
        <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.4.1/font/bootstrap-icons.css" rel="stylesheet">

        <!-- Libraries Stylesheet -->
        <link href="lib/lightbox/css/lightbox.min.css" rel="stylesheet">
        <link href="lib/owlcarousel/assets/owl.carousel.min.css" rel="stylesheet">


        <!-- Customized Bootstrap Stylesheet -->
        <link href="css/bootstrap.min.css" rel="stylesheet">

        <!-- Template Stylesheet -->
        <link href="css/style.css" rel="stylesheet">

        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css">
    </head>

    <body>

        <!-- Spinner Start -->
        <div id="spinner" class="show w-100 vh-100 bg-white position-fixed translate-middle top-50 start-50  d-flex align-items-center justify-content-center">
            <div class="spinner-grow text-primary" role="status"></div>
        </div>
        <!-- Spinner End -->


        <!-- Navbar start -->
        <div class="container-fluid fixed-top">
            <div class="container topbar bg-primary d-none d-lg-block">
                <div class="d-flex justify-content-between">
                    <div class="top-info ps-2">
                        <small class="me-3"><i class="fas fa-map-marker-alt me-2 text-secondary"></i> <a href="#"
                                                                                                         class="text-white">Hòa Lạc, Hà Nội</a></small>
                        <small class="me-3"><i class="fas fa-envelope me-2 text-secondary"></i><a href="#"
                                                                                                  class="text-white">homnayangi@email.com</a></small>
                    </div>
                    <div class="top-link pe-2">
                        <a href="#" class="text-white"><small class="text-white mx-2">Privacy Policy</small>/</a>
                        <a href="#" class="text-white"><small class="text-white mx-2">Terms of Use</small>/</a>
                        <a href="#" class="text-white"><small class="text-white ms-2">Sales and Refunds</small></a>
                    </div>
                </div>
            </div>
            <div class="container px-0">
                <nav class="navbar navbar-light bg-white navbar-expand-xl" style="min-height: 60px;">
                    <a href="index.html" class="navbar-brand"><img src="img/logo.svg" alt="logo of the web"
                                                                   style="max-height: 80px; display: block; margin: 0 auto;"></a>
                    <!-- <a href="index.html" class="navbar-brand"><h1 class="text-primary display-6">Fruitables</h1></a> -->

                    <!-- <a href="index.html"><img src="img/logo.svg" alt="logo of the web"  style="width: 10vw; height: auto;" ></a> -->

                    <button class="navbar-toggler py-2 px-3" type="button" data-bs-toggle="collapse"
                            data-bs-target="#navbarCollapse">
                        <span class="fa fa-bars text-primary"></span>
                    </button>
                    <div class="collapse navbar-collapse bg-white" id="navbarCollapse">
                        <div class="navbar-nav mx-auto">
                            <a href="home" class="nav-item nav-link">Trang chủ</a>
                            <a href="shop" class="nav-item nav-link">Cửa Hàng</a>
                            <!-- <a href="shop-detail.html" class="nav-item nav-link">Shop Detail</a> -->
                            <!-- <div class="nav-item dropdown">
                            <a href="#" class="nav-link dropdown-toggle" data-bs-toggle="dropdown">Pages</a>
                            <div class="dropdown-menu m-0 bg-secondary rounded-0">
                                <a href="cart.html" class="dropdown-item">Cart</a>
                                <a href="chackout.html" class="dropdown-item">Chackout</a>
                                <a href="testimonial.html" class="dropdown-item">Testimonial</a>
                                <a href="404.html" class="dropdown-item">404 Page</a>
                            </div>
                        </div> -->
                            <!-- <a href="contact.html" class="nav-item nav-link">Contact</a> -->
                        </div>
                        <div class="d-flex m-3 me-0">
                            <!-- <button class="btn-search btn border border-secondary btn-md-square rounded-circle bg-white me-4" data-bs-toggle="modal" data-bs-target="#searchModal"><i class="fas fa-search text-primary"></i></button> -->
                            <a href="cart" class="position-relative me-4 my-auto">
                                <i class="fa fa-shopping-bag fa-2x"></i>
                                <c:if test="${not empty sessionScope.cartSize}">
                                    <span
                                        class="position-absolute bg-secondary rounded-circle d-flex align-items-center justify-content-center text-dark px-1"
                                        style="top: -5px; left: 15px; height: 20px; min-width: 20px;">${sessionScope.cartSize}</span>
                                </c:if>
                            </a>
                            <c:set var="account" value="${sessionScope.account}"></c:set>

                                <!-- only show logout if user hasn't login yet -->
                            <c:if test="${empty sessionScope.account}">       
                                <a href="login" class="my-auto" style="margin-left: 20px">
                                    <i class="fa-2x fa-solid fa-right-to-bracket"></i>
                                    <span>Đăng nhập</span>
                                </a>
                                <a href="register" class="my-auto" style="margin-left: 20px">
                                    <i class="fa-2x fa-solid fa-user-plus"></i>
                                    <span>Đăng kí</span>
                                </a>
                            </c:if> 

                            <!-- only show logout if user login -->
                            <c:if test="${not empty sessionScope.account}">    
                                <c:if test="${account.roleId == 1}">
                                    <a href="ShowOrder" class="my-auto" style="margin-right: 20px">
                                        <i class="fa-2x fas fa-solid fa-user-tie"></i>
                                        <span>Quản lí</span>

                                    </a>
                                </c:if>
                                <a href="UserAccount" class="my-auto">
                                    <i class="fas fa-user fa-2x"></i>
                                    <span>${account.username}</span>

                                </a>

                                <a href="logout" class="my-auto" style="margin-left: 20px">
                                    <i class="fa-2x fa-solid fa-right-from-bracket"></i>
                                    <!--<i class="fa-2x fa-solid fa-arrow-right-from-bracket"></i>-->
                                    <span>Đăng xuất</span>
                                </a>
                            </c:if> 
                        </div>
                    </div>
                </nav>
            </div>
        </div>
        <!-- Navbar End -->

        <!--         JavaScript Libraries 
                <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>
                <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0/dist/js/bootstrap.bundle.min.js"></script>
                <script src="lib/easing/easing.min.js"></script>
                <script src="lib/waypoints/waypoints.min.js"></script>
                <script src="lib/lightbox/js/lightbox.min.js"></script>
                <script src="lib/owlcarousel/owl.carousel.min.js"></script>
        
                 Template Javascript 
                <script src="js/main.js"></script>-->
    </body>

</html>