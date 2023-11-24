<%--
  Created by IntelliJ IDEA.
  User: Nguyen Ngoc Huy
  Date: 12/31/2022
  Time: 1:07 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page import="vn.edu.hcmuaf.fit.beans.UserAccount" %>
<%@ page import="java.util.List" %>
<%@ page import="vn.edu.hcmuaf.fit.dao.CustomerUserDAO" %>
<%@ page import="vn.edu.hcmuaf.fit.services.DetailService" %>
<%@ page import="vn.edu.hcmuaf.fit.beans.Detail" %>
<%@ page import="vn.edu.hcmuaf.fit.beans.AdminRole" %>
<%@ page import="vn.edu.hcmuaf.fit.services.ProductService" %>
<%@ page import="vn.edu.hcmuaf.fit.services.BlogService" %>
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
        response.sendRedirect("/login.jsp");
    } else {
        UserAccount admin = (UserAccount) request.getSession().getAttribute("admin");
        boolean check = false;
        for (AdminRole role : admin.getRole()) {
            if (role.getTableName().equals("productCategory")||role.getTableName().equals("blogCategory")) {
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

<!-- [ Main Content ] start -->
<div class="pc-container">
    <div class="pcoded-content">
        <!-- [ breadcrumb ] start -->
        <div class="page-header">
            <div class="page-block">
                <div class="row align-items-center">
                    <div class="col-md-6">

                        <ul class="breadcrumb">
                            <li class="breadcrumb-item">Quản lý danh mục</li>
                            <li class="breadcrumb-item">Danh sách danh mục</li>
                        </ul>
                    </div>
                </div>
            </div>
        </div>
        <div class="row">
            <div class="mb-9">
                <div class="row g-2 mb-4">
                    <div class="">
                        <h2 class="" style="margin-top: 20px; text-align: center;">Danh sách danh mục</h2>
                    </div>
                </div>

                <div id="products"
                     data-list="{&quot;valueNames&quot;:[&quot;customer&quot;,&quot;email&quot;,&quot;total-orders&quot;,&quot;total-spent&quot;,&quot;city&quot;,&quot;last-seen&quot;,&quot;last-order&quot;],&quot;page&quot;:10,&quot;pagination&quot;:true}">

                    <div class="mb-9">
                        <div class="mb-4">
                            <div class="row g-3">
                                <h5 class="" style="margin-top: 20px; text-align: left;">Danh mục sản phẩm</h5>
                                <div class="col-auto">
                                    <div class="search-box">
                                        <form class="position-relative" data-bs-toggle="search"
                                              data-bs-display="static"><input
                                                class="form-control search-input search" type="search"
                                                placeholder="Tìm danh mục"
                                                aria-label="Search">
                                            <svg class="svg-inline--fa fa-magnifying-glass search-box-icon"
                                                 aria-hidden="true"
                                                 focusable="false" data-prefix="fas" data-icon="magnifying-glass"
                                                 role="img"
                                                 xmlns="http://www.w3.org/2000/svg" viewBox="0 0 512 512"
                                                 data-fa-i2svg="">
                                                <path fill="currentColor"
                                                      d="M500.3 443.7l-119.7-119.7c27.22-40.41 40.65-90.9 33.46-144.7C401.8 87.79 326.8 13.32 235.2 1.723C99.01-15.51-15.51 99.01 1.724 235.2c11.6 91.64 86.08 166.7 177.6 178.9c53.8 7.189 104.3-6.236 144.7-33.46l119.7 119.7c15.62 15.62 40.95 15.62 56.57 0C515.9 484.7 515.9 459.3 500.3 443.7zM79.1 208c0-70.58 57.42-128 128-128s128 57.42 128 128c0 70.58-57.42 128-128 128S79.1 278.6 79.1 208z">
                                                </path>
                                            </svg>
                                        </form>
                                    </div>
                                </div>
                                <div class="col-auto">
                                    <button class="btn btn-primary" href="add-category-product.jsp">
                                        <svg class="svg-inline--fa fa-plus me-2"
                                             aria-hidden="true" focusable="false" data-prefix="fas" data-icon="plus"
                                             role="img"
                                             xmlns="http://www.w3.org/2000/svg" viewBox="0 0 448 512" data-fa-i2svg="">
                                            <path fill="currentColor"
                                                  d="M432 256c0 17.69-14.33 32.01-32 32.01H256v144c0 17.69-14.33 31.99-32 31.99s-32-14.3-32-31.99v-144H48c-17.67 0-32-14.32-32-32.01s14.33-31.99 32-31.99H192v-144c0-17.69 14.33-32.01 32-32.01s32 14.32 32 32.01v144h144C417.7 224 432 238.3 432 256z">
                                            </path>
                                        </svg>
                                        Thêm danh mục
                                    </button>
                                </div>
                            </div>
                        </div>
                        <%
                            List<Detail> list_pd_cate = DetailService.getInstance().listCategoryProduct();
                            List<Detail> list_bl_cate = DetailService.getInstance().listCategoryBlog();

                        %>
                        <div
                                class="mx-n4 px-4 mx-lg-n6 px-lg-6 bg-white border-top border-bottom border-200 position-relative top-1">
                            <div class="table-responsive scrollbar mx-n1 px-1">
                                <table class="table table-sm fs--1 mb-0">
                                    <thead>
                                    <tr>
                                        <th class="sort align-middle pe-5" scope="col" data-sort="customer"
                                            style="width:10%;">ID
                                        </th>
                                        <th class="sort align-middle pe-5" scope="col" data-sort="customer"
                                            style="width:15%;">Tên Danh
                                            Mục
                                        </th>
                                        <th class="sort align-middle pe-5" scope="col" data-sort="email"
                                            style="width:15%;">Danh Mục Cha
                                        </th>
                                        <th class="sort align-middle text-end pe-0" scope="col" data-sort="last-order"
                                            style="width:10%;"></th>
                                    </tr>
                                    </thead>
                                    <tbody class="list" id="table-latest-review-body1">
                                    <%
                                        for (Detail cate : list_pd_cate) {
                                    %>

                                    <tr class="hover-actions-trigger btn-reveal-trigger position-static">
                                        <td class="fs--1 align-middle ps-0 py-3">
                                            <p class="mb-0 text-1100 fw-bold"><%=cate.getCatID()%>
                                            </p>
                                        </td>
                                        <td class="total-orders align-middle white-space-nowrap fw-semi-bold"><%=cate.getCatName()%>
                                        </td>
                                        <%if (cate.getParentID() != null) {%>
                                        <td class="total-spent align-middle white-space-nowrap fw-bold  ps-3"><%=DetailService.getInstance().getCateProductById(cate.getParentID()).getCatName()%>
                                        </td>
                                        <%} else {%>
                                        <td class="total-spent align-middle white-space-nowrap fw-bold  ps-3">Không có
                                        </td>
                                        <%}%>
                                        <td class="city align-middle white-space-nowrap text-900 ps-7">
                                            <%
                                                for (AdminRole role : admin.getRole()) {
                                                    if (role.getTableName().equals("productCategory") && role.getPermission() == 2) {
                                            %>
                                            <a href="add-category-product.jsp?cid=<%=cate.getCatID()%>" class="btn btn-primary ">Sửa</a>
                                            <%
                                                }
                                                if (role.getTableName().equals("userAccount") && role.getPermission() == 3) {
                                                    if (!ProductService.getInstance().isCateContainPd(cate.getCatID())) { %>
                                            <a href="RemoveCateProduct?cid=<%=cate.getCatID()%>" class="btn btn-primary " style="background-color:crimson;">Xóa</a>

                                            <%
                                                        }
                                                    }
                                                }
                                            %>
                                        </td>
                                    </tr>
                                    <%}%>
                                    </tbody>
                                </table>
                            </div>
                        </div>
                    </div>

                    <div class="mb-9">
                        <div class="mb-4">
                            <div class="row g-3">
                                <h5 class="" style="margin-top: 20px; text-align: left;">Danh mục tin tức</h5>
                                <div class="col-auto">
                                    <div class="search-box">
                                        <form class="position-relative" data-bs-toggle="search"
                                              data-bs-display="static"><input
                                                class="form-control search-input search" type="search"
                                                placeholder="Tìm danh mục"
                                                aria-label="Search">
                                            <svg class="svg-inline--fa fa-magnifying-glass search-box-icon"
                                                 aria-hidden="true"
                                                 focusable="false" data-prefix="fas" data-icon="magnifying-glass"
                                                 role="img"
                                                 xmlns="http://www.w3.org/2000/svg" viewBox="0 0 512 512"
                                                 data-fa-i2svg="">
                                                <path fill="currentColor"
                                                      d="M500.3 443.7l-119.7-119.7c27.22-40.41 40.65-90.9 33.46-144.7C401.8 87.79 326.8 13.32 235.2 1.723C99.01-15.51-15.51 99.01 1.724 235.2c11.6 91.64 86.08 166.7 177.6 178.9c53.8 7.189 104.3-6.236 144.7-33.46l119.7 119.7c15.62 15.62 40.95 15.62 56.57 0C515.9 484.7 515.9 459.3 500.3 443.7zM79.1 208c0-70.58 57.42-128 128-128s128 57.42 128 128c0 70.58-57.42 128-128 128S79.1 278.6 79.1 208z">
                                                </path>
                                            </svg>
                                            <!-- <span class="fas fa-search search-box-icon"></span> Font Awesome fontawesome.com -->
                                        </form>
                                    </div>
                                </div>
                                <div class="col-auto">
                                    <button class="btn btn-primary"  href="add-category-blog.jsp">
                                        <svg class="svg-inline--fa fa-plus me-2"
                                             aria-hidden="true" focusable="false" data-prefix="fas" data-icon="plus"
                                             role="img"
                                             xmlns="http://www.w3.org/2000/svg" viewBox="0 0 448 512" data-fa-i2svg="">
                                            <path fill="currentColor"
                                                  d="M432 256c0 17.69-14.33 32.01-32 32.01H256v144c0 17.69-14.33 31.99-32 31.99s-32-14.3-32-31.99v-144H48c-17.67 0-32-14.32-32-32.01s14.33-31.99 32-31.99H192v-144c0-17.69 14.33-32.01 32-32.01s32 14.32 32 32.01v144h144C417.7 224 432 238.3 432 256z">
                                            </path>
                                        </svg>
                                        Thêm danh mục
                                    </button>
                                </div>
                            </div>
                        </div>
                        <div
                                class="mx-n4 px-4 mx-lg-n6 px-lg-6 bg-white border-top border-bottom border-200 position-relative top-1">
                            <div class="table-responsive scrollbar mx-n1 px-1">
                                <table class="table table-sm fs--1 mb-0 scroll">
                                    <thead>
                                    <tr>
                                        <th class="sort align-middle pe-5" scope="col" data-sort="customer"
                                            style="width:10%;">ID
                                        </th>
                                        <th class="sort align-middle pe-5" scope="col" data-sort="customer"
                                            style="width:15%;">Tên Danh
                                            Mục
                                        </th>
                                        <th class="sort align-middle pe-5" scope="col" data-sort="email"
                                            style="width:15%;">Danh Mục Cha
                                        </th>
                                        <th class="sort align-middle text-end pe-0" scope="col" data-sort="last-order"
                                            style="width:10%;"></th>
                                    </tr>
                                    </thead>
                                    <tbody class="list" id="table-latest-review-body">
                                    <%
                                        for (Detail cate : list_bl_cate) {
                                    %>
                                    <tr class="hover-actions-trigger btn-reveal-trigger position-static">
                                        <td class="fs--1 align-middle ps-0 py-3">
                                            <p class="mb-0 text-1100 fw-bold"><%=cate.getCatID()%></p>
                                        </td>
                                        <td class="total-orders align-middle white-space-nowrap fw-semi-bold "><%=cate.getCatName()%></td>
                                        <%if (cate.getParentID() != null) {%>
                                        <td class="total-spent align-middle white-space-nowrap fw-bold  ps-3"><%=DetailService.getInstance().getCateBlogById(cate.getParentID()).getCatName()%>
                                        </td>
                                        <%} else {%>
                                        <td class="total-spent align-middle white-space-nowrap fw-bold  ps-3">Không có
                                        </td>
                                        <%}%>
                                        <td class="city align-middle white-space-nowrap text-900 ps-7">
                                            <%
                                                for (AdminRole role : admin.getRole()) {
                                                    if (role.getTableName().equals("productCategory") && role.getPermission() == 2) {
                                            %>
                                            <a href="add-category-blog.jsp?cbid=<%=cate.getCatID()%>" class="btn btn-primary ">Sửa</a>

                                            <%
                                                }
                                                if (role.getTableName().equals("userAccount") && role.getPermission() == 3) {
                                                    if (!BlogService.getInstance().isCateContainBl(cate.getCatID())) { %>
                                            <a href="RemoveCateBlog?cbid=<%=cate.getCatID()%>" class="btn btn-primary "
                                               style="background-color:crimson;">Xóa</a>
                                            <%
                                                        }
                                                    }
                                                }
                                            %>

                                        </td>
                                    </tr>
                                    <%}%>
                                    </tbody>
                                </table>
                            </div>
                        </div>
                    </div>


                </div>
            </div>
        </div>
    </div>
    </main>
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

