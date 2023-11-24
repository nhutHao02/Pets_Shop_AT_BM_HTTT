package vn.edu.hcmuaf.fit.services;

import vn.edu.hcmuaf.fit.beans.AdminRole;
import vn.edu.hcmuaf.fit.beans.UserAccount;
import vn.edu.hcmuaf.fit.dao.AdminRoleDAO;
import vn.edu.hcmuaf.fit.dao.CustomerUserDAO;

import java.util.List;

public class LoginService {
    private static LoginService loadUser;
    private String status;

    public static LoginService getInstance() {

        if (loadUser == null) {
            loadUser = new LoginService();
        }
        return loadUser;

    }

    public UserAccount getAccountCustomer(String username, String password) {
        CustomerUserDAO DAO = new CustomerUserDAO();

        if (!DAO.isExits(username)) {
            status = "Tài khoản không tồn tại";
            return null;
        }
        if (!DAO.checkStatus(username)) {
            status = "Tài khoản bị vô hiệu hoá";
            return null;
        }
        UserAccount account = DAO.checkLogin(username, password);
        if (account == null) {
            status = "Sai tên đăng nhập hoặc mật khẩu";
            return null;
        }
        return account;
    }
    public List<AdminRole> getListRoleAdmin(String idUser){
        return new AdminRoleDAO(idUser).getListRole();
    }
    public String getStatus() {
        return status;
    }
}
