<%@ page import="vn.edu.hcmuaf.fit.beans.UserAccount" %><%--
<%--
  Created by IntelliJ IDEA.
  User: ADMIN
  Date: 12/6/2022
  Time: 1:35 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<% UserAccount user = (UserAccount) request.getSession().getAttribute("admin"); %>
<%
    //----------------------Kiểm tra thử đăng nhập hay chưa--------------------//
    if (request.getSession().getAttribute("admin") == null) {
        // Sendredirect tới login
        response.sendRedirect("login.jsp");

    }
%>
<header class="pc-header ">
    <div class="header-wrapper">
        <div class="page-header-title">
            <h5 class="m-b-10" style="margin-top: 28px; font-weight: bolder;">QUẢN LÝ CỬA HÀNG THÚ CƯNG</h5>
        </div>
        <div class="ml-auto">
            <ul class="list-unstyled">
                <li class="dropdown pc-h-item">
                    <a class="pc-head-link dropdown-toggle arrow-none mr-0" data-toggle="dropdown" href="#" role="button" aria-haspopup="false" aria-expanded="false">
                        <i class="material-icons-two-tone">search</i>
                    </a>
                    <div class="dropdown-menu dropdown-menu-right pc-h-dropdown drp-search">
                        <form action="search" method="get" class="px-3">
                            <div class="form-group mb-0 d-flex align-items-center">
                                <i data-feather="search" type="submit"></i>
                                <input oninput="searchByName(this)" name="txt" type="search" class="form-control border-0 shadow-none" placeholder="Tìm kiếm. . .">
                            </div>
                        </form>
                    </div>
                </li>
                <li class="dropdown pc-h-item">
                    <a class="pc-head-link dropdown-toggle arrow-none mr-0" data-toggle="dropdown" href="#" role="button" aria-haspopup="false" aria-expanded="false">
                        <img src="http://localhost:8080/Petshop_website_final_war/<%=user.getAvt()%>" alt="user-image" class="user-avtar">
                        <span>
								<span class="user-name"><%=user.getName()%></span>
<%--								<span class="user-desc">Quản lý cấp 1</span>--%>
							</span>
                    </a>
                    <div class="dropdown-menu dropdown-menu-right pc-h-dropdown">
                        <div class=" dropdown-header">
                            <h5 class="text-overflow m-0"><span class="badge bg-light-primary"><a href="../index.jsp" target="_blank">Quay lại website</a></span></h5>
                        </div>
                        <a href="infor-admin.jsp" class="dropdown-item">
                            <i class="material-icons-two-tone">account_circle</i>
                            <span>Tài khoản của tôi</span>
                        </a>
                        <!-- <div class="pc-level-menu">
                            <a href="#!" class="dropdown-item">
                                <i class="material-icons-two-tone">list_alt</i>
                                <span class="float-right"><i class="mr-0"></i></span>
                                <span>Level2.1</span>
                            </a>
                            <div class="dropdown-menu pc-h-dropdown">
                                <a href="#!" class="dropdown-item">
                                    <i class="fas fa-circle"></i>
                                    <span>Tài khoản của tôi</span>
                                </a>
                                <a href="#!" class="dropdown-item">
                                    <i class="fas fa-circle"></i>
                                    <span>Settings</span>
                                </a>
                                <a href="#!" class="dropdown-item">
                                    <i class="fas fa-circle"></i>
                                    <span>Support</span>
                                </a>
                                <a href="#!" class="dropdown-item">
                                    <i class="fas fa-circle"></i>
                                    <span>Lock Screen</span>
                                </a>
                                <a href="#!" class="dropdown-item">
                                    <i class="fas fa-circle"></i>
                                    <span>Đăng xuất</span>
                                </a>
                            </div>
                        </div> -->
                        <!-- <a href="#!" class="dropdown-item">
                            <i class="material-icons-two-tone">settings</i>
                            <span>Settings</span>
                        </a> -->
                        <!-- <a href="#!" class="dropdown-item">
                            <i class="material-icons-two-tone">support</i>
                            <span>Support</span>
                        </a> -->
                        <!-- <a href="#!" class="dropdown-item">
                            <i class="material-icons-two-tone">https</i>
                            <span>Lock Screen</span>
                        </a> -->
                        <a href="AdminController" class="dropdown-item">
                            <i class="material-icons-two-tone">chrome_reader_mode</i>
                            <span>Đăng xuất</span>
                        </a>
                    </div>
                </li>
            </ul>
        </div>

    </div>
</header>
