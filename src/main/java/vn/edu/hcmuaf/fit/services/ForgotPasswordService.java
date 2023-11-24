package vn.edu.hcmuaf.fit.services;

import vn.edu.hcmuaf.fit.dao.CustomerUserDAO;

public class ForgotPasswordService {
    private static ForgotPasswordService forgotPassWordService;

    public static ForgotPasswordService getInstance() {
        if (forgotPassWordService == null) {
            forgotPassWordService = new ForgotPasswordService();
        }
        return forgotPassWordService;
    }
    public String checkEmailExits(String email) {
        CustomerUserDAO DAO = new CustomerUserDAO();
        return DAO.checkEmailExits(email);
    }
    public void updatePasswordFromEmail(String newPass, String email){
        new CustomerUserDAO().updatePasswordFromEmail(newPass,email);
    }
}
