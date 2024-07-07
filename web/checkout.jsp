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
            <h1 class="text-center text-white display-6">Checkout</h1>
            <ol class="breadcrumb justify-content-center mb-0">
                <li class="breadcrumb-item"><a href="home">Trang chủ</a></li>
                <li class="breadcrumb-item"><a href="shop">Cửa hàng</a></li>
                <li class="breadcrumb-item active text-white">Đặt hàng</li>
            </ol>
        </div>
        <!-- Single Page Header End -->
        <!-- Checkout Page Start -->
        <div class="container-fluid py-5">
            <div class="container py-5">
                <div id="errorFromServlet"></div>
                <c:set var="order" value="${sessionScope.order}"></c:set>
                <c:if test="${ empty order}">
                    <h3>oops! Bạn chưa chọn mặt hàng nào cả</h3>
                    <h4>Hãy thêm sản phẩm vào giỏ hàng trước đã nhé!</h4>
                    <a href="shop">Quay lại cửa hàng</a>
                </c:if>        
                <c:if test="${not empty order}">       
                    <h1 class="mb-4">Thông tin hóa đơn</h1>
                    <!-- Form billing detail start -->
                    <form action="CreateOrder" method="post" onsubmit="return validateForm()">
                        <div class="row g-5">
                            <div class="col-md-12 col-lg-6 col-xl-7">
                                <div class="form-item w-100">
                                    <label class="form-label my-3">Họ và tên người nhận<sup>*</sup></label>
                                    <input type="text" name="receiverFullname" 
                                           id="receiverFullname" class="form-control" >
                                    <div id="receiverFullnameError" class="error"></div>
                                </div>
                                <div class="form-item">
                                    <label class="form-label my-3">Số điện thoại người nhận<sup>*</sup></label>
                                    <input type="text" name="receiverPhoneNumber" 
                                           id="receiverPhoneNumber" class="form-control">
                                    <div id="receiverPhoneNumberError" class="error"></div>
                                </div>
                                <div class="form-item">
                                    <label class="form-label my-3">Địa chỉ email người nhận<sup>*</sup></label>
                                    <input type="text" name="receiverEmail" 
                                           id="receiverEmail" class="form-control" >
                                    <div id="receiverEmailError" class="error"></div>
                                </div>
                                <div class="form-item">
                                    <label class="form-label my-3">Địa chỉ nhận hàng <sup>*</sup></label>
                                    <input type="text" name="deliveryAddress" 
                                           id="deliveryAddress" class="form-control"
                                           placeholder="Tỉnh thành, Quận/Huyện, Xã/Phường,Tên đường, số nhà ...">
                                    <div id="deliveryAddressError" class="error"></div>
                                </div>
                                <div class="form-item">
                                    <label class="form-label my-3">Ghi chú</label>
                                    <textarea name="customerNote" class="form-control" spellcheck="false" cols="30" rows="11" placeholder="Oreder Notes (Optional)"></textarea>
                                </div>
                            </div>
                            <div class="col-md-12 col-lg-6 col-xl-5">
                                <div class="table-responsive">
                                    <table class="table">
                                        <thead>
                                            <tr>
                                                <th scope="col">Sản phẩm</th>
                                                <th scope="col">Tên</th>
                                                <th scope="col">Đơn giá</th>
                                                <th scope="col">Số lượng</th>
                                                <th scope="col">Thành tiền</th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                            <c:forEach var="cartItem" items="${order}">
                                                <tr>
                                                    <th scope="row">
                                                        <div class="d-flex align-items-center mt-2">
                                                            <img src="${cartItem.ingredient.imageUrl}" class="img-fluid rounded-circle" style="width: 90px; height: 90px;" alt="">
                                                        </div>
                                                    </th>
                                                    <td class="py-5">
                                                        <p class="mb-0 " style="margin-top: 0">${cartItem.getIngredient().getIngredientName()}(${cartItem.getIngredient().getQuantityPerUnitFormatted()} ${cartItem.getIngredient().getUnit()})</p>
                                                    </td>
                                                    <td class="py-5"><fmt:formatNumber value="${cartItem.ingredient.price}"
                                                                      pattern="#,###"></fmt:formatNumber></td>
                                                    <td class="py-5">${cartItem.quantity}</td>
                                                    <td class="py-5">
                                                        <span class="totalPrice">
                                                            <fmt:formatNumber value="${cartItem.ingredient.price * cartItem.quantity}" pattern="#,###"></fmt:formatNumber>
                                                            </span>
                                                        </td>
                                                </c:forEach>

                                            <tr>
                                                <th scope="row">
                                                </th>
                                                <td class="py-5"></td>
                                                <td colspan="2" class="py-5">
                                                    <p class="mb-0 text-dark py-3">Tổng tiền hàng</p>
                                                </td>
                                                <td class="py-5">
                                                    <div class="py-3 border-bottom border-top">
                                                        <p id="total" class="mb-0 text-dark"></p>
                                                    </div>
                                                </td>
                                            </tr>
                                            <tr>
                                                <th scope="row">
                                                </th>
                                                <td class="py-5"></td>
                                                <td colspan="2" class="py-5">
                                                    <p class="mb-0 text-dark py-3">Phí vận chuyển</p>
                                                </td>
                                                <td class="py-5">
                                                    <div class="py-3 border-bottom border-top">
                                                        <p class="mb-0 text-dark">20.000&nbsp;₫</p>
                                                    </div>
                                                </td>
                                            </tr>
                                            <tr>
                                                <th scope="row">
                                                </th>
                                                <td colspan="2" class="py-5">
                                                    <p class="mb-0 text-dark text-uppercase py-3">TỔNG HÓA ĐƠN</p>
                                                </td>
                                                <td class="py-5"></td>
                                                <td class="py-5">
                                                    <div class="py-3 border-bottom border-top">
                                                        <p id="totalBill" class="mb-0 text-dark"></p>
                                                    </div>
                                                </td>
                                            </tr>
                                        </tbody>
                                    </table>
                                </div>
                                <div class="row g-4 text-center align-items-center justify-content-center border-bottom py-3">
                                    <div class="col-12">
                                        <p class="mb-0 text-dark py-4">Thanh toán khi nhận hàng</p>
                                    </div>
                                </div>
                                <div class="row g-4 text-center align-items-center justify-content-center pt-4">
                                    <button id="submitButton" type="submit" class="btn border-secondary py-3 px-4 text-uppercase w-100 text-primary">Đặt hàng</button>
                                </div>
                            </div>
                        </div>
                    </form>
                </c:if> 
                <!-- Form billing detail start -->
            </div>
        </div>
        <!-- Checkout Page End -->

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
                        function normalizeFullname(fullname) {
                            // Remove leading/trailing whitespace, replace multiple spaces with a single space
                            // and capitalize the first letter of each word.
                            return fullname.trim()
                                    .replace(/\s+/g, ' ')
                                    .split(' ')
                                    .map(word => word.charAt(0).toUpperCase() + word.slice(1).toLowerCase())
                                    .join(' ');
                        }

                        // Function to validate the form
                        function validateForm() {
                            let isValid = true;

                            const fullname = document.getElementById('receiverFullname').value;
                            const email = document.getElementById('receiverEmail').value;
                            const phoneNumber = document.getElementById('receiverPhoneNumber').value;
                            const address = document.getElementById('deliveryAddress').value;

                            const fullnameErrorDiv = document.getElementById('receiverFullnameError');
                            const emailErrorDiv = document.getElementById('receiverEmailError');
                            const phoneNumberErrorDiv = document.getElementById('receiverPhoneNumberError');
                            const addressErrorDiv = document.getElementById('deliveryAddressError');

                            // Clear previous errors
                            fullnameErrorDiv.textContent = '';
                            emailErrorDiv.textContent = '';
                            phoneNumberErrorDiv.textContent = '';
                            addressErrorDiv.textContent = '';

                            // Normalize and validate fullname
                            const normalizedFullname = normalizeFullname(fullname);
                            document.getElementById('receiverFullname').value = normalizedFullname;
                            if (fullname.trim() === '') {
                                isValid = false;
                                fullnameErrorDiv.textContent = 'Tên người nhận không được bỏ trống.';
                            } else if (!/^[\p{L}\s]+$/u.test(normalizedFullname)) {
                                isValid = false;
                                fullnameErrorDiv.textContent = 'Họ và tên chỉ được chứa chữ cái và khoảng trắng.';
                            }

                            // Validate email
                            if (email.trim() === '') {
                                isValid = false;
                                emailErrorDiv.textContent = 'Địa chỉ email người nhận không được bỏ trống.';
                            } else if (!/^[^\s@]+@[^\s@]+\.[^\s@]+$/.test(email)) {
                                isValid = false;
                                emailErrorDiv.textContent = 'Địa chỉ email không hợp lệ.';
                            }

                            // Validate phone number
                            if (phoneNumber.trim() === '') {
                                isValid = false;
                                phoneNumberErrorDiv.textContent = 'Số điện thoại người nhận không được bỏ trống.';
                            } else if (!/^0\d{9}$/.test(phoneNumber)) {
                                isValid = false;
                                phoneNumberErrorDiv.textContent = 'Số điện thoại phải có 10 chữ số và bắt đầu bằng số 0.';
                            }

                            // Validate address
                            if (address.trim() === '') {
                                isValid = false;
                                addressErrorDiv.textContent = 'Địa chỉ nhận hàng không được bỏ trống.';
                            }

                            // Recalculate total price if form is valid
                            if (isValid) {
                                const xhttp = new XMLHttpRequest();
                                xhttp.onload = function () {
                                    if (this.status === 200) {
                                        const responseParts = this.responseText.split('|');
                                        if (responseParts[0] === 'success') {
                                            alert(responseParts[1]); // Hiển thị thông báo thành công
                                            document.getElementById('submitButton').disabled = true; // Vô hiệu hóa nút "Đặt hàng"
                                            window.location.href = 'shop'; // Chuyển hướng đến trang cửa hàng
                                        } else if (responseParts[0] === 'error') {
                                            document.getElementById("errorFromServlet").textContent = responseParts[1]; // Hiển thị thông báo lỗi nếu cần
                                        }
                                    } else {
                                        console.error("Request failed with status:", this.status);
                                        document.getElementById("errorFromServlet").textContent = "Request failed.";
                                    }
                                };

                                xhttp.open("POST", "CreateOrder");
                                xhttp.setRequestHeader("Content-Type", "application/x-www-form-urlencoded");

                                var formData = new FormData(event.target);
                                var params = new URLSearchParams(formData).toString();
                                console.log(params);
                                xhttp.send(params);
                            }

                            return false; // Prevent the form from submitting normally
                        }

                        document.addEventListener('DOMContentLoaded', function () {
                            // JavaScript function to calculate the total price
                            function calculateTotalPrice() {
                                // Select all elements with class totalPrice
                                const totalPrices = document.querySelectorAll('.totalPrice');
                                let total = 0;

                                // Iterate over totalPrice elements and sum their values
                                totalPrices.forEach((priceElement) => {
                                    // Remove any formatting to ensure only the number is parsed
                                    const price = parseFloat(priceElement.textContent.replace(/[^\d.-]/g, ""));
                                    if (!isNaN(price)) {
                                        total += price;
                                    }
                                });

                                // Format the total price to VND
                                const formattedTotal = new Intl.NumberFormat('vi-VN', {style: 'currency', currency: 'VND'}).format(total);

                                // Update the total element with the calculated total
                                document.getElementById('total').textContent = formattedTotal;

                                total += 20000;
                                // Format the total price to VND
                                const formattedTotalBill = new Intl.NumberFormat('vi-VN', {style: 'currency', currency: 'VND'}).format(total);

                                // Update the total element with the calculated total
                                document.getElementById('totalBill').textContent = formattedTotalBill;
                            }

                            // Call the function to calculate the total price on page load
                            calculateTotalPrice();
                        }
                        );
        </script>

    </body>
</html>
