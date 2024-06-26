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
        <title>Giỏ hàng</title>

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
                <div class="table-responsive">
                    <c:set var="cart" value="${requestScope.cart}"></c:set>
                    <c:if test="${ empty cart}">
                        <p>oops! giỏ hàng trống trơn</p>
                    </c:if>        
                    <c:if test="${not empty cart}">
                        <form action="CreateOrder">
                            <table class="table">
                                <thead>
                                    <tr>
                                        <th scope="col">Đặt hàng</th>
                                        <th scope="col">Sản phẩm</th>
                                        <th scope="col">Tên</th>
                                        <th scope="col">Giá</th>
                                        <th scope="col">Số lượng</th>
                                        <!--<th scope="col">Total</th>-->
                                        <th scope="col">Xóa khỏi giỏ hàng</th>
                                    </tr>
                                </thead>
                                <tbody>

                                    <c:forEach var="cartItem" items="${cart}">
                                        <tr class="cart-item">
                                            <td style="padding-left: 30px; padding-top: 40px">
                                                <input type="checkbox" name="ingredientId"
                                                       value="${cartItem.getIngredient().getIngredientId()}"
                                                       class="add-to-order-checkbox"
                                                       style="width: 20px; height: 20px;"
                                                       >
                                            </td>

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
                                                <!--increase decrease quantity in cart start -->
                                                <td>
                                                    <!--<input type="hidden" id="previousPageFragment" name="previousPageFragment">-->
                                                    <!--                                                    <input type="hidden" id="productId" 
                                                                                                               name="ingredientId" 
                                                                                                               value="${cartItem.ingredient.ingredientId}">-->
                                                <div class="input-group quantity mb-5" style="width: 100px;">
                                                    <div class="input-group-btn">
                                                        <button type="button" id="btnMinus"
                                                                class="btn btn-sm btn-minus rounded-circle bg-light border" >
                                                            <a href="AddToCart?quantity=-1&ingredientId=${cartItem.ingredient.ingredientId}">
                                                                <i class="fa fa-minus"></i>
                                                            </a>
                                                        </button>
                                                    </div>
                                                    <input type="text" class="form-control form-control-sm text-center border-0" 
                                                           name="quantity" id="quantity" value="${cartItem.quantity}" 
                                                           min="1" max="${cartItem.getIngredient().getStockQuantity()}">
                                                    <div class="input-group-btn">
                                                        <button type="button" id="btnPlus"
                                                                class="btn btn-sm btn-plus rounded-circle bg-light border">
                                                            <a href="AddToCart?quantity=1&ingredientId=${cartItem.ingredient.ingredientId}">
                                                                <i class="fa fa-plus"></i>
                                                            </a>
                                                        </button>
                                                    </div>
                                                </div>
                                            </td>
                                            <!-- remove from cart start -->
                                            <td>
                                                <button class="btn btn-md rounded-circle bg-light border mt-4" >
                                                    <a href="RemoveFromCart?ingredientId=${cartItem.ingredient.ingredientId}">
                                                        <i class="fa fa-times text-danger"></i>
                                                    </a>
                                                </button>
                                            </td>
                                            <!-- remove from cart end -->

                                        </tr>
                                    </c:forEach>

                                </tbody>
                            </table>
                            <div class="row g-4">
                                <div class="col-12">
                                    <div class="bg-light rounded">
                                        <div class="p-4 justify-content-center" style="text-align: center">
                                            <h1 class="display-6 mb-4">Tổng tiền: <span class="fw-normal" id="totalPrice">0</span> vnđ</h1>
                                        </div>
                                        <div style="text-align: center">
                                            <button class="btn border-secondary rounded-pill px-4 py-3 text-primary text-uppercase mb-4 ms-4"
                                                    type="submit">Đặt hàng</button>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </c:if>

                    </form> <!-- end orer form -->
                </div>

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
