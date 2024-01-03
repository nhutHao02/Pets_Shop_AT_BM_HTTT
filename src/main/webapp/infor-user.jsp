<%@ page import="java.util.List" %>
<%@ page import="vn.edu.hcmuaf.fit.services.ProductService" %>
<%@ page import="vn.edu.hcmuaf.fit.beans.UserAccount" %>
<%@ page import="vn.edu.hcmuaf.fit.dao.KeyDAO" %>
<%@ page import="vn.edu.hcmuaf.fit.tool.DSA" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="utf-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<head lang="zxx">
    <head>
        <meta charset="UTF-8">
        <meta name="description" content="Ogani Template">
        <meta name="keywords" content="Ogani, unica, creative, html">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <meta http-equiv="X-UA-Compatible" content="ie=edge">
        <title>Pet Shop</title>

        <!-- Google Font -->
        <!-- <link href="https://fonts.googleapis.com/css2?family=Cairo:wght@200;300;400;600;900&display=swap" rel="stylesheet"> -->
        <link href="https://fonts.googleapis.com/css?family=Poppins:100,100i,200,200i,300,300i,400,400i,500,500i,600,600i,700,700i,800,800i,900,900i&amp;display=swap"
              rel="stylesheet">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.2.0/css/all.min.css"
              integrity="sha512-xh6O/CkQoPOWDdYTDqeRdPCVd1SpvCA9XXcUnZS2FmJNp1coAFzvtCN9BmamE+4aHK8yyUHUSCcJHgXloTyT2A=="
              crossorigin="anonymous" referrerpolicy="no-referrer"/>
        <link rel="icon" type="image/png" sizes="16x16" href="img/favicons/favicon-16x16.png">
        <!-- Css Styles -->
        <link rel="stylesheet" href="css/bootstrap.min.css" type="text/css">
        <link rel="stylesheet" href="css/font-awesome.min.css" type="text/css">
        <link rel="stylesheet" href="css/elegant-icons.css" type="text/css">
        <link rel="stylesheet" href="css/jquery-ui.min.css" type="text/css">
        <link rel="stylesheet" href="css/owl.carousel.min.css" type="text/css">
        <link rel="stylesheet" href="css/slicknav.min.css" type="text/css">
        <link rel="stylesheet" href="css/style.css" type="text/css">
        <style type="text/css">@font-face {
            font-family: Roboto;
            /*src: url("chrome-extension://mcgbeeipkmelnpldkobichboakdfaeon/css/Roboto-Regular.ttf");*/
        }</style>
    </head>
    <style>
        .dropdown {
            position: relative;
        }

        .dropdown-toggle {
            white-space: nowrap;
        }

        .dropdown-toggle::after {
            display: inline-block;
            margin-left: 0.255em;
            vertical-align: 0.255em;
            content: "";
            border-top: 0.3em solid;
            border-right: 0.3em solid transparent;
            border-bottom: 0;
            border-left: 0.3em solid transparent;
        }

        .dropdown-toggle:empty::after {
            margin-left: 0;
        }

        .dropdown-menu {
            position: absolute;
            top: 100%;
            left: 0;
            z-index: 50;
            display: none;
            min-width: 12rem;
            padding: 0.5rem 0;
            margin: 0.125rem 0 0;
            font-size: 0.875rem;
            color: #293240;
            text-align: left;
            list-style: none;
            background-color: #00BFFF;
            background-clip: padding-box;
            border: 0 solid rgba(0, 0, 0, 0.15);
            border-radius: 4px;
        }

        .dropdown-menu-left {
            right: auto;
            left: 0;
        }

        .dropdown-item {
            display: block;
            width: 100%;
            padding: 0.65rem 1.5rem;
            clear: both;
            font-weight: 400;
            color: #111;
            text-align: inherit;
            white-space: nowrap;
            background-color: transparent;
            border: 0;
        }

        .dropdown-item:hover, .dropdown-item:focus {
            color: #00BFFF;
            text-decoration: none;
            background-color: #e3e1fc;
        }

        .dropdown-item.active, .dropdown-item:active {
            color: #00BFFF;
            text-decoration: none;
            background-color: #e3e1fc;
        }

        .dropdown-item.disabled, .dropdown-item:disabled {
            color: #6c757d;
            pointer-events: none;
            background-color: transparent;
        }

        .dropdown-menu.show {
            display: block;
        }

        .dropdown-header {
            display: block;
            padding: 0.5rem 1.5rem;
            margin-bottom: 0;
            font-size: 0.76563rem;
            color: #6c757d;
            white-space: nowrap;
        }

        .dropdown-item-text {
            display: block;
            padding: 0.65rem 1.5rem;
            color: #293240;
        }

        .dropdown-toggle.arrow-none:after {
            display: none;
        }

        .avatar-wrapper {
            position: relative;
            height: 200px;
            width: 200px;
            margin: 50px auto;
            border-radius: 50%;
            overflow: hidden;
            box-shadow: 1px 1px 15px -5px black;
            transition: all .3s ease;
        }

        .avatar-wrapper :hover {
            transform: scale(1.05);
            cursor: pointer;
        }

        .avatar-wrapper :hover .profile-pic {
            opacity: .5;
        }

        .profile-pic {
            height: 100%;
            width: 100%;
            transition: all .3s ease;
        }

        .profile-pic:after {
            font-family: FontAwesome;
            content: "\f007";
            top: 0;
            left: 0;
            width: 100%;
            height: 100%;
            position: absolute;
            font-size: 190px;
            background: #ecf0f1;
            color: #34495e;
            text-align: center;
        }

        .input-file {
            color: transparent;
            margin-left: 230px;
            margin-bottom: 50px;

        }

        .input-file::before {
            background: #00BFFF;
            border-radius: 50px;
            border: none;
            color: #fff;
            font-weight: 700;
            transition: all 0.3s;
        }
        #myTable {
            display: none;
            position: fixed;
            top: 50%;
            left: 50%;
            transform: translate(-50%, -50%);
            padding: 20px;
            background-image: url(img/breadcrumb.jpg);
            background-position: top right;
            z-index: 1;
            border-radius: 10px;
            border: 1px black;
            width: 380px;
        }
        #myTable label {
            display: inline-block;
            width: 100px;
        }
        .overlayT {
            position: fixed;
            top: 0;
            left: 0;
            width: 100%;
            height: 100%;
            background-color: rgba(0, 0, 0, 0.5);
            opacity: 0;
            visibility: hidden;
            z-index: 0;
            transition: opacity 0.5s ease;
        }
        .overlayT.show {
            opacity: 1;
            visibility: visible;
        }

        select.pdw {
            min-width: 200px;
            height: 30px;
            border-radius: 4px;
        }
        .bt1 {
            background-color: #007bff;
            border-radius: 5px;
            width: 140px;
            padding: 7px;
            text-align: center;
            color: white;
        }

        .bt2 {
            background-color: #007bff;
            border-radius: 5px;
            width: 90px;
            padding: 7px;
            display: inline-block;
            text-align: center;
            color: white;

        }
        #myTableK {
            display: none;
            position: fixed;
            top: 50%;
            left: 50%;
            transform: translate(-50%, -50%);
            padding: 20px;
            background-image: url(img/breadcrumb.jpg);
            background-position: top right;
            z-index: 1;
            border-radius: 10px;
            border: 1px black;
            width: 380px;
        }
        #myTablerb {
            display: none;
            position: fixed;
            top: 50%;
            left: 50%;
            transform: translate(-50%, -50%);
            padding: 20px;
            background-image: url(img/breadcrumb.jpg);
            background-position: top right;
            z-index: 1;
            border-radius: 10px;
            border: 1px black;
            width: 380px;
        }


        .overlayT {
            position: fixed;
            top: 0;
            left: 0;
            width: 100%;
            height: 100%;
            background-color: rgba(0, 0, 0, 0.5);
            opacity: 0;
            visibility: hidden;
            z-index: 0;
            transition: opacity 0.5s ease;
        }

        .overlayT.show {
            opacity: 1;
            visibility: visible;
        }
        #myTableTK {
            display: none;
            position: fixed;
            top: 50%;
            left: 50%;
            transform: translate(-50%, -50%);
            padding: 20px;
            background-image: url(img/breadcrumb.jpg);
            background-position: top right;
            z-index: 1;
            border-radius: 10px;
            border: 1px black;
            width: 380px;
        }
        #myTable label {
            display: inline-block;
            width: 100px;
        }
        .button-container {
            display: flex;
        }
        #copyIcon {
            font-size: 1.5em;
            cursor: pointer;
        }
    </style>


<body>

<!-- Floatting -->
<div class="add-button">
    <div class="sub-button tl">
        <i class="fa-solid fa-phone"></i>
    </div>
    <div class="sub-button tr">
        <i class="fa-brands fa-facebook-messenger"></i>
    </div>
    <div class="sub-button bl">
        <i class="fa-brands fa-facebook"></i>
    </div>
    <div class="sub-button br">
        <i class="fa-brands fa-instagram"></i>
    </div>
</div>


<!-- Page Preloder -->
<div id="preloder" style="display: none;">
    <div class="loader" style="display: none;"></div>
</div>

<!-- Humberger Begin -->
<div class="humberger__menu__overlay"></div>
<div class="humberger__menu__wrapper">
    <div class="humberger__menu__logo">
        <a href="#"><img src="img/logo.png" alt=""></a>
    </div>
    <div class="humberger__menu__cart">
        <ul>
            <li><a href="#"><i class="fa fa-heart"></i> <span>1</span></a></li>
            <li><a href="#"><i class="fa fa-shopping-bag"></i> <span>3</span></a></li>
        </ul>
        <div class="header__cart__price">item: <span>$150.00</span></div>
    </div>
    <div class="humberger__menu__widget">
        <div class="header__top__right__language">
            <img src="img/language.png" alt="">
            <div>English</div>
            <span class="arrow_carrot-down"></span>
            <ul>
                <li><a href="#">Spanis</a></li>
                <li><a href="#">English</a></li>
            </ul>
        </div>
        <div class="header__top__right__auth">
            <a href="#"><i class="fa fa-user"></i> Login</a>
        </div>
    </div>
    <nav class="humberger__menu__nav mobile-menu">
        <ul>
            <li class="active"><a href="index.jsp">Home</a></li>
            <li><a href="all-products.jsp">Shop</a></li>
            <li><a href="#">Pages</a>
                <ul class="header__menu__dropdown">
                    <li><a href="product-details.jsp">Shop Details</a></li>
                    <li><a href="shoping-cart.jsp">Shoping Cart</a></li>
                    <li><a href="checkout.jsp">Check Out</a></li>
                    <li><a href="blog-details.jsp">Blog Details</a></li>
                </ul>
            </li>
            <li><a href="blog.jsp">Blog</a></li>
            <li><a href="contact.jsp">Contact</a></li>
        </ul>
    </nav>
    <div id="mobile-menu-wrap">
        <div class="slicknav_menu"><a href="#" aria-haspopup="true" role="button" tabindex="0"
                                      class="slicknav_btn slicknav_collapsed" style="outline: none;"><span
                class="slicknav_menutxt">MENU</span><span class="slicknav_icon"><span
                class="slicknav_icon-bar"></span><span class="slicknav_icon-bar"></span><span
                class="slicknav_icon-bar"></span></span></a>
            <nav class="slicknav_nav slicknav_hidden" aria-hidden="true" role="menu" style="display: none;">
                <ul>
                    <li class="active"><a href="index.jsp" role="menuitem">Home</a></li>
                    <li><a href="all-products.jsp" role="menuitem">Shop</a></li>
                    <li class="slicknav_collapsed slicknav_parent"><a href="#" role="menuitem" aria-haspopup="true"
                                                                      tabindex="-1" class="slicknav_item slicknav_row"
                                                                      style="outline: none;"><a href="#">Pages</a>
                        <span class="slicknav_arrow">►</span></a>
                        <ul class="header__menu__dropdown slicknav_hidden" role="menu" aria-hidden="true"
                            style="display: none;">
                            <li><a href="product-details.jsp" role="menuitem" tabindex="-1">Shop Details</a></li>
                            <li><a href="shoping-cart.jsp" role="menuitem" tabindex="-1">Shoping Cart</a></li>
                            <li><a href="checkout.jsp" role="menuitem" tabindex="-1">Check Out</a></li>
                            <li><a href="blog-details.jsp" role="menuitem" tabindex="-1">Blog Details</a></li>
                        </ul>
                    </li>
                    <li><a href="blog.jsp" role="menuitem">Blog</a></li>
                    <li><a href="contact.jsp" role="menuitem">Contact</a></li>
                </ul>
            </nav>
        </div>
    </div>
    <div class="header__top__right__social">
        <a href="#"><i class="fa fa-facebook"></i></a>
        <a href="#"><i class="fa fa-twitter"></i></a>
        <a href="#"><i class="fa fa-linkedin"></i></a>
        <a href="#"><i class="fa fa-pinterest-p"></i></a>
    </div>
    <div class="humberger__menu__contact">
        <ul>
            <li><i class="fa fa-envelope"></i> LTW_nhom10@gmail.com</li>
            <li>Free Shipping for all Order of $99</li>
        </ul>
    </div>
</div>
<!-- Humberger End -->

<!-- Header Section Begin -->
<jsp:include page="layout/header.jsp"></jsp:include>
<!-- Header Section End -->

<!-- Hero Section Begin -->
<!-- Hero Section End -->

<!-- Breadcrumb Section Begin -->
<section class="breadcrumb-section set-bg" data-setbg="img/breadcrumb.jpg"
         style="">
    <div class="container">
        <div class="row">
            <div class="col-lg-12 text-center">
                <div class="breadcrumb__text">
                    <h2>Thông tin tài khoản</h2>
                    <%--          <div class="breadcrumb__option">--%>
                    <%--            <a href="index.jsp">Tài khoản của tôi</a>--%>
                    <%--            <span><strong></strong></span>--%>
                    <%--          </div>--%>
                </div>
            </div>
        </div>
    </div>
</section>
<!-- Breadcrumb Section End -->
<%
    UserAccount user = (UserAccount) request.getSession().getAttribute("user");
    boolean isValidKey=true;
    if (user == null) {
        response.sendRedirect("login.jsp");
    }else {
        isValidKey=new KeyDAO().isValidKey(user.getId());
    }

%>
<!-- Shoping Cart Section Begin -->
<div class="container rounded bg-white mt-5 mb-5">
    <form method="post" enctype="multipart/form-data" class="infor_user">
        <div class="row">
            <div class="col-md-3 border-right">
                <div class="d-flex flex-column align-items-center text-center p-3 py-5">
                    <% int i = 0;
                        if (user.getAvt() != null) {
                    %>
                    <div class="image-container">
                        <div id="container<%=i%>">
                            <div class="avatar-wrapper">
                                <img class="img-avt-review profile-pic"
                                     src="http://localhost:8080/Petshop_website_final_war/<%=user.getAvt()%>"/>
                            </div>
                        </div>
                    </div>
                    <div class="image-container">
                        <div id="container<%=i%>">
                            <input type="file" id="image<%=i%>" name="files" class="input-file" accept="image/*"/>
                        </div>
                    </div>
                    <%} else {%>

                    <div class="image-container">
                        <div id="container<%=i%>">
                            <input type="file" id="image<%=i%>" name="files" class="input-file" accept="image/*"/>
                        </div>
                    </div>
                    <%}%>
                    <input type="text" id="deletedFile" value="" style="display: none">
                    <span class="font-weight-bold"><%=user.getName()%></span>
                    <span class="text-black-50"><%=user.getEmail()%></span><span> </span>
                    <%--   20130252-Trần Nhựt Hào     --%>
                    <%if(isValidKey){%>
                    <span class="font-weight-bold">Đã xác nhận khóa (*)</span>
                    <span class="font-weight-bold" style="color: red; background-color: yellow;" onclick="showTablerb()"> Báo cáo khóa đã bị lộ (*)</span>
                    <div id="myTablerb">
                        <label style="text-shadow: 1px 1px 0 white, -1px -1px 0 white, 1px -1px 0 white, -1px 1px 0 white">Xác nhận khóa của bạn đã bị lộ</label>
                        <div id="errorrb" style="text-align: center; color: red"></div> <br>
                        <div onclick="hideTablerb()" class="bt2">Xác nhận</div>
                    </div>
                    <%}else {%>
                    <span class="font-weight-bold" style="color: red">Vui lòng xác nhận khóa (*)</span>
                    <div class="button-container">
                        <div class="bt1" onclick="showTableK()" >Xác nhận</div>
                        <div class="bt1" onclick="createKey()" >Tạo Khóa</div>
                    </div>
                    <div id="myTableTK">
                        <label style="text-shadow: 1px 1px 0 white, -1px -1px 0 white, 1px -1px 0 white, -1px 1px 0 white">Khóa riêng tư (dùng để ký đơn hàng)</label>
                        <div>
                            <input type="text" id="privateKey">
                            <span id="copyIcon" onclick="copyToClipboard()">📋</span>
                        </div>
                        <label>Vui lòng giữ bảo mật.</label> <br>
                        <div id="errorTK" style="text-align: center; color: red"></div> <br>
                        <div onclick="hideTableTK()" class="bt2">Đóng</div>
                    </div>
                    <div id="myTableK">
                        <label style="text-shadow: 1px 1px 0 white, -1px -1px 0 white, 1px -1px 0 white, -1px 1px 0 white">Khóa công khai</label>
                        <input type="text" id="publicKey"><br>
                        <div id="errorK" style="text-align: center; color: red"></div> <br>
                        <div onclick="hideTableK()" class="bt2">Hủy</div>
                        <div onclick="updateKey()" class="bt2">Cập nhật</div>
                    </div>
                    <%}%>
                    <%--   20130252-Trần Nhựt Hào     --%>
                </div>
            </div>
            <div class="col-md-5 border-right">
                <div class="p-3 py-5">
                    <div class="d-flex justify-content-between align-items-center mb-3">
                        <h4 class="text-right">Thông tin tài khoản</h4>
                        <% String sussesupdate = (String) request.getAttribute("updateInforSusses"); %>
                        <p style="color: #11ff02; text-align: center; text-transform: none !important;padding-top: 5px; text-align: center"><%= sussesupdate == null ? "" : sussesupdate%>
                        </p>
                    </div>
                    <div class="row mt-2">
                        <div class="col-md-6"><label class="labels">Username</label><input type="text" id="username"
                                                                                           class="form-control"
                                                                                           name="username"
                                                                                           placeholder="Nhập username"
                                                                                           value="<%=user.getUsername()%>"
                                                                                           readonly>
                        </div>
                        <div class="col-md-6"><label class="labels">Họ và tên</label><input type="text" id="fullname"
                                                                                            class="form-control"
                                                                                            name="fullname"
                                                                                            value="<%=user.getName()%>"
                                                                                            placeholder="Nhập họ tên">
                        </div>
                    </div>
                    <div class="row mt-3">
                        <div class="col-md-12"><label class="labels">Email</label><input type="email" id="email"
                                                                                         class="form-control"
                                                                                         name="email"
                                                                                         placeholder="Nhập email tại đây"
                                                                                         value="<%=user.getEmail()%>"
                                                                                         readonly>
                        </div>
                        <div class="col-md-12"><label class="labels" style="padding-top: 10px">Số điện
                            thoại</label><input id="phone"
                                                type="text" class="form-control" name="phone"
                                                placeholder="Nhập số điện thoại tại đây"
                                                value="<%=user.getPhone()%>"></div>

                        <div class="col-md-12"><label class="labels" style="padding-top: 10px; margin-bottom: 10px">Địa chỉ</label><input type="text" id="address"
                                                                                                                                          class="form-control"
                                                                                                                                          name="address"
                                                                                                                                          placeholder="Chưa có địa chỉ"
                                                                                                                                          value="<%=user.getAddress()%>"
                                                                                                                                          readonly>
                        </div> <br>
                        <div class="col-md-12">
                            <div class="bt1" onclick="showTable()" style="margin-top: 10px">Chỉnh sửa địa chỉ</div>
                            <div id="myTable">
                                <label>Số nhà:</label>
                                <input type="text" id="soNha"><br><br>
                                <label>Tỉnh/TP:</label>
                                <select id="province" class="pdw">
                                    <option value="">Tỉnh/Thành phố</option>
                                </select><br><br>
                                <label>Quận/Huyện:</label>
                                <select id="district" class="pdw">
                                    <option value="">Quận/Huyện</option>
                                </select><br><br>
                                <label>Phường/Xã:</label>
                                <select id="ward" class="pdw">
                                    <option value="">Phường/xã</option>
                                </select><br><br>
                                <div id="error" style="text-align: center; color: red"></div>
                                <div onclick="hideTable()" class="bt2">Hủy</div>
                                <div onclick="validateInput()" class="bt2">Cập nhật</div>
                            </div>
                        </div>
                        <%--<div class="col-md-12"><label class="labels" style="padding-top: 10px">Địa chỉ</label><input id="address"
                                type="text" class="form-control" name="address" placeholder="Nhập địa chỉ"
                                value="<%=user.getAddress()%>">
                        </div>--%>
                    </div>
                </div>
            </div>
            <div class="col-md-4">
                <div class="p-3 py-5">
                    <div class="d-flex justify-content-between align-items-center experience"><span>Đổi mật khẩu</span>
                    </div>
                    <br>
                    <div class="col-md-12"><label class="labels">Nhập mật khẩu mới</label><input type="password"
                                                                                                 id="newpass"
                                                                                                 class="form-control"
                                                                                                 name="newpass"
                                                                                                 placeholder="Nhập mật khẩu"
                                                                                                 value="<%=user.getPass()%>">
                    </div>
                    <br>
                    <div class="col-md-12"><label class="labels">Nhập lại mật khẩu</label><input type="password"
                                                                                                 id="newpassconfirm"
                                                                                                 class="form-control"
                                                                                                 name="newpassconfirm"
                                                                                                 placeholder="Nhập lại mật khẩu"
                                                                                                 value="<%=user.getPass()%>">
                    </div>
                    <% String errorpass = (String) request.getAttribute("passError"); %>
                    <p style="color: red; text-align: center; text-transform: none !important;padding-top: 5px; text-align: center"><%= errorpass == null ? "" : errorpass%>
                    </p>
                    <div class="mt-5 text-center">
                        <button class="btn btn-primary profile-button" type="submit">Lưu thông tin</button>
                    </div>
                </div>

            </div>
        </div>
    </form>
</div>
<!-- Shoping Cart Section End -->

<!-- Footer Section Begin -->
<jsp:include page="layout/footer.jsp"></jsp:include>
<!-- Footer Section End -->

<!-- Js Plugins -->
<script src="js/jquery-3.3.1.min.js"></script>
<script src="js/bootstrap.min.js"></script>
<script src="js/jquery-ui.min.js"></script>
<script src="js/jquery.slicknav.js"></script>
<script src="js/mixitup.min.js"></script>
<script src="js/owl.carousel.min.js"></script>
<script src="js/main.js"></script>
<script src="admin/assets/js/vendor-all.min.js"></script>
<script src="admin/assets/js/plugins/bootstrap.min.js"></script>
<script src="js/axios.min.js"></script>
<script>
    function copyToClipboard() {
        // Lấy giá trị từ input
        var privateKeyInput = document.getElementById("privateKey");
        privateKeyInput.select();
        navigator.clipboard.writeText(privateKeyInput.value)
            .then(function() {
                var errorTK = document.getElementById("errorTK");
                errorTK.innerHTML = "Đã sao chép vào clipboard!";
            })
            .catch(function(err) {
                console.error('Failed to copy text: ', err);
            });
    }
    function updateKey() { //20130252-Trần Nhựt Hào
        var publicKey = document.getElementById("publicKey").value;
        if (publicKey.trim() === "") {
            document.getElementById("errorK").innerText = "Khóa không được để trống";
        } else {
            document.getElementById("errorK").innerText = ""; // Xóa thông báo lỗi nếu có
            checkKey(publicKey);
        }
    }
    function checkKey(publicKey){//20130252-Trần Nhựt Hào
        var xmlhttp = new XMLHttpRequest();

        // Xác định phương thức và URL của servlet
        var url = "ImportKeyController";
        var params = "publicKey=" + encodeURIComponent(publicKey);

        xmlhttp.open("POST", url, true);
        xmlhttp.setRequestHeader("Content-type", "application/x-www-form-urlencoded");

        // Xử lý sự kiện khi yêu cầu đã được gửi
        xmlhttp.onreadystatechange = function () {
            if (xmlhttp.readyState == 4 && xmlhttp.status == 200) {
                // Xử lý phản hồi từ Servlet (nếu cần)
                var response = JSON.parse(xmlhttp.responseText);
                console.log(response);

                if (response.result === "success") {
                    hideTableK();
                    window.location.reload();
                } else {
                    // Key không hợp lệ, hiển thị thông báo hoặc xử lý tùy thuộc vào yêu cầu
                    document.getElementById("errorK").innerText = "Key không hợp lệ";
                }
            }
        };

        // Gửi yêu cầu đến servlet
        xmlhttp.send(params);
    }
    function showTablerb(){//20130230-Trần trung đông
        document.getElementById("myTablerb").style.display = "block";
        document.getElementById("overlayT").classList.add("show");
        document.getElementById("overlayT").addEventListener("click", hideTableOnClickOutsiderb);
    }
    function hideTablerb() {//20130230-Trần trung đông
        document.getElementById("myTablerb").style.display = "none";
        document.getElementById("overlayT").classList.remove("show");
        document.getElementById("overlayT").removeEventListener("click", hideTableOnClickOutsiderb);
        window.location.reload();
        reportKey();
    }
    function hideTableOnClickOutsiderb(event) {//20130230-Trần trung đông
        var myTablerb = document.getElementById("myTablerb");
        // Kiểm tra xem phần tử được click có phải là myTablerb không
        if (!myTablerb.contains(event.target)) {
            hideTablerb();
            window.location.reload();
        }
    }
    function reportKey() {//20130230-Trần trung đông
        // Tạo đối tượng XMLHttpRequest
        var xhr = new XMLHttpRequest();

        // Định nghĩa hàm xử lý khi nhận được phản hồi từ Servlet
        xhr.onreadystatechange = function () {
            if (xhr.readyState == 4 && xhr.status == 200) {
                // Xử lý phản hồi từ Servlet (nếu cần)
                console.log(xhr.responseText);
                // Reload trang sau khi nhận được phản hồi
                window.location.reload();
            }
        };

        // Thiết lập phương thức và URL cho yêu cầu AJAX
        xhr.open("GET", "ReportKey", true);

        // Gửi yêu cầu
        xhr.send();
    }
    function showTableK() {//20130252-Trần Nhựt Hào
        document.getElementById("myTableK").style.display = "block";
        document.getElementById("overlayT").classList.add("show");
        document.getElementById("overlayT").addEventListener("click", hideTableOnClickOutside);
    }
    function hideTableOnClickOutside(event) {//20130252-Trần Nhựt Hào
        var myTableK = document.getElementById("myTableK");

        // Kiểm tra xem phần tử được click có phải là myTableCK không
        if (!myTableK.contains(event.target)) {
            hideTableK();
        }
    }
    function hideTableK() {//20130252-Trần Nhựt Hào
        document.getElementById("myTableK").style.display = "none";
        document.getElementById("overlayT").classList.remove("show");
        document.getElementById("overlayT").removeEventListener("click", hideTableOnClickOutside);
    }
    function createKey(){//20130252-Trần Nhựt Hào
        // Gửi yêu cầu AJAX đến Servlet
        var xhr = new XMLHttpRequest();
        xhr.onreadystatechange = function () {
            if (xhr.readyState == 4 && xhr.status == 200) {
                // Xử lý kết quả trả về từ Servlet
                var privateKey = xhr.responseText;
                document.getElementById("privateKey").value = privateKey;
                showTableTK();
            }
        };

        xhr.open("GET", "CreateKeyController", true);
        xhr.send();
    }
    function showTableTK() {//20130252-Trần Nhựt Hào
        document.getElementById("myTableTK").style.display = "block";
        document.getElementById("overlayT").classList.add("show");
        document.getElementById("overlayT").addEventListener("click", hideTableOnClickOutsideTK);
    }
    function hideTableOnClickOutsideTK(event) {//20130252-Trần Nhựt Hào
        var myTableTK = document.getElementById("myTableTK");
        // Kiểm tra xem phần tử được click có phải là myTableTK không
        if (!myTableTK.contains(event.target)) {
            hideTableTK();
            window.location.reload();
        }
    }
    function hideTableTK() {//20130252-Trần Nhựt Hào
        document.getElementById("myTableTK").style.display = "none";
        document.getElementById("overlayT").classList.remove("show");
        document.getElementById("overlayT").removeEventListener("click", hideTableOnClickOutsideTK);
        window.location.reload();
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

    function postFilesData(id, name, data) {
        let bool = false;
        $(".img-avt-review").each(function () {
            let nameFile = $(this).attr("src");
            if (nameFile.indexOf(name) != -1) {
                bool = true;
            }
        })
        if (bool === false) {
            $.ajax({
                url: '/Petshop_website_final_war/UpDownImageAvatarUserController',
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
                    $("#container" + id).empty()
                    $("#container" + id).prepend(`<div class="avatar-wrapper">
                                <img class="img-avt-review profile-pic" src="http://localhost:8080/Petshop_website_final_war/img/user/` + name + `" />
                            </div>`)
                    let value = $("#deletedFile").val();
                    if (value.indexOf(name) !== -1) {
                        value = value.replace(name + ",", "");
                        $("#deletedFile").val(value);
                    }
                    console.log($("#deletedFile").val());
                    reloadUpLoadFile();
                }
            });
        } else {
        }
    }
</script>
<script>
    $("button[type='submit']").click(function (e) {
        e.preventDefault();
        const username = $("#username").val();
        const fullname = $("#fullname").val();
        const phone = $("#phone").val();
        const address = $("#address").val();
        const newpass = $("#newpass").val();
        const newpassconfirm = $("#newpassconfirm").val();
        const imageLink = $(".img-avt-review").attr("src").substring(57);
        console.log(imageLink);
        console.log(phone);
        let imgFile = []
        $(".img-avt-review").each(function () {
            let nameFile = $(this).attr("src");
            if (nameFile.indexOf("\\") != -1)
                imgFile.push(nameFile.substring(nameFile.lastIndexOf("\\") + 1));
            else
                imgFile.push(nameFile.substring(nameFile.lastIndexOf("/") + 1));
        })
        const removed = $("#deletedFile").val();
        const oldImg = removed.substring(0, removed.length - 1);
        $.ajax({
            url: "/Petshop_website_final_war/UpdateInforController",
            type: "GET",
            data: {
                oldImg: oldImg,
                username: username,
                fullname: fullname,
                phone: phone,
                avt: imageLink,
                address: address,
                newpass: newpass,
                newpassconfirm: newpassconfirm,
                imgFile: imgFile,
            },
            success: function () {
                alert("Cập nhật thông tin thành công");
                window.location.href = "infor-user.jsp"
            }
        })

    })
</script>
<script>

    const EMAIL = "20130266@st.hcmuaf.edu.vn";
    const PASSWORD = "123456";
    const WARD = "90737";
    const DISTRICT = "3695";
    axios.post('http://140.238.54.136/api/auth/login', {
        email: EMAIL,
        password: PASSWORD
    })
        .then(response => {
            callProvince(response.data.access_token);
        });

    var callProvince = (access_token) => {
        return axios.get(`http://140.238.54.136/api/province?token=${access_token}`).then((response) => {
            renderDataProvince(response.data.original.data,"province");
        });
    }

    var renderDataProvince = (array, select) => {
        let row = ' <option disable value="">chọn</option>';
        array.forEach(element => {
            row += `<option value="${element.ProvinceID}">${element.ProvinceName}</option>`
        });
        document.querySelector("#" + select).innerHTML = row
    }

    $("#province").change(() => {

        axios.post('http://140.238.54.136/api/auth/login', {
            email: EMAIL,
            password: PASSWORD
        })
            .then(response => {
                callDistrict(response.data.access_token);
            });
        var callDistrict = (access_token) => {
            return axios.get(`http://140.238.54.136/api/district?token=${access_token}`, {
                params: {
                    provinceID: $("#province").val()
                }
            }).then((response) => {
                renderDataDistrict(response.data.original.data,"district");
            });
        }
    });
    var renderDataDistrict = (array, select) => {
        let row = ' <option disable value="">chọn</option>';
        array.forEach(element => {
            row += `<option value="${element.DistrictID}">${element.DistrictName}</option>`
        });
        document.querySelector("#" + select).innerHTML = row
    }

    $("#district").change(() => {
        axios.post('http://140.238.54.136/api/auth/login', {
            email: EMAIL,
            password: PASSWORD
        })
            .then(response => {
                callWard(response.data.access_token);
            });
        var callWard = (access_token) => {
            return axios.get(`http://140.238.54.136/api/ward?token=${access_token}`, {
                params: {
                    districtID: $("#district").val()
                }
            }).then((response) => {
                renderDataWard(response.data.original.data,"ward");
            });
        }
        var renderDataWard = (array, select) => {
            let row = ' <option disable value="">chọn</option>';
            array.forEach(element => {
                row += `<option value="${element.WardCode}">${element.WardName}</option>`
            });
            document.querySelector("#" + select).innerHTML = row
        }
    })

    function showTable() {
        document.getElementById("myTable").style.display = "block";
        document.getElementById("overlayT").classList.add("show");

    }
    function hideTable() {
        document.getElementById("myTable").style.display = "none";
        document.getElementById("overlayT").classList.remove("show");
        document.getElementById("error").innerHTML = "";
    }

    var soNha = document.getElementById("soNha").value;
    function validateInput() {
        if ($("#district").val() != "" && $("#province").val() != "" &&
            $("#ward").val() != "" && $("#soNha").val() != "") {
            document.getElementById("address").value  = $("#soNha").val() + ", " + $("#ward option:selected").text() +
                ", " + $("#district option:selected").text() + ", " +
                $("#province option:selected").text();
            hideTable();
        }
        else {
            document.getElementById('error').innerHTML = 'Vui lòng chọn đủ thông tin địa chỉ';
        }
    }
</script>
</body>
</html>