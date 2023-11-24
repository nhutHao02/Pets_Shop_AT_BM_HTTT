package vn.edu.hcmuaf.fit.services;

import org.apache.commons.codec.digest.DigestUtils;

import java.util.Date;
import java.util.Random;

public class Utils {
    public static String maHoaMK(String input){
        return DigestUtils.md5Hex(input);
    }

    public static boolean checkPass(String input, String pass){
        return input.equals(pass);
    }

    public static int getTimeOut(Date timeExists) {
        Date now = new Date();
        long timeOut = timeExists.getTime() - now.getTime();
        if (timeOut <= 0) return 0;
        else return (int) (timeOut / 3);
    }

    public static String getVerifyCode() {
        Random rnd = new Random();
        int number = rnd.nextInt(999999);
        return String.format("%06d", number);
    }
    public static void main(String[] args) {

    }
}
