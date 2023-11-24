package vn.edu.hcmuaf.fit.services;

import vn.edu.hcmuaf.fit.dao.LogDAO;

public class LogService {
    private static LogService logService;
    public static LogService getInstance() {
        if (logService == null) {
            logService = new LogService();
        }
        return logService;
    }
    public void createUserLog(String userID, String levels, String message) {
        new LogDAO().createUserLog(userID, levels, message);
    }
    public void createNonUserLog(String levels, String message){
        new LogDAO().createNonUserLog(levels, message);
    }
    public void createAdminLog(String userID, String levels, String message) {
        new LogDAO().createUserLog(userID, levels, message);
    }
}
