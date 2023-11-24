package vn.edu.hcmuaf.fit.beans;

import java.io.Serializable;

public class Contact implements Serializable {
    private String id;
    private String name;
    private String email;
    private String content;
    private boolean status;
    private String date;

    public Contact() {
    }

    public Contact(String id, String name, String email, String content, boolean status, String date) {
        this.id = id;
        this.name = name;
        this.email = email;
        this.content = content;
        this.status = status;
        this.date = date;
    }

    public String getDate() {
        return date;
    }

    public void setDate(String date) {
        this.date = date;
    }

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content;
    }

    public boolean isStatus() {
        return status;
    }

    public void setStatus(boolean status) {
        this.status = status;
    }
}
