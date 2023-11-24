package vn.edu.hcmuaf.fit.controller;

import com.google.gson.Gson;
import com.google.gson.JsonObject;
import com.restfb.DefaultFacebookClient;
import com.restfb.FacebookClient;
import com.restfb.Parameter;
import com.restfb.types.User;
import com.restfb.Version;
import org.apache.http.client.fluent.Request;
import vn.edu.hcmuaf.fit.beans.Cart;
import vn.edu.hcmuaf.fit.beans.ConstantsFacebook;
import vn.edu.hcmuaf.fit.beans.UserAccount;
import vn.edu.hcmuaf.fit.beans.Wishlist;
import vn.edu.hcmuaf.fit.dao.LogDAO;
import vn.edu.hcmuaf.fit.services.LoginService;
import vn.edu.hcmuaf.fit.services.SignUpService;
import vn.edu.hcmuaf.fit.services.UserService;
import vn.edu.hcmuaf.fit.services.Utils;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;

import static vn.edu.hcmuaf.fit.controller.LoginFacebookHandler.FacebookUtils.getToken;
import static vn.edu.hcmuaf.fit.controller.LoginFacebookHandler.FacebookUtils.getUserInfo;

@WebServlet(name = "LoginFacebookHandler", value = "/login-facebook")
public class LoginFacebookHandler extends HttpServlet {


    public class FacebookUtils {
        public static String getToken(final String code) throws IOException {
            String link = String.format(ConstantsFacebook.FACEBOOK_LINK_GET_TOKEN, ConstantsFacebook.FACEBOOK_APP_ID, ConstantsFacebook.FACEBOOK_APP_SECRET, ConstantsFacebook.FACEBOOK_REDIRECT_URL, code);
            String response = Request.Get(link).execute().returnContent().asString();
            JsonObject jobj = new Gson().fromJson(response, JsonObject.class);
            String getoken = jobj.get("access_token").toString().replaceAll("\"", "");

            return getoken;
        }

        public static User getUserInfo(String accessToken) {
            FacebookClient facebookClient = new DefaultFacebookClient(accessToken, ConstantsFacebook.FACEBOOK_APP_SECRET, Version.LATEST);
            User getuser = facebookClient.fetchObject("me", User.class, Parameter.withFields("email,name,id"));
            System.out.println(getuser);
            return getuser;
        }
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doPost(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String code = request.getParameter("code");
        if (code == null || code.isEmpty()) {
            response.sendRedirect("login.jsp");
        } else {
            String accessToken = getToken(code);
            User userFacebook = getUserInfo(accessToken);
            UserAccount user = LoginService.getInstance().getAccountCustomer(userFacebook.getId(), userFacebook.getId());
            if (user != null) {
                request.getSession().setAttribute("user", user);
                request.getSession().setAttribute("cart", new Cart());
                request.getSession().setAttribute("wishlist", new Wishlist());

                LogDAO logs = new LogDAO();
                UserAccount userAccount = (UserAccount) request.getSession().getAttribute("user");
                logs.createUserLog(userAccount.getId(), "INFOR", "Người dùng đã đăng nhập bằng Facebook");
            } else {
                SignUpService.getInstance().insertUser(userFacebook.getId(), Utils.maHoaMK(userFacebook.getId()), userFacebook.getId(), userFacebook.getName(), userFacebook.getEmail(), null);
                String id = UserService.getInstance().getIdUserByName(userFacebook.getName());
                UserService.getInstance().updateInforUser(id, userFacebook.getId(), null, null,userFacebook.getId(),null);
                user = UserService.getInstance().getUserLoginFace(userFacebook.getId());
                request.getSession().setAttribute("user", user);
                request.getSession().setAttribute("cart", new Cart());
                request.getSession().setAttribute("wishlist", new Wishlist());
            }
            response.sendRedirect("index.jsp");
            }
        }
    }

