<%@ page import="java.util.List" %>
<%@ page import="vn.edu.hcmuaf.fit.beans.Product" %>
<%@ page import="vn.edu.hcmuaf.fit.beans.UserAccount" %>
<%@ page import="vn.edu.hcmuaf.fit.dao.ProductDAO" %>
<%@ page import="java.text.NumberFormat" %>
<%@ page import="java.util.Locale" %>
<%@ page import="vn.edu.hcmuaf.fit.services.ProductService" %>
<%@ page import="vn.edu.hcmuaf.fit.beans.Detail" %>
<%@ page import="vn.edu.hcmuaf.fit.services.DetailService" %>
<%@ page import="java.util.ArrayList" %>
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

        .pagination {
            display: flex;
            justify-content: center;
        }
        .pagination ul{
            display: flex;
            flex-wrap: wrap;
            background: #00BFFF;
            padding: 8px;
            border-radius: 50px;
        }
        .pagination ul li{
            color: #fff;
            list-style: none;
            line-height: 45px;
            text-align: center;
            font-size: 18px;
            font-weight: 500;
            cursor: pointer;
            user-select: none;
            transition: all 0.3s ease;
        }
        .pagination ul li.numb{
            list-style: none;
            height: 45px;
            width: 45px;
            margin: 0 3px;
            line-height: 45px;
            border-radius: 50%;
        }
        .pagination ul li.numb.first{
            margin: 0px 3px 0 -5px;
        }
        .pagination ul li.numb.last{
            margin: 0px -5px 0 3px;
        }
        .pagination ul li.dots{
            font-size: 22px;
            cursor: default;
        }
        .pagination ul li.btn{
            padding: 0 20px;
            border-radius: 50px;
        }
        .pagination li.active,
        .pagination ul li.numb:hover,
        .pagination ul li:first-child:hover,
        .pagination ul li:last-child:hover{
            color: #00BFFF;
            background: #fff;
        }
    </style>
</head>
<%
    UserAccount user = (UserAccount) request.getSession().getAttribute("user");
%>
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
            <li><a href="list-product">Shop</a></li>
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
    <div id="mobile-menu-wrap"></div>
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
<% NumberFormat format = NumberFormat.getInstance(new Locale("vn", "VN"));%>
<!-- Header Section Begin -->
<jsp:include page="layout/header.jsp"></jsp:include>
<!-- Header Section End -->

<!-- Hero Section Begin -->
<!-- Hero Section End -->
<!-- Breadcrumb Section Begin -->
<section class="breadcrumb-section set-bg" data-setbg="img/breadcrumb.jpg">
    <div class="container">
        <div class="row">
            <div class="col-lg-12 text-center">
                <div class="breadcrumb__text">
                    <h2>Sản Phẩm</h2>
                    <div class="breadcrumb__option">
                        <a href="index.jsp">Trang chủ</a>
                        <span><strong>Cửa hàng</strong></span>
                    </div>
                </div>
            </div>
        </div>
    </div>
</section>
<!-- Breadcrumb Section End -->

<!-- Product Section Begin -->
<section class="product spad">
    <div class="container">
        <div class="row">
            <div class="col-lg-12">
                <div class="product__discount">
                    <div class="section-title product__discount__title">
                        <h2>Giảm Giá</h2>
                    </div>
                    <div class="row">
                        <div class="product__discount__slider owl-carousel">
                            <%
                                List<Product> listSale = ProductService.getInstance().listProductSale();
                                for (Product pd : listSale) {
                            %>
                            <div class="col-lg-4">
                                <div class="product__discount__item">
                                    <div class="product__discount__item__pic set-bg"
                                         data-setbg="<%=pd.getImage()%>">
                                        <div class="product__discount__percent"><%=pd.getPromotionalPrice()%>%</div>
                                        <ul class="product__item__pic__hover">
                                            <%
                                                if (user != null) {
                                                    Product product = new ProductDAO().getProductDetail(pd.getProductId());
                                            %>
                                            <%if (Integer.parseInt(product.getQuantity()) > 0) {%>
                                            <li><a class="add-wishlist" id="addWishlist-<%=pd.getProductId()%>"><i
                                                    class="fa fa-heart"></i></a></li>
                                            <li><a class="shopnow2" id="addCart-<%=pd.getProductId()%>"><i
                                                    class="fa fa-shopping-cart"></i></a></li>
                                            <%}%>
                                            <%
                                            } else {%>
                                            <li><a class="add-wishlist" href="login.jsp"><i class="fa fa-heart"></i></a>
                                            </li>
                                            <li><a class="shopnow2" href="login.jsp"><i
                                                    class="fa fa-shopping-cart"></i></a></li>
                                            <% }
                                            %>
                                        </ul>
                                    </div>
                                    <div class="product__discount__item__text">
                                        <h5>
                                            <a href="product-details.jsp?id=<%=pd.getProductId()%>"><%=pd.getProductName()%>
                                            </a></h5>
                                        <div class="product__item__price"><%=format.format(pd.getPrice() - (pd.getPrice() * pd.getPromotionalPrice() / 100))%>
                                            đ<span><%=pd.getPrice()%>đ</span></div>
                                    </div>
                                </div>
                            </div>
                            <% }%>

                        </div>
                    </div>
                </div>
            </div>


            <div class="col-lg-3 col-md-5">
                <div class="sidebar">
                    <div class="sidebar__item">
                        <h4>Danh mục</h4>
                        <% String category1 = request.getParameter("category");
                            if (category1 != "1" && category1 != "2" && category1 != "3" && category1 != "all") { %>
                        <input type="radio" id="all" name="checkcate" class="checkcate" value="<%=category1%>">
                        <label class="form-check-label" for="all">Tất cả</label><br>
                        <% } else { %>
                        <input type="radio" id="all" name="checkcate" class="checkcate" value="-1">
                        <label class="form-check-label" for="all">Tất cả</label><br>
                        <% } %>
                        <%
                            List<Detail> listD = new DetailService().listProCateClassify(category1);
                            for (Detail p1 : listD) {
                        %>

                        <input type="radio" id="<%=p1.getCatID()%>idP" name="checkcate" class="checkcate"
                               value="<%=p1.getCatID()%>">
                        <label class="form-check-label" for="<%=p1.getCatID()%>idP"><%=p1.getCatName()%>
                        </label><br>
                        <% } %>

                    </div>
                    <div class="sidebar__item">
                        <%--@declare id="gia5"--%><h4>Khoảng giá</h4>
                        <input type="radio" id="gia0"
                               class="checkGia" name="checkGia" value="-1">
                        <label for="gia0">Tất cả</label><br>

                        <input type="radio" id="gia1" class="checkGia" name="checkGia" value="0-5000000">
                        <label for="gia1">Dưới 5,000,000đ</label><br>

                        <input type="radio" id="gia3" class="checkGia" name="checkGia" value="5000000-10000000">
                        <label for="gia3">5,000,000đ - 10,000,000đ</label><br>


                        <input type="radio" id="gia4" class="checkGia" name="checkGia" value="10000000-15000000">
                        <label for="gia4">10,000,000đ - 15,000,000đ</label><br>


                        <input type="radio" id=gia5" class="checkGia" name="checkGia" value="15000000-20000000">
                        <label for="gia5">15,000,000đ - 20,000,000đ</label><br>


                        <input type="radio" id="gia6" class="checkGia" name="checkGia" value="20000000-200000000">
                        <label for="gia6">Trên 20,000,000đ</label><br>

                    </div>

                    <div class="sidebar__item">
                        <h4>Kích Cỡ</h4>
                        <input type="radio" id="size0" class="checkSize" name="checkSize" value="-1">
                        <label for="size0">Tất cả</label><br>
                        <input type="radio" id="size1" class="checkSize" name="checkSize" value="10-100">
                        <label for="size1">Trên 10kg</label><br>
                        <input type="radio" id="size2" class="checkSize" name="checkSize" value="5-10">
                        <label for="size2">5kg-10kg</label><br>
                        <input type="radio" id="size3" class="checkSize" name="checkSize" value="3-5">
                        <label for="size3">3kg-5kg</label><br>
                        <input type="radio" id="size4" class="checkSize" name="checkSize" value="2-3">
                        <label for="size4">2kg-3kg</label><br>
                        <input type="radio" id="size5" class="checkSize" name="checkSize" value="0-2">
                        <label for="size5">dưới 2kg</label><br>
                    </div>
                    <div class="sidebar__item">
                        <h4>Sắp xếp</h4>
                        <input type="radio" id="select1" class="sapxep" name="sapxep" value="0">
                        <label for="select1">Mặc định</label><br>
                        <input type="radio" id="select2" class="sapxep" name="sapxep" value="1">
                        <label for="select2">Giá tăng dần</label><br>
                        <input type="radio" id="select3" class="sapxep" name="sapxep" value="2">
                        <label for="select3">Giá giảm dần</label><br>
                        <input type="radio" id="select4" class="sapxep" name="sapxep" value="3">
                        <label for="select4">A - Z</label><br>
                        <input type="radio" id="select5" class="sapxep" name="sapxep" value="4">
                        <label for="select5">Z - A</label><br>
                    </div>
                </div>
            </div>
            <div class="col-lg-9 col-md-7">
                <%--     <div class="product__discount">
                         <div class="section-title product__discount__title">
                             <h2>Giảm Giá</h2>
                         </div>
                         <div class="row">
                             <div class="product__discount__slider owl-carousel">
                                 <%
                                     List<Product> listSale = ProductService.getInstance().listProductSale();
                                     for (Product pd : listSale) {
                                 %>
                                 <div class="col-lg-4">
                                     <div class="product__discount__item">
                                         <div class="product__discount__item__pic set-bg"
                                              data-setbg="<%=pd.getImage()%>">
                                             <div class="product__discount__percent"><%=pd.getPromotionalPrice()%>%</div>
                                             <ul class="product__item__pic__hover">
                                                 <%
                                                     if (user != null) {
                                                         Product product = new ProductDAO().getProductDetail(pd.getProductId());
                                                 %>
                                                 <%if (Integer.parseInt(product.getQuantity()) > 0) {%>
                                                 <li><a class="add-wishlist" id="addWishlist-<%=pd.getProductId()%>"><i
                                                         class="fa fa-heart"></i></a></li>
                                                 <li><a class="shopnow2" id="addCart-<%=pd.getProductId()%>"><i
                                                         class="fa fa-shopping-cart"></i></a></li>
                                                 <%}%>
                                                 <%
                                                 } else {%>
                                                 <li><a class="add-wishlist" href="login.jsp"><i class="fa fa-heart"></i></a>
                                                 </li>
                                                 <li><a class="shopnow2" href="login.jsp"><i
                                                         class="fa fa-shopping-cart"></i></a></li>
                                                 <% }
                                                 %>
                                             </ul>
                                         </div>
                                         <div class="product__discount__item__text">
                                             <h5>
                                                 <a href="product-details.jsp?id=<%=pd.getProductId()%>"><%=pd.getProductName()%>
                                                 </a></h5>
                                             <div class="product__item__price"><%=format.format(pd.getPrice() - (pd.getPrice() * pd.getPromotionalPrice() / 100))%>
                                                 đ<span><%=pd.getPrice()%>đ</span></div>
                                         </div>
                                     </div>
                                 </div>
                                 <% }%>

                             </div>
                         </div>
                     </div>--%>
                <div class="filter__item">
                    <div class="row">
                        <div class="col-lg-4 col-md-5"></div>
                        <div class="col-lg-4 col-md-4">
                            <div class="filter__found">
                                <h6><span style="margin-left: 20px"><%=request.getAttribute("numb")%></span> Sản Phẩm
                                </h6>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="row" id="items">

                </div>
                <%--<button onclick="loadMore()"
                        style="cursor: pointer; margin-left: 370px; color: #fff; border-radius: 20px;"
                        class="loadmore-btn site-btn">Tải thêm
                </button>--%>
                <div class="bar" id="pagging_bar">

                </div>
                <input id="total" name="total" value="<%=request.getAttribute("numb")%>" type="text" style="display: none">
                <input id="category" name="category" value="<%=request.getParameter("category")%>"
                       style="display: none">
                    <div class="pagination">
                        <ul> </ul>
                    </div>
            </div>
        </div>
    </div>
</section>
<!-- Product Section End -->

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
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.1/jquery.min.js"></script>
<script>
    $(document).ready(function () {
        total = $("#total").val();
        pagging(1);
        addcart();
        addwishlist();
        $("input[type='radio']").each(function () {
            this.addEventListener("change", function (e) {
                filter(e);
            })
        })
    })

    function  pagging(page) {
        let category = $("#category").val();
        const price = $("input[type='radio']:checked.checkGia").val();
        const orderby = $("input[type='radio']:checked.sapxep").val();
        const size = $("input[type='radio']:checked.checkSize").val();
        const listcate = $("input[type='radio']:checked.checkcate").val();
        if (listcate != null) {
            category = listcate;
        }

        $.ajax({
            url: "/Petshop_website_final_war/ControllerPagging",
            type: "get",
            data: {
                category: category,
                orderby: orderby,
                price: price,
                size: size,
                page: page,
            },
            success: function (data) {
                $("#items").html(data);
                addcart();
                addwishlist();
            },
            error: function (xhr) {
            }
        });
    }

    function addcart() {
        $(".shopnow2").each(function (e) {
            $(this).on("click", function (e) {
                e.preventDefault();
                const idAdd = this.id;
                const quantity = 1;
                $.ajax({
                    url: "AddCartController",
                    type: "get",
                    data: {
                        idAdd: idAdd,
                        quantity: quantity
                    },
                    success: function (data) {
                        $(".header__second__cart--notice").each(function () {
                            var quantity = $(this).text()
                            $(this).text(parseInt(quantity) + 1)
                            alert("Thêm vào giỏ hàng thành công")
                        })
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
                            alert("Thêm vào mục yêu thích thành công")
                        })
                    }
                })
            })
        });
    }

    function filter(e) {
        e.preventDefault();
        let total = $("#total").val();
        var amount = 0;
        let category = $("#category").val();
        const price = $("input[type='radio']:checked.checkGia").val();
        const orderby = $("input[type='radio']:checked.sapxep").val();
        const size = $("input[type='radio']:checked.checkSize").val();
        const listcate = $("input[type='radio']:checked.checkcate").val();
        if (listcate != null) {
            category = listcate;
        }
        $.ajax({
            type: 'post',
            url: "FilterProductController",
            data: {
                amount: amount,
                price: price,
                orderby: orderby,
                category: category,
                size: size
            },
            success: function (data) {
                $("#items").html(data);
                $(".filter__found h6 span").text($("#numb").val());
                $("#total").attr("value", $("#numb").val());
                let total = $("#total").val()
                let totalP
                if (total % 9 == 0 ) {
                    totalP = Math.floor(total/9);
                } else  {totalP = Math.floor(total/9) + 1;}
                createPagination(totalP,1);
            }
        });
    }
</script>
<script>
    const element = document.querySelector(".pagination ul");
    let totalProduct = $("#total").val();
    let totalPages;
    if (totalProduct % 9 ==0 ) {
        totalPages = totalProduct/9;
    } else {totalPages = Math.floor(totalProduct/9) +1;}
    let page = 1;
    element.innerHTML = createPagination(totalPages, page);
    function createPagination(totalPages, page){
        let liTag = '';
        let active;
        let beforePage = page - 1;
        let afterPage = page + 1;

        if(page > 2){
            liTag += `<li class="first numb" onclick="createPagination(${totalPages}, 1); pagging(${1})"><span>1</span></li>`;
            if(page > 3){
                liTag += `<li class="dots"><span>...</span></li>`;
            }
        }

        for (var plength = beforePage; plength <= afterPage; plength++) {
            if (plength > totalPages) {
                continue;
            }
            if (plength == 0) {
                plength = plength + 1;
            }
            if(page == plength){
                active = "active";
            }else{
                active = "";
            }
            liTag += `<li class="numb ${active}" onclick="createPagination(${totalPages}, ${plength}); pagging(${plength})"><span>${plength}</span></li>`;
        }
        if(page < totalPages - 1){
            if(page < totalPages - 2){
                liTag += `<li class="dots"><span>...</span></li>`;
            }
            liTag += `<li class="last numb" onclick="createPagination(${totalPages}, ${totalPages}), pagging(${plength})"><span>${totalPages}</span></li>`;
        }
        element.innerHTML = liTag;
        return liTag;
    }
</script>
</body>

</html>