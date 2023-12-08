package vn.edu.hcmuaf.fit.tool;

import java.math.BigInteger;
import java.security.DigestInputStream;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;

public class Hash {
    private String mode = "MD5";

    public void setMode(String mode) {
        this.mode = mode;
    }

    public String getMode() {
        return mode;
    }

    public String hashString(String dataInput) {
        try {
            MessageDigest md = MessageDigest.getInstance(mode);
            byte[] output = md.digest(dataInput.getBytes());
            BigInteger num = new BigInteger(1, output);
            return num.toString(16);
        } catch (NoSuchAlgorithmException e) {
            throw new RuntimeException(e);
        }
    }


}
