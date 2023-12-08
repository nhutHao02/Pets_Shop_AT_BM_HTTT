package vn.edu.hcmuaf.fit.tool;

import javax.swing.*;
import java.nio.charset.StandardCharsets;
import java.security.*;
import java.security.interfaces.DSAPrivateKey;
import java.security.spec.InvalidKeySpecException;
import java.security.spec.PKCS8EncodedKeySpec;
import java.security.spec.X509EncodedKeySpec;
import java.sql.SQLOutput;
import java.util.Base64;

public class DSA {
    private PrivateKey privateKey;
    private PublicKey publicKey;

    // Hàm tạo cặp khóa DSA gồm khóa publice và khóa private
    public KeyPair generateDSAKeyPair() throws NoSuchAlgorithmException {
        KeyPairGenerator keyPairGenerator = KeyPairGenerator.getInstance("DSA");
        keyPairGenerator.initialize(2048);
        return keyPairGenerator.generateKeyPair();
    }

    public void generatekey(KeyPair keyPair) {
        privateKey = keyPair.getPrivate();
        publicKey = keyPair.getPublic();
    }

    // Hàm xuất khóa dưới dạng chuỗi base64
    private static String exportKey(Key key) {
        byte[] keyEncoded = key.getEncoded();
        return Base64.getEncoder().encodeToString(keyEncoded);
    }
    public String exportPrivateKey() {
        byte[] keyEncoded = privateKey.getEncoded();
        return Base64.getEncoder().encodeToString(keyEncoded);
    }
    public String exportPublicKey() {
        byte[] keyEncoded = publicKey.getEncoded();
        return Base64.getEncoder().encodeToString(keyEncoded);
    }

    // Hàm nhập khóa từ chuỗi base64
    public PrivateKey importKey(String keyString, String algorithm) {
        if (!isBase64(keyString)) {
            JOptionPane.showMessageDialog(null, "key is not base64", "Error", JOptionPane.ERROR_MESSAGE);
            System.out.println("key không đúng định dạng base64");
            return null;
        }
        try {
            byte[] keyBytes = Base64.getDecoder().decode(keyString);
            KeyFactory keyFactory = KeyFactory.getInstance(algorithm);

            // Print or log the key string to check its format
            System.out.println("Key String: " + keyString);

            if (algorithm.equals("DSA")) {
                PrivateKey privateKey1=keyFactory.generatePrivate(new PKCS8EncodedKeySpec(keyBytes));
                if(privateKey1 instanceof PrivateKey){
                    System.out.println("private key vaild");
                    return privateKey1;
                }else {
                    System.out.println("private key not vaild");
                    JOptionPane.showMessageDialog(null, "key is not vaild", "Error", JOptionPane.ERROR_MESSAGE);
                    return null;
                }

            } else {
                // Handle other key types if needed
                return null;
            }
        } catch (NoSuchAlgorithmException | InvalidKeySpecException e) {
            e.printStackTrace();
            return null;
        }
    }

    public boolean isImportKey(String keyString) {  // 2013025_Trần Nhựt Hào
        if (!isBase64(keyString)) {
            System.out.println("key không đúng định dạng base64");
            return false;
        }
        try {
            // Loại bỏ các ký tự không hợp lệ từ chuỗi khóa công khai (nếu có)
            String formattedKey = keyString
                    .replaceAll("\\n", "")
                    .replaceAll("\\r", "")
                    .replaceAll("\\t", "")
                    .replaceAll(" ", "");

            // Giải mã Base64 để lấy mảng byte của khóa công khai
            byte[] publicKeyBytes = Base64.getDecoder().decode(formattedKey);

            X509EncodedKeySpec keySpec = new X509EncodedKeySpec(publicKeyBytes);
            KeyFactory keyFactory = KeyFactory.getInstance("DSA");

            PublicKey publicKey = keyFactory.generatePublic(keySpec);

            // Nếu không có ngoại lệ, khóa công khai hợp lệ
            return true;
        } catch (Exception e) {
            // Nếu có bất kỳ ngoại lệ nào xảy ra, khóa công khai không hợp lệ
            return false;
        }
    }

    // Hàm ký số
    public byte[] sign(String message, PrivateKey privateKey) throws Exception {
        if (!(privateKey instanceof DSAPrivateKey)) {
            // Xử lý trường hợp khóa không phải là privatekey DSA
            throw new InvalidKeyException("Not a DSA private key");
        }
        Signature signature = Signature.getInstance("SHA256withDSA");
        signature.initSign(privateKey);
        signature.update(message.getBytes());
        return signature.sign();
    }

    // Hàm xác minh chữ ký
    private boolean verify(String message, byte[] signature, PublicKey publicKey) throws Exception {
        Signature sig = Signature.getInstance("SHA256withDSA");
        sig.initVerify(publicKey);
        sig.update(message.getBytes());
        return sig.verify(signature);
    }

    private boolean isBase64(String str) {
        try {
            Base64.getDecoder().decode(str);
            return true;
        } catch (IllegalArgumentException e) {
            return false;
        }
    }
    public String bytesToBase64(byte[] inputBytes) {
        byte[] base64Bytes = Base64.getEncoder().encode(inputBytes);
        return new String(base64Bytes, StandardCharsets.UTF_8);
    }
    public static void main(String[] args) throws NoSuchAlgorithmException {
        DSA dsa = new DSA();
        // Tạo cặp khóa DSA
        dsa.generatekey(dsa.generateDSAKeyPair());
        try {
            // Xuất khóa công khai và riêng
            String publicKeyString = exportKey(dsa.publicKey);
            String privateKeyString = exportKey(dsa.privateKey);

            // In khóa công khai và riêng
            System.out.println("Public Key: " + publicKeyString);
            System.out.println("Private Key: " + privateKeyString);

            // Tạo khóa từ chuỗi
            PrivateKey importPrivatekey = dsa.importKey(privateKeyString, "DSA");

            // Chuỗi cần ký
            String message = "Hello, DSA!";

            // Ký số chuỗi
            byte[] signature = dsa.sign(message,importPrivatekey);
            String signatureString= dsa.bytesToBase64(signature);
            System.out.println(signatureString);
            // Xác minh chữ ký
            boolean verified = dsa.verify(message, signature,dsa.publicKey);


            // In kết quả
            System.out.println("Original Message: " + message);
            System.out.println("Signature Verified: " + verified);
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

}
