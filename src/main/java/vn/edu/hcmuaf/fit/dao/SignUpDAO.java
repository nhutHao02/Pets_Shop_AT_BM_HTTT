package vn.edu.hcmuaf.fit.dao;

import vn.edu.hcmuaf.fit.db.JDBIConnector;

import java.util.List;
import java.util.Random;
import java.util.stream.Collectors;

public class SignUpDAO {
    public SignUpDAO() {
    }

    public String taoIDCustomerUser() {
        String numbers = "0123456789";
        StringBuilder stringBuilder = new StringBuilder("C");
        Random rd = new Random();

        for (int i = 0; i < 4; i++) {
            int index = rd.nextInt(numbers.length());
            char rdC = numbers.charAt(index);
            stringBuilder.append(rdC);
        }
        List<String> listId = JDBIConnector.get().withHandle(
                handle -> handle.createQuery("SELECT id FROM user_account")
                        .mapTo(String.class)
                        .stream()
                        .collect(Collectors.toList()));
        if (listId.contains(stringBuilder.toString())) return taoIDCustomerUser();
        else return stringBuilder.toString();
    }

    public void insertUser(String userName, String passMaHoa, String pass, String fullName, String email, String phone) {
        String id = taoIDCustomerUser();
        JDBIConnector.get().withHandle(handle -> {
            handle.createUpdate("INSERT INTO user_account(id, user_name, passMaHoa, pass, status,isAdmin) VALUES (?, ?, ?,?, 1, 0)")
                    .bind(0, id)
                    .bind(1, userName)
                    .bind(2, passMaHoa)
                    .bind(3, pass)
                    .execute();
            handle.createUpdate("INSERT INTO infor_user(id_user,name, email, phone) VALUES (?, ?, ?,?)")
                    .bind(0, id)
                    .bind(1, fullName)
                    .bind(2, email)
                    .bind(3, phone)
                    .execute();
            return null;
        });
    }

    public void insertUserByAcGG() {

    }

    public String checkUser(String email, String username){
        String result=null;
        String mail=null;
        String user=null;
        try {
             mail =JDBIConnector.get().withHandle(handle -> handle.createQuery("SELECT email FROM infor_user WHERE email = ?")
                    .bind(0,email).mapTo(String.class).first());
        }catch (Exception e){
        }
        try {
             user = JDBIConnector.get().withHandle(handle -> handle.createQuery("SELECT user_name FROM user_account WHERE user_name = ?")
                    .bind(0,username).mapTo(String.class).first());
        }catch (Exception e){
        }
        if (mail != null) {
            result = "Email đã liên kết tài khoản khác!";
        }
        if (user != null) {
            result = "Username đã tồn tại!";
        }
        return result;
    }

    public boolean checkMail(String email) {
        String emails = null;
        try {
            emails = JDBIConnector.get().withHandle(handle -> handle.createQuery("SELECT email FROM info_user WHERE email = ?").bind(0, email).mapTo(String.class).first());
        } catch (Exception e) {
        }
        if (emails != null) return true;
        else return false;
    }
}
