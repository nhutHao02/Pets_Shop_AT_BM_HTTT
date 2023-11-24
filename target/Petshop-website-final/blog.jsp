<%@ page import="vn.edu.hcmuaf.fit.services.ProductService" %>
<%@ page import="java.util.List" %>
<%@ page import="vn.edu.hcmuaf.fit.beans.Detail" %>
<%@ page import="vn.edu.hcmuaf.fit.dao.DetailDAO" %>
<%@ page import="vn.edu.hcmuaf.fit.beans.Blogs" %>
<%@ page import="vn.edu.hcmuaf.fit.services.BlogService" %>
<%@ page import="vn.edu.hcmuaf.fit.dao.BlogDAO" %>
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
        .row p {
            overflow: hidden;
            text-overflow: ellipsis;
            line-height: 25px;
            -webkit-line-clamp: 2;
            display: -webkit-box;
            -webkit-box-orient: vertical;
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
            <a href="login.jsp"><i class="fa fa-user"></i> Đăng nhập</a>
        </div>
    </div>
    <nav class="humberger__menu__nav mobile-menu">
        <ul>
            <li><a href="index.jsp">Home</a></li>
            <li><a href="all-products.jsp">Shop</a></li>
            <!-- <li><a href="#">Pages</a>
                <ul class="header__menu__dropdown">
                    <li><a href="./product-details.jsp">Shop Details</a></li>
                    <li><a href="./shoping-cart.jsp">Shoping Cart</a></li>
                    <li><a href="./checkout.jsp">Check Out</a></li>
                    <li><a href="./blog-details.jsp">Blog Details</a></li>
                </ul>
            </li> -->
            <li class="active"><a href="./blog.html">Blog</a></li>
            <li><a href="contact.jsp">Contact</a></li>
        </ul>
    </nav>
    <div id="mobile-menu-wrap"><div class="slicknav_menu"><a href="#" aria-haspopup="true" role="button" tabindex="0" class="slicknav_btn slicknav_collapsed" style="outline: none;"><span class="slicknav_menutxt">MENU</span><span class="slicknav_icon"><span class="slicknav_icon-bar"></span><span class="slicknav_icon-bar"></span><span class="slicknav_icon-bar"></span></span></a><nav class="slicknav_nav slicknav_hidden" aria-hidden="true" role="menu" style="display: none;">
        <ul>
            <li><a href="index.jsp" role="menuitem">Home</a></li>
            <li><a href="all-products.jsp" role="menuitem">Shop</a></li>
            <!-- <li><a href="#">Pages</a>
                <ul class="header__menu__dropdown">
                    <li><a href="./product-details.jsp">Shop Details</a></li>
                    <li><a href="./shoping-cart.jsp">Shoping Cart</a></li>
                    <li><a href="./checkout.jsp">Check Out</a></li>
                    <li><a href="./blog-details.jsp">Blog Details</a></li>
                </ul>
            </li> -->
            <li class="active"><a href="./blog.html" role="menuitem">Blog</a></li>
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
                    <h2>Tin tức</h2>
                    <div class="breadcrumb__option">
                        <a href="index.jsp">Trang chủ</a>
                        <span><strong>Tin tức</strong></span>
                    </div>
                </div>
            </div>
        </div>
    </div>
</section>
<!-- Breadcrumb Section End -->

<!-- Blog Section Begin -->
<% int total = new BlogDAO().allBlog();%>
<section class="blog spad">
    <div class="container">
        <div class="row">
            <div class="col-lg-4 col-md-5">
                <div class="blog__sidebar">
                    <div class="blog__sidebar__search">
                        <form action="#">
                            <input type="search" oninput="searchByNameBlog(this)" name="txt" placeholder="Tìm kiếm...">
                            <button type="submit"><span class="icon_search"></span></button>
                        </form>
                    </div>
                    <div class="blog__sidebar__item">
                        <h4>Thể loại</h4>
                        <input type="radio" id="0" class="theloai" name="theloai" value="-1" checked>
                        <label for="0">Tất cả</label><br>
                        <% List<Blogs> theloai = new BlogService().Theloai();
                            for (Blogs b: theloai) {
                        %>
                        <input type="radio" id="<%=b.getCatId()%>" class="theloai" name="theloai" value="<%=b.getCatId()%>">
                        <label for="<%=b.getCatId()%>"><%=b.getCatName()%></label><br>
                        <% } %>
                    </div>
                    <div class="blog__sidebar__item">
                        <h4>Tin mới nhất</h4>
                        <div class="blog__sidebar__recent">
                            <% List<Blogs> listNew = new BlogService().NewBlogs();
                                for(Blogs b : listNew) {
                            %>
                            <a href="blog-details.jsp?id=<%=b.getBlogId()%>" class="blog__sidebar__recent__item" style="    display: flex !important;">
                                <div class="blog__sidebar__recent__item__pic">
                                    <img src="<%=b.getImage()%>" alt="" style="object-fit: cover;height: 60px;width: 180px">
                                </div>
                                <div class="blog__sidebar__recent__item__text">
                                    <h6><%=b.getBlogName()%></h6>
                                    <span><%=b.getCreateDate()%></span>
                                </div>
                            </a>
                            <% }%>
                        </div>
                    </div>
                </div>
            </div>
            <div class="col-lg-8 col-md-7">
                <div class="row" id="content">
                </div>
                <div class="pagination">
                    <ul> </ul>
                </div>
                <input id="tt" value="<%=total%>" type="text" style="display: none">
            </div>
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


<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script>
    function searchByNameBlog(para  m){
        var txtSearch = param.value;
        $.ajax({
            url: "/Petshop_website_final_war/SearchBlog",
            type: "get",
            data: {
                txt: txtSearch
            },
            success: function (data) {
                var row = document.getElementById("content");
                row.innerHTML = data;
            },
            error: function (xhr) {
                //Do Something to handle error
            }
        });
    }
</script>

<script>
    $(document).ready(function () {
        pagging(1);
        $("input[type='radio']").each(function () {
            this.addEventListener("change", function (e) {
                filter(e);
            })
        })
    })

    function pagging(page) {

        const theloai = $("input[type='radio']:checked.theloai").val();
        $.ajax({
            url: "/Petshop_website_final_war/PaggingBlogs",
            type: "get",
            data: {
                theloai: theloai,
                page: page,
            },
            success: function (data) {
                $("#content").html(data);
            },
            error: function (xhr) {
            }
        });
    }

    function filter() {
        const theloai = $("input[type='radio']:checked.theloai").val();
        $.ajax({
            url: "/Petshop_website_final_war/FilterBlog",
            type: "get", //send it through get method
            data: {
                theloai: theloai
            },
            success: function (data) {
                $("#content").html(data);
                var total = $("#totalPageInBlogs").val();
                var totalPages;
                if (total % 6 != 0 ) {
                    totalPages = Math.floor(total/6) + 1;
                } else { totalPages = Math.floor(total/6) }
                console.log(totalPages);
                createPagination(totalPages,1);
            }
        });
    }

</script>
<script>
    const element = document.querySelector(".pagination ul");
    let totalPro = $("#tt").val();
    let totalPages;
    if (totalPro % 6 == 0) {
        totalPages = Math.floor(totalPro / 6);
    } else { totalPages = Math.floor(totalPro / 6)+ 1; }
    console.log(totalPages);
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