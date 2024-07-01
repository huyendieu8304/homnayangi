<%-- 
    Document   : cart
    Created on : Jun 27, 2024, 12:52:14 AM
    Author     : BKC
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Đặt hàng</title>

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

    </head>
    <body>
        <%@include file="header.jsp" %>

        <!-- Single Page Header start -->
        <div class="container-fluid page-header py-5">
            <h1 class="text-center text-white display-6">Giỏ hàng</h1>
            <ol class="breadcrumb justify-content-center mb-0">
                <li class="breadcrumb-item"><a href="home">Trang chủ</a></li>
                <li class="breadcrumb-item"><a href="shop">Cửa hàng</a></li>
                <li class="breadcrumb-item active text-white">Giỏ hàng</li>
            </ol>
        </div>
        <!-- Single Page Header End -->

        <!-- Cart Page Start -->
        <div class="container-fluid py-5">
            <div class="container py-5">
                <h2>Thông tin đặt hàng</h2>
                <form action="action">
                    <table class="table">
                        <tr>
                            <th scope="col">Họ tên người nhận</th>
                            <td>
                                <input type="text" name="receiverName" id="receiverName" style="border: none" placeholder="Nhập họ và tên">
                                <div id="receiverNameError" class="error"></div>
                            </td>
                        </tr>
                        <tr>
                            <th scope="col">Số điện thoại người nhận</th>
                            <td>
                                <input type="text" name="phonenumber" id="phonenumber" style="border: none" placeholder="Nhập số điện thoại">
                                <div id="phoneNumberError" class="error"></div>
                            </td>
                        </tr>
                        <tr>
                            <th scope="col">Địa chỉ nhận hàng</th>
                            <td>
                                <textarea id="receiveAddress" name="receiveAddress"
                                          rows="5" cols="30"></textarea>
                            </td>
                        </tr>
                    </table>
                </form>
            </div>
            <div class="container py-5">
                <div class="table-responsive">
                    <c:set var="order" value="${requestScope.order}"></c:set>
                    <c:if test="${ empty order}">
                        <h3>oops! Bạn chưa chọn mặt hàng nào cả</h3>
                        <h4>Hãy thêm sản phẩm vào giỏ hàng trước đã nhé!</h4>
                        <a href="shop">Quay lại cửa hàng</a>
                    </c:if>        
                    <c:if test="${not empty order}">
                        <table class="table">
                            <thead>
                                <tr>
                                    <th scope="col">Sản phẩm</th>
                                    <th scope="col">Tên</th>
                                    <th scope="col">Giá</th>
                                    <th scope="col">Số lượng</th>
                                </tr>
                            </thead>
                            <tbody>

                                <c:forEach var="cartItem" items="${order}">
                                    <tr class="cart-item">

                                        <th scope="row">
                                            <div class="d-flex align-items-center">
                                                <img src="${cartItem.ingredient.imageUrl}" class="img-fluid me-5 rounded-circle" style="width: 80px; height: 80px;" alt="">
                                            </div>
                                        </th>

                                        <td>
                                            <a href="ingredientDetail?id=${cartItem.getIngredient().getIngredientId()}">
                                                <p class="mb-0 mt-4">${cartItem.getIngredient().getIngredientName()}
                                                    (${cartItem.getIngredient().getQuantityPerUnitFormatted()} ${cartItem.getIngredient().getUnit()})</p>
                                                <p>Còn: ${cartItem.getIngredient().getStockQuantity()} sản phẩm</p>
                                            </a>
                                        </td>

                                        <td >
                                            <p class="mb-0 mt-4" data-price="${cartItem.ingredient.price}">
                                                <fmt:formatNumber value="${cartItem.ingredient.price}"
                                                                  pattern="#,###"></fmt:formatNumber></p>
                                            </td>
                                            <td>
                                                <p class="mb-0 mt-4" data-price="${cartItem.ingredient.price}">
                                                ${cartItem.quantity}
                                            </p>
                                        </td>
                                    </tr>
                                </c:forEach>

                            </tbody>
                        </table>
                        <div class="row g-4">
                            <div class="col-12">
                                <div class="bg-light rounded">
                                    <div class="p-4 justify-content-center" style="text-align: center">
                                        <h1 class="display-6 mb-4">Tổng tiền: 
                                            <span class="fw-normal" id="totalPrice">
                                                <fmt:formatNumber value="${requestScope.total}" pattern="#,###"></fmt:formatNumber>
                                                </span> vnđ
                                            </h1>
                                        </div>
                                        <div style="text-align: center">
                                            <button class="btn border-secondary rounded-pill px-4 py-3 text-primary text-uppercase mb-4 ms-4"
                                                    type="submit">Đặt hàng</button>
                                        </div>
                                    </div>
                                </div>
                            </div>
                    </c:if>

                </div>
                <!--                <div class="mt-5">
                                    <input type="text" class="border-0 border-bottom rounded me-5 py-3 mb-4" placeholder="Coupon Code">
                                    <button class="btn border-secondary rounded-pill px-4 py-3 text-primary" type="button">Apply Coupon</button>
                                </div>-->

            </div>
        </div>
        <!-- Cart Page End -->

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
            document.addEventListener('DOMContentLoaded', function () {
                const quantityInputs = document.querySelectorAll('input[name="quantity"]');
                const btnMinuses = document.querySelectorAll('.btn-minus');
                const btnPluses = document.querySelectorAll('.btn-plus');
                const checkboxes = document.querySelectorAll('.add-to-order-checkbox');

                // Lắng nghe sự kiện change cho các checkbox
                checkboxes.forEach(checkbox => {
                    checkbox.addEventListener('change', updateTotalPrice);
                });
                quantityInputs.forEach((quantityInput, index) => {
                    const stockQuantity = parseInt(quantityInput.max);

                    // Initially check and hide/show buttons based on initial value
                    checkQuantityButtons(quantityInput, btnMinuses[index], btnPluses[index]);

                    btnMinuses[index].addEventListener('click', function () {
                        decreaseQuantity(quantityInput, btnMinuses[index], btnPluses[index]);
                    });

                    btnPluses[index].addEventListener('click', function () {
                        increaseQuantity(quantityInput, btnMinuses[index], btnPluses[index]);
                    });

                    quantityInput.addEventListener('input', function () {
                        checkQuantityButtons(quantityInput, btnMinuses[index], btnPluses[index]);
                    });
                });

                function decreaseQuantity(quantityInput, btnMinus, btnPlus) {
                    let currentValue = parseInt(quantityInput.value);
                    let minQuantity = parseInt(quantityInput.min);

                    checkQuantityButtons(quantityInput, btnMinus, btnPlus);
                }

                function increaseQuantity(quantityInput, btnMinus, btnPlus) {
                    let currentValue = parseInt(quantityInput.value);
                    let maxQuantity = parseInt(quantityInput.max);

                    checkQuantityButtons(quantityInput, btnMinus, btnPlus);
                }

                function checkQuantityButtons(quantityInput, btnMinus, btnPlus) {
                    let currentValue = parseInt(quantityInput.value);
                    let minQuantity = parseInt(quantityInput.min);
                    let maxQuantity = parseInt(quantityInput.max);

                    btnMinus.disabled = currentValue <= minQuantity;
                    btnPlus.disabled = currentValue >= maxQuantity;
                }

                function submitAddToCart() {
                    var fragment = window.location.hash;
                    document.getElementById('previousPageFragment').value = fragment;
                }

                function updateTotalPrice() {
                    let totalPrice = 0;

                    document.querySelectorAll('.add-to-order-checkbox:checked').forEach(function (checkbox) {
                        const row = checkbox.closest('.cart-item');
                        const priceElement = row.querySelector('[data-price]');
                        const quantityElement = row.querySelector('[name="quantity"]');

                        const price = parseFloat(priceElement.dataset.price);
                        const quantity = parseInt(quantityElement.value, 10);

                        totalPrice += price * quantity;
                    });

                    // Cập nhật tổng tiền
                    const totalPriceElement = document.getElementById('totalPrice');
                    totalPriceElement.innerText = totalPrice.toLocaleString('vi-VN');
                    totalPriceElement.dataset.value = totalPrice; // Cập nhật cả thuộc tính data-value
                }
            });


        </script>

    </body>
</html>
