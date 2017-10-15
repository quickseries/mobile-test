/*******************************************************************************
 * Smartika inc.
 * <p>
 * Copyright (c) 2000-2015 Artika For Living Inc.
 * All rights reserved.
 * <p>
 * This software is the confidential and proprietary information of Smartika
 * ("Confidential Information"). You shall not disclose such Confidential
 * Information and shall use it only in accordance with the terms of the
 * license agreement you entered into with Smartika.
 * <p>
 * Created by Anou Chanthavong on 2016-05-26.
 ******************************************************************************/
package com.anoulong.quickseries.manager;

import android.content.SharedPreferences;
import android.util.Base64;

import org.apache.commons.lang3.StringUtils;

import java.io.UnsupportedEncodingException;
import java.security.InvalidAlgorithmParameterException;
import java.security.InvalidKeyException;
import java.security.NoSuchAlgorithmException;

import javax.crypto.BadPaddingException;
import javax.crypto.Cipher;
import javax.crypto.IllegalBlockSizeException;
import javax.crypto.NoSuchPaddingException;
import javax.crypto.spec.IvParameterSpec;
import javax.crypto.spec.SecretKeySpec;

import timber.log.Timber;

/**
 * Provides cryptography methods to allow encryption and decryption of local stored data such as shared preferences
 */
public class EncryptionManager {

    public static final String TAG = EncryptionManager.class.getSimpleName();
    private static final String ALGORITHM = "AES";
    private static final String CIPHER = "AES/CBC/PKCS5Padding";
    private static final String ENCODING = "UTF8";
    private static final String INITIALIZATION_VECTOR = "e36dc751d0433f05"; // should be 16 byte length
    private static final String AES_KEY = "d2cb415e067c7b13"; // should be 16 byte length

    private static final SecretKeySpec mSecretKeySpec = new SecretKeySpec(AES_KEY.getBytes(), ALGORITHM);
    private static final IvParameterSpec mIvParameterSpec = new IvParameterSpec(INITIALIZATION_VECTOR.getBytes());


    private final SharedPreferences sharedPreferences;

    public EncryptionManager(SharedPreferences sharedPreferences) {
        this.sharedPreferences = sharedPreferences;
    }

    /**
     * Get the String encrypted value associated with the key on the secure shared preferences
     *
     * @param key               The SharedPreferences key
     * @param defaultValue      The default value if nothing if found on the SharedPreferences
     */
    public String getStringFromSecureSharedPreferences(String key, String defaultValue) {
        if (sharedPreferences == null || StringUtils.isBlank(key)) {
            throw new IllegalArgumentException();
        }

        return this.decrypt(sharedPreferences.getString(key, defaultValue));
    }

    /**
     * Set a String pair key/encrypted value on the secure shared preferences
     *
     * @param key               The SharedPreferences key
     * @param value             The value to set
     */
    public void setStringToSecureSharedPreferences(String key, String value) {
        if (sharedPreferences == null || StringUtils.isBlank(key) || StringUtils.isBlank(value)) {
            throw new IllegalArgumentException();
        }

        SharedPreferences.Editor editor = sharedPreferences.edit();
        editor.putString(key, this.encrypt(value));
        editor.apply();
    }

    /**
     * Encrypt String associated with a key
     *
     * @param value The value to encrypt
     * @return encrypted string
     */
    public String encrypt(String value) {
        if (StringUtils.isBlank(value)) {
            throw new IllegalArgumentException();
        }

        String encryptedText = "";

        try {
            Cipher cipher = Cipher.getInstance(CIPHER);
            cipher.init(Cipher.ENCRYPT_MODE, mSecretKeySpec, mIvParameterSpec);
            encryptedText = Base64.encodeToString(cipher.doFinal(value.getBytes()), Base64.NO_CLOSE);
        } catch (NoSuchAlgorithmException e) {
            Timber.e("Algorithm not found.");
        } catch (NoSuchPaddingException | BadPaddingException | IllegalBlockSizeException e) {
            Timber.e("Exception during encrypt");
        } catch (InvalidKeyException e) {
            Timber.e("No valid key provided.");
        } catch (InvalidAlgorithmParameterException e) {
            Timber.e("Algorithm parameter specification is invalid");
        }

        return encryptedText;
    }

    /**
     * Decrypt secure String associated to the key
     *
     * @param value The value to decrypt
     * @return decrypted string
     */
    public String decrypt(String value) {
        String decryptedText = "";
        try {
            if (StringUtils.isNotBlank(value)) {
                Cipher cipher = Cipher.getInstance(CIPHER);
                cipher.init(Cipher.DECRYPT_MODE, mSecretKeySpec, mIvParameterSpec);
                decryptedText = new String(cipher.doFinal(Base64.decode(value, Base64.NO_CLOSE)), ENCODING);
                return decryptedText;
            }
        } catch (NoSuchAlgorithmException e) {
            Timber.e("Algorithm not found.");
        } catch (NoSuchPaddingException | IllegalBlockSizeException | BadPaddingException e) {
            Timber.e("Exception during decrypt");
        } catch (InvalidKeyException e) {
            Timber.e("No valid key provided.");
        } catch (InvalidAlgorithmParameterException e) {
            Timber.e("Algorithm parameter specification is invalid");
        } catch (UnsupportedEncodingException e) {
            Timber.e("Character to convert is unavailable");
        }

        return decryptedText;
    }
}
