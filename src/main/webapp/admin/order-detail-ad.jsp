<%--
  Created by IntelliJ IDEA.
  User: Nguyen Ngoc Huy
  Date: 4/8/2023
  Time: 11:07 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page import="java.util.List" %>
<%@ page import="vn.edu.hcmuaf.fit.beans.Orders" %>
<%@ page import="vn.edu.hcmuaf.fit.services.OrderService" %>
<%@ page import="vn.edu.hcmuaf.fit.services.UserService" %>
<%@ page import="java.text.NumberFormat" %>
<%@ page import="java.util.Locale" %>
<%@ page import="vn.edu.hcmuaf.fit.beans.UserAccount" %>
<%@ page import="vn.edu.hcmuaf.fit.beans.AdminRole" %>
<%@ page import="vn.edu.hcmuaf.fit.beans.OrderDetail" %>
<%@ page import="vn.edu.hcmuaf.fit.services.ProductService" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">

<head>
    <title>Quản lý Petshop</title>
    <!-- HTML5 Shim and Respond.js IE11 support of HTML5 elements and media queries -->
    <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
    <!--[if lt IE 11]>
    <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
    <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
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
    <link rel="stylesheet" href="assets/css/bootstrap.min.css">

    <!-- vendor css -->
    <link rel="stylesheet" href="assets/css/style.css" id="main-style-link">

</head>
<%
    if (request.getSession().getAttribute("admin") == null) {
        response.sendRedirect("/login.jsp");
    } else {
        UserAccount admin = (UserAccount) request.getSession().getAttribute("admin");
        boolean check = false;
        for (AdminRole role : admin.getRole()) {
            if (role.getTableName().equals("order")) {
                check = true;
                break;
            }
        }
        if (!check) {%>
<script>
    window.location.href = 'index.jsp';
    alert("Tài khoản không có quyền này!");
</script>
<% } else {
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
        <img src="assets/images/logo.svg" alt="" class="logo logo-lg">
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
                            class="material-icons-two-tone">home</i></span><span
                            class="pc-mtext">Nhập sản phẩm</span></a>
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
                <li class="pc-item pc-caption">
                    <label>Quản lý liên hệ</label>
                </li>
                <li class="pc-item">
                    <a href="list-contact.jsp" class="pc-link "><span class="pc-micon"><i data-feather="message-circle">history_edu</i></span><span
                            class="pc-mtext">Liên hệ</span></a>
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
                        <!-- <div class="page-header-title">
                            <h5 class="m-b-10">Dashboard sale</h5>
                        </div> -->
                        <ul class="breadcrumb">
                            <li class="breadcrumb-item">Quản lý sản phẩm</li>
                            <li class="breadcrumb-item">Tình trạng đơn hàng</li>
                            <li class="breadcrumb-item">Chi tiết đơn hàng</li>
                        </ul>
                    </div>
                </div>
            </div>
        </div>
        <!-- [ breadcrumb ] end -->
        <%
            String orderId = request.getParameter("orderId");
            List<OrderDetail> listOd = OrderService.getInstance().getOrderDetailsById(orderId);
            Orders order = OrderService.getInstance().getOrderByIdOrder(orderId);
        %>
        <% NumberFormat format = NumberFormat.getInstance(new Locale("vn", "VN"));%>

        <!-- [ Main Content ] start -->
        <div class="row">
            <div class="col-sm-12">
                <div class="card">
                    <div class="card-body text-center">
                        <div class="row">
                            <div class="col-md-8 checkout__order" style="margin: auto;">
                                <div class="col-lg-12 col-md-6">
                                    <div class="checkout__order">
                                        <h4>Chi tiết hóa đơn</h4>
                                        <a href="GenerateBillPDF?idO=<%=orderId%>">Xuất PDF</a>
                                        <table class="table table-sm fs--1 mb-0">
                                            <thead>
                                            <tr>
                                                <th class="sort align-middle pe-5" scope="col"
                                                    data-sort="total-spent" style="width:20%;">Mã SP
                                                </th>
                                                <th class="sort align-middle pe-5" scope="col" data-sort="email"
                                                    style="width:40%;">Tên Sản Phẩm
                                                </th>
                                                <th class="sort align-middle pe-5" scope="col" data-sort="email"
                                                    style="width:20%;">Số Lượng
                                                </th>
                                                <th class="sort align-middle " scope="col" data-sort="total-orders"
                                                    style="width:20%; text-align: right;">Giá
                                                </th>
                                            </tr>
                                            </thead>
                                            <tbody class="list" id="table-latest-review-body">
                                            <%for (OrderDetail od : listOd) {%>
                                            <input id="idTransport" value="<%=od.getIdTransport()%>"
                                                   style="display: none">
                                            <tr class="hover-actions-trigger btn-reveal-trigger position-static">
                                                <td class="fs--1 align-middle ps-0 py-3"><%=od.getProductID()%>
                                                </td>
                                                <td class="customer align-middle white-space-nowrap pe-5"><%=od.getProductName()%>
                                                </td>
                                                <td class="email align-middle white-space-nowrap pe-5"
                                                    style="text-align: center;"><%=od.getQuantity()%>
                                                </td>
                                                <%if (ProductService.getInstance().getProductDetail(od.getProductID()).getPromotional() == 1) {%>
                                                <td class="email align-middle white-space-nowrap pe-5"
                                                    style="text-align: right;">
                                                    <%=format.format(od.getQuantity() * (ProductService.getInstance().getProductDetail(od.getProductID()).getPrice() - (ProductService.getInstance().getProductDetail(od.getProductID()).getPrice() * ProductService.getInstance().getProductDetail(od.getProductID()).getPromotionalPrice() / 100)))%>
                                                </td>
                                                <%} else {%>
                                                <td class="email align-middle white-space-nowrap pe-5"
                                                    style="text-align: right;">
                                                    <%=format.format(od.getPrice())%>
                                                </td>
                                                <%}%>
                                            </tr>
                                            <%}%>
                                            <tr style="font-size: 14px; color: #1c1c1c; font-weight: 200; border-top: 2px solid #e1e1e1; width: 100%">
                                                <td style="text-align: left">Tạm tính:</td>
                                                <td></td>
                                                <td></td>
                                                <td style="text-align: right"><%=format.format(order.getPrice())%>
                                                    đ
                                                </td>
                                            </tr>
                                            <tr style="font-size: 14px; color: #1c1c1c; font-weight: 200;">
                                                <td style="text-align: left">Phí vận chuyển:</td>
                                                <td></td>
                                                <td></td>
                                                <td id="fee" style="text-align: right"></td>
                                            </tr>
                                            <tr style="font-size: 14px; color: #1c1c1c; font-weight: 200;">
                                                <td style="text-align: left">Phương thức thanh toán:</td>
                                                <td></td>
                                                <td></td>
                                                <td style="text-align: right">Thanh toán khi nhận hàng</td>
                                            </tr>
                                            <tr style="font-size: 14px; color: #1c1c1c; font-weight: 200;">
                                                <td style="text-align: left">Ghi chú đơn hàng:</td>
                                                <td></td>
                                                <td></td>
                                                <td style="text-align: right"><%=order.getNotice()%>
                                                </td>
                                            </tr>
                                            <tr style="font-size: 18px; color: #1c1c1c; font-weight: 700;">
                                                <input value="<%=order.getPrice()%>" id="provisional"
                                                       style="display: none">
                                                <td style="text-align: left">Tổng tiền</td>
                                                <td></td>
                                                <td></td>
                                                <td style="text-align: right" id="tongtien">
                                                </td>
                                            </tr>
                                            </tbody>
                                        </table>
                                        <form method="post" action="UpdateStatusOrder" class="infor_user">
                                            <input type="text" value="<%=order.getOrderID()%>" name="orderId"
                                                   style="display: none">
                                            <input type="text" value="<%=order.getStatus()%>" name="status"
                                                   style="display: none">
                                            <input type="text" value="<%=order.getDelivered()%>" name="delivery"
                                                   style="display: none">
                                            <div class="update-status-order" style="display: inline;">
                                                <%if (order.getStatus() == 0) {%>
                                                <select class="form-select mb-3" name="udstatus" id="udstatus">
                                                    <option value="2" selected style="color: red; font-weight: bold">Đã
                                                        hủy
                                                    </option>
                                                </select>
                                                <%} else {%>
                                                <%if (order.getDelivered() == 0) {%>
                                                <select class="form-select mb-3" name="udstatus" id="status">
                                                    <option value="0" selected
                                                            style="color: #00BFFF; font-weight: bold">Đang xử lý
                                                    </option>
                                                    <option value="1" style="color: #35ff00; font-weight: bold">Hoàn
                                                        thành
                                                    </option>
                                                    <option value="2" style="color: red; font-weight: bold">Hủy đơn
                                                    </option>
                                                </select>
                                                <%} else {%>
                                                <select class="form-select mb-3" name="udstatus" id="status">
                                                    <option value="1" selected
                                                            style="color: #35ff00; font-weight: bold">Hoàn thành
                                                    </option>
                                                </select>
                                                <%}%>
                                                <%}%>
                                                <%if (order.getVerify() == 0){%>
                                                <div class="alert alert-danger" role="alert">
                                                    Vui lòng xác thực đơn hàng!
                                                </div>
                                                <%} else {%>
                                                <% for (AdminRole role : admin.getRole()) {
                                                    if (role.getTableName().equals("order") && role.getPermission() == 2) {
                                                %>
                                                <button class="btn_2 edit btn btn-primary" type="submit">Lưu</button>
                                                <%
                                                            }
                                                        }
                                                    }
                                                %>
                                                <a class="fw-semi-bold text-1100" href="products-status.jsp">Trở lại</a>
                                            </div>
                                        </form>
                                    </div>

                                </div>

                            </div>

                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!-- [ Main Content ] end -->
</div>
</div>
<%
        }
    }
%>
<!-- Required Js -->
<script src="assets/js/vendor-all.min.js"></script>
<script src="assets/js/plugins/bootstrap.min.js"></script>
<script src="assets/js/plugins/feather.min.js"></script>
<script src="assets/js/pcoded.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/highlight.js/9.12.0/highlight.min.js"></script>
<script src="assets/js/plugins/clipboard.min.js"></script>
<script src="assets/js/uikit.min.js"></script>
<script src="assets/css/status/bootstrap.min.js"></script>
<script src="assets/js/axios.min.js"></script>

<%--<!-- Apex Chart -->--%>
<%--<script src="assets/js/plugins/apexcharts.min.js"></script>--%>
<%--<!-- custom-chart js -->--%>
<%--<script src="assets/js/pages/dashboard-sale.js"></script>--%>

<script>
    var idTransport = $("#idTransport").val();
    console.log(idTransport);
    EMAIL = "20130266@st.hcmuaf.edu.vn";
    PASSWORD = "123456";
    axios.post('http://140.238.54.136/api/auth/login', {
        email: EMAIL,
        password: PASSWORD
    }).then(response => {
        console.log(response.data.access_token);
        console.log(response.data.access_token);
        getOrder(response.data.access_token);
    })
    var getOrder = (token) => {
        url = "http://140.238.54.136/api/getInfoTransport"
        body = {
            id: idTransport,
            token: token
        }
        axios.post(url, body).then(response => {
            var data = response.data;
            var content = data.data[0];
            var fee = parseInt(content.fee);
            var feeFormat = new Intl.NumberFormat('vi-VN', {
                style: 'currency',
                currency: 'VND'
            }).format(content.fee);
            console.log(fee);
            console.log(parseFloat($("#provisional").val()));
            // var active = content.active;
            var total = new Intl.NumberFormat('vi-VN', {
                style: 'currency',
                currency: 'VND'
            }).format(fee + parseFloat($("#provisional").val()))
            console.log(total)
            // $("#active").text(active == 1 ? "đang vận chuyển" : "đã giao");
            $("#fee").text(feeFormat);
            $("#tongtien").text(total);
        })
    }
</script>
</body>

</html>
