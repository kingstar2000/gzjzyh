package com.strongit.di.util;

import com.strongit.di.exception.SystemException;
import java.security.*;
import java.security.spec.*;
import javax.crypto.*;
import javax.crypto.spec.*;
import java.io.*;

/**
 * DES���ܽ����㷨
 * <p>Title: Strong Data Interchange System</p>
 * <p>Description: </p>
 * <p>Copyright: Copyright (c) 2007 Jiang Xi Strong Co. Ltd. </p>
 * <p>Company: </p>
 * @author minhongbin@hotmail.com
 * @version 1.0
 */
public class DESEncrypter {

  Cipher ecipher;
  Cipher dcipher;

  // 8-byte Salt
  byte[] salt = {
      (byte) 0xA9, (byte) 0x9B, (byte) 0xC8, (byte) 0x32,
      (byte) 0x56, (byte) 0x35, (byte) 0xE3, (byte) 0x03
  };

  // Iteration count
  int iterationCount = 19;
  private final static String DES = "DES"; //��������㷨�������㷨���� DES,DESede,Blowfish

  public DESEncrypter(String passPhrase) throws SystemException {
	    try {
	      // Create the key
	      KeySpec keySpec = new PBEKeySpec(passPhrase.toCharArray(), salt,
	                                       iterationCount);
	      SecretKey key = SecretKeyFactory.getInstance("PBEWithMD5AndDES").
	          generateSecret(keySpec);
	      ecipher = Cipher.getInstance(key.getAlgorithm());
	      dcipher = Cipher.getInstance(key.getAlgorithm());

	      // Prepare the parameter to the ciphers
	      AlgorithmParameterSpec paramSpec = new PBEParameterSpec(salt,
	          iterationCount);

	      // Create the ciphers
	      ecipher.init(Cipher.ENCRYPT_MODE, key, paramSpec);
	      dcipher.init(Cipher.DECRYPT_MODE, key, paramSpec);
	    }
	    catch (InvalidAlgorithmParameterException ex) {
	      throw new SystemException(
	          "DESEncrypter.DESEncrypter.InvalidAlgorithmParameterException", ex);
	    }
	    catch (InvalidKeySpecException ex) {
	      throw new SystemException(
	          "DESEncrypter.DESEncrypter.InvalidKeySpecException", ex);
	    }
	    catch (NoSuchPaddingException ex) {
	      throw new SystemException(
	          "DESEncrypter.DESEncrypter.NoSuchPaddingException", ex);
	    }
	    catch (NoSuchAlgorithmException ex) {
	      throw new SystemException(
	          "DESEncrypter.DESEncrypter.NoSuchAlgorithmException", ex);
	    }
	    catch (InvalidKeyException ex) {
	      throw new SystemException(
	          "DESEncrypter.DESEncrypter.InvalidKeyException", ex);
	    }
	    catch (Exception ex) {
	      throw new SystemException(
	          "DESEncrypter.DESEncrypter.Exception", ex);
	    }
	  }
  public DESEncrypter(byte[] key) throws SystemException {
	    try {
	      // Create the key
//	    	DES�㷨Ҫ����һ�������ε������Դ 
	    	SecureRandom sr = new SecureRandom(); 
//	    	 ��ԭʼ�ܳ����ݴ���DESKeySpec���� 
	    	DESKeySpec dks = new DESKeySpec(key); 
//	    	 ����һ���ܳ׹�����Ȼ��������DESKeySpecת���� 
//	    	 һ��SecretKey���� 
	    	SecretKeyFactory keyFactory = SecretKeyFactory.getInstance(DES); 
	    	SecretKey securekey = keyFactory.generateSecret(dks); 

	      ecipher = Cipher.getInstance(DES); 
	      dcipher = Cipher.getInstance(DES);
	      // Create the ciphers 
	      ecipher.init(Cipher.ENCRYPT_MODE, securekey, sr); 
	      dcipher.init(Cipher.DECRYPT_MODE, securekey, sr);
	    }
	    
	    catch (InvalidKeySpecException ex) {
	      throw new SystemException(
	          "DESEncrypter.DESEncrypter.InvalidKeySpecException", ex);
	    }
	    catch (NoSuchPaddingException ex) {
	      throw new SystemException(
	          "DESEncrypter.DESEncrypter.NoSuchPaddingException", ex);
	    }
	    catch (NoSuchAlgorithmException ex) {
	      throw new SystemException(
	          "DESEncrypter.DESEncrypter.NoSuchAlgorithmException", ex);
	    }
	    catch (InvalidKeyException ex) {
	      throw new SystemException(
	          "DESEncrypter.DESEncrypter.InvalidKeyException", ex);
	    }
	    catch (Exception ex) {
	      throw new SystemException(
	          "DESEncrypter.DESEncrypter.Exception", ex);
	    }
	  }
  
  
  /**
   * 
   * author:zhoujx
   * description:���ݼ���
   * @param data
   * @return
   * @throws SystemException
   */
  public byte[] encrypt(byte[] data) throws SystemException {
	    byte[] enc = null;

	    try {
	      // Encrypt
	      enc = ecipher.doFinal(data);
	    }
	    catch (BadPaddingException ex) {
	    	ex.printStackTrace();
	      throw new SystemException(
	          "DESEncrypter.encrypt.BadPaddingException", ex);
	    }
	    catch (IllegalBlockSizeException ex) {
	      throw new SystemException(
	          "DESEncrypter.encrypt.IllegalBlockSizeException", ex);
	    }
	    catch (Exception ex) {
	      throw new SystemException(
	          "DESEncrypter.encrypt.Exception", ex);
	    }

	    return enc;
	  }
/**
 * 
 * author:zhoujx
 * description:���ݽ���
 * @param data
 * @return
 * @throws SystemException
 */
  public byte[] decrypt(byte[] data) throws SystemException {
	    byte[] dec = null;

	    try {
	      // Decrypt
	      dec = dcipher.doFinal(data);
	    }
	    catch (BadPaddingException ex) {
	    	ex.printStackTrace();
	      throw new SystemException(
	          "DESEncrypter.decrypt.BadPaddingException", ex);
	    }
	    catch (IllegalBlockSizeException ex) {
	      throw new SystemException(
	          "DESEncrypter.decrypt.IllegalBlockSizeException", ex);
	    }
	    catch (Exception ex) {
	      throw new SystemException(
	          "DESEncrypter.decrypt.Exception", ex);
	    }

	    return dec;
	  }

}