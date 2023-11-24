package vn.edu.hcmuaf.fit.dao;

import vn.edu.hcmuaf.fit.beans.UserAccount;
import vn.edu.hcmuaf.fit.db.JDBIConnector;
import vn.edu.hcmuaf.fit.services.Utils;
import java.util.List;
import java.util.Optional;
import java.util.Random;
import java.util.stream.Collectors;

public class CustomerUserDAO {
    private List<UserAccount> users;

    public CustomerUserDAO(){
        users= JDBIConnector.get().withHandle(handle -> {
            return handle.createQuery("select u.id, u.user_name, u.passMaHoa, u.pass, u.`status`, u.isAdmin, i.`name`, i.email, i.phone, i.address, i.avt from user_account u inner join infor_user i on i.id_user = u.id")
                    .mapToBean(UserAccount.class).stream().collect(Collectors.toList());
        });
    }

    public String taoIDCustomerAdminUser() {
        String numbers = "0123456789";
        StringBuilder stringBuilder = new StringBuilder("Ad");
        Random rd = new Random();

        for (int i = 0; i < 3; i++) {
            int index = rd.nextInt(numbers.length());
            char rdC = numbers.charAt(index);
            stringBuilder.append(rdC);
        }
        List<String> listId = JDBIConnector.get().withHandle(
                handle -> handle.createQuery("SELECT id FROM user_account")
                        .mapTo(String.class)
                        .stream()
                        .collect(Collectors.toList()));
        if (listId.contains(stringBuilder.toString())) return taoIDCustomerAdminUser();
        else return stringBuilder.toString();
    }

    public boolean isExits(String username) {
        for (UserAccount user : this.users) {
            if (user.getUsername().equals(username))
                return true;
        }
        return false;
    }

    public UserAccount checkLogin(String username, String password) {
        UserAccount cust = null;
        for (UserAccount user : this.users) {
            if (user.getUsername().equals(username) && Utils.checkPass(user.getPassMaHoa(), Utils.maHoaMK(password))) {
                cust = user;
                return cust;
            }
        }
        return null;
    }

    public boolean checkStatus(String username) {
        for (UserAccount user : this.users) {
            if (user.getUsername().equals(username)) {
                return user.isStatus();
            }
        }
        return false;
    }

    public String checkEmailExits(String email) {
        List<String> id_account = JDBIConnector.get().withHandle(handle -> handle.createQuery("select us.id from user_account us INNER JOIN infor_user iu ON iu.id_user = us.id where us.isAdmin = 0 and iu.email =?")
                .bind(0, email)
                .mapTo(String.class)
                .stream()
                .collect(Collectors.toList()));
        if (id_account.isEmpty())
            return "";
        return id_account.get(0);
    }

    public void updatePasswordFromEmail(String newPass, String email) {
        JDBIConnector.get().withHandle(handle -> {
            handle.createUpdate("update user_account set pass = ?,passMaHoa=? where id =?")
                    .bind(0, newPass)
                    .bind(1,Utils.maHoaMK(newPass))
                    .bind(2, checkEmailExits(email))
                    .execute();
            return null;
        });
    }

    public String checkUser(String username){
        String result=null;
        String user=null;
        try {
            user = JDBIConnector.get().withHandle(handle -> handle.createQuery("SELECT user_name FROM user_account WHERE user_name = ?")
                    .bind(0,username).mapTo(String.class).first());
        }catch (Exception e){
        }
        if (user != null) {
            result = "Username đã tồn tại!";
        }
        return result;
    }

    public void updateInforUser(String id, String fullname,String phone, String address, String newpass){
        JDBIConnector.get().withHandle(handle -> {
            handle.createUpdate("update user_account set pass = ? ,passMaHoa=? where id =?")
                    .bind(0,newpass)
                    .bind(1,Utils.maHoaMK(newpass))
                    .bind(2, id)
                    .execute();
            handle.createUpdate("update infor_user set name=? ,phone=? , address=? where id_user =?")
                    .bind(0,fullname)
                    .bind(1,phone)
                    .bind(2,address)
                    .bind(3,id)
                    .execute();
            return null;
        });
    }
    public void updateInforUser(String id, String fullname,String phone, String address, String newpass, String avt){
        JDBIConnector.get().withHandle(handle -> {
            handle.createUpdate("update user_account set pass = ? ,passMaHoa=? where id =?")
                    .bind(0,newpass)
                    .bind(1,Utils.maHoaMK(newpass))
                    .bind(2, id)
                    .execute();
            handle.createUpdate("update infor_user set name=?, phone=? , address=?, avt=? where id_user =?")
                    .bind(0,fullname)
                    .bind(1,phone)
                    .bind(2,address)
                    .bind(3,"img/user/"+avt)
                    .bind(4,id)
                    .execute();
            return null;
        });
    }

    public List<UserAccount> listUser() {
        String query = "SELECT u.user_name, u.id,ifu.email, ifu.address FROM user_account u join infor_user ifu on u.id = ifu.id_user\n" +
                "where isAdmin=0";
        String FinalQuery = query;
        List<UserAccount> list = JDBIConnector.get().withHandle(handle -> handle.createQuery(FinalQuery)
                .mapToBean(UserAccount.class)
                .stream()
                .collect(Collectors.toList()));
        return list;
    }

    public List<UserAccount> ListAdmin() {
        return JDBIConnector.get().withHandle((handle -> handle.createQuery("SELECT u.id, u.user_name, u.passMaHoa, u.pass, u.`status`, u.isAdmin, i.`name`, i.email, i.phone, i.address, i.avt FROM user_account u join infor_user i on u.id=i.id_user WHERE u.isAdmin=1;").mapToBean(UserAccount.class).stream().collect(Collectors.toList())));
    }

    public void insertAdmin(String userName, String pass, String fullName, String email, String phone,String address,int status) {
        String id = taoIDCustomerAdminUser();
        JDBIConnector.get().withHandle(handle -> {
            handle.createUpdate("INSERT INTO user_account(id, user_name, passMaHoa, pass, status,isAdmin) VALUES (?, ?, ?,?, ?, 1)")
                    .bind(0, id)
                    .bind(1, userName)
                    .bind(2, Utils.maHoaMK(pass))
                    .bind(3, pass)
                    .bind(4, status)
                    .execute();
            handle.createUpdate("INSERT INTO infor_user(id_user,name, email, phone, address) VALUES (?, ?, ?,?,?)")
                    .bind(0, id)
                    .bind(1, fullName)
                    .bind(2, email)
                    .bind(3, phone)
                    .bind(4,address)
                    .execute();
            return null;
        });
    }
    public void updateAdmin(String id, String userName, String fullName, String email, String phone,String address,int status) {
        JDBIConnector.get().withHandle(handle -> {
            handle.createUpdate("update user_account set user_name = ?, status = ? where id = ?")
                    .bind(0, userName)
                    .bind(1, status)
                    .bind(2, id)
                    .execute();
            handle.createUpdate("update infor_user set name = ?, email = ?, phone = ?, address = ? where id_user = ?")
                    .bind(0, fullName)
                    .bind(1, email)
                    .bind(2, phone)
                    .bind(3, address)
                    .bind(4, id)
                    .execute();
            return null;
        });
    }
    public void updateAdmin(String id, String userName, String pass, String fullName, String email, String phone,String address,int status) {
        JDBIConnector.get().withHandle(handle -> {
            handle.createUpdate("update user_account set user_name = ?, passMaHoa = ?, pass = ?, status = ? where id = ?")
                    .bind(0, userName)
                    .bind(1, Utils.maHoaMK(pass))
                    .bind(2, pass)
                    .bind(3, status)
                    .bind(4, id)
                    .execute();
            handle.createUpdate("update infor_user set name = ?, email = ?, phone = ?, address = ? where id_user = ?")
                    .bind(0, fullName)
                    .bind(1, email)
                    .bind(2, phone)
                    .bind(3, address)
                    .bind(4, id)
                    .execute();
            return null;
        });
    }
    public void insertCustomer(String userName, String pass, String fullName, String email, String phone,String address,int status) {
        String id = new SignUpDAO().taoIDCustomerUser();
        JDBIConnector.get().withHandle(handle -> {
            handle.createUpdate("INSERT INTO user_account(id, user_name, passMaHoa, pass, status,isAdmin) VALUES (?, ?, ?,?, ?, 0)")
                    .bind(0, id)
                    .bind(1, userName)
                    .bind(2, Utils.maHoaMK(pass))
                    .bind(3, pass)
                    .bind(4, status)
                    .execute();
            handle.createUpdate("INSERT INTO infor_user(id_user,name, email, phone, address) VALUES (?, ?, ?,?,?)")
                    .bind(0, id)
                    .bind(1, fullName)
                    .bind(2, email)
                    .bind(3, phone)
                    .bind(4,address)
                    .execute();
            return null;
        });
    }
    public void updateCustomer(String id, String userName, String fullName, String email, String phone,String address,int status) {
        JDBIConnector.get().withHandle(handle -> {
            handle.createUpdate("update user_account set user_name = ?, status = ? where id = ?")
                    .bind(0, userName)
                    .bind(1, status)
                    .bind(2, id)
                    .execute();
            handle.createUpdate("update infor_user set name = ?, email = ?, phone = ?, address = ? where id_user = ?")
                    .bind(0, fullName)
                    .bind(1, email)
                    .bind(2, phone)
                    .bind(3, address)
                    .bind(4, id)
                    .execute();
            return null;
        });
    }
    public void updateCustomer(String id, String userName, String pass, String fullName, String email, String phone,String address,int status) {
        JDBIConnector.get().withHandle(handle -> {
            handle.createUpdate("update user_account set user_name = ?, passMaHoa = ?, pass = ?, status = ? where id = ?")
                    .bind(0, userName)
                    .bind(1, Utils.maHoaMK(pass))
                    .bind(2, pass)
                    .bind(3, status)
                    .bind(4, id)
                    .execute();
            handle.createUpdate("update infor_user set name = ?, email = ?, phone = ?, address = ? where id_user = ?")
                    .bind(0, fullName)
                    .bind(1, email)
                    .bind(2, phone)
                    .bind(3, address)
                    .bind(4, id)
                    .execute();
            return null;
        });
    }
    public UserAccount getUserDetail(String id) {
        UserAccount detail = JDBIConnector.get().withHandle(handle -> {
            return handle.createQuery("select u.id, u.user_name, u.passMaHoa, u.pass, u.`status`, u.isAdmin, i.`name`, i.email, i.phone, i.address, i.avt from infor_user i inner join user_account u on i.id_user = u.id where id_user = ?")
                    .bind(0, id)
                    .mapToBean(UserAccount.class).first();
        });
        return detail;
    }
    public UserAccount getUserLoginFace(String user) {
        UserAccount detail = JDBIConnector.get().withHandle(handle -> {
            return handle.createQuery("select * from infor_user iu inner join user_account uc on iu.id_user = uc.id WHERE user_name = ?")
                    .bind(0, user)
                    .mapToBean(UserAccount.class).first();
        });
        return detail;
    }
    public static void deleteUser(String id) {
        JDBIConnector.get().withHandle(handle -> {
            handle.createUpdate("delete from user_account where id = ?")
                    .bind(0, id)
                    .execute();
            handle.createUpdate("delete from infor_user where id_user = ?")
                    .bind(0, id)
                    .execute();
            return true;
        });
    }

    public UserAccount getUserByEmail(String email) {
        Optional<UserAccount> user = JDBIConnector.get().withHandle(handle -> handle.createQuery("" +
                        "SELECT ua.id,ua.pass,ua.passMaHoa,ua.user_name,iu.`name`,iu.email,iu.address,iu.avt,iu.phone FROM user_account ua join infor_user iu\n" +
                        "on ua.id = iu.id_user\n" +
                        "WHERE iu.email = ?")
                .bind(0, email)
                .mapToBean(UserAccount.class)
                .findFirst()
        );
        return user.orElse(null);
    }
    public String getIdUserByName(String username) {
        Optional<String> Statement = JDBIConnector.get().withHandle(handle ->
                handle.createQuery("SELECT ua.id" +
                                " FROM infor_user i INNER JOIN user_account ua ON i.id_user = ua.id WHERE ua.status = 1 AND ua.user_name=? ")
                        .bind(0, username)
                        .mapTo(String.class)
                        .findFirst()
        );
        return Statement.orElse(null);
    }

    //kiem tra tai khoan co trong don hang nao khong
    public boolean isUserInOrder(String userId) {
        List<String> idUsers = JDBIConnector.get().withHandle(handle ->
                handle.createQuery("select CustomerID from orders where CustomerID=?")
                        .bind(0, userId).mapTo(String.class).stream().collect(Collectors.toList()));
        if (idUsers.contains(userId)) return true;
        else return false;
    }


    public static void main(String[] args) {
        System.out.println();
    }
}
