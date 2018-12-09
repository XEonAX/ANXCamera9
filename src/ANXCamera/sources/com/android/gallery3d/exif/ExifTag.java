package com.android.gallery3d.exif;

import com.android.camera.network.net.base.HTTP;
import java.nio.charset.Charset;
import java.text.SimpleDateFormat;
import java.util.Arrays;
import java.util.Date;
import java.util.Locale;

public class ExifTag {
    private static final long LONG_MAX = 2147483647L;
    private static final long LONG_MIN = -2147483648L;
    static final int SIZE_UNDEFINED = 0;
    private static final SimpleDateFormat TIME_FORMAT = new SimpleDateFormat("yyyy:MM:dd kk:mm:ss");
    public static final short TYPE_ASCII = (short) 2;
    public static final short TYPE_LONG = (short) 9;
    public static final short TYPE_RATIONAL = (short) 10;
    private static final int[] TYPE_TO_SIZE_MAP = new int[11];
    public static final short TYPE_UNDEFINED = (short) 7;
    public static final short TYPE_UNSIGNED_BYTE = (short) 1;
    public static final short TYPE_UNSIGNED_LONG = (short) 4;
    public static final short TYPE_UNSIGNED_RATIONAL = (short) 5;
    public static final short TYPE_UNSIGNED_SHORT = (short) 3;
    private static final long UNSIGNED_LONG_MAX = 4294967295L;
    private static final int UNSIGNED_SHORT_MAX = 65535;
    private static Charset US_ASCII = Charset.forName("US-ASCII");
    private int mComponentCountActual;
    private final short mDataType;
    private boolean mHasDefinedDefaultComponentCount;
    private int mIfd;
    private int mOffset;
    private final short mTagId;
    private Object mValue = null;

    static {
        TYPE_TO_SIZE_MAP[1] = 1;
        TYPE_TO_SIZE_MAP[2] = 1;
        TYPE_TO_SIZE_MAP[3] = 2;
        TYPE_TO_SIZE_MAP[4] = 4;
        TYPE_TO_SIZE_MAP[5] = 8;
        TYPE_TO_SIZE_MAP[7] = 1;
        TYPE_TO_SIZE_MAP[9] = 4;
        TYPE_TO_SIZE_MAP[10] = 8;
    }

    public static boolean isValidIfd(int i) {
        return i == 0 || i == 1 || i == 2 || i == 3 || i == 4;
    }

    public static boolean isValidType(short s) {
        return s == (short) 1 || s == (short) 2 || s == (short) 3 || s == (short) 4 || s == (short) 5 || s == (short) 7 || s == (short) 9 || s == (short) 10;
    }

    ExifTag(short s, short s2, int i, int i2, boolean z) {
        this.mTagId = s;
        this.mDataType = s2;
        this.mComponentCountActual = i;
        this.mHasDefinedDefaultComponentCount = z;
        this.mIfd = i2;
    }

    public static int getElementSize(short s) {
        return TYPE_TO_SIZE_MAP[s];
    }

    public int getIfd() {
        return this.mIfd;
    }

    protected void setIfd(int i) {
        this.mIfd = i;
    }

    public short getTagId() {
        return this.mTagId;
    }

    public short getDataType() {
        return this.mDataType;
    }

    public int getDataSize() {
        return getComponentCount() * getElementSize(getDataType());
    }

    public int getComponentCount() {
        return this.mComponentCountActual;
    }

    protected void forceSetComponentCount(int i) {
        this.mComponentCountActual = i;
    }

    public boolean hasValue() {
        return this.mValue != null;
    }

    public boolean setValue(int[] iArr) {
        int i = 0;
        if (checkBadComponentCount(iArr.length)) {
            return false;
        }
        if (this.mDataType != (short) 3 && this.mDataType != (short) 9 && this.mDataType != (short) 4) {
            return false;
        }
        if (this.mDataType == (short) 3 && checkOverflowForUnsignedShort(iArr)) {
            return false;
        }
        if (this.mDataType == (short) 4 && checkOverflowForUnsignedLong(iArr)) {
            return false;
        }
        Object obj = new long[iArr.length];
        while (i < iArr.length) {
            obj[i] = (long) iArr[i];
            i++;
        }
        this.mValue = obj;
        this.mComponentCountActual = iArr.length;
        return true;
    }

    public boolean setValue(int i) {
        return setValue(new int[]{i});
    }

    /* JADX WARNING: Missing block: B:9:0x001c, code:
            return false;
     */
    public boolean setValue(long[] r4) {
        /*
        r3 = this;
        r0 = r4.length;
        r0 = r3.checkBadComponentCount(r0);
        r1 = 0;
        if (r0 != 0) goto L_0x001c;
    L_0x0008:
        r0 = r3.mDataType;
        r2 = 4;
        if (r0 == r2) goto L_0x000e;
    L_0x000d:
        goto L_0x001c;
    L_0x000e:
        r0 = r3.checkOverflowForUnsignedLong(r4);
        if (r0 == 0) goto L_0x0015;
    L_0x0014:
        return r1;
    L_0x0015:
        r3.mValue = r4;
        r4 = r4.length;
        r3.mComponentCountActual = r4;
        r4 = 1;
        return r4;
    L_0x001c:
        return r1;
        */
        throw new UnsupportedOperationException("Method not decompiled: com.android.gallery3d.exif.ExifTag.setValue(long[]):boolean");
    }

    public boolean setValue(long j) {
        return setValue(new long[]{j});
    }

    public boolean setValue(String str) {
        if (this.mDataType != (short) 2 && this.mDataType != (short) 7) {
            return false;
        }
        Object bytes = str.getBytes(US_ASCII);
        if (bytes.length > 0) {
            if (!(bytes[bytes.length - 1] == (byte) 0 || this.mDataType == (short) 7)) {
                bytes = Arrays.copyOf(bytes, bytes.length + 1);
                this.mComponentCountActual++;
            }
        } else if (this.mDataType == (short) 2 && this.mComponentCountActual == 1) {
            bytes = new byte[]{null};
        }
        int length = bytes.length;
        if (checkBadComponentCount(length)) {
            return false;
        }
        this.mComponentCountActual = length;
        this.mValue = bytes;
        return true;
    }

    public boolean setValue(Rational[] rationalArr) {
        if (checkBadComponentCount(rationalArr.length)) {
            return false;
        }
        if (this.mDataType != (short) 5 && this.mDataType != (short) 10) {
            return false;
        }
        if (this.mDataType == (short) 5 && checkOverflowForUnsignedRational(rationalArr)) {
            return false;
        }
        if (this.mDataType == (short) 10 && checkOverflowForRational(rationalArr)) {
            return false;
        }
        this.mValue = rationalArr;
        this.mComponentCountActual = rationalArr.length;
        return true;
    }

    public boolean setValue(Rational rational) {
        return setValue(new Rational[]{rational});
    }

    public boolean setValue(byte[] bArr, int i, int i2) {
        if (checkBadComponentCount(i2)) {
            return false;
        }
        if (this.mDataType != (short) 1 && this.mDataType != (short) 7) {
            return false;
        }
        this.mValue = new byte[i2];
        System.arraycopy(bArr, i, this.mValue, 0, i2);
        this.mComponentCountActual = i2;
        return true;
    }

    public boolean setValue(byte[] bArr) {
        return setValue(bArr, 0, bArr.length);
    }

    public boolean setValue(byte b) {
        return setValue(new byte[]{b});
    }

    public boolean setValue(Object obj) {
        int i = 0;
        if (obj == null) {
            return false;
        }
        if (obj instanceof Short) {
            return setValue(((Short) obj).shortValue() & UNSIGNED_SHORT_MAX);
        }
        if (obj instanceof String) {
            return setValue((String) obj);
        }
        if (obj instanceof int[]) {
            return setValue((int[]) obj);
        }
        if (obj instanceof long[]) {
            return setValue((long[]) obj);
        }
        if (obj instanceof Rational) {
            return setValue((Rational) obj);
        }
        if (obj instanceof Rational[]) {
            return setValue((Rational[]) obj);
        }
        if (obj instanceof byte[]) {
            return setValue((byte[]) obj);
        }
        if (obj instanceof Integer) {
            return setValue(((Integer) obj).intValue());
        }
        if (obj instanceof Long) {
            return setValue(((Long) obj).longValue());
        }
        if (obj instanceof Byte) {
            return setValue(((Byte) obj).byteValue());
        }
        int[] iArr;
        int i2;
        if (obj instanceof Short[]) {
            Short[] shArr = (Short[]) obj;
            iArr = new int[shArr.length];
            for (int i3 = 0; i3 < shArr.length; i3++) {
                iArr[i3] = shArr[i3] == null ? 0 : shArr[i3].shortValue() & UNSIGNED_SHORT_MAX;
            }
            return setValue(iArr);
        } else if (obj instanceof Integer[]) {
            Integer[] numArr = (Integer[]) obj;
            iArr = new int[numArr.length];
            for (i2 = 0; i2 < numArr.length; i2++) {
                iArr[i2] = numArr[i2] == null ? 0 : numArr[i2].intValue();
            }
            return setValue(iArr);
        } else if (obj instanceof Long[]) {
            Long[] lArr = (Long[]) obj;
            long[] jArr = new long[lArr.length];
            while (i < lArr.length) {
                jArr[i] = lArr[i] == null ? 0 : lArr[i].longValue();
                i++;
            }
            return setValue(jArr);
        } else if (!(obj instanceof Byte[])) {
            return false;
        } else {
            Byte[] bArr = (Byte[]) obj;
            byte[] bArr2 = new byte[bArr.length];
            for (i2 = 0; i2 < bArr.length; i2++) {
                bArr2[i2] = bArr[i2] == null ? (byte) 0 : bArr[i2].byteValue();
            }
            return setValue(bArr2);
        }
    }

    public boolean setTimeValue(long j) {
        boolean value;
        synchronized (TIME_FORMAT) {
            value = setValue(TIME_FORMAT.format(new Date(j)));
        }
        return value;
    }

    public String getValueAsString() {
        if (this.mValue == null) {
            return null;
        }
        if (this.mValue instanceof String) {
            return (String) this.mValue;
        }
        if (this.mValue instanceof byte[]) {
            return new String((byte[]) this.mValue, US_ASCII);
        }
        return null;
    }

    public String getValueAsString(String str) {
        String valueAsString = getValueAsString();
        if (valueAsString == null) {
            return str;
        }
        return valueAsString;
    }

    public byte[] getValueAsBytes() {
        if (this.mValue instanceof byte[]) {
            return (byte[]) this.mValue;
        }
        return null;
    }

    public byte getValueAsByte(byte b) {
        byte[] valueAsBytes = getValueAsBytes();
        if (valueAsBytes == null || valueAsBytes.length < 1) {
            return b;
        }
        return valueAsBytes[0];
    }

    public Rational[] getValueAsRationals() {
        if (this.mValue instanceof Rational[]) {
            return (Rational[]) this.mValue;
        }
        return null;
    }

    public Rational getValueAsRational(Rational rational) {
        Rational[] valueAsRationals = getValueAsRationals();
        if (valueAsRationals == null || valueAsRationals.length < 1) {
            return rational;
        }
        return valueAsRationals[0];
    }

    public Rational getValueAsRational(long j) {
        return getValueAsRational(new Rational(j, 1));
    }

    public int[] getValueAsInts() {
        if (this.mValue == null || !(this.mValue instanceof long[])) {
            return null;
        }
        long[] jArr = (long[]) this.mValue;
        int[] iArr = new int[jArr.length];
        for (int i = 0; i < jArr.length; i++) {
            iArr[i] = (int) jArr[i];
        }
        return iArr;
    }

    public int getValueAsInt(int i) {
        int[] valueAsInts = getValueAsInts();
        if (valueAsInts == null || valueAsInts.length < 1) {
            return i;
        }
        return valueAsInts[0];
    }

    public long[] getValueAsLongs() {
        if (this.mValue instanceof long[]) {
            return (long[]) this.mValue;
        }
        return null;
    }

    public long getValueAsLong(long j) {
        long[] valueAsLongs = getValueAsLongs();
        if (valueAsLongs == null || valueAsLongs.length < 1) {
            return j;
        }
        return valueAsLongs[0];
    }

    public Object getValue() {
        return this.mValue;
    }

    public long forceGetValueAsLong(long j) {
        long[] valueAsLongs = getValueAsLongs();
        if (valueAsLongs != null && valueAsLongs.length >= 1) {
            return valueAsLongs[0];
        }
        byte[] valueAsBytes = getValueAsBytes();
        if (valueAsBytes != null && valueAsBytes.length >= 1) {
            return (long) valueAsBytes[0];
        }
        Rational[] valueAsRationals = getValueAsRationals();
        if (valueAsRationals == null || valueAsRationals.length < 1 || valueAsRationals[0].getDenominator() == 0) {
            return j;
        }
        return (long) valueAsRationals[0].toDouble();
    }

    public String forceGetValueAsString() {
        if (this.mValue == null) {
            return "";
        }
        if (this.mValue instanceof byte[]) {
            if (this.mDataType == (short) 2) {
                return new String((byte[]) this.mValue, US_ASCII);
            }
            return Arrays.toString((byte[]) this.mValue);
        } else if (this.mValue instanceof long[]) {
            if (((long[]) this.mValue).length == 1) {
                return String.valueOf(((long[]) this.mValue)[0]);
            }
            return Arrays.toString((long[]) this.mValue);
        } else if (!(this.mValue instanceof Object[])) {
            return this.mValue.toString();
        } else {
            if (((Object[]) this.mValue).length != 1) {
                return Arrays.toString((Object[]) this.mValue);
            }
            Object obj = ((Object[]) this.mValue)[0];
            if (obj == null) {
                return "";
            }
            return obj.toString();
        }
    }

    protected long getValueAt(int i) {
        if (this.mValue instanceof long[]) {
            return ((long[]) this.mValue)[i];
        }
        if (this.mValue instanceof byte[]) {
            return (long) ((byte[]) this.mValue)[i];
        }
        StringBuilder stringBuilder = new StringBuilder();
        stringBuilder.append("Cannot get integer value from ");
        stringBuilder.append(convertTypeToString(this.mDataType));
        throw new IllegalArgumentException(stringBuilder.toString());
    }

    protected String getString() {
        if (this.mDataType == (short) 2) {
            return new String((byte[]) this.mValue, US_ASCII);
        }
        StringBuilder stringBuilder = new StringBuilder();
        stringBuilder.append("Cannot get ASCII value from ");
        stringBuilder.append(convertTypeToString(this.mDataType));
        throw new IllegalArgumentException(stringBuilder.toString());
    }

    protected byte[] getStringByte() {
        return (byte[]) this.mValue;
    }

    protected Rational getRational(int i) {
        if (this.mDataType == (short) 10 || this.mDataType == (short) 5) {
            return ((Rational[]) this.mValue)[i];
        }
        StringBuilder stringBuilder = new StringBuilder();
        stringBuilder.append("Cannot get RATIONAL value from ");
        stringBuilder.append(convertTypeToString(this.mDataType));
        throw new IllegalArgumentException(stringBuilder.toString());
    }

    protected void getBytes(byte[] bArr) {
        getBytes(bArr, 0, bArr.length);
    }

    protected void getBytes(byte[] bArr, int i, int i2) {
        if (this.mDataType == (short) 7 || this.mDataType == (short) 1) {
            Object obj = this.mValue;
            if (i2 > this.mComponentCountActual) {
                i2 = this.mComponentCountActual;
            }
            System.arraycopy(obj, 0, bArr, i, i2);
            return;
        }
        StringBuilder stringBuilder = new StringBuilder();
        stringBuilder.append("Cannot get BYTE value from ");
        stringBuilder.append(convertTypeToString(this.mDataType));
        throw new IllegalArgumentException(stringBuilder.toString());
    }

    protected int getOffset() {
        return this.mOffset;
    }

    protected void setOffset(int i) {
        this.mOffset = i;
    }

    protected void setHasDefinedCount(boolean z) {
        this.mHasDefinedDefaultComponentCount = z;
    }

    protected boolean hasDefinedCount() {
        return this.mHasDefinedDefaultComponentCount;
    }

    private boolean checkBadComponentCount(int i) {
        if (!this.mHasDefinedDefaultComponentCount || this.mComponentCountActual == i) {
            return false;
        }
        return true;
    }

    private static String convertTypeToString(short s) {
        switch (s) {
            case (short) 1:
                return "UNSIGNED_BYTE";
            case (short) 2:
                return HTTP.ASCII;
            case (short) 3:
                return "UNSIGNED_SHORT";
            case (short) 4:
                return "UNSIGNED_LONG";
            case (short) 5:
                return "UNSIGNED_RATIONAL";
            case (short) 7:
                return "UNDEFINED";
            case (short) 9:
                return "LONG";
            case (short) 10:
                return "RATIONAL";
            default:
                return "";
        }
    }

    private boolean checkOverflowForUnsignedShort(int[] iArr) {
        for (int i : iArr) {
            if (i > UNSIGNED_SHORT_MAX || i < 0) {
                return true;
            }
        }
        return false;
    }

    private boolean checkOverflowForUnsignedLong(long[] jArr) {
        for (long j : jArr) {
            if (j < 0 || j > UNSIGNED_LONG_MAX) {
                return true;
            }
        }
        return false;
    }

    private boolean checkOverflowForUnsignedLong(int[] iArr) {
        for (int i : iArr) {
            if (i < 0) {
                return true;
            }
        }
        return false;
    }

    private boolean checkOverflowForUnsignedRational(Rational[] rationalArr) {
        for (Rational rational : rationalArr) {
            if (rational.getNumerator() < 0 || rational.getDenominator() < 0 || rational.getNumerator() > UNSIGNED_LONG_MAX || rational.getDenominator() > UNSIGNED_LONG_MAX) {
                return true;
            }
        }
        return false;
    }

    private boolean checkOverflowForRational(Rational[] rationalArr) {
        for (Rational rational : rationalArr) {
            if (rational.getNumerator() < LONG_MIN || rational.getDenominator() < LONG_MIN || rational.getNumerator() > LONG_MAX || rational.getDenominator() > LONG_MAX) {
                return true;
            }
        }
        return false;
    }

    public boolean equals(Object obj) {
        boolean z = false;
        if (obj == null || !(obj instanceof ExifTag)) {
            return false;
        }
        ExifTag exifTag = (ExifTag) obj;
        if (exifTag.mTagId != this.mTagId || exifTag.mComponentCountActual != this.mComponentCountActual || exifTag.mDataType != this.mDataType) {
            return false;
        }
        if (this.mValue == null) {
            if (exifTag.mValue == null) {
                z = true;
            }
            return z;
        } else if (exifTag.mValue == null) {
            return false;
        } else {
            if (this.mValue instanceof long[]) {
                if (exifTag.mValue instanceof long[]) {
                    return Arrays.equals((long[]) this.mValue, (long[]) exifTag.mValue);
                }
                return false;
            } else if (this.mValue instanceof Rational[]) {
                if (exifTag.mValue instanceof Rational[]) {
                    return Arrays.equals((Rational[]) this.mValue, (Rational[]) exifTag.mValue);
                }
                return false;
            } else if (!(this.mValue instanceof byte[])) {
                return this.mValue.equals(exifTag.mValue);
            } else {
                if (exifTag.mValue instanceof byte[]) {
                    return Arrays.equals((byte[]) this.mValue, (byte[]) exifTag.mValue);
                }
                return false;
            }
        }
    }

    public String toString() {
        StringBuilder stringBuilder = new StringBuilder();
        stringBuilder.append(String.format(Locale.ENGLISH, "tag id: %04X\n", new Object[]{Short.valueOf(this.mTagId)}));
        stringBuilder.append("ifd id: ");
        stringBuilder.append(this.mIfd);
        stringBuilder.append("\ntype: ");
        stringBuilder.append(convertTypeToString(this.mDataType));
        stringBuilder.append("\ncount: ");
        stringBuilder.append(this.mComponentCountActual);
        stringBuilder.append("\noffset: ");
        stringBuilder.append(this.mOffset);
        stringBuilder.append("\nvalue: ");
        stringBuilder.append(forceGetValueAsString());
        stringBuilder.append("\n");
        return stringBuilder.toString();
    }
}
