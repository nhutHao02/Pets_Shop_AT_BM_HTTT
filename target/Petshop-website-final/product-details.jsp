<%@ page import="vn.edu.hcmuaf.fit.beans.Product" %>
<%@ page import="vn.edu.hcmuaf.fit.services.ProductService" %>
<%@ page import="java.util.List" %>
<%@ page import="vn.edu.hcmuaf.fit.dao.ProductDAO" %>
<%@ page import="java.text.NumberFormat" %>
<%@ page import="java.util.Locale" %>
<%@ page import="vn.edu.hcmuaf.fit.beans.UserAccount" %>
<%@ page import="vn.edu.hcmuaf.fit.beans.Comment" %>
<%@ page import="vn.edu.hcmuaf.fit.dao.CommentDAO" %>
<%@ page import="vn.edu.hcmuaf.fit.services.UserService" %>
<%@ page import="vn.edu.hcmuaf.fit.services.DetailService" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="vn.edu.hcmuaf.fit.beans.ImageProduct" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="utf-8" %>
<!DOCTYPE html>
<html lang="zxx">

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
    <link rel="stylesheet" href="css/nice-select.css" type="text/css">
    <link rel="stylesheet" href="css/jquery-ui.min.css" type="text/css">
    <link rel="stylesheet" href="css/owl.carousel.min.css" type="text/css">
    <link rel="stylesheet" href="css/slicknav.min.css" type="text/css">
    <link rel="stylesheet" href="css/style.css" type="text/css">
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
            z-index: 1000;
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

        .card {

            border: none;
            box-shadow: 5px 6px 6px 2px #e9ecef;
            border-radius: 4px;
        }


        .dots {

            height: 4px;
            width: 4px;
            margin-bottom: 2px;
            background-color: #bbb;
            border-radius: 50%;
            display: inline-block;
        }

        .badge {

            padding: 7px;
            padding-right: 9px;
            padding-left: 16px;
            box-shadow: 5px 6px 6px 2px #e9ecef;
        }

        .user-img {

            margin-top: 4px;
        }

        .check-icon {

            font-size: 17px;
            color: #c3bfbf;
            top: 1px;
            position: relative;
            margin-left: 3px;
        }

        .form-check-input {
            margin-top: 6px;
            margin-left: -24px !important;
            cursor: pointer;
        }


        .form-check-input:focus {
            box-shadow: none;
        }


        .icons i {

            margin-left: 8px;
        }

        .reply {

            margin-left: 12px;
        }

        .remove small {

            color: #b7b4b4;

        }


        .remove small:hover {

            color: crimson;
            cursor: pointer;

        }
    </style>
</head>

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
<div id="preloder">
    <div class="loader"></div>
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
                    <li><a href="./product-details.html">Shop Details</a></li>
                    <li><a href="shoping-cart.jsp">Shoping Cart</a></li>
                    <li><a href="checkout.jsp">Check Out</a></li>
                    <li><a href="blog-details.jsp">Blog Details</a></li>
                </ul>
            </li>
            <li><a href="blog.jsp">Blog</a></li>
            <li><a href="contact.jsp">Contact</a></li>
        </ul>
    </nav>
    <div id="mobile-menu-wrap"></div>
    <div class="header__top__right__social">
        <a href="#"><i class="fa fa-facebook"></i></a>
        <a href="#"><i class="fa fa-twitter"></i></a>
        <a href="#"><i class="fa fa-linkedin"></i></a>
        <a href="#"><i class="fa fa-pinterest-p"></i></a>
    </div>
    <div class="humberger__menu__contact">
        <ul>
            <li><i class="fa fa-envelope"></i> hello@colorlib.com</li>
            <li>Free Shipping for all Order of $99</li>
        </ul>
    </div>
</div>
<!-- Humberger End -->
<% NumberFormat format = NumberFormat.getInstance(new Locale("vn", "VN"));%>
<!-- Header Section Begin -->
<jsp:include page="layout/header.jsp"></jsp:include>
<!-- Header Section End -->

<!-- Hero Section Begin -->
<!-- Hero Section End -->
<%UserAccount user = (UserAccount) request.getSession().getAttribute("user");%>
<!-- Breadcrumb Section Begin -->
<section class="breadcrumb-section set-bg" data-setbg="img/breadcrumb.jpg">
    <div class="container">
        <div class="row">
            <%
                String id = request.getParameter("id");
                ProductService service = new ProductService();
                Product product = service.getInstance().getProductDetail(id);
                List<ImageProduct> img = service.getListImg(id);
                List<String> ViewCount1 = (List<String>) request.getSession().getAttribute("ViewCount1");
                if (ViewCount1 == null) {
                    ViewCount1 = new ArrayList<>();
                    request.getSession().setAttribute("ViewCount1", ViewCount1);
                }
                if (!ViewCount1.contains(product.getProductId())) {
                    ViewCount1.add(product.getProductId());
                    ProductService.getInstance().AddViewCountProduct(product.getProductId());
                }
            %>
            <div class="col-lg-12 text-center">
                <div class="breadcrumb__text">
                    <h2>
                        <%=product.getProductName()%>
                    </h2>
                    <div class="breadcrumb__option">
                        <a href="index.jsp">Home</a>
                        <a href="index.jsp">Chó cảnh</a>
                        <span><%=product.getProductName()%><strong>
                        </strong></span>
                    </div>
                </div>
            </div>
        </div>
    </div>
</section>
<!-- Breadcrumb Section End -->

<!-- Product Details Section Begin -->
<section class="product-details spad">
    <div class="container">
        <div class="row">
            <div class="col-lg-6 col-md-6">
                <div class="product__details__pic">
                    <div class="product__details__pic__item">
                        <img class="product__details__pic__item--large"
                             src="<%=product.getImage()%>" alt="" style="height: 570px; object-fit: cover">
                    </div>
                    <div class="product__details__pic__slider owl-carousel">
                        <% if (!img.isEmpty()) {
                            for (ImageProduct i : img) { %>
                        <img data-imgbigurl="<%=i.getImg()%>"
                             src="<%=i.getImg()%>" alt="">
                        <% }
                        }%>
                        <%--<img data-imgbigurl="img/products/dog/sp6.png"
                             src="img/products/dog/sp6.png" alt="">
                        <img data-imgbigurl="img/products/dog/sp6.png"
                             src="img/products/dog/sp6.png" alt="">
                        <img data-imgbigurl="img/products/dog/sp6.png"
                             src="img/products/dog/sp6.png" alt="">--%>
                    </div>
                </div>
            </div>
            <div class="col-lg-6 col-md-6">
                <div class="product__details__text">
                    <h3><%=product.getProductName()%>
                    </h3>

                    <%if (product.getPromotional() == 1) {%>
                    <div class="product__details__price"
                         style="display: flex; text-align: center; align-items: center;"><%=format.format(product.getPrice() - (product.getPrice() * product.getPromotionalPrice() / 100))%>
                        đ
                        <span style="margin-left: 12px;font-size: 18px;color: black;text-decoration: line-through;"><%=format.format(product.getPrice())%>đ</span>
                    </div>
                    <%} else {%>
                    <div class="product__details__price"><%=format.format(product.getPrice())%>đ</div>
                    <%
                            }
                    %>
                    <p><%=product.getViewCount() != 0 ? product.getViewCount() : 0%> lượt xem</p>
                    <p><%=product.getDescription()%>
                    </p>

                    <%if (ProductService.getInstance().getQuantityProduct(product.getProductId()) < 1) {
                        Product p = new ProductDAO().getProductDetail(product.getProductId());%>
<%--                    <div class="product__details__price">Tạm hết hàng!</div>--%>

                    <a class="primary-btn" style="background-color: red; color: white">Tạm hết hàng!</a>
                    <a href="#" class="heart-icon add-wishlist" id="addWishlist-<%=p.getProductId()%>"><span
                            class="icon_heart_alt"></span></a>
                    <%}else{%>
                    <div class="product__details__quantity">
                        <div class="quantity">
                            <div class="pro-qty">
                                <input type="text" id="quantity" value="1">
                            </div>
                        </div>
                    </div>
                    <%

                        if (user != null) {
                            Product p = new ProductDAO().getProductDetail(product.getProductId());
                    %>

                    <%if (Integer.parseInt(p.getQuantity()) > 0) {%>
                    <a href="#" class="primary-btn snow" id="addCart-<%=product.getProductId()%>">Thêm vào giỏ hàng</a>
                    <a href="#" class="heart-icon add-wishlist" id="addWishlist-<%=p.getProductId()%>"><span
                            class="icon_heart_alt"></span></a>
                    <%}%>
                    <%
                    } else {%>
                    <a href="login.jsp" class="primary-btn snow">Thêm vào giỏ hàng</a>
                    <a href="login.jsp" class="heart-icon"><span class="icon_heart_alt"></span></a>
                    <% }
                    %>
                    <%}%>


                    <%if (!DetailService.getInstance().getPentCateProduct(product.getProductId()).getCatID().equals("3")) {%>
                    <ul>
                        <li><b>Giống: </b> <span><%=product.getGiong()%></span></li>
                        <li><b>Màu Sắc: </b> <span><%=product.getMausac()%></span></li>
                        <li><b>Cân nặng: </b> <span><%=product.getCannang()%> kg</span></li>
                        <li><b>Chia sẻ thông tin </b>
                            <div class="share">
                                <a href="#"><i class="fa fa-facebook"></i></a>
                                <a href="#"><i class="fa fa-twitter"></i></a>
                                <a href="#"><i class="fa fa-instagram"></i></a>
                                <a href="#"><i class="fa fa-pinterest"></i></a>
                            </div>
                        </li>
                    </ul>
                    <% } else { %>
                    <ul>
                        <% if (product.getSize() != null) { %>
                        <li><b>kích thước: </b> <span><%=product.getSize()%> ( rộng × dài × cao)</span></li>
                        <% } %>
                        <li><b>Khối lượng: </b> <span><%=product.getCannang()%> kg</span></li>
                        <li><b>Chia sẻ thông tin </b>
                            <div class="share">
                                <a href="#"><i class="fa fa-facebook"></i></a>
                                <a href="#"><i class="fa fa-twitter"></i></a>
                                <a href="#"><i class="fa fa-instagram"></i></a>
                                <a href="#"><i class="fa fa-pinterest"></i></a>
                            </div>
                        </li>
                    </ul>
                    <% } %>

                </div>
            </div>
            <div class="col-lg-12">
                <div class="product__details__tab">
                    <ul class="nav nav-tabs" role="tablist">
                        <li class="nav-item">
                            <a class="nav-link active" data-toggle="tab" href="#tabs-1" role="tab"
                               aria-selected="true">Giới thiệu</a>
                        </li>
                        <%--                        <li class="nav-item">--%>
                        <%--                            <a class="nav-link" data-toggle="tab" href="#tabs-2" role="tab"--%>
                        <%--                               aria-selected="false">Thông tin</a>--%>
                        <%--                        </li>--%>
                        <li class="nav-item">
                            <% List<Comment> listCmt1 = new CommentDAO().getListCommentByProductID(request.getParameter("id"));%>
                            <a class="nav-link" data-toggle="tab" href="#tabs-3" role="tab"
                               aria-selected="false">Đánh giá <span>(<%=listCmt1.size()%>)</span></a>
                        </li>
                    </ul>
                    <div class="tab-content">
                        <div class="tab-pane active" id="tabs-1" role="tabpanel">
                            <div class="product__details__tab__desc">
                                <p><%=product.getDital()%>
                                </p>
                            </div>
                        </div>
                        <div class="tab-pane" id="tabs-3" role="tabpanel">
                            <div class="product__details__tab__desc">
                                <%if (user == null) {%>
                                <div class="comment-section" style="margin-top: 50px; margin-left: 400px">
                                    <p><b>Bạn phải đăng nhập mới có thể bình luận.</b></p>
                                </div>
                                <% } else {%>
                                <div class="comment-section" style="margin-top: 50px; padding-left: 210px">
                                    <form method="post" id="container">
                                        <input type="text" id="cusID" value="<%=user.getId()%>" style="display: none">
                                        <input type="text" id="pID" value="<%=product.getProductId()%>"
                                               style="display: none">
                                        <img src="http://localhost:8080/Petshop_website_final_war/<%=UserService.getInstance().getUserDetail(user.getId()).getAvt()%>"
                                             width="45" height="45" class="user-img rounded-circle mr-2">
                                        <input type="text" id="content" name="content" placeholder="Viết bình luận..."
                                               style="padding-left: 5px;width: 560px;height: 45px;border-radius: 15px">
                                        <button id="button" class="site-btn" style="border-radius: 10px">Đăng</button>
                                    </form>
                                </div>
                                <div id="cmt-con" class="container-cmt"></div>
                                <%}%>
                                <% List<Comment> listCmt = new CommentDAO().getListCommentByProductID(request.getParameter("id"));
                                    for (Comment cmt : listCmt) {%>
                                <div id="cmt-con" class="container-cmt">
                                    <div id="cmt-section<%=cmt.getID()%>">
                                        <div class="container mt-5">
                                            <div class="row  d-flex justify-content-center">
                                                <div class="col-md-8">
                                                    <div class="card p-3">

                                                        <div class="d-flex justify-content-between align-items-center">

                                                            <div class="user d-flex flex-row align-items-center">
                                                                <img src="http://localhost:8080/Petshop_website_final_war/<%=UserService.getInstance().getUserDetail(cmt.getCustomerID()).getAvt()%>"
                                                                     width="35" height="35"
                                                                     class="user-img rounded-circle mr-2">

                                                                <span><small
                                                                        class="font-weight-bold text-primary"><%=UserService.getInstance().getUserDetail(cmt.getCustomerID()).getName()%></small> <small
                                                                        class="font-weight-bold"
                                                                        style="padding-left: 10px; font-size: 14px"><%=cmt.getDescription()%></small></span>
                                                            </div>
                                                            <% UserAccount user1 = (UserAccount) request.getSession().getAttribute("user");
                                                                if (user1 != null) {
                                                                    if (user1.getId().equals(cmt.getCustomerID())) {
                                                            %>
                                                            <a class="remove" id="remove<%=cmt.getID()%>"><small>Xóa
                                                                bình luận</small></a>
                                                            <% }
                                                            } %>
                                                        </div>
                                                        <div class="action d-flex justify-content-between mt-2 align-items-center">
                                                            <div class="reply px-4">
                                                                <small><%=cmt.getCommentDate()%>
                                                                </small>
                                                            </div>
                                                            <div class="icons align-items-center">
                                                                <i class="fa fa-check-circle-o check-icon text-primary"></i>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <%}%>

                            </div>

                        </div>
                        <%--                        <%}%>--%>
                    </div>
                </div>
            </div>
        </div>
    </div>
</section>
<!-- Product Details Section End -->

<!-- Related Product Section Begin -->
<section class="related-product">
    <div class="container">
        <div class="row">
            <div class="col-lg-12">
                <div class="section-title related__product__title">
                    <h2>Các sản phẩm liên quan</h2>
                </div>
            </div>
        </div>
        <div class="row">
            <% List<Product> list = new ProductService().getInstance().listRelateTo(id);
                for (Product p : list) {
            %>
            <div class="col-lg-3 col-md-4 col-sm-6">
                <div class="product__item">
                    <div class="product__item__pic set-bg" data-setbg="<%=p.getImage()%>">
                        <ul class="product__item__pic__hover">
                            <li><a href="#"><i class="fa fa-heart"></i></a></li>
                            <li><a href="#"><i class="fa fa-shopping-cart"></i></a></li>
                        </ul>
                    </div>
                    <div class="product__item__text">
                        <h6><a href="product-details.jsp?id=<%=p.getProductId()%>"><%=p.getProductName()%>
                        </a></h6>
                        <h5><%=format.format(p.getPrice())%>đ</h5>
                    </div>
                </div>
            </div>
            <% } %>
        </div>
    </div>
</section>
<% HttpSession session1 = request.getSession();
    List<String> history = (List<String>) session1.getAttribute("history");
    if (history == null) {
        history = new ArrayList<>(4);
    }
    String productId = request.getParameter("id");
    if (productId != null && !history.contains(productId)) {
        if (history.size() == 4) {
            history.remove(0);
            history.add(3, productId);
        } else {
            history.add(productId);
        }
    }
    session.setAttribute("history", history);
%>

<section>
    <div class="container">
        <div class="row">
            <div class="col-lg-12">
                <div class="section-title related__product__title">
                    <h2>Các sản phẩm bạn vừa xem</h2>
                </div>
            </div>
        </div>
        <div class="row">
            <%
                if (history != null) {
                    for (String pIdHistory : history) {
                        Product productH = service.getProductDetail(pIdHistory);
            %>
            <div class="col-lg-3 col-md-4 col-sm-6">
                <div class="product__item">
                    <div class="product__item__pic set-bg" data-setbg="<%=productH.getImage()%>">
                        <ul class="product__item__pic__hover">
                            <li><a href="#"><i class="fa fa-heart"></i></a></li>
                            <li><a href="#"><i class="fa fa-shopping-cart"></i></a></li>
                        </ul>
                    </div>
                    <div class="product__item__text">
                        <h6><a href="product-details.jsp?id=<%=productH.getProductId()%>"><%=productH.getProductName()%>
                        </a></h6>
                        <h5><%=format.format(productH.getPrice())%>đ</h5>
                    </div>
                </div>
            </div>
            <% } %>
            <% } %>
        </div>
    </div>
</section>
<!-- Related Product Section End -->

<!-- Footer Section Begin -->
<jsp:include page="layout/footer.jsp"></jsp:include>
<!-- Footer Section End -->

<!-- Js Plugins -->
<script src="js/jquery-3.3.1.min.js"></script>
<script src="js/bootstrap.min.js"></script>
<script src="js/jquery.nice-select.min.js"></script>
<script src="js/jquery-ui.min.js"></script>
<script src="js/jquery.slicknav.js"></script>
<script src="js/mixitup.min.js"></script>
<script src="js/owl.carousel.min.js"></script>
<script src="js/main.js"></script>
<script src="admin/assets/js/vendor-all.min.js"></script>
<script src="admin/assets/js/plugins/bootstrap.min.js"></script>
<script>
    var proQty = $('.pro-qty');
    proQty.prepend('<span class="dec qtybtn">-</span>');
    proQty.append('<span class="inc qtybtn">+</span>');
    proQty.on('click', '.qtybtn', function () {
        var $button = $(this);
        var oldValue = $button.parent().find('input').val();
        if ($button.hasClass('inc')) {
            var newVal = parseFloat(oldValue) + 1;
        } else {
            // Don't allow decrementing below zero
            if (oldValue > 1) {
                var newVal = parseFloat(oldValue) - 1;
            } else {
                newVal = 1;
            }
        }
        $button.parent().find('input').val(newVal);
    });
</script>
<script>
    $(document).ready(function () {
        addcart();
        addwishlist();
        deletecomment();
    })

    function addcart() {
        $(".snow").each(function (e) {
            $(this).on("click", function (e) {
                e.preventDefault();
                const idAdd = this.id;
                const quantity = $("#quantity").val();
                $.ajax({
                    url: "AddCartController",
                    type: "get",
                    data: {
                        idAdd: idAdd,
                        quantity: quantity
                    },
                    success: function (data) {
                        $(".header__second__cart--notice").each(function () {
                            const quantity2 = $(this).text();
                            $(this).text(parseInt(quantity2) + parseInt(quantity))
                        })
                        $(".header__cart__price span").text(data)
                    }
                })
            })
        });
    }

    function addwishlist() {
        $(".add-wishlist").each(function (e) {
            $(this).on("click", function (e) {
                e.preventDefault();
                const idAdd = this.id;
                $.ajax({
                    url: "AddToWishlistController",
                    type: "get",
                    data: {
                        idAdd: idAdd,
                    },
                    success: function (data) {
                        $(".header__second__wishlist--notice").each(function () {
                            var quantity = $(this).text()
                            $(this).text(parseInt(quantity) + 1)
                            alert("Thêm vào mục yêu thích thành công");
                        })
                    }
                })
            })
        });
    }

    function deletecomment() {
        $(".remove").click(function (e) {
            e.preventDefault();
            const id = this.id.substring(6);
            $.ajax({
                url: "DeleteCommentController",
                type: "post",
                data: {
                    id: id,
                },
                success: function () {
                    $("#cmt-section" + id).remove();
                }
            })
        });
    }
</script>
<script>
    $("#button").click(function (e) {
        e.preventDefault();
        const comment = $("#content").val();
        const pID = $("#pID").val();
        // console.log(comment);
        // console.log(pID);
        $.ajax({
            type: 'post',
            url: '/Petshop_website_final_war/CommentController',
            data: {
                desc: comment,
                pID: pID
            },
            success: function (data) {
                // console.log(data);
                $("#cmt-con").prepend(data);
                deletecomment();
                document.getElementById('content').value = '';
            }
        })
    })

</script>
</body>

</html>