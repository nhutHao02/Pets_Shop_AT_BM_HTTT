package vn.edu.hcmuaf.fit.controller;

import vn.edu.hcmuaf.fit.beans.Cart;
import vn.edu.hcmuaf.fit.beans.UserAccount;
import vn.edu.hcmuaf.fit.beans.Wishlist;
import vn.edu.hcmuaf.fit.dao.KeyDAO;
import vn.edu.hcmuaf.fit.services.LogService;
import vn.edu.hcmuaf.fit.services.LoginService;
import vn.edu.hcmuaf.fit.tool.DSA;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;

@WebServlet(name = "ImportKeyController", value = "/ImportKeyController")
public class ImportKeyController extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doPost(request, response);
    }
    // 2013025_Trần Nhựt Hào
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String publicKey = request.getParameter("publicKey");
        UserAccount user= (UserAccount) request.getSession().getAttribute("user");
        //kiểm tra key hợp lệ hay không
        boolean isKeyValid = new DSA().isImportKey(publicKey);
        if(isKeyValid){
        new KeyDAO().insertPublicKey(user.getId(),publicKey);
        }
        // Gửi phản hồi JSON về client
        response.setContentType("application/json");
        response.setCharacterEncoding("UTF-8");
        response.getWriter().write("{\"result\": \"" + (isKeyValid ? "success" : "failure") + "\"}");
    }
}
