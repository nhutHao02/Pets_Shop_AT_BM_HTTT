package vn.edu.hcmuaf.fit.dao;

import ch.qos.logback.core.net.SyslogOutputStream;
import vn.edu.hcmuaf.fit.beans.AdminRole;
import vn.edu.hcmuaf.fit.beans.Comment;
import vn.edu.hcmuaf.fit.db.JDBIConnector;

import java.util.List;

public class AdminRoleDAO {
    private String idUser;

    public AdminRoleDAO(String id) {
        this.idUser = id;
    }

    public List<AdminRole> getListRole() {
        List<AdminRole> list = JDBIConnector.get().withHandle(handle -> {
            return handle.createQuery("select tableName, permission  from adminpermission where idUser = ?")
                    .bind(0, idUser)
                    .map((rs, ctx) -> new AdminRole(rs.getString("tableName"), rs.getInt("permission")))
                    .list();
        });
        return list;
    }

    public boolean addRoleadmin(String table, int permission){
        boolean result=false;
        boolean contain=false;
        for (AdminRole role:getListRole()) {
            if(role.getTableName().equals(table) && role.getPermission()==permission){
                contain=true;
            }
        }
        if(contain==false){
            JDBIConnector.get().withHandle(handle -> handle.createUpdate("insert into adminpermission (idUser,tableName,permission) values (?,?,?)")
                    .bind(0,idUser)
                    .bind(1,table)
                    .bind(2,permission)
                    .execute());
            result=true;
        }
        return result;
    }

    public AdminRole getAdminRole(String table, int per){
        AdminRole role = JDBIConnector.get().withHandle(handle -> {
            return handle.createQuery("select * from adminpermission where idUser = ? and tableName=? and permission=?")
                    .bind(0,idUser)
                    .bind(1,table)
                    .bind(2,per)
                    .mapToBean(AdminRole.class).first();
        });
        return role;
    }

    public void removePermission(String table, int per){
        JDBIConnector.get().withHandle(handle -> {
            return handle.createUpdate("DELETE FROM adminpermission WHERE idUser=? and tableName=? and permission=?;")
                    .bind(0,idUser)
                    .bind(1,table)
                    .bind(2,per)
                    .execute();
        });
    }

    public static void main(String[] args) {
//        System.out.println(new AdminRoleDAO("2201").getListRole());
        System.out.println(new AdminRoleDAO("Ad063").addRoleadmin("product",2));

    }
}
