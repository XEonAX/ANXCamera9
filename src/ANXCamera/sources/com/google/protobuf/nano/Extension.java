package com.google.protobuf.nano;

import com.google.protobuf.CodedOutputStream;
import com.google.protobuf.GeneratedMessageLite;
import com.google.protobuf.MessageLite;
import java.io.IOException;
import java.lang.reflect.Array;
import java.util.ArrayList;
import java.util.List;

public class Extension<M extends ExtendableMessageNano<M>, T> {
    public static final int TYPE_BOOL = 8;
    public static final int TYPE_BYTES = 12;
    public static final int TYPE_DOUBLE = 1;
    public static final int TYPE_ENUM = 14;
    public static final int TYPE_FIXED32 = 7;
    public static final int TYPE_FIXED64 = 6;
    public static final int TYPE_FLOAT = 2;
    public static final int TYPE_GROUP = 10;
    public static final int TYPE_INT32 = 5;
    public static final int TYPE_INT64 = 3;
    public static final int TYPE_MESSAGE = 11;
    public static final int TYPE_SFIXED32 = 15;
    public static final int TYPE_SFIXED64 = 16;
    public static final int TYPE_SINT32 = 17;
    public static final int TYPE_SINT64 = 18;
    public static final int TYPE_STRING = 9;
    public static final int TYPE_UINT32 = 13;
    public static final int TYPE_UINT64 = 4;
    protected final Class<T> clazz;
    protected final GeneratedMessageLite<?, ?> defaultInstance;
    protected final boolean repeated;
    public final int tag;
    protected final int type;

    private static class PrimitiveExtension<M extends ExtendableMessageNano<M>, T> extends Extension<M, T> {
        private final int nonPackedTag;
        private final int packedTag;

        public PrimitiveExtension(int i, Class<T> cls, int i2, boolean z, int i3, int i4) {
            super(i, (Class) cls, i2, z, null);
            this.nonPackedTag = i3;
            this.packedTag = i4;
        }

        protected Object readData(CodedInputByteBufferNano codedInputByteBufferNano) {
            try {
                switch (this.type) {
                    case 1:
                        return Double.valueOf(codedInputByteBufferNano.readDouble());
                    case 2:
                        return Float.valueOf(codedInputByteBufferNano.readFloat());
                    case 3:
                        return Long.valueOf(codedInputByteBufferNano.readInt64());
                    case 4:
                        return Long.valueOf(codedInputByteBufferNano.readUInt64());
                    case 5:
                        return Integer.valueOf(codedInputByteBufferNano.readInt32());
                    case 6:
                        return Long.valueOf(codedInputByteBufferNano.readFixed64());
                    case 7:
                        return Integer.valueOf(codedInputByteBufferNano.readFixed32());
                    case 8:
                        return Boolean.valueOf(codedInputByteBufferNano.readBool());
                    case 9:
                        return codedInputByteBufferNano.readString();
                    case 12:
                        return codedInputByteBufferNano.readBytes();
                    case 13:
                        return Integer.valueOf(codedInputByteBufferNano.readUInt32());
                    case 14:
                        return Integer.valueOf(codedInputByteBufferNano.readEnum());
                    case 15:
                        return Integer.valueOf(codedInputByteBufferNano.readSFixed32());
                    case 16:
                        return Long.valueOf(codedInputByteBufferNano.readSFixed64());
                    case 17:
                        return Integer.valueOf(codedInputByteBufferNano.readSInt32());
                    case 18:
                        return Long.valueOf(codedInputByteBufferNano.readSInt64());
                    default:
                        int i = this.type;
                        StringBuilder stringBuilder = new StringBuilder(24);
                        stringBuilder.append("Unknown type ");
                        stringBuilder.append(i);
                        throw new IllegalArgumentException(stringBuilder.toString());
                }
            } catch (Throwable e) {
                throw new IllegalArgumentException("Error reading extension field", e);
            }
        }

        protected void readDataInto(UnknownFieldData unknownFieldData, List<Object> list) {
            if (unknownFieldData.tag == this.nonPackedTag) {
                list.add(readData(CodedInputByteBufferNano.newInstance(unknownFieldData.bytes)));
                return;
            }
            CodedInputByteBufferNano newInstance = CodedInputByteBufferNano.newInstance(unknownFieldData.bytes);
            try {
                newInstance.pushLimit(newInstance.readRawVarint32());
                while (!newInstance.isAtEnd()) {
                    list.add(readData(newInstance));
                }
            } catch (Throwable e) {
                throw new IllegalArgumentException("Error reading extension field", e);
            }
        }

        protected final void writeSingularData(Object obj, CodedOutputByteBufferNano codedOutputByteBufferNano) {
            try {
                codedOutputByteBufferNano.writeRawVarint32(this.tag);
                switch (this.type) {
                    case 1:
                        codedOutputByteBufferNano.writeDoubleNoTag(((Double) obj).doubleValue());
                        return;
                    case 2:
                        codedOutputByteBufferNano.writeFloatNoTag(((Float) obj).floatValue());
                        return;
                    case 3:
                        codedOutputByteBufferNano.writeInt64NoTag(((Long) obj).longValue());
                        return;
                    case 4:
                        codedOutputByteBufferNano.writeUInt64NoTag(((Long) obj).longValue());
                        return;
                    case 5:
                        codedOutputByteBufferNano.writeInt32NoTag(((Integer) obj).intValue());
                        return;
                    case 6:
                        codedOutputByteBufferNano.writeFixed64NoTag(((Long) obj).longValue());
                        return;
                    case 7:
                        codedOutputByteBufferNano.writeFixed32NoTag(((Integer) obj).intValue());
                        return;
                    case 8:
                        codedOutputByteBufferNano.writeBoolNoTag(((Boolean) obj).booleanValue());
                        return;
                    case 9:
                        codedOutputByteBufferNano.writeStringNoTag((String) obj);
                        return;
                    case 12:
                        codedOutputByteBufferNano.writeBytesNoTag((byte[]) obj);
                        return;
                    case 13:
                        codedOutputByteBufferNano.writeUInt32NoTag(((Integer) obj).intValue());
                        return;
                    case 14:
                        codedOutputByteBufferNano.writeEnumNoTag(((Integer) obj).intValue());
                        return;
                    case 15:
                        codedOutputByteBufferNano.writeSFixed32NoTag(((Integer) obj).intValue());
                        return;
                    case 16:
                        codedOutputByteBufferNano.writeSFixed64NoTag(((Long) obj).longValue());
                        return;
                    case 17:
                        codedOutputByteBufferNano.writeSInt32NoTag(((Integer) obj).intValue());
                        return;
                    case 18:
                        codedOutputByteBufferNano.writeSInt64NoTag(((Long) obj).longValue());
                        return;
                    default:
                        int i = this.type;
                        StringBuilder stringBuilder = new StringBuilder(24);
                        stringBuilder.append("Unknown type ");
                        stringBuilder.append(i);
                        throw new IllegalArgumentException(stringBuilder.toString());
                }
            } catch (Throwable e) {
                throw new IllegalStateException(e);
            }
        }

        /* JADX WARNING: Missing block: B:12:0x0045, code:
            if (r2 >= r0) goto L_0x0103;
     */
        /* JADX WARNING: Missing block: B:13:0x0047, code:
            r7.writeSInt64NoTag(java.lang.reflect.Array.getLong(r6, r2));
            r2 = r2 + 1;
     */
        /* JADX WARNING: Missing block: B:14:0x0053, code:
            if (r2 >= r0) goto L_0x0103;
     */
        /* JADX WARNING: Missing block: B:15:0x0055, code:
            r7.writeSInt32NoTag(java.lang.reflect.Array.getInt(r6, r2));
            r2 = r2 + 1;
     */
        /* JADX WARNING: Missing block: B:16:0x0061, code:
            if (r2 >= r0) goto L_0x0103;
     */
        /* JADX WARNING: Missing block: B:17:0x0063, code:
            r7.writeSFixed64NoTag(java.lang.reflect.Array.getLong(r6, r2));
            r2 = r2 + 1;
     */
        /* JADX WARNING: Missing block: B:18:0x006f, code:
            if (r2 >= r0) goto L_0x0103;
     */
        /* JADX WARNING: Missing block: B:19:0x0071, code:
            r7.writeSFixed32NoTag(java.lang.reflect.Array.getInt(r6, r2));
            r2 = r2 + 1;
     */
        /* JADX WARNING: Missing block: B:20:0x007d, code:
            if (r2 >= r0) goto L_0x0103;
     */
        /* JADX WARNING: Missing block: B:21:0x007f, code:
            r7.writeEnumNoTag(java.lang.reflect.Array.getInt(r6, r2));
            r2 = r2 + 1;
     */
        /* JADX WARNING: Missing block: B:22:0x008b, code:
            if (r2 >= r0) goto L_0x0103;
     */
        /* JADX WARNING: Missing block: B:23:0x008d, code:
            r7.writeUInt32NoTag(java.lang.reflect.Array.getInt(r6, r2));
            r2 = r2 + 1;
     */
        /* JADX WARNING: Missing block: B:24:0x0099, code:
            if (r2 >= r0) goto L_0x0103;
     */
        /* JADX WARNING: Missing block: B:25:0x009b, code:
            r7.writeBoolNoTag(java.lang.reflect.Array.getBoolean(r6, r2));
            r2 = r2 + 1;
     */
        /* JADX WARNING: Missing block: B:26:0x00a6, code:
            if (r2 >= r0) goto L_0x0103;
     */
        /* JADX WARNING: Missing block: B:27:0x00a8, code:
            r7.writeFixed32NoTag(java.lang.reflect.Array.getInt(r6, r2));
            r2 = r2 + 1;
     */
        /* JADX WARNING: Missing block: B:28:0x00b3, code:
            if (r2 >= r0) goto L_0x0103;
     */
        /* JADX WARNING: Missing block: B:29:0x00b5, code:
            r7.writeFixed64NoTag(java.lang.reflect.Array.getLong(r6, r2));
            r2 = r2 + 1;
     */
        /* JADX WARNING: Missing block: B:30:0x00c0, code:
            if (r2 >= r0) goto L_0x0103;
     */
        /* JADX WARNING: Missing block: B:31:0x00c2, code:
            r7.writeInt32NoTag(java.lang.reflect.Array.getInt(r6, r2));
            r2 = r2 + 1;
     */
        /* JADX WARNING: Missing block: B:32:0x00cd, code:
            if (r2 >= r0) goto L_0x0103;
     */
        /* JADX WARNING: Missing block: B:33:0x00cf, code:
            r7.writeUInt64NoTag(java.lang.reflect.Array.getLong(r6, r2));
            r2 = r2 + 1;
     */
        /* JADX WARNING: Missing block: B:34:0x00da, code:
            if (r2 >= r0) goto L_0x0103;
     */
        /* JADX WARNING: Missing block: B:35:0x00dc, code:
            r7.writeInt64NoTag(java.lang.reflect.Array.getLong(r6, r2));
            r2 = r2 + 1;
     */
        /* JADX WARNING: Missing block: B:36:0x00e7, code:
            if (r2 >= r0) goto L_0x0103;
     */
        /* JADX WARNING: Missing block: B:37:0x00e9, code:
            r7.writeFloatNoTag(java.lang.reflect.Array.getFloat(r6, r2));
            r2 = r2 + 1;
     */
        /* JADX WARNING: Missing block: B:38:0x00f4, code:
            if (r2 >= r0) goto L_0x0103;
     */
        /* JADX WARNING: Missing block: B:39:0x00f6, code:
            r7.writeDoubleNoTag(java.lang.reflect.Array.getDouble(r6, r2));
     */
        /* JADX WARNING: Missing block: B:40:0x00fd, code:
            r2 = r2 + 1;
     */
        /* JADX WARNING: Missing block: B:61:?, code:
            return;
     */
        /* JADX WARNING: Missing block: B:62:?, code:
            return;
     */
        /* JADX WARNING: Missing block: B:63:?, code:
            return;
     */
        /* JADX WARNING: Missing block: B:64:?, code:
            return;
     */
        /* JADX WARNING: Missing block: B:65:?, code:
            return;
     */
        /* JADX WARNING: Missing block: B:66:?, code:
            return;
     */
        /* JADX WARNING: Missing block: B:67:?, code:
            return;
     */
        /* JADX WARNING: Missing block: B:68:?, code:
            return;
     */
        /* JADX WARNING: Missing block: B:69:?, code:
            return;
     */
        /* JADX WARNING: Missing block: B:70:?, code:
            return;
     */
        /* JADX WARNING: Missing block: B:71:?, code:
            return;
     */
        /* JADX WARNING: Missing block: B:72:?, code:
            return;
     */
        /* JADX WARNING: Missing block: B:73:?, code:
            return;
     */
        /* JADX WARNING: Missing block: B:74:?, code:
            return;
     */
        /* Code decompiled incorrectly, please refer to instructions dump. */
        protected void writeRepeatedData(Object obj, CodedOutputByteBufferNano codedOutputByteBufferNano) {
            int length;
            int computePackedDataSize;
            int i;
            if (this.tag == this.nonPackedTag) {
                super.writeRepeatedData(obj, codedOutputByteBufferNano);
            } else if (this.tag == this.packedTag) {
                length = Array.getLength(obj);
                computePackedDataSize = computePackedDataSize(obj);
                try {
                    codedOutputByteBufferNano.writeRawVarint32(this.tag);
                    codedOutputByteBufferNano.writeRawVarint32(computePackedDataSize);
                    computePackedDataSize = this.type;
                    int i2 = 0;
                    switch (computePackedDataSize) {
                        case 1:
                            break;
                        case 2:
                            break;
                        case 3:
                            break;
                        case 4:
                            break;
                        case 5:
                            break;
                        case 6:
                            break;
                        case 7:
                            break;
                        case 8:
                            break;
                        default:
                            switch (computePackedDataSize) {
                                case 13:
                                    break;
                                case 14:
                                    break;
                                case 15:
                                    break;
                                case 16:
                                    break;
                                case 17:
                                    break;
                                case 18:
                                    break;
                                default:
                                    i = this.type;
                                    StringBuilder stringBuilder = new StringBuilder(27);
                                    stringBuilder.append("Unpackable type ");
                                    stringBuilder.append(i);
                                    throw new IllegalArgumentException(stringBuilder.toString());
                            }
                    }
                } catch (Throwable e) {
                    throw new IllegalStateException(e);
                }
            } else {
                i = this.tag;
                length = this.nonPackedTag;
                computePackedDataSize = this.packedTag;
                StringBuilder stringBuilder2 = new StringBuilder(124);
                stringBuilder2.append("Unexpected repeated extension tag ");
                stringBuilder2.append(i);
                stringBuilder2.append(", unequal to both non-packed variant ");
                stringBuilder2.append(length);
                stringBuilder2.append(" and packed variant ");
                stringBuilder2.append(computePackedDataSize);
                throw new IllegalArgumentException(stringBuilder2.toString());
            }
        }

        /* JADX WARNING: Missing block: B:26:0x009d, code:
            r0 = r0 * 4;
     */
        /* JADX WARNING: Missing block: B:27:0x00a0, code:
            r0 = r0 * 8;
     */
        /* JADX WARNING: Missing block: B:36:?, code:
            return r0;
     */
        /* Code decompiled incorrectly, please refer to instructions dump. */
        private int computePackedDataSize(Object obj) {
            int length = Array.getLength(obj);
            int i = this.type;
            int i2 = 0;
            switch (i) {
                case 1:
                case 6:
                    break;
                case 2:
                case 7:
                    break;
                case 3:
                    i = 0;
                    while (i2 < length) {
                        i += CodedOutputByteBufferNano.computeInt64SizeNoTag(Array.getLong(obj, i2));
                        i2++;
                    }
                    return i;
                case 4:
                    i = 0;
                    while (i2 < length) {
                        i += CodedOutputByteBufferNano.computeUInt64SizeNoTag(Array.getLong(obj, i2));
                        i2++;
                    }
                    return i;
                case 5:
                    i = 0;
                    while (i2 < length) {
                        i += CodedOutputByteBufferNano.computeInt32SizeNoTag(Array.getInt(obj, i2));
                        i2++;
                    }
                    return i;
                case 8:
                    break;
                default:
                    switch (i) {
                        case 13:
                            i = 0;
                            while (i2 < length) {
                                i += CodedOutputByteBufferNano.computeUInt32SizeNoTag(Array.getInt(obj, i2));
                                i2++;
                            }
                            return i;
                        case 14:
                            i = 0;
                            while (i2 < length) {
                                i += CodedOutputByteBufferNano.computeEnumSizeNoTag(Array.getInt(obj, i2));
                                i2++;
                            }
                            return i;
                        case 15:
                            break;
                        case 16:
                            break;
                        case 17:
                            i = 0;
                            while (i2 < length) {
                                i += CodedOutputByteBufferNano.computeSInt32SizeNoTag(Array.getInt(obj, i2));
                                i2++;
                            }
                            return i;
                        case 18:
                            i = 0;
                            while (i2 < length) {
                                i += CodedOutputByteBufferNano.computeSInt64SizeNoTag(Array.getLong(obj, i2));
                                i2++;
                            }
                            return i;
                        default:
                            length = this.type;
                            StringBuilder stringBuilder = new StringBuilder(40);
                            stringBuilder.append("Unexpected non-packable type ");
                            stringBuilder.append(length);
                            throw new IllegalArgumentException(stringBuilder.toString());
                    }
            }
        }

        protected int computeRepeatedSerializedSize(Object obj) {
            if (this.tag == this.nonPackedTag) {
                return super.computeRepeatedSerializedSize(obj);
            }
            if (this.tag == this.packedTag) {
                int computePackedDataSize = computePackedDataSize(obj);
                return (computePackedDataSize + CodedOutputByteBufferNano.computeRawVarint32Size(computePackedDataSize)) + CodedOutputByteBufferNano.computeRawVarint32Size(this.tag);
            }
            int i = this.tag;
            int i2 = this.nonPackedTag;
            int i3 = this.packedTag;
            StringBuilder stringBuilder = new StringBuilder(124);
            stringBuilder.append("Unexpected repeated extension tag ");
            stringBuilder.append(i);
            stringBuilder.append(", unequal to both non-packed variant ");
            stringBuilder.append(i2);
            stringBuilder.append(" and packed variant ");
            stringBuilder.append(i3);
            throw new IllegalArgumentException(stringBuilder.toString());
        }

        protected final int computeSingularSerializedSize(Object obj) {
            int tagFieldNumber = WireFormatNano.getTagFieldNumber(this.tag);
            switch (this.type) {
                case 1:
                    return CodedOutputByteBufferNano.computeDoubleSize(tagFieldNumber, ((Double) obj).doubleValue());
                case 2:
                    return CodedOutputByteBufferNano.computeFloatSize(tagFieldNumber, ((Float) obj).floatValue());
                case 3:
                    return CodedOutputByteBufferNano.computeInt64Size(tagFieldNumber, ((Long) obj).longValue());
                case 4:
                    return CodedOutputByteBufferNano.computeUInt64Size(tagFieldNumber, ((Long) obj).longValue());
                case 5:
                    return CodedOutputByteBufferNano.computeInt32Size(tagFieldNumber, ((Integer) obj).intValue());
                case 6:
                    return CodedOutputByteBufferNano.computeFixed64Size(tagFieldNumber, ((Long) obj).longValue());
                case 7:
                    return CodedOutputByteBufferNano.computeFixed32Size(tagFieldNumber, ((Integer) obj).intValue());
                case 8:
                    return CodedOutputByteBufferNano.computeBoolSize(tagFieldNumber, ((Boolean) obj).booleanValue());
                case 9:
                    return CodedOutputByteBufferNano.computeStringSize(tagFieldNumber, (String) obj);
                case 12:
                    return CodedOutputByteBufferNano.computeBytesSize(tagFieldNumber, (byte[]) obj);
                case 13:
                    return CodedOutputByteBufferNano.computeUInt32Size(tagFieldNumber, ((Integer) obj).intValue());
                case 14:
                    return CodedOutputByteBufferNano.computeEnumSize(tagFieldNumber, ((Integer) obj).intValue());
                case 15:
                    return CodedOutputByteBufferNano.computeSFixed32Size(tagFieldNumber, ((Integer) obj).intValue());
                case 16:
                    return CodedOutputByteBufferNano.computeSFixed64Size(tagFieldNumber, ((Long) obj).longValue());
                case 17:
                    return CodedOutputByteBufferNano.computeSInt32Size(tagFieldNumber, ((Integer) obj).intValue());
                case 18:
                    return CodedOutputByteBufferNano.computeSInt64Size(tagFieldNumber, ((Long) obj).longValue());
                default:
                    tagFieldNumber = this.type;
                    StringBuilder stringBuilder = new StringBuilder(24);
                    stringBuilder.append("Unknown type ");
                    stringBuilder.append(tagFieldNumber);
                    throw new IllegalArgumentException(stringBuilder.toString());
            }
        }
    }

    @Deprecated
    public static <M extends ExtendableMessageNano<M>, T extends MessageNano> Extension<M, T> createMessageTyped(int i, Class<T> cls, int i2) {
        return new Extension(i, cls, i2, false);
    }

    public static <M extends ExtendableMessageNano<M>, T extends MessageNano> Extension<M, T> createMessageTyped(int i, Class<T> cls, long j) {
        return new Extension(i, cls, (int) j, false);
    }

    public static <M extends ExtendableMessageNano<M>, T extends GeneratedMessageLite<?, ?>> Extension<M, T> createMessageLiteTyped(int i, Class<T> cls, T t, long j) {
        return new Extension(i, (Class) cls, (GeneratedMessageLite) t, (int) j, false);
    }

    public static <M extends ExtendableMessageNano<M>, T extends MessageNano> Extension<M, T[]> createRepeatedMessageTyped(int i, Class<T[]> cls, long j) {
        return new Extension(i, cls, (int) j, true);
    }

    public static <M extends ExtendableMessageNano<M>, T extends GeneratedMessageLite<?, ?>> Extension<M, T[]> createRepeatedMessageLiteTyped(int i, Class<T[]> cls, T t, long j) {
        return new Extension(i, (Class) cls, (GeneratedMessageLite) t, (int) j, true);
    }

    public static <M extends ExtendableMessageNano<M>, T> Extension<M, T> createPrimitiveTyped(int i, Class<T> cls, long j) {
        return new PrimitiveExtension(i, cls, (int) j, false, 0, 0);
    }

    public static <M extends ExtendableMessageNano<M>, T> Extension<M, T> createRepeatedPrimitiveTyped(int i, Class<T> cls, long j, long j2, long j3) {
        return new PrimitiveExtension(i, cls, (int) j, true, (int) j2, (int) j3);
    }

    private Extension(int i, Class<T> cls, int i2, boolean z) {
        this(i, (Class) cls, null, i2, z);
    }

    private Extension(int i, Class<T> cls, GeneratedMessageLite<?, ?> generatedMessageLite, int i2, boolean z) {
        this.type = i;
        this.clazz = cls;
        this.tag = i2;
        this.repeated = z;
        this.defaultInstance = generatedMessageLite;
    }

    public boolean equals(Object obj) {
        boolean z = true;
        if (this == obj) {
            return true;
        }
        if (!(obj instanceof Extension)) {
            return false;
        }
        Extension extension = (Extension) obj;
        if (!(this.type == extension.type && this.clazz == extension.clazz && this.tag == extension.tag && this.repeated == extension.repeated)) {
            z = false;
        }
        return z;
    }

    public int hashCode() {
        return (31 * (((((1147 + this.type) * 31) + this.clazz.hashCode()) * 31) + this.tag)) + this.repeated;
    }

    final T getValueFrom(List<UnknownFieldData> list) {
        if (list == null) {
            return null;
        }
        return this.repeated ? getRepeatedValueFrom(list) : getSingularValueFrom(list);
    }

    private T getRepeatedValueFrom(List<UnknownFieldData> list) {
        List arrayList = new ArrayList();
        int i = 0;
        for (int i2 = 0; i2 < list.size(); i2++) {
            UnknownFieldData unknownFieldData = (UnknownFieldData) list.get(i2);
            if (unknownFieldData.bytes.length != 0) {
                readDataInto(unknownFieldData, arrayList);
            }
        }
        int size = arrayList.size();
        if (size == 0) {
            return null;
        }
        T cast = this.clazz.cast(Array.newInstance(this.clazz.getComponentType(), size));
        while (i < size) {
            Array.set(cast, i, arrayList.get(i));
            i++;
        }
        return cast;
    }

    private T getSingularValueFrom(List<UnknownFieldData> list) {
        if (list.isEmpty()) {
            return null;
        }
        return this.clazz.cast(readData(CodedInputByteBufferNano.newInstance(((UnknownFieldData) list.get(list.size() - 1)).bytes)));
    }

    protected Object readData(CodedInputByteBufferNano codedInputByteBufferNano) {
        String valueOf;
        StringBuilder stringBuilder;
        Class componentType = this.repeated ? this.clazz.getComponentType() : this.clazz;
        try {
            MessageNano messageNano;
            switch (this.type) {
                case 10:
                    messageNano = (MessageNano) componentType.newInstance();
                    codedInputByteBufferNano.readGroup(messageNano, WireFormatNano.getTagFieldNumber(this.tag));
                    return messageNano;
                case 11:
                    if (this.defaultInstance != null) {
                        return codedInputByteBufferNano.readMessageLite(this.defaultInstance.getParserForType());
                    }
                    messageNano = (MessageNano) componentType.newInstance();
                    codedInputByteBufferNano.readMessage(messageNano);
                    return messageNano;
                default:
                    int i = this.type;
                    StringBuilder stringBuilder2 = new StringBuilder(24);
                    stringBuilder2.append("Unknown type ");
                    stringBuilder2.append(i);
                    throw new IllegalArgumentException(stringBuilder2.toString());
            }
        } catch (Throwable e) {
            valueOf = String.valueOf(componentType);
            stringBuilder = new StringBuilder(33 + String.valueOf(valueOf).length());
            stringBuilder.append("Error creating instance of class ");
            stringBuilder.append(valueOf);
            throw new IllegalArgumentException(stringBuilder.toString(), e);
        } catch (Throwable e2) {
            valueOf = String.valueOf(componentType);
            stringBuilder = new StringBuilder(33 + String.valueOf(valueOf).length());
            stringBuilder.append("Error creating instance of class ");
            stringBuilder.append(valueOf);
            throw new IllegalArgumentException(stringBuilder.toString(), e2);
        } catch (Throwable e22) {
            throw new IllegalArgumentException("Error reading extension field", e22);
        }
    }

    protected void readDataInto(UnknownFieldData unknownFieldData, List<Object> list) {
        list.add(readData(CodedInputByteBufferNano.newInstance(unknownFieldData.bytes)));
    }

    void writeTo(Object obj, CodedOutputByteBufferNano codedOutputByteBufferNano) throws IOException {
        if (this.repeated) {
            writeRepeatedData(obj, codedOutputByteBufferNano);
        } else {
            writeSingularData(obj, codedOutputByteBufferNano);
        }
    }

    void writeAsMessageSetTo(Object obj, CodedOutputByteBufferNano codedOutputByteBufferNano) throws IOException {
        if (this.repeated) {
            writeRepeatedDataAsMessageSet(obj, codedOutputByteBufferNano);
        } else {
            writeSingularDataAsMessageSet(obj, codedOutputByteBufferNano);
        }
    }

    protected void writeSingularData(Object obj, CodedOutputByteBufferNano codedOutputByteBufferNano) {
        try {
            codedOutputByteBufferNano.writeRawVarint32(this.tag);
            switch (this.type) {
                case 10:
                    int tagFieldNumber = WireFormatNano.getTagFieldNumber(this.tag);
                    if (this.defaultInstance == null) {
                        codedOutputByteBufferNano.writeGroupNoTag((MessageNano) obj);
                    } else {
                        codedOutputByteBufferNano.writeGroupNoTag((MessageLite) obj);
                    }
                    codedOutputByteBufferNano.writeTag(tagFieldNumber, 4);
                    return;
                case 11:
                    if (this.defaultInstance == null) {
                        codedOutputByteBufferNano.writeMessageNoTag((MessageNano) obj);
                        return;
                    } else {
                        codedOutputByteBufferNano.writeMessageNoTag((MessageLite) obj);
                        return;
                    }
                default:
                    int i = this.type;
                    StringBuilder stringBuilder = new StringBuilder(24);
                    stringBuilder.append("Unknown type ");
                    stringBuilder.append(i);
                    throw new IllegalArgumentException(stringBuilder.toString());
            }
        } catch (Throwable e) {
            throw new IllegalStateException(e);
        }
    }

    protected void writeSingularDataAsMessageSet(Object obj, CodedOutputByteBufferNano codedOutputByteBufferNano) throws IOException {
        codedOutputByteBufferNano.writeMessageSetExtension(WireFormatNano.getTagFieldNumber(this.tag), (MessageNano) obj);
    }

    protected void writeRepeatedData(Object obj, CodedOutputByteBufferNano codedOutputByteBufferNano) {
        int length = Array.getLength(obj);
        for (int i = 0; i < length; i++) {
            Object obj2 = Array.get(obj, i);
            if (obj2 != null) {
                writeSingularData(obj2, codedOutputByteBufferNano);
            }
        }
    }

    protected void writeRepeatedDataAsMessageSet(Object obj, CodedOutputByteBufferNano codedOutputByteBufferNano) throws IOException {
        int length = Array.getLength(obj);
        for (int i = 0; i < length; i++) {
            Object obj2 = Array.get(obj, i);
            if (obj2 != null) {
                writeSingularDataAsMessageSet(obj2, codedOutputByteBufferNano);
            }
        }
    }

    int computeSerializedSize(Object obj) {
        if (this.repeated) {
            return computeRepeatedSerializedSize(obj);
        }
        return computeSingularSerializedSize(obj);
    }

    int computeSerializedSizeAsMessageSet(Object obj) {
        if (this.repeated) {
            return computeRepeatedSerializedSizeAsMessageSet(obj);
        }
        return computeSingularSerializedSizeAsMessageSet(obj);
    }

    protected int computeRepeatedSerializedSize(Object obj) {
        int length = Array.getLength(obj);
        int i = 0;
        int i2 = 0;
        while (i < length) {
            if (Array.get(obj, i) != null) {
                i2 += computeSingularSerializedSize(Array.get(obj, i));
            }
            i++;
        }
        return i2;
    }

    protected int computeSingularSerializedSize(Object obj) {
        int tagFieldNumber = WireFormatNano.getTagFieldNumber(this.tag);
        switch (this.type) {
            case 10:
                if (this.defaultInstance == null) {
                    return CodedOutputByteBufferNano.computeGroupSize(tagFieldNumber, (MessageNano) obj);
                }
                return CodedOutputStream.computeGroupSize(tagFieldNumber, (MessageLite) obj);
            case 11:
                if (this.defaultInstance == null) {
                    return CodedOutputByteBufferNano.computeMessageSize(tagFieldNumber, (MessageNano) obj);
                }
                return CodedOutputStream.computeMessageSize(tagFieldNumber, (MessageLite) obj);
            default:
                tagFieldNumber = this.type;
                StringBuilder stringBuilder = new StringBuilder(24);
                stringBuilder.append("Unknown type ");
                stringBuilder.append(tagFieldNumber);
                throw new IllegalArgumentException(stringBuilder.toString());
        }
    }

    protected int computeRepeatedSerializedSizeAsMessageSet(Object obj) {
        int length = Array.getLength(obj);
        int i = 0;
        int i2 = 0;
        while (i < length) {
            if (Array.get(obj, i) != null) {
                i2 += computeSingularSerializedSizeAsMessageSet(Array.get(obj, i));
            }
            i++;
        }
        return i2;
    }

    protected int computeSingularSerializedSizeAsMessageSet(Object obj) {
        return CodedOutputByteBufferNano.computeMessageSetExtensionSize(WireFormatNano.getTagFieldNumber(this.tag), (MessageNano) obj);
    }
}
