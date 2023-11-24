package vn.edu.hcmuaf.fit.beans;

public class SignUp {
    private String fullName;
    private String email;
    private String userName;
    private String passwd;
    private String phone;
    private String passMaHoa;

    private String code;

    public SignUp(String fullName, String email, String userName, String passwd, String phone, String passMaHoa, String code) {
        this.fullName = fullName;
        this.email = email;
        this.userName = userName;
        this.passwd = passwd;
        this.phone = phone;
        this.passMaHoa = passMaHoa;
        this.code = code;
    }

    public SignUp() {
    }

    public String getCode() {
        return code;
    }

    public void setCode(String code) {
        this.code = code;
    }

    @Override
    public String toString() {
        return "SignUp{" +
                "fullName='" + fullName + '\'' +
                ", email='" + email + '\'' +
                ", userName='" + userName + '\'' +
                ", passwd='" + passwd + '\'' +
                ", phone='" + phone + '\'' +
                ", passMaHoa='" + passMaHoa + '\'' +
                '}';
    }

    public String getFullName() {
        return fullName;
    }

    public void setFullName(String fullName) {
        this.fullName = fullName;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getUserName() {
        return userName;
    }

    public void setUserName(String userName) {
        this.userName = userName;
    }

    public String getPasswd() {
        return passwd;
    }

    public void setPasswd(String passwd) {
        this.passwd = passwd;
    }

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }

    public String getPassMaHoa() {
        return passMaHoa;
    }

    public void setPassMaHoa(String passMaHoa) {
        this.passMaHoa = passMaHoa;
    }
}
