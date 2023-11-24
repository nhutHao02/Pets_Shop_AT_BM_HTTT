package vn.edu.hcmuaf.fit.services;

import vn.edu.hcmuaf.fit.beans.AdminRole;
import vn.edu.hcmuaf.fit.beans.UserAccount;
import vn.edu.hcmuaf.fit.dao.AdminRoleDAO;
import vn.edu.hcmuaf.fit.dao.CustomerUserDAO;

public class UserService {
    private static UserService userService;
    public static UserService getInstance() {
        if (userService == null) {
            userService = new UserService();
        }
        return userService;
    }
    public UserAccount getUserDetail(String Id){
        CustomerUserDAO dao = new CustomerUserDAO();
        return dao.getUserDetail(Id);
    }

    public UserAccount getUserByEmail(String email) {
        CustomerUserDAO dao = new CustomerUserDAO();
        return dao.getUserByEmail(email);
    }

    public String getIdUserByName(String username) {
        CustomerUserDAO dao = new CustomerUserDAO();
    return dao.getIdUserByName(username);
    }

    public void updateInforUser(String id, String fullname,String phone, String address, String newpass, String avt) {
        new CustomerUserDAO().updateInforUser(id,fullname,phone, address,newpass,avt);
    }

    public void UpdateUserInfo(String id, String name, String email, Object o, Object o1, Object o2) {

    }

    public boolean isUserInOrder(String userId){
        return new CustomerUserDAO().isUserInOrder(userId);
    }

    public boolean addRoleadmin(String idAdmin,String table, int permission){
        return new AdminRoleDAO(idAdmin).addRoleadmin(table,permission);
    }
    public UserAccount getUserLoginFace(String user) { return new CustomerUserDAO().getUserLoginFace(user);}
    public void removePermission(String idAdmin,String table, int permission){
         new AdminRoleDAO(idAdmin).removePermission(table,permission);
    }

    public AdminRole getAdminRole(String idAdmin,String table, int per){
        return new AdminRoleDAO(idAdmin).getAdminRole(table,per);
    }
}
