package com.google.protobuf.nano;

import java.nio.charset.Charset;
import java.util.Arrays;

public final class InternalNano {
    protected static final Charset ISO_8859_1 = Charset.forName("ISO-8859-1");
    public static final Object LAZY_INIT_LOCK = new Object();
    protected static final Charset UTF_8 = Charset.forName("UTF-8");

    private InternalNano() {
    }

    public static String stringDefaultValue(String str) {
        return new String(str.getBytes(ISO_8859_1), UTF_8);
    }

    public static byte[] bytesDefaultValue(String str) {
        return str.getBytes(ISO_8859_1);
    }

    public static byte[] copyFromUtf8(String str) {
        return str.getBytes(UTF_8);
    }

    public static boolean equals(int[] iArr, int[] iArr2) {
        if (iArr != null && iArr.length != 0) {
            return Arrays.equals(iArr, iArr2);
        }
        boolean z = iArr2 == null || iArr2.length == 0;
        return z;
    }

    public static boolean equals(long[] jArr, long[] jArr2) {
        if (jArr != null && jArr.length != 0) {
            return Arrays.equals(jArr, jArr2);
        }
        boolean z = jArr2 == null || jArr2.length == 0;
        return z;
    }

    public static boolean equals(float[] fArr, float[] fArr2) {
        if (fArr != null && fArr.length != 0) {
            return Arrays.equals(fArr, fArr2);
        }
        boolean z = fArr2 == null || fArr2.length == 0;
        return z;
    }

    public static boolean equals(double[] dArr, double[] dArr2) {
        if (dArr != null && dArr.length != 0) {
            return Arrays.equals(dArr, dArr2);
        }
        boolean z = dArr2 == null || dArr2.length == 0;
        return z;
    }

    public static boolean equals(boolean[] zArr, boolean[] zArr2) {
        if (zArr != null && zArr.length != 0) {
            return Arrays.equals(zArr, zArr2);
        }
        boolean z = zArr2 == null || zArr2.length == 0;
        return z;
    }

    public static boolean equals(byte[][] bArr, byte[][] bArr2) {
        int i;
        int i2;
        if (bArr == null) {
            i = 0;
        } else {
            i = bArr.length;
        }
        if (bArr2 == null) {
            i2 = 0;
        } else {
            i2 = bArr2.length;
        }
        int i3 = 0;
        int i4 = i3;
        while (true) {
            if (i3 >= i || bArr[i3] != null) {
                while (i4 < i2 && bArr2[i4] == null) {
                    i4++;
                }
                boolean z = i3 >= i;
                boolean z2 = i4 >= i2;
                if (z && z2) {
                    return true;
                }
                if (z != z2 || !Arrays.equals(bArr[i3], bArr2[i4])) {
                    return false;
                }
                i3++;
                i4++;
            } else {
                i3++;
            }
        }
    }

    public static boolean equals(Object[] objArr, Object[] objArr2) {
        int i;
        int i2;
        if (objArr == null) {
            i = 0;
        } else {
            i = objArr.length;
        }
        if (objArr2 == null) {
            i2 = 0;
        } else {
            i2 = objArr2.length;
        }
        int i3 = 0;
        int i4 = i3;
        while (true) {
            if (i3 >= i || objArr[i3] != null) {
                while (i4 < i2 && objArr2[i4] == null) {
                    i4++;
                }
                boolean z = i3 >= i;
                boolean z2 = i4 >= i2;
                if (z && z2) {
                    return true;
                }
                if (z != z2 || !objArr[i3].equals(objArr2[i4])) {
                    return false;
                }
                i3++;
                i4++;
            } else {
                i3++;
            }
        }
    }

    public static int hashCode(int[] iArr) {
        return (iArr == null || iArr.length == 0) ? 0 : Arrays.hashCode(iArr);
    }

    public static int hashCode(long[] jArr) {
        return (jArr == null || jArr.length == 0) ? 0 : Arrays.hashCode(jArr);
    }

    public static int hashCode(float[] fArr) {
        return (fArr == null || fArr.length == 0) ? 0 : Arrays.hashCode(fArr);
    }

    public static int hashCode(double[] dArr) {
        return (dArr == null || dArr.length == 0) ? 0 : Arrays.hashCode(dArr);
    }

    public static int hashCode(boolean[] zArr) {
        return (zArr == null || zArr.length == 0) ? 0 : Arrays.hashCode(zArr);
    }

    public static int hashCode(byte[][] bArr) {
        int i = 0;
        int length = bArr == null ? 0 : bArr.length;
        int i2 = 0;
        while (i < length) {
            byte[] bArr2 = bArr[i];
            if (bArr2 != null) {
                i2 = (31 * i2) + Arrays.hashCode(bArr2);
            }
            i++;
        }
        return i2;
    }

    public static int hashCode(Object[] objArr) {
        int i = 0;
        int length = objArr == null ? 0 : objArr.length;
        int i2 = 0;
        while (i < length) {
            Object obj = objArr[i];
            if (obj != null) {
                i2 = (31 * i2) + obj.hashCode();
            }
            i++;
        }
        return i2;
    }

    public static void cloneUnknownFieldData(ExtendableMessageNano extendableMessageNano, ExtendableMessageNano extendableMessageNano2) {
        if (extendableMessageNano.unknownFieldData != null) {
            extendableMessageNano2.unknownFieldData = extendableMessageNano.unknownFieldData.clone();
        }
    }
}
