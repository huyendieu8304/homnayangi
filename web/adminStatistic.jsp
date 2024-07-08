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
        <title>Admin-Sale Statistic</title>

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
                        <h3 class="fw-bold mb-3">Thống kê doanh thu</h3>
                        <div class="row">
                            <div class="col-md-6">
                                <div class="card">
                                    <div class="card-header">
                                        <div class="card-title">Theo Tháng</div>
                                    </div>
                                    <div class="card-body">
                                        <div class="chart-container">
                                            <canvas id="lineChart"></canvas>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="col-md-6">
                                <div class="card">
                                    <div class="card-header">
                                        <div class="card-title">Theo danh mục</div>
                                    </div>
                                    <div class="card-body">
                                        <div class="chart-container">
                                            <canvas
                                                id="doughnutChart"
                                                style="width: 50%; height: 50%"
                                                ></canvas>
                                        </div>
                                    </div>
                                </div>
                            </div>

                            <div class="col-md-6" style="display: none">
                                <div class="card">
                                    <div class="card-header">
                                        <div class="card-title">Pie Chart</div>
                                    </div>
                                    <div class="card-body">
                                        <div class="chart-container">
                                            <canvas
                                                id="pieChart"
                                                style="width: 50%; height: 50%"
                                                ></canvas>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="col-md-6" style="display: none">
                                <div class="card">
                                    <div class="card-header">
                                        <div class="card-title">Bar Chart</div>
                                    </div>
                                    <div class="card-body">
                                        <div class="chart-container">
                                            <canvas id="barChart"></canvas>
                                        </div>
                                    </div>
                                </div>
                            </div>

                            <div class="col-md-6" style="display: none">
                                <div class="card">
                                    <div class="card-header">
                                        <div class="card-title">Radar Chart</div>
                                    </div>
                                    <div class="card-body">
                                        <div class="chart-container">
                                            <canvas id="radarChart"></canvas>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="col-md-6" style="display: none">
                                <div class="card">
                                    <div class="card-header">
                                        <div class="card-title">Bubble Chart</div>
                                    </div>
                                    <div class="card-body">
                                        <div class="chart-container">
                                            <canvas id="bubbleChart"></canvas>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="col-md-6" style="display: none">
                                <div class="card">
                                    <div class="card-header">
                                        <div class="card-title">Multiple Line Chart</div>
                                    </div>
                                    <div class="card-body">
                                        <div class="chart-container">
                                            <canvas id="multipleLineChart"></canvas>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="col-md-6" style="display: none">
                                <div class="card">
                                    <div class="card-header">
                                        <div class="card-title">Multiple Bar Chart</div>
                                    </div>
                                    <div class="card-body">
                                        <div class="chart-container">
                                            <canvas id="multipleBarChart"></canvas>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="col-md-12" style="display: none">
                                <div class="card">
                                    <div class="card-header">
                                        <div class="card-title">Chart with HTML Legends</div>
                                    </div>
                                    <div class="card-body">
                                        <div class="card-sub">
                                            Sometimes you need a very complex legend. In these cases,
                                            it makes sense to generate an HTML legend. Charts provide
                                            a generateLegend() method on their prototype that returns
                                            an HTML string for the legend.
                                        </div>
                                        <div class="chart-container">
                                            <canvas id="htmlLegendsChart"></canvas>
                                        </div>
                                        <div id="myChartLegend"></div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <!-- top 6 best seller start -->
                        <div class="row">
                            <div class="col-md-12">
                                <div class="card">
                                    <div class="card-header">
                                        <div class="d-flex align-items-center">
                                            <h4 class="card-title">6 sản phẩm bán chạy nhất</h4>

                                        </div>
                                    </div>

                                    <div class="card-body">

                                        <!-- table start -->
                                        <div class="table-responsive">
                                            <table
                                                id="add-row"
                                                class="display table table-striped table-hover"
                                                >
                                                <thead>
                                                    <tr>
                                                        <th>Mã sản phẩm</th>
                                                        <th>Tên sản phẩm</th>
                                                        <th>Tồn kho</th>
                                                        <th>Giá</th>

                                                    </tr>
                                                </thead>
                                                <tfoot>
                                                    <tr>
                                                        <th>Mã sản phẩm</th>
                                                        <th>Tên sản phẩm</th>
                                                        <th>Tồn kho</th>
                                                        <th>Giá</th>
                                                    </tr>
                                                </tfoot>
                                                <tbody>
                                                    <c:forEach items="${bestSellerList}" var="i">
                                                        <tr>
                                                            <td>${i.ingredientId}</td>
                                                            <td>${i.ingredientName}</td>
                                                            <td>${i.stockQuantity}</td>
                                                            <td>${i.price}</td>

                                                        </tr>
                                                    </c:forEach>

                                                </tbody>
                                            </table>
                                        </div>
                                        <!-- table end -->
                                    </div>
                                </div>
                            </div>
                        </div>
                        <!-- top 6 best seller start -->
                    </div>
                </div>
                <!-- main part manage end -->

            </div>
        </div>

        <!--   Core JS Files   -->
        <script src="js/core/jquery-3.7.1.min.js"></script>
        <script src="js/core/popper.min.js"></script>
        <script src="js/core/bootstrap.min.js"></script>  
        <!-- Chart JS -->
        <script src="js/plugin/chart.js/chart.min.js"></script>
        <!-- jQuery Scrollbar -->
        <script src="js/plugin/jquery-scrollbar/jquery.scrollbar.min.js"></script>
        <!-- Kaiadmin JS -->
        <script src="js/kaiadmin.min.js"></script>

        <script src="js/setting-demo2.js"></script>


        <script>
            var lineChart = document.getElementById("lineChart").getContext("2d"),
                    barChart = document.getElementById("barChart").getContext("2d"),
                    pieChart = document.getElementById("pieChart").getContext("2d"),
                    doughnutChart = document
                    .getElementById("doughnutChart")
                    .getContext("2d"),
                    radarChart = document.getElementById("radarChart").getContext("2d"),
                    bubbleChart = document.getElementById("bubbleChart").getContext("2d"),
                    multipleLineChart = document
                    .getElementById("multipleLineChart")
                    .getContext("2d"),
                    multipleBarChart = document
                    .getElementById("multipleBarChart")
                    .getContext("2d"),
                    htmlLegendsChart = document
                    .getElementById("htmlLegendsChart")
                    .getContext("2d");

            var monthlyRevenueData = ${monthlyRevenue};
            var myLineChart = new Chart(lineChart, {
                type: "line",
                data: {
                    labels: [
                        "Jan",
                        "Feb",
                        "Mar",
                        "Apr",
                        "May",
                        "Jun",
                        "Jul",
                        "Aug",
                        "Sep",
                        "Oct",
                        "Nov",
                        "Dec",
                    ],
                    datasets: [
                        {
                            label: "Active Users",
                            borderColor: "#1d7af3",
                            pointBorderColor: "#FFF",
                            pointBackgroundColor: "#1d7af3",
                            pointBorderWidth: 2,
                            pointHoverRadius: 4,
                            pointHoverBorderWidth: 1,
                            pointRadius: 4,
                            backgroundColor: "transparent",
                            fill: true,
                            borderWidth: 2,
                            data: monthlyRevenueData,
                        },
                    ],
                },
                options: {
                    responsive: true,
                    maintainAspectRatio: false,
                    legend: {
                        position: "bottom",
                        labels: {
                            padding: 10,
                            fontColor: "#1d7af3",
                        },
                    },
                    tooltips: {
                        bodySpacing: 4,
                        mode: "nearest",
                        intersect: 0,
                        position: "nearest",
                        xPadding: 10,
                        yPadding: 10,
                        caretPadding: 10,
                    },
                    layout: {
                        padding: {left: 15, right: 15, top: 15, bottom: 15},
                    },
                },
            });

            var categoryRevenueData = ${categoryRevenue};
            var myDoughnutChart = new Chart(doughnutChart, {
                type: "doughnut",
                data: {
                    datasets: [
                        {
                            data: categoryRevenueData,
                            backgroundColor: ["#f3545d", "#fdaf4b", "#1d7af3", "#2ca02c", "#9467bd", "#8c564b", "#e377c2", "#7f7f7f", "#bcbd22"],
                        },
                    ],

                    labels: ["Thịt", "Trứng", "Rau củ", "Gạo", "Bột - Đồ khô", "Trái cây", "Thủy hải sản", "Mì - Miến - Phở Cháo", "Gia vị"],
                },
                options: {
                    responsive: true,
                    maintainAspectRatio: false,
                    legend: {
                        position: "bottom",
                    },
                    layout: {
                        padding: {
                            left: 20,
                            right: 20,
                            top: 20,
                            bottom: 20,
                        },
                    },
                },
            });
        </script>
    </body>
</html>



