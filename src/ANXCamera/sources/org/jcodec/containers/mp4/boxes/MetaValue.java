package org.jcodec.containers.mp4.boxes;

import android.support.v4.internal.view.SupportMenu;
import java.nio.ByteBuffer;
import java.nio.ByteOrder;
import org.jcodec.platform.Platform;

public class MetaValue {
    public static final int TYPE_BMP = 27;
    public static final int TYPE_FLOAT_32 = 23;
    public static final int TYPE_FLOAT_64 = 24;
    public static final int TYPE_INT_16 = 66;
    public static final int TYPE_INT_32 = 67;
    public static final int TYPE_INT_8 = 65;
    public static final int TYPE_INT_V = 22;
    public static final int TYPE_JPEG = 13;
    public static final int TYPE_PNG = 13;
    public static final int TYPE_STRING_UTF16 = 2;
    public static final int TYPE_STRING_UTF8 = 1;
    public static final int TYPE_UINT_V = 21;
    private byte[] data;
    private int locale;
    private int type;

    private MetaValue(int i, int i2, byte[] bArr) {
        this.type = i;
        this.locale = i2;
        this.data = bArr;
    }

    public static MetaValue createInt(int i) {
        return new MetaValue(21, 0, fromInt(i));
    }

    public static MetaValue createFloat(float f) {
        return new MetaValue(23, 0, fromFloat(f));
    }

    public static MetaValue createString(String str) {
        return new MetaValue(1, 0, Platform.getBytesForCharset(str, "UTF-8"));
    }

    public static MetaValue createOther(int i, byte[] bArr) {
        return new MetaValue(i, 0, bArr);
    }

    public static MetaValue createOtherWithLocale(int i, int i2, byte[] bArr) {
        return new MetaValue(i, i2, bArr);
    }

    public int getInt() {
        if (this.type == 21 || this.type == 22) {
            switch (this.data.length) {
                case 1:
                    return this.data[0];
                case 2:
                    return toInt16(this.data);
                case 3:
                    return toInt24(this.data);
                case 4:
                    return toInt32(this.data);
            }
        }
        if (this.type == 65) {
            return this.data[0];
        }
        if (this.type == 66) {
            return toInt16(this.data);
        }
        if (this.type == 67) {
            return toInt32(this.data);
        }
        return 0;
    }

    public double getFloat() {
        if (this.type == 23) {
            return (double) toFloat(this.data);
        }
        if (this.type == 24) {
            return toDouble(this.data);
        }
        return 0.0d;
    }

    public String getString() {
        if (this.type == 1) {
            return Platform.stringFromCharset(this.data, "UTF-8");
        }
        if (this.type == 2) {
            return Platform.stringFromCharset(this.data, Platform.UTF_16BE);
        }
        return null;
    }

    public boolean isInt() {
        return this.type == 21 || this.type == 22 || this.type == 65 || this.type == 66 || this.type == 67;
    }

    public boolean isString() {
        return this.type == 1 || this.type == 2;
    }

    public boolean isFloat() {
        return this.type == 23 || this.type == 24;
    }

    public String toString() {
        if (isInt()) {
            return String.valueOf(getInt());
        }
        if (isFloat()) {
            return String.valueOf(getFloat());
        }
        if (isString()) {
            return String.valueOf(getString());
        }
        return "BLOB";
    }

    public int getType() {
        return this.type;
    }

    public int getLocale() {
        return this.locale;
    }

    public byte[] getData() {
        return this.data;
    }

    private static byte[] fromFloat(float f) {
        byte[] bArr = new byte[4];
        ByteBuffer wrap = ByteBuffer.wrap(bArr);
        wrap.order(ByteOrder.BIG_ENDIAN);
        wrap.putFloat(f);
        return bArr;
    }

    private static byte[] fromInt(int i) {
        byte[] bArr = new byte[4];
        ByteBuffer wrap = ByteBuffer.wrap(bArr);
        wrap.order(ByteOrder.BIG_ENDIAN);
        wrap.putInt(i);
        return bArr;
    }

    private int toInt16(byte[] bArr) {
        ByteBuffer wrap = ByteBuffer.wrap(bArr);
        wrap.order(ByteOrder.BIG_ENDIAN);
        return wrap.getShort();
    }

    private int toInt24(byte[] bArr) {
        ByteBuffer wrap = ByteBuffer.wrap(bArr);
        wrap.order(ByteOrder.BIG_ENDIAN);
        return (wrap.get() & 255) | ((wrap.getShort() & SupportMenu.USER_MASK) << 8);
    }

    private int toInt32(byte[] bArr) {
        ByteBuffer wrap = ByteBuffer.wrap(bArr);
        wrap.order(ByteOrder.BIG_ENDIAN);
        return wrap.getInt();
    }

    private float toFloat(byte[] bArr) {
        ByteBuffer wrap = ByteBuffer.wrap(bArr);
        wrap.order(ByteOrder.BIG_ENDIAN);
        return wrap.getFloat();
    }

    private double toDouble(byte[] bArr) {
        ByteBuffer wrap = ByteBuffer.wrap(bArr);
        wrap.order(ByteOrder.BIG_ENDIAN);
        return wrap.getDouble();
    }

    public boolean isBlob() {
        return (isFloat() || isInt() || isString()) ? false : true;
    }
}
