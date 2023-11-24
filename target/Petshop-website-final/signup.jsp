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

        <link href="https://fonts.googleapis.com/css?family=Poppins:100,100i,200,200i,300,300i,400,400i,500,500i,600,600i,700,700i,800,800i,900,900i" rel="stylesheet">

        <!-- Vendor CSS-->
        <!-- <link href="vendor/select2/select2.min.css" rel="stylesheet" media="all"> -->
        <link href="Login/vendor/datepicker/daterangepicker.css" rel="stylesheet" media="all">
        <link href="Login/css/main.css" rel="stylesheet" media="all">

    <%--        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.2.0/css/all.min.css" integrity="sha512-xh6O/CkQoPOWDdYTDqeRdPCVd1SpvCA9XXcUnZS2FmJNp1coAFzvtCN9BmamE+4aHK8yyUHUSCcJHgXloTyT2A==" crossorigin="anonymous" referrerpolicy="no-referrer" />--%>
<%--        <link rel="icon" type="image/png" sizes="16x16"  href="img/favicons/favicon-16x16.png">--%>
<%--        <!-- Css Styles -->--%>
<%--        <link href="vendor/datepicker/daterangepicker.css" rel="stylesheet" media="all">--%>
<%--        <link href="css/main.css" rel="stylesheet" media="all">--%>


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

     <div class="page-wrapper bg-gra-02 p-t-130 p-b-100 font-poppins">
         <div class="wrapper wrapper--w680">
             <div class="card card-4">
                 <div class="card-body">
                     <h2 class="title">Đăng kí</h2>
                     <form method="POST" id="form-signup" action="/Petshop_website_final_war/SignUpController">
                         <div class="row row-space">
                             <div class="col-6">
                                 <div class="input-group">
                                     <label class="label">Họ Tên</label>
                                     <input class="input--style-4" type="text" id="fullname" name="fullname">
                                 </div>
                             </div>
                             <div class="col-6">
                                 <div class="input-group">
                                     <label class="label">Email</label>
                                     <input class="input--style-4" type="email" id="email" name="email">
                                 </div>
                             </div>
                         </div>
                         <div class="row row-space">
                             <div class="col-6">
                                 <div class="input-group">
                                     <label class="label">Tên đăng nhập</label>
                                     <input class="input--style-4" type="text" id="user" name="user">
                                 </div>
                             </div>
                             <div class="col-6">
                                 <div class="input-group">
                                     <label class="label">Giới tính</label>
                                     <div class="p-t-10">
                                         <label class="radio-container m-r-45">Nam
                                             <input type="radio" checked="checked" name="gender">
                                             <span class="checkmark"></span>
                                         </label>
                                         <label class="radio-container">Nữ
                                             <input type="radio" name="gender">
                                             <span class="checkmark"></span>
                                         </label>
                                     </div>
                                 </div>
                             </div>
                         </div>
                         <div class="row row-space">
                             <div class="col-6">
                                 <div class="input-group">
                                     <label class="label">Mật khẩu</label>
                                     <input id="upass" class="input--style-4" type="password" name="passwd">
                                 </div>
                             </div>
                             <div class="col-6">
                                 <div class="input-group">
                                     <label class="label">Số điện thoại</label>
                                     <input class="input--style-4" type="text" id="phone" name="phone">
                                 </div>
                             </div>
                         </div>


                         <div class="row row-space">
                             <div class="col-6">
                                 <div class="input-group">
                                     <label class="label">Nhập Lại Mật khẩu</label>
                                     <input id="upassconfirm" class="input--style-4" type="password"
                                            data-id="confirmpassword" name="confirmpassword">
                                 </div>
                             </div>
                             <div class="col-6">
                                 <% String error = (String) request.getAttribute("registerError"); %>
                                 <p style="color: red; text-align: center; text-transform: none !important;padding-top: 5px; padding-bottom: 5px; text-align: center"><%= error == null ? "" : error%>
                                 </p>
                                 <div class="p-t-15">
                                     <input class="btn btn-pill text-white btn-primary button_login" type="submit" value="Đăng Ký" style="border-radius: 30px; width: 250px; margin-left:20px ">
                                 </div>
                             </div>
                         </div>

                         <span> <a href="login.jsp" style="text-decoration: none; color: #555;">Đăng nhập</a></span>
                     </form>
                 </div>
             </div>
         </div>
     </div>

<%--    <iframe src="SignUp/index.jsp" width="100%" height="100%" frameborder="0" > </iframe>--%>
      <!-- Footer Section Begin -->
     <jsp:include page="layout/footer.jsp"></jsp:include>
    <!-- Footer Section End -->


<%--     <!-- Js Plugins -->--%>
<%--     <script src="js/jquery-3.3.1.min.js"></script>--%>
<%--     <script src="js/bootstrap.min.js"></script>--%>
<%--     <script src="js/jquery.nice-select.min.js"></script>--%>
<%--     <script src="js/jquery-ui.min.js"></script>--%>
<%--     <script src="js/jquery.slicknav.js"></script>--%>
<%--     <script src="js/mixitup.min.js"></script>--%>
<%--     <script src="js/owl.carousel.min.js"></script>--%>
<%--     <script src="js/main.js"></script>--%>
<%--     <script src="admin/assets/js/vendor-all.min.js"></script>--%>
<%--     <script src="admin/assets/js/plugins/bootstrap.min.js"></script>--%>

     <!-- Jquery JS-->
     <script src="vendor/jquery/jquery.min.js"></script>


     <!-- Vendor JS-->
     <script src="vendor/datepicker/moment.min.js"></script>
     <script src="vendor/datepicker/daterangepicker.js"></script>

     <!-- Main JS-->
     <!-- <script src="js/global.js"></script> -->
     <script src="global.js"></script>

 
</body>
</html>