<%@ page import="vn.edu.hcmuaf.fit.services.ProductService" %>
<%@ page import="vn.edu.hcmuaf.fit.services.DetailService" %>
<%@ page import="java.util.List" %>
<%@ page import="vn.edu.hcmuaf.fit.beans.*" %>
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
    <script type="text/javascript" src="<%=request.getContextPath()%>/libraries/ckeditor/ckeditor.js"></script>
    <style>
        .input-file::-webkit-file-upload-button {
            background: #00BFFF;
            border-radius: 50px;
            border: none;
            color: #fff;
            font-weight: 700;
            padding: 8px 25px;
            margin-right: 3px;
            transition: all 0.3s;
        }
    </style>
</head>
<%
    if (request.getSession().getAttribute("admin") == null) {
        response.sendRedirect("login.jsp");
    } else {
        UserAccount admin = (UserAccount) request.getSession().getAttribute("admin");
        boolean check = false;
        for (AdminRole role : admin.getRole()) {
            if (role.getTableName().equals("product")) {
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
                            <li class="breadcrumb-item">Quản lý sản phẩm</li>
                            <li class="breadcrumb-item">Phụ kiện</li>
                            <li class="breadcrumb-item">Thêm phụ kiện</li>
                        </ul>
                    </div>
                </div>
            </div>
        </div>
        <div class="row">

            <main class="main" id="top">
                <div class="container-fluid px-0" data-layout="container">

                    <!-- <div class="content"> -->

                    <form name="item" method="post" enctype="multipart/form-data" class="mb-9">
                            <% Product p = null;
                            if (request.getParameter("pid") != null)
                            p = ProductService.getInstance().getProductDetail(request.getParameter("pid"));
                    %>
                        <div class="row g-3 flex-between-end mb-5">
                            <div class="col-auto">
                                <%if (request.getParameter("pid") != null) {%>

                                <h2 class="mb-2">Chỉnh sửa phụ kiện</h2>
                                <%} else {%>
                                <h2 class="mb-2">Thêm phụ kiện</h2>
                                <%}%>
                                <!-- <h5 class="text-700 fw-semi-bold">
                                  Orders placed across your store
                                </h5> -->
                            </div>
                            <div class="col-auto">
                                <%if (request.getParameter("pid") != null) {%>
                                <button class="btn btn-primary mb-2 mb-sm-0" type="submit">
                                    Sửa phụ kiện
                                </button>
                                <%} else {%>
                                <button class="btn btn-primary mb-2 mb-sm-0" type="submit">
                                    Đăng phụ kiện
                                </button>
                                <%}%>
                            </div>
                        </div>
                        <input type="text" id="pid" name="pid"
                               value="<%=(p != null) ? request.getParameter("pid") : ""%>"
                               style="display: none">
                        <h4 class="mb-3">Tên phụ kiện</h4>
                        <div class="row g-5">
                            <div class="col-12 col-xl-8">
                                <input name="name" id="name"
                                       class="form-control mb-5"
                                       type="text"
                                       placeholder="Viết tên phụ kiện tại đây..."
                                       value="<%=(p != null) ? p.getProductName() : ""%>" required/>

                                <h4 class="mb-3">Mô tả ngắn</h4>
                                <input name="description" id="descripsion" class="form-control mb-5" type="text"
                                       placeholder="Viết mô tả ngắn tại đây..."
                                       value="<%=(p != null) ? p.getDescription() : ""%>" required/>

                                <div class="mb-6">
                                    <h4 class="mb-3">Giới thiệu phụ kiện</h4>
                                    <textarea name="description" rows="20" cols="10" id="editor" required>
                          <%=(p != null) ? p.getDital() : ""%>
                      </textarea>
                                    <script>
                                        CKEDITOR.replace('editor');
                                    </script>

                                </div>
                                <h4 class="mb-3">Thêm ảnh</h4>
                                <div class="dropzone dropzone-multiple p-0 mb-5 dz-clickable images-container"
                                     id="my-awesome-dropzone" data-dropzone="data-dropzone">
                                    <% int i = 0;
                                        if (p != null) {
                                            if (p.getImage() != null) {%>
                                    <div class="image-container" style="display: inline-flex">
                                        <div id="container<%=i%>"
                                             data-dz-message="data-dz-message">
                                            <div class="border bg-white rounded-3 d-flex flex-center position-relative me-2 mb-2 dz-image-preview"
                                                 style="height:80px;width:80px;">
                                                <img class="img-product-review dz-image" src="<%=p.getImage()%>">
                                                <div class="control">
                                                    <a id="remove<%=i%>" class="dz-remove text-400 remove" href=""
                                                       data-dz-remove="">
                                                        <svg xmlns="http://www.w3.org/2000/svg" width="16px"
                                                             height="16px" viewBox="0 0 24 24" fill="none"
                                                             stroke="currentColor" stroke-width="2"
                                                             stroke-linecap="round" stroke-linejoin="round"
                                                             class="feather feather-x">
                                                            <line x1="18" y1="6" x2="6" y2="18"></line>
                                                            <line x1="6" y1="6" x2="18" y2="18"></line>
                                                        </svg>
                                                    </a>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <%
                                                i++;
                                            }
                                        }
                                    %>
                                    <%if (p != null) {
                                        if (p.getImages() != null) {
                                            for(ImageProduct img : p.getImages()){%>
                                    <div class="image-container" style="display: inline-flex">
                                        <div id="container<%=i%>"
                                             data-dz-message="data-dz-message">
                                            <div class="border bg-white rounded-3 d-flex flex-center position-relative me-2 mb-2 dz-image-preview"
                                                 style="height:80px;width:80px;">
                                                <img class="img-product-review dz-image" src="<%=img.getImg()%>">
                                                <div class="control">
                                                    <a id="remove<%=i%>" class="dz-remove text-400 remove" href=""
                                                       data-dz-remove="">
                                                        <svg xmlns="http://www.w3.org/2000/svg" width="16px"
                                                             height="16px" viewBox="0 0 24 24" fill="none"
                                                             stroke="currentColor" stroke-width="2"
                                                             stroke-linecap="round" stroke-linejoin="round"
                                                             class="feather feather-x">
                                                            <line x1="18" y1="6" x2="6" y2="18"></line>
                                                            <line x1="6" y1="6" x2="18" y2="18"></line>
                                                        </svg>
                                                    </a>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <%
                                                    i++;
                                                }
                                            }
                                        }
                                    %>
                                    <div class="image-container">
                                        <div id="container<%=i%>" class="dz-message text-600"
                                             data-dz-message="data-dz-message">
                                            <input type="file" id="image<%=i%>" name="files" class="input-file"
                                                   accept="image/*"/>
                                            <br>
                                            <img class="mt-3 me-2" src="../admin/assets/images/image-icon.png"
                                                 width="40" alt="">
                                        </div>
                                    </div>
                                </div>
                                <input type="text" id="deletedFile" value="" style="display: none">
                            </div>
                            <div class="col-12 col-xl-4">
                                <div class="row g-2">
                                    <div class="col-12 col-xl-12">
                                        <div class="card">
                                            <div class="card-body">
                                                <h4 class="card-title mb-4">Chi tiết thú cưng</h4>
                                                <div class="row">
                                                    <div class="col-12 col-sm-6 col-xl-12">
                                                        <div class="mb-4 border-dashed-bottom pb-4">
                                                            <%
                                                                List<Detail> listCate = DetailService.getInstance().listCateAccessory();%>
                                                            <div class="d-flex flex-wrap justify-content-between mb-2">
                                                                <h5>Danh mục con</h5>
                                                            </div>
                                                            <select class="form-select mb-3" aria-label="category"
                                                                    id="cateChild" name="cateChild">
                                                                <%
                                                                    if (p != null) {
                                                                        for (Detail cate : listCate) {
                                                                %>
                                                                <option value="<%=cate.getCatID()%>"><%=cate.getCatName()%>
                                                                </option>
                                                                <%
                                                                    }
                                                                } else {
                                                                    for (Detail cate : listCate) {
                                                                %>
                                                                <option value="<%=cate.getCatID()%>"><%=cate.getCatName()%>
                                                                </option>
                                                                <%
                                                                        }
                                                                    }
                                                                %>

                                                            </select>

                                                            <div class="d-flex flex-wrap justify-content-between mb-2">
                                                                <h5>Kích Thước</h5>
                                                            </div>
                                                            <input name="size" id="size"
                                                                   value="<%=(p != null) ? p.getSize() : ""%>"
                                                                   class="form-control mb-3" type="text"
                                                                   placeholder="" required/>

                                                            <div class="d-flex flex-wrap justify-content-between mb-2">
                                                                <h5>Màu sắc</h5>
                                                            </div>
                                                            <input name="mausac" id="mausac"
                                                                   value="<%=(p != null) ? p.getMausac() : ""%>"
                                                                   class="form-control mb-3" type="text"
                                                                   placeholder="Ví dụ: Trắng" required/>

                                                            <div class="d-flex flex-wrap justify-content-between mb-2">
                                                                <h5>Số Lượng</h5>
                                                            </div>
                                                            <input name="quantity" id="quantity"
                                                                   value="<%=(p != null) ? p.getQuantity() : ""%>"
                                                                   class="form-control mb-3" type="text"
                                                                   placeholder="Ví dụ: 5" required/>

                                                            <div class="d-flex flex-wrap justify-content-between mb-2">
                                                                <h5>Giá</h5>
                                                            </div>
                                                            <input name="price" id="price"
                                                                   value="<%=(p != null) ? p.getPrice() : ""%>"
                                                                   class="form-control mb-3" type="text"
                                                                   placeholder="Đồng" required/>

                                                            <div class="d-flex flex-wrap justify-content-between mb-2">
                                                                <h5>Trạng thái</h5>
                                                            </div>
                                                            <select class="form-select mb-3" name="status" id="status">
                                                                <%
                                                                    if (p != null) {
                                                                        if (p.getStatus() == 1) {
                                                                %>
                                                                <option value="1" selected>Hiển thị</option>
                                                                <option value="0">Ẩn</option>
                                                                <%} else {%>
                                                                <option value="1">Hiển thị</option>
                                                                <option value="0" selected>Ẩn</option>
                                                                <%
                                                                    }
                                                                } else {
                                                                %>
                                                                <option value="1" selected>Hiển thị</option>
                                                                <option value="0">Ẩn</option>
                                                                <%}%>
                                                            </select>

                                                            <div class="d-flex flex-wrap justify-content-between mb-2">
                                                                <h5>Giảm giá</h5>
                                                            </div>
                                                            <select class="form-select mb-3" name="Promotional"
                                                                    id="Promotional">
                                                                <%
                                                                    if (p != null) {
                                                                        if (p.getPromotional() == 1) {
                                                                %>
                                                                <option value="1" selected>Có</option>
                                                                <option value="0">Không</option>
                                                                <%} else {%>
                                                                <option value="1">Có</option>
                                                                <option value="0" selected>Không</option>
                                                                <%
                                                                    }
                                                                } else {
                                                                %>
                                                                <option value="1">Có</option>
                                                                <option value="0" selected>Không</option>
                                                                <%}%>
                                                            </select>

                                                            <div class="d-flex flex-wrap justify-content-between mb-2">
                                                                <h5>Giảm bao nhiêu?(%)</h5>
                                                            </div>
                                                            <input name="PromotionalPrice" id="PromotionalPrice"
                                                                   value="<%=(p != null) ? p.getPromotionalPrice() : "0"%>"
                                                                   class="form-control mb-3" type="text"
                                                                   placeholder="Ví dụ: 10"/>
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
                </form>
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

<script src="bonus/js/bootstrap.min.js"></script>
<script src="bonus/js/lodash.min.js"></script>
<script src="bonus/tinymce/tinymce.min.js"></script>
<script src="bonus/js/dropzone.min.js"></script>
<script src="bonus/js/phoenix.js"></script>


<!-- Apex Chart -->
<script src="assets/js/plugins/apexcharts.min.js"></script>
<!-- custom-chart js -->
<script src="assets/js/pages/dashboard-sale.js"></script>
</body>
<script>
    const idProduct = $("#pid").val();
    if (idProduct.length > 0) {
        $(".remove").each(function () {
            const id = this.id.substring(6);
            removeFilesData(id)
        })
    } else {
        removeFilesData(1)
    }

    function reloadUpLoadFile() {
        $(".input-file").each(function () {
            $(this).on('change', function (e) {
                const idName = $(this).attr("id");
                const id = idName.substring(5);
                const value = $(this).val();
                let name = "";
                if (value.indexOf("\\") != -1)
                    name = value.substring(value.lastIndexOf("\\") + 1);
                else
                    name = value.substring(value.lastIndexOf("/") + 1);
                uploadFile(id, name, e)
            })
        });
    }

    $(".input-file").each(function () {
        $(this).on('change', function (e) {
            const idName = $(this).attr("id");
            const id = idName.substring(5);
            const value = $(this).val();
            let name = "";
            if (value.indexOf("\\") != -1)
                name = value.substring(value.lastIndexOf("\\") + 1);
            else
                name = value.substring(value.lastIndexOf("/") + 1);
            console.log(id + ", " + name + ", ")
            uploadFile(id, name, e)
        })
    });

    function uploadFile(id, name, event) {
        event.stopPropagation();
        event.preventDefault();
        const files = event.target.files;
        const data = new FormData();
        $.each(files, function (key, value) {
            data.append(key, value);
        });
        postFilesData(id, name, data);
    }

    function removeFilesData(idDelete) {
        $("#remove" + idDelete).on("click", function (e) {
            e.preventDefault();
            const id = this.id.substring(6);
            const src = $("#container" + id + " .img-product-review").attr("src");
            let imageName = "";
            if (src.indexOf("\\") != -1)
                imageName = src.substring(src.lastIndexOf("\\") + 1);
            else
                imageName = src.substring(src.lastIndexOf("/") + 1);
            $("#container" + id).parent().remove();
            const value = $("#deletedFile").val();
            if (value.length > 0)
                $("#deletedFile").val($("#deletedFile").val() + imageName + ",");
            else
                $("#deletedFile").val(imageName + ",");
            console.log($("#deletedFile").val());
        });
    }

    function postFilesData(id, name, data) {
        let bool = false;
        $(".img-product-review").each(function () {
            let nameFile = $(this).attr("src");
            if (nameFile.indexOf(name) != -1) {
                bool = true;
            }
        })
        if (bool === false) {
            $.ajax({
                url: '/Petshop_website_final_war/UpDownImageProductController',
                type: 'POST',
                data: data,
                cache: false,
                dataType: 'json',
                processData: false,
                contentType: false,
                success: function (data, textStatus, jqXHR) {
                    //success
                },
                error: function (jqXHR, textStatus, errorThrown) {
                    $("#container" + id).empty();
                    $(".image-container").css("display", "inline-flex");
                    $("#container" + id).removeClass("dz-message text-600")
                    $("#container" + id).prepend(`<div class="border bg-white rounded-3 d-flex flex-center position-relative me-2 mb-2 dz-image-preview" style="height:80px;width:80px;">
                                                <img class="img-product-review dz-image" src="http://localhost:8080/Petshop_website_final_war/img/products/` + name + `">
                                                <div class="control">
                                                <a id="remove` + id + `" class="dz-remove text-400 remove" href="" data-dz-remove="">
                                                    <svg xmlns="http://www.w3.org/2000/svg" width="16px" height="16px" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="feather feather-x">
                                                        <line x1="18" y1="6" x2="6" y2="18"></line>
                                                        <line x1="6" y1="6" x2="18" y2="18"></line>
                                                    </svg>
                                                </a>
                                                </div>
                                            </div>`)
                    $("#my-awesome-dropzone").append(`<div class="image-container">
                                        <div id="container` + (parseInt(id) + 1) + `" class="dz-message text-600" data-dz-message="data-dz-message">
                                            <input type="file" id="image` + (parseInt(id) + 1) + `" name="files" class="input-file" accept="image/*" />
                                            <br>
                                            <img class="mt-3 me-2" src="../admin/assets/images/image-icon.png" width="40" alt="">
                                        </div>
                                    </div>`)
                    let value = $("#deletedFile").val();
                    if (value.indexOf(name) !== -1) {
                        value = value.replace(name + ",", "");
                        $("#deletedFile").val(value);
                    }
                    console.log($("#deletedFile").val());
                    reloadUpLoadFile();
                    removeFilesData(id);
                }
            });
        } else {
            alert("Bạn đã upload ảnh này rồi !")
        }
    }
</script>
<script>
    $("button[type='submit']").click(function (e) {
        e.preventDefault();
        const descripsion = $("#descripsion").val();
        const detail = CKEDITOR.instances.editor.getData();
        const status = $("#status").val();
        const mausac = $("#mausac").val();
        const size = $("#size").val();
        const cateChild = $("#cateChild").val();
        const Promotional = $("#Promotional").val();
        const PromotionalPrice = $("#PromotionalPrice").val();
        const id = $("#pid").val();
        const name = $("#name").val();
        const quantity = $("#quantity").val();
        const price = $("#price").val();
        // const imageLink = $(".img-product-review").attr("src").substring(61);
        // console.log(imageLink);
        let imgFile = []
        $(".img-product-review").each(function () {
            let nameFile = $(this).attr("src");
            if (nameFile.indexOf("\\") != -1)
                imgFile.push(nameFile.substring(nameFile.lastIndexOf("\\") + 1));
            else
                imgFile.push(nameFile.substring(nameFile.lastIndexOf("/") + 1));
        })
        const removed = $("#deletedFile").val();
        const oldImg = removed.substring(0, removed.length - 1);
        $.ajax({
            url: "/Petshop_website_final_war/admin/edit-accessory",
            type: "GET",
            data: {
                quantity: quantity,
                oldImg: oldImg,
                id: id,
                name: name,
                price: price,
                description: descripsion,
                detail: detail,
                status: status,
                mausac: mausac,
                size: size,
                cateChild: cateChild,
                Promotional: Promotional,
                PromotionalPrice: PromotionalPrice,
                imgFile: imgFile,
            },
            success: function () {
                if (id.length < 1)
                    alert("Thêm sản phẩm thành công");
                else
                    alert("Cập nhật sản phẩm thành công");
                window.location.href = "list-accessory"
            }
        })
    })
</script>
</html>
