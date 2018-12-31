package com.android.camera.network.download;

import com.android.camera.log.Log;
import java.io.File;
import java.io.FileInputStream;
import java.io.InputStream;
import java.security.MessageDigest;
import java.util.Arrays;

public abstract class Verifier {
    private static final String TAG = "Verifier";
    private String mAlgorithm;
    private byte[] mHash;

    public static final class Md5 extends Verifier {
        private static final String ALGORITHM = "MD5";

        public Md5(byte[] bArr) {
            super(ALGORITHM, bArr);
        }

        public Md5(String str) {
            super(ALGORITHM, Verifier.decode(str, 32));
        }
    }

    public static final class Sha1 extends Verifier {
        private static final String ALGORITHM = "SHA-1";

        public Sha1(String str) {
            super(ALGORITHM, Verifier.decode(str, 40));
        }

        Sha1(byte[] bArr) {
            super(ALGORITHM, bArr);
        }
    }

    public Verifier(String str, byte[] bArr) {
        this.mAlgorithm = str;
        this.mHash = bArr;
    }

    public final boolean verify(byte[] bArr) {
        return Arrays.equals(bArr, this.mHash);
    }

    public MessageDigest getInstance() {
        try {
            return MessageDigest.getInstance(this.mAlgorithm);
        } catch (Throwable e) {
            Log.w(TAG, e);
            return null;
        }
    }

    private static byte[] decode(String str, int i) {
        if (str.length() == i) {
            byte[] bArr = new byte[(str.length() / 2)];
            int i2 = 0;
            while (i2 < str.length()) {
                int digit = Character.digit(str.charAt(i2), 16);
                if (digit != -1) {
                    int i3 = i2 / 2;
                    bArr[i3] = (byte) ((digit << (i2 % 2 == 0 ? 4 : 0)) | bArr[i3]);
                    i2++;
                } else {
                    StringBuilder stringBuilder = new StringBuilder();
                    stringBuilder.append(str);
                    stringBuilder.append(" is not a hex string");
                    throw new IllegalArgumentException(stringBuilder.toString());
                }
            }
            return bArr;
        }
        throw new IllegalArgumentException();
    }

    private static byte[] hash(File file, String str) {
        try {
            MessageDigest instance = MessageDigest.getInstance(str);
            try {
                InputStream fileInputStream = new FileInputStream(file);
                try {
                    byte[] bArr = new byte[8192];
                    while (true) {
                        int read = fileInputStream.read(bArr);
                        if (read <= 0) {
                            break;
                        }
                        instance.update(bArr, 0, read);
                    }
                    bArr = instance.digest();
                    try {
                        fileInputStream.close();
                    } catch (Throwable e) {
                        Log.w(TAG, e);
                    }
                    return bArr;
                } catch (Throwable e2) {
                    Log.w(TAG, e2);
                    try {
                        fileInputStream.close();
                    } catch (Throwable e22) {
                        Log.w(TAG, e22);
                    }
                    return null;
                } catch (Throwable e222) {
                    try {
                        fileInputStream.close();
                    } catch (Throwable e3) {
                        Log.w(TAG, e3);
                    }
                    throw e222;
                }
            } catch (Throwable e2222) {
                Log.w(TAG, e2222);
                return null;
            }
        } catch (Throwable e22222) {
            Log.w(TAG, e22222);
            return null;
        }
    }
}
