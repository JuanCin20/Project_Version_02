/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Encryption;

import java.security.MessageDigest;
import java.util.Arrays;
import javax.crypto.SecretKey;
import javax.crypto.spec.SecretKeySpec;
import javax.crypto.Cipher;
import org.apache.commons.codec.binary.Base64;
import java.io.UnsupportedEncodingException;
import java.security.NoSuchAlgorithmException;
import javax.crypto.NoSuchPaddingException;
import java.security.InvalidKeyException;
import javax.crypto.IllegalBlockSizeException;
import javax.crypto.BadPaddingException;
import java.util.logging.Logger;
import java.util.logging.Level;

/**
 *
 * @author JuanCin20
 */
public class Encryption {

    /* public static String Create_Hash(String Password_Usuario, String Hash_Type) throws NoSuchAlgorithmException {
        try {
            MessageDigest Obj_MessageDigest = MessageDigest.getInstance(Hash_Type);
            byte[] Obj_Byte = Obj_MessageDigest.digest(Password_Usuario.getBytes());

            StringBuilder Obj_StringBuilder = new StringBuilder();

            for (int i = 0; i < Obj_Byte.length; ++i) {
                Obj_StringBuilder.append(Integer.toHexString((Obj_Byte[i] & 0xFF) | 0x100).substring(1, 3));
            }

            return Obj_StringBuilder.toString();
        } catch (NoSuchAlgorithmException Obj_NoSuchAlgorithmException) {
            Logger.getLogger(Encryption.class.getName()).log(Level.SEVERE, Obj_NoSuchAlgorithmException.getMessage());
        }
        return null;
    } */

 /* public static String Hash_MD_5(String Password_Usuario) throws NoSuchAlgorithmException {
        return Encryption.Create_Hash(Password_Usuario, "MD5");
    } */

 /* public static String Hash_SHA_1(String Password_Usuario) throws NoSuchAlgorithmException {
        return Encryption.Create_Hash(Password_Usuario, "SHA1");
    } */

 /* public static void Encrypt_Decrypt_Password_Usuario(String Password_Usuario) throws NoSuchAlgorithmException, NoSuchPaddingException, InvalidKeyException, IllegalBlockSizeException, BadPaddingException {
        try {
            String Key = "Bar12345Bar12345"; // 128 Bit Key

            // Create Key and Cipher
            Key Obj_Key = new SecretKeySpec(Key.getBytes(), "AES");
            Cipher Obj_Cipher = Cipher.getInstance("AES");

            // Encrypt the Text
            Obj_Cipher.init(Cipher.ENCRYPT_MODE, Obj_Key);
            byte[] Byte_Encrypted = Obj_Cipher.doFinal(Password_Usuario.getBytes());

            StringBuilder Obj_StringBuilder = new StringBuilder();
            for (byte Obj_Byte : Byte_Encrypted) {
                Obj_StringBuilder.append((char) Obj_Byte);
            }

            // The Encrypted String
            String String_Encrypted = Obj_StringBuilder.toString();
            System.out.println("Password_Usuario_Encrypted: " + String_Encrypted);

            // Now Convert the String to Byte Array
            // For Decryption
            byte[] Byte_Decrypted = new byte[String_Encrypted.length()];
            for (int i = 0; i < String_Encrypted.length(); i++) {
                Byte_Decrypted[i] = (byte) String_Encrypted.charAt(i);
            }

            // The Decrypted String
            Obj_Cipher.init(Cipher.DECRYPT_MODE, Obj_Key);
            String String_Decrypted = new String(Obj_Cipher.doFinal(Byte_Decrypted));
            System.out.println("Password_Usuario_Decrypted: " + String_Decrypted);

        } catch (NoSuchAlgorithmException | NoSuchPaddingException | InvalidKeyException | IllegalBlockSizeException | BadPaddingException Obj_NoSuchAlgorithmException_NoSuchPaddingException_InvalidKeyException_IllegalBlockSizeException_BadPaddingException) {
            Logger.getLogger(Encryption.class.getName()).log(Level.SEVERE, Obj_NoSuchAlgorithmException_NoSuchPaddingException_InvalidKeyException_IllegalBlockSizeException_BadPaddingException.getMessage());
        }
    } */
    private static final String Key = "ListenUpOasis1995";

    public static String Encrypt_Password_Usuario(String Password_Usuario_Decrypted) throws UnsupportedEncodingException, NoSuchAlgorithmException, NoSuchPaddingException, InvalidKeyException, IllegalBlockSizeException, BadPaddingException {
        String Password_Usuario_Encrypted = "";
        try {
            MessageDigest Obj_MessageDigest = MessageDigest.getInstance("MD5");
            byte[] Obj_Byte_01 = Obj_MessageDigest.digest(Key.getBytes("UTF-8"));
            byte[] Obj_Byte_02 = Arrays.copyOf(Obj_Byte_01, 24);
            SecretKey Obj_SecretKey = new SecretKeySpec(Obj_Byte_02, "DESede");
            Cipher Obj_Cipher = Cipher.getInstance("DESede");
            Obj_Cipher.init(Cipher.ENCRYPT_MODE, Obj_SecretKey);
            byte[] Obj_Byte_03 = Password_Usuario_Decrypted.getBytes("UTF-8");
            byte[] Obj_Byte_04 = Obj_Cipher.doFinal(Obj_Byte_03);
            byte[] Obj_Byte_05 = Base64.encodeBase64(Obj_Byte_04);
            Password_Usuario_Encrypted = new String(Obj_Byte_05);
            // System.out.println("Password_Usuario_Encrypted: " + Password_Usuario_Encrypted);
            return Password_Usuario_Encrypted;
        } catch (UnsupportedEncodingException | NoSuchAlgorithmException | NoSuchPaddingException | InvalidKeyException | IllegalBlockSizeException | BadPaddingException Obj_UnsupportedEncodingException_NoSuchAlgorithmException_NoSuchPaddingException_InvalidKeyException_IllegalBlockSizeException_BadPaddingException) {
            Logger.getLogger(Encryption.class.getName()).log(Level.SEVERE, Obj_UnsupportedEncodingException_NoSuchAlgorithmException_NoSuchPaddingException_InvalidKeyException_IllegalBlockSizeException_BadPaddingException.getMessage());
        }
        return null;
    }

    public static String Decrypt_Password_Usuario(String Password_Usuario_Encrypted) throws UnsupportedEncodingException, NoSuchAlgorithmException, NoSuchPaddingException, InvalidKeyException, IllegalBlockSizeException, BadPaddingException {
        String Password_Usuario_Decrypted = "";
        try {
            byte[] Obj_Byte_01 = Base64.decodeBase64(Password_Usuario_Encrypted.getBytes("UTF-8"));
            MessageDigest Obj_MessageDigest = MessageDigest.getInstance("MD5");
            byte[] Obj_Byte_02 = Obj_MessageDigest.digest(Key.getBytes("UTF-8"));
            byte[] Obj_Byte_03 = Arrays.copyOf(Obj_Byte_02, 24);
            SecretKey Obj_SecretKey = new SecretKeySpec(Obj_Byte_03, "DESede");
            Cipher Obj_Cipher = Cipher.getInstance("DESede");
            Obj_Cipher.init(Cipher.DECRYPT_MODE, Obj_SecretKey);
            byte[] Obj_Byte_04 = Obj_Cipher.doFinal(Obj_Byte_01);
            Password_Usuario_Decrypted = new String(Obj_Byte_04, "UTF-8");
            // System.out.println("Password_Usuario_Decrypted: " + Password_Usuario_Decrypted);
            return Password_Usuario_Decrypted;
        } catch (UnsupportedEncodingException | NoSuchAlgorithmException | NoSuchPaddingException | InvalidKeyException | IllegalBlockSizeException | BadPaddingException Obj_UnsupportedEncodingException_NoSuchAlgorithmException_NoSuchPaddingException_InvalidKeyException_IllegalBlockSizeException_BadPaddingException) {
            Logger.getLogger(Encryption.class.getName()).log(Level.SEVERE, Obj_UnsupportedEncodingException_NoSuchAlgorithmException_NoSuchPaddingException_InvalidKeyException_IllegalBlockSizeException_BadPaddingException.getMessage());
        }
        return null;
    }
}