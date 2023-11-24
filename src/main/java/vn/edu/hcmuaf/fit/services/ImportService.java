package vn.edu.hcmuaf.fit.services;

import vn.edu.hcmuaf.fit.beans.Import;
import vn.edu.hcmuaf.fit.dao.ImportDAO;

import java.util.List;

public class ImportService {
    private static ImportService importService;
    public static ImportService getInstance() {
        if (importService == null) {
            importService = new ImportService();
        }
        return importService;
    }

    public String insertImport(String idProduct, String quantity){
        return new ImportDAO().insertImport(idProduct,quantity);
    }

    public List<Import> getListImport(){
        return new ImportDAO().getListImport();
    }
    public boolean checkIdp(String idP){
        return new ImportDAO().checkIdp(idP);
    }
}
