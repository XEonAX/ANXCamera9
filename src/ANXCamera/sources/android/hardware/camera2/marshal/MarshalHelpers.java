package android.hardware.camera2.marshal;

import com.android.internal.util.Preconditions;

public final class MarshalHelpers {
    public static final int SIZEOF_BYTE = 1;
    public static final int SIZEOF_DOUBLE = 8;
    public static final int SIZEOF_FLOAT = 4;
    public static final int SIZEOF_INT32 = 4;
    public static final int SIZEOF_INT64 = 8;
    public static final int SIZEOF_RATIONAL = 8;

    public static int getPrimitiveTypeSize(int nativeType) {
        switch (nativeType) {
            case 0:
                return 1;
            case 1:
                return 4;
            case 2:
                return 4;
            case 3:
                return 8;
            case 4:
                return 8;
            case 5:
                return 8;
            default:
                StringBuilder stringBuilder = new StringBuilder();
                stringBuilder.append("Unknown type, can't get size for ");
                stringBuilder.append(nativeType);
                throw new UnsupportedOperationException(stringBuilder.toString());
        }
    }

    public static <T> Class<T> checkPrimitiveClass(Class<T> klass) {
        Preconditions.checkNotNull(klass, "klass must not be null");
        if (isPrimitiveClass(klass)) {
            return klass;
        }
        StringBuilder stringBuilder = new StringBuilder();
        stringBuilder.append("Unsupported class '");
        stringBuilder.append(klass);
        stringBuilder.append("'; expected a metadata primitive class");
        throw new UnsupportedOperationException(stringBuilder.toString());
    }

    /* JADX WARNING: Missing block: B:27:0x0038, code:
            return true;
     */
    /* JADX WARNING: Missing block: B:28:0x0039, code:
            return true;
     */
    /* JADX WARNING: Missing block: B:29:0x003a, code:
            return true;
     */
    /* JADX WARNING: Missing block: B:30:0x003b, code:
            return true;
     */
    /* JADX WARNING: Missing block: B:31:0x003c, code:
            return true;
     */
    public static <T> boolean isPrimitiveClass(java.lang.Class<T> r3) {
        /*
        r0 = 0;
        if (r3 != 0) goto L_0x0004;
    L_0x0003:
        return r0;
    L_0x0004:
        r1 = java.lang.Byte.TYPE;
        r2 = 1;
        if (r3 == r1) goto L_0x003c;
    L_0x0009:
        r1 = java.lang.Byte.class;
        if (r3 != r1) goto L_0x000e;
    L_0x000d:
        goto L_0x003c;
    L_0x000e:
        r1 = java.lang.Integer.TYPE;
        if (r3 == r1) goto L_0x003b;
    L_0x0012:
        r1 = java.lang.Integer.class;
        if (r3 != r1) goto L_0x0017;
    L_0x0016:
        goto L_0x003b;
    L_0x0017:
        r1 = java.lang.Float.TYPE;
        if (r3 == r1) goto L_0x003a;
    L_0x001b:
        r1 = java.lang.Float.class;
        if (r3 != r1) goto L_0x0020;
    L_0x001f:
        goto L_0x003a;
    L_0x0020:
        r1 = java.lang.Long.TYPE;
        if (r3 == r1) goto L_0x0039;
    L_0x0024:
        r1 = java.lang.Long.class;
        if (r3 != r1) goto L_0x0029;
    L_0x0028:
        goto L_0x0039;
    L_0x0029:
        r1 = java.lang.Double.TYPE;
        if (r3 == r1) goto L_0x0038;
    L_0x002d:
        r1 = java.lang.Double.class;
        if (r3 != r1) goto L_0x0032;
    L_0x0031:
        goto L_0x0038;
    L_0x0032:
        r1 = android.util.Rational.class;
        if (r3 != r1) goto L_0x0037;
    L_0x0036:
        return r2;
    L_0x0037:
        return r0;
    L_0x0038:
        return r2;
    L_0x0039:
        return r2;
    L_0x003a:
        return r2;
    L_0x003b:
        return r2;
    L_0x003c:
        return r2;
        */
        throw new UnsupportedOperationException("Method not decompiled: android.hardware.camera2.marshal.MarshalHelpers.isPrimitiveClass(java.lang.Class):boolean");
    }

    public static <T> Class<T> wrapClassIfPrimitive(Class<T> klass) {
        if (klass == Byte.TYPE) {
            return Byte.class;
        }
        if (klass == Integer.TYPE) {
            return Integer.class;
        }
        if (klass == Float.TYPE) {
            return Float.class;
        }
        if (klass == Long.TYPE) {
            return Long.class;
        }
        if (klass == Double.TYPE) {
            return Double.class;
        }
        return klass;
    }

    public static String toStringNativeType(int nativeType) {
        switch (nativeType) {
            case 0:
                return "TYPE_BYTE";
            case 1:
                return "TYPE_INT32";
            case 2:
                return "TYPE_FLOAT";
            case 3:
                return "TYPE_INT64";
            case 4:
                return "TYPE_DOUBLE";
            case 5:
                return "TYPE_RATIONAL";
            default:
                StringBuilder stringBuilder = new StringBuilder();
                stringBuilder.append("UNKNOWN(");
                stringBuilder.append(nativeType);
                stringBuilder.append(")");
                return stringBuilder.toString();
        }
    }

    public static int checkNativeType(int nativeType) {
        switch (nativeType) {
            case 0:
            case 1:
            case 2:
            case 3:
            case 4:
            case 5:
                return nativeType;
            default:
                StringBuilder stringBuilder = new StringBuilder();
                stringBuilder.append("Unknown nativeType ");
                stringBuilder.append(nativeType);
                throw new UnsupportedOperationException(stringBuilder.toString());
        }
    }

    public static int checkNativeTypeEquals(int expectedNativeType, int actualNativeType) {
        if (expectedNativeType == actualNativeType) {
            return actualNativeType;
        }
        throw new UnsupportedOperationException(String.format("Expected native type %d, but got %d", new Object[]{Integer.valueOf(expectedNativeType), Integer.valueOf(actualNativeType)}));
    }

    private MarshalHelpers() {
        throw new AssertionError();
    }
}
