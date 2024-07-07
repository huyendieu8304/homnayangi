<%-- 
    Document   : adminUpdateOrder
    Created on : Jul 5, 2024, 9:32:50 PM
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
                                <h3 class="fw-bold mb-3">Cập nhật đơn hàng</h3>

                            </div>
                        </div>

                        <!-- Edit order form start -->                        
                        <div class="row" style="margin-top: 20px">
                            <div class="col-md-12">
                                <div class="card">
                                    <div class="card-body">
                                        <h3 class="fw-bold mb-3">Cập nhật đơn hàng</h3>
                                        <!-- selected order -->
                                        <form id="updateOrder" action="UpdateOrder" method="post">
                                            Mã đơn hàng: <input type="text" name="orderId" readonly="" value="${orderBasic.orderId}"> <br>
                                            Tên người nhận: <input type="text" name="receiverFullname" value="${orderBasic.receiverFullname}"> <br>
                                            Sđt người nhận: <input type="text" name="receiverPhoneNumber" value="${orderBasic.receiverPhoneNumber}"> <br>
                                            Email người nhận: <input type="text" name="receiverEmail" value="${orderBasic.receiverEmail}"> <br>
                                            Địa chỉ giao hàng: <input type="text" name="deliveryAddress" value="${orderBasic.deliveryAddress}"> <br>
                                            Thời gian đặt hàng: <input type="text" name="orderDate" readonly="" value="${orderBasic.orderDate}"> <br>
                                            Ghi chú của khách hàng: <textarea name="customerNote" rows="5" cols="20">${orderBasic.customerNote}</textarea> <br>
                                            Trạng thái đơn hàng: <select id="id" name="orderStatus">
                                                <option value="${orderBasic.orderStatus}"></option>
                                                <c:if test="${orderBasic.orderStatus ne 'cancled'}">
                                                    <option value="waiting confirm">Chờ xác nhận</option>
                                                    <option value="preparing">Đang chuẩn bị</option>
                                                    <option value="shipping">Đang vận chuyển</option>
                                                    <option value="completed">Đã hoàn thành</option>
                                                    <option value="cancled">Đã hủy</option>
                                                </c:if>
                                            </select> <br>
                                            <input type="submit" value="Cập nhật đơn hàng">
                                        </form>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="row">
                            <!--all table start -->
                            <div class="col-md-12">
                                <div class="card">
                                    <div class="card-body">
                                        <!-- table start -->
                                        <div class="table-responsive">
                                            <table
                                                id="add-row"
                                                class="display table table-striped table-hover"
                                                >
                                                <thead>
                                                    <tr>
                                                        <th>Id sản phẩm</th>
                                                        <th>Tên sản phẩm</th>
                                                        <th>Số lượng trong kho</th>
                                                        <th>Số lượng mua</th>
                                                        <th>Đơn giá</th>
                                                        <th>Thành tiền</th>
                                                    </tr>
                                                </thead>

                                                <tbody>
                                                    <c:set var="sum" value="0"></c:set>
                                                    <c:forEach items="${orderDetail}" var="o">
                                                        <tr>
                                                            <td>${o.ingredient.getIngredientId()}</td>
                                                            <td>${o.ingredient.getIngredientName()}</td>
                                                            <td>${o.ingredient.getStockQuantity()}</td>
                                                            <td>${o.quantity}</td>
                                                            <td>${o.price}</td>
                                                            <td id="price">${o.quantity * o.price}</td>
                                                        </tr>
                                                        <c:set var="sum" value="${sum + (o.quantity * o.price)}"></c:set>
                                                    </c:forEach>
                                                    <tr>
                                                        <td></td>
                                                        <td></td>
                                                    </tr>
                                                    <tr>
                                                        <td></td>
                                                        <td></td>
                                                        <td>Tổng tiền hàng</td>
                                                        <td id="totalPrice">${sum}</td>
                                                        <td></td>
                                                        <td></td>
                                                    </tr>
                                                    <tr>
                                                        <td></td>
                                                        <td></td>
                                                        <td>Phí vận chuyển</td>
                                                        <td id="totalPrice">20,000</td>
                                                        <td></td>
                                                        <td></td>
                                                    </tr>
                                                    <tr>
                                                        <td></td>
                                                        <td></td>
                                                        <td>Tổng hóa đơn</td>
                                                        <td id="bill">
                                                            <c:set var="shippingFee" value="20000"></c:set>
                                                            <c:set var="totalBill" value="${sum + shippingFee}"></c:set>
                                                            ${totalBill}</td>
                                                        <td></td>
                                                        <td></td>
                                                    </tr>
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

