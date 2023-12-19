<%--
  Created by IntelliJ IDEA.
  User: Nguyen Ngoc Huy
  Date: 12/12/2022
  Time: 12:40 PM
  To change this template use File | Settings | File Templates.
--%>
<%--
  Created by IntelliJ IDEA.
  User: Nguyen Ngoc Huy
  Date: 12/12/2022
  Time: 11:35 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="utf-8" %>
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
  <link href="SignUp/vendor/mdi-font/css/material-design-iconic-font.min.css" rel="stylesheet" media="all">
  <link href="SignUp/vendor/font-awesome-4.7/css/font-awesome.min.css" rel="stylesheet" media="all">
  <!-- Font special for pages-->
  <link href="https://fonts.googleapis.com/css?family=Poppins:100,100i,200,200i,300,300i,400,400i,500,500i,600,600i,700,700i,800,800i,900,900i" rel="stylesheet">

  <!-- Vendor CSS-->
  <link href="SignUp/vendor/select2/select2.min.css" rel="stylesheet" media="all">
  <link href="SignUp/vendor/datepicker/daterangepicker.css" rel="stylesheet" media="all">

  <!-- Main CSS-->
  <link href="SignUp/css/main.css" rel="stylesheet" media="all">
</head>

<body>
<div class="page-wrapper bg-gra-02 p-t-130 p-b-100 font-poppins">
  <div class="wrapper wrapper--w680">
    <div class="card card-4">
      <div class="card-body">
        <h2 class="title">Xác Nhận Email</h2>
        <% String error = (String) request.getAttribute("errorOTP"); %>
        <form method="POST" id="form-signup" action="/Petshop_website_final_war/NewPassword">
          <div class="row row-space">
            <div class="col-12">
              <div class="input-group">
                <label class="label">Nhập mật khẩu mới</label>
                <input id="newpass" type="text" name="newpass" style="width:250px; border: solid 3px #000000 ;height: 45px; border-radius: 30px; padding:10px">
              </div>
            </div>
            <div class="col-12">
              <div class="input-group">
                <label class="label">Nhập lại mật khẩu</label>
                <input id="confirmpass" type="text" name="confirmpass" style="width:250px; border: solid 3px #000000 ;height: 45px; border-radius: 30px; padding:10px">
              </div>
            </div>
            <div class="col-2">
              <div class="p-t-15" style="padding-top: 28px; padding-left: 30px;">
                <h5 class="error" style="color: red; font-size: 16px"><%= error == null ? "" : error%></h5>
                <input type="submit" value="Xác Nhận" class="btn btn--radius-2 btn--blue" style="margin-left: 120px">
                <%--                <a href="#"> <div class="btn btn--radius-2 btn--blue" type="text" >Xác Nhận</div></a>--%>
                <input type="text" id="role" name="role" value="register" style="display: none">

              </div> <br>
            </div>

          </div>
          <span style="margin-left: 150px ">Bạn đã có tài khoản? <a href="../Login/index.jsp" style="text-decoration: none; color: #00BFFF">Đăng nhập</a></span>
        </form>
      </div>
    </div>
  </div>
</div>

<!-- Jquery JS-->
<script src="SignUp/vendor/jquery/jquery.min.js"></script>


<!-- Vendor JS-->
<script src="SignUp/vendor/select2/select2.min.js"></script>
<script src="SignUp/vendor/datepicker/moment.min.js"></script>
<script src="SignUp/vendor/datepicker/daterangepicker.js"></script>

<!-- Main JS-->
<script src="SignUp/js/global.js"></script>

</body>

</html>
<!-- end document-->


