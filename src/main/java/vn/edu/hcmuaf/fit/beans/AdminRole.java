package vn.edu.hcmuaf.fit.beans;

import java.io.Serializable;

public class AdminRole implements Serializable {
    private String tableName;
    private int permission;

    public AdminRole() {
    }

    public AdminRole(String tableName, int permission) {
        this.tableName = tableName;
        this.permission = permission;
    }

    public String getTableName() {
        return tableName;
    }

    public void setTableName(String tableName) {
        this.tableName = tableName;
    }

    public int getPermission() {
        return permission;
    }

    public void setPermission(int permission) {
        this.permission = permission;
    }

    @Override
    public String toString() {
        return "AdminRole{" +
                "tableName='" + tableName + '\'' +
                ", permission=" + permission +
                '}';
    }
}
