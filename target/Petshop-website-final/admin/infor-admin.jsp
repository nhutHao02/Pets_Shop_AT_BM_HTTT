<%@ page import="vn.edu.hcmuaf.fit.beans.UserAccount" %><%--
  Created by IntelliJ IDEA.
  User: ADMIN
  Date: 15/12/2022
  Time: 4:15 CH
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
  <title>Quản lý Petshop</title>
  <!-- HTML5 Shim and Respond.js IE11 support of HTML5 elements and media queries -->
  <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
  <!--[if lt IE 11]>
  <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
  <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
  <![endif]-->
  <!-- Meta -->
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0, user-scalable=0, minimal-ui">
  <meta http-equiv="X-UA-Compatible" content="IE=edge" />
  <meta name="description" content="DashboardKit is made using Bootstrap 5 design framework. Download the free admin template & use it for your project.">
  <meta name="keywords" content="DashboardKit, Dashboard Kit, Dashboard UI Kit, Bootstrap 5, Admin Template, Admin Dashboard, CRM, CMS, Free Bootstrap Admin Template">
  <meta name="author" content="DashboardKit ">


  <!-- Favicon icon -->
  <link rel="icon" href="assets/images/favicon.svg" type="image/x-icon">

  <!-- font css -->
  <link rel="stylesheet" href="assets/fonts/feather.css">
  <link rel="stylesheet" href="assets/fonts/fontawesome.css">
  <link rel="stylesheet" href="assets/fonts/material.css">

  <!-- vendor css -->
  <link rel="stylesheet" href="assets/css/style.css" id="main-style-link">
  <style>
    .form-control:focus {
      box-shadow: none;
      border-color: #BA68C8
    }

    .profile-button {
      background: #00BFFF;
      box-shadow: none;
      border: none
    }

    .profile-button:hover {
      background: #039ed7;
    }

    .profile-button:focus {
      background: #00BFFF;
      box-shadow: none
    }

    .profile-button:active {
      background: #2576ce;
      box-shadow: none
    }

    .back:hover {
      color: #00BFFF;
      cursor: pointer
    }

    .labels {
      font-size: 11px
    }

    .add-experience:hover {
      background: #5dcbf6;
      color: #fff;
      cursor: pointer;
      border: solid 1px #5dcbf6
    }
    .avatar-wrapper {
      position: relative;
      height: 200px;
      width: 200px;
      margin: 50px auto;
      border-radius: 50%;
      overflow: hidden;
      box-shadow: 1px 1px 15px -5px black;
      transition: all .3s ease;
    }
    .avatar-wrapper :hover{
      transform: scale(1.05);
      cursor: pointer;
    }
    .avatar-wrapper :hover .profile-pic{
      opacity: .5;
    }
    .profile-pic {
      height: 100%;
      width: 100%;
      transition: all .3s ease;
    }
    .profile-pic:after{
      font-family: FontAwesome;
      content: "\f007";
      top: 0; left: 0;
      width: 100%;
      height: 100%;
      position: absolute;
      font-size: 190px;
      background: #ecf0f1;
      color: #34495e;
      text-align: center;
    }
    .input-file {
      color: transparent;
      margin-left: 230px;
      margin-bottom: 50px;

    }
    .input-file::before {
      background: #00BFFF;
      border-radius: 50px;
      border: none;
      color: #fff;
      font-weight: 700;
      transition: all 0.3s;
    }
  </style>
</head>

<body>
<!-- [ Pre-loader ] start -->
<div class="loader-bg">
  <div class="loader-track">
    <div class="loader-fill"></div>
  </div>
</div>
<!-- [ Pre-loader ] End -->
<!-- [ Mobile header ] start -->
<div class="pc-mob-header pc-header">
  <div class="pcm-logo">
    <img src="assets/images/logo.png" alt="" class="logo logo-lg">
  </div>
  <div class="pcm-toolbar">
    <a href="#!" class="pc-head-link" id="mobile-collapse">
      <div class="hamburger hamburger--arrowturn">
        <div class="hamburger-box">
          <div class="hamburger-inner"></div>
        </div>
      </div>
    </a>
    <a href="#!" class="pc-head-link" id="headerdrp-collapse">
      <i data-feather="align-right"></i>
    </a>
    <a href="#!" class="pc-head-link" id="header-collapse">
      <i data-feather="more-vertical"></i>
    </a>
  </div>
</div>
<!-- [ Mobile header ] End -->

<!-- [ navigation menu ] start -->
<nav class="pc-sidebar ">
  <div class="navbar-wrapper">
    <div class="m-header">
      <a href="index.jsp" class="b-brand">
        <!-- ========   change your logo hear   ============ -->
        <img src="assets/images/logo.png" alt="" class="logo logo-lg">
        <img src="assets/images/logo-sm.svg" alt="" class="logo logo-sm">
      </a>
    </div>
    <div class="navbar-content">
      <ul class="pc-navbar">
        <li class="pc-item pc-caption">
          <label>Quản lý</label>
        </li>
        <li class="pc-item">
          <a href="index.jsp" class="pc-link "><span class="pc-micon"><i class="material-icons-two-tone">home</i></span><span class="pc-mtext">Quản lý chung</span></a>
        </li>
        <li class="pc-item pc-caption">
          <label>Quản lý sản phẩm</label>
          <!-- <span>UI Components</span> -->
        </li>
        <li class="pc-item pc-hasmenu">
          <a href="#!" class="pc-link "><span class="pc-micon"><i data-feather="github">business_center</i></span><span class="pc-mtext">Thú cưng</span><span class="pc-arrow"><i data-feather="chevron-right"></i></span></a>
          <ul class="pc-submenu">
            <li class="pc-item"><a class="pc-link" href="list-products">Danh sách thú cưng</a></li>
            <li class="pc-item"><a class="pc-link" href="">Thêm thú cưng</a></li>
          </ul>
        </li>
        <li class="pc-item pc-hasmenu">
          <a href="#!" class="pc-link "><span class="pc-micon"><i class="material-icons-two-tone">business_center</i></span><span class="pc-mtext">Phụ kiện</span><span class="pc-arrow"><i data-feather="chevron-right"></i></span></a>
          <ul class="pc-submenu">
            <li class="pc-item"><a class="pc-link" href="list-accessory">Danh sách phụ kiện</a></li>
            <li class="pc-item"><a class="pc-link" href="edit-accessory.jsp">Thêm phụ kiện</a></li>
          </ul>
        </li>
        <li class="pc-item">
          <a href="import.jsp" class="pc-link "><span class="pc-micon"><i
                  class="material-icons-two-tone">home</i></span><span class="pc-mtext">Nhập sản phẩm</span></a>
        </li>
        <li class="pc-item">
          <a href="products-status.jsp" class="pc-link "><span class="pc-micon"><i class="material-icons-two-tone">history_edu</i></span><span class="pc-mtext">Tình trạng đơn hàng</span></a>
        </li>
        <li class="pc-item pc-caption">
          <label>Quản lý tin tức</label>
        </li>
        <li class="pc-item pc-hasmenu">
          <a href="#!" class="pc-link "><span class="pc-micon"><i class="material-icons-two-tone" data-feather="file-minus"></i></span><span class="pc-mtext">Tin tức</span><span class="pc-arrow"><i data-feather="chevron-right"></i></span></a>
          <ul class="pc-submenu">
            <li class="pc-item"><a class="pc-link" href="list-blog.jsp">Danh sách tin tức</a></li>
            <li class="pc-item"><a class="pc-link" href="add-blog.jsp">Thêm tin tức</a></li>
          </ul>
        </li>
        <li class="pc-item pc-caption">
          <label>Quản lý danh mục</label>
        </li>
        <li class="pc-item">
          <a href="list-category.jsp" class="pc-link "><span class="pc-micon"><i
                  class="material-icons-two-tone">history_edu</i></span><span class="pc-mtext">Danh sách danh mục</span></a>
        </li>
        <li class="pc-item pc-hasmenu">
          <a href="#!" class="pc-link "><span class="pc-micon"><i class="material-icons-two-tone"
                                                                  data-feather="file-minus"></i></span><span
                  class="pc-mtext">Thêm danh mục</span><span class="pc-arrow"><i
                  data-feather="chevron-right"></i></span></a>
          <ul class="pc-submenu">
            <li class="pc-item"><a class="pc-link" href="add-category-product.jsp">Danh mục sản phẩm</a></li>
            <li class="pc-item"><a class="pc-link" href="add-category-blog.jsp">Danh mục tin tức</a></li>
          </ul>
        </li>
        <li class="pc-item pc-caption">
          <label>Tài khoản</label>
        </li>
        <li class="pc-item pc-hasmenu">
          <a href="#!" class="pc-link "><span class="pc-micon"><i class="material-icons-two-tone" data-feather="cpu"></i></span><span class="pc-mtext">Admin</span><span class="pc-arrow"><i data-feather="chevron-right"></i></span></a>
          <ul class="pc-submenu">
            <li class="pc-item"><a class="pc-link" href="list-admin.jsp">Danh sách admin</a></li>
            <li class="pc-item"><a class="pc-link" href="add-admin.jsp">Thêm admin</a></li>
          </ul>
        </li>
        <li class="pc-item pc-hasmenu">
          <a href="#!" class="pc-link "><span class="pc-micon"><i class="material-icons-two-tone" data-feather="user"></i></span><span class="pc-mtext">Người dùng</span><span class="pc-arrow"><i data-feather="chevron-right"></i></span></a>
          <ul class="pc-submenu">
            <li class="pc-item"><a class="pc-link" href="list-user.jsp">Danh sách người dùng</a></li>
            <li class="pc-item"><a class="pc-link" href="add-user.jsp">Thêm người dùng</a></li>
          </ul>
        </li>
        <li class="pc-item pc-caption">
          <label>Quản lý bình luận</label>
        </li>
        <li class="pc-item">
          <a href="list-comment.jsp" class="pc-link "><span class="pc-micon"><i data-feather="message-circle">history_edu</i></span><span class="pc-mtext">Bình luận</span></a>
        </li>
        <li class="pc-item pc-caption">
          <label>Quản lý liên hệ</label>
        </li>
        <li class="pc-item">
          <a href="list-contact.jsp" class="pc-link "><span class="pc-micon"><i data-feather="message-circle">history_edu</i></span><span class="pc-mtext">Liên hệ</span></a>
        </li>
      </ul>
    </div>
  </div>
</nav>
<!-- [ navigation menu ] end -->
<!-- [ Header ] start -->
<jsp:include page="layout-admin/header-admin.jsp"></jsp:include>
<% UserAccount user = (UserAccount) session.getAttribute("admin"); %>
<div class="pc-container">
  <div class="pcoded-content">
    <!-- [ breadcrumb ] start -->
    <div class="page-header">
      <div class="page-block">
        <div class="row align-items-center">
          <div class="col-md-6">

            <ul class="breadcrumb">
              <li class="breadcrumb-item"><a href="index.jsp">Quản lý</a></li>
              <li class="breadcrumb-item">Tài khoản</li>
              <li class="breadcrumb-item">Admin</li>
              <li class="breadcrumb-item">Thông tin tài khoản</li>
            </ul>
          </div>
        </div>
      </div>
    </div>
<div class="container rounded bg-white mt-5 mb-5">
  <form method="post" enctype="multipart/form-data" class="infor_user">
    <div class="row">
      <div class="col-md-3 border-right">
        <div class="d-flex flex-column align-items-center text-center p-3 py-5">
          <% int i = 0;
            if (user.getAvt() != null) {
          %>
          <div class="image-container">
            <div id="container<%=i%>">
              <div class="avatar-wrapper">
                <img class="img-avt-review profile-pic" src="http://localhost:8080/Petshop_website_final_war/<%=user.getAvt()%>" />
              </div>
            </div>
          </div>
          <div class="image-container">
            <div id="container<%=i%>">
              <input type="file" id="image<%=i%>" name="files" class="input-file" accept="image/*"/>
            </div>
          </div>
          <%} else {%>
          <div class="image-container">
            <div id="container<%=i%>">
              <div class="avatar-wrapper">
                <img class="img-avt-review profile-pic" src="http://localhost:8080/Petshop_website_final_war/admin/assets/images/user/avatar-2.png" />
              </div>
            </div>
          </div>
          <div class="image-container">
            <div id="container<%=i%>">
              <input type="file" id="image<%=i%>" name="files" class="input-file" accept="image/*"/>
            </div>
          </div>
          <%}%>
          <input type="text" id="deletedFile" value="" style="display: none">
          <span class="font-weight-bold"><%=user.getName()%></span>
          <span class="text-black-50"><%=user.getEmail()%></span><span> </span>
        </div>
      </div>
      <div class="col-md-5 border-right">
        <div class="p-3 py-5">
          <div class="d-flex justify-content-between align-items-center mb-3">
            <h4 class="text-right">Thông tin tài khoản</h4>
            <% String sussesupdate = (String) request.getAttribute("updateInforSusses"); %>
            <p style="color: #11ff02; text-align: center; text-transform: none !important;padding-top: 5px; text-align: center"><%= sussesupdate == null ? "" : sussesupdate%>
            </p>
          </div>
          <div class="row mt-2">
            <div class="col-md-6"><label class="labels">Username</label><input type="text" id="username"
                                                                               class="form-control"
                                                                               name="username"
                                                                               placeholder="Nhập username"
                                                                               value="<%=user.getUsername()%>"
                                                                               readonly>
            </div>
            <div class="col-md-6"><label class="labels">Họ và tên</label><input type="text" id="fullname"
                                                                                class="form-control"
                                                                                name="fullname"
                                                                                value="<%=user.getName()%>"
                                                                                placeholder="Nhập họ tên">
            </div>
          </div>
          <div class="row mt-3">
            <div class="col-md-12"><label class="labels">Email</label><input type="email" id="email"
                                                                             class="form-control"
                                                                             name="email"
                                                                             placeholder="Nhập email tại đây"
                                                                             value="<%=user.getEmail()%>"
                                                                             readonly>
            </div>
            <div class="col-md-12"><label class="labels" style="padding-top: 10px">Số điện
              thoại</label><input id="phone"
                                  type="text" class="form-control" name="phone" placeholder="Nhập số điện thoại tại đây"
                                  value="<%=user.getPhone()%>"></div>
            <div class="col-md-12"><label class="labels" style="padding-top: 10px">Địa chỉ</label><input id="address"
                                                                                                         type="text" class="form-control" name="address" placeholder="Nhập địa chỉ"
                                                                                                         value="<%=user.getAddress()%>">
            </div>
          </div>
        </div>
      </div>
      <div class="col-md-4">
        <div class="p-3 py-5">
          <div class="d-flex justify-content-between align-items-center experience"><span>Đổi mật khẩu</span>
          </div>
          <br>
          <div class="col-md-12"><label class="labels">Nhập mật khẩu mới</label><input type="password" id="newpass"
                                                                                       class="form-control"
                                                                                       name="newpass"
                                                                                       placeholder="Nhập mật khẩu"
                                                                                       value="<%=user.getPass()%>"></div>
          <br>
          <div class="col-md-12"><label class="labels">Nhập lại mật khẩu</label><input type="password" id="newpassconfirm"
                                                                                       class="form-control"
                                                                                       name="newpassconfirm"
                                                                                       placeholder="Nhập lại mật khẩu"
                                                                                       value="<%=user.getPass()%>"></div>
          <% String errorpass = (String) request.getAttribute("passError"); %>
          <p style="color: red; text-align: center; text-transform: none !important;padding-top: 5px; text-align: center"><%= errorpass == null ? "" : errorpass%>
          </p>
          <div class="mt-5 text-center">
            <button class="btn btn-primary profile-button" type="submit">Lưu thông tin</button>
          </div>
        </div>

      </div>
    </div>
  </form>
</div>
</div>
</div>
</div>
</div>
<script src="assets/js/vendor-all.min.js"></script>
<script src="assets/js/plugins/bootstrap.min.js"></script>
<script src="assets/js/plugins/feather.min.js"></script>
<script src="assets/js/pcoded.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/highlight.js/9.12.0/highlight.min.js"></script>
<script src="assets/js/plugins/clipboard.min.js"></script>
<script src="assets/js/uikit.min.js"></script>

<!-- Apex Chart -->
<script src="assets/js/plugins/apexcharts.min.js"></script>
<!-- custom-chart js -->
<script src="assets/js/pages/dashboard-sale.js"></script>
<script>
  function reloadUpLoadFile() {
    $(".input-file").each(function () {
      $(this).on('change', function (e) {
        const idName = $(this).attr("id");
        const id = idName.substring(5);
        const value = $(this).val();
        let name = "";
        if (value.indexOf("\\") != -1)
          name = value.substring(value.lastIndexOf("\\") + 1);
        else
          name = value.substring(value.lastIndexOf("/") + 1);
        uploadFile(id, name, e)
      })
    });
  }
  $(".input-file").each(function () {
    $(this).on('change', function (e) {
      const idName = $(this).attr("id");
      const id = idName.substring(5);
      const value = $(this).val();
      let name = "";
      if (value.indexOf("\\") != -1)
        name = value.substring(value.lastIndexOf("\\") + 1);
      else
        name = value.substring(value.lastIndexOf("/") + 1);
      console.log(id +", " + name + ", ")
      uploadFile(id, name, e)
    })
  });
  function uploadFile(id, name, event) {
    event.stopPropagation();
    event.preventDefault();
    const files = event.target.files;
    const data = new FormData();
    $.each(files, function (key, value) {
      data.append(key, value);
    });
    postFilesData(id, name, data);
  }
  function postFilesData(id, name, data) {
    let bool = false;
    $(".img-avt-review").each(function () {
      let nameFile = $(this).attr("src");
      if (nameFile.indexOf(name) != -1) {
        bool = true;
      }
    })
    if (bool === false) {
      $.ajax({
        url: '/Petshop_website_final_war/UpDownImageAvatarUserController',
        type: 'POST',
        data: data,
        cache: false,
        dataType: 'json',
        processData: false,
        contentType: false,
        success: function (data, textStatus, jqXHR) {
          //success
        },
        error: function (jqXHR, textStatus, errorThrown) {
          $("#container" + id).empty()
          $("#container" + id).prepend(`<div class="avatar-wrapper">
                                <img class="img-avt-review profile-pic" src="http://localhost:8080/Petshop_website_final_war/img/user/` + name + `" />
                            </div>`)
          let value = $("#deletedFile").val();
          if (value.indexOf(name) !== -1) {
            value = value.replace(name + ",", "");
            $("#deletedFile").val(value);
          }
          console.log($("#deletedFile").val());
          reloadUpLoadFile();
        }
      });
    } else {
    }
  }
</script>
<script>
  $("button[type='submit']").click(function (e) {
    e.preventDefault();

    const username = $("#username").val();
    const fullname = $("#fullname").val();
    const phone = $("#phone").val();
    const address = $("#address").val();
    const newpass = $("#newpass").val();
    const newpassconfirm = $("#newpassconfirm").val();
    const imageLink = $(".img-avt-review").attr("src").substring(57);
    console.log(imageLink);
    let imgFile = []
    $(".img-avt-review").each(function () {
      let nameFile = $(this).attr("src");
      if (nameFile.indexOf("\\") != -1)
        imgFile.push(nameFile.substring(nameFile.lastIndexOf("\\") + 1));
      else
        imgFile.push(nameFile.substring(nameFile.lastIndexOf("/") + 1));
    })
    const removed = $("#deletedFile").val();
    const oldImg = removed.substring(0, removed.length - 1);
    $.ajax({
      url: "/Petshop_website_final_war/admin/UpdateInforAdminController",
      type: "GET",
      data: {
        oldImg: oldImg,
        username: username,
        fullname: fullname,
        phone : phone,
        avt : imageLink,
        address : address,
        newpass : newpass,
        newpassconfirm : newpassconfirm,
        imgFile: imgFile,
      },
      success: function () {
        alert("Cập nhật thông tin thành công");
        window.location.href = "infor-admin.jsp"
      }
    })
  })
</script>
</body>
</html>
