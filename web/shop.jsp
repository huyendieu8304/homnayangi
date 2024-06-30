<%-- 
    Document   : shop
    Created on : Jun 25, 2024, 12:23:27 PM
    Author     : BKC
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Cửa hàng</title>

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

        <script>
            function addParameterToCurrentUrl(event, paraName, value) {
                // Ngăn chặn hành động mặc định của liên kết
                event.preventDefault();

                // Lấy URL hiện tại
                let currentUrl = new URL(window.location.href);

                // Cập nhật hoặc thêm parameter vào URL
                currentUrl.searchParams.set(paraName, value);

                // Chuyển hướng đến URL mới
                window.location.href = currentUrl.toString();
            }
        </script>

    </head>
    <body>
        <%@include file="header.jsp" %>

        <!-- Single Page Header start -->
        <div class="container-fluid page-header py-5">
            <h1 class="text-center text-white display-6">Cửa hàng</h1>
            <ol class="breadcrumb justify-content-center mb-0">
                <li class="breadcrumb-item"><a href="home">Trang chủ</a></li>
                <li class="breadcrumb-item active text-white">Cửa hàng</li>
            </ol>
        </div>
        <!-- Single Page Header End -->

        <!-- Fruits Shop Start-->
        <div class="container-fluid fruite py-5">
            <div class="container py-5">
                <h1 class="mb-4">Cửa hàng thực phẩm</h1>
                <div class="row g-4">
                    <div class="col-lg-12">
                        <!-- main part -->
                        <div class="row g-4">
                            <!-- side bar start -->
                            <div class="col-lg-3">
                                <div class="row g-4">
                                    <div class="col-lg-12"> <!-- categories -->
                                        <div class="mb-3">
                                            <h4>Danh mục</h4>
                                            <ul class="list-unstyled fruite-categorie">
                                                <!-- single category start-->
                                                <c:set var="categories" value="${requestScope.catlist}"></c:set>
                                                <c:set var="subcategories" value="${requestScope.subcatlist}"></c:set>
                                                <c:forEach var="cat" items="${categories}">
                                                    <li>
                                                        <div class="d-flex justify-content-between fruite-name">
                                                            <a href="shop?categoryId=${cat.categoryId}"><i class="fas fa-apple-alt me-2"></i>${cat.categoryName}</a>
                                                        </div>
                                                        <c:forEach var="subcat" items="${subcategories}">
                                                            <c:if test="${subcat.getCategoryId() == cat.getCategoryId()}">
                                                                <div class="d-flex justify-content-between fruite-name">
                                                                    <a href="shop?subcategoryId=${subcat.getSubcategoryId()}">
                                                                        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 
                                                                        ${subcat.getSubcategoryName()}
                                                                    </a>
                                                                </div>
                                                            </c:if>
                                                        </c:forEach>
                                                    </li>
                                                </c:forEach>
                                                <!-- single category end-->

                                            </ul>
                                        </div>
                                    </div>

                                    <!-- <div class="col-lg-12">
                                        <div class="mb-3">
                                            <h4>Additional</h4>
                                            <div class="mb-2">
                                                <input type="radio" class="me-2" id="Categories-1" name="Categories-1" value="Beverages">
                                                <label for="Categories-1"> Organic</label>
                                            </div>
                                            <div class="mb-2">
                                                <input type="radio" class="me-2" id="Categories-2" name="Categories-1" value="Beverages">
                                                <label for="Categories-2"> Fresh</label>
                                            </div>
                                            <div class="mb-2">
                                                <input type="radio" class="me-2" id="Categories-3" name="Categories-1" value="Beverages">
                                                <label for="Categories-3"> Sales</label>
                                            </div>
                                            <div class="mb-2">
                                                <input type="radio" class="me-2" id="Categories-4" name="Categories-1" value="Beverages">
                                                <label for="Categories-4"> Discount</label>
                                            </div>
                                            <div class="mb-2">
                                                <input type="radio" class="me-2" id="Categories-5" name="Categories-1" value="Beverages">
                                                <label for="Categories-5"> Expired</label>
                                            </div>
                                        </div>
                                    </div> -->
                                    <!-- featured products start-->
                                    <!-- <div class="col-lg-12">
                                        <h4 class="mb-3">Featured products</h4>
                                    <!-- single featured product start -->
                                    <!--<div class="d-flex align-items-center justify-content-start">
                                        <div class="rounded me-4" style="width: 100px; height: 100px;">
                                            <img src="img/featur-1.jpg" class="img-fluid rounded" alt="">
                                        </div>
                                        <div>
                                            <h6 class="mb-2">Big Banana</h6>
                                            <div class="d-flex mb-2">
                                                <i class="fa fa-star text-secondary"></i>
                                                <i class="fa fa-star text-secondary"></i>
                                                <i class="fa fa-star text-secondary"></i>
                                                <i class="fa fa-star text-secondary"></i>
                                                <i class="fa fa-star"></i>
                                            </div>
                                            <div class="d-flex mb-2">
                                                <h5 class="fw-bold me-2">2.99 $</h5>
                                                <h5 class="text-danger text-decoration-line-through">4.11 $</h5>
                                            </div>
                                        </div>
                                    </div>-->
                                    <!-- single featured product end -->
                                    <!-- button-->
                                    <!--<div class="d-flex justify-content-center my-4">
                                        <a href="#" class="btn border border-secondary px-4 py-3 rounded-pill text-primary w-100">Vew More</a>
                                    </div>
                                </div> -->
                                    <!--banner start-->    
                                    <!-- <div class="col-lg-12">
                                        <div class="position-relative">
                                            <img src="img/banner-fruits.jpg" class="img-fluid w-100 rounded" alt="">
                                            <div class="position-absolute" style="top: 50%; right: 10px; transform: translateY(-50%);">
                                                <h3 class="text-secondary fw-bold">Fresh <br> Fruits <br> Banner</h3>
                                            </div>
                                        </div>
                                    </div> -->
                                    <!--banner end-->
                                </div>
                            </div>
                            <!-- side bar end -->

                            <!-- products start -->
                            <div class="col-lg-9">
                                <div class="row g-4 justify-content-center">
                                    <p>filter search</p>
                                </div>
                                <div class="row g-4 justify-content-center">
                                    <c:forEach var="ingredient" items="${requestScope.list}">
                                        <!-- single products start -->
                                        <div class="col-md-6 col-lg-6 col-xl-4">
                                            <div class="rounded position-relative fruite-item">
                                                <div class="fruite-img">
                                                    <img src="${ingredient.imageUrl}" class="img-fluid w-100 rounded-top" alt="" style="width: 500px; height: 400px">
                                                </div>
                                                <c:forEach var="cat" items="${categories}">
                                                    <c:if test="${ingredient.categoryId == cat.categoryId}">
                                                        <div class="text-white bg-secondary px-3 py-1 rounded position-absolute" style="top: 10px; left: 10px;">${cat.categoryName}</div>
                                                    </c:if>
                                                </c:forEach>
                                                <div class="p-4 border border-secondary border-top-0 rounded-bottom">
                                                    <a href="ingredientDetail?id=${ingredient.getIngredientId()}">
                                                        <h4>${ingredient.ingredientName}</h4>
                                                    </a>
                                                    <p class="text-dark fs-5 ">${ingredient.getQuantityPerUnitFormatted()} ${ingredient.getUnit()}</p>
                                                    <div class="d-flex justify-content-between flex-lg-wrap">
                                                        <p class="text-dark fs-5 fw-bold">${ingredient.getFormattedPrice()} đ</p>
                                                        <a href="AddToCart?quantity=1&ingredientId=${ingredient.getIngredientId()}" 
                                                            class="btn border border-secondary rounded-pill px-3 py-1 mb-4 text-primary">
                                                            <i class="fa fa-shopping-bag me-2 text-primary"></i>
                                                            Thêm vào giỏ
                                                        </a>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </c:forEach>
                                    <!-- single products start -->

                                    <!-- index of product's -->
                                    <div class="col-12">
                                        <c:set var="currenIndex" value="${requestScope.currentIndex}"></c:set>
                                            <div class="pagination d-flex justify-content-center mt-5">
                                            <c:if test="${currentIndex > 1}">
                                                <a href="#" class="rounded" onclick="addParameterToCurrentUrl(event, 'index', '${(currenIndex - 1)}')">&laquo;</a>

                                            </c:if>
                                            <c:forEach begin="1" end="${endIndex}" var="i">
                                                <a href="#" class="${(currentIndex == i) ? 'active rounded' : 'rounded'}" onclick="addParameterToCurrentUrl(event, 'index', '${i}')">${i}</a>

                                            </c:forEach>
                                            <c:if test="${currentIndex < endIndex}">
                                                <a href="#" class="rounded" onclick="addParameterToCurrentUrl(event, 'index', '${(currenIndex + 1)}')">&raquo;</a>

                                            </c:if>
                                        </div>
                                    </div>
                                    <!-- index of product's end -->
                                </div>
                            </div>
                            <!-- products end -->
                        </div>
                        <!-- main part end -->
                    </div>
                </div>
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
