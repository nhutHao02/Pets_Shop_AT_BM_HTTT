package vn.edu.hcmuaf.fit.beans;

public class Logs {
    private String date;
    private String level;
    private String message;

    public Logs() {
    }

    public Logs(String date, String level, String message) {
        this.date = date;
        this.level = level;
        this.message = message;
    }

    public String getDate() {
        return date;
    }

    public void setDate(String date) {
        this.date = date;
    }

    public String getLevel() {
        return level;
    }

    public void setLevel(String level) {
        this.level = level;
    }

    public String getMessage() {
        return message;
    }

    public void setMessage(String message) {
        this.message = message;
    }
}
