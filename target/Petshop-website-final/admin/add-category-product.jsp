<%--
  Created by IntelliJ IDEA.
  User: Nguyen Ngoc Huy
  Date: 12/31/2022
  Time: 2:48 AM
  To change this template use File | Settings | File Templates.
--%>

<%@ page import="vn.edu.hcmuaf.fit.beans.UserAccount" %>
<%@ page import="java.util.List" %>
<%@ page import="vn.edu.hcmuaf.fit.dao.CustomerUserDAO" %>
<%@ page import="vn.edu.hcmuaf.fit.services.DetailService" %>
<%@ page import="vn.edu.hcmuaf.fit.beans.Detail" %>
<%@ page import="vn.edu.hcmuaf.fit.beans.AdminRole" %>
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

    <!-- vendor css -->
    <link rel="stylesheet" href="assets/css/style.css" id="main-style-link">
    <script src="bonus/js/imageloaded.min.js"></script>

    <!-- ===============================================-->
    <!--    Stylesheets-->
    <!-- ===============================================-->
    <link href="bonus/css/dropzone.min.css" rel="stylesheet"/>
    <link href="bonus/css/line.css" rel="stylesheet"/>
    <link href="bonus/css/choices.min.css" rel="stylesheet"/>
    <link rel="preconnect" href="https://fonts.googleapis.com"/>
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin=""/>
    <link
            href="https://fonts.googleapis.com/css2?family=Nunito+Sans:wght@300;400;600;700;800;900&amp;display=swap"
            rel="stylesheet"
    />
    <link
            rel="stylesheet"
            href="https://unicons.iconscout.com/release/v4.0.0/css/line.css"
    />
    <link
            href="bonus/css/theme.min.css"
            type="text/css"
            rel="stylesheet"
            id="style-default"
    />
    <link
            href="../../../assets/css/user.min.css"
            type="text/css"
            rel="stylesheet"
            id="user-style-default"
    />
    <link
            rel="stylesheet"
            type="text/css"
            id="mce-u0"
            href="bonus/css/skin.min.css"
    />
</head>
<%
    if (request.getSession().getAttribute("admin") == null) {
        response.sendRedirect("login.jsp");
    } else {
        UserAccount admin = (UserAccount) request.getSession().getAttribute("admin");
        boolean check = false;
        for (AdminRole role : admin.getRole()) {
            if (role.getTableName().equals("productCategory")) {
                if (role.getPermission() == 1 || ((role.getPermission() == 2 && request.getParameter("id") != null)))
                    check = true;
            }
        }
        if (!check) {%>
<script>
    window.location.href = 'index.jsp';
    alert("Tài khoản không có quyền này!" );
</script>
<%    } else {
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
                        <li class="pc-item"><a class="pc-link" href="add-category-product.jsp">Danh mục sản phẩm</a></li>
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
                        <li class="pc-item"><a class="pc-link" href="list-user.jsp?role=1">Danh sách người dùng</a></li>
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
                    <a href="list-contact.jsp" class="pc-link "><span class="pc-micon"><i data-feather="message-circle">history_edu</i></span><span class="pc-mtext">Liên hệ</span></a>
                </li>
            </ul>
        </div>
    </div>
</nav>
<!-- [ navigation menu ] end -->
<!-- [ Header ] start -->
<jsp:include page="layout-admin/header-admin.jsp"></jsp:include>
<!-- [ Header ] end -->
<%List<Detail> list = DetailService.getInstance().listCategoryParentPd();%>
<!-- [ Main Content ] start -->
<div class="pc-container">
    <div class="pcoded-content">
        <div class="page-header">
            <div class="page-block">
                <div class="row align-items-center">
                    <div class="col-md-6">
                        <ul class="breadcrumb">
                            <li class="breadcrumb-item">Quản lý danh mục</li>
                            <li class="breadcrumb-item">Thêm danh mục</li>
                            <li class="breadcrumb-item">Danh mục sản phẩm</li>
                        </ul>
                    </div>
                </div>
            </div>
        </div>
        <div class="row">
            <main class="main" id="top">
                <div class="container-fluid px-0" data-layout="container">
                    <form class="mb-9" method="post" action="AddCategoryProduct">
                        <% Detail cate = null;
                            if (request.getParameter("cid") != null)
                                cate = DetailService.getInstance().getCateProductById(request.getParameter("cid"));
                        %>
                        <div class="row g-3 flex-between-end mb-5">
                            <div class="col-auto">
                                <%if (request.getParameter("cid") != null) {%>
                                <h2 class="mb-2">Sửa danh mục sản phẩm</h2>
                                <%} else {%>
                                <h2 class="mb-2">Thêm danh mục sản phẩm</h2>
                                <%}%>
                            </div>
                        </div>

                        <div class="row g-5">
                            <div class="col-12 col-xl-8">
                                <h4 class="mb-3">Tên danh mục</h4>
                                <input class="form-control mb-5" name="catename" type="text"
                                       value="<%=(cate != null) ? cate.getCatName() : ""%>" placeholder="Viết tên danh mục tại đây..."/>

                                <h4 class="mb-3">Danh mục cha</h4>
                                <select class="form-control mb-5" name="cateparent">
                                    <%if(cate != null){%>
                                        <option value='0'>Không</option>
                                        <%for (Detail c : list) {
                                            if (c.getCatID().equals(cate.getParentID())) {%>
                                                <option value='<%=c.getCatID()%>' selected><%=c.getCatName()%>
                                                </option>
                                            <%} else {%>
                                                <option value='<%=c.getCatID()%>'><%=c.getCatName()%>
                                                </option>
                                            <%}%>
                                        <%}%>
                                    <%}else{%>
                                    <option value='0' selected>Không</option>
                                        <%for (Detail c : list) {%>
                                        <option value='<%=c.getCatID()%>'><%=c.getCatName()%>
                                        </option>
                                        <%}%>
                                    <%}%>
                                </select>

                                <h4 class="mb-3">Trạng thái</h4>
                                <select class="form-control mb-5" name="status">
                                    <option value='1' selected>Hiện</option>
                                    <option value='0'>Ẩn</option>
                                </select>

                                <div class="col-auto">
                                    <%if (request.getParameter("cid") != null) {%>
                                    <button class="btn btn-primary mb-2 mb-sm-0" type="submit">
                                        Lưu thay đổi
                                    </button>
                                    <%} else {%>
                                    <button class="btn btn-primary mb-2 mb-sm-0" type="submit">
                                        Thêm danh mục
                                    </button>
                                    <%}%>
                                    <input type="text" id="cid" name="cid"
                                           value="<%=(cate != null) ? request.getParameter("cid") : ""%>"
                                           style="display: none">
                                </div>

                            </div>

                        </div>


                    </form>
                </div>

            </main>
        </div>
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

<script src="bonus/js/popper.min.js"></script>
<script src="bonus/js/bootstrap.min.js"></script>
<script src="bonus/js/anchor.min.js"></script>
<script src="bonus/js/is.min.js"></script>
<script src="bonus/js/all.min.js"></script>
<script src="bonus/js/lodash.min.js"></script>
<script src="bonus/js/polyfill.min.js"></script>
<script src="bonus/js/list.min.js"></script>
<script src="bonus/js/feather.min.js"></script>
<script src="bonus/js/dayjs.min.js"></script>
<script src="bonus/tinymce/tinymce.min.js"></script>
<script src="bonus/js/dropzone.min.js"></script>
<script src="bonus/js/choises.min.js"></script>
<script src="bonus/js/phoenix.js"></script>
<script src="bonus/js/phoenix1.js"></script>
<script src="bonus/js/theme.min.js"></script>
<script src="bonus/js/docs.js"></script>
<script src="bonus/js/utils.js"></script>
<script src="bonus/js/image.js"></script>


<!-- Apex Chart -->
<script src="assets/js/plugins/apexcharts.min.js"></script>
<!-- custom-chart js -->
<script src="assets/js/pages/dashboard-sale.js"></script>
</body>

</html>


