package vn.edu.hcmuaf.fit.dao;

import vn.edu.hcmuaf.fit.db.JDBIConnector;

public class LogDAO {
    public static void createUserLog(String userID, String levels, String message) {
        String date = java.time.LocalDateTime.now().toString();
        JDBIConnector.get().withHandle(handle -> {
            return handle.createUpdate("insert into log (USER_ID, LEVELS, DATED, MESSAGE) values(?,?,?,?)")
                    .bind(0, userID)
                    .bind(1, levels)
                    .bind(2, date)
                    .bind(3, message)
                    .execute();
        });
    }

    public static void createNonUserLog(String levels, String message) {
        String date = java.time.LocalDateTime.now().toString();
        JDBIConnector.get().withHandle(handle -> {
            return handle.createUpdate("insert into log (USER_ID, LEVELS, DATED, MESSAGE) values(?,?,?,?)")
                    .bind(0, "")
                    .bind(1, levels)
                    .bind(2, date)
                    .bind(3, message)
                    .execute();
        });
    }

    public static void createAdminLog(String userID, String levels, String message) {
        String date = java.time.LocalDateTime.now().toString();
        JDBIConnector.get().withHandle(handle -> {
            return handle.createUpdate("insert into log (USER_ID, LEVELS, DATED, MESSAGE) values(?,?,?,?)")
                    .bind(0, userID)
                    .bind(1, levels)
                    .bind(2, date)
                    .bind(3, message)
                    .execute();
        });
    }
}
