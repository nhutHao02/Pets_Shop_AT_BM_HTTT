<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">

<head>
    <!-- Required meta tags-->
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="Colorlib Templates">
    <meta name="author" content="Colorlib">
    <meta name="keywords" content="Colorlib Templates">

    <!-- Title Page-->
    <title></title>

    <!-- Icons font CSS-->
    <link href="vendor/mdi-font/css/material-design-iconic-font.min.css" rel="stylesheet" media="all">
    <link href="vendor/font-awesome-4.7/css/font-awesome.min.css" rel="stylesheet" media="all">
    <!-- Font special for pages-->
    <link href="https://fonts.googleapis.com/css?family=Poppins:100,100i,200,200i,300,300i,400,400i,500,500i,600,600i,700,700i,800,800i,900,900i"
          rel="stylesheet">

    <!-- Vendor CSS-->
    <link href="vendor/select2/select2.min.css" rel="stylesheet" media="all">
    <link href="vendor/datepicker/daterangepicker.css" rel="stylesheet" media="all">

    <!-- Main CSS-->
    <link href="css/main.css" rel="stylesheet" media="all">
</head>

<body>
<div class="page-wrapper bg-gra-02 p-t-130 p-b-100 font-poppins">
    <div class="wrapper wrapper--w680">
        <div class="card card-4">
            <div class="card-body">
                <h2 class="title">Đăng kí</h2>
                <form method="POST" id="form-signup" action="/Petshop_website_final_war/SignUp/SignUpController">
                    <div class="row row-space">
                        <div class="col-12">
                            <div class="input-group">
                                <label class="label">Họ Tên</label>
                                <input class="input--style-4" type="text" id="fullname" name="fullname">
                            </div>
                        </div>
                        <div class="col-2">
                            <div class="input-group">
                                <label class="label">Email</label>
                                <input class="input--style-4" type="email" id="email" name="email">
                            </div>
                        </div>

                    </div>
                    <div class="row row-space">
                        <div class="col-2">
                            <div class="input-group">
                                <label class="label">Tên đăng nhập</label>
                                <input class="input--style-4" type="text" id="user" name="user">
                            </div>
                        </div>
                        <div class="col-2">
                            <div class="input-group">
                                <label class="label">Giới tính</label>
                                <div class="p-t-10" style="padding:12px ;">
                                    <label class="radio-container m-r-45" style="padding-right:20px ;">Nam
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
                        <div class="col-2">
                            <div class="input-group">
                                <label class="label">Mật khẩu</label>
                                <input id="upass" class="input--style-4" type="password" name="passwd">
                            </div>
                        </div>
                        <div class="col-2">
                            <div class="input-group">
                                <label class="label">Số điện thoại</label>
                                <input class="input--style-4" type="text" id="phone" name="phone">
                            </div>

                        </div>
                    </div>
                    <div class="row row-space">
                        <div class="col-2">
                            <div class="input-group">
                                <label class="label">Nhập Lại Mật khẩu</label>
                                <input id="upassconfirm" class="input--style-4" type="password"
                                       data-id="confirmpassword" name="confirmpassword">
                            </div>
                        </div>
                        <div class="col-2">
                            <% String error = (String) request.getAttribute("registerError"); %>
                            <p style="color: red; text-align: center; text-transform: none !important;padding-top: 5px; text-align: center"><%= error == null ? "" : error%>
                            </p>
                            <div class="p-t-15" style="padding-top: 28px; padding-left: 30px;">
                                <input class="btn btn--radius-2 btn--blue" type="submit" value="Đăng Ký">
                            </div>

                        </div>
                    </div>
                    <span>Bạn đã có tài khoản? <a href="../Login/index.jsp"
                                                  style="text-decoration: none; color: #00BFFF">Đăng nhập</a></span>
                </form>
            </div>
        </div>
    </div>
</div>

<!-- Jquery JS-->
<script src="vendor/jquery/jquery.min.js"></script>


<!-- Vendor JS-->
<script src="vendor/select2/select2.min.js"></script>
<script src="vendor/datepicker/moment.min.js"></script>
<script src="vendor/datepicker/daterangepicker.js"></script>
<!-- Main JS-->
<script src="js/global.js"></script>

</body>

</html>
<!-- end document-->