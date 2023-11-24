<%@ page import="java.util.List" %>
<%@ page import="vn.edu.hcmuaf.fit.services.ProductService" %>
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
                       <a href="#"><i class="fa fa-user"></i> Đăng Nhập</a>
                   </div>
               </div>
               <nav class="humberger__menu__nav mobile-menu">
                   <ul>
                       <li><a href="index.jsp">Home</a></li>
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

              <!-- Header Section Begin -->
            <jsp:include page="layout/header.jsp"></jsp:include>
    <!-- Header Section End -->


     <!-- Hero Section Begin -->
    <!-- Hero Section End -->

    <!--  -->
    <br>
    <h3 style="text-align: center;"> --CHÍNH SÁCH & QUY ĐỊNH CHUNG--</h3>
    <div class="content_policy">
        <h5> <strong>1.Giới thiệu</strong></h5>
        <p> Chào mừng quý khách hàng đến với PetShop.</p>
        <p>Chúng tôi là Công ty TNHH TOPDOG có địa chỉ trụ sở tại Phường 15, Bình Thạnh, Thành phố Hồ Chí Minh</p>
        <p>Thành lập trang thương mại điện tử và đã được đăng ký chính thức với Bộ Công Thương Việt Nam.

            Khi quý khách hàng truy cập vào trang website của chúng tôi có nghĩa là quý khách đồng ý với các điều khoản này. Trang web có quyền thay đổi, chỉnh sửa, thêm hoặc lược bỏ bất kỳ phần nào trong Điều khoản mua bán hàng hóa này, vào bất cứ lúc nào. Các thay đổi có hiệu lực ngay khi được đăng trên trang web mà không cần thông báo trước. Và khi quý khách tiếp tục sử dụng trang web, sau khi các thay đổi về Điều khoản này được đăng tải, có nghĩa là quý khách chấp nhận với những thay đổi đó.
            
            Quý khách hàng vui lòng kiểm tra thường xuyên để cập nhật những thay đổi của chúng tôi.</p>
        <h5> <strong>2. Hướng dẫn sử dụng website</strong></h5>
        <p>Khi vào web của chúng tôi, khách hàng phải đảm bảo đủ 18 tuổi, hoặc truy cập dưới sự giám sát của cha mẹ hay người giám hộ hợp pháp. Khách hàng đảm bảo có đầy đủ hành vi dân sự để thực hiện các giao dịch mua bán hàng hóa theo quy định hiện hành của pháp luật Việt Nam.</p>
        <p>Chúng tôi sẽ cấp một tài khoản (Account) sử dụng để khách hàng có thể mua sắm trên website trong khuôn khổ Điều khoản và Điều kiện sử dụng đã đề ra.</p>
        <p>Quý khách hàng sẽ phải đăng ký tài khoản với thông tin xác thực về bản thân và phải cập nhật nếu có bất kỳ thay đổi nào. Mỗi người truy cập phải có trách nhiệm với mật khẩu, tài khoản và hoạt động của mình trên web. Hơn nữa, quý khách hàng phải thông báo cho chúng tôi biết khi tài khoản bị truy cập trái phép. Chúng tôi không chịu bất kỳ trách nhiệm nào, dù trực tiếp hay gián tiếp, đối với những thiệt hại hoặc mất mát gây ra do quý khách không tuân thủ quy định.</p>
        <p>Nghiêm cấm sử dụng bất kỳ phần nào của trang web này với mục đích thương mại hoặc nhân danh bất kỳ đối tác thứ ba nào nếu không được chúng tôi cho phép bằng văn bản. Nếu vi phạm bất cứ điều nào trong đây, chúng tôi sẽ hủy tài khoản của khách mà không cần báo trước.</p>
        <p> Trong suốt quá trình đăng ký, quý khách đồng ý nhận email quảng cáo từ website. Nếu không muốn tiếp tục nhận mail, quý khách có thể từ chối bằng cách nhấp vào đường link ở dưới cùng trong mọi email quảng cáo.</p>
        <h5><strong> 3. Ý kiến của khách hàng</strong></h5>
        <p>Tất cả nội dung trang web và ý kiến phê bình của quý khách đều là tài sản của chúng tôi. Nếu chúng tôi phát hiện bất kỳ thông tin giả mạo nào, chúng tôi sẽ khóa tài khoản của quý khách ngay lập tức hoặc áp dụng các biện pháp khác theo quy định của pháp luật Việt Nam.</p>
        <h5><strong> 4. Chấp nhận đơn hàng và giá cả</strong></h5>
        <p> Chúng tôi có quyền từ chối hoặc hủy đơn hàng của quý khách vì bất kỳ lý do gì liên quan đến lỗi kỹ thuật, hệ thống một cách khách quan vào bất kỳ lúc nào.</p>
        <p> Ngoài ra, để đảm bảo tính công bằng cho khách hàng là người tiêu dùng cuối cùng của PetShop, chúng tôi cũng sẽ từ chối các đơn hàng không nhằm mục đích sử dụng cho cá nhân, mua hàng số lượng nhiều hoặc với mục đích mua đi bán lại.</p>
        <p> Chúng tôi cam kết sẽ cung cấp thông tin giá cả chính xác nhất cho người tiêu dùng. Tuy nhiên, đôi lúc vẫn có sai sót xảy ra, ví dụ như trường hợp giá sản phẩm không hiển thị chính xác trên trang web hoặc sai giá, tùy theo từng trường hợp chúng tôi sẽ liên hệ hướng dẫn hoặc thông báo hủy đơn hàng đó cho quý khách. Chúng tôi cũng có quyền từ chối hoặc hủy bỏ bất kỳ đơn hàng nào dù đơn hàng đó đã hay chưa được xác nhận hoặc đã thanh toán.</p>
        <h5><strong> 5. Thay đổi hoặc hủy bỏ giao dịch tại PetShop</strong></h5> 
        <p> Trong mọi trường hợp, khách hàng đều có quyền chấm dứt giao dịch nếu đã thực hiện các biện pháp sau đây:</p>
        <p>Thông báo cho PetShop về việc hủy giao dịch qua đường dây nóng (hotline)+84 987.145.145</p>
        <P> Trả lại hàng hoá đã nhận nhưng chưa sử dụng hoặc hưởng bất kỳ lợi ích nào từ hàng hóa đó (theo quy định của chính sách đổi trả hàng tại Chính sách đổi/ trả hàng và hoàn tiền)</P>
        <h5><strong>6. Giải quyết hậu quả do lỗi nhập sai thông tin tại PetShop</strong></h5>
        <P>Khách hàng có trách nhiệm cung cấp thông tin đầy đủ và chính xác khi tham gia giao dịch tại PetShop. Trong trường hợp khách hàng nhập sai thông tin và gửi vào trang TMĐT PetShop, PetShop có quyền từ chối thực hiện giao dịch. Ngoài ra, trong mọi trường hợp, khách hàng đều có quyền đơn phương chấm dứt giao dịch nếu đã thực hiện các biện pháp sau đây:</P>
        <p>Thông báo cho PetShop qua đường dây nóng +84 987.145.145 hoặc gửi email đến địa chỉ LTW_nhom10@gmail.com</p>
        <p>Trả lại hàng hoá đã nhận nhưng chưa sử dụng hoặc hưởng bất kỳ lợi ích nào từ hàng hóa đó.</p>
        <p>Trong trường hợp sai thông tin phát sinh từ phía PetShop mà PetShop có thể chứng minh đó là lỗi của hệ thống hoặc từ bên thứ ba (sai giá sản phẩm, sai xuất xứ, …), PetShop  sẽ đền bù cho khách hàng một mã giảm giá cho các lần mua sắm tiếp theo với mệnh giá tùy từng trường hợp cụ thể và có quyền không thực hiện giao dịch bị lỗi.</p>
        <h5> <strong>7. Thương hiệu và bản quyền</strong></h5>
        <p>Mọi quyền sở hữu trí tuệ (đã đăng ký hoặc chưa đăng ký), nội dung thông tin và tất cả các thiết kế, văn bản, đồ họa, phần mềm, hình ảnh, video, âm nhạc, âm thanh, biên dịch phần mềm, mã nguồn và phần mềm cơ bản đều là tài sản của chúng tôi. Toàn bộ nội dung của trang web được bảo vệ bởi luật bản quyền của Việt Nam và các công ước quốc tế. Bản quyền đã được bảo lưu.</p>
        <h5> <strong>8. Quyền pháp lý</strong></h5>
        <p>Các điều kiện, điều khoản và nội dung của trang web này được điều chỉnh bởi luật pháp Việt Nam và Tòa án có thẩm quyền tại Việt Nam sẽ giải quyết bất kỳ tranh chấp nào phát sinh từ việc sử dụng trái phép trang web này.</p>
        <h5> <strong>9. Quy định về bảo mật</strong></h5>
        <p>Trang web của chúng tôi coi trọng việc bảo mật thông tin và sử dụng các biện pháp tốt nhất bảo vệ thông tin và việc thanh toán của quý khách. Thông tin của quý khách trong quá trình thanh toán sẽ được mã hóa để đảm bảo an toàn. Sau khi quý khách hoàn thành quá trình đặt hàng, quý khách sẽ thoát khỏi chế độ an toàn.</p>
        <p>Quý khách không được sử dụng bất kỳ chương trình, công cụ hay hình thức nào khác để can thiệp vào hệ thống hay làm thay đổi cấu trúc dữ liệu. Trang web cũng nghiêm cấm việc phát tán, truyền bá hay cổ vũ cho bất kỳ hoạt động nào nhằm can thiệp, phá hoại hay xâm nhập vào dữ liệu của hệ thống. Cá nhân hay tổ chức vi phạm sẽ bị tước bỏ mọi quyền lợi cũng như sẽ bị truy tố trước pháp luật nếu cần thiết.</p>
        <p>Mọi thông tin giao dịch sẽ được bảo mật ngoại trừ trong trường hợp cơ quan pháp luật yêu cầu.</p>
        <h5> <strong>10. Thanh toán an toàn và tiện lợi tại PetShop</strong></h5>
        <p>Người mua có thể tham khảo các phương thức thanh toán sau đây và lựa chọn áp dụng phương thức phù hợp:</p>
        <p><strong><u>Cách 1:</u></strong> Thanh toán trực tiếp (người mua nhận hàng tại địa chỉ người bán):</p>
        <p>Bước 1: Người mua tìm hiểu thông tin về sản phẩm, dịch vụ được đăng tin;</p>
        <p>Bước 2: Người mua đến địa chỉ bán hàng</p>
        <p>Bước 3: Người mua thanh toán và nhận hàng;</p>
        <p><strong><u>Cách 2:</u> </strong>Thanh toán sau (COD - giao hàng và thu tiền tận nơi):</p>
        <p>Bước 1: Người mua tìm hiểu thông tin về sản phẩm, dịch vụ được đăng tin;</p>
        <p>Bước 2: Người mua xác thực đơn hàng (điện thoại, tin nhắn, email);</p>
        <p>Bước 3: Người bán xác nhận thông tin Người mua;</p>
        <p>Bước 4: Người bán chuyển hàng;</p>
        <p>Bước 5: Người mua nhận hàng và thanh toán.</p>
        <p><strong><u>Cách 3:</u></strong> Thanh toán online qua thẻ tín dụng, chuyển khoản</p>
        <p>Bước 1: Người mua tìm hiểu thông tin về sản phẩm, dịch vụ được đăng tin;</p>
        <p>Bước 2: Người mua xác thực đơn hàng (điện thoại, tin nhắn, email);</p>
        <p>Bước 3: Người bán xác nhận thông tin Người mua;</p>
        <p>Bước 4: Ngưởi mua thanh toán;</p>
        <p>Bước 5: Người bán chuyển hàng;</p>
        <p>Bước 6: Người mua nhận hàng.</p>
        <p>Đối với người mua hàng từ PetShop thì phải tuân thủ theo chính sách thanh toán của công ty.</p>

        <h5> <strong>11. Đảm bảo an toàn giao dịch tại PetShop</strong></h5>
        <p>Chúng tôi sử dụng các dịch vụ để bảo vệ thông tin về nội dung mà người bán đăng  sản phẩm trên PetShop. Để đảm bảo các giao dịch được tiến hành thành công, hạn chế tối đa rủi ro có thể phát sinh.</p>
        <h5> <strong>12. Luật pháp và thẩm quyền tại Lãnh thổ Việt Nam</strong></h5>
        <p> Tất cả các Điều Khoản và Điều Kiện này và Hợp Đồng (và tất cả nghĩa vụ phát sinh ngoài hợp đồng hoặc có liên quan) sẽ bị chi phối và được hiểu theo luật pháp của Việt Nam. Nếu có tranh chấp phát sinh bởi các Quy định Sử dụng này, quý khách hàng có quyền gửi khiếu nại/khiếu kiện lên Tòa án có thẩm quyền tại Việt Nam để giải quyết.</p>
   
   
   
   
   
   
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
 
    </body>
</html>