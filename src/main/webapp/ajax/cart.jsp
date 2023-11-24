<%@ page import="vn.edu.hcmuaf.fit.beans.UserAccount" %>
<%@ page import="java.text.NumberFormat" %>
<%@ page import="java.util.Locale" %>
<%@ page import="vn.edu.hcmuaf.fit.beans.Cart" %>
<%--
  Created by IntelliJ IDEA.
  User: Nguyen Ngoc Huy
  Date: 12/15/2022
  Time: 3:52 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="utf-8" %>
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
                        <th>Số lượng</th>
                        <th>Tổng tiền</th>
                        <th></th>
                    </tr>
                    </thead>
                    <tbody>
                    <% Cart cart = (Cart) request.getSession().getAttribute("cart");
                        int i = 1;
                        NumberFormat format = NumberFormat.getInstance(new Locale("vn", "VN"));%>
                    <% if (cart != null) {
                        for (String id : cart.getData().keySet()) {%>
                    <tr>
                        <td class="shoping__cart__item">
                            <img src="<%=cart.getData().get(id).getImage()%>" alt=""style="width: 85px; height: 85px; object-fit: cover;">
                            <a href="product-details.jsp?id=<%=cart.getData().get(id).getProductId()%>"><h5><%=cart.getData().get(id).getProductName()%>
                            </h5></a>
                        </td>
                        <%if (cart.getData().get(id).getPromotional() ==1) {%>
                        <td class="shoping__cart__price">
                            <%=format.format(cart.getData().get(id).getPrice() -( cart.getData().get(id).getPrice() *cart.getData().get(id).getPromotionalPrice()/100))%>
                            ₫ - (-<%=cart.getData().get(id).getPromotionalPrice()%>%)
                        </td>
                        <%} else {%>
                        <td class="shoping__cart__price">
                            <%=format.format(cart.getData().get(id).getPrice())%>₫
                        </td>
                        <%}%>
                        <td class="shoping__cart__quantity">
                            <div class="quantity">
                                <div class="pro-qty" id="quatity-<%=cart.getData().get(id).getProductId()%>">
                                    <span onclick="tru(<%=i%>)"
                                          class="dec qtybtn control<%=cart.getData().get(id).getProductId()%>">-</span>
                                    <input type="text" class="value-input"
                                           value="<%=cart.getData().get(id).getQuantityCart()%>"
                                           id="quatity-text-<%=i%>">
                                    <span onclick="cong(<%=i%>)"
                                          class="inc qtybtn control<%=cart.getData().get(id).getProductId()%>">+</span>
                                </div>
                            </div>
                        </td>
                        <%if (cart.getData().get(id).getPromotional() ==1) {%>
                        <td class="shoping__cart__total" id="thanh_tien">
                            <%=format.format(cart.getData().get(id).getQuantityCart() * (cart.getData().get(id).getPrice() -(cart.getData().get(id).getPrice() *cart.getData().get(id).getPromotionalPrice()/100)))%>
                            ₫
                        </td>
                        <%} else {%>
                        <td class="shoping__cart__total" id="thanh_tien">
                            <%=format.format(cart.getData().get(id).getQuantityCart() * cart.getData().get(id).getPrice())%>
                            ₫
                        </td>
                        <%}%>
                        <td class="shoping__cart__item__close">
                            <a href="" id="delete<%=cart.getData().get(id).getProductId()%>"> <i class="icon_close"></i></a>
                        </td>
                    </tr>
                    <%
                                i++;
                            }
                        }
                    %>
                    </tbody>
                </table>
            </div>
        </div>
    </div>
    <div class="row">
        <div class="col-lg-12">
            <div class="shoping__cart__btns">
                <a href="all-product?category=all" class="primary-btn cart-btn">TIẾP TỤC MUA SẮM</a>
            </div>
        </div>
        <div class="col-lg-6">
            <div class="shoping__continue">
                <div class="shoping__discount">
                    <h5>Mã giảm giá</h5>
                    <form action="#">
                        <input type="text" placeholder="Nhập mã giảm giá">
                        <button type="submit" class="site-btn">Áp dụng</button>
                    </form>
                </div>
            </div>
        </div>
        <div class="col-lg-6">
            <div class="shoping__checkout">
                <h5>Tổng tiền giỏ hàng</h5>
                    <ul>
                        <li>Tổng tiền <span class="total__price"><%=cart != null ? format.format(cart.total()) : 0%>₫</span></li>
                    </ul>
                <a href="checkout.jsp" class="primary-btn">CHUYỂN ĐẾN PHẦN THANH TOÁN</a>
            </div>
        </div>
    </div>
</div>


