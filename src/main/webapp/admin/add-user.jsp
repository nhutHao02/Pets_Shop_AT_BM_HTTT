<%@ page import="vn.edu.hcmuaf.fit.beans.UserAccount" %>
<%@ page import="vn.edu.hcmuaf.fit.services.UserService" %>
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
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="description" content="DashboardKit is made using Bootstrap 5 design framework. Download the free admin template & use it for your project.">
    <meta name="keywords" content="DashboardKit, Dashboard Kit, Dashboard UI Kit, Bootstrap 5, Admin Template, Admin Dashboard, CRM, CMS, Free Bootstrap Admin Template">
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
			if (role.getTableName().equals("userAccount")) {
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
						<a href="index.jsp" class="pc-link "><span class="pc-micon"><i class="material-icons-two-tone">home</i></span><span class="pc-mtext">Quản lý chung</span></a>
					</li>
					<li class="pc-item pc-caption">
						<label>Quản lý sản phẩm</label>
						<!-- <span>UI Components</span> -->
					</li>
					<li class="pc-item pc-hasmenu">
						<a href="#!" class="pc-link "><span class="pc-micon"><i data-feather="github">business_center</i></span><span class="pc-mtext">Thú cưng</span><span class="pc-arrow"><i data-feather="chevron-right"></i></span></a>
						<ul class="pc-submenu">
							<li class="pc-item"><a class="pc-link" href="list-products">Danh sách thú cưng</a></li>
							<li class="pc-item"><a class="pc-link" href="edit-product.jsp">Thêm thú cưng</a></li>
						</ul>
					</li>
					<li class="pc-item pc-hasmenu">
						<a href="#!" class="pc-link "><span class="pc-micon"><i class="material-icons-two-tone">business_center</i></span><span class="pc-mtext">Phụ kiện</span><span class="pc-arrow"><i data-feather="chevron-right"></i></span></a>
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
						<a href="products-status.jsp" class="pc-link "><span class="pc-micon"><i class="material-icons-two-tone">history_edu</i></span><span class="pc-mtext">Tình trạng đơn hàng</span></a>
					</li>
					<li class="pc-item pc-caption">
						<label>Quản lý tin tức</label>
					</li>
					<li class="pc-item pc-hasmenu">
						<a href="#!" class="pc-link "><span class="pc-micon"><i class="material-icons-two-tone" data-feather="file-minus"></i></span><span class="pc-mtext">Tin tức</span><span class="pc-arrow"><i data-feather="chevron-right"></i></span></a>
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
						<a href="#!" class="pc-link "><span class="pc-micon"><i class="material-icons-two-tone" data-feather="cpu"></i></span><span class="pc-mtext">Admin</span><span class="pc-arrow"><i data-feather="chevron-right"></i></span></a>
						<ul class="pc-submenu">
							<li class="pc-item"><a class="pc-link" href="list-admin.jsp">Danh sách admin</a></li>
							<li class="pc-item"><a class="pc-link" href="add-admin.jsp">Thêm admin</a></li>
						</ul>
					</li>
					<li class="pc-item pc-hasmenu">
						<a href="#!" class="pc-link "><span class="pc-micon"><i class="material-icons-two-tone" data-feather="user"></i></span><span class="pc-mtext">Người dùng</span><span class="pc-arrow"><i data-feather="chevron-right"></i></span></a>
						<ul class="pc-submenu">
							<li class="pc-item"><a class="pc-link" href="list-user.jsp">Danh sách người dùng</a></li>
							<li class="pc-item"><a class="pc-link" href="add-user.jsp">Thêm người dùng</a></li>
						</ul>
					</li>
					<li class="pc-item pc-caption">
						<label>Quản lý bình luận</label>
					</li>
					<li class="pc-item">
						<a href="list-comment.jsp" class="pc-link "><span class="pc-micon"><i data-feather="message-circle">history_edu</i></span><span class="pc-mtext">Bình luận</span></a>
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
                            <li class="breadcrumb-item">Tài khoản</li>
                            <li class="breadcrumb-item">Người dùng</li>
                            <li class="breadcrumb-item">Thêm người dùng</li>
                        </ul>
                    </div>
                </div>
            </div>
        </div>
        <!-- [ breadcrumb ] end -->
        <!-- [ Main Content ] start -->
		<div class="row">
			<%if (request.getParameter("idUser") != null) {%>
			<h2 style=" font-weight: bolder; text-align: center; margin-top: 10px; margin-bottom: 30px;">Chỉnh sửa người dùng</h2>
			<hr>
			<% }else{ %>
			<h2 style=" font-weight: bolder; text-align: center; margin-top: 10px; margin-bottom: 30px;">Thêm người dùng
				mới</h2>
			<hr>
			<% } %>
			<% String error = (String) request.getAttribute("addUsererror"); %>
			<p style="color: red; text-align: center; text-transform: none !important;padding-top: 5px; text-align: center"><%= error == null ? "" : error%>
					<% UserAccount users = null;
            if(request.getParameter("idUser") != null)
                    users = UserService.getInstance().getUserDetail(request.getParameter("idUser"));
            %>
			<form method="post" action="EditUserCustomerController">
			<input type="text" id="id" name="id"
				   value="<%=(users != null) ? request.getParameter("idUser") : ""%>"
				   style="display: none">
				<div class="row">
					<div class="form-group col-md-6">
						<label class="form-label" for="inputEmail4">Tài khoản</label>
						<input type="text" class="form-control" id="username" name="username" value="<%=(users != null) ? users.getUsername() : ""%>"
							   placeholder="Tên tài khoản">
					</div>
					<div class="form-group col-md-6">
						<label class="form-label" for="inputPassword4">Email</label>
						<input type="email" class="form-control" id="inputEmail4" name="email" placeholder="Email" value="<%=(users != null) ? users.getEmail() : ""%>">
					</div>
				</div>
				<div class="row">
					<div class="form-group col-md-6">
						<label for="validationTooltip04" class="form-label">Địa chỉ</label>
						<input type="text" class="form-control" id="validationTooltip05" name="address" required
							   placeholder="Địa chỉ" value="<%=(users != null) ? users.getAddress() : ""%>">

					</div>
					<div class="form-group col-md-6">
						<label class="form-label" for="inputEmail4">Họ và tên</label>
						<input type="text" class="form-control" id="fullname" name="fullname" placeholder="Họ và tên" value="<%=(users != null) ? users.getName() : ""%>">
					</div>

				</div>
				<div class="row">
					<div class="form-group col-md-6">
						<label class="form-label" for="inputEmail4">Mật khẩu</label>
						<input type="password" class="form-control" id="inputPassword4" name="passwd" placeholder="Mật khẩu" value="">
					</div>
					<div class="col-md-3 position-relative">
						<label for="validationTooltip05" class="form-label">Số điện thoại</label>
						<input type="text" class="form-control" id="phone" name="phone"
							   placeholder="+84" value="<%=(users != null) ? users.getPhone() : ""%>">
					</div>
					<div class="col-md-3 position-relative">
						<label for="validationTooltip04" class="form-label">Trạng thái tài khoản</label>
						<select class="form-select" id="validationTooltip04" name="status" required>
							<% if(request.getParameter("idUser") != null) {
								if(users.isStatus() == false) {%>
							<option>Mở khóa</option>
							<option selected>Khóa</option>
							<%} else {%>
							<option selected>Mở khóa</option>
							<option>Khóa</option>
							<% }
							}else{%>
							<option selected>Mở khóa</option>
							<option>Khóa</option>
							<% } %>
						</select>
						<%--            <div class="invalid-tooltip">--%>
						<%--              Bạn chưa nhập vào ô này hoặc nhập chưa đúng định dạng số điện thoại--%>
						<%--            </div>--%>
					</div>
				</div>
				<%--        <div class="form-group">--%>
				<%--          <div class="form-check" style="margin-top: 10px;">--%>
				<%--            <input class="form-check-input" type="checkbox" id="gridCheck">--%>
				<%--            <label class="form-check-label" for="gridCheck">Tôi chắc chắn muốn thêm người này vào vị trí admin</label>--%>
				<%--          </div>--%>
				<%--        </div>--%>
				<p style="color: red; text-align: center; text-transform: none !important;padding-top: 5px; text-align: center"><%= error == null ? "" : error%>
						<%if (request.getParameter("idUser") != null) {%>
					<button type="submit" class="btn  btn-primary"
							style="margin-left: 490px; padding:10px 40px 10px 40px; font-size: large;    margin-top: 40px;margin-left: 0;">
						Sửa người dùng
					</button>
						<%} else {%>
					<button type="submit" class="btn  btn-primary"
							style="margin-left: 490px; padding:10px 40px 10px 40px; font-size: large;    margin-top: 40px;margin-left: 0;">
						Thêm người dùng
					</button>
						<%}%>
			</form>
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

<!-- Apex Chart -->
<script src="assets/js/plugins/apexcharts.min.js"></script>
<!-- custom-chart js -->
<script src="assets/js/pages/dashboard-sale.js"></script>
</body>

</html>
