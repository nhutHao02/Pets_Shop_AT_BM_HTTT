package vn.edu.hcmuaf.fit.controller;

import vn.edu.hcmuaf.fit.beans.UserAccount;
import vn.edu.hcmuaf.fit.dao.KeyDAO;
import vn.edu.hcmuaf.fit.tool.DSA;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.security.NoSuchAlgorithmException;

@WebServlet(name = "CreateKeyController", value = "/CreateKeyController")

public class CreateKeyController extends HttpServlet {
    //20130252_Trần Nhựt Hào
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        DSA dsa=new DSA();
        UserAccount user= (UserAccount) request.getSession().getAttribute("user");
        try {
            dsa.generatekey(dsa.generateDSAKeyPair());
            // lưu publicb key vào db
            String publicKey=dsa.exportPublicKey();
            new KeyDAO().insertPublicKey(user.getId(),publicKey);
            // Gửi key về trang JSP
            String privateKey=dsa.exportPrivateKey();
            response.getWriter().write(privateKey);
        } catch (NoSuchAlgorithmException e) {
            throw new RuntimeException(e);
        }



    }
}
