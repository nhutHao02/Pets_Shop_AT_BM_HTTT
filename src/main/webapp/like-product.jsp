<%@ page import="java.util.List" %>
<%@ page import="vn.edu.hcmuaf.fit.services.ProductService" %>
<%@ page import="vn.edu.hcmuaf.fit.beans.Wishlist" %>
<%@ page import="java.text.NumberFormat" %>
<%@ page import="java.util.Locale" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="utf-8" %>
<!DOCTYPE html>
<head lang="zxx"><head>
    <meta charset="UTF-8">
    <meta name="description" content="Ogani Template">
    <meta name="keywords" content="Ogani, unica, creative, html">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>Pet Shop</title>

    <!-- Google Font -->
    <!-- <link href="https://fonts.googleapis.com/css2?family=Cairo:wght@200;300;400;600;900&display=swap" rel="stylesheet"> -->
    <link href="https://fonts.googleapis.com/css?family=Poppins:100,100i,200,200i,300,300i,400,400i,500,500i,600,600i,700,700i,800,800i,900,900i&amp;display=swap" rel="stylesheet">
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
<style type="text/css">@font-face { font-family: Roboto; src: url("chrome-extension://mcgbeeipkmelnpldkobichboakdfaeon/css/Roboto-Regular.ttf"); }</style></head>
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
          <div id="mobile-menu-wrap"><div class="slicknav_menu"><a href="#" aria-haspopup="true" role="button" tabindex="0" class="slicknav_btn slicknav_collapsed" style="outline: none;"><span class="slicknav_menutxt">MENU</span><span class="slicknav_icon"><span class="slicknav_icon-bar"></span><span class="slicknav_icon-bar"></span><span class="slicknav_icon-bar"></span></span></a><nav class="slicknav_nav slicknav_hidden" aria-hidden="true" role="menu" style="display: none;">
              <ul>
                  <li class="active"><a href="index.jsp" role="menuitem">Home</a></li>
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
    <jsp:include page="layout/header.jsp"></jsp:include>
    <!-- Header Section End -->

    <!-- Hero Section Begin -->
    <!-- Hero Section End -->

    <!-- Breadcrumb Section Begin -->
    <section class="breadcrumb-section set-bg" data-setbg="img/breadcrumb.jpg" style="background-image: url(&quot;img/breadcrumb.jpg&quot;);">
        <div class="container">
            <div class="row">
                <div class="col-lg-12 text-center">
                    <div class="breadcrumb__text">
                        <h2>Sản phẩm đã thích</h2>
                        <div class="breadcrumb__option">
                            <a href="index.jsp">Trang chủ</a>
                            <span><strong>Yêu thích</strong></span>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <!-- Breadcrumb Section End -->

    <!-- Shoping Cart Section Begin -->
    <section class="shoping-cart spad">
        <div class="container">
            <div class="row">
                <div class="col-lg-12">
                    <div class="shoping__cart__table">
                        <table>
                            <thead>
                                <tr>
                                    <th class="shoping__product">Sản phẩm</th>
                                    <th>Giá</th>
                                    <th style="padding-left: 120px">Thích</th>
                                    <th style="padding-left: 100px">Bỏ thích</th>
                                </tr>
                            </thead>
                            <tbody>
                            <% Wishlist wishlist = (Wishlist) request.getSession().getAttribute("wishlist");
                                NumberFormat format = NumberFormat.getInstance(new Locale("vn", "VN"));%>
                            <% if (wishlist != null) {
                                for (String id : wishlist.getData().keySet()) {%>
                            <tr>
                                <td class="shoping__cart__item">
                                    <img src="<%=wishlist.getData().get(id).getImage()%>" alt="" style="width: 85px; height: 85px; object-fit: cover;">
                                    <a href="product-details.jsp?id=<%=wishlist.getData().get(id).getProductId()%>"><h5><%=wishlist.getData().get(id).getProductName()%></h5></a>
                                </td>
                                <td class="shoping__cart__price" style="padding-left: 10px">
                                    <%=format.format(wishlist.getData().get(id).getPrice())%>₫
                                </td>
                                <td class="shoping__cart__total" style="padding-left: 130px">
                                    <i class="fa fa-heart">
                                    </i></td>
                                <td class="shoping__cart__item__close">
                                    <a href="" class="dlt" id="delete<%=wishlist.getData().get(id).getProductId()%>" style="color: black; padding-right: 50px"> <i class="icon_close"></i></a>
                                </td>
                            </tr>
                            <%
                                    }
                                }
                            %>
                            </tbody>
                        </table>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <!-- Shoping Cart Section End -->

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
        function deleteProduct() {
            $(".dlt").each(function () {
                const id = $(this).attr("id").substring(6);
                $("#delete" + id).click(function (e) {
                    e.preventDefault();
                    $.ajax({
                        url: "DeleteWishlistController",
                        type: "post",
                        data: {
                            idP: id,
                        },
                        success: function (data) {
                            $(".shoping-cart").html(data);
                            deleteProduct();
                        }
                    })
                })
            })
        }

        $(document).ready(function () {
            deleteProduct();
        })
    </script>

</body></html>