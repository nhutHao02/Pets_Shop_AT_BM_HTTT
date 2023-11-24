<%@ page import="java.util.List" %>
<%@ page import="vn.edu.hcmuaf.fit.beans.Product" %>
<%@ page import="vn.edu.hcmuaf.fit.services.ProductService" %>
<%@ page import="vn.edu.hcmuaf.fit.dao.DetailDAO" %>
<%@ page import="vn.edu.hcmuaf.fit.beans.Detail" %>
<%@ page import="vn.edu.hcmuaf.fit.dao.ProductDAO" %>
<%@ page import="java.text.NumberFormat" %>
<%@ page import="java.util.Locale" %>
<%@ page import="vn.edu.hcmuaf.fit.beans.*" %>
<%@ page import="vn.edu.hcmuaf.fit.services.BlogService" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="utf-8" %>
<!DOCTYPE html>
<html lang="zxx">


    <meta charset="UTF-8">
    <meta name="description" content="Ogani Template">
    <meta name="keywords" content="Ogani, unica, creative, html">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>Pet Shop</title>

    <!-- Google Font -->
    <!-- <link href="https://fonts.googleapis.com/css2?family=Cairo:wght@200;300;400;600;900&display=swap" rel="stylesheet"> -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.2.0/css/all.min.css" integrity="sha512-xh6O/CkQoPOWDdYTDqeRdPCVd1SpvCA9XXcUnZS2FmJNp1coAFzvtCN9BmamE+4aHK8yyUHUSCcJHgXloTyT2A==" crossorigin="anonymous" referrerpolicy="no-referrer" />
    <link rel="icon" type="image/png" sizes="16x16"  href="img/favicons/favicon-16x16.png">
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
        .row1 p {
            overflow: hidden;
            text-overflow: ellipsis;
            line-height: 25px;
            -webkit-line-clamp: 2;
            display: -webkit-box;
            -webkit-box-orient: vertical;
        }
    </style>
    </head>
    <% UserAccount user = (UserAccount) request.getSession().getAttribute("user"); %>
    <% NumberFormat format = NumberFormat.getInstance(new Locale("vn", "VN"));%>

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
                <a href="#"><i class="fa fa-user"></i> Đăng Nhập</a>
            </div>
        </div>
        <nav class="humberger__menu__nav mobile-menu">
            <ul>
                <li><a href="./index.jsp">Home</a></li>
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
        <div id="mobile-menu-wrap"><div class="slicknav_menu"><a href="#" aria-haspopup="true" role="button" tabindex="0" class="slicknav_btn slicknav_collapsed" style="outline: none;"><span class="slicknav_menutxt">MENU</span><span class="slicknav_icon"><span class="slicknav_icon-bar"></span><span class="slicknav_icon-bar"></span><span class="slicknav_icon-bar"></span></span></a><nav class="slicknav_nav slicknav_hidden" aria-hidden="true" role="menu" style="display: none;">
            <ul>
                <li class="active"><a href="./index.jsp" role="menuitem">Home</a></li>
                <li><a href="all-products.jsp" role="menuitem">Shop</a></li>
                <li class="slicknav_collapsed slicknav_parent"><a href="#" role="menuitem" aria-haspopup="true" tabindex="-1" class="slicknav_item slicknav_row" style="outline: none;"><a href="#">Pages</a>
                    <span class="slicknav_arrow">►</span></a><ul class="header__menu__dropdown slicknav_hidden" role="menu" aria-hidden="true" style="display: none;">
                        <li><a href="product-details.jsp" role="menuitem" tabindex="-1">Shop Details</a></li>
                        <li><a href="shoping-cart.jsp" role="menuitem" tabindex="-1">Shoping Cart</a></li>
                        <li><a href="checkout.jsp" role="menuitem" tabindex="-1">Check Out</a></li>
                        <li><a href="blog-details.jsp" role="menuitem" tabindex="-1">Blog Details</a></li>
                    </ul>
                </li>
                <li><a href="blog.jsp" role="menuitem">Blog</a></li>
                <li><a href="contact.jsp" role="menuitem">Contact</a></li>
            </ul>
        </nav></div></div>
        <div class="header__top__right__social">
            <a href="#"><i class="fa fa-facebook"></i></a>
            <a href="#"><i class="fa fa-twitter"></i></a>
            <a href="#"><i class="fa fa-linkedin"></i></a>
            <a href="#"><i class="fa fa-pinterest-p"></i></a>
        </div>
        <div class="humberger__menu__contact">
            <ul>
                <li><i class="fa fa-envelope"></i>  LTW_nhom10@gmail.com</li>
                <li>Free Shipping for all Order of $99</li>
            </ul>
        </div>
    </div>
    <!-- Humberger End -->

    <!-- Header Section Begin -->


    <jsp:include page="layout/header-home.jsp"></jsp:include>


    <!-- Hero Section Begin -->
    <!-- Hero Section End -->

    <!-- Categories Section Begin -->
    <section class="categories">
        <div class="container">
            <div class="row">
                <div class="categories__slider owl-carousel">
                    <div class="col-lg-3">
                        <div class="categories__item set-bg" data-setbg="img/categories/cat-5.jpg">
                            <h5><a>Mèo Lông Xám</a></h5>
                        </div>
                    </div>
                    <div class="col-lg-3">
                        <div class="categories__item set-bg" data-setbg="img/categories/cat-6.jpg">
                            <h5><a>Mèo Chân Ngắn</a></h5>
                        </div>
                    </div>
                    <div class="col-lg-3">
                        <div class="categories__item set-bg" data-setbg="img/categories/cat-3.jpg">
                            <h5><a>Chó Poodle</a></h5>
                        </div>
                    </div>
                    <div class="col-lg-3">
                        <div class="categories__item set-bg" data-setbg="img/categories/cat-4.jpg">
                            <h5><a>Chó Shiba</a></h5>
                        </div>
                    </div>
                    <div class="col-lg-3">
                        <div class="categories__item set-bg" data-setbg="img/categories/cat-2.jpg">
                            <h5><a>Mèo Lông Ngắn</a></h5>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <!-- Categories Section End -->

    <!-- Featured Section Begin -->
    <section class="featured spad">
        <div class="container">
            <div class="row">
                <div class="col-lg-12">
                    <div class="section-title">
                        <h2>Sản phẩm bán chạy</h2>
                    </div>
                    <div class="featured__controls">
                    </div>
                </div>
            </div>
            <div class="row featured__filter">
                <% ProductDAO dao = new ProductDAO();
                    List<Product> list = dao.get8BestProduct();
                    for (Product p: list) {
                %>
                    <%if(p.getPromotional()==1){%>
                         <div class="col-lg-3 col-md-4 col-sm-6 mix oranges fresh-meat">
                            <div class="featured__item">
                                <div class="featured__item__pic set-bg product__discount__item__pic " data-setbg="<%=p.getImage()%>">
                                    <div class="product__discount__percent"><%=p.getPromotionalPrice()%>%</div>
                                    <ul class="featured__item__pic__hover">
                                        <%if (user != null) {
                                            Product product = new ProductDAO().getProductDetail(p.getProductId());%>
                                        <%if (Integer.parseInt(product.getQuantity())> 0) {%>
                                        <li><a class="add-wishlist" id="addWishlist-<%=p.getProductId()%>"><i class="fa fa-heart"></i></a></li>
                                        <li><a class="shopnow2" id="addCart-<%=p.getProductId()%>" ><i
                                                class="fa fa-shopping-cart"></i></a></li>
                                        <%}%>
                                        <%
                                        } else {%>
                                        <li><a class="add-wishlist" href="login.jsp"><i class="fa fa-heart"></i></a></li>
                                        <li><a class="shopnow2" href="login.jsp"><i
                                                class="fa fa-shopping-cart"></i></a></li>
                                        <%  }
                                        %>
                                    </ul>
                                </div>
                                <div class="featured__item__text product__discount__item__text">
                                    <h6><a href="product-details.jsp?id=<%=p.getProductId()%>"><%=p.getProductName()%></a></h6>
                                    <div class="product__item__price"><%=format.format(p.getPrice()-( p.getPrice() *p.getPromotionalPrice()/100))%>đ<span><%=p.getPrice()%>đ</span></div>
                                </div>
                            </div>
                        </div>
                    <%}else {%>
                        <div class="col-lg-3 col-md-4 col-sm-6 mix oranges fresh-meat">
                            <div class="featured__item">
                                <div class="featured__item__pic set-bg product__discount__item__pic " data-setbg="<%=p.getImage()%>">
                                    <ul class="featured__item__pic__hover">
                                        <%if (user != null) {
                                            Product product = new ProductDAO().getProductDetail(p.getProductId());%>
                                        <%if (Integer.parseInt(product.getQuantity())> 0) {%>
                                        <li><a class="add-wishlist" id="addWishlist-<%=p.getProductId()%>"><i class="fa fa-heart"></i></a></li>
                                        <li><a class="shopnow2" id="addCart-<%=p.getProductId()%>" ><i
                                                class="fa fa-shopping-cart"></i></a></li>
                                        <%}%>
                                        <%
                                        } else {%>
                                        <li><a class="add-wishlist" href="login.jsp"><i class="fa fa-heart"></i></a></li>
                                        <li><a class="shopnow2" href="login.jsp"><i
                                                class="fa fa-shopping-cart"></i></a></li>
                                        <%  }
                                        %>
                                    </ul>
                                </div>
                                <div class="featured__item__text product__discount__item__text">
                                    <h6><a href="product-details.jsp?id=<%=p.getProductId()%>"><%=p.getProductName()%></a></h6>
                                    <div class="product__item__price"><%=format.format(p.getPrice())%>đ</div>

                                </div>
                            </div>
                        </div>
                    <%}%>
                <% } %>
            </div>
        </div>
    </section>
    <!-- Featured Section End -->

    <!-- Banner Begin -->
    <div class="banner">
        <div class="container">
            <div class="row">
                <div class="col-lg-6 col-md-6 col-sm-6">
                    <div class="banner__pic">
                        <img src="img/banner/banner-1.jpg" alt="">
                    </div>
                </div>
                <div class="col-lg-6 col-md-6 col-sm-6">
                    <div class="banner__pic">
                        <img src="img/banner/banner-2.jpg" alt="">
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!-- Banner End -->


    <!-- Blog Section Begin -->
    <section class="from-blog spad">
        <div class="container">
            <div class="row">
                <div class="col-lg-12">
                    <div class="section-title from-blog__title">
                        <h2>Bài Viết Bạn Có Thể Thích</h2>
                    </div>
                </div>
            </div>
            <div class="row">
                <% List<vn.edu.hcmuaf.fit.beans.Blogs> listNewest = new BlogService().NewBlogs();
                    for(Blogs blogs2 : listNewest) {
                %>
                <div class="row1 col-lg-4 col-md-4 col-sm-6">
                    <div class="blog__item">
                        <div class="blog__item__pic">
                            <img src="<%=blogs2.getImage()%>" alt="" style="width: 290px;height: 200px; object-fit: cover">
                        </div>
                        <div class="blog__item__text">
                            <ul>
                                <li><i class="fa fa-calendar-o"></i> <%=blogs2.getCreateDate()%></li>
                            </ul>
                            <h5><a href="blog-details.jsp?id=<%=blogs2.getBlogId()%>"><%=blogs2.getBlogName()%></a></h5>
                            <p><%=blogs2.getDescription()%></p>
                        </div>
                    </div>
                </div>
                <% }%>
            </div>
        </div>
    </section>
    <!-- Blog Section End -->

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
        $(document).ready(function (){
            addcart();
            addwishlist();
        })

        function addcart() {
            $(".shopnow2").each(function (e) {
                $(this).on("click",function (e){
                    e.preventDefault();
                    const idAdd = this.id;
                    const quantity=1;
                    $.ajax({
                        url: "AddCartController",
                        type: "get",
                        data: {
                            idAdd: idAdd,
                            quantity:quantity
                        },
                        success: function (data) {
                            $(".header__second__cart--notice").each(function () {
                                var quantity = $(this).text()
                                $(this).text(parseInt(quantity)+1)
                                alert("Thêm vào giỏ hàng thành công")
                            })
                        }
                    })
                })
            });
        }
        function addwishlist() {
            $(".add-wishlist").each(function (e) {
                $(this).on("click",function (e){
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
                                $(this).text(parseInt(quantity)+1)
                                alert("Thêm vào mục yêu thích thành công")
                            })
                        }
                    })
                })
            });
        }
    </script>
</body>

</html>