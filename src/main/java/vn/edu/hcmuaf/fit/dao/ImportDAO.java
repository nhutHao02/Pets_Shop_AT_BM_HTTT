package vn.edu.hcmuaf.fit.dao;

import vn.edu.hcmuaf.fit.beans.Comment;
import vn.edu.hcmuaf.fit.beans.Import;
import vn.edu.hcmuaf.fit.db.JDBIConnector;

import java.util.List;
import java.util.Random;
import java.util.stream.Collectors;

public class ImportDAO {
    public String taoIdImport() {
        String numbers = "0123456789";
        StringBuilder stringBuilder = new StringBuilder("I");
        Random rd = new Random();
        for (int i = 0; i < 4; i++) {
            int index = rd.nextInt(numbers.length());
            char rdC = numbers.charAt(index);
            stringBuilder.append(rdC);
        }
        List<String> listId = JDBIConnector.get().withHandle(
                handle -> handle.createQuery("SELECT id FROM import")
                        .mapTo(String.class)
                        .stream()
                        .collect(Collectors.toList()));
        if (listId.contains(stringBuilder.toString())) return taoIdImport();
        else return stringBuilder.toString();
    }

    public String insertImport(String idProduct, String quantity){
        String id = taoIdImport();
        String date = java.time.LocalDate.now().toString();
        JDBIConnector.get().withHandle(handle -> {
            handle.createUpdate("insert into import (id , importDay , quantity , idProduct) " +
                            "values (?,?,?,?)")
                    .bind(0,id)
                    .bind(1, date)
                    .bind(2, quantity)
                    .bind(3, idProduct)
                    .execute();
            return true;
        });
        return id;
    }

    public List<Import> getListImport(){
        List<Import> importList = JDBIConnector.get().withHandle(handle -> {
            return handle.createQuery("select id, importDay, quantity, idProduct from `import` order by importDay desc")
                    .mapToBean(Import.class).stream().collect(Collectors.toList());
        });
        return importList;
    }

    public boolean checkIdp(String idP){
        List<String> listId = JDBIConnector.get().withHandle(
                handle -> handle.createQuery("SELECT productId FROM product")
                        .mapTo(String.class)
                        .stream()
                        .collect(Collectors.toList()));
        if (listId.contains(idP)) return true;
        else return false;
    }

    public static void main(String[] args) {
        System.out.println(new ImportDAO().checkIdp("123456"));
    }
}
