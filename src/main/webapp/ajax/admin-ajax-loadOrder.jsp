<%@ page import="java.text.NumberFormat" %>
<%@ page import="java.util.Locale" %>
<%@ page import="vn.edu.hcmuaf.fit.beans.Orders" %>
<%@ page import="vn.edu.hcmuaf.fit.services.OrderService" %>
<%@ page import="java.util.List" %>
<%@ page import="vn.edu.hcmuaf.fit.services.UserService" %><%--
  Created by IntelliJ IDEA.
  User: ADMIN
  Date: 12/18/2023
  Time: 11:08 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<% NumberFormat format = NumberFormat.getInstance(new Locale("vn", "VN"));%>
<%
    List<Orders> listod = OrderService.getInstance().ordersList();
    for (Orders od : listod) {
%>
<form action="" method="post">
    <tr>
        <td scope="row"><%=od.getOrderID()%>
        </td>
        <td><%=UserService.getInstance().getUserDetail(od.getCustomerID()).getName()%>
        </td>
        <td><%=format.format(od.getPrice())%>
        </td>
        <td><%=od.getOrderDate()%>
        </td>
        <td>
            <%if (od.getStatus() == 0) {%>
            <div style="color: red; font-weight: bold">Đã hủy</div>
            <%} else {%>
            <%if (od.getDelivered() == 0) {%>
            <div style="color: #00BFFF; font-weight: bold">Đang xử lý</div>
            <%} else {%>
            <div style="color: #35ff00; font-weight: bold">Hoàn thành</div>
            <%}%>
            <%}%>

        </td>
        <%if (od.getDeliveryDate() == null) {%>
        <td>Chưa giao</td>
        <%} else {%>
        <td><%=od.getDeliveryDate()%>
        </td>
        <%}%>

        <td>
            <%if (od.getVerify() == 0) {%>
            <div style="color: #00BFFF; font-weight: bold">Chưa xác thực</div>
            <%} else if (od.getVerify() == 1) {%>
            <div style="color: #35ff00; font-weight: bold">Đã xác thực</div>
            <%} else {%>
            <div style="color: red; font-weight: bold">Lỗi đơn</div>
            <%}%>
        </td>
        <td>
            <a class="btn_2 edit btn btn-primary" type="submit"
               href="order-detail-ad.jsp?orderId=<%=od.getOrderID()%>">Chi tiết</a>
        </td>
        <td>
            <%if (od.getVerify() == 0) {%>
            <a style="background-color:#35ff00;" class="btn_2 edit btn btn-primary verify"
               type="submit"
            <%--                                               href="/Petshop_website_final_war/VerifyOrderController?orderId=<%=od.getOrderID()%>"--%>
               id="orderId=<%=od.getOrderID()%>">
                Xác thực</a>
            <%} else if (od.getVerify() == 1) {%>
            <%--                                                        <a style="background-color:#35ff00;" class="btn_2 edit btn btn-primary" type="submit" href="order-detail-ad.jsp?orderId=<%=od.getOrderID()%>">--%>
            <%--                                                            Đã xác thực</a>--%>
            <%} else {%>
            <a style="background-color:red;" class="btn_2 edit btn btn-primary cancel-order"
               type="submit"
            <%--                                               href="/Petshop_website_final_war/CancelOrderController?orderId=<%=od.getOrderID()%>"--%>
               id="orderId=<%=od.getOrderID()%>">
                Hủy đơn</a>
            <%}%>
        </td>


    </tr>
</form>
<%}%>
