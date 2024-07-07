<%-- 
    Document   : adminIngredientManage
    Created on : Jul 6, 2024, 1:25:43 PM
    Author     : BKC
--%>

<%-- 
    Document   : adminAllOrderManage
    Created on : Jul 5, 2024, 7:04:28 AM
    Author     : BKC
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Admin-Order Manage</title>

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
        <div class="wrapper">
            <%@include file="adminSideBar.jsp" %>

            <div class="main-panel">
                <div class="main-header">
                    <!-- Navbar Header -->
                   <%@include file="adminHeader.jsp" %>
                    <!-- End Navbar -->
                </div>

                <!-- main part manage start -->
                <div class="container">
                    <div class="page-inner">
                        <div class="d-flex align-items-left align-items-md-center flex-column flex-md-row pt-2 pb-4">
                            <div>
                                <h3 class="fw-bold mb-3">Quản lí sản phẩm</h3>
                                <!--<h6 class="op-7 mb-2">Tất cả đơn hàng</h6>-->
                            </div>
                            <!--                            <div class="ms-md-auto py-2 py-md-0">
                                                            <a href="#" class="btn btn-label-info btn-round me-2">Manage</a>
                                                            <a href="#" class="btn btn-primary btn-round">Add Customer</a>
                                                        </div>-->
                        </div>

                        <!-- filter search -->
                        <div class="row" style="margin-bottom: 20px">
                            <form action="ShowIngredient" method="post"
                                  style="display: flex; width: 100%; justify-content: space-evenly">
                                Tên sản phẩm <input type="text" name="keyword" style="margin-right: 15px">
                                Danh mục <select name="categoryId">
                                    <option value="" selected="">Tất cả</option>
                                    <c:forEach var="cat" items="${sessionScope.catlist}">
                                        <option value="${cat.categoryId}">${cat.categoryName}</option>
                                    </c:forEach>
                                </select>
                                Giá từ <select id="id" name="priceFrom">
                                    <option value=""></option>
                                    <option value="0">0đ</option>
                                    <option value="50000">50,000đ</option>
                                    <option value="100000">100,000đ</option>
                                    <option value="150000">150,000đ</option>
                                    <option value="200000">200,000đ</option>
                                </select>
                                Giá đến <select id="id" name="priceTo">
                                    <option value=""></option>
                                    <option value="50000">50,000đ</option>
                                    <option value="100000">100,000đ</option>
                                    <option value="150000">150,000đ</option>
                                    <option value="200000">200,000đ</option>
                                </select>
                                <input type="submit" value="Tìm kiếm" >

                            </form>
                        </div>
                        <!-- Edit order form start -->                        

                        <div class="row">
                            <!--all table start -->
                            <div class="col-md-12">
                                <div class="card">
                                    <div class="col-md-12">
                                        <div class="card">
                                            <div class="card-header">
                                                <div class="d-flex align-items-center">
                                                    <a href="AddANewIngredient">
                                                        <button
                                                            class="btn btn-primary btn-round ms-auto">
                                                            <i class="fa fa-plus"></i>
                                                            Thêm sản phẩm
                                                        </button>
                                                    </a>
                                                </div>
                                            </div>

                                            <div class="card-body">

                                                <!-- table start -->
                                                <div class="table-responsive">
                                                    <table
                                                        id="add-row"
                                                        class="display table table-striped table-hover"
                                                        >
                                                        <thead>
                                                            <tr>
                                                                <th>Mã sản phẩm</th>
                                                                <th>Tên sản phẩm</th>
                                                                <th>Tồn kho</th>
                                                                <th>Giá</th>
                                                                <th style="width: 10%">Action</th>
                                                            </tr>
                                                        </thead>
                                                        <tfoot>
                                                            <tr>
                                                                <th>Mã sản phẩm</th>
                                                                <th>Tên sản phẩm</th>
                                                                <th>Tồn kho</th>
                                                                <th>Giá</th>
                                                                <th>Hiển thị</th>
                                                                <th>Action</th>
                                                            </tr>
                                                        </tfoot>
                                                        <tbody>
                                                            <c:forEach items="${ingredientList}" var="i">
                                                                <tr>
                                                                    <td>${i.ingredientId}</td>
                                                                    <td>${i.ingredientName}</td>
                                                                    <td>${i.stockQuantity}</td>
                                                                    <td>${i.price}</td>
                                                                    <td>${(i.state) ? 'hiện':'ẩn'}</td>

                                                                    <td>
                                                                        <div class="form-button-action">
                                                                            <a href="UpdateAnIngredient?ingredientId=${i.ingredientId}">
                                                                                <button type="button" title=""
                                                                                        class="btn btn-link btn-primary btn-lg"
                                                                                        data-original-title="Edit Task">
                                                                                    <i class="fa fa-edit"></i>
                                                                                </button>
                                                                            </a>
                                                                        </div>
                                                                    </td>
                                                                </tr>
                                                            </c:forEach>

                                                        </tbody>
                                                    </table>
                                                </div>
                                                <!-- table end -->
                                            </div>
                                        </div>
                                    </div>
                                    <!--all table end -->
                                </div>
                            </div>
                            <!-- main part manage end -->

                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!--   Core JS Files   -->
        <script src="js/core/jquery-3.7.1.min.js"></script>
        <script src="js/core/popper.min.js"></script>
        <script src="js/core/bootstrap.min.js"></script>                                       
    </body>
</html>

