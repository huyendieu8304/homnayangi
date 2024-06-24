<%-- 
    Document   : ingredientDetail
    Created on : Jun 23, 2024, 9:25:25 PM
    Author     : BKC
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Chi tiết sản phẩm</title>

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
            <h1 class="text-center text-white display-6">Chi tiết sản phẩm</h1>
            <ol class="breadcrumb justify-content-center mb-0">
                <!--sửa lại link cửa hàng-->
                <li class="breadcrumb-item"><a href="#">Cửa hàng</a></li>
                <li class="breadcrumb-item active text-white">Chi tiết sản phẩm</li>
            </ol>
        </div>
        <!-- Single Page Header End -->

        <!-- Single Product Start -->
        <c:set var="ingredient" value="${requestScope.ingredient}" ></c:set>
        <c:set var="ingredientDescriptions" value="${requestScope.ingredientDescriptions}" ></c:set>
        <div class="container-fluid py-5 mt-5">
            <div class="container py-5">
                    <div class="row g-4 mb-5">
                        <div class="col-lg-8 col-xl-9">
                            <div class="row g-4">
                                <!-- image -->
                                <div class="col-lg-6">
                                    <div class="border rounded">
                                        <a href="#">
                                            <img src="${ingredient.getImageUrl()}" class="img-fluid rounded" alt="Image of the ingredient">
                                    </a>
                                </div>
                            </div>
                            <div class="col-lg-6">
                                <h4 class="fw-bold mb-3">${ingredient.getIngredientName()}</h4>
                                <p class="mb-3">${ingredient.getQuantityPerUnitFormatted()} ${ingredient.getUnit()}</p>
                                <p class="mb-3">Danh mục: ${requestScope.categoryName}&#92; ${requestScope.subcategoryName}</p>
                                <h5 class="fw-bold mb-3">${ingredient.getFormattedPrice()} đ</h5>
                                <div class="d-flex mb-4">
                                    <i class="fa fa-star text-secondary"></i>
                                    <i class="fa fa-star text-secondary"></i>
                                    <i class="fa fa-star text-secondary"></i>
                                    <i class="fa fa-star text-secondary"></i>
                                    <i class="fa fa-star"></i>
                                </div>
                                <p class="mb-4">${ingredientDescriptions[0].getContent()}</p>
                                <div class="input-group quantity mb-5" style="width: 100px;">
                                    <div class="input-group-btn">
                                        <button class="btn btn-sm btn-minus rounded-circle bg-light border" >
                                            <i class="fa fa-minus"></i>
                                        </button>
                                    </div>
                                    <input type="text" class="form-control form-control-sm text-center border-0" value="1">
                                    <div class="input-group-btn">
                                        <button class="btn btn-sm btn-plus rounded-circle bg-light border">
                                            <i class="fa fa-plus"></i>
                                        </button>
                                    </div>
                                </div>
                                <a href="#" class="btn border border-secondary rounded-pill px-4 py-2 mb-4 text-primary"><i class="fa fa-shopping-bag me-2 text-primary"></i> Add to cart</a>
                            </div>

                            <!-- ingredient description start -->
                            <div class="col-lg-12">
                                <nav>
                                    <div class="nav nav-tabs mb-3">
                                        <button class="nav-link active border-white border-bottom-0" type="button" role="tab"
                                                id="nav-about-tab" data-bs-toggle="tab" data-bs-target="#nav-about"
                                                aria-controls="nav-about" aria-selected="true">Mô tả sản phẩm</button>
                                        
                                    </div>
                                </nav>
                                <div class="tab-content mb-5">
                                    <div class="tab-pane active" id="nav-about" role="tabpanel" aria-labelledby="nav-about-tab">
                                        <c:forEach var="des" items="${ingredientDescriptions}">
                                            <h6>${des.getHeading()}</h6>
                                            <p>${des.getContent()}</p>
                                        </c:forEach>
                                    </div>
                                </div>
                            </div>
                            <!-- ingredient description start -->
                        </div>
                    </div>

                    <!-- side bar start -->
                    <div class="col-lg-4 col-xl-3">
                        <div class="row g-4 fruite">
                            <!-- side bar - category start -->
                            <div class="col-lg-12">
                                <div class="input-group w-100 mx-auto d-flex mb-4">
                                    <input type="search" class="form-control p-3" placeholder="keywords" aria-describedby="search-icon-1">
                                    <span id="search-icon-1" class="input-group-text p-3"><i class="fa fa-search"></i></span>
                                </div>
                                <div class="mb-4">
                                    <h4>Categories</h4>
                                    <ul class="list-unstyled fruite-categorie">
                                        <li>
                                            <div class="d-flex justify-content-between fruite-name">
                                                <a href="#"><i class="fas fa-apple-alt me-2"></i>Apples</a>
                                                <span>(3)</span>
                                            </div>
                                        </li>
                                        <li>
                                            <div class="d-flex justify-content-between fruite-name">
                                                <a href="#"><i class="fas fa-apple-alt me-2"></i>Oranges</a>
                                                <span>(5)</span>
                                            </div>
                                        </li>
                                        <li>
                                            <div class="d-flex justify-content-between fruite-name">
                                                <a href="#"><i class="fas fa-apple-alt me-2"></i>Strawbery</a>
                                                <span>(2)</span>
                                            </div>
                                        </li>
                                        <li>
                                            <div class="d-flex justify-content-between fruite-name">
                                                <a href="#"><i class="fas fa-apple-alt me-2"></i>Banana</a>
                                                <span>(8)</span>
                                            </div>
                                        </li>
                                        <li>
                                            <div class="d-flex justify-content-between fruite-name">
                                                <a href="#"><i class="fas fa-apple-alt me-2"></i>Pumpkin</a>
                                                <span>(5)</span>
                                            </div>
                                        </li>
                                    </ul>
                                </div>
                            </div>
                            <!-- side bar - category end -->

                            <!-- side bar - feature products start -->
                            <div class="col-lg-12">
                                <h4 class="mb-4">Featured products</h4>
                                <div class="d-flex align-items-center justify-content-start">
                                    <div class="rounded" style="width: 100px; height: 100px;">
                                        <img src="img/featur-1.jpg" class="img-fluid rounded" alt="Image">
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
                                </div>
                                <div class="d-flex align-items-center justify-content-start">
                                    <div class="rounded" style="width: 100px; height: 100px;">
                                        <img src="img/featur-2.jpg" class="img-fluid rounded" alt="">
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
                                </div>
                                <div class="d-flex align-items-center justify-content-start">
                                    <div class="rounded" style="width: 100px; height: 100px;">
                                        <img src="img/featur-3.jpg" class="img-fluid rounded" alt="">
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
                                </div>
                                <div class="d-flex align-items-center justify-content-start">
                                    <div class="rounded me-4" style="width: 100px; height: 100px;">
                                        <img src="img/vegetable-item-4.jpg" class="img-fluid rounded" alt="">
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
                                </div>
                                <div class="d-flex align-items-center justify-content-start">
                                    <div class="rounded me-4" style="width: 100px; height: 100px;">
                                        <img src="img/vegetable-item-5.jpg" class="img-fluid rounded" alt="">
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
                                </div>
                                <div class="d-flex align-items-center justify-content-start">
                                    <div class="rounded me-4" style="width: 100px; height: 100px;">
                                        <img src="img/vegetable-item-6.jpg" class="img-fluid rounded" alt="">
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
                                </div>
                                <div class="d-flex justify-content-center my-4">
                                    <a href="#" class="btn border border-secondary px-4 py-3 rounded-pill text-primary w-100">Vew More</a>
                                </div>
                            </div>
                            <!-- side bar - feature products end -->
                            <!--                            <div class="col-lg-12">
                                                            <div class="position-relative">
                                                                <img src="img/banner-fruits.jpg" class="img-fluid w-100 rounded" alt="">
                                                                <div class="position-absolute" style="top: 50%; right: 10px; transform: translateY(-50%);">
                                                                    <h3 class="text-secondary fw-bold">Fresh <br> Fruits <br> Banner</h3>
                                                                </div>
                                                            </div>
                                                        </div>-->
                        </div>
                    </div>
                    <!-- side bar start -->
                </div>

                <!-- related products start -->
                <c:set var="relatedIngredients" value="${requestScope.relatedIngredients}"></c:set>
                    <h1 class="fw-bold mb-0">Sản phẩm liên quan</h1>
                    <div class="vesitable">
                        <div class="owl-carousel vegetable-carousel justify-content-center">
                        <c:forEach var="relatedIngredient" items="${relatedIngredients}">
                            <!-- a related product start-->
                                <div class="border border-primary rounded position-relative vesitable-item">
                                    <div class="vesitable-img">
                                        <img src="${relatedIngredient.getImageUrl()}" class="img-fluid w-100 rounded-top" style="width: 500px; height: 400px" alt="">
                                    </div>
                                    <div class="text-white bg-primary px-3 py-1 rounded position-absolute" style="top: 10px; right: 10px;">${requestScope.categoryName}</div>
                                    <div class="p-4 pb-0 rounded-bottom">
                                        <a href="ingredientDetail?id=${relatedIngredient.getIngredientId()}">
                                            <h4>${relatedIngredient.getIngredientName()}</h4>
                                        </a>
                                        <p class="text-dark fs-5 ">${relatedIngredient.getQuantityPerUnitFormatted()} ${relatedIngredient.getUnit()}</p>
                                        <div class="d-flex justify-content-between flex-lg-wrap">
                                            <p class="text-dark fs-5 fw-bold">${relatedIngredient.getFormattedPrice()} đ</p>
                                            <a href="#" class="btn border border-secondary rounded-pill px-3 py-1 mb-4 text-primary"><i class="fa fa-shopping-bag me-2 text-primary"></i> Add to cart</a>
                                        </div>
                                    </div>
                                </div>
                            <!-- a related product end-->
                        </c:forEach>    
                    </div>
                </div>
                <!-- related products end -->


            </div>
        </div>
        <!-- Single Product End -->

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
