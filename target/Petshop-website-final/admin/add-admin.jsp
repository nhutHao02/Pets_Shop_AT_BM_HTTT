<%@ page import="vn.edu.hcmuaf.fit.beans.UserAccount" %>
<%@ page import="vn.edu.hcmuaf.fit.services.UserService" %>
<%@ page import="vn.edu.hcmuaf.fit.beans.AdminRole" %>
<%@ page import="java.util.List" %>
<%@ page import="vn.edu.hcmuaf.fit.services.LoginService" %>
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

</head>
<%
    if (request.getSession().getAttribute("admin") == null) {
        response.sendRedirect("login.jsp");
    } else {
        UserAccount admin = (UserAccount) request.getSession().getAttribute("admin");
        boolean check = false;
        for (AdminRole role : admin.getRole()) {
            if (role.getTableName().equals("adminAccount")) {
                if (role.getPermission() == 1 || ((role.getPermission() == 2 && request.getParameter("id") != null)))
                    check = true;
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

                        <ul class="breadcrumb">
                            <li class="breadcrumb-item">Tài khoản</li>
                            <li class="breadcrumb-item">Admin</li>
                            <li class="breadcrumb-item">Thêm admin</li>
                        </ul>
                    </div>
                </div>
            </div>
        </div>
        <!-- [ breadcrumb ] end -->
        <!-- [ Main Content ] start -->
        <div class="row">
            <%if (request.getParameter("idUser") != null) {%>
            <h2 style=" font-weight: bolder; text-align: center; margin-top: 10px; margin-bottom: 30px;">Chỉnh sửa
                admin</h2>
            <hr>
            <% } else { %>
            <h2 style=" font-weight: bolder; text-align: center; margin-top: 10px; margin-bottom: 30px;">Thêm admin
                mới</h2>
            <hr>
            <% } %>
            <% String error = (String) request.getAttribute("addAdminerror"); %>
            <p style="color: red; text-align: center; text-transform: none !important;padding-top: 5px; text-align: center"><%= error == null ? "" : error%>
                    <% UserAccount users = null;
            if(request.getParameter("idUser") != null)
                    users = UserService.getInstance().getUserDetail(request.getParameter("idUser"));
            %>
            <form method="post" action="EditUserAdminController">
                <input type="text" id="id" name="id"
                       value="<%=(users != null) ? request.getParameter("idUser") : ""%>"
                       style="display: none">
                <div class="row">
                    <div class="form-group col-md-6">
                        <label class="form-label" for="inputEmail4">Tài khoản</label>
                        <input type="text" class="form-control" id="username" name="username"
                               value="<%=(users != null) ? users.getUsername() : ""%>"
                               placeholder="Tên tài khoản">
                    </div>
                    <div class="form-group col-md-6">
                        <label class="form-label" for="inputPassword4">Email</label>
                        <input type="email" class="form-control" id="inputEmail4" name="email" placeholder="Email"
                               value="<%=(users != null) ? users.getEmail() : ""%>">
                    </div>
                </div>
                <div class="row">
                    <div class="form-group col-md-6">
                        <label for="validationTooltip05" class="form-label">Số điện thoại</label>
                        <input type="text" class="form-control" id="validationTooltip05" name="phone"
                               value="<%=(users != null) ? users.getPhone() : ""%>" required
                               placeholder="+84">

                    </div>
                    <div class="form-group col-md-6">
                        <label class="form-label" for="inputEmail4">Họ và tên</label>
                        <input type="text" class="form-control" id="fullname" name="fullname" placeholder="Họ và tên"
                               value="<%=(users != null) ? users.getName() : ""%>">
                    </div>

                </div>
                <div class="row">
                    <div class="form-group col-md-6">
                        <label class="form-label" for="inputEmail4">Mật khẩu</label>
                        <input type="password" class="form-control" id="inputPassword4" name="passwd" placeholder="Mật khẩu" value="">
                    </div>
                    <div class="col-md-3 position-relative">
                        <label for="validationTooltip04" class="form-label">Chọn vị trí làm việc</label>
                        <select class="form-select" id="validationTooltip04" name="address" required>
                            <% if (request.getParameter("idUser") != null) {
                                if (users.getAddress().equals("TP.HCM")) {%>
                            <option value="TP.HCM" selected>TP.HCM</option>
                            <option value="Hà nội">Hà Nội</option>
                            <%} else {%>
                            <option value="TP.HCM">TP.HCM</option>
                            <option value="Hà nội" selected>Hà Nội</option>
                            <% }
                            } else {%>
                            <option value="TP.HCM">TP.HCM</option>
                            <option value="Hà nội">Hà Nội</option>
                            <% } %>
                        </select>
                    </div>
                    <div class="col-md-3 position-relative">
                        <label for="validationTooltip" class="form-label">Trạng thái tài khoản</label>
                        <select class="form-select" id="validationTooltip" name="status" required>
                            <% if (request.getParameter("idUser") != null) {
                                if (users.isStatus() == false) {%>
                            <option>Mở khóa</option>
                            <option selected>Khóa</option>
                            <%} else {%>
                            <option selected>Mở khóa</option>
                            <option>Khóa</option>
                            <% }
                            } else {%>
                            <option selected>Mở khóa</option>
                            <option>Khóa</option>
                            <% } %>
                        </select>
                    </div>
                </div>

                <div class="row">
                    <div class="col text-center">
                <%if (request.getParameter("idUser") != null) {%>
                <button type="submit" class="btn  btn-primary" style="margin-left: 490px; padding:10px 40px 10px 40px; font-size: large;    margin-top: 40px;margin-left: 0;">Lưu thay đổi</button>
                <%} else {%>
                <button type="submit" class="btn  btn-primary" style="margin-left: 490px; padding:10px 40px 10px 40px; font-size: large;    margin-top: 40px;margin-left: 0;">Thêm admin</button>
                <%}%>
                    </div>
                </div>
            </form>

            <%if (request.getParameter("idUser") != null) {%>
            <div class="row mt-3">
                <div class="form-group col-md-6">
                    <label class="form-label">Quyền hiện tại</label>
                    <table class="table table-bordered border-dark" id="table-role">
                        <tr>
                            <th class="text-md-center border-dark border-1">Bảng</th>
                            <th class="text-md-center border-dark border-1">Quyền</th>
                            <th class="text-md-center border-dark border-1"> Xóa</th>
                        </tr>
                        <%
                            String idUser = request.getParameter("idUser");
                            List<AdminRole> listrole = LoginService.getInstance().getListRoleAdmin(idUser);
                            for (AdminRole role : listrole) {
                                String table = "";
                                String permission = "";
                                switch (role.getTableName()) {
                                    case "product":
                                        table = "Quản lý sản phẩm";
                                        break;
                                    case "blog":
                                        table = "Quản lý tin tức";
                                        break;
                                    case "order":
                                        table = "Quản lý đơn hàng";
                                        break;
                                    case "productCategory":
                                        table = "Quản lý danh mục sản phẩm";
                                        break;
                                    case "blogCategory":
                                        table = "Quản lý danh mục tin tức";
                                        break;
                                    case "adminAccount":
                                        table = "Quản lý tài khoản admin";
                                        break;
                                    case "userAccount":
                                        table = "Quản lý tài khoản người dùng";
                                        break;
                                    case "comment":
                                        table = "Quản lý bình luận";
                                        break;
                                    case "contact":
                                        table = "Quản lý liên hệ";
                                        break;
                                    case "import":
                                    table = "Quản lý nhập hàng";
                                    break;
                                }
                                switch (role.getPermission()) {
                                    case 1:
                                        permission = "Thêm";
                                        break;
                                    case 2:
                                        permission = "Sửa";
                                        break;
                                    case 3:
                                        permission = "Xóa";
                                        break;
                                }
                        %>
                        <tr class="<%=role.getPermission()%><%=idUser%><%=role.getTableName()%>">
                            <td class="text-center border-dark border-1"><%=table%>
                            </td>
                            <td class="text-center border-dark border-1"><%=permission%>
                            </td>
                            <td class="text-center border-dark border-1">
                                <a class="btn_2 edit btn btn-primary remove" data-toggle="modal"
                                   data-target="#confirm-modal"
                                   id="delete<%=role.getPermission()%><%=idUser%><%=role.getTableName()%>"
                                   href="#">Xóa</a>
                            </td>
                        </tr>
                        <% }%>
                    </table>
                </div>
                <div class="form-group col-md-6 m-t-30">
                    <div class="input-group mb-3">
                        <label class="input-group-text" for="select-table">Bảng</label>
                        <select class="form-select" id="select-table">
                            <option value="none" selected>Chọn</option>
                            <option value="product">Quản lý sản phẩm</option>
                            <option value="import">Quản lý nhập hàng</option>
                            <option value="blog">Quản lý tin tức</option>
                            <option value="order">Quản lý đơn hàng</option>
                            <option value="productCategory">Quản lý danh mục sản phẩm</option>
                            <option value="blogCategory">Quản lý danh mục tin tức</option>
                            <option value="adminAccount">Quản lý tài khoản admin</option>
                            <option value="userAccount">Quản lý tài khoản người dùng</option>
                            <option value="comment">Quản lý bình luận</option>
                            <option value="contact">Quản lý liên hệ</option>

                        </select>
                    </div>
                    <div class="input-group mb-3">
                        <label class="input-group-text" for="select-per">Quyền</label>
                        <select class="form-select" id="select-per">
                            <option value="0" selected>Chọn</option>
                            <option value="1">Thêm</option>
                            <option value="2">Sửa</option>
                            <option value="3">Xóa</option>
                        </select>
                    </div>
                    <button class="btn btn-primary " type="submit" id="add-role">Thêm</button>
                </div>
            </div>
            <%} else {%>
            <div class="text-center m-t-30" style="font-size: 20px; color: red">Hãy thêm admin sau đó quay lại thêm quyền cho admin!</div>
            <%}%>

        </div>
        <!-- [ Main Content ] end -->
    </div>
</div>
<%
        }
    }
%>

<!-- Modal -->
<div class="modal fade" id="confirm-modal" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle"
     aria-hidden="true">
    <div class="modal-dialog modal-dialog-centered" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="exampleModalCenterTitle">Xác nhận xóa</h5>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <div class="modal-body">
                Bạn có chắc muốn xóa quyền này?
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-secondary no" data-dismiss="modal">Hủy</button>
                <button type="button" class="btn btn-primary yes" data-dismiss="modal">Xóa</button>
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
<!-- custom-chart js -->
<script src="assets/js/pages/dashboard-sale.js"></script>
<script>
    $("#add-role").click(function (e) {
        e.preventDefault();
        let idAdmin = $("#id").val();
        let table = $("#select-table").val();
        let per = $("#select-per").val();
        if (table === "none" || per === 0) {
            alert("Vui lòng chọn Bảng và Quyền");
        } else {
            $.ajax({
                type: 'get',
                url: '/Petshop_website_final_war/admin/AddRoleAdmin',
                data: {
                    idAdmin: idAdmin,
                    table: table,
                    per: per
                },
                success: function (data) {
                    window.location.href = "http://localhost:8080/Petshop_website_final_war/admin/add-admin.jsp?idUser=" + idAdmin
                }
            })
        }
    })
</script>
<script>
    $(document).ready(function () {
        deletePermission()
    })

    function deletePermission() {
        $(".remove").each(function () {
            const per = $(this).attr("id").substring(6, 7);
            const id = $(this).attr("id").substring(7, 11);
            const table = $(this).attr("id").substring(11);
            $(this).on("click", function (e) {
                e.preventDefault();
                $("button[type='button'].yes").on("click", function () {
                    $.ajax({
                        url: "/Petshop_website_final_war/admin/RemovePermission",
                        type: "post",
                        data: {
                            id: id,
                            per: per,
                            table: table
                        },
                        success: function (data) {
                            $("." + per + id + table).remove();
                        }
                    })
                })
            })
        })
    }
</script>
</body>

</html>
