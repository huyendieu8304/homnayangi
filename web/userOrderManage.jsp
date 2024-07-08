<%-- 
    Document   : userOrderManage
    Created on : Jul 6, 2024, 12:39:51 PM
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
            <h1 class="text-center text-white display-6">Thông tin đơn hàng</h1>
            <ol class="breadcrumb justify-content-center mb-0">
                <li class="breadcrumb-item"><a href="home">Trang chủ</a></li>
                <li class="breadcrumb-item"><a href="shop">Cửa hàng</a></li>
                <li class="breadcrumb-item"><a href="UserAccount">Tài khoản</a></li>
                <li class="breadcrumb-item active text-white">Thông tin đơn hàng</li>
            </ol>
        </div>
        <!-- Single Page Header End -->

        <!-- Fruits Shop Start-->
        <div class="container-fluid fruite py-5">
            <div class="container py-5">
                <h3>Thông tin</h3>
                <table class="table">
                    <tr>
                        <th>Mã đơn hàng</th>
                        <td>${orderBasic.orderId}</td>
                    </tr>
                    <tr>
                        <th>Tên người nhận</th>
                        <td>${orderBasic.receiverFullname}</td>
                    </tr>
                    <tr>
                        <th>Sđt người nhận</th>
                        <td>${orderBasic.receiverPhoneNumber}</td>
                    </tr>
                    <tr>
                        <th>Email người nhận</th>
                        <td>${orderBasic.receiverEmail}</td>
                    </tr>
                    <tr>
                        <th>Địa chỉ giao hàng</th>
                        <td>${orderBasic.deliveryAddress}</td>
                    </tr>
                    <tr>
                        <th>Thời gian đặt hàng</th>
                        <td>${orderBasic.orderDate}</td>
                    </tr>
                    <tr>
                        <th>Thời gian giao hàng</th>
                        <td>${orderBasic.shipDate}</td>
                    </tr>
                    <tr>
                        <th>Ghi chú của khách hàng</th>
                        <td>${orderBasic.customerNote}</td>
                    </tr>
                    <tr>
                        <th>Trạng thái đơn hàng</th>
                        <td>${orderBasic.orderStatus}</td>
                    </tr>
                </table>
                <h3>Đơn hàng</h3>    
                <hr>
                <table class="table">
                    <tr>
                        <th>Tên sản phẩm</th>
                        <th>Số lượng</th>
                        <th>Đơn giá</th>
                        <th>Thành tiền</th>
                    </tr>
                    <c:set var="sum" value="0"></c:set>
                    <c:forEach items="${orderDetail}" var="o">
                        <tr>
                            <td>${o.ingredient.getIngredientName()}</td>
                            <td>${o.quantity}</td>
                            <td>${o.price}</td>
                            <td id="price">${o.quantity * o.price}</td>
                        </tr>
                        <c:set var="sum" value="${sum + (o.quantity * o.price)}"></c:set>
                    </c:forEach>
                    <tr></tr>
                    <tr>
                        <td></td>
                        <td></td>
                        <td>Tổng tiền hàng</td>
                        <td>${sum}</td>
                    </tr>
                    <tr>
                        <td></td>
                        <td></td>
                        <td>Phí vận chuyển</td>
                        <td>20,000</td>
                    </tr>
                    <tr>
                        <td></td>
                        <td></td>
                        <td>Tổng hóa đơn</td>
                        <td><c:set var="shippingFee" value="20000"></c:set>
                            <c:set var="totalBill" value="${sum + shippingFee}"></c:set>
                            ${totalBill}
                        </td>
                    </tr>
                </table>
            </div>
            <!-- order tab start -->
        </div>
    </div>
    <!-- main part end -->
    <!-- main part end -->
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
</body>
</html>
