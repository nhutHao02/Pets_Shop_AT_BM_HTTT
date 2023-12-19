<%@ page import="vn.edu.hcmuaf.fit.beans.Blogs" %>
<%@ page import="vn.edu.hcmuaf.fit.dao.BlogDAO" %>
<%@ page import="java.util.List" %><%--
  Created by IntelliJ IDEA.
  User: admin
  Date: 6/15/2023
  Time: 2:35 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<% List<Blogs> list = (List<Blogs>) request.getAttribute("getNext6Blogs"); %>
                        <%
                            for (Blogs b : list) {
                        %>
                        <div class="col-lg-6 col-md-6 col-sm-6">
                            <div class="blog__item">
                                <div class="blog__item__pic">
                                    <img src="<%=b.getImage()%>" alt="" style="width: 290px;height: 225px;object-fit: cover;">
                                </div>
                                <div class="blog__item__text">
                                    <ul>
                                        <li><i class="fa fa-calendar-o"></i> <%=b.getCreateDate()%></li>
                                    </ul>
                                    <h5><a href="blog-details.jsp?id=<%=b.getBlogId()%>"><%=b.getBlogName()%></a></h5>
                                    <p><%=b.getDescription()%></p>
                                    <a href="blog-details.jsp?id=<%=b.getBlogId()%>" class="blog__btn"  >ĐỌC THÊM <span class="arrow_right"></span></a>
                                </div>
                            </div>
                        </div>
                       <% } %>
            <input type="text" id="totalProInBlog" value="<%=request.getAttribute("totalProInBlog")%>" style="display: none">