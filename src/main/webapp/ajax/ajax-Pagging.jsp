<%@ page import="vn.edu.hcmuaf.fit.beans.UserAccount" %>
<%@ page import="vn.edu.hcmuaf.fit.beans.Product" %>
<%@ page import="vn.edu.hcmuaf.fit.dao.ProductDAO" %>
<%@ page import="java.util.List" %>
<%@ page import="java.text.NumberFormat" %>
<%@ page import="java.util.Locale" %>
<%@ page import="vn.edu.hcmuaf.fit.beans.Wishlist" %>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%UserAccount user = (UserAccount) request.getSession().getAttribute("user");%>
<% List<Product> list = (List<Product>) request.getAttribute("listPagging");
  for (Product p : list) { %>
<% NumberFormat format = NumberFormat.getInstance(new Locale("vn", "VN"));%>
<%Wishlist wishlist = (Wishlist) request.getSession().getAttribute("wishlist");%>
<%if(p.getPromotional()==1){%>
<div class="col-lg-4 col-md-6 col-sm-6 amount-pd">
  <div class="product__item">
    <div class="product__item__pic set-bg product__discount__item__pic" data-setbg="<%=p.getImage()%>" style="background-image: url(<%=p.getImage()%>);">
      <div class="product__discount__percent"><%=p.getPromotionalPrice()%>%</div>
      <ul class="product__item__pic__hover">
        <%if (user != null) {
          Product product = new ProductDAO().getProductDetail(p.getProductId());%>
        <%if (Integer.parseInt(product.getQuantity())> 0) {%>
        <li><a class="add-wishlist" id="addWishlist-<%=p.getProductId()%>"><i class="fa fa-heart"></i></a></li>
        <li><a class="shopnow2" id="addCart-<%=p.getProductId()%>" ><i
                class="fa fa-shopping-cart"></i></a></li>
        <%}%>
        <%
        } else {%>
        <li><a class="add-wishlist" href="login.jsp"><i class="fa fa-heart"></i></a></li>
        <li><a class="shopnow2" href="login.jsp"><i
                class="fa fa-shopping-cart"></i></a></li>
        <%  }
        %>
      </ul>
    </div>
    <div class="product__item__text product__discount__item__text">
      <h6><a href="product-details.jsp?id=<%=p.getProductId()%>"><%= p.getProductName()%>
      </a></h6>
      <div class="product__item__price"><%=format.format(p.getPrice()-( p.getPrice() *p.getPromotionalPrice()/100))%>đ<span><%=p.getPrice()%>đ</span></div>
    </div>
  </div>
</div>
<%}else {%>
<div class="col-lg-4 col-md-6 col-sm-6 amount-pd">
  <div class="product__item">
    <div class="product__item__pic set-bg" data-setbg="<%=p.getImage()%>" style="background-image: url(<%=p.getImage()%>);">
      <ul class="product__item__pic__hover">
        <%if (user != null) {
          Product product = new ProductDAO().getProductDetail(p.getProductId());%>
        <%if (Integer.parseInt(product.getQuantity())> 0) {%>
        <li><a class="add-wishlist" id="addWishlist-<%=p.getProductId()%>"><i class="fa fa-heart"></i></a></li>
        <li><a class="shopnow2" id="addCart-<%=p.getProductId()%>" ><i
                class="fa fa-shopping-cart"></i></a></li>
        <%}%>
        <%
        } else {%>
        <li><a class="add-wishlist" href="login.jsp"><i class="fa fa-heart"></i></a></li>
        <li><a class="shopnow2" href="login.jsp"><i
                class="fa fa-shopping-cart"></i></a></li>
        <%  }
        %>
      </ul>
    </div>
    <div class="product__item__text product__discount__item__text">
      <h6><a href="product-details.jsp?id=<%=p.getProductId()%>"><%= p.getProductName()%>
      </a></h6>
      <div class="product__item__price"><%=format.format(p.getPrice())%>đ</div>
    </div>
  </div>
</div>
<%}%>
<% }
%>
<input type="text" id="numb" value="<%=request.getAttribute("numb")%>" style="display: none">
