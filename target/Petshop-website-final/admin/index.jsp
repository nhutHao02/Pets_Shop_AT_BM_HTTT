<%@ page import="vn.edu.hcmuaf.fit.beans.UserAccount" %>
<%@ page import="vn.edu.hcmuaf.fit.services.StatisticalService" %>
<%@ page import="vn.edu.hcmuaf.fit.beans.Product" %>
<%@ page import="vn.edu.hcmuaf.fit.beans.Orders" %>
<%@ page import="java.util.*" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.text.NumberFormat" %>
<!DOCTYPE html>
<html lang="en">
<script src="https://cdn.jsdelivr.net/npm/chart.js"></script>

<head>
    <title>Quản lý Petshop</title>
    <!-- HTML5 Shim and Respond.js IE11 support of HTML5 elements and media queries -->
    <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
    <!--[if lt IE 11]>
    <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
    <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.2.0/css/all.min.css" integrity="sha512-xh6O/CkQoPOWDdYTDqeRdPCVd1SpvCA9XXcUnZS2FmJNp1coAFzvtCN9BmamE+4aHK8yyUHUSCcJHgXloTyT2A==" crossorigin="anonymous" referrerpolicy="no-referrer" />
<![endif]-->
    <!-- Meta -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, user-scalable=0, minimal-ui">
    <meta http-equiv="X-UA-Compatible" content="IE=edge"/>
    <meta name="description"
          content="DashboardKit is made using Bootstrap 5 design framework. Download the free admin template & use it for your project.">
    <meta name="keywords"
          content="DashboardKit, Dashboard Kit, Dashboard UI Kit, Bootstrap 5, Admin Template, Admin Dashboard, CRM, CMS, Free Bootstrap Admin Template">
    <meta name="author" content="DashboardKit ">


    <!-- Favicon icon -->
    <link rel="icon" href="assets/images/favicon.svg" type="image/x-icon">

    <!-- font css -->
    <link rel="stylesheet" href="assets/fonts/feather.css">
    <link rel="stylesheet" href="assets/fonts/fontawesome.css">
    <link rel="stylesheet" href="assets/fonts/material.css">

    <!-- vendor css -->
    <link rel="stylesheet" href="assets/css/style.css" id="main-style-link">
</head>
<% UserAccount user = (UserAccount) session.getAttribute("user");
    NumberFormat format = NumberFormat.getInstance(new Locale("vn", "VN"));
%>
<%
    //----------------------Kiểm tra thử đăng nhập hay chưa--------------------//
    if (request.getSession().getAttribute("admin") == null) {
        // Sendredirect tới login
        response.sendRedirect("login.jsp");

    }
%>

<body class="">
<!-- [ Pre-loader ] start -->
<div class="loader-bg">
    <div class="loader-track">
        <div class="loader-fill"></div>
    </div>
</div>
<!-- [ Pre-loader ] End -->
<!-- [ Mobile header ] start -->
<div class="pc-mob-header pc-header">
    <div class="pcm-logo">
        <img src="assets/images/logo.png" alt="" class="logo logo-lg">
    </div>

    <%--    <div class="pcm-toolbar">--%>
    <%--        <a href="#!" class="pc-head-link" id="mobile-collapse">--%>
    <%--            <div class="hamburger hamburger--arrowturn">--%>
    <%--                <div class="hamburger-box">--%>
    <%--                    <div class="hamburger-inner"></div>--%>
    <%--                </div>--%>

<%--    <div class="pcm-toolbar">--%>
<%--        <a href="#!" class="pc-head-link" id="mobile-collapse">--%>
<%--            <div class="hamburger hamburger--arrowturn">--%>
<%--                <div class="hamburger-box">--%>
<%--                    <div class="hamburger-inner"></div>--%>
<%--                </div>--%>

	<!-- [ Pre-loader ] start -->
	<div class="loader-bg">
		<div class="loader-track">
			<div class="loader-fill"></div>
		</div>
	</div>
	<!-- [ Pre-loader ] End -->
	<!-- [ Mobile header ] start -->
	<div class="pc-mob-header pc-header">
		<div class="pcm-logo">
			<img src="assets/images/logo.png" alt="" class="logo logo-lg">
		</div>
		<div class="pcm-toolbar">
			<a href="#!" class="pc-head-link" id="mobile-collapse">
				<div class="hamburger hamburger--arrowturn">
					<div class="hamburger-box">
						<div class="hamburger-inner"></div>
					</div>
				</div>
			</a>
			<a href="#!" class="pc-head-link" id="headerdrp-collapse">
				<i data-feather="align-right"></i>
			</a>
			<a href="#!" class="pc-head-link" id="header-collapse">
				<i data-feather="more-vertical"></i>
			</a>
		</div>
	</div>
	<!-- [ Mobile header ] End -->

    <!-- [ Pre-loader ] start -->
    <div class="loader-bg">
        <div class="loader-track">
            <div class="loader-fill"></div>
        </div>
    </div>
    <!-- [ Pre-loader ] End -->

    <!-- [ navigation menu ] start -->

</div>
<!-- [ Mobile header ] End -->

<!-- [ navigation menu ] start -->
<nav class="pc-sidebar ">
    <div class="navbar-wrapper">
        <div class="m-header">
            <a href="index.jsp" class="b-brand">
                <!-- ========   change your logo hear   ============ -->
                <img src="assets/images/logo.png" alt="" class="logo logo-lg">
                <img src="assets/images/logo-sm.svg" alt="" class="logo logo-sm">
            </a>
        </div>
        <div class="navbar-content">
            <ul class="pc-navbar">
                <li class="pc-item pc-caption">
                    <label>Quản lý</label>
                </li>
                <li class="pc-item">
                    <a href="index.jsp" class="pc-link "><span class="pc-micon"><i
                            class="material-icons-two-tone">home</i></span><span
                            class="pc-mtext">Quản lý chung</span></a>
                </li>
                <li class="pc-item pc-caption">
                    <label>Quản lý sản phẩm</label>
                    <!-- <span>UI Components</span> -->
                </li>
                <li class="pc-item pc-hasmenu">
                    <a href="#!" class="pc-link "><span class="pc-micon"><i
                            data-feather="github">business_center</i></span><span class="pc-mtext">Thú cưng</span><span
                            class="pc-arrow"><i data-feather="chevron-right"></i></span></a>
                    <ul class="pc-submenu">
                        <li class="pc-item"><a class="pc-link" href="list-products">Danh sách thú cưng</a></li>
                        <li class="pc-item"><a class="pc-link" href="edit-product.jsp">Thêm thú cưng</a></li>
                    </ul>
                </li>
                <li class="pc-item pc-hasmenu">
                    <a href="#!" class="pc-link "><span class="pc-micon"><i class="material-icons-two-tone">business_center</i></span><span
                            class="pc-mtext">Phụ kiện</span><span class="pc-arrow"><i data-feather="chevron-right"></i></span></a>
                    <ul class="pc-submenu">
                        <li class="pc-item"><a class="pc-link" href="list-accessory">Danh sách phụ kiện</a></li>
                        <li class="pc-item"><a class="pc-link" href="edit-accessory.jsp">Thêm phụ kiện</a></li>
                    </ul>
                </li>
                <li class="pc-item">
                    <a href="import.jsp" class="pc-link "><span class="pc-micon"><i
                            class="material-icons-two-tone">home</i></span><span class="pc-mtext">Nhập sản phẩm</span></a>
                </li>
                <li class="pc-item">
                    <a href="products-status.jsp" class="pc-link "><span class="pc-micon"><i
                            class="material-icons-two-tone">history_edu</i></span><span class="pc-mtext">Tình trạng đơn hàng</span></a>
                </li>
                <li class="pc-item pc-caption">
                    <label>Quản lý tin tức</label>
                </li>
                <li class="pc-item pc-hasmenu">
                    <a href="#!" class="pc-link "><span class="pc-micon"><i class="material-icons-two-tone"
                                                                            data-feather="file-minus"></i></span><span
                            class="pc-mtext">Tin tức</span><span class="pc-arrow"><i
                            data-feather="chevron-right"></i></span></a>
                    <ul class="pc-submenu">
                        <li class="pc-item"><a class="pc-link" href="list-blog.jsp">Danh sách tin tức</a></li>
                        <li class="pc-item"><a class="pc-link" href="add-blog.jsp">Thêm tin tức</a></li>
                    </ul>
                </li>
                <li class="pc-item pc-caption">
                    <label>Quản lý danh mục</label>
                </li>
                <li class="pc-item">
                    <a href="list-category.jsp" class="pc-link "><span class="pc-micon"><i
                            class="material-icons-two-tone">history_edu</i></span><span class="pc-mtext">Danh sách danh mục</span></a>
                </li>
                <li class="pc-item pc-hasmenu">
                    <a href="#!" class="pc-link "><span class="pc-micon"><i class="material-icons-two-tone"
                                                                            data-feather="file-minus"></i></span><span
                            class="pc-mtext">Thêm danh mục</span><span class="pc-arrow"><i
                            data-feather="chevron-right"></i></span></a>
                    <ul class="pc-submenu">
                        <li class="pc-item"><a class="pc-link" href="add-category-product.jsp">Danh mục sản phẩm</a>
                        </li>
                        <li class="pc-item"><a class="pc-link" href="add-category-blog.jsp">Danh mục tin tức</a></li>
                    </ul>
                </li>
                <li class="pc-item pc-caption">
                    <label>Tài khoản</label>
                </li>
                <li class="pc-item pc-hasmenu">
                    <a href="#!" class="pc-link "><span class="pc-micon"><i class="material-icons-two-tone"
                                                                            data-feather="cpu"></i></span><span
                            class="pc-mtext">Admin</span><span class="pc-arrow"><i
                            data-feather="chevron-right"></i></span></a>
                    <ul class="pc-submenu">
                        <li class="pc-item"><a class="pc-link" href="list-admin.jsp">Danh sách admin</a></li>
                        <li class="pc-item"><a class="pc-link" href="add-admin.jsp">Thêm admin</a></li>
                    </ul>
                </li>
                <li class="pc-item pc-hasmenu">
                    <a href="#!" class="pc-link "><span class="pc-micon"><i class="material-icons-two-tone"
                                                                            data-feather="user"></i></span><span
                            class="pc-mtext">Người dùng</span><span class="pc-arrow"><i
                            data-feather="chevron-right"></i></span></a>
                    <ul class="pc-submenu">
                        <li class="pc-item"><a class="pc-link" href="list-user.jsp">Danh sách người dùng</a></li>
                        <li class="pc-item"><a class="pc-link" href="add-user.jsp">Thêm người dùng</a></li>
                    </ul>
                </li>
                <li class="pc-item pc-caption">
                    <label>Quản lý bình luận</label>
                </li>
                <li class="pc-item">
                    <a href="list-comment.jsp" class="pc-link "><span class="pc-micon"><i data-feather="message-circle">history_edu</i></span><span
                            class="pc-mtext">Bình luận</span></a>
                </li>
            </ul>
        </div>
    </div>
</nav>
<!-- [ navigation menu ] end -->
<!-- [ Header ] start -->
<jsp:include page="layout-admin/header-admin.jsp"></jsp:include>
<!-- [ Header ] end -->


<!-- [ Main Content ] start -->
<div class="pc-container">
    <div class="pcoded-content">
        <!-- [ breadcrumb ] start -->
        <div class="page-header">
            <div class="page-block">
                <div class="row align-items-center">
                    <div class="col-md-6">

                        <ul class="breadcrumb">
                            <li class="breadcrumb-item"><a href="index.jsp">Quản lý</a></li>
                            <li class="breadcrumb-item">Quản lý chung</li>
                        </ul>
                    </div>
                </div>
            </div>
        </div>
        <!-- [ breadcrumb ] end -->
        <!-- [ Main Content ] start -->
        <div class="row">
            <%
                StatisticalService service = new StatisticalService();
                int totalCustomer = service.totalCustomer();
                int totalRevenue = service.totalRevenue();
                int totalOrder = service.totalOrder();
                int totalProduct = service.totalProduct();
                int totalProSold = service.totalProSold();
                int totalOrderCancel = service.totalOrderCancel();
                List<Map<String, Integer>> StatisticalComment = service.StatisticalComment();
                List<Map<String, Object>> MonthlyChart = service.MonthlyChart();
                Collections.reverse(MonthlyChart);
                List<Map<String, Object>> SaleChartinWeek = service.SaleChartinWeek();
                List<Orders> Last5Order = service.Last5Order();
                List<Product> Top10ProductBestSeller = service.Top10ProductBestSeller();
            %>
            <div class="col-xl-6 col-md-12">
                <div class="card flat-card">
                    <div class="row-table">
                        <div class="col-sm-6 card-body br">
                            <div class="row">
                                <div class="text-md-center">
                                    <h5><%=totalCustomer%>
                                    </h5>
                                    <span>Khách hàng</span>
                                </div>
                            </div>
                        </div>
                        <div class="col-sm-6 d-none d-md-table-cell d-lg-table-cell d-xl-table-cell card-body br">
                            <div class="row">
                                <div class="text-md-center">
                                    <h5><%=format.format(totalRevenue)%> ₫</h5>
                                    <span>Doanh thu</span>
                                </div>
                            </div>
                        </div>
                        <div class="col-sm-6 card-body">
                            <div class="row">
                                <div class="text-md-center">
                                    <h5><%=totalProduct%>
                                    </h5>
                                    <span>Sản phẩm</span>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="row-table">
                        <div class="col-sm-6 card-body br">
                            <div class="row">
                                <div class="text-md-center">
                                    <h5><%=totalProSold%>
                                    </h5>
                                    <span>SP bán ra</span>
                                </div>
                            </div>
                        </div>
                        <div class="col-sm-6 d-none d-md-table-cell d-lg-table-cell d-xl-table-cell card-body br">
                            <div class="row">
                                <div class="text-md-center">
                                    <h5><%=totalOrder%>
                                    </h5>
                                    <span>Đơn hàng</span>
                                </div>
                            </div>
                        </div>
                        <div class="col-sm-6 card-body">
                            <div class="row">
                                <div class="text-md-center">
                                    <h5><%=totalOrderCancel%>
                                    </h5>
                                    <span>Đơn hủy</span>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="card flat-card">
                    <div class="card-header">
                        <h6>Đánh giá của khách hàng</h6>
                        <div class="row d-flex justify-content-center align-items-center">
                            <div class="col">
                                <canvas id="ChartComment"></canvas>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="card table-card">
                    <div class="card-header">
                        <h5>Trạng thái công việc</h5>
                    </div>
                    <div class="pro-scroll" style="height:255px;position:relative;">
                        <div class="card-body p-0">
                            <div class="table-responsive">
                                <table class="table table-hover m-b-0">
                                    <thead>
                                    <tr>
                                        <th><i class="fa-solid fa-cart-shopping" style="color: #00bfff;"></i></th>
                                        <th>Mã đơn hàng</th>
                                        <th>Mã khách hàng</th>
                                        <th>Ngày đặt</th>
                                    </tr>
                                    </thead>
                                    <tbody>
                                    <% for ( Orders o : Last5Order) {%>
                                    <tr>
                                        <td><i class="fa-solid fa-cart-shopping" style="color: #00bfff;"></i></td>
                                        <td><%=o.getOrderID()%></td>
                                        <td><%=o.getCustomerID()%></td>
                                        <td>
                                            <div><label class="badge bg-light-warning"><%=o.getOrderDate()%></label></div>
                                        </td>
                                    </tr>
                                    <% } %>
                                    </tbody>
                                </table>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="col-xl-6 col-md-12">
                <div class="card">
                    <div class="card-header">
                        <h5>Thống kê 6 tháng gần nhất</h5>
                        <div class="row d-flex justify-content-center align-items-center">
                            <div class="col">
                                <canvas id="ChartMonth"></canvas>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="card flat-card">
                    <div class="card-header">
                        <h5>Thống kê đơn đặt hàng trong tuần</h5>
                        <div class="row d-flex justify-content-center align-items-center">
                            <div class="col">
                                <canvas id="ChartWeek"></canvas>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="card feed-card">
                    <div class="card-header">
                        <h5>Các sản phẩm bán chạy</h5>
                    </div>
                    <div class="feed-scroll" style="height:408px;position:relative;">
                        <div class="card-body">
                            <% for ( Product p : Top10ProductBestSeller ) {%>
                            <div class="row m-b-25 align-items-center">
                                <div class="col-auto p-r-0">
                                    <i data-feather="file-text" class="bg-light-primary feed-icon p-2 wid-30 hei-30"></i>
                                </div>
                                <div class="col">
                                    <a href="#!">
                                        <h6 class="m-b-5"><%=p.getProductName()%><span class="text-muted float-right f-14">#<%=p.getProductId()%></span></h6>
                                    </a>
                                </div>
                            </div>
                            <% } %>
                            <%-- <div class="row m-b-25 align-items-center">
                                 <div class="col-auto p-r-0">
                                     <i data-feather="shopping-cart" class="bg-light-danger feed-icon p-2 wid-30 hei-30"></i>
                                 </div>
                                 <div class="col">
                                     <a href="#!">
                                         <h6 class="m-b-5">Đã nhận 3 order <span class="text-muted float-right f-14">30 phút trước</span></h6>
                                     </a>
                                 </div>
                             </div>
                             <div class="row m-b-25 align-items-center">
                                 <div class="col-auto p-r-0">
                                     <i data-feather="file-text" class="bg-light-success feed-icon p-2 wid-30 hei-30"></i>
                                 </div>
                                 <div class="col">
                                     <a href="#!">
                                         <h6 class="m-b-5">Bạn có 3 công việc mới <span class="text-muted float-right f-14">Vừa xong</span></h6>
                                     </a>
                                 </div>
                             </div>
                             <div class="row m-b-25 align-items-center">
                                 <div class="col-auto p-r-0">
                                     <i data-feather="bell" class="bg-light-primary feed-icon p-2 wid-30 hei-30"></i>
                                 </div>
                                 <div class="col">
                                     <a href="#!">
                                         <h6 class="m-b-5">Bạn đã hoàn thành 2 công việc<span class="text-muted float-right f-14">1 tiếng trước</span></h6>
                                     </a>
                                 </div>
                             </div>
                             <div class="row m-b-25 align-items-center">
                                 <div class="col-auto p-r-0">
                                     <i data-feather="file-text" class="bg-light-success feed-icon p-2 wid-30 hei-30"></i>
                                 </div>
                                 <div class="col">
                                     <a href="#!">
                                         <h6 class="m-b-5">Bạn có 5 công việc mới <span class="text-muted float-right f-14">15 phút trước</span></h6>
                                     </a>
                                 </div>
                             </div>
                             <div class="row m-b-25 align-items-center">
                                 <div class="col-auto p-r-0">
                                     <i data-feather="shopping-cart" class="bg-light-danger feed-icon p-2 wid-30 hei-30"></i>
                                 </div>
                                 <div class="col">
                                     <a href="#!">
                                         <h6 class="m-b-5">Đã nhận 3 order <span class="text-muted float-right f-14">4 tiếng trước</span></h6>
                                     </a>
                                 </div>
                             </div>
                             <div class="row m-b-25 align-items-center">
                                 <div class="col-auto p-r-0">
                                     <i data-feather="shopping-cart" class="bg-light-danger feed-icon p-2 wid-30 hei-30"></i>
                                 </div>
                                 <div class="col">
                                     <a href="#!">
                                         <h6 class="m-b-5">Order hoàn thành <span class="text-muted float-right f-14">Vừa xong</span></h6>
                                     </a>
                                 </div>
                             </div>
                             <div class="row m-b-25 align-items-center">
                                 <div class="col-auto p-r-0">
                                     <i data-feather="file-text" class="bg-light-success feed-icon p-2 wid-30 hei-30"></i>
                                 </div>
                                 <div class="col">
                                     <a href="#!">
                                         <h6 class="m-b-5">Bạn có 6 công việc mới <span class="text-muted float-right f-14">5 tiếng trước</span></h6>
                                     </a>
                                 </div>
                             </div>
                             <div class="row m-b-0 align-items-center">
                                 <div class="col-auto p-r-0">
                                     <i data-feather="bell" class="bg-light-primary feed-icon p-2 wid-30 hei-30"></i>
                                 </div>
                                 <div class="col">
                                     <a href="#!">
                                         <h6 class="m-b-5">Bạn đã hoàn thành 4 công việc <span class="text-muted float-right f-14">2 tiếng trước</span></h6>
                                     </a>
                                 </div>
                             </div>--%>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
</div>
</div>
</div>
</div>

<!-- Required Js -->
<script src="assets/js/vendor-all.min.js"></script>
<script src="assets/js/plugins/bootstrap.min.js"></script>
<script src="assets/js/plugins/feather.min.js"></script>
<script src="assets/js/pcoded.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/highlight.js/9.12.0/highlight.min.js"></script>
<script src="assets/js/plugins/clipboard.min.js"></script>
<script src="assets/js/uikit.min.js"></script>

<!-- Apex Chart -->
<script src="assets/js/plugins/apexcharts.min.js"></script>
<!-- scrolling js -->
<script src="assets/js/pages/dashboard-sale.js"></script>

<script>
    const ChartComment = document.getElementById('ChartComment');
    new Chart(ChartComment, {
        type: 'doughnut',
        data: {
            labels: ['1 sao', '2 sao', '3 sao', '4 sao', '5 sao',],
            datasets: [{
                data: [<%for (Map<String,Integer> map1 : StatisticalComment) { %>
                    <%=map1.get("countVote")%>,
                    <%}%>
                ],
                borderWidth: 1,
            }]
        },
        options: {
            scales: {
                y: {
                    beginAtZero: true
                }
            }
        }
    });
</script>

<script>
    const ChartMonth = document.getElementById('ChartMonth');
    new Chart(ChartMonth, {
        data: {
            datasets: [{
                type: 'bar',
                label: 'Số đơn hàng',
                data: [<% for( Map<String, Object> map2 : MonthlyChart) {%>
                    <%=map2.get("key")%>,
                    <% } %>
                ]
            }, {
                type: 'line',
                label: 'Doanh thu',
                data: [<% for( Map<String, Object> map2 : MonthlyChart) {%>
                    <%=map2.get("value")%>,
                    <% } %>
                ],
            }],
            labels: [<% for( Map<String, Object> map2 : MonthlyChart) {%>
                '<%=map2.get("month")%>',
                <% } %>
            ]
        },
        options: {
            scales: {
                y: {
                    beginAtZero: true
                }
            }
        }
    });
</script>

<script>
    const ChartWeek = document.getElementById('ChartWeek');
    new Chart(ChartWeek, {
        data: {
            datasets: [ {
                type: 'line',
                label: 'Doanh thu',
                data: [<% for( Map<String, Object> map3 : SaleChartinWeek) {%>
                    <%=map3.get("value")%>,
                    <% } %>
                ],
            }],
            labels: ['Thứ 2', 'Thứ 3', 'Thứ 4', 'Thứ 5', 'Thứ 6', 'Thứ 7', 'Chủ nhật'
            ]
        },
        options: {
            scales: {
                y: {
                    beginAtZero: true
                }
            }
        }
    });
</script>


</body>

</html>