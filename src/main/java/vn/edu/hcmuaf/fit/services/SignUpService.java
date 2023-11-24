package vn.edu.hcmuaf.fit.services;

import vn.edu.hcmuaf.fit.beans.Mail;
import vn.edu.hcmuaf.fit.dao.CustomerUserDAO;
import vn.edu.hcmuaf.fit.dao.SignUpDAO;

public class SignUpService {
    private static SignUpService signUpService;
    public static SignUpService getInstance() {
        if (signUpService == null) {
            signUpService = new SignUpService();
        }
        return signUpService;
    }

    public String checkUser(String email, String username) {
        SignUpDAO DAO = new SignUpDAO();
        return DAO.checkUser(email, username);
    }

    public String checkUser(String username){
        return new CustomerUserDAO().checkUser(username);
    }


    public void insertUser(String userName, String passMaHoa, String pass, String fullName, String email, String phone){
        new SignUpDAO().insertUser(userName,passMaHoa,pass,fullName,email,phone);
    }


    public boolean checkEmail(String email) {
        return new SignUpDAO().checkMail(email);
    }

}
