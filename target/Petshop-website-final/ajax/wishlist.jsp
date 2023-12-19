<%@ page import="vn.edu.hcmuaf.fit.beans.UserAccount" %>
<%@ page import="vn.edu.hcmuaf.fit.beans.Wishlist" %>
<%@ page import="java.text.NumberFormat" %>
<%@ page import="java.util.Locale" %><%--
  Created by IntelliJ IDEA.
  User: Nguyen Si Hoang
  Date: 01/01/2023
  Time: 11:20 CH
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%UserAccount user = (UserAccount) request.getSession().getAttribute("user");%>
<%NumberFormat formatter = NumberFormat.getInstance(new Locale("vn", "VN"));%>
<div class="container">
    <div class="row">
        <div class="col-lg-12">
            <div class="shoping__cart__table">
                <table>
                    <thead>
                    <tr>
                        <th class="shoping__product">Sản phẩm</th>
                        <th>Giá</th>
                        <th style="padding-left: 120px">Thích</th>
                        <th style="padding-left: 100px">Bỏ thích</th>
                    </tr>
                    </thead>
                    <tbody>
                    <% Wishlist wishlist = (Wishlist) request.getSession().getAttribute("wishlist");
                        NumberFormat format = NumberFormat.getInstance(new Locale("vn", "VN"));%>
                    <% if (wishlist != null) {
                        for (String id : wishlist.getData().keySet()) {%>
                    <tr>
                        <td class="shoping__cart__item">
                            <img src="<%=wishlist.getData().get(id).getImage()%>" alt="" style="width: 85px; height: 85px; object-fit: cover;">
                            <a href="product-details.jsp?id=<%=wishlist.getData().get(id).getProductId()%>"><h5><%=wishlist.getData().get(id).getProductName()%></h5></a>
                        </td>
                        <td class="shoping__cart__price" style="padding-left: 10px">
                            <%=format.format(wishlist.getData().get(id).getPrice())%>₫
                        </td>
                        <td class="shoping__cart__total" style="padding-left: 130px">
                            <i class="fa fa-heart">
                            </i></td>
                        <td class="shoping__cart__item__close">
                            <a href="" class="dlt" id="delete<%=wishlist.getData().get(id).getProductId()%>" style="color: black; padding-right: 50px"> <i class="icon_close"></i></a>
                        </td>
                    </tr>
                    <%
                            }
                        }
                    %>
                    </tbody>
                </table>
            </div>
        </div>
    </div>
</div>
