package vn.edu.hcmuaf.fit.tool;

import java.nio.charset.StandardCharsets;
import java.security.*;
import java.security.interfaces.DSAPrivateKey;
import java.security.spec.InvalidKeySpecException;
import java.security.spec.X509EncodedKeySpec;
import java.util.Base64;

public class DSA {
    private PrivateKey privateKey;
    private PublicKey publicKey;

    // Hàm tạo cặp khóa DSA gồm khóa publice và khóa private
    private KeyPair generateDSAKeyPair() throws NoSuchAlgorithmException {
        KeyPairGenerator keyPairGenerator = KeyPairGenerator.getInstance("DSA");
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

    // Hàm nhập khóa từ chuỗi base64
    private Key importKey(String keyString, String algorithm) {
        if (!isBase64(keyString)) {
            System.out.println("key không đúng định dạng base64");
            return null;
        }
        try {
            byte[] keyBytes = Base64.getDecoder().decode(keyString);
            KeyFactory keyFactory = KeyFactory.getInstance(algorithm);

            // Print or log the key string to check its format
            System.out.println("Key String: " + keyString);

            if (algorithm.equals("DSA")) {
                return keyFactory.generatePublic(new X509EncodedKeySpec(keyBytes));
            } else {
                // Handle other key types if needed
                return null;
            }
        } catch (NoSuchAlgorithmException | InvalidKeySpecException e) {
            e.printStackTrace();
            return null;
        }
    }

    // Hàm ký số
    private byte[] sign(String message, PrivateKey privateKey) throws Exception {
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
            PublicKey importedPublicKey = (PublicKey) dsa.importKey(publicKeyString, "DSA");
//            PrivateKey importedPrivateKey = dsa.importKey(privateKeyString, "DSA");

            // Kiểm tra tính hợp lệ của khóa sau khi nhập
//            if (importedPublicKey != null && importedPrivateKey != null) {
//                System.out.println("Imported Keys are valid.");
//            } else {
//                System.out.println("Imported Keys are not valid.");
//            }

            // Chuỗi cần ký
            String message = "Hello, DSA!";

            // Ký số chuỗi
            byte[] signature = dsa.sign(message,dsa.privateKey);

            // Xác minh chữ ký
            boolean verified = dsa.verify(message, signature, importedPublicKey);

            // In kết quả
            System.out.println("Original Message: " + message);
            System.out.println("Signature Verified: " + verified);
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

}
