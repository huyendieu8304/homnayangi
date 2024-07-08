<%-- 
    Document   : adminSideBar
    Created on : Jul 5, 2024, 6:59:02 AM
    Author     : BKC
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>admin-sidebar</title>

        <meta content="width=device-width, initial-scale=1.0, shrink-to-fit=no" name="viewport" />
        <link rel="icon" href="img/kaiadmin/favicon.ico" type="image/x-icon" />

        <!-- Fonts and icons -->
        <script src="js/plugin/webfont/webfont.min.js"></script>
        <script>
            WebFont.load({
                google: {families: ["Public Sans:300,400,500,600,700"]},
                custom: {
                    families: [
                        "Font Awesome 5 Solid",
                        "Font Awesome 5 Regular",
                        "Font Awesome 5 Brands",
                        "simple-line-icons",
                    ],
                    urls: ["css/fonts.min.css"],
                },
                active: function () {
                    sessionStorage.fonts = true;
                },
            });
        </script>

        <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.15.4/css/all.css" />

        <!-- CSS Files -->
        <link rel="stylesheet" href="css/bootstrap.min.css" />
        <link rel="stylesheet" href="css/plugins.min.css" />
        <link rel="stylesheet" href="css/kaiadmin.min.css" />

        <!-- CSS -->
        <link rel="stylesheet" href="assets/css/demo.css" />

    </head>
    <body>
        <!-- Sidebar -->
        <div class="sidebar sidebar-style-2" data-background-color="dark">
            <div class="sidebar-logo">
                <!-- Logo Header -->
                <div class="logo-header" data-background-color="dark">
                    <a href="index.html" class="logo">
                        <img src="img/logo.svg" alt="navbar brand" class="navbar-brand" height="50px" />
                    </a>
                    <div class="nav-toggle">
                        <button class="btn btn-toggle toggle-sidebar">
                            <i class="gg-menu-right"></i>
                        </button>
                        <button class="btn btn-toggle sidenav-toggler">
                            <i class="gg-menu-left"></i>
                        </button>
                    </div>
                </div>
                <!-- End Logo Header -->
            </div>
            <div class="sidebar-wrapper scrollbar scrollbar-inner">
                <div class="sidebar-content">
                    <ul class="nav nav-secondary">
                        <!-- manage USER nav start -->
                        <!-- <li class="nav-item active"> -->
                        <li class="nav-item">
                            <a href="ShowUser">
                                <i class="fas fa-user"></i>
                                <p>Người dùng</p>
                                
                            </a>
                        </li>
                        <!-- manage USER nav end -->

                        <!-- manage SẢN PHẨM nav start -->
                        <!-- <li class="nav-item active"> -->
                        <li class="nav-item">
                            <a data-bs-toggle="collapse" href="#ingredient" class="collapsed" aria-expanded="false">
                                <i class="fas fa-lemon"></i>
                                <p>Sản phẩm</p>
                                <span class="caret"></span>
                            </a>

                            <div class="collapse" id="ingredient">
                                <ul class="nav nav-collapse">
                                    <li>
                                        <a href="ShowIngredient">
                                            <span class="sub-item">Nguyên liệu</span>
                                        </a>
                                    </li>

                                    <li>
                                        <a href="#">
                                            <span class="sub-item">Danh mục</span>
                                        </a>
                                    </li>

                                </ul>
                            </div>

                        </li>
                        <!-- manage PRODUCT nav end -->

                        <!-- manage ORDER nav start -->
                        <!-- <li class="nav-item active"> -->
                        <li class="nav-item">
                            <a href="ShowOrder" >
                                <i class="fas fa-box"></i>
                                <p>Đơn hàng</p>
                            </a>
                        </li>
                        <!-- manage ORDER nav end -->

                        <!-- manage SALE nav start -->
                        <!-- <li class="nav-item active"> -->
                        
                        <li class="nav-item">
                            <a href="StatisticSale" >
                                <i class="far fa-chart-bar"></i>
                                <p>Doanh số</p>
                            </a>
                        </li>
                        <!-- manage SALE nav end -->


                    </ul>
                </div>
            </div>
        </div>
        <!-- End Sidebar -->

        <!--   Core JS Files   -->
        <script src="js/core/jquery-3.7.1.min.js"></script>
        <script src="js/core/popper.min.js"></script>
        <script src="js/core/bootstrap.min.js"></script>
    </body>
</html>
