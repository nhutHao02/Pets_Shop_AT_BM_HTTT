<%@ page import="vn.edu.hcmuaf.fit.beans.UserAccount" %>
<%@ page import="java.util.List" %>
<%@ page import="vn.edu.hcmuaf.fit.services.ProductService" %>
<%@ page import="vn.edu.hcmuaf.fit.beans.Detail" %>
<%@ page import="vn.edu.hcmuaf.fit.dao.DetailDAO" %>
<%@ page import="vn.edu.hcmuaf.fit.beans.Cart" %>
<%@ page import="java.text.NumberFormat" %>
<%@ page import="java.util.Locale" %>
<%@ page import="vn.edu.hcmuaf.fit.beans.Wishlist" %><%--
  Created by IntelliJ IDEA.
  User: ADMIN
  Date: 11/28/2022
  Time: 7:41 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<% UserAccount user = (UserAccount) session.getAttribute("user"); %>
<% Cart cart = (Cart) request.getSession().getAttribute("cart"); %>
<% Wishlist wishlist = (Wishlist) request.getSession().getAttribute("wishlist"); %>
<%NumberFormat format = NumberFormat.getInstance(new Locale("vn", "VN"));%>
<header class="header">
    <div class="header__top">
        <div class="container">
            <div class="row">
                <div class="col-lg-6 col-md-6">
                    <div class="header__top__left">
                        <ul>
                            <li><i class="fa fa-envelope"></i> LTW_nhom10@gmail.com</li>
                            <li>Hệ thống cửa hàng thú cưng</li>
                        </ul>
                    </div>
                </div>
                <div class="col-lg-6 col-md-6">
                    <div class="header__top__right">
                        <div class="header__top__right__social">
                            <a href="#"><i class="fa fa-facebook" title="Our Facebook"></i></a>
                            <a href="#"><i class="fa fa-instagram" title="Our Instagram"></i></a>
                        </div>
                        <%if (user == null) {%>
                        <div class="header__top__right__auth">
                            <a href="login.jsp"><i class="fa fa-user"></i> Đăng nhập</a>
                        </div>
                        <%} else if (user != null) {%>
                        <div class="header__top__right__auth">
                            <li class="dropdown pc-h-item" style="list-style-type: none;">
                                <a class="pc-head-link dropdown-toggle arrow-none mr-0" data-toggle="dropdown" href="#"
                                   role="button" aria-haspopup="false" aria-expanded="false">
                                    <span>
                                        <span class="user-name" style="color: #111;"><i class="fa fa-user"></i>&nbsp;&nbsp;<%=user.getName()%></span>
                                    </span>
                                </a>
                                <div class="dropdown-menu dropdown-menu-right pc-h-dropdown">
                                    <a href="infor-user.jsp" class="dropdown-item">
                                        <span><i data-feather="briefcase"></i> Tài khoản của tôi</span>
                                    </a>
                                    <a href="my-orders.jsp" class="dropdown-item">
                                        <span><i data-feather="x-square"></i> Đơn hàng của tôi</span>
                                    </a>
                                    <a href="LogoutController" class="dropdown-item">
                                        <span><i data-feather="x-square"></i> Đăng xuất</span>
                                    </a>
                                </div>
                            </li>
                        </div>
                        <%}%>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <div class="container">
        <div class="row">
            <div class="col-lg-3">
                <div class="header__logo">
                    <a href="./index.jsp"><img src="img/logo.png" alt=""></a>
                </div>
            </div>
            <div class="col-lg-6">
                <nav class="header__menu">
                    <ul>
                        <li><a href="./index.jsp">Trang Chủ</a></li>
                        <li><a href="all-product?category=all">Thú Cưng</a>
                            <ul class="header__menu__dropdown">
                                <li><a href="all-product?category=1">Chó</a></li>
                                <li><a href="all-product?category=2">Mèo</a></li>
                                <li><a href="all-product?category=3">Phụ Kiện</a></li>
                            </ul>
                        </li>
                        <li><a href="blog.jsp">Tin Tức</a></li>
                        <li><a href="contact.jsp">Liên Hệ</a></li>
                    </ul>
                </nav>
            </div>
            <div class="col-lg-3">
                <div class="header__cart">
                    <ul>
                        <li>
                            <% if (user == null) {%>
                            <a href="login.jsp"><i class="fa fa-heart"></i>
                            </a>
                            <%}
                            else {%>
                            <a href="like-product.jsp"><i class="fa fa-heart"></i>
                                <span id="header__second__wishlist--notice" class="header__second__wishlist--notice"><%=wishlist.getQuantity_wishlist()%></span></a>
                            <%}%>
                        </li>
                        <li>
                            <% if (user == null) {%>
                            <a href="login.jsp">
                                <i class="fa fa-shopping-bag"></i>
                            </a>
                            <%} else {%>
                            <a href="shoping-cart.jsp">
                                <i class="fa fa-shopping-bag"></i>
                                <span id="header__second__cart--notice"
                                      class="header__second__cart--notice"><%=cart.getQuantity_cart()%></span>
                            </a>
                            <%}%>
                        </li>
                    </ul>
                    <div class="header__cart__price">Giỏ hàng: <span><%=cart != null ? format.format(cart.total()) : 0%>₫</span>
                    </div>
                </div>
            </div>
        </div>
        <div class="humberger__open">
            <i class="fa fa-bars"></i>
        </div>
    </div>
</header>
<!-- Header Section End -->

<!-- Hero Section Begin -->
<section class="hero">
    <div class="container">
        <div class="row">
            <div class="col-lg-3">
                <div class="hero__categories">
                    <div class="hero__categories__all">
                        <i class="fa fa-bars"></i>
                        <span>Danh mục</span>
                    </div>
                    <ul>
                        <% DetailDAO dao = new DetailDAO();
                            List<Detail> list = dao.listCategory();
                            for (Detail p : list) { %>
                        <li>
                            <a href="all-product?category=<%=p.getCatID()%>">
                                <%=p.getCatName()%>
                            </a>
                        </li>
                        <% } %>


                    </ul>
                </div>
            </div>
            <div class="col-lg-9">
                <div class="hero__search" style="overflow: unset !important;">
                    <div class="hero__search__form">
                        <form action="#">
                            <!--                                <div class="hero__search__categories">-->
                            <!--                                    Tất cả các loại-->
                            <!--                                    <span class="arrow_carrot-down"></span>-->
                            <!--                                </div>-->
                            <input id="search-keyword" type="text" oninput="searchByName(this)"
                                   placeholder="Bạn cần tìm gì ?">
                            <button type="submit" class="site-btn">Tìm Kiếm</button>
                        </form>
                        <div id="result-search" style="display: none">
                            <ul class="result"
                                style="list-style-type: none;background: white;border:1px solid #b9b9b9;position: relative;z-index: 2;border-radius: 0px 0px 6px 6px;max-height: 500px;overflow-x: unset;overflow-y: scroll">
                                <li class="search" style="margin-bottom: 10px;border: #b9b9b9">
                                    <h3 style="text-align: center; font-size: 14px; margin-top: 10px; color: #9c9c9d">
                                        Nhập từ khóa cần tìm...</h3>
                                </li>
                            </ul>
                        </div>
                    </div>
                    <div class="hero__search__phone">
                        <div class="hero__search__phone__icon">
                            <i class="fa fa-phone"></i>
                        </div>
                        <div class="hero__search__phone__text">
                            <h5>+84 987.145.145</h5>
                            <span>Hỗ trợ 24/7</span>
                        </div>
                    </div>
                </div>
                <div class="hero__item set-bg" data-setbg="img/hero/banner.jpg"
                     style="background-image: url(&quot;img/hero/banner.jpg&quot;);">
                    <div class="hero__text">
                        <span>CỬA HÀNG THÚ CƯNG</span>
                        <h2>Chó mèo <br>và nhiều hơn thế</h2>
                        <p>Giao thú cưng tận nhà trong ngày</p>
                        <a href="list-product" class="primary-btn">MUA NGAY</a>
                    </div>
                </div>
            </div>
        </div>
    </div>
</section>
<script>
    <%@include file="../js/jquery-3.3.1.min.js"%>
</script>
<script>
    $(document).ready(function () {
        $("#search-keyword").focus(function () {
            $("#result-search").css("display", "block");
        })
        $("#search-keyword").on("blur", function () {
            if ($("#result-search .result:hover").length !== 0) {
                $("#result-search").css("display", "block");
            } else{
                $("#result-search").css("display", "none");
            }
        })
    })

    function searchByName(param) {
        const txtSearch = param.value;
        if (txtSearch.length > 0) {
            $.ajax({
                url: "/Petshop_website_final_war/search-main",
                type: "get",
                data: {
                    txt: txtSearch
                },
                success: function (data) {
                    $("#result-search .result").html(data)
                },
                error: function (xhr) {
                    //Do Something to handle error
                }
            });
        } else {
            $("#result-search .result").html(`<li class="search" style="margin-bottom: 10px;">
       <h3 style="text-align: center; font-size: 14px; margin-top: 10px; color: #9c9c9d">Nhập từ khóa cần tìm...</h3>
</li>`)
        }
    }
</script>
