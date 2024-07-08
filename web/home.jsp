<%-- 
    Document   : home
    Created on : Jun 26, 2024, 12:36:15 AM
    Author     : BKC
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Trang chủ</title>
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

        <!-- Hero Start -->
        <div class="container-fluid py-5 mb-5 hero-header">
            <div class="container py-5">
                <div class="row g-5 align-items-center">
                    <div class="col-md-12 col-lg-7">
                        <h4 class="mb-3 text-secondary">100% sản phẩm chất lượng</h4>
                        <h1 class="mb-5 display-3 text-primary">Thực phẩm tươi sạch</h1>

                        <div class="position-relative mx-auto">
                            <form action="shop" method="get">
                                <input name="keyword" class="form-control border-2 border-secondary w-75 py-3 px-4 rounded-pill" type="text" placeholder="Tìm kiếm sản phẩm">
                                <button type="submit" class="btn btn-primary border-2 border-secondary py-3 px-4 position-absolute rounded-pill text-white h-100" style="top: 0; right: 25%;">Tìm</button>
                            </form>
                        </div>
                    </div>
                    <div class="col-md-12 col-lg-5">
                        <div id="carouselId" class="carousel slide position-relative" data-bs-ride="carousel">
                            <div class="carousel-inner" role="listbox">
                                <div class="carousel-item active rounded">
                                    <img src="img/hero-img-1.png" class="img-fluid w-100 h-100 bg-secondary rounded" alt="First slide">
                                    <a href="#" class="btn px-4 py-2 text-white rounded">Hoa quả</a>
                                </div>
                                <div class="carousel-item rounded">
                                    <img src="img/hero-img-2.jpg" class="img-fluid w-100 h-100 rounded" alt="Second slide">
                                    <a href="#" class="btn px-4 py-2 text-white rounded">Rau xanh</a>
                                </div>
                                <div class="carousel-item rounded">
                                    <img src="img/thitsach.jpg" class="img-fluid w-100 h-100 rounded" alt="Second slide">
                                    <a href="#" class="btn px-4 py-2 text-white rounded">Thịt sạch</a>
                                </div>
                            </div>
                            <button class="carousel-control-prev" type="button" data-bs-target="#carouselId" data-bs-slide="prev">
                                <span class="carousel-control-prev-icon" aria-hidden="true"></span>
                                <span class="visually-hidden">Previous</span>
                            </button>
                            <button class="carousel-control-next" type="button" data-bs-target="#carouselId" data-bs-slide="next">
                                <span class="carousel-control-next-icon" aria-hidden="true"></span>
                                <span class="visually-hidden">Next</span>
                            </button>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!-- Hero End -->

        <!-- Featurs Section Start -->
        <div class="container-fluid featurs py-5">
            <div class="container py-5">
                <div class="row g-4">
                    <div class="col-md-6 col-lg-3">
                        <div class="featurs-item text-center rounded bg-light p-4">
                            <div class="featurs-icon btn-square rounded-circle bg-secondary mb-5 mx-auto">
                                <i class="fas fa-car-side fa-3x text-white"></i>
                            </div>
                            <div class="featurs-content text-center">
                                <h5>Vận chuyển nhanh chóng</h5>
                                <p class="mb-0">shipper thân thiện nhiệt tình</p>
                            </div>
                        </div>
                    </div>
                    <div class="col-md-6 col-lg-3">
                        <div class="featurs-item text-center rounded bg-light p-4">
                            <div class="featurs-icon btn-square rounded-circle bg-secondary mb-5 mx-auto">
                                <i class="fas fa-user-shield fa-3x text-white"></i>
                            </div>
                            <div class="featurs-content text-center">
                                <h5>Thanh toán an toàn</h5>
                                <p class="mb-0">100% thanh toán được bảo mật</p>
                            </div>
                        </div>
                    </div>
                    <div class="col-md-6 col-lg-3">
                        <div class="featurs-item text-center rounded bg-light p-4">
                            <div class="featurs-icon btn-square rounded-circle bg-secondary mb-5 mx-auto">
                                <i class="fas fa-exchange-alt fa-3x text-white"></i>
                            </div>
                            <div class="featurs-content text-center">
                                <h5>Khiếu nại hoàn tiền</h5>
                                <p class="mb-0">giải quyết khiếu nại nhanh chóng</p>
                            </div>
                        </div>
                    </div>
                    <div class="col-md-6 col-lg-3">
                        <div class="featurs-item text-center rounded bg-light p-4">
                            <div class="featurs-icon btn-square rounded-circle bg-secondary mb-5 mx-auto">
                                <i class="fa fa-phone-alt fa-3x text-white"></i>
                            </div>
                            <div class="featurs-content text-center">
                                <h5>Hỗ trợ 24/7</h5>
                                <p class="mb-0">hỗ trợ nhanh chóng mọi lúc</p>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!-- Featurs Section End -->

        <!-- Fruits Shop Start-->
        <div class="container-fluid fruite py-5">
            <div class="container py-5">
                <div class="tab-class text-center">
                    <div class="row g-4">
                        <div class="col-lg-4 text-start">
                            <h1>Các sản phẩm của chúng tôi</h1>
                        </div>
                        <div class="col-lg-8 text-end">
                            <ul class="nav nav-pills d-inline-flex text-center mb-5">
                                <li class="nav-item">
                                    <a class="d-flex py-2 m-2 bg-light rounded-pill" data-bs-toggle="pill" href="#tab-2">
                                        <span class="text-dark" style="width: 130px;">Rau củ</span>
                                    </a>
                                </li>
                                <li class="nav-item">
                                    <a class="d-flex m-2 py-2 bg-light rounded-pill" data-bs-toggle="pill" href="#tab-3">
                                        <span class="text-dark" style="width: 130px;">Trái cây</span>
                                    </a>
                                </li>
                                <li class="nav-item">
                                    <a class="d-flex m-2 py-2 bg-light rounded-pill" data-bs-toggle="pill" href="#tab-4">
                                        <span class="text-dark" style="width: 130px;">Thịt sạch</span>
                                    </a>
                                </li>
                                <li class="nav-item">
                                    <a class="d-flex m-2 py-2 bg-light rounded-pill"  href="shop">
                                        <span class="text-dark" style="width: 130px;">Tìm hiểu thêm</span>
                                    </a>
                                </li>
                            </ul>
                        </div>
                    </div>
                    <div class="tab-content">
                        <div id="tab-2" class="tab-pane fade show p-0 active">
                            <div class="row g-4">
                                <div class="col-lg-12">
                                    <div class="row g-4">
                                        <c:set var="vegies" value="${requestScope.vegielist}"></c:set>
                                        <c:forEach var="vegie" items="${vegies}">
                                            <div class="col-md-6 col-lg-4 col-xl-3">
                                                <div class="rounded position-relative fruite-item">
                                                    <div class="fruite-img">
                                                        <img src="${vegie.imageUrl}" class="img-fluid w-100 rounded-top" 
                                                             style="width: 500px; height: 300px" alt="">
                                                    </div>
                                                    <div class="text-white bg-secondary px-3 py-1 rounded position-absolute"
                                                         style="top: 10px; left: 10px;">Rau củ</div>
                                                    <div class="p-4 border border-secondary border-top-0 rounded-bottom">
                                                        <a href="ingredientDetail?id=${vegie.getIngredientId()}">
                                                            <h4>${vegie.ingredientName}</h4>
                                                        </a>
                                                        <p class="text-dark fs-5 ">${vegie.getQuantityPerUnitFormatted()} ${vegie.getUnit()}</p>
                                                        <div class="d-flex justify-content-between flex-lg-wrap">
                                                            <p class="text-dark fs-5 fw-bold">${vegie.getFormattedPrice()} đ</p>
                                                            <a href="AddToCart?quantity=1&ingredientId=${vegie.getIngredientId()}" 
                                                               class="btn border border-secondary rounded-pill px-3 py-1 mb-4 text-primary">
                                                                <i class="fa fa-shopping-bag me-2 text-primary"></i> 
                                                                Thêm vào giỏ
                                                            </a>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </c:forEach>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div id="tab-3" class="tab-pane fade show p-0">
                            <div class="row g-4">
                                <div class="col-lg-12">
                                    <div class="row g-4">
                                        <c:set var="fruits" value="${requestScope.fruitlist}"></c:set>
                                        <c:forEach var="fruit" items="${fruits}">
                                            <div class="col-md-6 col-lg-4 col-xl-3">
                                                <div class="rounded position-relative fruite-item">
                                                    <div class="fruite-img">
                                                        <img src="${fruit.imageUrl}" class="img-fluid w-100 rounded-top" style="width: 500px; height: 300px" alt="">
                                                    </div>
                                                    <div class="text-white bg-secondary px-3 py-1 rounded position-absolute" style="top: 10px; left: 10px;">Rau củ</div>
                                                    <div class="p-4 border border-secondary border-top-0 rounded-bottom">
                                                        <a href="ingredientDetail?id=${fruit.getIngredientId()}">
                                                            <h4>${fruit.ingredientName}</h4>
                                                        </a>
                                                        <p class="text-dark fs-5 ">${fruit.getQuantityPerUnitFormatted()} ${fruit.getUnit()}</p>
                                                        <div class="d-flex justify-content-between flex-lg-wrap">
                                                            <p class="text-dark fs-5 fw-bold">${fruit.getFormattedPrice()} đ</p>
                                                            <a href="AddToCart?quantity=1&ingredientId=${fruit.getIngredientId()}" class="btn border border-secondary rounded-pill px-3 py-1 mb-4 text-primary">
                                                                <i class="fa fa-shopping-bag me-2 text-primary"></i> 
                                                                Thêm vào giỏ</a>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </c:forEach>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div id="tab-4" class="tab-pane fade show p-0">
                            <div class="row g-4">
                                <div class="col-lg-12">
                                    <div class="row g-4">
                                        <c:set var="meats" value="${requestScope.meatlist}"></c:set>
                                        <c:forEach var="meat" items="${meats}">
                                            <div class="col-md-6 col-lg-4 col-xl-3">
                                                <div class="rounded position-relative fruite-item">
                                                    <div class="fruite-img">
                                                        <img src="${meat.imageUrl}" class="img-fluid w-100 rounded-top" style="width: 500px; height: 300px" alt="">
                                                    </div>
                                                    <div class="text-white bg-secondary px-3 py-1 rounded position-absolute" style="top: 10px; left: 10px;">Rau củ</div>
                                                    <div class="p-4 border border-secondary border-top-0 rounded-bottom">
                                                        <a href="ingredientDetail?id=${meat.getIngredientId()}">
                                                            <h4>${meat.ingredientName}</h4>
                                                        </a>
                                                        <p class="text-dark fs-5 ">${meat.getQuantityPerUnitFormatted()} ${meat.getUnit()}</p>
                                                        <div class="d-flex justify-content-between flex-lg-wrap">
                                                            <p class="text-dark fs-5 fw-bold">${meat.getFormattedPrice()} đ</p>
                                                            <a href="AddToCart?quantity=1&ingredientId=${meat.getIngredientId()}" 
                                                               class="btn border border-secondary rounded-pill px-3 py-1 mb-4 text-primary">
                                                                <i class="fa fa-shopping-bag me-2 text-primary"></i> 
                                                                Thêm vào giỏ
                                                            </a>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </c:forEach>

                                    </div>
                                </div>
                            </div>
                        </div>
                        <div id="tab-5" class="tab-pane fade show p-0">
                            <div class="row g-4">
                                <div class="col-lg-12">
                                    <div class="row g-4">
                                        <c:set var="vegies" value="${requestScope.vegielist}"></c:set>
                                        <c:forEach var="vegie" items="${vegies}">
                                            <div class="col-md-6 col-lg-4 col-xl-3">
                                                <div class="rounded position-relative fruite-item">
                                                    <div class="fruite-img">
                                                        <img src="${vegie.imageUrl}" class="img-fluid w-100 rounded-top" style="width: 500px; height: 300px" alt="">
                                                    </div>
                                                    <div class="text-white bg-secondary px-3 py-1 rounded position-absolute" style="top: 10px; left: 10px;">Rau củ</div>
                                                    <div class="p-4 border border-secondary border-top-0 rounded-bottom">
                                                        <a href="ingredientDetail?id=${ingredient.getIngredientId()}">
                                                            <h4>${vegie.ingredientName}</h4>
                                                        </a>
                                                        <p class="text-dark fs-5 ">${vegie.getQuantityPerUnitFormatted()} ${vegie.getUnit()}</p>
                                                        <div class="d-flex justify-content-between flex-lg-wrap">
                                                            <p class="text-dark fs-5 fw-bold">${vegie.getFormattedPrice()} đ</p>
                                                            <a href="AddToCart?quantity=1&ingredientId=${ingredient.getIngredientId()}" class="btn border border-secondary rounded-pill px-3 py-1 mb-4 text-primary">
                                                                <i class="fa fa-shopping-bag me-2 text-primary"></i>
                                                                Thêm vào giỏ</a>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </c:forEach>

                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>      
            </div>
        </div>
        <!-- Fruits Shop End-->

        <!-- Bestsaler Product Start -->
        <div class="container-fluid py-5">
            <div class="container py-5">
                <div class="text-center mx-auto mb-5" style="max-width: 700px;">
                    <h1 class="display-4">Sản phẩm bán chạy</h1>
                    <p>Những mặt hàng được khách hàng ưa thích</p>
                </div>
                <div class="row g-4">
                    <!-- 6 cái -->
                    <!-- single best seller ver 1 circle start -->
                    <c:set var="bestSeller" value="${requestScope.bestSellerList}"></c:set>
                    <c:forEach items="${bestSeller}" var="b">
                        <div class="col-lg-6 col-xl-4">
                            <div class="p-4 rounded bg-light">
                                <div class="row align-items-center">
                                    <div class="col-6">
                                        <img src="${b.imageUrl}" class="img-fluid rounded-circle w-100" alt="">
                                    </div>
                                    <div class="col-6">
                                        <a href="ingredientDetail?id=${b.getIngredientId()}" class="h5">${b.ingredientName}</a>
                                        <div class="d-flex my-3">
                                            <i class="fas fa-star text-primary"></i>
                                            <i class="fas fa-star text-primary"></i>
                                            <i class="fas fa-star text-primary"></i>
                                            <i class="fas fa-star text-primary"></i>
                                            <i class="fas fa-star"></i>
                                        </div>
                                        <h4 class="mb-3">${b.getFormattedPrice()} đ</h4>
                                        <a href="AddToCart?quantity=1&ingredientId=${b.getIngredientId()}" 
                                           class="btn border border-secondary rounded-pill px-3 text-primary">
                                            <i class="fa fa-shopping-bag me-2 text-primary"></i> Thêm vào giỏ
                                        </a>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </c:forEach>
                    <!-- single best seller ver 1 circle end -->
                </div>
            </div>
        </div>
        <!-- Bestsaler Product End -->

        <!-- Fact Start -->
        <div class="container-fluid py-5">
            <div class="container">
                <div class="bg-light p-5 rounded">
                    <div class="row g-4 justify-content-center">
                        <div class="col-md-6 col-lg-6 col-xl-3">
                            <div class="counter bg-white rounded p-5">
                                <i class="fa fa-users text-secondary"></i>
                                <h1>1963</h1>
                                <h4>Khách hàng hài lòng</h4>
                            </div>
                        </div>
                        <div class="col-md-6 col-lg-6 col-xl-3">
                            <div class="counter bg-white rounded p-5">
                                <i class="fa fa-users text-secondary"></i>
                                <h1>99%</h1>
                                <h4>Đánh giá 5 sao</h4>
                            </div>
                        </div>
                        <div class="col-md-6 col-lg-6 col-xl-3">
                            <div class="counter bg-white rounded p-5">
                                <i class="fa fa-users text-secondary"></i>
                                <h1>33</h1>
                                <h4>Chứng chỉ về chất lượng</h4>
                            </div>
                        </div>
                        <div class="col-md-6 col-lg-6 col-xl-3">
                            <div class="counter bg-white rounded p-5">
                                <i class="fa fa-users text-secondary"></i>
                                <h1>125</h1>
                                <h4>Sản phẩm sẵn có</h4>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!-- Fact Start -->

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
