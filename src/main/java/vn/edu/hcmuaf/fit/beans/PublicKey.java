package vn.edu.hcmuaf.fit.beans;

import java.io.Serializable;

public class PublicKey implements Serializable {
    int id;
    String userId;
    String publicKey;
    String createAt;
    String expiredAt;

    public PublicKey() {
    }

    public PublicKey(int id, String userId, String publicKey, String createAt, String expiredAt) {
        this.id = id;
        this.userId = userId;
        this.publicKey = publicKey;
        this.createAt = createAt;
        this.expiredAt = expiredAt;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getUserId() {
        return userId;
    }

    public void setUserId(String userId) {
        this.userId = userId;
    }

    public String getPublicKey() {
        return publicKey;
    }

    public void setPublicKey(String publicKey) {
        this.publicKey = publicKey;
    }

    public String getCreateAt() {
        return createAt;
    }

    public void setCreateAt(String createAt) {
        this.createAt = createAt;
    }

    public String getExpiredAt() {
        return expiredAt;
    }

    public void setExpiredAt(String expiredAt) {
        this.expiredAt = expiredAt;
    }

    @Override
    public String toString() {
        return "PublicKey{" +
                "id=" + id +
                ", userId='" + userId + '\'' +
                ", publicKey='" + publicKey + '\'' +
                ", createAt='" + createAt + '\'' +
                ", expiredAt='" + expiredAt + '\'' +
                '}';
    }
}
