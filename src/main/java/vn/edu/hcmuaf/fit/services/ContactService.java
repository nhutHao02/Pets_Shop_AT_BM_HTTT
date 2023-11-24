package vn.edu.hcmuaf.fit.services;

import vn.edu.hcmuaf.fit.beans.Contact;
import vn.edu.hcmuaf.fit.dao.ContactDAO;

import java.util.List;

public class ContactService {
    private static ContactService contactService;

    public static ContactService getInstance() {
        if (contactService == null) {
            contactService = new ContactService();
        }
        return contactService;
    }
    public void insertContact(String name, String email, String content){
        new ContactDAO().insertContact(name,email,content);
    }
    public List<Contact> listContact(){
        return new ContactDAO().listContact();
    }

    public void updateStatus(String id){
        new ContactDAO().updateStatus(id);
    }

    public void removeContact(String id){
        new ContactDAO().removeContact(id);
    }
}
