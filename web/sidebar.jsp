<%-- 
    Document   : sidebar
    Created on : Jun 28, 2024, 11:38:15 AM
    Author     : BKC
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>

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
    </body>
</html>
