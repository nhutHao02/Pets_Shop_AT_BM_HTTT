<%@ page import="java.util.List" %>
<%@ page import="vn.edu.hcmuaf.fit.beans.Product" %>
<%@ page import="java.text.NumberFormat" %>
<%@ page import="java.util.Locale" %><%--
  Created by IntelliJ IDEA.
  User: ADMIN
  Date: 14/12/2022
  Time: 5:13 CH
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%List<Product> list = (List<Product>) request.getAttribute("list");%>
<% NumberFormat format = NumberFormat.getInstance(new Locale("vn", "VN"));%>

<% if (list!= null) {
  for (Product p : list) {%>
<li class="search" style=" border-bottom: 1px solid #b9b9b9;margin-bottom: 10px;">
  <a href="product-details.jsp?id=<%=p.getProductId()%>" style="display: inline-flex;">
    <div class="product-img" style="margin-left: 5px;width: 60px;height: 60px;margin: 5px;">
      <img href="" src="<%=p.getImage()%>">
    </div>
    <div class="item-infor" style="margin-left: 5px;display: inline-flex;justify-content: center;align-items: center;">
      <h6 style="width: 350px;text-align: left;padding-left: 10px"><%=p.getProductName()%></h6>
      <strong class="price" style="width: 90px;text-align: center;font-size: medium; color: #0a53be"><%=format.format(p.getPrice())%>đ</strong>
    </div>
  </a>
</li>
  <%}
}%>
