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
    <link rel="stylesheet" href="Login/css/style.css">

    <link rel="stylesheet" href="css/bootstrap.min.css" type="text/css">
    <link rel="stylesheet" href="css/font-awesome.min.css" type="text/css">
    <link rel="stylesheet" href="css/elegant-icons.css" type="text/css">
    <link rel="stylesheet" href="css/nice-select.css" type="text/css">
    <link rel="stylesheet" href="css/jquery-ui.min.css" type="text/css">
    <link rel="stylesheet" href="css/owl.carousel.min.css" type="text/css">
    <link rel="stylesheet" href="css/slicknav.min.css" type="text/css">
    <link rel="stylesheet" href="css/style.css" type="text/css">
</head>
<body>
<style>
    .g-recaptcha {
        position: absolute;
        left: 50%;
        top:365px;
        transform: translate(-50%, -50%);
    }
    .form-block {
        padding-top: 25px;
    }
    .forgot-pass:hover {
        color: black;
    }
</style>
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
            <li><a href="index.jsp">Home</a></li>
            <li><a href="./shop-grid.html">Shop</a></li>
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
            <li><a href="./shop-grid.html" role="menuitem">Shop</a></li>
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

<%-- Login--%>
<div class="content1">
    <div class="container">
        <div class="row justify-content-center">
            <!-- <div class="col-md-6 order-md-2">
              <img src="images/undraw_file_sync_ot38.svg" alt="Image" class="img-fluid">
            </div> -->
            <div class="col-md-6 contents">
                <div class="row justify-content-center">
                    <div class="col-md-12">
                        <div class="form-block">
                            <div class="mb-4">
                                <h3>Đăng nhập</h3>
                            </div>
                            <form action="LoginController" method="post" id="form">
                                <div class="form-group first">
                                    <p> Tên đăng nhập</p>
                                    <input type="text" class="form-control" id="username" name="username">
                                </div>
                                <div class="form-group last mb-3">
                                    <p>Mật khẩu</p>
                                    <input type="password" class="form-control" id="password" name="password">
                                </div>

                                <% String status = (String) request.getAttribute("loginStatus");%>
                                <h5 style="text-align:left; color: red;">
                                    <%= status == null ? "" : status%>
                                </h5>

                                <div class="align-items-center" style="margin-bottom: 115px">
                                    <span class="ml-auto"><a href="forget.jsp" class="forgot-pass">Quên mật khẩu</a></span>
                                </div>
                                <div id="error" style="text-align: center; color: red"> </div>
                                <div class="g-recaptcha" data-sitekey="6Lc-rz4pAAAAAMFROxcGMq_B3Yk8NAX6fRrY1wZY"></div>
                                <%--                                                       <a href="#" style="text-decoration: none;">--%>
                                <%--                                                         <div class="button_login"> Đăng nhập</div>--%>
                                <%--                                                       </a>--%>
                                <input type="submit" value="Đăng nhập" class="btn btn-pill text-white btn-block btn-primary">

                                <span class="d-block text-center my-4 text-muted"> Đăng nhập với:</span>

                                <div class="social-login text-center">
                                    <a href="#" class="facebook">
                                        <span ><i class="fa-brands fa-facebook-f"></i></span>
                                    </a>
                                    <a href="#" class="twitter">
                                        <span ><i class="fa-brands fa-twitter"></i></span>
                                    </a>
                                    <a href="https://accounts.google.com/o/oauth2/auth?scope=profile+email&redirect_uri=http://localhost:8080/Petshop_website_final_war/LoginGoogleHandler&response_type=code
		   &client_id=863418616412-fi3ia9v25cl6jun5jbmgr4j9m0km6bof.apps.googleusercontent.com&approval_prompt=force" class="google">
                                        <span> <i class="fa-brands fa-google"></i></span>
                                    </a>

                                    <span class="d-block text-center text-muted"><a href="signup.jsp" style="width: 60px; color: #6c757d;">Đăng kí</a> </span>
                                </div>
                            </form>
                        </div>
                    </div>
                </div>
            </div>

        </div>
    </div>
</div>


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
<script src="https://www.google.com/recaptcha/api.js" async defer></script>

<script>
    window.onload = function (){
        let isValid = false;
        const form = document.getElementById("form");
        const error = document.getElementById("error");

        form.addEventListener("submit", function (event){
            event.preventDefault();
            const response = grecaptcha.getResponse();
            if (response){
                form.submit();
            } else {
                error.innerHTML = "Vui lòng xác thực captcha!";
            }
        });
    }
</script>
</body>
</html>