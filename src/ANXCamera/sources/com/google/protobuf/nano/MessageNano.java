package com.google.protobuf.nano;

import java.io.IOException;

public abstract class MessageNano {
    public static final int UNSET_ENUM_VALUE = Integer.MIN_VALUE;
    protected volatile int cachedSize = -1;

    public interface GeneratedMapEntry {
    }

    public abstract MessageNano mergeFrom(CodedInputByteBufferNano codedInputByteBufferNano) throws IOException;

    public int getCachedSize() {
        if (this.cachedSize < 0) {
            getSerializedSize();
        }
        return this.cachedSize;
    }

    public int getSerializedSize() {
        int computeSerializedSize = computeSerializedSize();
        this.cachedSize = computeSerializedSize;
        return computeSerializedSize;
    }

    protected int computeSerializedSize() {
        return 0;
    }

    public void writeTo(CodedOutputByteBufferNano codedOutputByteBufferNano) throws IOException {
    }

    public static final byte[] toByteArray(MessageNano messageNano) {
        byte[] bArr = new byte[messageNano.getSerializedSize()];
        toByteArray(messageNano, bArr, 0, bArr.length);
        return bArr;
    }

    public static final void toByteArray(MessageNano messageNano, byte[] bArr, int i, int i2) {
        try {
            CodedOutputByteBufferNano newInstance = CodedOutputByteBufferNano.newInstance(bArr, i, i2);
            messageNano.writeTo(newInstance);
            newInstance.checkNoSpaceLeft();
        } catch (Throwable e) {
            throw new RuntimeException("Serializing to a byte array threw an IOException (should never happen).", e);
        }
    }

    public static final <T extends MessageNano> T mergeFrom(T t, byte[] bArr) throws InvalidProtocolBufferNanoException {
        return mergeFrom(t, bArr, 0, bArr.length);
    }

    public static final <T extends MessageNano> T mergeFrom(T t, byte[] bArr, int i, int i2) throws InvalidProtocolBufferNanoException {
        try {
            CodedInputByteBufferNano newInstance = CodedInputByteBufferNano.newInstance(bArr, i, i2);
            t.mergeFrom(newInstance);
            newInstance.checkLastTagWas(0);
            return t;
        } catch (InvalidProtocolBufferNanoException e) {
            throw e;
        } catch (Throwable e2) {
            throw new RuntimeException("Reading from a byte array threw an IOException (should never happen).", e2);
        }
    }

    public static final <T extends MessageNano> T cloneUsingSerialization(T t) {
        try {
            return mergeFrom((MessageNano) t.getClass().getConstructor(new Class[0]).newInstance(new Object[0]), toByteArray(t));
        } catch (Throwable e) {
            throw new IllegalStateException(e);
        } catch (Throwable e2) {
            throw new IllegalStateException(e2);
        } catch (Throwable e22) {
            throw new IllegalStateException(e22);
        } catch (Throwable e222) {
            throw new IllegalStateException(e222);
        } catch (Throwable e2222) {
            throw new IllegalStateException(e2222);
        }
    }

    /* JADX WARNING: Missing block: B:14:0x002f, code:
            return false;
     */
    public static final boolean messageNanoEquals(com.google.protobuf.nano.MessageNano r4, com.google.protobuf.nano.MessageNano r5) {
        /*
        if (r4 != r5) goto L_0x0004;
    L_0x0002:
        r4 = 1;
        return r4;
    L_0x0004:
        r0 = 0;
        if (r4 == 0) goto L_0x002f;
    L_0x0007:
        if (r5 != 0) goto L_0x000a;
    L_0x0009:
        goto L_0x002f;
    L_0x000a:
        r1 = r4.getClass();
        r2 = r5.getClass();
        if (r1 == r2) goto L_0x0015;
    L_0x0014:
        return r0;
    L_0x0015:
        r1 = r4.getSerializedSize();
        r2 = r5.getSerializedSize();
        if (r2 == r1) goto L_0x0020;
    L_0x001f:
        return r0;
    L_0x0020:
        r2 = new byte[r1];
        r3 = new byte[r1];
        toByteArray(r4, r2, r0, r1);
        toByteArray(r5, r3, r0, r1);
        r4 = java.util.Arrays.equals(r2, r3);
        return r4;
    L_0x002f:
        return r0;
        */
        throw new UnsupportedOperationException("Method not decompiled: com.google.protobuf.nano.MessageNano.messageNanoEquals(com.google.protobuf.nano.MessageNano, com.google.protobuf.nano.MessageNano):boolean");
    }

    public String toString() {
        return MessageNanoPrinter.print(this);
    }

    public MessageNano clone() throws CloneNotSupportedException {
        return (MessageNano) super.clone();
    }
}
