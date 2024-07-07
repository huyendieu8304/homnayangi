<%-- 
    Document   : adminAddAnIngredient
    Created on : Jul 6, 2024, 3:12:07 PM
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
                                <h3 class="fw-bold mb-3">Thêm 1 sản phẩm mới vào cửa hàng</h3>

                            </div>
                        </div>

                        <!-- Edit order form start -->                        
                        <div class="row" style="margin-top: 20px">
                            <div class="col-md-12">
                                <div class="card">
                                    <div class="card-body">
                                        <h3 class="fw-bold mb-3">Thêm 1 sản phẩm mới vào cửa hàng</h3>
                                        <!-- selected order -->
                                        <form action="AddANewIngredient" method="post" enctype="multipart/form-data">
                                            Tên sản phẩm: <input type="text" name="ingredientName"> <br>
                                            Danh mục: <select id="id" name="categoryId">
                                                <c:forEach var="cat" items="${catlist}">
                                                    <option value="${cat.categoryId}">${cat.categoryName}</option>
                                                </c:forEach>
                                            </select>
                                            <br>
                                            Đơn vị bán: <input type="text" name="unit"> <br>
                                            Định lượng/Đơn vị bán: <input type="text" name="quantityPerUnit"> <br>
                                            Giá bán: <input type="text" name="price"> <br>
                                            Số lượng trong kho: <input type="number" name="stockQuantity"> <br>
                                            Ảnh: <input type="file" id="id" accept="image/png,image/jpeg" name="image"> <br>
                                            Mô tả sản phẩm 
                                            <div id="ingredientDescriptionWrapper" style="margin-left: 20px">
                                                <div id="ingredientDescription">
                                                    Tiêu đề: &nbsp;  <input type="text" id="id" name="heading"> <br>
                                                    Nội dung: <textarea id="id" name="content" rows="5" cols="30"></textarea>
                                                    <button type="button" class="removeDescriptionBtn">Xóa mô tả</button>
                                                </div>

                                                <button id="addDescriptionBtn">Thêm mô tả</button>
                                            </div>
                                            <input type="submit" value="Thêm sản phẩm vào kho hàng">
                                        </form>
                                    </div>
                                </div>
                            </div>
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

        <script>
            document.addEventListener('DOMContentLoaded', function () {
                let descriptionCount = 1;

                // Sự kiện để thêm mô tả mới
                document.querySelector('#addDescriptionBtn').addEventListener('click', function (event) {
                    event.preventDefault(); // Ngăn chặn submit form

                    // Tạo một div mới cho phần mô tả
                    const newDescriptionDiv = document.createElement('div');
                    newDescriptionDiv.id = `ingredientDescription${descriptionCount}`;

                    // Tạo tiêu đề và nội dung mô tả, cùng với nút xóa
                    newDescriptionDiv.innerHTML = `
            <div id="ingredientDescription">
                Tiêu đề: &nbsp; <input type="text" name="heading"> <br>
                Nội dung: <textarea name="content" rows="5" cols="30"></textarea>
                <button type="button" class="removeDescriptionBtn">Xóa mô tả</button>
            </div>
        `;

                    // Thêm div mới vào ingredientDescriptionWrapper
                    document.getElementById('ingredientDescriptionWrapper').appendChild(newDescriptionDiv);

                    // Tăng số đếm mô tả
                    descriptionCount++;
                });

                // Sự kiện để xóa mô tả
                document.getElementById('ingredientDescriptionWrapper').addEventListener('click', function (event) {
                    if (event.target && event.target.classList.contains('removeDescriptionBtn')) {
                        event.preventDefault(); // Ngăn chặn submit form
                        // Xóa phần tử cha của nút bấm (tức là xóa div chứa nút này)
                        event.target.closest('#ingredientDescription').remove();
                    }
                });
            });

        </script>
    </body>
</html>


