<%@ page import="java.util.List" %>
<%@ page import="vn.edu.hcmuaf.fit.services.ProductService" %>
<%@ page import="vn.edu.hcmuaf.fit.beans.Cart" %>
<%@ page import="vn.edu.hcmuaf.fit.beans.Product" %>
<%@ page import="java.text.NumberFormat" %>
<%@ page import="java.util.Locale" %>
<%@ page import="vn.edu.hcmuaf.fit.beans.UserAccount" %>
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
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.2.0/css/all.min.css"
          integrity="sha512-xh6O/CkQoPOWDdYTDqeRdPCVd1SpvCA9XXcUnZS2FmJNp1coAFzvtCN9BmamE+4aHK8yyUHUSCcJHgXloTyT2A=="
          crossorigin="anonymous" referrerpolicy="no-referrer"/>
    <link rel="icon" type="image/png" sizes="16x16" href="img/favicons/favicon-16x16.png">
    <!-- Css Styles -->
    <link rel="stylesheet" href="css/bootstrap.min.css" type="text/css">
    <link rel="stylesheet" href="css/font-awesome.min.css" type="text/css">
    <link rel="stylesheet" href="css/elegant-icons.css" type="text/css">
    <%--    <link rel="stylesheet" href="css/nice-select.css" type="text/css">--%>
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
        #myTableCK {
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

        #myTableCK label {
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
            margin-left: 40px;
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
                    <li><a href="product-details.jsp">Shop Details</a></li>
                    <li><a href="shoping-cart.jsp">Shoping Cart</a></li>
                    <li><a href="./checkout.html">Check Out</a></li>
                    <li><a href="./blog-details.jsp">Blog Details</a></li>
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
<%
    UserAccount user = (UserAccount) request.getSession().getAttribute("user");
    if (user == null) {
        response.sendRedirect("login.jsp");
    }
%>
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
                    <h2>Thanh toán</h2>
                    <div class="breadcrumb__option">
                        <a href="index.jsp">Trang chủ</a>
                        <span><strong>Thanh toán</strong></span>
                    </div>
                </div>
            </div>
        </div>
    </div>
</section>
<!-- Breadcrumb Section End -->

<!-- Checkout Section Begin -->
<section class="checkout spad">
    <div class="container">
        <div class="row">
            <div class="col-lg-12">
                <h6><span class="icon_tag_alt"></span> Bạn có mã giảm giá ? <a href="#">Nhấn vào đây</a> để nhận mã giảm
                    giá
                </h6>
            </div>
        </div>
        <div class="checkout__form">
            <h4>Thông tin thanh toán</h4>
            <form action="CheckoutController" method="post">
                <div class="row">
                    <div class="col-lg-6 col-md-6">
                        <div class="row">
                            <div class="col-lg-6">
                                <div class="checkout__input">
                                    <p>Họ Tên<span>*</span></p>
                                    <input type="text" class="fullname" name="fullname" value="<%=user.getName()%>">
                                </div>
                            </div>
                            <div class="col-lg-6">
                                <div class="checkout__input">
                                    <p>Số điện thoại<span>*</span></p>
                                    <input type="text" class="phone" name="phone" value="<%=user.getPhone()%>">
                                </div>
                            </div>
                        </div>
                        <div class="checkout__input">
                            <p>Địa chỉ<span>*</span></p>
                            <%if (user.getAddress() == null) {%>
                            <input type="text" id="address" class="address" name="address"
                                   placeholder="Nhập địa chỉ nhận hàng">
                            <%} else {%>
                            <input type="text" id="address" placeholder="Nhập địa chỉ nhận hàng" class="address"
                                   name="address" value="<%=user.getAddress()%>" readonly>
                            <%}%>
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
                        <div class="checkout__input">
                            <p>Email<span>*</span></p>
                            <input type="email" class="email" name="email" value="<%=user.getEmail()%>">
                        </div>
                        <div class="checkout__input">
                            <p>Ghi chú</p>
                            <input type="text" class="notice"
                                   placeholder="Ghi chú về đơn hàng của bạn, ví dụ: Giao hàng vào khung giờ nào..."
                                   name="notice">
                        </div>
                    </div>
                    <%
                        Cart cart = (Cart) request.getSession().getAttribute("cart");
                        NumberFormat format = NumberFormat.getInstance(new Locale("vn", "VN"));
                    %>
                    <div class="col-lg-6 col-md-6">
                        <div class="checkout__order">
                            <h4>Hóa đơn của bạn</h4>
                            <div class="checkout__order__products">Sản phẩm <span>Tổng tiền</span></div>
                            <ul>
                                <%
                                    for (String id : cart.getData().keySet()) {
                                        if (cart.getData().get(id).getPromotional() == 1) {%>
                                <li><%=cart.getData().get(id).getProductName()%>
                                    <span>
                                        <%=format.format(cart.getData().get(id).getQuantityCart() * (cart.getData().get(id).getPrice() - (cart.getData().get(id).getPrice() * cart.getData().get(id).getPromotionalPrice() / 100)))%>₫
                                    </span>
                                </li>
                                <%} else {%>
                                <li><%=cart.getData().get(id).getProductName()%>
                                    <span>
                                        <%=format.format(cart.getData().get(id).getQuantityCart() * cart.getData().get(id).getPrice())%>₫
                                    </span>
                                </li>
                                <%}%>
                                <% }%>
                                <li> Phí vận chuyển
                                    <span id="Fee">
                                    </span>
                                </li>
                                <li> Thời gian nhận dự kiến
                                    <span id="Time">
                                    </span>
                                </li>
                            </ul>
                            <div class="checkout__order__total">Tổng tiền
                                <input value="<%=cart != null ? cart.total() : 0%>" id="totalPrice"
                                       style="display: none">
                                <span id="sum"></span></div>

                            <p>Kiểm tra lại thông tin đơn hàng và những thông tin tôi đã nhập trước khi đặt hàng.</p>
                            <div class="checkout__input__checkbox">
                                <label for="payment">
                                    Thanh toán khi nhận hàng
                                    <input type="checkbox" id="payment">
                                    <span class="checkmark"></span>
                                </label>
                            </div>
                            <div id="errorOrder" style="text-align: center; color: red"></div>
                            <button class="site-btn" id="submitck" onclick="showTableCK()">Mua hàng</button>
                            <div id="myTableCK">
                                <label>Ký xác nhận đơn hàng</label>
                                <br><br>
                                <div onclick="hideTableCK()" class="bt2">Hủy</div>
                                <div onclick="" class="bt2">Xác nhận</div>
                            </div>
                            <input id="getDistrict" value="" type="text" style="display: none">
                            <input id="getWard"  value="" type="text" style="display: none" >
                        </div>
                    </div>
                </div>
            </form>
        </div>
    </div>
</section>
<!-- Checkout Section End -->

<!-- Footer Section Begin -->
<jsp:include page="layout/footer.jsp"></jsp:include>
<!-- Footer Section End -->

<!-- Js Plugins -->
<script src="js/jquery-3.3.1.min.js"></script>
<script src="js/bootstrap.min.js"></script>
<%--<script src="js/jquery.nice-select.min.js"></script>--%>
<script src="js/jquery-ui.min.js"></script>
<script src="js/jquery.slicknav.js"></script>
<script src="js/mixitup.min.js"></script>
<script src="js/owl.carousel.min.js"></script>
<script src="js/main.js"></script>
<script src="admin/assets/js/vendor-all.min.js"></script>
<script src="admin/assets/js/plugins/bootstrap.min.js"></script>
<script src="js/axios.min.js"></script>
<%--<script src="js/API.js"></script>--%>
<script>
    $("#submitck").click(function (e) {
        e.preventDefault();
        const fullname = $(".fullname").val();
        const phone = $(".phone").val();
        const address = $(".address").val();
        console.log(address);
        const email = $(".email").val();
        const notice = $(".notice").val();
        const error = document.getElementById("errorOrder");
        const getWard = $("#getWard").val();
        const getDistrict = $("#getDistrict").val();
        if (fullname == "" || phone == "" || address == "" || email == "") {
            error.innerHTML = "Vui lòng điền và chọn đủ cái thông tin!";
        } else {
            axios.post('http://140.238.54.136/api/auth/login', {
                email: EMAIL,
                password: PASSWORD
            })
                .then(response => {
                    register(response.data.access_token);
                });

            function register(token) {
                url = "http://140.238.54.136/api/registerTransport"
                body = {
                    from_district_id: DISTRICT,
                    from_ward_id: WARD,
                    to_district_id: getDistrict,
                    to_ward_id: getWard,
                    height: "100",
                    length: "100",
                    width: "100",
                    weight: "100",
                    token: token
                }
                axios.post(url, body).then(response => {
                    const idT = response.data.Transport.id;
                    $.ajax({
                        type: 'post',
                        url: '/Petshop_website_final_war/CheckoutController',
                        data: {
                            idT: idT,
                            fullname: fullname,
                            phone: phone,
                            address: address,
                            email: email,
                            notice: notice
                        },
                        success: function (data) {
                            if (data.length > 0){
                                window.location.href = "./my-orders.jsp"
                                alert("Đã đặt hàng thành công! Mã đơn hàng của bạn là " + data)
                            } else {
                                window.location.href = "./shoping-cart.jsp"
                                alert("Số lượng tồn kho của sản phẩm không đáp ứng đủ!")
                            }

                        }
                    })
                })
            }
        }
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
            renderDataProvince(response.data.original.data, "province");
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
                renderDataDistrict(response.data.original.data, "district");
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
                renderDataWard(response.data.original.data, "ward");
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
    function showTableCK() {
        document.getElementById("myTableCK").style.display = "block";
        document.getElementById("overlayT").classList.add("show");
        document.getElementById("overlayT").addEventListener("click", hideTableOnClickOutside);
    }
    function hideTableOnClickOutside(event) {
        var myTableCK = document.getElementById("myTableCK");

        // Kiểm tra xem phần tử được click có phải là myTableCK không
        if (!myTableCK.contains(event.target)) {
            hideTableCK();
        }
    }
    function hideTableCK() {
        document.getElementById("myTableCK").style.display = "none";
        document.getElementById("overlayT").classList.remove("show");
        document.getElementById("overlayT").removeEventListener("click", hideTableOnClickOutside);
    }

    var soNha = document.getElementById("soNha").value;

    function validateInput() {
        if ($("#district").val() != "" && $("#province").val() != "" &&
            $("#ward").val() != "" && $("#soNha").val() != "") {
            document.getElementById("address").value = $("#soNha").val() + ", " + $("#ward option:selected").text() +
                ", " + $("#district option:selected").text() + ", " +
                $("#province option:selected").text();
            login();
            hideTable();
        } else {
            document.getElementById('error').innerHTML = 'Vui lòng chọn đủ thông tin địa chỉ';
        }
    }

    function login() {
        const address_info = $("#address").val();
        if (address_info !== null && address_info !== "null" && address_info !== "") {
            document.getElementById("Fee").innerHTML = "";
            document.getElementById("Time").innerHTML = "";
            var url = 'http://140.238.54.136/api/auth/login';
            var body = {
                email: EMAIL,
                password: PASSWORD
            }
            axios.post(url, body).then(response => {
                token = response.data.access_token;
                checkProvince(token);
            })
        }
    }

    var checkProvince = (token) => {
        const address_info = $("#address").val();
        let addressParts = address_info.split(", ");
        let getprovince = addressParts[3];
        axios.get(`http://140.238.54.136/api/province?token=${token}`).then(response => {
            var findDistrict = response.data.original.data.find(obj => getprovince.indexOf(obj.ProvinceName) !== -1)
            var provinceid = findDistrict.ProvinceID;
            checkDistrict(token, provinceid);
        })
    }
    var checkDistrict = (token, provinceid) => {
        axios.get(`http://140.238.54.136/api/district?token=${token}`, {
            params: {
                provinceID: provinceid
            }
        }).then(response => {
            const address_info = $("#address").val();
            let addressParts = address_info.split(", ");
            let getdistrict = addressParts[2];
            var findDistrict = response.data.original.data.find(obj => getdistrict.indexOf(obj.DistrictName) !== -1)
            var districtid = findDistrict.DistrictID;
            $("#getDistrict").val(districtid);
            checkWard(token, districtid);
        })
    }
    var checkWard = (token, districtid) => {
        axios.get(`http://140.238.54.136/api/ward?token=${token}`, {
            params: {
                districtID: districtid
            }
        }).then(response => {
            const address_info = $("#address").val();
            let addressParts = address_info.split(", ");
            let getward = addressParts[1];
            var findWard = response.data.original.data.find(obj => getward.indexOf(obj.WardName) !== -1)
            var wardid = findWard.WardCode;
            $("#getWard").val(wardid);
            fee(token, districtid, wardid);
            time(token, districtid, wardid);
        })
    }
    var fee = async (token, districtid, wardid) => {
        var url = `http://140.238.54.136/api/calculateFee`;
        var body = {
            token: token,
            from_district_id: DISTRICT,
            from_ward_id: WARD,
            to_district_id: districtid,
            to_ward_id: wardid,
            height: "100",
            length: "100",
            width: "100",
            weight: "100",
        }

        axios.post(url, body).then(response => {
            var data = response.data.data;
            var service_fee = parseInt(data[0].service_fee);
            let fee = new Intl.NumberFormat('vi-VN', {
                style: 'currency',
                currency: 'VND'
            }).format(service_fee)
            let total = new Intl.NumberFormat('vi-VN', {
                style: 'currency',
                currency: 'VND'
            }).format(service_fee + parseFloat($("#totalPrice").val()))
            document.getElementById("Fee").innerHTML = fee;
            document.getElementById("sum").innerHTML = total;
        })
    }

    var time = async (token, districtid, wardid) => {
        var url = `http://140.238.54.136/api/leadTime`;
        var body = {
            token: token,
            from_district_id: DISTRICT,
            from_ward_id: WARD,
            to_district_id: districtid,
            to_ward_id: wardid,
            height: "100",
            length: "100",
            width: "100",
            weight: "100",
        }
        axios.post(url, body).then(response => {
            var data = response.data.data;
            var formattedDate = data[0].formattedDate;
            var date = new Date(formattedDate);
            var formattedString = date.getUTCDate() + "/" + (date.getUTCMonth() + 1) + "/" + date.getUTCFullYear();
            document.getElementById("Time").innerHTML = formattedString;
        })
    }
    console.log()
</script>
</body>

</html>