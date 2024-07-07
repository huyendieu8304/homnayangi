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
                                <h3 class="fw-bold mb-3">Quản lí đơn hàng</h3>
                                <!--<h6 class="op-7 mb-2">Tất cả đơn hàng</h6>-->
                            </div>
                            <!--                            <div class="ms-md-auto py-2 py-md-0">
                                                            <a href="#" class="btn btn-label-info btn-round me-2">Manage</a>
                                                            <a href="#" class="btn btn-primary btn-round">Add Customer</a>
                                                        </div>-->
                        </div>

                        <div class="row">
                            <div class="col-sm-6 col-md-3">
                                <div class="card card-stats card-round">
                                    <div class="card-body">
                                        <div class="row align-items-center">
                                            <div class="col-icon">
                                                <div class="icon-big text-center icon-primary bubble-shadow-small">
                                                    <i class="fas fa-solid fa-exclamation"></i>
                                                </div>
                                            </div>
                                            <div class="col col-stats ms-3 ms-sm-0">
                                                <div class="numbers">
                                                    <p class="card-category">Chờ xác nhận</p>
                                                    <h4 class="card-title">${sessionScope.numOfWaiting}</h4>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="col-sm-6 col-md-3">
                                <div class="card card-stats card-round">
                                    <div class="card-body">
                                        <div class="row align-items-center">
                                            <div class="col-icon">
                                                <div class="icon-big text-center icon-info bubble-shadow-small">
                                                    <!--<i class="fas fa-user-check"></i>-->
                                                    <i class="fas fa-solid fa-spinner"></i>
                                                </div>
                                            </div>
                                            <div class="col col-stats ms-3 ms-sm-0">
                                                <div class="numbers">
                                                    <p class="card-category">Đang chuẩn bị</p>
                                                    <h4 class="card-title">${sessionScope.numOfPreparing}</h4>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="col-sm-6 col-md-3">
                                <div class="card card-stats card-round">
                                    <div class="card-body">
                                        <div class="row align-items-center">
                                            <div class="col-icon">
                                                <div class="icon-big text-center icon-success bubble-shadow-small">
                                                    <!--<i class="fas fa-luggage-cart"></i>-->
                                                    <i class="fas fa-solid fa-truck"></i>
                                                </div>
                                            </div>
                                            <div class="col col-stats ms-3 ms-sm-0">
                                                <div class="numbers">
                                                    <p class="card-category">Đang vận chuyển</p>
                                                    <h4 class="card-title">${sessionScope.numOfShipping}</h4>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="col-sm-6 col-md-3">
                                <div class="card card-stats card-round">
                                    <div class="card-body">
                                        <div class="row align-items-center">
                                            <div class="col-icon">
                                                <div class="icon-big text-center icon-secondary bubble-shadow-small">
                                                    <i class="far fa-check-circle"></i>
                                                </div>
                                            </div>
                                            <div class="col col-stats ms-3 ms-sm-0">
                                                <div class="numbers">
                                                    <p class="card-category">Hoàn thành</p>
                                                    <h4 class="card-title">${sessionScope.numOfCompleted}</h4>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                                                
                        <div class="row" style="margin-bottom: 20px">
                            <form action="ShowOrder" method="post"
                                  style="display: flex; width: 100%; justify-content: space-evenly">
                                Mã đơn hàng <input type="text" name="orderId" style="margin-right: 15px">
                                Đặt hàng từ <input type="date" name="orderDateFrom" style="margin-right: 15px">
                                Đặt hàng trước<input type="date" name="orderDateTo" style="margin-right: 15px">
                                Giao hàng từ <input type="date" name="shipDateFrom" style="margin-right: 15px">
                                Giao hàng trước <input type="date" name="shipDateTo" style="margin-right: 15px">
                                Trạng thái đơn hàng <select id="orderStatus" name="orderStatus" style="margin-right: 15px">
                                    <option value="">Tất cả</option>
                                    <option value="waiting confirm">Chờ xác nhận</option>
                                    <option value="preparing">Đang chuẩn bị</option>
                                    <option value="shipping">Đang vận chuyển</option>
                                    <option value="completed">Đã hoàn thành</option>
                                    <option value="cancled">Đã hủy</option>
                                </select>
                                <input type="submit" value="Tìm kiếm" >

                            </form>
                        </div>
                        <!-- Edit order form start -->                        

                        <div class="row">
                            <!--all table start -->
                            <div class="col-md-12">
                                <div class="card">
                                    <div class="card-body">
                                        <!-- table start -->
                                        <div class="table-responsive">
                                            <table id="add-row"
                                                class="display table table-striped table-hover" >
                                                <thead>
                                                    <tr>
                                                        <th>Mã đơn hàng</th>
                                                        <th>Người nhận</th>
                                                        <th>Số điện thoại</th>
                                                        <th>Địa chỉ nhận hàng</th>
                                                        <th>Ngày đặt hàng</th>
                                                        <th>Trạng thái đơn hàng</th>
                                                        <th style="width: 10%">Action</th>
                                                    </tr>
                                                </thead>
                                                <tfoot>
                                                    <tr>
                                                        <th>Mã đơn hàng</th>
                                                        <th>Người nhận</th>
                                                        <th>Số điện thoại</th>
                                                        <th>Địa chỉ nhận hàng</th>
                                                        <th>Ngày đặt hàng</th>
                                                        <th>Trạng thái đơn hàng</th>
                                                        <th>Action</th>
                                                    </tr>
                                                </tfoot>
                                                <tbody>
                                                    <c:forEach items="${orderList}" var="o">
                                                        <tr>
                                                            <td>${o.orderId}</td>
                                                            <td>${o.receiverFullname}</td>
                                                            <td>${o.receiverPhoneNumber}</td>
                                                            <td>${o.deliveryAddress}</td>
                                                            <td>${o.orderDate}</td>
                                                            <td>${o.orderStatus}</td>
                                                            
                                                            <td>
                                                                <div class="form-button-action">
                                                                    <a href="UpdateOrder?orderId=${o.orderId}">
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
                </div>
                <!-- main part manage end -->

            </div>
        </div>

        <!--   Core JS Files   -->
        <script src="js/core/jquery-3.7.1.min.js"></script>
        <script src="js/core/popper.min.js"></script>
        <script src="js/core/bootstrap.min.js"></script>                                       
    </body>
</html>
