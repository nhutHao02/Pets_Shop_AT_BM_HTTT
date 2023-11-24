<%@ page import="vn.edu.hcmuaf.fit.beans.Comment" %>
<%@ page import="vn.edu.hcmuaf.fit.beans.UserAccount" %>
<%@ page import="vn.edu.hcmuaf.fit.services.UserService" %><%--
  Created by IntelliJ IDEA.
  User: ADMIN
  Date: 02/01/2023
  Time: 9:26 CH
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%Comment cmt = (Comment) request.getAttribute("cmt");%>
<div id="cmt-section<%=cmt.getID()%>">
  <div class="container mt-5">
    <div class="row  d-flex justify-content-center">
      <div class="col-md-8">
        <div class="card p-3">

          <div class="d-flex justify-content-between align-items-center">

            <div class="user d-flex flex-row align-items-center">
              <img src="http://localhost:8080/Petshop_website_final_war/<%=UserService.getInstance().getUserDetail(cmt.getCustomerID()).getAvt()%>" width="35" height="35" class="user-img rounded-circle mr-2">

              <span><small class="font-weight-bold text-primary"><%=UserService.getInstance().getUserDetail(cmt.getCustomerID()).getName()%></small> <small class="font-weight-bold" style="padding-left: 10px; font-size: 14px"><%=cmt.getDescription()%></small></span>
            </div>
            <% UserAccount user1 = (UserAccount) request.getSession().getAttribute("user");
              if (user1 != null) {
                if (user1.getId().equals(cmt.getCustomerID())) {
            %>
            <a class="remove" id="remove<%=cmt.getID()%>"><small>Xóa bình luận</small></a>
            <% }
            } %>
          </div>
          <div class="action d-flex justify-content-between mt-2 align-items-center">
            <div class="reply px-4">
              <small><%=cmt.getCommentDate()%></small>
            </div>
            <div class="icons align-items-center">
              <i class="fa fa-star text-warning"></i>
              <i class="fa fa-check-circle-o check-icon"></i>
            </div>
          </div>
        </div>
      </div>
    </div>
  </div>
</div>