package vn.edu.hcmuaf.fit.dao;

import vn.edu.hcmuaf.fit.beans.Contact;
import vn.edu.hcmuaf.fit.db.JDBIConnector;

import java.util.List;
import java.util.Random;
import java.util.stream.Collectors;

public class ContactDAO {
    public static String taoIDContact() {
        String numbers = "0123456789";
        StringBuilder stringBuilder = new StringBuilder("CT");
        Random rd = new Random();

        for (int i = 0; i < 4; i++) {
            int index = rd.nextInt(numbers.length());
            char rdC = numbers.charAt(index);
            stringBuilder.append(rdC);
        }
        List<String> listId = JDBIConnector.get().withHandle(
                handle -> handle.createQuery("SELECT id FROM contact")
                        .mapTo(String.class)
                        .stream()
                        .collect(Collectors.toList()));
        if (listId.contains(stringBuilder.toString())) return taoIDContact();
        else return stringBuilder.toString();
    }
    public void insertContact(String name, String email, String content){
        String id = taoIDContact();
        String date = java.time.LocalDate.now().toString();
        JDBIConnector.get().withHandle(handle -> {
            return handle.createUpdate("insert into contact (id, name, email, content, status, date) values (?,?,?,?,0,?)")
                    .bind(0,id)
                    .bind(1,name)
                    .bind(2,email)
                    .bind(3,content)
                    .bind(4,date)
                    .execute();
        });
    }

    public List<Contact> listContact(){
        List<Contact> list = JDBIConnector.get().withHandle(handle -> {
            return handle.createQuery("select id, name, email, content, status, date from contact")
                    .mapToBean(Contact.class).stream().collect(Collectors.toList());
        });
        return list;
    }

    public void updateStatus(String id){
        JDBIConnector.get().withHandle(handle -> {
            return handle.createUpdate("update contact set `status`= 1 where id=?")
                    .bind(0,id)
                    .execute();
        });
    }

    public void removeContact(String id){
        JDBIConnector.get().withHandle(handle -> {
            return handle.createUpdate("DELETE FROM contact WHERE id= ?;")
                    .bind(0,id)
                    .execute();
        });
    }
}
