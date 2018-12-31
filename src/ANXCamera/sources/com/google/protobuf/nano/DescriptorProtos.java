package com.google.protobuf.nano;

import java.io.IOException;
import java.util.Arrays;

public abstract class DescriptorProtos {

    public static final class DescriptorProto extends ExtendableMessageNano<DescriptorProto> {
        private static volatile DescriptorProto[] _emptyArray;
        public EnumDescriptorProto[] enumType;
        public FieldDescriptorProto[] extension;
        public ExtensionRange[] extensionRange;
        public FieldDescriptorProto[] field;
        public String name;
        public DescriptorProto[] nestedType;
        public OneofDescriptorProto[] oneofDecl;
        public MessageOptions options;
        public String[] reservedName;
        public ReservedRange[] reservedRange;

        public static final class ExtensionRange extends ExtendableMessageNano<ExtensionRange> {
            private static volatile ExtensionRange[] _emptyArray;
            public int end;
            public ExtensionRangeOptions options;
            public int start;

            public static ExtensionRange[] emptyArray() {
                if (_emptyArray == null) {
                    synchronized (InternalNano.LAZY_INIT_LOCK) {
                        if (_emptyArray == null) {
                            _emptyArray = new ExtensionRange[0];
                        }
                    }
                }
                return _emptyArray;
            }

            public ExtensionRange() {
                clear();
            }

            public ExtensionRange clear() {
                this.start = 0;
                this.end = 0;
                this.options = null;
                this.unknownFieldData = null;
                this.cachedSize = -1;
                return this;
            }

            public void writeTo(CodedOutputByteBufferNano codedOutputByteBufferNano) throws IOException {
                if (this.start != 0) {
                    codedOutputByteBufferNano.writeInt32(1, this.start);
                }
                if (this.end != 0) {
                    codedOutputByteBufferNano.writeInt32(2, this.end);
                }
                if (this.options != null) {
                    codedOutputByteBufferNano.writeMessage(3, this.options);
                }
                super.writeTo(codedOutputByteBufferNano);
            }

            protected int computeSerializedSize() {
                int computeSerializedSize = super.computeSerializedSize();
                if (this.start != 0) {
                    computeSerializedSize += CodedOutputByteBufferNano.computeInt32Size(1, this.start);
                }
                if (this.end != 0) {
                    computeSerializedSize += CodedOutputByteBufferNano.computeInt32Size(2, this.end);
                }
                if (this.options != null) {
                    return computeSerializedSize + CodedOutputByteBufferNano.computeMessageSize(3, this.options);
                }
                return computeSerializedSize;
            }

            public ExtensionRange mergeFrom(CodedInputByteBufferNano codedInputByteBufferNano) throws IOException {
                while (true) {
                    int readTag = codedInputByteBufferNano.readTag();
                    if (readTag == 0) {
                        return this;
                    }
                    if (readTag == 8) {
                        this.start = codedInputByteBufferNano.readInt32();
                    } else if (readTag == 16) {
                        this.end = codedInputByteBufferNano.readInt32();
                    } else if (readTag == 26) {
                        if (this.options == null) {
                            this.options = new ExtensionRangeOptions();
                        }
                        codedInputByteBufferNano.readMessage(this.options);
                    } else if (!super.storeUnknownField(codedInputByteBufferNano, readTag)) {
                        return this;
                    }
                }
            }

            public static ExtensionRange parseFrom(byte[] bArr) throws InvalidProtocolBufferNanoException {
                return (ExtensionRange) MessageNano.mergeFrom(new ExtensionRange(), bArr);
            }

            public static ExtensionRange parseFrom(CodedInputByteBufferNano codedInputByteBufferNano) throws IOException {
                return new ExtensionRange().mergeFrom(codedInputByteBufferNano);
            }
        }

        public static final class ReservedRange extends ExtendableMessageNano<ReservedRange> {
            private static volatile ReservedRange[] _emptyArray;
            public int end;
            public int start;

            public static ReservedRange[] emptyArray() {
                if (_emptyArray == null) {
                    synchronized (InternalNano.LAZY_INIT_LOCK) {
                        if (_emptyArray == null) {
                            _emptyArray = new ReservedRange[0];
                        }
                    }
                }
                return _emptyArray;
            }

            public ReservedRange() {
                clear();
            }

            public ReservedRange clear() {
                this.start = 0;
                this.end = 0;
                this.unknownFieldData = null;
                this.cachedSize = -1;
                return this;
            }

            public void writeTo(CodedOutputByteBufferNano codedOutputByteBufferNano) throws IOException {
                if (this.start != 0) {
                    codedOutputByteBufferNano.writeInt32(1, this.start);
                }
                if (this.end != 0) {
                    codedOutputByteBufferNano.writeInt32(2, this.end);
                }
                super.writeTo(codedOutputByteBufferNano);
            }

            protected int computeSerializedSize() {
                int computeSerializedSize = super.computeSerializedSize();
                if (this.start != 0) {
                    computeSerializedSize += CodedOutputByteBufferNano.computeInt32Size(1, this.start);
                }
                if (this.end != 0) {
                    return computeSerializedSize + CodedOutputByteBufferNano.computeInt32Size(2, this.end);
                }
                return computeSerializedSize;
            }

            public ReservedRange mergeFrom(CodedInputByteBufferNano codedInputByteBufferNano) throws IOException {
                while (true) {
                    int readTag = codedInputByteBufferNano.readTag();
                    if (readTag == 0) {
                        return this;
                    }
                    if (readTag == 8) {
                        this.start = codedInputByteBufferNano.readInt32();
                    } else if (readTag == 16) {
                        this.end = codedInputByteBufferNano.readInt32();
                    } else if (!super.storeUnknownField(codedInputByteBufferNano, readTag)) {
                        return this;
                    }
                }
            }

            public static ReservedRange parseFrom(byte[] bArr) throws InvalidProtocolBufferNanoException {
                return (ReservedRange) MessageNano.mergeFrom(new ReservedRange(), bArr);
            }

            public static ReservedRange parseFrom(CodedInputByteBufferNano codedInputByteBufferNano) throws IOException {
                return new ReservedRange().mergeFrom(codedInputByteBufferNano);
            }
        }

        public static DescriptorProto[] emptyArray() {
            if (_emptyArray == null) {
                synchronized (InternalNano.LAZY_INIT_LOCK) {
                    if (_emptyArray == null) {
                        _emptyArray = new DescriptorProto[0];
                    }
                }
            }
            return _emptyArray;
        }

        public DescriptorProto() {
            clear();
        }

        public DescriptorProto clear() {
            this.name = "";
            this.field = FieldDescriptorProto.emptyArray();
            this.extension = FieldDescriptorProto.emptyArray();
            this.nestedType = emptyArray();
            this.enumType = EnumDescriptorProto.emptyArray();
            this.extensionRange = ExtensionRange.emptyArray();
            this.oneofDecl = OneofDescriptorProto.emptyArray();
            this.options = null;
            this.reservedRange = ReservedRange.emptyArray();
            this.reservedName = WireFormatNano.EMPTY_STRING_ARRAY;
            this.unknownFieldData = null;
            this.cachedSize = -1;
            return this;
        }

        public void writeTo(CodedOutputByteBufferNano codedOutputByteBufferNano) throws IOException {
            if (!(this.name == null || this.name.equals(""))) {
                codedOutputByteBufferNano.writeString(1, this.name);
            }
            int i = 0;
            if (this.field != null && this.field.length > 0) {
                for (MessageNano messageNano : this.field) {
                    if (messageNano != null) {
                        codedOutputByteBufferNano.writeMessage(2, messageNano);
                    }
                }
            }
            if (this.nestedType != null && this.nestedType.length > 0) {
                for (MessageNano messageNano2 : this.nestedType) {
                    if (messageNano2 != null) {
                        codedOutputByteBufferNano.writeMessage(3, messageNano2);
                    }
                }
            }
            if (this.enumType != null && this.enumType.length > 0) {
                for (MessageNano messageNano22 : this.enumType) {
                    if (messageNano22 != null) {
                        codedOutputByteBufferNano.writeMessage(4, messageNano22);
                    }
                }
            }
            if (this.extensionRange != null && this.extensionRange.length > 0) {
                for (MessageNano messageNano222 : this.extensionRange) {
                    if (messageNano222 != null) {
                        codedOutputByteBufferNano.writeMessage(5, messageNano222);
                    }
                }
            }
            if (this.extension != null && this.extension.length > 0) {
                for (MessageNano messageNano2222 : this.extension) {
                    if (messageNano2222 != null) {
                        codedOutputByteBufferNano.writeMessage(6, messageNano2222);
                    }
                }
            }
            if (this.options != null) {
                codedOutputByteBufferNano.writeMessage(7, this.options);
            }
            if (this.oneofDecl != null && this.oneofDecl.length > 0) {
                for (MessageNano messageNano22222 : this.oneofDecl) {
                    if (messageNano22222 != null) {
                        codedOutputByteBufferNano.writeMessage(8, messageNano22222);
                    }
                }
            }
            if (this.reservedRange != null && this.reservedRange.length > 0) {
                for (MessageNano messageNano222222 : this.reservedRange) {
                    if (messageNano222222 != null) {
                        codedOutputByteBufferNano.writeMessage(9, messageNano222222);
                    }
                }
            }
            if (this.reservedName != null && this.reservedName.length > 0) {
                while (i < this.reservedName.length) {
                    String str = this.reservedName[i];
                    if (str != null) {
                        codedOutputByteBufferNano.writeString(10, str);
                    }
                    i++;
                }
            }
            super.writeTo(codedOutputByteBufferNano);
        }

        protected int computeSerializedSize() {
            int i;
            int computeSerializedSize = super.computeSerializedSize();
            if (!(this.name == null || this.name.equals(""))) {
                computeSerializedSize += CodedOutputByteBufferNano.computeStringSize(1, this.name);
            }
            int i2 = 0;
            if (this.field != null && this.field.length > 0) {
                i = computeSerializedSize;
                for (MessageNano messageNano : this.field) {
                    if (messageNano != null) {
                        i += CodedOutputByteBufferNano.computeMessageSize(2, messageNano);
                    }
                }
                computeSerializedSize = i;
            }
            if (this.nestedType != null && this.nestedType.length > 0) {
                i = computeSerializedSize;
                for (MessageNano messageNano2 : this.nestedType) {
                    if (messageNano2 != null) {
                        i += CodedOutputByteBufferNano.computeMessageSize(3, messageNano2);
                    }
                }
                computeSerializedSize = i;
            }
            if (this.enumType != null && this.enumType.length > 0) {
                i = computeSerializedSize;
                for (MessageNano messageNano22 : this.enumType) {
                    if (messageNano22 != null) {
                        i += CodedOutputByteBufferNano.computeMessageSize(4, messageNano22);
                    }
                }
                computeSerializedSize = i;
            }
            if (this.extensionRange != null && this.extensionRange.length > 0) {
                i = computeSerializedSize;
                for (MessageNano messageNano222 : this.extensionRange) {
                    if (messageNano222 != null) {
                        i += CodedOutputByteBufferNano.computeMessageSize(5, messageNano222);
                    }
                }
                computeSerializedSize = i;
            }
            if (this.extension != null && this.extension.length > 0) {
                i = computeSerializedSize;
                for (MessageNano messageNano2222 : this.extension) {
                    if (messageNano2222 != null) {
                        i += CodedOutputByteBufferNano.computeMessageSize(6, messageNano2222);
                    }
                }
                computeSerializedSize = i;
            }
            if (this.options != null) {
                computeSerializedSize += CodedOutputByteBufferNano.computeMessageSize(7, this.options);
            }
            if (this.oneofDecl != null && this.oneofDecl.length > 0) {
                i = computeSerializedSize;
                for (MessageNano messageNano22222 : this.oneofDecl) {
                    if (messageNano22222 != null) {
                        i += CodedOutputByteBufferNano.computeMessageSize(8, messageNano22222);
                    }
                }
                computeSerializedSize = i;
            }
            if (this.reservedRange != null && this.reservedRange.length > 0) {
                i = computeSerializedSize;
                for (MessageNano messageNano222222 : this.reservedRange) {
                    if (messageNano222222 != null) {
                        i += CodedOutputByteBufferNano.computeMessageSize(9, messageNano222222);
                    }
                }
                computeSerializedSize = i;
            }
            if (this.reservedName == null || this.reservedName.length <= 0) {
                return computeSerializedSize;
            }
            i = 0;
            int i3 = i;
            while (i2 < this.reservedName.length) {
                String str = this.reservedName[i2];
                if (str != null) {
                    i3++;
                    i += CodedOutputByteBufferNano.computeStringSizeNoTag(str);
                }
                i2++;
            }
            return (computeSerializedSize + i) + (1 * i3);
        }

        public DescriptorProto mergeFrom(CodedInputByteBufferNano codedInputByteBufferNano) throws IOException {
            while (true) {
                int readTag = codedInputByteBufferNano.readTag();
                int i;
                Object obj;
                switch (readTag) {
                    case 0:
                        return this;
                    case 10:
                        this.name = codedInputByteBufferNano.readString();
                        break;
                    case 18:
                        readTag = WireFormatNano.getRepeatedFieldArrayLength(codedInputByteBufferNano, 18);
                        if (this.field == null) {
                            i = 0;
                        } else {
                            i = this.field.length;
                        }
                        obj = new FieldDescriptorProto[(readTag + i)];
                        if (i != 0) {
                            System.arraycopy(this.field, 0, obj, 0, i);
                        }
                        while (i < obj.length - 1) {
                            obj[i] = new FieldDescriptorProto();
                            codedInputByteBufferNano.readMessage(obj[i]);
                            codedInputByteBufferNano.readTag();
                            i++;
                        }
                        obj[i] = new FieldDescriptorProto();
                        codedInputByteBufferNano.readMessage(obj[i]);
                        this.field = obj;
                        break;
                    case 26:
                        readTag = WireFormatNano.getRepeatedFieldArrayLength(codedInputByteBufferNano, 26);
                        if (this.nestedType == null) {
                            i = 0;
                        } else {
                            i = this.nestedType.length;
                        }
                        obj = new DescriptorProto[(readTag + i)];
                        if (i != 0) {
                            System.arraycopy(this.nestedType, 0, obj, 0, i);
                        }
                        while (i < obj.length - 1) {
                            obj[i] = new DescriptorProto();
                            codedInputByteBufferNano.readMessage(obj[i]);
                            codedInputByteBufferNano.readTag();
                            i++;
                        }
                        obj[i] = new DescriptorProto();
                        codedInputByteBufferNano.readMessage(obj[i]);
                        this.nestedType = obj;
                        break;
                    case 34:
                        readTag = WireFormatNano.getRepeatedFieldArrayLength(codedInputByteBufferNano, 34);
                        if (this.enumType == null) {
                            i = 0;
                        } else {
                            i = this.enumType.length;
                        }
                        obj = new EnumDescriptorProto[(readTag + i)];
                        if (i != 0) {
                            System.arraycopy(this.enumType, 0, obj, 0, i);
                        }
                        while (i < obj.length - 1) {
                            obj[i] = new EnumDescriptorProto();
                            codedInputByteBufferNano.readMessage(obj[i]);
                            codedInputByteBufferNano.readTag();
                            i++;
                        }
                        obj[i] = new EnumDescriptorProto();
                        codedInputByteBufferNano.readMessage(obj[i]);
                        this.enumType = obj;
                        break;
                    case 42:
                        readTag = WireFormatNano.getRepeatedFieldArrayLength(codedInputByteBufferNano, 42);
                        if (this.extensionRange == null) {
                            i = 0;
                        } else {
                            i = this.extensionRange.length;
                        }
                        obj = new ExtensionRange[(readTag + i)];
                        if (i != 0) {
                            System.arraycopy(this.extensionRange, 0, obj, 0, i);
                        }
                        while (i < obj.length - 1) {
                            obj[i] = new ExtensionRange();
                            codedInputByteBufferNano.readMessage(obj[i]);
                            codedInputByteBufferNano.readTag();
                            i++;
                        }
                        obj[i] = new ExtensionRange();
                        codedInputByteBufferNano.readMessage(obj[i]);
                        this.extensionRange = obj;
                        break;
                    case 50:
                        readTag = WireFormatNano.getRepeatedFieldArrayLength(codedInputByteBufferNano, 50);
                        if (this.extension == null) {
                            i = 0;
                        } else {
                            i = this.extension.length;
                        }
                        obj = new FieldDescriptorProto[(readTag + i)];
                        if (i != 0) {
                            System.arraycopy(this.extension, 0, obj, 0, i);
                        }
                        while (i < obj.length - 1) {
                            obj[i] = new FieldDescriptorProto();
                            codedInputByteBufferNano.readMessage(obj[i]);
                            codedInputByteBufferNano.readTag();
                            i++;
                        }
                        obj[i] = new FieldDescriptorProto();
                        codedInputByteBufferNano.readMessage(obj[i]);
                        this.extension = obj;
                        break;
                    case 58:
                        if (this.options == null) {
                            this.options = new MessageOptions();
                        }
                        codedInputByteBufferNano.readMessage(this.options);
                        break;
                    case 66:
                        readTag = WireFormatNano.getRepeatedFieldArrayLength(codedInputByteBufferNano, 66);
                        if (this.oneofDecl == null) {
                            i = 0;
                        } else {
                            i = this.oneofDecl.length;
                        }
                        obj = new OneofDescriptorProto[(readTag + i)];
                        if (i != 0) {
                            System.arraycopy(this.oneofDecl, 0, obj, 0, i);
                        }
                        while (i < obj.length - 1) {
                            obj[i] = new OneofDescriptorProto();
                            codedInputByteBufferNano.readMessage(obj[i]);
                            codedInputByteBufferNano.readTag();
                            i++;
                        }
                        obj[i] = new OneofDescriptorProto();
                        codedInputByteBufferNano.readMessage(obj[i]);
                        this.oneofDecl = obj;
                        break;
                    case 74:
                        readTag = WireFormatNano.getRepeatedFieldArrayLength(codedInputByteBufferNano, 74);
                        if (this.reservedRange == null) {
                            i = 0;
                        } else {
                            i = this.reservedRange.length;
                        }
                        obj = new ReservedRange[(readTag + i)];
                        if (i != 0) {
                            System.arraycopy(this.reservedRange, 0, obj, 0, i);
                        }
                        while (i < obj.length - 1) {
                            obj[i] = new ReservedRange();
                            codedInputByteBufferNano.readMessage(obj[i]);
                            codedInputByteBufferNano.readTag();
                            i++;
                        }
                        obj[i] = new ReservedRange();
                        codedInputByteBufferNano.readMessage(obj[i]);
                        this.reservedRange = obj;
                        break;
                    case 82:
                        readTag = WireFormatNano.getRepeatedFieldArrayLength(codedInputByteBufferNano, 82);
                        if (this.reservedName == null) {
                            i = 0;
                        } else {
                            i = this.reservedName.length;
                        }
                        obj = new String[(readTag + i)];
                        if (i != 0) {
                            System.arraycopy(this.reservedName, 0, obj, 0, i);
                        }
                        while (i < obj.length - 1) {
                            obj[i] = codedInputByteBufferNano.readString();
                            codedInputByteBufferNano.readTag();
                            i++;
                        }
                        obj[i] = codedInputByteBufferNano.readString();
                        this.reservedName = obj;
                        break;
                    default:
                        if (super.storeUnknownField(codedInputByteBufferNano, readTag)) {
                            break;
                        }
                        return this;
                }
            }
        }

        public static DescriptorProto parseFrom(byte[] bArr) throws InvalidProtocolBufferNanoException {
            return (DescriptorProto) MessageNano.mergeFrom(new DescriptorProto(), bArr);
        }

        public static DescriptorProto parseFrom(CodedInputByteBufferNano codedInputByteBufferNano) throws IOException {
            return new DescriptorProto().mergeFrom(codedInputByteBufferNano);
        }
    }

    public static final class EnumDescriptorProto extends ExtendableMessageNano<EnumDescriptorProto> {
        private static volatile EnumDescriptorProto[] _emptyArray;
        public String name;
        public EnumOptions options;
        public String[] reservedName;
        public EnumReservedRange[] reservedRange;
        public EnumValueDescriptorProto[] value;

        public static final class EnumReservedRange extends ExtendableMessageNano<EnumReservedRange> {
            private static volatile EnumReservedRange[] _emptyArray;
            public int end;
            public int start;

            public static EnumReservedRange[] emptyArray() {
                if (_emptyArray == null) {
                    synchronized (InternalNano.LAZY_INIT_LOCK) {
                        if (_emptyArray == null) {
                            _emptyArray = new EnumReservedRange[0];
                        }
                    }
                }
                return _emptyArray;
            }

            public EnumReservedRange() {
                clear();
            }

            public EnumReservedRange clear() {
                this.start = 0;
                this.end = 0;
                this.unknownFieldData = null;
                this.cachedSize = -1;
                return this;
            }

            public void writeTo(CodedOutputByteBufferNano codedOutputByteBufferNano) throws IOException {
                if (this.start != 0) {
                    codedOutputByteBufferNano.writeInt32(1, this.start);
                }
                if (this.end != 0) {
                    codedOutputByteBufferNano.writeInt32(2, this.end);
                }
                super.writeTo(codedOutputByteBufferNano);
            }

            protected int computeSerializedSize() {
                int computeSerializedSize = super.computeSerializedSize();
                if (this.start != 0) {
                    computeSerializedSize += CodedOutputByteBufferNano.computeInt32Size(1, this.start);
                }
                if (this.end != 0) {
                    return computeSerializedSize + CodedOutputByteBufferNano.computeInt32Size(2, this.end);
                }
                return computeSerializedSize;
            }

            public EnumReservedRange mergeFrom(CodedInputByteBufferNano codedInputByteBufferNano) throws IOException {
                while (true) {
                    int readTag = codedInputByteBufferNano.readTag();
                    if (readTag == 0) {
                        return this;
                    }
                    if (readTag == 8) {
                        this.start = codedInputByteBufferNano.readInt32();
                    } else if (readTag == 16) {
                        this.end = codedInputByteBufferNano.readInt32();
                    } else if (!super.storeUnknownField(codedInputByteBufferNano, readTag)) {
                        return this;
                    }
                }
            }

            public static EnumReservedRange parseFrom(byte[] bArr) throws InvalidProtocolBufferNanoException {
                return (EnumReservedRange) MessageNano.mergeFrom(new EnumReservedRange(), bArr);
            }

            public static EnumReservedRange parseFrom(CodedInputByteBufferNano codedInputByteBufferNano) throws IOException {
                return new EnumReservedRange().mergeFrom(codedInputByteBufferNano);
            }
        }

        public static EnumDescriptorProto[] emptyArray() {
            if (_emptyArray == null) {
                synchronized (InternalNano.LAZY_INIT_LOCK) {
                    if (_emptyArray == null) {
                        _emptyArray = new EnumDescriptorProto[0];
                    }
                }
            }
            return _emptyArray;
        }

        public EnumDescriptorProto() {
            clear();
        }

        public EnumDescriptorProto clear() {
            this.name = "";
            this.value = EnumValueDescriptorProto.emptyArray();
            this.options = null;
            this.reservedRange = EnumReservedRange.emptyArray();
            this.reservedName = WireFormatNano.EMPTY_STRING_ARRAY;
            this.unknownFieldData = null;
            this.cachedSize = -1;
            return this;
        }

        public void writeTo(CodedOutputByteBufferNano codedOutputByteBufferNano) throws IOException {
            if (!(this.name == null || this.name.equals(""))) {
                codedOutputByteBufferNano.writeString(1, this.name);
            }
            int i = 0;
            if (this.value != null && this.value.length > 0) {
                for (MessageNano messageNano : this.value) {
                    if (messageNano != null) {
                        codedOutputByteBufferNano.writeMessage(2, messageNano);
                    }
                }
            }
            if (this.options != null) {
                codedOutputByteBufferNano.writeMessage(3, this.options);
            }
            if (this.reservedRange != null && this.reservedRange.length > 0) {
                for (MessageNano messageNano2 : this.reservedRange) {
                    if (messageNano2 != null) {
                        codedOutputByteBufferNano.writeMessage(4, messageNano2);
                    }
                }
            }
            if (this.reservedName != null && this.reservedName.length > 0) {
                while (i < this.reservedName.length) {
                    String str = this.reservedName[i];
                    if (str != null) {
                        codedOutputByteBufferNano.writeString(5, str);
                    }
                    i++;
                }
            }
            super.writeTo(codedOutputByteBufferNano);
        }

        protected int computeSerializedSize() {
            int i;
            int computeSerializedSize = super.computeSerializedSize();
            if (!(this.name == null || this.name.equals(""))) {
                computeSerializedSize += CodedOutputByteBufferNano.computeStringSize(1, this.name);
            }
            int i2 = 0;
            if (this.value != null && this.value.length > 0) {
                i = computeSerializedSize;
                for (MessageNano messageNano : this.value) {
                    if (messageNano != null) {
                        i += CodedOutputByteBufferNano.computeMessageSize(2, messageNano);
                    }
                }
                computeSerializedSize = i;
            }
            if (this.options != null) {
                computeSerializedSize += CodedOutputByteBufferNano.computeMessageSize(3, this.options);
            }
            if (this.reservedRange != null && this.reservedRange.length > 0) {
                i = computeSerializedSize;
                for (MessageNano messageNano2 : this.reservedRange) {
                    if (messageNano2 != null) {
                        i += CodedOutputByteBufferNano.computeMessageSize(4, messageNano2);
                    }
                }
                computeSerializedSize = i;
            }
            if (this.reservedName == null || this.reservedName.length <= 0) {
                return computeSerializedSize;
            }
            i = 0;
            int i3 = i;
            while (i2 < this.reservedName.length) {
                String str = this.reservedName[i2];
                if (str != null) {
                    i3++;
                    i += CodedOutputByteBufferNano.computeStringSizeNoTag(str);
                }
                i2++;
            }
            return (computeSerializedSize + i) + (1 * i3);
        }

        public EnumDescriptorProto mergeFrom(CodedInputByteBufferNano codedInputByteBufferNano) throws IOException {
            while (true) {
                int readTag = codedInputByteBufferNano.readTag();
                if (readTag == 0) {
                    return this;
                }
                int i;
                Object obj;
                if (readTag == 10) {
                    this.name = codedInputByteBufferNano.readString();
                } else if (readTag == 18) {
                    readTag = WireFormatNano.getRepeatedFieldArrayLength(codedInputByteBufferNano, 18);
                    if (this.value == null) {
                        i = 0;
                    } else {
                        i = this.value.length;
                    }
                    obj = new EnumValueDescriptorProto[(readTag + i)];
                    if (i != 0) {
                        System.arraycopy(this.value, 0, obj, 0, i);
                    }
                    while (i < obj.length - 1) {
                        obj[i] = new EnumValueDescriptorProto();
                        codedInputByteBufferNano.readMessage(obj[i]);
                        codedInputByteBufferNano.readTag();
                        i++;
                    }
                    obj[i] = new EnumValueDescriptorProto();
                    codedInputByteBufferNano.readMessage(obj[i]);
                    this.value = obj;
                } else if (readTag == 26) {
                    if (this.options == null) {
                        this.options = new EnumOptions();
                    }
                    codedInputByteBufferNano.readMessage(this.options);
                } else if (readTag == 34) {
                    readTag = WireFormatNano.getRepeatedFieldArrayLength(codedInputByteBufferNano, 34);
                    if (this.reservedRange == null) {
                        i = 0;
                    } else {
                        i = this.reservedRange.length;
                    }
                    obj = new EnumReservedRange[(readTag + i)];
                    if (i != 0) {
                        System.arraycopy(this.reservedRange, 0, obj, 0, i);
                    }
                    while (i < obj.length - 1) {
                        obj[i] = new EnumReservedRange();
                        codedInputByteBufferNano.readMessage(obj[i]);
                        codedInputByteBufferNano.readTag();
                        i++;
                    }
                    obj[i] = new EnumReservedRange();
                    codedInputByteBufferNano.readMessage(obj[i]);
                    this.reservedRange = obj;
                } else if (readTag == 42) {
                    readTag = WireFormatNano.getRepeatedFieldArrayLength(codedInputByteBufferNano, 42);
                    if (this.reservedName == null) {
                        i = 0;
                    } else {
                        i = this.reservedName.length;
                    }
                    obj = new String[(readTag + i)];
                    if (i != 0) {
                        System.arraycopy(this.reservedName, 0, obj, 0, i);
                    }
                    while (i < obj.length - 1) {
                        obj[i] = codedInputByteBufferNano.readString();
                        codedInputByteBufferNano.readTag();
                        i++;
                    }
                    obj[i] = codedInputByteBufferNano.readString();
                    this.reservedName = obj;
                } else if (!super.storeUnknownField(codedInputByteBufferNano, readTag)) {
                    return this;
                }
            }
        }

        public static EnumDescriptorProto parseFrom(byte[] bArr) throws InvalidProtocolBufferNanoException {
            return (EnumDescriptorProto) MessageNano.mergeFrom(new EnumDescriptorProto(), bArr);
        }

        public static EnumDescriptorProto parseFrom(CodedInputByteBufferNano codedInputByteBufferNano) throws IOException {
            return new EnumDescriptorProto().mergeFrom(codedInputByteBufferNano);
        }
    }

    public static final class EnumOptions extends ExtendableMessageNano<EnumOptions> {
        private static volatile EnumOptions[] _emptyArray;
        public boolean allowAlias;
        public boolean deprecated;
        public String proto1Name;
        public UninterpretedOption[] uninterpretedOption;

        public static EnumOptions[] emptyArray() {
            if (_emptyArray == null) {
                synchronized (InternalNano.LAZY_INIT_LOCK) {
                    if (_emptyArray == null) {
                        _emptyArray = new EnumOptions[0];
                    }
                }
            }
            return _emptyArray;
        }

        public EnumOptions() {
            clear();
        }

        public EnumOptions clear() {
            this.proto1Name = "";
            this.allowAlias = false;
            this.deprecated = false;
            this.uninterpretedOption = UninterpretedOption.emptyArray();
            this.unknownFieldData = null;
            this.cachedSize = -1;
            return this;
        }

        public void writeTo(CodedOutputByteBufferNano codedOutputByteBufferNano) throws IOException {
            if (!(this.proto1Name == null || this.proto1Name.equals(""))) {
                codedOutputByteBufferNano.writeString(1, this.proto1Name);
            }
            if (this.allowAlias) {
                codedOutputByteBufferNano.writeBool(2, this.allowAlias);
            }
            if (this.deprecated) {
                codedOutputByteBufferNano.writeBool(3, this.deprecated);
            }
            if (this.uninterpretedOption != null && this.uninterpretedOption.length > 0) {
                for (MessageNano messageNano : this.uninterpretedOption) {
                    if (messageNano != null) {
                        codedOutputByteBufferNano.writeMessage(999, messageNano);
                    }
                }
            }
            super.writeTo(codedOutputByteBufferNano);
        }

        protected int computeSerializedSize() {
            int computeSerializedSize = super.computeSerializedSize();
            if (!(this.proto1Name == null || this.proto1Name.equals(""))) {
                computeSerializedSize += CodedOutputByteBufferNano.computeStringSize(1, this.proto1Name);
            }
            if (this.allowAlias) {
                computeSerializedSize += CodedOutputByteBufferNano.computeBoolSize(2, this.allowAlias);
            }
            if (this.deprecated) {
                computeSerializedSize += CodedOutputByteBufferNano.computeBoolSize(3, this.deprecated);
            }
            if (this.uninterpretedOption != null && this.uninterpretedOption.length > 0) {
                for (MessageNano messageNano : this.uninterpretedOption) {
                    if (messageNano != null) {
                        computeSerializedSize += CodedOutputByteBufferNano.computeMessageSize(999, messageNano);
                    }
                }
            }
            return computeSerializedSize;
        }

        public EnumOptions mergeFrom(CodedInputByteBufferNano codedInputByteBufferNano) throws IOException {
            while (true) {
                int readTag = codedInputByteBufferNano.readTag();
                if (readTag == 0) {
                    return this;
                }
                if (readTag == 10) {
                    this.proto1Name = codedInputByteBufferNano.readString();
                } else if (readTag == 16) {
                    this.allowAlias = codedInputByteBufferNano.readBool();
                } else if (readTag == 24) {
                    this.deprecated = codedInputByteBufferNano.readBool();
                } else if (readTag == 7994) {
                    int i;
                    readTag = WireFormatNano.getRepeatedFieldArrayLength(codedInputByteBufferNano, 7994);
                    if (this.uninterpretedOption == null) {
                        i = 0;
                    } else {
                        i = this.uninterpretedOption.length;
                    }
                    Object obj = new UninterpretedOption[(readTag + i)];
                    if (i != 0) {
                        System.arraycopy(this.uninterpretedOption, 0, obj, 0, i);
                    }
                    while (i < obj.length - 1) {
                        obj[i] = new UninterpretedOption();
                        codedInputByteBufferNano.readMessage(obj[i]);
                        codedInputByteBufferNano.readTag();
                        i++;
                    }
                    obj[i] = new UninterpretedOption();
                    codedInputByteBufferNano.readMessage(obj[i]);
                    this.uninterpretedOption = obj;
                } else if (!super.storeUnknownField(codedInputByteBufferNano, readTag)) {
                    return this;
                }
            }
        }

        public static EnumOptions parseFrom(byte[] bArr) throws InvalidProtocolBufferNanoException {
            return (EnumOptions) MessageNano.mergeFrom(new EnumOptions(), bArr);
        }

        public static EnumOptions parseFrom(CodedInputByteBufferNano codedInputByteBufferNano) throws IOException {
            return new EnumOptions().mergeFrom(codedInputByteBufferNano);
        }
    }

    public static final class EnumValueDescriptorProto extends ExtendableMessageNano<EnumValueDescriptorProto> {
        private static volatile EnumValueDescriptorProto[] _emptyArray;
        public String name;
        public int number;
        public EnumValueOptions options;

        public static EnumValueDescriptorProto[] emptyArray() {
            if (_emptyArray == null) {
                synchronized (InternalNano.LAZY_INIT_LOCK) {
                    if (_emptyArray == null) {
                        _emptyArray = new EnumValueDescriptorProto[0];
                    }
                }
            }
            return _emptyArray;
        }

        public EnumValueDescriptorProto() {
            clear();
        }

        public EnumValueDescriptorProto clear() {
            this.name = "";
            this.number = 0;
            this.options = null;
            this.unknownFieldData = null;
            this.cachedSize = -1;
            return this;
        }

        public void writeTo(CodedOutputByteBufferNano codedOutputByteBufferNano) throws IOException {
            if (!(this.name == null || this.name.equals(""))) {
                codedOutputByteBufferNano.writeString(1, this.name);
            }
            if (this.number != 0) {
                codedOutputByteBufferNano.writeInt32(2, this.number);
            }
            if (this.options != null) {
                codedOutputByteBufferNano.writeMessage(3, this.options);
            }
            super.writeTo(codedOutputByteBufferNano);
        }

        protected int computeSerializedSize() {
            int computeSerializedSize = super.computeSerializedSize();
            if (!(this.name == null || this.name.equals(""))) {
                computeSerializedSize += CodedOutputByteBufferNano.computeStringSize(1, this.name);
            }
            if (this.number != 0) {
                computeSerializedSize += CodedOutputByteBufferNano.computeInt32Size(2, this.number);
            }
            if (this.options != null) {
                return computeSerializedSize + CodedOutputByteBufferNano.computeMessageSize(3, this.options);
            }
            return computeSerializedSize;
        }

        public EnumValueDescriptorProto mergeFrom(CodedInputByteBufferNano codedInputByteBufferNano) throws IOException {
            while (true) {
                int readTag = codedInputByteBufferNano.readTag();
                if (readTag == 0) {
                    return this;
                }
                if (readTag == 10) {
                    this.name = codedInputByteBufferNano.readString();
                } else if (readTag == 16) {
                    this.number = codedInputByteBufferNano.readInt32();
                } else if (readTag == 26) {
                    if (this.options == null) {
                        this.options = new EnumValueOptions();
                    }
                    codedInputByteBufferNano.readMessage(this.options);
                } else if (!super.storeUnknownField(codedInputByteBufferNano, readTag)) {
                    return this;
                }
            }
        }

        public static EnumValueDescriptorProto parseFrom(byte[] bArr) throws InvalidProtocolBufferNanoException {
            return (EnumValueDescriptorProto) MessageNano.mergeFrom(new EnumValueDescriptorProto(), bArr);
        }

        public static EnumValueDescriptorProto parseFrom(CodedInputByteBufferNano codedInputByteBufferNano) throws IOException {
            return new EnumValueDescriptorProto().mergeFrom(codedInputByteBufferNano);
        }
    }

    public static final class EnumValueOptions extends ExtendableMessageNano<EnumValueOptions> {
        private static volatile EnumValueOptions[] _emptyArray;
        public boolean deprecated;
        public UninterpretedOption[] uninterpretedOption;

        public static EnumValueOptions[] emptyArray() {
            if (_emptyArray == null) {
                synchronized (InternalNano.LAZY_INIT_LOCK) {
                    if (_emptyArray == null) {
                        _emptyArray = new EnumValueOptions[0];
                    }
                }
            }
            return _emptyArray;
        }

        public EnumValueOptions() {
            clear();
        }

        public EnumValueOptions clear() {
            this.deprecated = false;
            this.uninterpretedOption = UninterpretedOption.emptyArray();
            this.unknownFieldData = null;
            this.cachedSize = -1;
            return this;
        }

        public void writeTo(CodedOutputByteBufferNano codedOutputByteBufferNano) throws IOException {
            if (this.deprecated) {
                codedOutputByteBufferNano.writeBool(1, this.deprecated);
            }
            if (this.uninterpretedOption != null && this.uninterpretedOption.length > 0) {
                for (MessageNano messageNano : this.uninterpretedOption) {
                    if (messageNano != null) {
                        codedOutputByteBufferNano.writeMessage(999, messageNano);
                    }
                }
            }
            super.writeTo(codedOutputByteBufferNano);
        }

        protected int computeSerializedSize() {
            int computeSerializedSize = super.computeSerializedSize();
            if (this.deprecated) {
                computeSerializedSize += CodedOutputByteBufferNano.computeBoolSize(1, this.deprecated);
            }
            if (this.uninterpretedOption != null && this.uninterpretedOption.length > 0) {
                for (MessageNano messageNano : this.uninterpretedOption) {
                    if (messageNano != null) {
                        computeSerializedSize += CodedOutputByteBufferNano.computeMessageSize(999, messageNano);
                    }
                }
            }
            return computeSerializedSize;
        }

        public EnumValueOptions mergeFrom(CodedInputByteBufferNano codedInputByteBufferNano) throws IOException {
            while (true) {
                int readTag = codedInputByteBufferNano.readTag();
                if (readTag == 0) {
                    return this;
                }
                if (readTag == 8) {
                    this.deprecated = codedInputByteBufferNano.readBool();
                } else if (readTag == 7994) {
                    int i;
                    readTag = WireFormatNano.getRepeatedFieldArrayLength(codedInputByteBufferNano, 7994);
                    if (this.uninterpretedOption == null) {
                        i = 0;
                    } else {
                        i = this.uninterpretedOption.length;
                    }
                    Object obj = new UninterpretedOption[(readTag + i)];
                    if (i != 0) {
                        System.arraycopy(this.uninterpretedOption, 0, obj, 0, i);
                    }
                    while (i < obj.length - 1) {
                        obj[i] = new UninterpretedOption();
                        codedInputByteBufferNano.readMessage(obj[i]);
                        codedInputByteBufferNano.readTag();
                        i++;
                    }
                    obj[i] = new UninterpretedOption();
                    codedInputByteBufferNano.readMessage(obj[i]);
                    this.uninterpretedOption = obj;
                } else if (!super.storeUnknownField(codedInputByteBufferNano, readTag)) {
                    return this;
                }
            }
        }

        public static EnumValueOptions parseFrom(byte[] bArr) throws InvalidProtocolBufferNanoException {
            return (EnumValueOptions) MessageNano.mergeFrom(new EnumValueOptions(), bArr);
        }

        public static EnumValueOptions parseFrom(CodedInputByteBufferNano codedInputByteBufferNano) throws IOException {
            return new EnumValueOptions().mergeFrom(codedInputByteBufferNano);
        }
    }

    public static final class ExtensionRangeOptions extends ExtendableMessageNano<ExtensionRangeOptions> {
        private static volatile ExtensionRangeOptions[] _emptyArray;
        public UninterpretedOption[] uninterpretedOption;

        public static ExtensionRangeOptions[] emptyArray() {
            if (_emptyArray == null) {
                synchronized (InternalNano.LAZY_INIT_LOCK) {
                    if (_emptyArray == null) {
                        _emptyArray = new ExtensionRangeOptions[0];
                    }
                }
            }
            return _emptyArray;
        }

        public ExtensionRangeOptions() {
            clear();
        }

        public ExtensionRangeOptions clear() {
            this.uninterpretedOption = UninterpretedOption.emptyArray();
            this.unknownFieldData = null;
            this.cachedSize = -1;
            return this;
        }

        public void writeTo(CodedOutputByteBufferNano codedOutputByteBufferNano) throws IOException {
            if (this.uninterpretedOption != null && this.uninterpretedOption.length > 0) {
                for (MessageNano messageNano : this.uninterpretedOption) {
                    if (messageNano != null) {
                        codedOutputByteBufferNano.writeMessage(999, messageNano);
                    }
                }
            }
            super.writeTo(codedOutputByteBufferNano);
        }

        protected int computeSerializedSize() {
            int computeSerializedSize = super.computeSerializedSize();
            if (this.uninterpretedOption != null && this.uninterpretedOption.length > 0) {
                for (MessageNano messageNano : this.uninterpretedOption) {
                    if (messageNano != null) {
                        computeSerializedSize += CodedOutputByteBufferNano.computeMessageSize(999, messageNano);
                    }
                }
            }
            return computeSerializedSize;
        }

        public ExtensionRangeOptions mergeFrom(CodedInputByteBufferNano codedInputByteBufferNano) throws IOException {
            while (true) {
                int readTag = codedInputByteBufferNano.readTag();
                if (readTag == 0) {
                    return this;
                }
                if (readTag == 7994) {
                    int i;
                    readTag = WireFormatNano.getRepeatedFieldArrayLength(codedInputByteBufferNano, 7994);
                    if (this.uninterpretedOption == null) {
                        i = 0;
                    } else {
                        i = this.uninterpretedOption.length;
                    }
                    Object obj = new UninterpretedOption[(readTag + i)];
                    if (i != 0) {
                        System.arraycopy(this.uninterpretedOption, 0, obj, 0, i);
                    }
                    while (i < obj.length - 1) {
                        obj[i] = new UninterpretedOption();
                        codedInputByteBufferNano.readMessage(obj[i]);
                        codedInputByteBufferNano.readTag();
                        i++;
                    }
                    obj[i] = new UninterpretedOption();
                    codedInputByteBufferNano.readMessage(obj[i]);
                    this.uninterpretedOption = obj;
                } else if (!super.storeUnknownField(codedInputByteBufferNano, readTag)) {
                    return this;
                }
            }
        }

        public static ExtensionRangeOptions parseFrom(byte[] bArr) throws InvalidProtocolBufferNanoException {
            return (ExtensionRangeOptions) MessageNano.mergeFrom(new ExtensionRangeOptions(), bArr);
        }

        public static ExtensionRangeOptions parseFrom(CodedInputByteBufferNano codedInputByteBufferNano) throws IOException {
            return new ExtensionRangeOptions().mergeFrom(codedInputByteBufferNano);
        }
    }

    public static final class FieldDescriptorProto extends ExtendableMessageNano<FieldDescriptorProto> {
        private static volatile FieldDescriptorProto[] _emptyArray;
        public String defaultValue;
        public String extendee;
        public String jsonName;
        @NanoEnumValue(legacy = false, value = Label.class)
        public int label;
        public String name;
        public int number;
        public int oneofIndex;
        public FieldOptions options;
        @NanoEnumValue(legacy = false, value = Type.class)
        public int type;
        public String typeName;

        public interface Label {
            @NanoEnumValue(legacy = false, value = Label.class)
            public static final int LABEL_OPTIONAL = 1;
            @NanoEnumValue(legacy = false, value = Label.class)
            public static final int LABEL_REPEATED = 3;
            @NanoEnumValue(legacy = false, value = Label.class)
            public static final int LABEL_REQUIRED = 2;
        }

        public interface Type {
            @NanoEnumValue(legacy = false, value = Type.class)
            public static final int TYPE_BOOL = 8;
            @NanoEnumValue(legacy = false, value = Type.class)
            public static final int TYPE_BYTES = 12;
            @NanoEnumValue(legacy = false, value = Type.class)
            public static final int TYPE_DOUBLE = 1;
            @NanoEnumValue(legacy = false, value = Type.class)
            public static final int TYPE_ENUM = 14;
            @NanoEnumValue(legacy = false, value = Type.class)
            public static final int TYPE_FIXED32 = 7;
            @NanoEnumValue(legacy = false, value = Type.class)
            public static final int TYPE_FIXED64 = 6;
            @NanoEnumValue(legacy = false, value = Type.class)
            public static final int TYPE_FLOAT = 2;
            @NanoEnumValue(legacy = false, value = Type.class)
            public static final int TYPE_GROUP = 10;
            @NanoEnumValue(legacy = false, value = Type.class)
            public static final int TYPE_INT32 = 5;
            @NanoEnumValue(legacy = false, value = Type.class)
            public static final int TYPE_INT64 = 3;
            @NanoEnumValue(legacy = false, value = Type.class)
            public static final int TYPE_MESSAGE = 11;
            @NanoEnumValue(legacy = false, value = Type.class)
            public static final int TYPE_SFIXED32 = 15;
            @NanoEnumValue(legacy = false, value = Type.class)
            public static final int TYPE_SFIXED64 = 16;
            @NanoEnumValue(legacy = false, value = Type.class)
            public static final int TYPE_SINT32 = 17;
            @NanoEnumValue(legacy = false, value = Type.class)
            public static final int TYPE_SINT64 = 18;
            @NanoEnumValue(legacy = false, value = Type.class)
            public static final int TYPE_STRING = 9;
            @NanoEnumValue(legacy = false, value = Type.class)
            public static final int TYPE_UINT32 = 13;
            @NanoEnumValue(legacy = false, value = Type.class)
            public static final int TYPE_UINT64 = 4;
        }

        @NanoEnumValue(legacy = false, value = Type.class)
        public static int checkTypeOrThrow(int i) {
            if (i >= 1 && i <= 18) {
                return i;
            }
            StringBuilder stringBuilder = new StringBuilder(36);
            stringBuilder.append(i);
            stringBuilder.append(" is not a valid enum Type");
            throw new IllegalArgumentException(stringBuilder.toString());
        }

        @NanoEnumValue(legacy = false, value = Type.class)
        public static int[] checkTypeOrThrow(int[] iArr) {
            iArr = (int[]) iArr.clone();
            for (int checkTypeOrThrow : iArr) {
                checkTypeOrThrow(checkTypeOrThrow);
            }
            return iArr;
        }

        @NanoEnumValue(legacy = false, value = Label.class)
        public static int checkLabelOrThrow(int i) {
            if (i >= 1 && i <= 3) {
                return i;
            }
            StringBuilder stringBuilder = new StringBuilder(37);
            stringBuilder.append(i);
            stringBuilder.append(" is not a valid enum Label");
            throw new IllegalArgumentException(stringBuilder.toString());
        }

        @NanoEnumValue(legacy = false, value = Label.class)
        public static int[] checkLabelOrThrow(int[] iArr) {
            iArr = (int[]) iArr.clone();
            for (int checkLabelOrThrow : iArr) {
                checkLabelOrThrow(checkLabelOrThrow);
            }
            return iArr;
        }

        public static FieldDescriptorProto[] emptyArray() {
            if (_emptyArray == null) {
                synchronized (InternalNano.LAZY_INIT_LOCK) {
                    if (_emptyArray == null) {
                        _emptyArray = new FieldDescriptorProto[0];
                    }
                }
            }
            return _emptyArray;
        }

        public FieldDescriptorProto() {
            clear();
        }

        public FieldDescriptorProto clear() {
            this.name = "";
            this.number = 0;
            this.label = 1;
            this.type = 1;
            this.typeName = "";
            this.extendee = "";
            this.defaultValue = "";
            this.oneofIndex = 0;
            this.jsonName = "";
            this.options = null;
            this.unknownFieldData = null;
            this.cachedSize = -1;
            return this;
        }

        public void writeTo(CodedOutputByteBufferNano codedOutputByteBufferNano) throws IOException {
            if (!(this.name == null || this.name.equals(""))) {
                codedOutputByteBufferNano.writeString(1, this.name);
            }
            if (!(this.extendee == null || this.extendee.equals(""))) {
                codedOutputByteBufferNano.writeString(2, this.extendee);
            }
            if (this.number != 0) {
                codedOutputByteBufferNano.writeInt32(3, this.number);
            }
            if (this.label != 1) {
                codedOutputByteBufferNano.writeInt32(4, this.label);
            }
            if (this.type != 1) {
                codedOutputByteBufferNano.writeInt32(5, this.type);
            }
            if (!(this.typeName == null || this.typeName.equals(""))) {
                codedOutputByteBufferNano.writeString(6, this.typeName);
            }
            if (!(this.defaultValue == null || this.defaultValue.equals(""))) {
                codedOutputByteBufferNano.writeString(7, this.defaultValue);
            }
            if (this.options != null) {
                codedOutputByteBufferNano.writeMessage(8, this.options);
            }
            if (this.oneofIndex != 0) {
                codedOutputByteBufferNano.writeInt32(9, this.oneofIndex);
            }
            if (!(this.jsonName == null || this.jsonName.equals(""))) {
                codedOutputByteBufferNano.writeString(10, this.jsonName);
            }
            super.writeTo(codedOutputByteBufferNano);
        }

        protected int computeSerializedSize() {
            int computeSerializedSize = super.computeSerializedSize();
            if (!(this.name == null || this.name.equals(""))) {
                computeSerializedSize += CodedOutputByteBufferNano.computeStringSize(1, this.name);
            }
            if (!(this.extendee == null || this.extendee.equals(""))) {
                computeSerializedSize += CodedOutputByteBufferNano.computeStringSize(2, this.extendee);
            }
            if (this.number != 0) {
                computeSerializedSize += CodedOutputByteBufferNano.computeInt32Size(3, this.number);
            }
            if (this.label != 1) {
                computeSerializedSize += CodedOutputByteBufferNano.computeInt32Size(4, this.label);
            }
            if (this.type != 1) {
                computeSerializedSize += CodedOutputByteBufferNano.computeInt32Size(5, this.type);
            }
            if (!(this.typeName == null || this.typeName.equals(""))) {
                computeSerializedSize += CodedOutputByteBufferNano.computeStringSize(6, this.typeName);
            }
            if (!(this.defaultValue == null || this.defaultValue.equals(""))) {
                computeSerializedSize += CodedOutputByteBufferNano.computeStringSize(7, this.defaultValue);
            }
            if (this.options != null) {
                computeSerializedSize += CodedOutputByteBufferNano.computeMessageSize(8, this.options);
            }
            if (this.oneofIndex != 0) {
                computeSerializedSize += CodedOutputByteBufferNano.computeInt32Size(9, this.oneofIndex);
            }
            if (this.jsonName == null || this.jsonName.equals("")) {
                return computeSerializedSize;
            }
            return computeSerializedSize + CodedOutputByteBufferNano.computeStringSize(10, this.jsonName);
        }

        public FieldDescriptorProto mergeFrom(CodedInputByteBufferNano codedInputByteBufferNano) throws IOException {
            int position;
            while (true) {
                int readTag = codedInputByteBufferNano.readTag();
                switch (readTag) {
                    case 0:
                        return this;
                    case 10:
                        this.name = codedInputByteBufferNano.readString();
                        break;
                    case 18:
                        this.extendee = codedInputByteBufferNano.readString();
                        break;
                    case 24:
                        this.number = codedInputByteBufferNano.readInt32();
                        break;
                    case 32:
                        position = codedInputByteBufferNano.getPosition();
                        try {
                            this.label = checkLabelOrThrow(codedInputByteBufferNano.readInt32());
                            break;
                        } catch (IllegalArgumentException e) {
                            codedInputByteBufferNano.rewindToPosition(position);
                            storeUnknownField(codedInputByteBufferNano, readTag);
                            break;
                        }
                    case 40:
                        position = codedInputByteBufferNano.getPosition();
                        try {
                            this.type = checkTypeOrThrow(codedInputByteBufferNano.readInt32());
                            break;
                        } catch (IllegalArgumentException e2) {
                            codedInputByteBufferNano.rewindToPosition(position);
                            storeUnknownField(codedInputByteBufferNano, readTag);
                            break;
                        }
                    case 50:
                        this.typeName = codedInputByteBufferNano.readString();
                        break;
                    case 58:
                        this.defaultValue = codedInputByteBufferNano.readString();
                        break;
                    case 66:
                        if (this.options == null) {
                            this.options = new FieldOptions();
                        }
                        codedInputByteBufferNano.readMessage(this.options);
                        break;
                    case 72:
                        this.oneofIndex = codedInputByteBufferNano.readInt32();
                        break;
                    case 82:
                        this.jsonName = codedInputByteBufferNano.readString();
                        break;
                    default:
                        if (super.storeUnknownField(codedInputByteBufferNano, readTag)) {
                            break;
                        }
                        return this;
                }
            }
        }

        public static FieldDescriptorProto parseFrom(byte[] bArr) throws InvalidProtocolBufferNanoException {
            return (FieldDescriptorProto) MessageNano.mergeFrom(new FieldDescriptorProto(), bArr);
        }

        public static FieldDescriptorProto parseFrom(CodedInputByteBufferNano codedInputByteBufferNano) throws IOException {
            return new FieldDescriptorProto().mergeFrom(codedInputByteBufferNano);
        }
    }

    public static final class FieldOptions extends ExtendableMessageNano<FieldOptions> {
        private static volatile FieldOptions[] _emptyArray;
        @NanoEnumValue(legacy = false, value = CType.class)
        public int ctype;
        public boolean deprecated;
        public boolean deprecatedRawMessage;
        public boolean enforceUtf8;
        @NanoEnumValue(legacy = false, value = JSType.class)
        public int jstype;
        public boolean lazy;
        public boolean packed;
        public UninterpretedOption[] uninterpretedOption;
        public UpgradedOption[] upgradedOption;
        public boolean weak;

        public interface CType {
            @NanoEnumValue(legacy = false, value = CType.class)
            public static final int CORD = 1;
            @NanoEnumValue(legacy = false, value = CType.class)
            public static final int STRING = 0;
            @NanoEnumValue(legacy = false, value = CType.class)
            public static final int STRING_PIECE = 2;
        }

        public interface JSType {
            @NanoEnumValue(legacy = false, value = JSType.class)
            public static final int JS_NORMAL = 0;
            @NanoEnumValue(legacy = false, value = JSType.class)
            public static final int JS_NUMBER = 2;
            @NanoEnumValue(legacy = false, value = JSType.class)
            public static final int JS_STRING = 1;
        }

        public static final class UpgradedOption extends ExtendableMessageNano<UpgradedOption> {
            private static volatile UpgradedOption[] _emptyArray;
            public String name;
            public String value;

            public static UpgradedOption[] emptyArray() {
                if (_emptyArray == null) {
                    synchronized (InternalNano.LAZY_INIT_LOCK) {
                        if (_emptyArray == null) {
                            _emptyArray = new UpgradedOption[0];
                        }
                    }
                }
                return _emptyArray;
            }

            public UpgradedOption() {
                clear();
            }

            public UpgradedOption clear() {
                this.name = "";
                this.value = "";
                this.unknownFieldData = null;
                this.cachedSize = -1;
                return this;
            }

            public void writeTo(CodedOutputByteBufferNano codedOutputByteBufferNano) throws IOException {
                if (!(this.name == null || this.name.equals(""))) {
                    codedOutputByteBufferNano.writeString(1, this.name);
                }
                if (!(this.value == null || this.value.equals(""))) {
                    codedOutputByteBufferNano.writeString(2, this.value);
                }
                super.writeTo(codedOutputByteBufferNano);
            }

            protected int computeSerializedSize() {
                int computeSerializedSize = super.computeSerializedSize();
                if (!(this.name == null || this.name.equals(""))) {
                    computeSerializedSize += CodedOutputByteBufferNano.computeStringSize(1, this.name);
                }
                if (this.value == null || this.value.equals("")) {
                    return computeSerializedSize;
                }
                return computeSerializedSize + CodedOutputByteBufferNano.computeStringSize(2, this.value);
            }

            public UpgradedOption mergeFrom(CodedInputByteBufferNano codedInputByteBufferNano) throws IOException {
                while (true) {
                    int readTag = codedInputByteBufferNano.readTag();
                    if (readTag == 0) {
                        return this;
                    }
                    if (readTag == 10) {
                        this.name = codedInputByteBufferNano.readString();
                    } else if (readTag == 18) {
                        this.value = codedInputByteBufferNano.readString();
                    } else if (!super.storeUnknownField(codedInputByteBufferNano, readTag)) {
                        return this;
                    }
                }
            }

            public static UpgradedOption parseFrom(byte[] bArr) throws InvalidProtocolBufferNanoException {
                return (UpgradedOption) MessageNano.mergeFrom(new UpgradedOption(), bArr);
            }

            public static UpgradedOption parseFrom(CodedInputByteBufferNano codedInputByteBufferNano) throws IOException {
                return new UpgradedOption().mergeFrom(codedInputByteBufferNano);
            }
        }

        @NanoEnumValue(legacy = false, value = CType.class)
        public static int checkCTypeOrThrow(int i) {
            if (i >= 0 && i <= 2) {
                return i;
            }
            StringBuilder stringBuilder = new StringBuilder(37);
            stringBuilder.append(i);
            stringBuilder.append(" is not a valid enum CType");
            throw new IllegalArgumentException(stringBuilder.toString());
        }

        @NanoEnumValue(legacy = false, value = CType.class)
        public static int[] checkCTypeOrThrow(int[] iArr) {
            iArr = (int[]) iArr.clone();
            for (int checkCTypeOrThrow : iArr) {
                checkCTypeOrThrow(checkCTypeOrThrow);
            }
            return iArr;
        }

        @NanoEnumValue(legacy = false, value = JSType.class)
        public static int checkJSTypeOrThrow(int i) {
            if (i >= 0 && i <= 2) {
                return i;
            }
            StringBuilder stringBuilder = new StringBuilder(38);
            stringBuilder.append(i);
            stringBuilder.append(" is not a valid enum JSType");
            throw new IllegalArgumentException(stringBuilder.toString());
        }

        @NanoEnumValue(legacy = false, value = JSType.class)
        public static int[] checkJSTypeOrThrow(int[] iArr) {
            iArr = (int[]) iArr.clone();
            for (int checkJSTypeOrThrow : iArr) {
                checkJSTypeOrThrow(checkJSTypeOrThrow);
            }
            return iArr;
        }

        public static FieldOptions[] emptyArray() {
            if (_emptyArray == null) {
                synchronized (InternalNano.LAZY_INIT_LOCK) {
                    if (_emptyArray == null) {
                        _emptyArray = new FieldOptions[0];
                    }
                }
            }
            return _emptyArray;
        }

        public FieldOptions() {
            clear();
        }

        public FieldOptions clear() {
            this.ctype = 0;
            this.packed = false;
            this.jstype = 0;
            this.lazy = false;
            this.deprecated = false;
            this.weak = false;
            this.upgradedOption = UpgradedOption.emptyArray();
            this.deprecatedRawMessage = false;
            this.enforceUtf8 = true;
            this.uninterpretedOption = UninterpretedOption.emptyArray();
            this.unknownFieldData = null;
            this.cachedSize = -1;
            return this;
        }

        public void writeTo(CodedOutputByteBufferNano codedOutputByteBufferNano) throws IOException {
            if (this.ctype != 0) {
                codedOutputByteBufferNano.writeInt32(1, this.ctype);
            }
            if (this.packed) {
                codedOutputByteBufferNano.writeBool(2, this.packed);
            }
            if (this.deprecated) {
                codedOutputByteBufferNano.writeBool(3, this.deprecated);
            }
            if (this.lazy) {
                codedOutputByteBufferNano.writeBool(5, this.lazy);
            }
            if (this.jstype != 0) {
                codedOutputByteBufferNano.writeInt32(6, this.jstype);
            }
            if (this.weak) {
                codedOutputByteBufferNano.writeBool(10, this.weak);
            }
            int i = 0;
            if (this.upgradedOption != null && this.upgradedOption.length > 0) {
                for (MessageNano messageNano : this.upgradedOption) {
                    if (messageNano != null) {
                        codedOutputByteBufferNano.writeMessage(11, messageNano);
                    }
                }
            }
            if (this.deprecatedRawMessage) {
                codedOutputByteBufferNano.writeBool(12, this.deprecatedRawMessage);
            }
            if (!this.enforceUtf8) {
                codedOutputByteBufferNano.writeBool(13, this.enforceUtf8);
            }
            if (this.uninterpretedOption != null && this.uninterpretedOption.length > 0) {
                while (i < this.uninterpretedOption.length) {
                    MessageNano messageNano2 = this.uninterpretedOption[i];
                    if (messageNano2 != null) {
                        codedOutputByteBufferNano.writeMessage(999, messageNano2);
                    }
                    i++;
                }
            }
            super.writeTo(codedOutputByteBufferNano);
        }

        protected int computeSerializedSize() {
            int computeSerializedSize = super.computeSerializedSize();
            if (this.ctype != 0) {
                computeSerializedSize += CodedOutputByteBufferNano.computeInt32Size(1, this.ctype);
            }
            if (this.packed) {
                computeSerializedSize += CodedOutputByteBufferNano.computeBoolSize(2, this.packed);
            }
            if (this.deprecated) {
                computeSerializedSize += CodedOutputByteBufferNano.computeBoolSize(3, this.deprecated);
            }
            if (this.lazy) {
                computeSerializedSize += CodedOutputByteBufferNano.computeBoolSize(5, this.lazy);
            }
            if (this.jstype != 0) {
                computeSerializedSize += CodedOutputByteBufferNano.computeInt32Size(6, this.jstype);
            }
            if (this.weak) {
                computeSerializedSize += CodedOutputByteBufferNano.computeBoolSize(10, this.weak);
            }
            int i = 0;
            if (this.upgradedOption != null && this.upgradedOption.length > 0) {
                int i2 = computeSerializedSize;
                for (MessageNano messageNano : this.upgradedOption) {
                    if (messageNano != null) {
                        i2 += CodedOutputByteBufferNano.computeMessageSize(11, messageNano);
                    }
                }
                computeSerializedSize = i2;
            }
            if (this.deprecatedRawMessage) {
                computeSerializedSize += CodedOutputByteBufferNano.computeBoolSize(12, this.deprecatedRawMessage);
            }
            if (!this.enforceUtf8) {
                computeSerializedSize += CodedOutputByteBufferNano.computeBoolSize(13, this.enforceUtf8);
            }
            if (this.uninterpretedOption != null && this.uninterpretedOption.length > 0) {
                while (i < this.uninterpretedOption.length) {
                    MessageNano messageNano2 = this.uninterpretedOption[i];
                    if (messageNano2 != null) {
                        computeSerializedSize += CodedOutputByteBufferNano.computeMessageSize(999, messageNano2);
                    }
                    i++;
                }
            }
            return computeSerializedSize;
        }

        public FieldOptions mergeFrom(CodedInputByteBufferNano codedInputByteBufferNano) throws IOException {
            int position;
            while (true) {
                int readTag = codedInputByteBufferNano.readTag();
                int i;
                Object obj;
                switch (readTag) {
                    case 0:
                        return this;
                    case 8:
                        position = codedInputByteBufferNano.getPosition();
                        try {
                            this.ctype = checkCTypeOrThrow(codedInputByteBufferNano.readInt32());
                            break;
                        } catch (IllegalArgumentException e) {
                            codedInputByteBufferNano.rewindToPosition(position);
                            storeUnknownField(codedInputByteBufferNano, readTag);
                            break;
                        }
                    case 16:
                        this.packed = codedInputByteBufferNano.readBool();
                        break;
                    case 24:
                        this.deprecated = codedInputByteBufferNano.readBool();
                        break;
                    case 40:
                        this.lazy = codedInputByteBufferNano.readBool();
                        break;
                    case 48:
                        position = codedInputByteBufferNano.getPosition();
                        try {
                            this.jstype = checkJSTypeOrThrow(codedInputByteBufferNano.readInt32());
                            break;
                        } catch (IllegalArgumentException e2) {
                            codedInputByteBufferNano.rewindToPosition(position);
                            storeUnknownField(codedInputByteBufferNano, readTag);
                            break;
                        }
                    case 80:
                        this.weak = codedInputByteBufferNano.readBool();
                        break;
                    case 90:
                        readTag = WireFormatNano.getRepeatedFieldArrayLength(codedInputByteBufferNano, 90);
                        if (this.upgradedOption == null) {
                            i = 0;
                        } else {
                            i = this.upgradedOption.length;
                        }
                        obj = new UpgradedOption[(readTag + i)];
                        if (i != 0) {
                            System.arraycopy(this.upgradedOption, 0, obj, 0, i);
                        }
                        while (i < obj.length - 1) {
                            obj[i] = new UpgradedOption();
                            codedInputByteBufferNano.readMessage(obj[i]);
                            codedInputByteBufferNano.readTag();
                            i++;
                        }
                        obj[i] = new UpgradedOption();
                        codedInputByteBufferNano.readMessage(obj[i]);
                        this.upgradedOption = obj;
                        break;
                    case 96:
                        this.deprecatedRawMessage = codedInputByteBufferNano.readBool();
                        break;
                    case 104:
                        this.enforceUtf8 = codedInputByteBufferNano.readBool();
                        break;
                    case 7994:
                        readTag = WireFormatNano.getRepeatedFieldArrayLength(codedInputByteBufferNano, 7994);
                        if (this.uninterpretedOption == null) {
                            i = 0;
                        } else {
                            i = this.uninterpretedOption.length;
                        }
                        obj = new UninterpretedOption[(readTag + i)];
                        if (i != 0) {
                            System.arraycopy(this.uninterpretedOption, 0, obj, 0, i);
                        }
                        while (i < obj.length - 1) {
                            obj[i] = new UninterpretedOption();
                            codedInputByteBufferNano.readMessage(obj[i]);
                            codedInputByteBufferNano.readTag();
                            i++;
                        }
                        obj[i] = new UninterpretedOption();
                        codedInputByteBufferNano.readMessage(obj[i]);
                        this.uninterpretedOption = obj;
                        break;
                    default:
                        if (super.storeUnknownField(codedInputByteBufferNano, readTag)) {
                            break;
                        }
                        return this;
                }
            }
        }

        public static FieldOptions parseFrom(byte[] bArr) throws InvalidProtocolBufferNanoException {
            return (FieldOptions) MessageNano.mergeFrom(new FieldOptions(), bArr);
        }

        public static FieldOptions parseFrom(CodedInputByteBufferNano codedInputByteBufferNano) throws IOException {
            return new FieldOptions().mergeFrom(codedInputByteBufferNano);
        }
    }

    public static final class FileDescriptorProto extends ExtendableMessageNano<FileDescriptorProto> {
        private static volatile FileDescriptorProto[] _emptyArray;
        public String[] dependency;
        public EnumDescriptorProto[] enumType;
        public FieldDescriptorProto[] extension;
        public DescriptorProto[] messageType;
        public String name;
        public FileOptions options;
        public String package_;
        public int[] publicDependency;
        public ServiceDescriptorProto[] service;
        public SourceCodeInfo sourceCodeInfo;
        public String syntax;
        public int[] weakDependency;

        public static FileDescriptorProto[] emptyArray() {
            if (_emptyArray == null) {
                synchronized (InternalNano.LAZY_INIT_LOCK) {
                    if (_emptyArray == null) {
                        _emptyArray = new FileDescriptorProto[0];
                    }
                }
            }
            return _emptyArray;
        }

        public FileDescriptorProto() {
            clear();
        }

        public FileDescriptorProto clear() {
            this.name = "";
            this.package_ = "";
            this.dependency = WireFormatNano.EMPTY_STRING_ARRAY;
            this.publicDependency = WireFormatNano.EMPTY_INT_ARRAY;
            this.weakDependency = WireFormatNano.EMPTY_INT_ARRAY;
            this.messageType = DescriptorProto.emptyArray();
            this.enumType = EnumDescriptorProto.emptyArray();
            this.service = ServiceDescriptorProto.emptyArray();
            this.extension = FieldDescriptorProto.emptyArray();
            this.options = null;
            this.sourceCodeInfo = null;
            this.syntax = "";
            this.unknownFieldData = null;
            this.cachedSize = -1;
            return this;
        }

        public void writeTo(CodedOutputByteBufferNano codedOutputByteBufferNano) throws IOException {
            if (!(this.name == null || this.name.equals(""))) {
                codedOutputByteBufferNano.writeString(1, this.name);
            }
            if (!(this.package_ == null || this.package_.equals(""))) {
                codedOutputByteBufferNano.writeString(2, this.package_);
            }
            int i = 0;
            if (this.dependency != null && this.dependency.length > 0) {
                for (String str : this.dependency) {
                    if (str != null) {
                        codedOutputByteBufferNano.writeString(3, str);
                    }
                }
            }
            if (this.messageType != null && this.messageType.length > 0) {
                for (MessageNano messageNano : this.messageType) {
                    if (messageNano != null) {
                        codedOutputByteBufferNano.writeMessage(4, messageNano);
                    }
                }
            }
            if (this.enumType != null && this.enumType.length > 0) {
                for (MessageNano messageNano2 : this.enumType) {
                    if (messageNano2 != null) {
                        codedOutputByteBufferNano.writeMessage(5, messageNano2);
                    }
                }
            }
            if (this.service != null && this.service.length > 0) {
                for (MessageNano messageNano22 : this.service) {
                    if (messageNano22 != null) {
                        codedOutputByteBufferNano.writeMessage(6, messageNano22);
                    }
                }
            }
            if (this.extension != null && this.extension.length > 0) {
                for (MessageNano messageNano222 : this.extension) {
                    if (messageNano222 != null) {
                        codedOutputByteBufferNano.writeMessage(7, messageNano222);
                    }
                }
            }
            if (this.options != null) {
                codedOutputByteBufferNano.writeMessage(8, this.options);
            }
            if (this.sourceCodeInfo != null) {
                codedOutputByteBufferNano.writeMessage(9, this.sourceCodeInfo);
            }
            if (this.publicDependency != null && this.publicDependency.length > 0) {
                for (int writeInt32 : this.publicDependency) {
                    codedOutputByteBufferNano.writeInt32(10, writeInt32);
                }
            }
            if (this.weakDependency != null && this.weakDependency.length > 0) {
                while (i < this.weakDependency.length) {
                    codedOutputByteBufferNano.writeInt32(11, this.weakDependency[i]);
                    i++;
                }
            }
            if (!(this.syntax == null || this.syntax.equals(""))) {
                codedOutputByteBufferNano.writeString(12, this.syntax);
            }
            super.writeTo(codedOutputByteBufferNano);
        }

        protected int computeSerializedSize() {
            int i;
            int i2;
            int computeSerializedSize = super.computeSerializedSize();
            if (!(this.name == null || this.name.equals(""))) {
                computeSerializedSize += CodedOutputByteBufferNano.computeStringSize(1, this.name);
            }
            if (!(this.package_ == null || this.package_.equals(""))) {
                computeSerializedSize += CodedOutputByteBufferNano.computeStringSize(2, this.package_);
            }
            int i3 = 0;
            if (this.dependency != null && this.dependency.length > 0) {
                i = 0;
                i2 = i;
                int i4 = i2;
                while (i < this.dependency.length) {
                    String str = this.dependency[i];
                    if (str != null) {
                        i4++;
                        i2 += CodedOutputByteBufferNano.computeStringSizeNoTag(str);
                    }
                    i++;
                }
                computeSerializedSize = (computeSerializedSize + i2) + (i4 * 1);
            }
            if (this.messageType != null && this.messageType.length > 0) {
                i = computeSerializedSize;
                for (MessageNano messageNano : this.messageType) {
                    if (messageNano != null) {
                        i += CodedOutputByteBufferNano.computeMessageSize(4, messageNano);
                    }
                }
                computeSerializedSize = i;
            }
            if (this.enumType != null && this.enumType.length > 0) {
                i = computeSerializedSize;
                for (MessageNano messageNano2 : this.enumType) {
                    if (messageNano2 != null) {
                        i += CodedOutputByteBufferNano.computeMessageSize(5, messageNano2);
                    }
                }
                computeSerializedSize = i;
            }
            if (this.service != null && this.service.length > 0) {
                i = computeSerializedSize;
                for (MessageNano messageNano22 : this.service) {
                    if (messageNano22 != null) {
                        i += CodedOutputByteBufferNano.computeMessageSize(6, messageNano22);
                    }
                }
                computeSerializedSize = i;
            }
            if (this.extension != null && this.extension.length > 0) {
                i = computeSerializedSize;
                for (MessageNano messageNano222 : this.extension) {
                    if (messageNano222 != null) {
                        i += CodedOutputByteBufferNano.computeMessageSize(7, messageNano222);
                    }
                }
                computeSerializedSize = i;
            }
            if (this.options != null) {
                computeSerializedSize += CodedOutputByteBufferNano.computeMessageSize(8, this.options);
            }
            if (this.sourceCodeInfo != null) {
                computeSerializedSize += CodedOutputByteBufferNano.computeMessageSize(9, this.sourceCodeInfo);
            }
            if (this.publicDependency != null && this.publicDependency.length > 0) {
                i = 0;
                i2 = i;
                while (i < this.publicDependency.length) {
                    i2 += CodedOutputByteBufferNano.computeInt32SizeNoTag(this.publicDependency[i]);
                    i++;
                }
                computeSerializedSize = (computeSerializedSize + i2) + (this.publicDependency.length * 1);
            }
            if (this.weakDependency != null && this.weakDependency.length > 0) {
                i = 0;
                while (i3 < this.weakDependency.length) {
                    i += CodedOutputByteBufferNano.computeInt32SizeNoTag(this.weakDependency[i3]);
                    i3++;
                }
                computeSerializedSize = (computeSerializedSize + i) + (1 * this.weakDependency.length);
            }
            if (this.syntax == null || this.syntax.equals("")) {
                return computeSerializedSize;
            }
            return computeSerializedSize + CodedOutputByteBufferNano.computeStringSize(12, this.syntax);
        }

        public FileDescriptorProto mergeFrom(CodedInputByteBufferNano codedInputByteBufferNano) throws IOException {
            while (true) {
                int readTag = codedInputByteBufferNano.readTag();
                int i;
                Object obj;
                int i2;
                Object obj2;
                switch (readTag) {
                    case 0:
                        return this;
                    case 10:
                        this.name = codedInputByteBufferNano.readString();
                        break;
                    case 18:
                        this.package_ = codedInputByteBufferNano.readString();
                        break;
                    case 26:
                        readTag = WireFormatNano.getRepeatedFieldArrayLength(codedInputByteBufferNano, 26);
                        if (this.dependency == null) {
                            i = 0;
                        } else {
                            i = this.dependency.length;
                        }
                        obj = new String[(readTag + i)];
                        if (i != 0) {
                            System.arraycopy(this.dependency, 0, obj, 0, i);
                        }
                        while (i < obj.length - 1) {
                            obj[i] = codedInputByteBufferNano.readString();
                            codedInputByteBufferNano.readTag();
                            i++;
                        }
                        obj[i] = codedInputByteBufferNano.readString();
                        this.dependency = obj;
                        break;
                    case 34:
                        readTag = WireFormatNano.getRepeatedFieldArrayLength(codedInputByteBufferNano, 34);
                        if (this.messageType == null) {
                            i = 0;
                        } else {
                            i = this.messageType.length;
                        }
                        obj = new DescriptorProto[(readTag + i)];
                        if (i != 0) {
                            System.arraycopy(this.messageType, 0, obj, 0, i);
                        }
                        while (i < obj.length - 1) {
                            obj[i] = new DescriptorProto();
                            codedInputByteBufferNano.readMessage(obj[i]);
                            codedInputByteBufferNano.readTag();
                            i++;
                        }
                        obj[i] = new DescriptorProto();
                        codedInputByteBufferNano.readMessage(obj[i]);
                        this.messageType = obj;
                        break;
                    case 42:
                        readTag = WireFormatNano.getRepeatedFieldArrayLength(codedInputByteBufferNano, 42);
                        if (this.enumType == null) {
                            i = 0;
                        } else {
                            i = this.enumType.length;
                        }
                        obj = new EnumDescriptorProto[(readTag + i)];
                        if (i != 0) {
                            System.arraycopy(this.enumType, 0, obj, 0, i);
                        }
                        while (i < obj.length - 1) {
                            obj[i] = new EnumDescriptorProto();
                            codedInputByteBufferNano.readMessage(obj[i]);
                            codedInputByteBufferNano.readTag();
                            i++;
                        }
                        obj[i] = new EnumDescriptorProto();
                        codedInputByteBufferNano.readMessage(obj[i]);
                        this.enumType = obj;
                        break;
                    case 50:
                        readTag = WireFormatNano.getRepeatedFieldArrayLength(codedInputByteBufferNano, 50);
                        if (this.service == null) {
                            i = 0;
                        } else {
                            i = this.service.length;
                        }
                        obj = new ServiceDescriptorProto[(readTag + i)];
                        if (i != 0) {
                            System.arraycopy(this.service, 0, obj, 0, i);
                        }
                        while (i < obj.length - 1) {
                            obj[i] = new ServiceDescriptorProto();
                            codedInputByteBufferNano.readMessage(obj[i]);
                            codedInputByteBufferNano.readTag();
                            i++;
                        }
                        obj[i] = new ServiceDescriptorProto();
                        codedInputByteBufferNano.readMessage(obj[i]);
                        this.service = obj;
                        break;
                    case 58:
                        readTag = WireFormatNano.getRepeatedFieldArrayLength(codedInputByteBufferNano, 58);
                        if (this.extension == null) {
                            i = 0;
                        } else {
                            i = this.extension.length;
                        }
                        obj = new FieldDescriptorProto[(readTag + i)];
                        if (i != 0) {
                            System.arraycopy(this.extension, 0, obj, 0, i);
                        }
                        while (i < obj.length - 1) {
                            obj[i] = new FieldDescriptorProto();
                            codedInputByteBufferNano.readMessage(obj[i]);
                            codedInputByteBufferNano.readTag();
                            i++;
                        }
                        obj[i] = new FieldDescriptorProto();
                        codedInputByteBufferNano.readMessage(obj[i]);
                        this.extension = obj;
                        break;
                    case 66:
                        if (this.options == null) {
                            this.options = new FileOptions();
                        }
                        codedInputByteBufferNano.readMessage(this.options);
                        break;
                    case 74:
                        if (this.sourceCodeInfo == null) {
                            this.sourceCodeInfo = new SourceCodeInfo();
                        }
                        codedInputByteBufferNano.readMessage(this.sourceCodeInfo);
                        break;
                    case 80:
                        readTag = WireFormatNano.getRepeatedFieldArrayLength(codedInputByteBufferNano, 80);
                        if (this.publicDependency == null) {
                            i = 0;
                        } else {
                            i = this.publicDependency.length;
                        }
                        obj = new int[(readTag + i)];
                        if (i != 0) {
                            System.arraycopy(this.publicDependency, 0, obj, 0, i);
                        }
                        while (i < obj.length - 1) {
                            obj[i] = codedInputByteBufferNano.readInt32();
                            codedInputByteBufferNano.readTag();
                            i++;
                        }
                        obj[i] = codedInputByteBufferNano.readInt32();
                        this.publicDependency = obj;
                        break;
                    case 82:
                        readTag = codedInputByteBufferNano.pushLimit(codedInputByteBufferNano.readRawVarint32());
                        i = codedInputByteBufferNano.getPosition();
                        i2 = 0;
                        while (codedInputByteBufferNano.getBytesUntilLimit() > 0) {
                            codedInputByteBufferNano.readInt32();
                            i2++;
                        }
                        codedInputByteBufferNano.rewindToPosition(i);
                        if (this.publicDependency == null) {
                            i = 0;
                        } else {
                            i = this.publicDependency.length;
                        }
                        obj2 = new int[(i2 + i)];
                        if (i != 0) {
                            System.arraycopy(this.publicDependency, 0, obj2, 0, i);
                        }
                        while (i < obj2.length) {
                            obj2[i] = codedInputByteBufferNano.readInt32();
                            i++;
                        }
                        this.publicDependency = obj2;
                        codedInputByteBufferNano.popLimit(readTag);
                        break;
                    case 88:
                        readTag = WireFormatNano.getRepeatedFieldArrayLength(codedInputByteBufferNano, 88);
                        if (this.weakDependency == null) {
                            i = 0;
                        } else {
                            i = this.weakDependency.length;
                        }
                        obj = new int[(readTag + i)];
                        if (i != 0) {
                            System.arraycopy(this.weakDependency, 0, obj, 0, i);
                        }
                        while (i < obj.length - 1) {
                            obj[i] = codedInputByteBufferNano.readInt32();
                            codedInputByteBufferNano.readTag();
                            i++;
                        }
                        obj[i] = codedInputByteBufferNano.readInt32();
                        this.weakDependency = obj;
                        break;
                    case 90:
                        readTag = codedInputByteBufferNano.pushLimit(codedInputByteBufferNano.readRawVarint32());
                        i = codedInputByteBufferNano.getPosition();
                        i2 = 0;
                        while (codedInputByteBufferNano.getBytesUntilLimit() > 0) {
                            codedInputByteBufferNano.readInt32();
                            i2++;
                        }
                        codedInputByteBufferNano.rewindToPosition(i);
                        if (this.weakDependency == null) {
                            i = 0;
                        } else {
                            i = this.weakDependency.length;
                        }
                        obj2 = new int[(i2 + i)];
                        if (i != 0) {
                            System.arraycopy(this.weakDependency, 0, obj2, 0, i);
                        }
                        while (i < obj2.length) {
                            obj2[i] = codedInputByteBufferNano.readInt32();
                            i++;
                        }
                        this.weakDependency = obj2;
                        codedInputByteBufferNano.popLimit(readTag);
                        break;
                    case 98:
                        this.syntax = codedInputByteBufferNano.readString();
                        break;
                    default:
                        if (super.storeUnknownField(codedInputByteBufferNano, readTag)) {
                            break;
                        }
                        return this;
                }
            }
        }

        public static FileDescriptorProto parseFrom(byte[] bArr) throws InvalidProtocolBufferNanoException {
            return (FileDescriptorProto) MessageNano.mergeFrom(new FileDescriptorProto(), bArr);
        }

        public static FileDescriptorProto parseFrom(CodedInputByteBufferNano codedInputByteBufferNano) throws IOException {
            return new FileDescriptorProto().mergeFrom(codedInputByteBufferNano);
        }
    }

    public static final class FileDescriptorSet extends ExtendableMessageNano<FileDescriptorSet> {
        private static volatile FileDescriptorSet[] _emptyArray;
        public FileDescriptorProto[] file;

        public static FileDescriptorSet[] emptyArray() {
            if (_emptyArray == null) {
                synchronized (InternalNano.LAZY_INIT_LOCK) {
                    if (_emptyArray == null) {
                        _emptyArray = new FileDescriptorSet[0];
                    }
                }
            }
            return _emptyArray;
        }

        public FileDescriptorSet() {
            clear();
        }

        public FileDescriptorSet clear() {
            this.file = FileDescriptorProto.emptyArray();
            this.unknownFieldData = null;
            this.cachedSize = -1;
            return this;
        }

        public void writeTo(CodedOutputByteBufferNano codedOutputByteBufferNano) throws IOException {
            if (this.file != null && this.file.length > 0) {
                for (MessageNano messageNano : this.file) {
                    if (messageNano != null) {
                        codedOutputByteBufferNano.writeMessage(1, messageNano);
                    }
                }
            }
            super.writeTo(codedOutputByteBufferNano);
        }

        protected int computeSerializedSize() {
            int computeSerializedSize = super.computeSerializedSize();
            if (this.file != null && this.file.length > 0) {
                for (MessageNano messageNano : this.file) {
                    if (messageNano != null) {
                        computeSerializedSize += CodedOutputByteBufferNano.computeMessageSize(1, messageNano);
                    }
                }
            }
            return computeSerializedSize;
        }

        public FileDescriptorSet mergeFrom(CodedInputByteBufferNano codedInputByteBufferNano) throws IOException {
            while (true) {
                int readTag = codedInputByteBufferNano.readTag();
                if (readTag == 0) {
                    return this;
                }
                if (readTag == 10) {
                    int i;
                    readTag = WireFormatNano.getRepeatedFieldArrayLength(codedInputByteBufferNano, 10);
                    if (this.file == null) {
                        i = 0;
                    } else {
                        i = this.file.length;
                    }
                    Object obj = new FileDescriptorProto[(readTag + i)];
                    if (i != 0) {
                        System.arraycopy(this.file, 0, obj, 0, i);
                    }
                    while (i < obj.length - 1) {
                        obj[i] = new FileDescriptorProto();
                        codedInputByteBufferNano.readMessage(obj[i]);
                        codedInputByteBufferNano.readTag();
                        i++;
                    }
                    obj[i] = new FileDescriptorProto();
                    codedInputByteBufferNano.readMessage(obj[i]);
                    this.file = obj;
                } else if (!super.storeUnknownField(codedInputByteBufferNano, readTag)) {
                    return this;
                }
            }
        }

        public static FileDescriptorSet parseFrom(byte[] bArr) throws InvalidProtocolBufferNanoException {
            return (FileDescriptorSet) MessageNano.mergeFrom(new FileDescriptorSet(), bArr);
        }

        public static FileDescriptorSet parseFrom(CodedInputByteBufferNano codedInputByteBufferNano) throws IOException {
            return new FileDescriptorSet().mergeFrom(codedInputByteBufferNano);
        }
    }

    public static final class FileOptions extends ExtendableMessageNano<FileOptions> {
        private static volatile FileOptions[] _emptyArray;
        public int ccApiVersion;
        public boolean ccEnableArenas;
        public boolean ccGenericServices;
        public boolean ccUtf8Verification;
        public String csharpNamespace;
        public boolean deprecated;
        public String goPackage;
        public String javaAltApiPackage;
        public int javaApiVersion;
        public boolean javaEnableDualGenerateMutableApi;
        public boolean javaGenericServices;
        public boolean javaJava5Enums;
        public boolean javaMultipleFiles;
        public String javaMultipleFilesMutablePackage;
        public boolean javaMutableApi;
        public String javaOuterClassname;
        public String javaPackage;
        public boolean javaStringCheckUtf8;
        public boolean javaUseJavaproto2;
        public boolean javaUseJavastrings;
        public String javascriptPackage;
        public String objcClassPrefix;
        @NanoEnumValue(legacy = false, value = OptimizeMode.class)
        public int optimizeFor;
        public String phpClassPrefix;
        public boolean phpGenericServices;
        public String phpNamespace;
        public int pyApiVersion;
        public boolean pyGenericServices;
        public String swiftPrefix;
        public int szlApiVersion;
        public UninterpretedOption[] uninterpretedOption;

        public interface CompatibilityLevel {
            @NanoEnumValue(legacy = false, value = CompatibilityLevel.class)
            public static final int NO_COMPATIBILITY = 0;
            @NanoEnumValue(legacy = false, value = CompatibilityLevel.class)
            public static final int PROTO1_COMPATIBLE = 100;
        }

        public interface OptimizeMode {
            @NanoEnumValue(legacy = false, value = OptimizeMode.class)
            public static final int CODE_SIZE = 2;
            @NanoEnumValue(legacy = false, value = OptimizeMode.class)
            public static final int LITE_RUNTIME = 3;
            @NanoEnumValue(legacy = false, value = OptimizeMode.class)
            public static final int SPEED = 1;
        }

        @NanoEnumValue(legacy = false, value = CompatibilityLevel.class)
        public static int checkCompatibilityLevelOrThrow(int i) {
            if (i >= 0 && i <= 0) {
                return i;
            }
            if (i >= 100 && i <= 100) {
                return i;
            }
            StringBuilder stringBuilder = new StringBuilder(50);
            stringBuilder.append(i);
            stringBuilder.append(" is not a valid enum CompatibilityLevel");
            throw new IllegalArgumentException(stringBuilder.toString());
        }

        @NanoEnumValue(legacy = false, value = CompatibilityLevel.class)
        public static int[] checkCompatibilityLevelOrThrow(int[] iArr) {
            iArr = (int[]) iArr.clone();
            for (int checkCompatibilityLevelOrThrow : iArr) {
                checkCompatibilityLevelOrThrow(checkCompatibilityLevelOrThrow);
            }
            return iArr;
        }

        @NanoEnumValue(legacy = false, value = OptimizeMode.class)
        public static int checkOptimizeModeOrThrow(int i) {
            if (i >= 1 && i <= 3) {
                return i;
            }
            StringBuilder stringBuilder = new StringBuilder(44);
            stringBuilder.append(i);
            stringBuilder.append(" is not a valid enum OptimizeMode");
            throw new IllegalArgumentException(stringBuilder.toString());
        }

        @NanoEnumValue(legacy = false, value = OptimizeMode.class)
        public static int[] checkOptimizeModeOrThrow(int[] iArr) {
            iArr = (int[]) iArr.clone();
            for (int checkOptimizeModeOrThrow : iArr) {
                checkOptimizeModeOrThrow(checkOptimizeModeOrThrow);
            }
            return iArr;
        }

        public static FileOptions[] emptyArray() {
            if (_emptyArray == null) {
                synchronized (InternalNano.LAZY_INIT_LOCK) {
                    if (_emptyArray == null) {
                        _emptyArray = new FileOptions[0];
                    }
                }
            }
            return _emptyArray;
        }

        public FileOptions() {
            clear();
        }

        public FileOptions clear() {
            this.ccApiVersion = 2;
            this.ccUtf8Verification = true;
            this.javaPackage = "";
            this.pyApiVersion = 2;
            this.javaApiVersion = 2;
            this.javaUseJavaproto2 = true;
            this.javaJava5Enums = true;
            this.javaUseJavastrings = false;
            this.javaAltApiPackage = "";
            this.javaEnableDualGenerateMutableApi = false;
            this.javaOuterClassname = "";
            this.javaMultipleFiles = false;
            this.javaStringCheckUtf8 = false;
            this.javaMutableApi = false;
            this.javaMultipleFilesMutablePackage = "";
            this.optimizeFor = 1;
            this.goPackage = "";
            this.javascriptPackage = "";
            this.szlApiVersion = 1;
            this.ccGenericServices = false;
            this.javaGenericServices = false;
            this.pyGenericServices = false;
            this.phpGenericServices = false;
            this.deprecated = false;
            this.ccEnableArenas = false;
            this.objcClassPrefix = "";
            this.csharpNamespace = "";
            this.swiftPrefix = "";
            this.phpClassPrefix = "";
            this.phpNamespace = "";
            this.uninterpretedOption = UninterpretedOption.emptyArray();
            this.unknownFieldData = null;
            this.cachedSize = -1;
            return this;
        }

        public void writeTo(CodedOutputByteBufferNano codedOutputByteBufferNano) throws IOException {
            if (!(this.javaPackage == null || this.javaPackage.equals(""))) {
                codedOutputByteBufferNano.writeString(1, this.javaPackage);
            }
            if (this.ccApiVersion != 2) {
                codedOutputByteBufferNano.writeInt32(2, this.ccApiVersion);
            }
            if (this.pyApiVersion != 2) {
                codedOutputByteBufferNano.writeInt32(4, this.pyApiVersion);
            }
            if (this.javaApiVersion != 2) {
                codedOutputByteBufferNano.writeInt32(5, this.javaApiVersion);
            }
            if (!this.javaUseJavaproto2) {
                codedOutputByteBufferNano.writeBool(6, this.javaUseJavaproto2);
            }
            if (!this.javaJava5Enums) {
                codedOutputByteBufferNano.writeBool(7, this.javaJava5Enums);
            }
            if (!(this.javaOuterClassname == null || this.javaOuterClassname.equals(""))) {
                codedOutputByteBufferNano.writeString(8, this.javaOuterClassname);
            }
            if (this.optimizeFor != 1) {
                codedOutputByteBufferNano.writeInt32(9, this.optimizeFor);
            }
            if (this.javaMultipleFiles) {
                codedOutputByteBufferNano.writeBool(10, this.javaMultipleFiles);
            }
            if (!(this.goPackage == null || this.goPackage.equals(""))) {
                codedOutputByteBufferNano.writeString(11, this.goPackage);
            }
            if (!(this.javascriptPackage == null || this.javascriptPackage.equals(""))) {
                codedOutputByteBufferNano.writeString(12, this.javascriptPackage);
            }
            if (this.szlApiVersion != 1) {
                codedOutputByteBufferNano.writeInt32(14, this.szlApiVersion);
            }
            if (this.ccGenericServices) {
                codedOutputByteBufferNano.writeBool(16, this.ccGenericServices);
            }
            if (this.javaGenericServices) {
                codedOutputByteBufferNano.writeBool(17, this.javaGenericServices);
            }
            if (this.pyGenericServices) {
                codedOutputByteBufferNano.writeBool(18, this.pyGenericServices);
            }
            if (!(this.javaAltApiPackage == null || this.javaAltApiPackage.equals(""))) {
                codedOutputByteBufferNano.writeString(19, this.javaAltApiPackage);
            }
            if (this.javaUseJavastrings) {
                codedOutputByteBufferNano.writeBool(21, this.javaUseJavastrings);
            }
            if (this.deprecated) {
                codedOutputByteBufferNano.writeBool(23, this.deprecated);
            }
            if (!this.ccUtf8Verification) {
                codedOutputByteBufferNano.writeBool(24, this.ccUtf8Verification);
            }
            if (this.javaEnableDualGenerateMutableApi) {
                codedOutputByteBufferNano.writeBool(26, this.javaEnableDualGenerateMutableApi);
            }
            if (this.javaStringCheckUtf8) {
                codedOutputByteBufferNano.writeBool(27, this.javaStringCheckUtf8);
            }
            if (this.javaMutableApi) {
                codedOutputByteBufferNano.writeBool(28, this.javaMutableApi);
            }
            if (!(this.javaMultipleFilesMutablePackage == null || this.javaMultipleFilesMutablePackage.equals(""))) {
                codedOutputByteBufferNano.writeString(29, this.javaMultipleFilesMutablePackage);
            }
            if (this.ccEnableArenas) {
                codedOutputByteBufferNano.writeBool(31, this.ccEnableArenas);
            }
            if (!(this.objcClassPrefix == null || this.objcClassPrefix.equals(""))) {
                codedOutputByteBufferNano.writeString(36, this.objcClassPrefix);
            }
            if (!(this.csharpNamespace == null || this.csharpNamespace.equals(""))) {
                codedOutputByteBufferNano.writeString(37, this.csharpNamespace);
            }
            if (!(this.swiftPrefix == null || this.swiftPrefix.equals(""))) {
                codedOutputByteBufferNano.writeString(39, this.swiftPrefix);
            }
            if (!(this.phpClassPrefix == null || this.phpClassPrefix.equals(""))) {
                codedOutputByteBufferNano.writeString(40, this.phpClassPrefix);
            }
            if (!(this.phpNamespace == null || this.phpNamespace.equals(""))) {
                codedOutputByteBufferNano.writeString(41, this.phpNamespace);
            }
            if (this.phpGenericServices) {
                codedOutputByteBufferNano.writeBool(42, this.phpGenericServices);
            }
            if (this.uninterpretedOption != null && this.uninterpretedOption.length > 0) {
                for (MessageNano messageNano : this.uninterpretedOption) {
                    if (messageNano != null) {
                        codedOutputByteBufferNano.writeMessage(999, messageNano);
                    }
                }
            }
            super.writeTo(codedOutputByteBufferNano);
        }

        protected int computeSerializedSize() {
            int computeSerializedSize = super.computeSerializedSize();
            if (!(this.javaPackage == null || this.javaPackage.equals(""))) {
                computeSerializedSize += CodedOutputByteBufferNano.computeStringSize(1, this.javaPackage);
            }
            if (this.ccApiVersion != 2) {
                computeSerializedSize += CodedOutputByteBufferNano.computeInt32Size(2, this.ccApiVersion);
            }
            if (this.pyApiVersion != 2) {
                computeSerializedSize += CodedOutputByteBufferNano.computeInt32Size(4, this.pyApiVersion);
            }
            if (this.javaApiVersion != 2) {
                computeSerializedSize += CodedOutputByteBufferNano.computeInt32Size(5, this.javaApiVersion);
            }
            if (!this.javaUseJavaproto2) {
                computeSerializedSize += CodedOutputByteBufferNano.computeBoolSize(6, this.javaUseJavaproto2);
            }
            if (!this.javaJava5Enums) {
                computeSerializedSize += CodedOutputByteBufferNano.computeBoolSize(7, this.javaJava5Enums);
            }
            if (!(this.javaOuterClassname == null || this.javaOuterClassname.equals(""))) {
                computeSerializedSize += CodedOutputByteBufferNano.computeStringSize(8, this.javaOuterClassname);
            }
            if (this.optimizeFor != 1) {
                computeSerializedSize += CodedOutputByteBufferNano.computeInt32Size(9, this.optimizeFor);
            }
            if (this.javaMultipleFiles) {
                computeSerializedSize += CodedOutputByteBufferNano.computeBoolSize(10, this.javaMultipleFiles);
            }
            if (!(this.goPackage == null || this.goPackage.equals(""))) {
                computeSerializedSize += CodedOutputByteBufferNano.computeStringSize(11, this.goPackage);
            }
            if (!(this.javascriptPackage == null || this.javascriptPackage.equals(""))) {
                computeSerializedSize += CodedOutputByteBufferNano.computeStringSize(12, this.javascriptPackage);
            }
            if (this.szlApiVersion != 1) {
                computeSerializedSize += CodedOutputByteBufferNano.computeInt32Size(14, this.szlApiVersion);
            }
            if (this.ccGenericServices) {
                computeSerializedSize += CodedOutputByteBufferNano.computeBoolSize(16, this.ccGenericServices);
            }
            if (this.javaGenericServices) {
                computeSerializedSize += CodedOutputByteBufferNano.computeBoolSize(17, this.javaGenericServices);
            }
            if (this.pyGenericServices) {
                computeSerializedSize += CodedOutputByteBufferNano.computeBoolSize(18, this.pyGenericServices);
            }
            if (!(this.javaAltApiPackage == null || this.javaAltApiPackage.equals(""))) {
                computeSerializedSize += CodedOutputByteBufferNano.computeStringSize(19, this.javaAltApiPackage);
            }
            if (this.javaUseJavastrings) {
                computeSerializedSize += CodedOutputByteBufferNano.computeBoolSize(21, this.javaUseJavastrings);
            }
            if (this.deprecated) {
                computeSerializedSize += CodedOutputByteBufferNano.computeBoolSize(23, this.deprecated);
            }
            if (!this.ccUtf8Verification) {
                computeSerializedSize += CodedOutputByteBufferNano.computeBoolSize(24, this.ccUtf8Verification);
            }
            if (this.javaEnableDualGenerateMutableApi) {
                computeSerializedSize += CodedOutputByteBufferNano.computeBoolSize(26, this.javaEnableDualGenerateMutableApi);
            }
            if (this.javaStringCheckUtf8) {
                computeSerializedSize += CodedOutputByteBufferNano.computeBoolSize(27, this.javaStringCheckUtf8);
            }
            if (this.javaMutableApi) {
                computeSerializedSize += CodedOutputByteBufferNano.computeBoolSize(28, this.javaMutableApi);
            }
            if (!(this.javaMultipleFilesMutablePackage == null || this.javaMultipleFilesMutablePackage.equals(""))) {
                computeSerializedSize += CodedOutputByteBufferNano.computeStringSize(29, this.javaMultipleFilesMutablePackage);
            }
            if (this.ccEnableArenas) {
                computeSerializedSize += CodedOutputByteBufferNano.computeBoolSize(31, this.ccEnableArenas);
            }
            if (!(this.objcClassPrefix == null || this.objcClassPrefix.equals(""))) {
                computeSerializedSize += CodedOutputByteBufferNano.computeStringSize(36, this.objcClassPrefix);
            }
            if (!(this.csharpNamespace == null || this.csharpNamespace.equals(""))) {
                computeSerializedSize += CodedOutputByteBufferNano.computeStringSize(37, this.csharpNamespace);
            }
            if (!(this.swiftPrefix == null || this.swiftPrefix.equals(""))) {
                computeSerializedSize += CodedOutputByteBufferNano.computeStringSize(39, this.swiftPrefix);
            }
            if (!(this.phpClassPrefix == null || this.phpClassPrefix.equals(""))) {
                computeSerializedSize += CodedOutputByteBufferNano.computeStringSize(40, this.phpClassPrefix);
            }
            if (!(this.phpNamespace == null || this.phpNamespace.equals(""))) {
                computeSerializedSize += CodedOutputByteBufferNano.computeStringSize(41, this.phpNamespace);
            }
            if (this.phpGenericServices) {
                computeSerializedSize += CodedOutputByteBufferNano.computeBoolSize(42, this.phpGenericServices);
            }
            if (this.uninterpretedOption != null && this.uninterpretedOption.length > 0) {
                for (MessageNano messageNano : this.uninterpretedOption) {
                    if (messageNano != null) {
                        computeSerializedSize += CodedOutputByteBufferNano.computeMessageSize(999, messageNano);
                    }
                }
            }
            return computeSerializedSize;
        }

        public FileOptions mergeFrom(CodedInputByteBufferNano codedInputByteBufferNano) throws IOException {
            int position;
            while (true) {
                int readTag = codedInputByteBufferNano.readTag();
                switch (readTag) {
                    case 0:
                        return this;
                    case 10:
                        this.javaPackage = codedInputByteBufferNano.readString();
                        break;
                    case 16:
                        this.ccApiVersion = codedInputByteBufferNano.readInt32();
                        break;
                    case 32:
                        this.pyApiVersion = codedInputByteBufferNano.readInt32();
                        break;
                    case 40:
                        this.javaApiVersion = codedInputByteBufferNano.readInt32();
                        break;
                    case 48:
                        this.javaUseJavaproto2 = codedInputByteBufferNano.readBool();
                        break;
                    case 56:
                        this.javaJava5Enums = codedInputByteBufferNano.readBool();
                        break;
                    case 66:
                        this.javaOuterClassname = codedInputByteBufferNano.readString();
                        break;
                    case 72:
                        position = codedInputByteBufferNano.getPosition();
                        try {
                            this.optimizeFor = checkOptimizeModeOrThrow(codedInputByteBufferNano.readInt32());
                            break;
                        } catch (IllegalArgumentException e) {
                            codedInputByteBufferNano.rewindToPosition(position);
                            storeUnknownField(codedInputByteBufferNano, readTag);
                            break;
                        }
                    case 80:
                        this.javaMultipleFiles = codedInputByteBufferNano.readBool();
                        break;
                    case 90:
                        this.goPackage = codedInputByteBufferNano.readString();
                        break;
                    case 98:
                        this.javascriptPackage = codedInputByteBufferNano.readString();
                        break;
                    case 112:
                        this.szlApiVersion = codedInputByteBufferNano.readInt32();
                        break;
                    case 128:
                        this.ccGenericServices = codedInputByteBufferNano.readBool();
                        break;
                    case 136:
                        this.javaGenericServices = codedInputByteBufferNano.readBool();
                        break;
                    case 144:
                        this.pyGenericServices = codedInputByteBufferNano.readBool();
                        break;
                    case 154:
                        this.javaAltApiPackage = codedInputByteBufferNano.readString();
                        break;
                    case 168:
                        this.javaUseJavastrings = codedInputByteBufferNano.readBool();
                        break;
                    case 184:
                        this.deprecated = codedInputByteBufferNano.readBool();
                        break;
                    case 192:
                        this.ccUtf8Verification = codedInputByteBufferNano.readBool();
                        break;
                    case 208:
                        this.javaEnableDualGenerateMutableApi = codedInputByteBufferNano.readBool();
                        break;
                    case 216:
                        this.javaStringCheckUtf8 = codedInputByteBufferNano.readBool();
                        break;
                    case 224:
                        this.javaMutableApi = codedInputByteBufferNano.readBool();
                        break;
                    case 234:
                        this.javaMultipleFilesMutablePackage = codedInputByteBufferNano.readString();
                        break;
                    case 248:
                        this.ccEnableArenas = codedInputByteBufferNano.readBool();
                        break;
                    case 290:
                        this.objcClassPrefix = codedInputByteBufferNano.readString();
                        break;
                    case 298:
                        this.csharpNamespace = codedInputByteBufferNano.readString();
                        break;
                    case 314:
                        this.swiftPrefix = codedInputByteBufferNano.readString();
                        break;
                    case 322:
                        this.phpClassPrefix = codedInputByteBufferNano.readString();
                        break;
                    case 330:
                        this.phpNamespace = codedInputByteBufferNano.readString();
                        break;
                    case 336:
                        this.phpGenericServices = codedInputByteBufferNano.readBool();
                        break;
                    case 7994:
                        readTag = WireFormatNano.getRepeatedFieldArrayLength(codedInputByteBufferNano, 7994);
                        if (this.uninterpretedOption == null) {
                            position = 0;
                        } else {
                            position = this.uninterpretedOption.length;
                        }
                        Object obj = new UninterpretedOption[(readTag + position)];
                        if (position != 0) {
                            System.arraycopy(this.uninterpretedOption, 0, obj, 0, position);
                        }
                        while (position < obj.length - 1) {
                            obj[position] = new UninterpretedOption();
                            codedInputByteBufferNano.readMessage(obj[position]);
                            codedInputByteBufferNano.readTag();
                            position++;
                        }
                        obj[position] = new UninterpretedOption();
                        codedInputByteBufferNano.readMessage(obj[position]);
                        this.uninterpretedOption = obj;
                        break;
                    default:
                        if (super.storeUnknownField(codedInputByteBufferNano, readTag)) {
                            break;
                        }
                        return this;
                }
            }
        }

        public static FileOptions parseFrom(byte[] bArr) throws InvalidProtocolBufferNanoException {
            return (FileOptions) MessageNano.mergeFrom(new FileOptions(), bArr);
        }

        public static FileOptions parseFrom(CodedInputByteBufferNano codedInputByteBufferNano) throws IOException {
            return new FileOptions().mergeFrom(codedInputByteBufferNano);
        }
    }

    public static final class GeneratedCodeInfo extends ExtendableMessageNano<GeneratedCodeInfo> {
        private static volatile GeneratedCodeInfo[] _emptyArray;
        public Annotation[] annotation;

        public static final class Annotation extends ExtendableMessageNano<Annotation> {
            private static volatile Annotation[] _emptyArray;
            public int begin;
            public int end;
            public int[] path;
            public String sourceFile;

            public static Annotation[] emptyArray() {
                if (_emptyArray == null) {
                    synchronized (InternalNano.LAZY_INIT_LOCK) {
                        if (_emptyArray == null) {
                            _emptyArray = new Annotation[0];
                        }
                    }
                }
                return _emptyArray;
            }

            public Annotation() {
                clear();
            }

            public Annotation clear() {
                this.path = WireFormatNano.EMPTY_INT_ARRAY;
                this.sourceFile = "";
                this.begin = 0;
                this.end = 0;
                this.unknownFieldData = null;
                this.cachedSize = -1;
                return this;
            }

            public void writeTo(CodedOutputByteBufferNano codedOutputByteBufferNano) throws IOException {
                if (this.path != null && this.path.length > 0) {
                    int i = 0;
                    int i2 = 0;
                    int i3 = i2;
                    while (i2 < this.path.length) {
                        i3 += CodedOutputByteBufferNano.computeInt32SizeNoTag(this.path[i2]);
                        i2++;
                    }
                    codedOutputByteBufferNano.writeRawVarint32(10);
                    codedOutputByteBufferNano.writeRawVarint32(i3);
                    while (i < this.path.length) {
                        codedOutputByteBufferNano.writeInt32NoTag(this.path[i]);
                        i++;
                    }
                }
                if (!(this.sourceFile == null || this.sourceFile.equals(""))) {
                    codedOutputByteBufferNano.writeString(2, this.sourceFile);
                }
                if (this.begin != 0) {
                    codedOutputByteBufferNano.writeInt32(3, this.begin);
                }
                if (this.end != 0) {
                    codedOutputByteBufferNano.writeInt32(4, this.end);
                }
                super.writeTo(codedOutputByteBufferNano);
            }

            protected int computeSerializedSize() {
                int computeSerializedSize = super.computeSerializedSize();
                if (this.path != null && this.path.length > 0) {
                    int i = 0;
                    int i2 = 0;
                    while (i < this.path.length) {
                        i2 += CodedOutputByteBufferNano.computeInt32SizeNoTag(this.path[i]);
                        i++;
                    }
                    computeSerializedSize = ((computeSerializedSize + i2) + 1) + CodedOutputByteBufferNano.computeRawVarint32Size(i2);
                }
                if (!(this.sourceFile == null || this.sourceFile.equals(""))) {
                    computeSerializedSize += CodedOutputByteBufferNano.computeStringSize(2, this.sourceFile);
                }
                if (this.begin != 0) {
                    computeSerializedSize += CodedOutputByteBufferNano.computeInt32Size(3, this.begin);
                }
                if (this.end != 0) {
                    return computeSerializedSize + CodedOutputByteBufferNano.computeInt32Size(4, this.end);
                }
                return computeSerializedSize;
            }

            public Annotation mergeFrom(CodedInputByteBufferNano codedInputByteBufferNano) throws IOException {
                while (true) {
                    int readTag = codedInputByteBufferNano.readTag();
                    if (readTag == 0) {
                        return this;
                    }
                    int i;
                    if (readTag == 8) {
                        readTag = WireFormatNano.getRepeatedFieldArrayLength(codedInputByteBufferNano, 8);
                        if (this.path == null) {
                            i = 0;
                        } else {
                            i = this.path.length;
                        }
                        Object obj = new int[(readTag + i)];
                        if (i != 0) {
                            System.arraycopy(this.path, 0, obj, 0, i);
                        }
                        while (i < obj.length - 1) {
                            obj[i] = codedInputByteBufferNano.readInt32();
                            codedInputByteBufferNano.readTag();
                            i++;
                        }
                        obj[i] = codedInputByteBufferNano.readInt32();
                        this.path = obj;
                    } else if (readTag == 10) {
                        readTag = codedInputByteBufferNano.pushLimit(codedInputByteBufferNano.readRawVarint32());
                        i = codedInputByteBufferNano.getPosition();
                        int i2 = 0;
                        while (codedInputByteBufferNano.getBytesUntilLimit() > 0) {
                            codedInputByteBufferNano.readInt32();
                            i2++;
                        }
                        codedInputByteBufferNano.rewindToPosition(i);
                        if (this.path == null) {
                            i = 0;
                        } else {
                            i = this.path.length;
                        }
                        Object obj2 = new int[(i2 + i)];
                        if (i != 0) {
                            System.arraycopy(this.path, 0, obj2, 0, i);
                        }
                        while (i < obj2.length) {
                            obj2[i] = codedInputByteBufferNano.readInt32();
                            i++;
                        }
                        this.path = obj2;
                        codedInputByteBufferNano.popLimit(readTag);
                    } else if (readTag == 18) {
                        this.sourceFile = codedInputByteBufferNano.readString();
                    } else if (readTag == 24) {
                        this.begin = codedInputByteBufferNano.readInt32();
                    } else if (readTag == 32) {
                        this.end = codedInputByteBufferNano.readInt32();
                    } else if (!super.storeUnknownField(codedInputByteBufferNano, readTag)) {
                        return this;
                    }
                }
            }

            public static Annotation parseFrom(byte[] bArr) throws InvalidProtocolBufferNanoException {
                return (Annotation) MessageNano.mergeFrom(new Annotation(), bArr);
            }

            public static Annotation parseFrom(CodedInputByteBufferNano codedInputByteBufferNano) throws IOException {
                return new Annotation().mergeFrom(codedInputByteBufferNano);
            }
        }

        public static GeneratedCodeInfo[] emptyArray() {
            if (_emptyArray == null) {
                synchronized (InternalNano.LAZY_INIT_LOCK) {
                    if (_emptyArray == null) {
                        _emptyArray = new GeneratedCodeInfo[0];
                    }
                }
            }
            return _emptyArray;
        }

        public GeneratedCodeInfo() {
            clear();
        }

        public GeneratedCodeInfo clear() {
            this.annotation = Annotation.emptyArray();
            this.unknownFieldData = null;
            this.cachedSize = -1;
            return this;
        }

        public void writeTo(CodedOutputByteBufferNano codedOutputByteBufferNano) throws IOException {
            if (this.annotation != null && this.annotation.length > 0) {
                for (MessageNano messageNano : this.annotation) {
                    if (messageNano != null) {
                        codedOutputByteBufferNano.writeMessage(1, messageNano);
                    }
                }
            }
            super.writeTo(codedOutputByteBufferNano);
        }

        protected int computeSerializedSize() {
            int computeSerializedSize = super.computeSerializedSize();
            if (this.annotation != null && this.annotation.length > 0) {
                for (MessageNano messageNano : this.annotation) {
                    if (messageNano != null) {
                        computeSerializedSize += CodedOutputByteBufferNano.computeMessageSize(1, messageNano);
                    }
                }
            }
            return computeSerializedSize;
        }

        public GeneratedCodeInfo mergeFrom(CodedInputByteBufferNano codedInputByteBufferNano) throws IOException {
            while (true) {
                int readTag = codedInputByteBufferNano.readTag();
                if (readTag == 0) {
                    return this;
                }
                if (readTag == 10) {
                    int i;
                    readTag = WireFormatNano.getRepeatedFieldArrayLength(codedInputByteBufferNano, 10);
                    if (this.annotation == null) {
                        i = 0;
                    } else {
                        i = this.annotation.length;
                    }
                    Object obj = new Annotation[(readTag + i)];
                    if (i != 0) {
                        System.arraycopy(this.annotation, 0, obj, 0, i);
                    }
                    while (i < obj.length - 1) {
                        obj[i] = new Annotation();
                        codedInputByteBufferNano.readMessage(obj[i]);
                        codedInputByteBufferNano.readTag();
                        i++;
                    }
                    obj[i] = new Annotation();
                    codedInputByteBufferNano.readMessage(obj[i]);
                    this.annotation = obj;
                } else if (!super.storeUnknownField(codedInputByteBufferNano, readTag)) {
                    return this;
                }
            }
        }

        public static GeneratedCodeInfo parseFrom(byte[] bArr) throws InvalidProtocolBufferNanoException {
            return (GeneratedCodeInfo) MessageNano.mergeFrom(new GeneratedCodeInfo(), bArr);
        }

        public static GeneratedCodeInfo parseFrom(CodedInputByteBufferNano codedInputByteBufferNano) throws IOException {
            return new GeneratedCodeInfo().mergeFrom(codedInputByteBufferNano);
        }
    }

    public static final class MessageOptions extends ExtendableMessageNano<MessageOptions> {
        private static volatile MessageOptions[] _emptyArray;
        public boolean deprecated;
        public String[] experimentalJavaBuilderInterface;
        public String[] experimentalJavaInterfaceExtends;
        public String[] experimentalJavaMessageInterface;
        public boolean mapEntry;
        public boolean messageSetWireFormat;
        public boolean noStandardDescriptorAccessor;
        public UninterpretedOption[] uninterpretedOption;

        public static MessageOptions[] emptyArray() {
            if (_emptyArray == null) {
                synchronized (InternalNano.LAZY_INIT_LOCK) {
                    if (_emptyArray == null) {
                        _emptyArray = new MessageOptions[0];
                    }
                }
            }
            return _emptyArray;
        }

        public MessageOptions() {
            clear();
        }

        public MessageOptions clear() {
            this.experimentalJavaMessageInterface = WireFormatNano.EMPTY_STRING_ARRAY;
            this.experimentalJavaBuilderInterface = WireFormatNano.EMPTY_STRING_ARRAY;
            this.experimentalJavaInterfaceExtends = WireFormatNano.EMPTY_STRING_ARRAY;
            this.messageSetWireFormat = false;
            this.noStandardDescriptorAccessor = false;
            this.deprecated = false;
            this.mapEntry = false;
            this.uninterpretedOption = UninterpretedOption.emptyArray();
            this.unknownFieldData = null;
            this.cachedSize = -1;
            return this;
        }

        public void writeTo(CodedOutputByteBufferNano codedOutputByteBufferNano) throws IOException {
            if (this.messageSetWireFormat) {
                codedOutputByteBufferNano.writeBool(1, this.messageSetWireFormat);
            }
            if (this.noStandardDescriptorAccessor) {
                codedOutputByteBufferNano.writeBool(2, this.noStandardDescriptorAccessor);
            }
            if (this.deprecated) {
                codedOutputByteBufferNano.writeBool(3, this.deprecated);
            }
            int i = 0;
            if (this.experimentalJavaMessageInterface != null && this.experimentalJavaMessageInterface.length > 0) {
                for (String str : this.experimentalJavaMessageInterface) {
                    if (str != null) {
                        codedOutputByteBufferNano.writeString(4, str);
                    }
                }
            }
            if (this.experimentalJavaBuilderInterface != null && this.experimentalJavaBuilderInterface.length > 0) {
                for (String str2 : this.experimentalJavaBuilderInterface) {
                    if (str2 != null) {
                        codedOutputByteBufferNano.writeString(5, str2);
                    }
                }
            }
            if (this.experimentalJavaInterfaceExtends != null && this.experimentalJavaInterfaceExtends.length > 0) {
                for (String str22 : this.experimentalJavaInterfaceExtends) {
                    if (str22 != null) {
                        codedOutputByteBufferNano.writeString(6, str22);
                    }
                }
            }
            if (this.mapEntry) {
                codedOutputByteBufferNano.writeBool(7, this.mapEntry);
            }
            if (this.uninterpretedOption != null && this.uninterpretedOption.length > 0) {
                while (i < this.uninterpretedOption.length) {
                    MessageNano messageNano = this.uninterpretedOption[i];
                    if (messageNano != null) {
                        codedOutputByteBufferNano.writeMessage(999, messageNano);
                    }
                    i++;
                }
            }
            super.writeTo(codedOutputByteBufferNano);
        }

        protected int computeSerializedSize() {
            int i;
            int i2;
            int i3;
            String str;
            int computeSerializedSize = super.computeSerializedSize();
            if (this.messageSetWireFormat) {
                computeSerializedSize += CodedOutputByteBufferNano.computeBoolSize(1, this.messageSetWireFormat);
            }
            if (this.noStandardDescriptorAccessor) {
                computeSerializedSize += CodedOutputByteBufferNano.computeBoolSize(2, this.noStandardDescriptorAccessor);
            }
            if (this.deprecated) {
                computeSerializedSize += CodedOutputByteBufferNano.computeBoolSize(3, this.deprecated);
            }
            int i4 = 0;
            if (this.experimentalJavaMessageInterface != null && this.experimentalJavaMessageInterface.length > 0) {
                i = 0;
                i2 = i;
                i3 = i2;
                while (i < this.experimentalJavaMessageInterface.length) {
                    str = this.experimentalJavaMessageInterface[i];
                    if (str != null) {
                        i3++;
                        i2 += CodedOutputByteBufferNano.computeStringSizeNoTag(str);
                    }
                    i++;
                }
                computeSerializedSize = (computeSerializedSize + i2) + (i3 * 1);
            }
            if (this.experimentalJavaBuilderInterface != null && this.experimentalJavaBuilderInterface.length > 0) {
                i = 0;
                i2 = i;
                i3 = i2;
                while (i < this.experimentalJavaBuilderInterface.length) {
                    str = this.experimentalJavaBuilderInterface[i];
                    if (str != null) {
                        i3++;
                        i2 += CodedOutputByteBufferNano.computeStringSizeNoTag(str);
                    }
                    i++;
                }
                computeSerializedSize = (computeSerializedSize + i2) + (i3 * 1);
            }
            if (this.experimentalJavaInterfaceExtends != null && this.experimentalJavaInterfaceExtends.length > 0) {
                i = 0;
                i2 = i;
                i3 = i2;
                while (i < this.experimentalJavaInterfaceExtends.length) {
                    str = this.experimentalJavaInterfaceExtends[i];
                    if (str != null) {
                        i3++;
                        i2 += CodedOutputByteBufferNano.computeStringSizeNoTag(str);
                    }
                    i++;
                }
                computeSerializedSize = (computeSerializedSize + i2) + (1 * i3);
            }
            if (this.mapEntry) {
                computeSerializedSize += CodedOutputByteBufferNano.computeBoolSize(7, this.mapEntry);
            }
            if (this.uninterpretedOption != null && this.uninterpretedOption.length > 0) {
                while (i4 < this.uninterpretedOption.length) {
                    MessageNano messageNano = this.uninterpretedOption[i4];
                    if (messageNano != null) {
                        computeSerializedSize += CodedOutputByteBufferNano.computeMessageSize(999, messageNano);
                    }
                    i4++;
                }
            }
            return computeSerializedSize;
        }

        public MessageOptions mergeFrom(CodedInputByteBufferNano codedInputByteBufferNano) throws IOException {
            while (true) {
                int readTag = codedInputByteBufferNano.readTag();
                if (readTag == 0) {
                    return this;
                }
                int i;
                Object obj;
                if (readTag == 8) {
                    this.messageSetWireFormat = codedInputByteBufferNano.readBool();
                } else if (readTag == 16) {
                    this.noStandardDescriptorAccessor = codedInputByteBufferNano.readBool();
                } else if (readTag == 24) {
                    this.deprecated = codedInputByteBufferNano.readBool();
                } else if (readTag == 34) {
                    readTag = WireFormatNano.getRepeatedFieldArrayLength(codedInputByteBufferNano, 34);
                    if (this.experimentalJavaMessageInterface == null) {
                        i = 0;
                    } else {
                        i = this.experimentalJavaMessageInterface.length;
                    }
                    obj = new String[(readTag + i)];
                    if (i != 0) {
                        System.arraycopy(this.experimentalJavaMessageInterface, 0, obj, 0, i);
                    }
                    while (i < obj.length - 1) {
                        obj[i] = codedInputByteBufferNano.readString();
                        codedInputByteBufferNano.readTag();
                        i++;
                    }
                    obj[i] = codedInputByteBufferNano.readString();
                    this.experimentalJavaMessageInterface = obj;
                } else if (readTag == 42) {
                    readTag = WireFormatNano.getRepeatedFieldArrayLength(codedInputByteBufferNano, 42);
                    if (this.experimentalJavaBuilderInterface == null) {
                        i = 0;
                    } else {
                        i = this.experimentalJavaBuilderInterface.length;
                    }
                    obj = new String[(readTag + i)];
                    if (i != 0) {
                        System.arraycopy(this.experimentalJavaBuilderInterface, 0, obj, 0, i);
                    }
                    while (i < obj.length - 1) {
                        obj[i] = codedInputByteBufferNano.readString();
                        codedInputByteBufferNano.readTag();
                        i++;
                    }
                    obj[i] = codedInputByteBufferNano.readString();
                    this.experimentalJavaBuilderInterface = obj;
                } else if (readTag == 50) {
                    readTag = WireFormatNano.getRepeatedFieldArrayLength(codedInputByteBufferNano, 50);
                    if (this.experimentalJavaInterfaceExtends == null) {
                        i = 0;
                    } else {
                        i = this.experimentalJavaInterfaceExtends.length;
                    }
                    obj = new String[(readTag + i)];
                    if (i != 0) {
                        System.arraycopy(this.experimentalJavaInterfaceExtends, 0, obj, 0, i);
                    }
                    while (i < obj.length - 1) {
                        obj[i] = codedInputByteBufferNano.readString();
                        codedInputByteBufferNano.readTag();
                        i++;
                    }
                    obj[i] = codedInputByteBufferNano.readString();
                    this.experimentalJavaInterfaceExtends = obj;
                } else if (readTag == 56) {
                    this.mapEntry = codedInputByteBufferNano.readBool();
                } else if (readTag == 7994) {
                    readTag = WireFormatNano.getRepeatedFieldArrayLength(codedInputByteBufferNano, 7994);
                    if (this.uninterpretedOption == null) {
                        i = 0;
                    } else {
                        i = this.uninterpretedOption.length;
                    }
                    obj = new UninterpretedOption[(readTag + i)];
                    if (i != 0) {
                        System.arraycopy(this.uninterpretedOption, 0, obj, 0, i);
                    }
                    while (i < obj.length - 1) {
                        obj[i] = new UninterpretedOption();
                        codedInputByteBufferNano.readMessage(obj[i]);
                        codedInputByteBufferNano.readTag();
                        i++;
                    }
                    obj[i] = new UninterpretedOption();
                    codedInputByteBufferNano.readMessage(obj[i]);
                    this.uninterpretedOption = obj;
                } else if (!super.storeUnknownField(codedInputByteBufferNano, readTag)) {
                    return this;
                }
            }
        }

        public static MessageOptions parseFrom(byte[] bArr) throws InvalidProtocolBufferNanoException {
            return (MessageOptions) MessageNano.mergeFrom(new MessageOptions(), bArr);
        }

        public static MessageOptions parseFrom(CodedInputByteBufferNano codedInputByteBufferNano) throws IOException {
            return new MessageOptions().mergeFrom(codedInputByteBufferNano);
        }
    }

    public static final class MethodDescriptorProto extends ExtendableMessageNano<MethodDescriptorProto> {
        private static volatile MethodDescriptorProto[] _emptyArray;
        public boolean clientStreaming;
        public String inputType;
        public String name;
        public MethodOptions options;
        public String outputType;
        public boolean serverStreaming;

        public static MethodDescriptorProto[] emptyArray() {
            if (_emptyArray == null) {
                synchronized (InternalNano.LAZY_INIT_LOCK) {
                    if (_emptyArray == null) {
                        _emptyArray = new MethodDescriptorProto[0];
                    }
                }
            }
            return _emptyArray;
        }

        public MethodDescriptorProto() {
            clear();
        }

        public MethodDescriptorProto clear() {
            this.name = "";
            this.inputType = "";
            this.outputType = "";
            this.options = null;
            this.clientStreaming = false;
            this.serverStreaming = false;
            this.unknownFieldData = null;
            this.cachedSize = -1;
            return this;
        }

        public void writeTo(CodedOutputByteBufferNano codedOutputByteBufferNano) throws IOException {
            if (!(this.name == null || this.name.equals(""))) {
                codedOutputByteBufferNano.writeString(1, this.name);
            }
            if (!(this.inputType == null || this.inputType.equals(""))) {
                codedOutputByteBufferNano.writeString(2, this.inputType);
            }
            if (!(this.outputType == null || this.outputType.equals(""))) {
                codedOutputByteBufferNano.writeString(3, this.outputType);
            }
            if (this.options != null) {
                codedOutputByteBufferNano.writeMessage(4, this.options);
            }
            if (this.clientStreaming) {
                codedOutputByteBufferNano.writeBool(5, this.clientStreaming);
            }
            if (this.serverStreaming) {
                codedOutputByteBufferNano.writeBool(6, this.serverStreaming);
            }
            super.writeTo(codedOutputByteBufferNano);
        }

        protected int computeSerializedSize() {
            int computeSerializedSize = super.computeSerializedSize();
            if (!(this.name == null || this.name.equals(""))) {
                computeSerializedSize += CodedOutputByteBufferNano.computeStringSize(1, this.name);
            }
            if (!(this.inputType == null || this.inputType.equals(""))) {
                computeSerializedSize += CodedOutputByteBufferNano.computeStringSize(2, this.inputType);
            }
            if (!(this.outputType == null || this.outputType.equals(""))) {
                computeSerializedSize += CodedOutputByteBufferNano.computeStringSize(3, this.outputType);
            }
            if (this.options != null) {
                computeSerializedSize += CodedOutputByteBufferNano.computeMessageSize(4, this.options);
            }
            if (this.clientStreaming) {
                computeSerializedSize += CodedOutputByteBufferNano.computeBoolSize(5, this.clientStreaming);
            }
            if (this.serverStreaming) {
                return computeSerializedSize + CodedOutputByteBufferNano.computeBoolSize(6, this.serverStreaming);
            }
            return computeSerializedSize;
        }

        public MethodDescriptorProto mergeFrom(CodedInputByteBufferNano codedInputByteBufferNano) throws IOException {
            while (true) {
                int readTag = codedInputByteBufferNano.readTag();
                if (readTag == 0) {
                    return this;
                }
                if (readTag == 10) {
                    this.name = codedInputByteBufferNano.readString();
                } else if (readTag == 18) {
                    this.inputType = codedInputByteBufferNano.readString();
                } else if (readTag == 26) {
                    this.outputType = codedInputByteBufferNano.readString();
                } else if (readTag == 34) {
                    if (this.options == null) {
                        this.options = new MethodOptions();
                    }
                    codedInputByteBufferNano.readMessage(this.options);
                } else if (readTag == 40) {
                    this.clientStreaming = codedInputByteBufferNano.readBool();
                } else if (readTag == 48) {
                    this.serverStreaming = codedInputByteBufferNano.readBool();
                } else if (!super.storeUnknownField(codedInputByteBufferNano, readTag)) {
                    return this;
                }
            }
        }

        public static MethodDescriptorProto parseFrom(byte[] bArr) throws InvalidProtocolBufferNanoException {
            return (MethodDescriptorProto) MessageNano.mergeFrom(new MethodDescriptorProto(), bArr);
        }

        public static MethodDescriptorProto parseFrom(CodedInputByteBufferNano codedInputByteBufferNano) throws IOException {
            return new MethodDescriptorProto().mergeFrom(codedInputByteBufferNano);
        }
    }

    public static final class MethodOptions extends ExtendableMessageNano<MethodOptions> {
        private static volatile MethodOptions[] _emptyArray;
        public int clientLogging;
        public boolean clientStreaming;
        public double deadline;
        public boolean deprecated;
        public boolean duplicateSuppression;
        public boolean endUserCredsRequested;
        public boolean failFast;
        public boolean goLegacyChannelApi;
        @NanoEnumValue(legacy = false, value = IdempotencyLevel.class)
        public int idempotencyLevel;
        public long legacyClientInitialTokens;
        public String legacyResultType;
        public long legacyServerInitialTokens;
        public String legacyStreamType;
        @NanoEnumValue(legacy = false, value = TokenUnit.class)
        public int legacyTokenUnit;
        @NanoEnumValue(legacy = false, value = LogLevel.class)
        public int logLevel;
        @NanoEnumValue(legacy = false, value = Protocol.class)
        public int protocol;
        @NanoEnumValue(legacy = false, value = Format.class)
        public int requestFormat;
        @NanoEnumValue(legacy = false, value = Format.class)
        public int responseFormat;
        public String securityLabel;
        @NanoEnumValue(legacy = false, value = SecurityLevel.class)
        public int securityLevel;
        public int serverLogging;
        public boolean serverStreaming;
        public String streamType;
        public UninterpretedOption[] uninterpretedOption;

        public interface Format {
            @NanoEnumValue(legacy = false, value = Format.class)
            public static final int UNCOMPRESSED = 0;
            @NanoEnumValue(legacy = false, value = Format.class)
            public static final int ZIPPY_COMPRESSED = 1;
        }

        public interface IdempotencyLevel {
            @NanoEnumValue(legacy = false, value = IdempotencyLevel.class)
            public static final int IDEMPOTENCY_UNKNOWN = 0;
            @NanoEnumValue(legacy = false, value = IdempotencyLevel.class)
            public static final int IDEMPOTENT = 2;
            @NanoEnumValue(legacy = false, value = IdempotencyLevel.class)
            public static final int NO_SIDE_EFFECTS = 1;
        }

        public interface LogLevel {
            @NanoEnumValue(legacy = false, value = LogLevel.class)
            public static final int LOG_HEADER_AND_FILTERED_PAYLOAD = 3;
            @NanoEnumValue(legacy = false, value = LogLevel.class)
            public static final int LOG_HEADER_AND_NON_PRIVATE_PAYLOAD_INTERNAL = 2;
            @NanoEnumValue(legacy = false, value = LogLevel.class)
            public static final int LOG_HEADER_AND_PAYLOAD = 4;
            @NanoEnumValue(legacy = false, value = LogLevel.class)
            public static final int LOG_HEADER_ONLY = 1;
            @NanoEnumValue(legacy = false, value = LogLevel.class)
            public static final int LOG_NONE = 0;
        }

        public interface Protocol {
            @NanoEnumValue(legacy = false, value = Protocol.class)
            public static final int TCP = 0;
            @NanoEnumValue(legacy = false, value = Protocol.class)
            public static final int UDP = 1;
        }

        public interface SecurityLevel {
            @NanoEnumValue(legacy = false, value = SecurityLevel.class)
            public static final int INTEGRITY = 1;
            @NanoEnumValue(legacy = false, value = SecurityLevel.class)
            public static final int NONE = 0;
            @NanoEnumValue(legacy = false, value = SecurityLevel.class)
            public static final int PRIVACY_AND_INTEGRITY = 2;
            @NanoEnumValue(legacy = false, value = SecurityLevel.class)
            public static final int STRONG_PRIVACY_AND_INTEGRITY = 3;
        }

        public interface TokenUnit {
            @NanoEnumValue(legacy = false, value = TokenUnit.class)
            public static final int BYTE = 1;
            @NanoEnumValue(legacy = false, value = TokenUnit.class)
            public static final int MESSAGE = 0;
        }

        @NanoEnumValue(legacy = false, value = Protocol.class)
        public static int checkProtocolOrThrow(int i) {
            if (i >= 0 && i <= 1) {
                return i;
            }
            StringBuilder stringBuilder = new StringBuilder(40);
            stringBuilder.append(i);
            stringBuilder.append(" is not a valid enum Protocol");
            throw new IllegalArgumentException(stringBuilder.toString());
        }

        @NanoEnumValue(legacy = false, value = Protocol.class)
        public static int[] checkProtocolOrThrow(int[] iArr) {
            iArr = (int[]) iArr.clone();
            for (int checkProtocolOrThrow : iArr) {
                checkProtocolOrThrow(checkProtocolOrThrow);
            }
            return iArr;
        }

        @NanoEnumValue(legacy = false, value = SecurityLevel.class)
        public static int checkSecurityLevelOrThrow(int i) {
            if (i >= 0 && i <= 3) {
                return i;
            }
            StringBuilder stringBuilder = new StringBuilder(45);
            stringBuilder.append(i);
            stringBuilder.append(" is not a valid enum SecurityLevel");
            throw new IllegalArgumentException(stringBuilder.toString());
        }

        @NanoEnumValue(legacy = false, value = SecurityLevel.class)
        public static int[] checkSecurityLevelOrThrow(int[] iArr) {
            iArr = (int[]) iArr.clone();
            for (int checkSecurityLevelOrThrow : iArr) {
                checkSecurityLevelOrThrow(checkSecurityLevelOrThrow);
            }
            return iArr;
        }

        @NanoEnumValue(legacy = false, value = Format.class)
        public static int checkFormatOrThrow(int i) {
            if (i >= 0 && i <= 1) {
                return i;
            }
            StringBuilder stringBuilder = new StringBuilder(38);
            stringBuilder.append(i);
            stringBuilder.append(" is not a valid enum Format");
            throw new IllegalArgumentException(stringBuilder.toString());
        }

        @NanoEnumValue(legacy = false, value = Format.class)
        public static int[] checkFormatOrThrow(int[] iArr) {
            iArr = (int[]) iArr.clone();
            for (int checkFormatOrThrow : iArr) {
                checkFormatOrThrow(checkFormatOrThrow);
            }
            return iArr;
        }

        @NanoEnumValue(legacy = false, value = LogLevel.class)
        public static int checkLogLevelOrThrow(int i) {
            if (i >= 0 && i <= 4) {
                return i;
            }
            StringBuilder stringBuilder = new StringBuilder(40);
            stringBuilder.append(i);
            stringBuilder.append(" is not a valid enum LogLevel");
            throw new IllegalArgumentException(stringBuilder.toString());
        }

        @NanoEnumValue(legacy = false, value = LogLevel.class)
        public static int[] checkLogLevelOrThrow(int[] iArr) {
            iArr = (int[]) iArr.clone();
            for (int checkLogLevelOrThrow : iArr) {
                checkLogLevelOrThrow(checkLogLevelOrThrow);
            }
            return iArr;
        }

        @NanoEnumValue(legacy = false, value = TokenUnit.class)
        public static int checkTokenUnitOrThrow(int i) {
            if (i >= 0 && i <= 1) {
                return i;
            }
            StringBuilder stringBuilder = new StringBuilder(41);
            stringBuilder.append(i);
            stringBuilder.append(" is not a valid enum TokenUnit");
            throw new IllegalArgumentException(stringBuilder.toString());
        }

        @NanoEnumValue(legacy = false, value = TokenUnit.class)
        public static int[] checkTokenUnitOrThrow(int[] iArr) {
            iArr = (int[]) iArr.clone();
            for (int checkTokenUnitOrThrow : iArr) {
                checkTokenUnitOrThrow(checkTokenUnitOrThrow);
            }
            return iArr;
        }

        @NanoEnumValue(legacy = false, value = IdempotencyLevel.class)
        public static int checkIdempotencyLevelOrThrow(int i) {
            if (i >= 0 && i <= 2) {
                return i;
            }
            StringBuilder stringBuilder = new StringBuilder(48);
            stringBuilder.append(i);
            stringBuilder.append(" is not a valid enum IdempotencyLevel");
            throw new IllegalArgumentException(stringBuilder.toString());
        }

        @NanoEnumValue(legacy = false, value = IdempotencyLevel.class)
        public static int[] checkIdempotencyLevelOrThrow(int[] iArr) {
            iArr = (int[]) iArr.clone();
            for (int checkIdempotencyLevelOrThrow : iArr) {
                checkIdempotencyLevelOrThrow(checkIdempotencyLevelOrThrow);
            }
            return iArr;
        }

        public static MethodOptions[] emptyArray() {
            if (_emptyArray == null) {
                synchronized (InternalNano.LAZY_INIT_LOCK) {
                    if (_emptyArray == null) {
                        _emptyArray = new MethodOptions[0];
                    }
                }
            }
            return _emptyArray;
        }

        public MethodOptions() {
            clear();
        }

        public MethodOptions clear() {
            this.protocol = 0;
            this.deadline = -1.0d;
            this.duplicateSuppression = false;
            this.failFast = false;
            this.endUserCredsRequested = false;
            this.clientLogging = 256;
            this.serverLogging = 256;
            this.securityLevel = 0;
            this.responseFormat = 0;
            this.requestFormat = 0;
            this.streamType = "";
            this.securityLabel = "";
            this.clientStreaming = false;
            this.serverStreaming = false;
            this.legacyStreamType = "";
            this.legacyResultType = "";
            this.goLegacyChannelApi = false;
            this.legacyClientInitialTokens = -1;
            this.legacyServerInitialTokens = -1;
            this.legacyTokenUnit = 1;
            this.logLevel = 2;
            this.deprecated = false;
            this.idempotencyLevel = 0;
            this.uninterpretedOption = UninterpretedOption.emptyArray();
            this.unknownFieldData = null;
            this.cachedSize = -1;
            return this;
        }

        public void writeTo(CodedOutputByteBufferNano codedOutputByteBufferNano) throws IOException {
            if (this.protocol != 0) {
                codedOutputByteBufferNano.writeInt32(7, this.protocol);
            }
            if (Double.doubleToLongBits(this.deadline) != Double.doubleToLongBits(-1.0d)) {
                codedOutputByteBufferNano.writeDouble(8, this.deadline);
            }
            if (this.duplicateSuppression) {
                codedOutputByteBufferNano.writeBool(9, this.duplicateSuppression);
            }
            if (this.failFast) {
                codedOutputByteBufferNano.writeBool(10, this.failFast);
            }
            if (this.clientLogging != 256) {
                codedOutputByteBufferNano.writeSInt32(11, this.clientLogging);
            }
            if (this.serverLogging != 256) {
                codedOutputByteBufferNano.writeSInt32(12, this.serverLogging);
            }
            if (this.securityLevel != 0) {
                codedOutputByteBufferNano.writeInt32(13, this.securityLevel);
            }
            if (this.responseFormat != 0) {
                codedOutputByteBufferNano.writeInt32(15, this.responseFormat);
            }
            if (this.requestFormat != 0) {
                codedOutputByteBufferNano.writeInt32(17, this.requestFormat);
            }
            if (!(this.streamType == null || this.streamType.equals(""))) {
                codedOutputByteBufferNano.writeString(18, this.streamType);
            }
            if (!(this.securityLabel == null || this.securityLabel.equals(""))) {
                codedOutputByteBufferNano.writeString(19, this.securityLabel);
            }
            if (this.clientStreaming) {
                codedOutputByteBufferNano.writeBool(20, this.clientStreaming);
            }
            if (this.serverStreaming) {
                codedOutputByteBufferNano.writeBool(21, this.serverStreaming);
            }
            if (!(this.legacyStreamType == null || this.legacyStreamType.equals(""))) {
                codedOutputByteBufferNano.writeString(22, this.legacyStreamType);
            }
            if (!(this.legacyResultType == null || this.legacyResultType.equals(""))) {
                codedOutputByteBufferNano.writeString(23, this.legacyResultType);
            }
            if (this.legacyClientInitialTokens != -1) {
                codedOutputByteBufferNano.writeInt64(24, this.legacyClientInitialTokens);
            }
            if (this.legacyServerInitialTokens != -1) {
                codedOutputByteBufferNano.writeInt64(25, this.legacyServerInitialTokens);
            }
            if (this.endUserCredsRequested) {
                codedOutputByteBufferNano.writeBool(26, this.endUserCredsRequested);
            }
            if (this.logLevel != 2) {
                codedOutputByteBufferNano.writeInt32(27, this.logLevel);
            }
            if (this.legacyTokenUnit != 1) {
                codedOutputByteBufferNano.writeInt32(28, this.legacyTokenUnit);
            }
            if (this.goLegacyChannelApi) {
                codedOutputByteBufferNano.writeBool(29, this.goLegacyChannelApi);
            }
            if (this.deprecated) {
                codedOutputByteBufferNano.writeBool(33, this.deprecated);
            }
            if (this.idempotencyLevel != 0) {
                codedOutputByteBufferNano.writeInt32(34, this.idempotencyLevel);
            }
            if (this.uninterpretedOption != null && this.uninterpretedOption.length > 0) {
                for (MessageNano messageNano : this.uninterpretedOption) {
                    if (messageNano != null) {
                        codedOutputByteBufferNano.writeMessage(999, messageNano);
                    }
                }
            }
            super.writeTo(codedOutputByteBufferNano);
        }

        protected int computeSerializedSize() {
            int computeSerializedSize = super.computeSerializedSize();
            if (this.protocol != 0) {
                computeSerializedSize += CodedOutputByteBufferNano.computeInt32Size(7, this.protocol);
            }
            if (Double.doubleToLongBits(this.deadline) != Double.doubleToLongBits(-1.0d)) {
                computeSerializedSize += CodedOutputByteBufferNano.computeDoubleSize(8, this.deadline);
            }
            if (this.duplicateSuppression) {
                computeSerializedSize += CodedOutputByteBufferNano.computeBoolSize(9, this.duplicateSuppression);
            }
            if (this.failFast) {
                computeSerializedSize += CodedOutputByteBufferNano.computeBoolSize(10, this.failFast);
            }
            if (this.clientLogging != 256) {
                computeSerializedSize += CodedOutputByteBufferNano.computeSInt32Size(11, this.clientLogging);
            }
            if (this.serverLogging != 256) {
                computeSerializedSize += CodedOutputByteBufferNano.computeSInt32Size(12, this.serverLogging);
            }
            if (this.securityLevel != 0) {
                computeSerializedSize += CodedOutputByteBufferNano.computeInt32Size(13, this.securityLevel);
            }
            if (this.responseFormat != 0) {
                computeSerializedSize += CodedOutputByteBufferNano.computeInt32Size(15, this.responseFormat);
            }
            if (this.requestFormat != 0) {
                computeSerializedSize += CodedOutputByteBufferNano.computeInt32Size(17, this.requestFormat);
            }
            if (!(this.streamType == null || this.streamType.equals(""))) {
                computeSerializedSize += CodedOutputByteBufferNano.computeStringSize(18, this.streamType);
            }
            if (!(this.securityLabel == null || this.securityLabel.equals(""))) {
                computeSerializedSize += CodedOutputByteBufferNano.computeStringSize(19, this.securityLabel);
            }
            if (this.clientStreaming) {
                computeSerializedSize += CodedOutputByteBufferNano.computeBoolSize(20, this.clientStreaming);
            }
            if (this.serverStreaming) {
                computeSerializedSize += CodedOutputByteBufferNano.computeBoolSize(21, this.serverStreaming);
            }
            if (!(this.legacyStreamType == null || this.legacyStreamType.equals(""))) {
                computeSerializedSize += CodedOutputByteBufferNano.computeStringSize(22, this.legacyStreamType);
            }
            if (!(this.legacyResultType == null || this.legacyResultType.equals(""))) {
                computeSerializedSize += CodedOutputByteBufferNano.computeStringSize(23, this.legacyResultType);
            }
            if (this.legacyClientInitialTokens != -1) {
                computeSerializedSize += CodedOutputByteBufferNano.computeInt64Size(24, this.legacyClientInitialTokens);
            }
            if (this.legacyServerInitialTokens != -1) {
                computeSerializedSize += CodedOutputByteBufferNano.computeInt64Size(25, this.legacyServerInitialTokens);
            }
            if (this.endUserCredsRequested) {
                computeSerializedSize += CodedOutputByteBufferNano.computeBoolSize(26, this.endUserCredsRequested);
            }
            if (this.logLevel != 2) {
                computeSerializedSize += CodedOutputByteBufferNano.computeInt32Size(27, this.logLevel);
            }
            if (this.legacyTokenUnit != 1) {
                computeSerializedSize += CodedOutputByteBufferNano.computeInt32Size(28, this.legacyTokenUnit);
            }
            if (this.goLegacyChannelApi) {
                computeSerializedSize += CodedOutputByteBufferNano.computeBoolSize(29, this.goLegacyChannelApi);
            }
            if (this.deprecated) {
                computeSerializedSize += CodedOutputByteBufferNano.computeBoolSize(33, this.deprecated);
            }
            if (this.idempotencyLevel != 0) {
                computeSerializedSize += CodedOutputByteBufferNano.computeInt32Size(34, this.idempotencyLevel);
            }
            if (this.uninterpretedOption != null && this.uninterpretedOption.length > 0) {
                for (MessageNano messageNano : this.uninterpretedOption) {
                    if (messageNano != null) {
                        computeSerializedSize += CodedOutputByteBufferNano.computeMessageSize(999, messageNano);
                    }
                }
            }
            return computeSerializedSize;
        }

        public MethodOptions mergeFrom(CodedInputByteBufferNano codedInputByteBufferNano) throws IOException {
            int position;
            while (true) {
                int readTag = codedInputByteBufferNano.readTag();
                switch (readTag) {
                    case 0:
                        return this;
                    case 56:
                        position = codedInputByteBufferNano.getPosition();
                        try {
                            this.protocol = checkProtocolOrThrow(codedInputByteBufferNano.readInt32());
                            break;
                        } catch (IllegalArgumentException e) {
                            codedInputByteBufferNano.rewindToPosition(position);
                            storeUnknownField(codedInputByteBufferNano, readTag);
                            break;
                        }
                    case 65:
                        this.deadline = codedInputByteBufferNano.readDouble();
                        break;
                    case 72:
                        this.duplicateSuppression = codedInputByteBufferNano.readBool();
                        break;
                    case 80:
                        this.failFast = codedInputByteBufferNano.readBool();
                        break;
                    case 88:
                        this.clientLogging = codedInputByteBufferNano.readSInt32();
                        break;
                    case 96:
                        this.serverLogging = codedInputByteBufferNano.readSInt32();
                        break;
                    case 104:
                        position = codedInputByteBufferNano.getPosition();
                        try {
                            this.securityLevel = checkSecurityLevelOrThrow(codedInputByteBufferNano.readInt32());
                            break;
                        } catch (IllegalArgumentException e2) {
                            codedInputByteBufferNano.rewindToPosition(position);
                            storeUnknownField(codedInputByteBufferNano, readTag);
                            break;
                        }
                    case 120:
                        position = codedInputByteBufferNano.getPosition();
                        try {
                            this.responseFormat = checkFormatOrThrow(codedInputByteBufferNano.readInt32());
                            break;
                        } catch (IllegalArgumentException e3) {
                            codedInputByteBufferNano.rewindToPosition(position);
                            storeUnknownField(codedInputByteBufferNano, readTag);
                            break;
                        }
                    case 136:
                        position = codedInputByteBufferNano.getPosition();
                        try {
                            this.requestFormat = checkFormatOrThrow(codedInputByteBufferNano.readInt32());
                            break;
                        } catch (IllegalArgumentException e4) {
                            codedInputByteBufferNano.rewindToPosition(position);
                            storeUnknownField(codedInputByteBufferNano, readTag);
                            break;
                        }
                    case 146:
                        this.streamType = codedInputByteBufferNano.readString();
                        break;
                    case 154:
                        this.securityLabel = codedInputByteBufferNano.readString();
                        break;
                    case 160:
                        this.clientStreaming = codedInputByteBufferNano.readBool();
                        break;
                    case 168:
                        this.serverStreaming = codedInputByteBufferNano.readBool();
                        break;
                    case 178:
                        this.legacyStreamType = codedInputByteBufferNano.readString();
                        break;
                    case 186:
                        this.legacyResultType = codedInputByteBufferNano.readString();
                        break;
                    case 192:
                        this.legacyClientInitialTokens = codedInputByteBufferNano.readInt64();
                        break;
                    case 200:
                        this.legacyServerInitialTokens = codedInputByteBufferNano.readInt64();
                        break;
                    case 208:
                        this.endUserCredsRequested = codedInputByteBufferNano.readBool();
                        break;
                    case 216:
                        position = codedInputByteBufferNano.getPosition();
                        try {
                            this.logLevel = checkLogLevelOrThrow(codedInputByteBufferNano.readInt32());
                            break;
                        } catch (IllegalArgumentException e5) {
                            codedInputByteBufferNano.rewindToPosition(position);
                            storeUnknownField(codedInputByteBufferNano, readTag);
                            break;
                        }
                    case 224:
                        position = codedInputByteBufferNano.getPosition();
                        try {
                            this.legacyTokenUnit = checkTokenUnitOrThrow(codedInputByteBufferNano.readInt32());
                            break;
                        } catch (IllegalArgumentException e6) {
                            codedInputByteBufferNano.rewindToPosition(position);
                            storeUnknownField(codedInputByteBufferNano, readTag);
                            break;
                        }
                    case 232:
                        this.goLegacyChannelApi = codedInputByteBufferNano.readBool();
                        break;
                    case 264:
                        this.deprecated = codedInputByteBufferNano.readBool();
                        break;
                    case 272:
                        position = codedInputByteBufferNano.getPosition();
                        try {
                            this.idempotencyLevel = checkIdempotencyLevelOrThrow(codedInputByteBufferNano.readInt32());
                            break;
                        } catch (IllegalArgumentException e7) {
                            codedInputByteBufferNano.rewindToPosition(position);
                            storeUnknownField(codedInputByteBufferNano, readTag);
                            break;
                        }
                    case 7994:
                        readTag = WireFormatNano.getRepeatedFieldArrayLength(codedInputByteBufferNano, 7994);
                        if (this.uninterpretedOption == null) {
                            position = 0;
                        } else {
                            position = this.uninterpretedOption.length;
                        }
                        Object obj = new UninterpretedOption[(readTag + position)];
                        if (position != 0) {
                            System.arraycopy(this.uninterpretedOption, 0, obj, 0, position);
                        }
                        while (position < obj.length - 1) {
                            obj[position] = new UninterpretedOption();
                            codedInputByteBufferNano.readMessage(obj[position]);
                            codedInputByteBufferNano.readTag();
                            position++;
                        }
                        obj[position] = new UninterpretedOption();
                        codedInputByteBufferNano.readMessage(obj[position]);
                        this.uninterpretedOption = obj;
                        break;
                    default:
                        if (super.storeUnknownField(codedInputByteBufferNano, readTag)) {
                            break;
                        }
                        return this;
                }
            }
        }

        public static MethodOptions parseFrom(byte[] bArr) throws InvalidProtocolBufferNanoException {
            return (MethodOptions) MessageNano.mergeFrom(new MethodOptions(), bArr);
        }

        public static MethodOptions parseFrom(CodedInputByteBufferNano codedInputByteBufferNano) throws IOException {
            return new MethodOptions().mergeFrom(codedInputByteBufferNano);
        }
    }

    public static final class OneofDescriptorProto extends ExtendableMessageNano<OneofDescriptorProto> {
        private static volatile OneofDescriptorProto[] _emptyArray;
        public String name;
        public OneofOptions options;

        public static OneofDescriptorProto[] emptyArray() {
            if (_emptyArray == null) {
                synchronized (InternalNano.LAZY_INIT_LOCK) {
                    if (_emptyArray == null) {
                        _emptyArray = new OneofDescriptorProto[0];
                    }
                }
            }
            return _emptyArray;
        }

        public OneofDescriptorProto() {
            clear();
        }

        public OneofDescriptorProto clear() {
            this.name = "";
            this.options = null;
            this.unknownFieldData = null;
            this.cachedSize = -1;
            return this;
        }

        public void writeTo(CodedOutputByteBufferNano codedOutputByteBufferNano) throws IOException {
            if (!(this.name == null || this.name.equals(""))) {
                codedOutputByteBufferNano.writeString(1, this.name);
            }
            if (this.options != null) {
                codedOutputByteBufferNano.writeMessage(2, this.options);
            }
            super.writeTo(codedOutputByteBufferNano);
        }

        protected int computeSerializedSize() {
            int computeSerializedSize = super.computeSerializedSize();
            if (!(this.name == null || this.name.equals(""))) {
                computeSerializedSize += CodedOutputByteBufferNano.computeStringSize(1, this.name);
            }
            if (this.options != null) {
                return computeSerializedSize + CodedOutputByteBufferNano.computeMessageSize(2, this.options);
            }
            return computeSerializedSize;
        }

        public OneofDescriptorProto mergeFrom(CodedInputByteBufferNano codedInputByteBufferNano) throws IOException {
            while (true) {
                int readTag = codedInputByteBufferNano.readTag();
                if (readTag == 0) {
                    return this;
                }
                if (readTag == 10) {
                    this.name = codedInputByteBufferNano.readString();
                } else if (readTag == 18) {
                    if (this.options == null) {
                        this.options = new OneofOptions();
                    }
                    codedInputByteBufferNano.readMessage(this.options);
                } else if (!super.storeUnknownField(codedInputByteBufferNano, readTag)) {
                    return this;
                }
            }
        }

        public static OneofDescriptorProto parseFrom(byte[] bArr) throws InvalidProtocolBufferNanoException {
            return (OneofDescriptorProto) MessageNano.mergeFrom(new OneofDescriptorProto(), bArr);
        }

        public static OneofDescriptorProto parseFrom(CodedInputByteBufferNano codedInputByteBufferNano) throws IOException {
            return new OneofDescriptorProto().mergeFrom(codedInputByteBufferNano);
        }
    }

    public static final class OneofOptions extends ExtendableMessageNano<OneofOptions> {
        private static volatile OneofOptions[] _emptyArray;
        public UninterpretedOption[] uninterpretedOption;

        public static OneofOptions[] emptyArray() {
            if (_emptyArray == null) {
                synchronized (InternalNano.LAZY_INIT_LOCK) {
                    if (_emptyArray == null) {
                        _emptyArray = new OneofOptions[0];
                    }
                }
            }
            return _emptyArray;
        }

        public OneofOptions() {
            clear();
        }

        public OneofOptions clear() {
            this.uninterpretedOption = UninterpretedOption.emptyArray();
            this.unknownFieldData = null;
            this.cachedSize = -1;
            return this;
        }

        public void writeTo(CodedOutputByteBufferNano codedOutputByteBufferNano) throws IOException {
            if (this.uninterpretedOption != null && this.uninterpretedOption.length > 0) {
                for (MessageNano messageNano : this.uninterpretedOption) {
                    if (messageNano != null) {
                        codedOutputByteBufferNano.writeMessage(999, messageNano);
                    }
                }
            }
            super.writeTo(codedOutputByteBufferNano);
        }

        protected int computeSerializedSize() {
            int computeSerializedSize = super.computeSerializedSize();
            if (this.uninterpretedOption != null && this.uninterpretedOption.length > 0) {
                for (MessageNano messageNano : this.uninterpretedOption) {
                    if (messageNano != null) {
                        computeSerializedSize += CodedOutputByteBufferNano.computeMessageSize(999, messageNano);
                    }
                }
            }
            return computeSerializedSize;
        }

        public OneofOptions mergeFrom(CodedInputByteBufferNano codedInputByteBufferNano) throws IOException {
            while (true) {
                int readTag = codedInputByteBufferNano.readTag();
                if (readTag == 0) {
                    return this;
                }
                if (readTag == 7994) {
                    int i;
                    readTag = WireFormatNano.getRepeatedFieldArrayLength(codedInputByteBufferNano, 7994);
                    if (this.uninterpretedOption == null) {
                        i = 0;
                    } else {
                        i = this.uninterpretedOption.length;
                    }
                    Object obj = new UninterpretedOption[(readTag + i)];
                    if (i != 0) {
                        System.arraycopy(this.uninterpretedOption, 0, obj, 0, i);
                    }
                    while (i < obj.length - 1) {
                        obj[i] = new UninterpretedOption();
                        codedInputByteBufferNano.readMessage(obj[i]);
                        codedInputByteBufferNano.readTag();
                        i++;
                    }
                    obj[i] = new UninterpretedOption();
                    codedInputByteBufferNano.readMessage(obj[i]);
                    this.uninterpretedOption = obj;
                } else if (!super.storeUnknownField(codedInputByteBufferNano, readTag)) {
                    return this;
                }
            }
        }

        public static OneofOptions parseFrom(byte[] bArr) throws InvalidProtocolBufferNanoException {
            return (OneofOptions) MessageNano.mergeFrom(new OneofOptions(), bArr);
        }

        public static OneofOptions parseFrom(CodedInputByteBufferNano codedInputByteBufferNano) throws IOException {
            return new OneofOptions().mergeFrom(codedInputByteBufferNano);
        }
    }

    public static final class ServiceDescriptorProto extends ExtendableMessageNano<ServiceDescriptorProto> {
        private static volatile ServiceDescriptorProto[] _emptyArray;
        public MethodDescriptorProto[] method;
        public String name;
        public ServiceOptions options;
        public StreamDescriptorProto[] stream;

        public static ServiceDescriptorProto[] emptyArray() {
            if (_emptyArray == null) {
                synchronized (InternalNano.LAZY_INIT_LOCK) {
                    if (_emptyArray == null) {
                        _emptyArray = new ServiceDescriptorProto[0];
                    }
                }
            }
            return _emptyArray;
        }

        public ServiceDescriptorProto() {
            clear();
        }

        public ServiceDescriptorProto clear() {
            this.name = "";
            this.method = MethodDescriptorProto.emptyArray();
            this.stream = StreamDescriptorProto.emptyArray();
            this.options = null;
            this.unknownFieldData = null;
            this.cachedSize = -1;
            return this;
        }

        public void writeTo(CodedOutputByteBufferNano codedOutputByteBufferNano) throws IOException {
            if (!(this.name == null || this.name.equals(""))) {
                codedOutputByteBufferNano.writeString(1, this.name);
            }
            int i = 0;
            if (this.method != null && this.method.length > 0) {
                for (MessageNano messageNano : this.method) {
                    if (messageNano != null) {
                        codedOutputByteBufferNano.writeMessage(2, messageNano);
                    }
                }
            }
            if (this.options != null) {
                codedOutputByteBufferNano.writeMessage(3, this.options);
            }
            if (this.stream != null && this.stream.length > 0) {
                while (i < this.stream.length) {
                    MessageNano messageNano2 = this.stream[i];
                    if (messageNano2 != null) {
                        codedOutputByteBufferNano.writeMessage(4, messageNano2);
                    }
                    i++;
                }
            }
            super.writeTo(codedOutputByteBufferNano);
        }

        protected int computeSerializedSize() {
            int computeSerializedSize = super.computeSerializedSize();
            if (!(this.name == null || this.name.equals(""))) {
                computeSerializedSize += CodedOutputByteBufferNano.computeStringSize(1, this.name);
            }
            int i = 0;
            if (this.method != null && this.method.length > 0) {
                int i2 = computeSerializedSize;
                for (MessageNano messageNano : this.method) {
                    if (messageNano != null) {
                        i2 += CodedOutputByteBufferNano.computeMessageSize(2, messageNano);
                    }
                }
                computeSerializedSize = i2;
            }
            if (this.options != null) {
                computeSerializedSize += CodedOutputByteBufferNano.computeMessageSize(3, this.options);
            }
            if (this.stream != null && this.stream.length > 0) {
                while (i < this.stream.length) {
                    MessageNano messageNano2 = this.stream[i];
                    if (messageNano2 != null) {
                        computeSerializedSize += CodedOutputByteBufferNano.computeMessageSize(4, messageNano2);
                    }
                    i++;
                }
            }
            return computeSerializedSize;
        }

        public ServiceDescriptorProto mergeFrom(CodedInputByteBufferNano codedInputByteBufferNano) throws IOException {
            while (true) {
                int readTag = codedInputByteBufferNano.readTag();
                if (readTag == 0) {
                    return this;
                }
                int i;
                Object obj;
                if (readTag == 10) {
                    this.name = codedInputByteBufferNano.readString();
                } else if (readTag == 18) {
                    readTag = WireFormatNano.getRepeatedFieldArrayLength(codedInputByteBufferNano, 18);
                    if (this.method == null) {
                        i = 0;
                    } else {
                        i = this.method.length;
                    }
                    obj = new MethodDescriptorProto[(readTag + i)];
                    if (i != 0) {
                        System.arraycopy(this.method, 0, obj, 0, i);
                    }
                    while (i < obj.length - 1) {
                        obj[i] = new MethodDescriptorProto();
                        codedInputByteBufferNano.readMessage(obj[i]);
                        codedInputByteBufferNano.readTag();
                        i++;
                    }
                    obj[i] = new MethodDescriptorProto();
                    codedInputByteBufferNano.readMessage(obj[i]);
                    this.method = obj;
                } else if (readTag == 26) {
                    if (this.options == null) {
                        this.options = new ServiceOptions();
                    }
                    codedInputByteBufferNano.readMessage(this.options);
                } else if (readTag == 34) {
                    readTag = WireFormatNano.getRepeatedFieldArrayLength(codedInputByteBufferNano, 34);
                    if (this.stream == null) {
                        i = 0;
                    } else {
                        i = this.stream.length;
                    }
                    obj = new StreamDescriptorProto[(readTag + i)];
                    if (i != 0) {
                        System.arraycopy(this.stream, 0, obj, 0, i);
                    }
                    while (i < obj.length - 1) {
                        obj[i] = new StreamDescriptorProto();
                        codedInputByteBufferNano.readMessage(obj[i]);
                        codedInputByteBufferNano.readTag();
                        i++;
                    }
                    obj[i] = new StreamDescriptorProto();
                    codedInputByteBufferNano.readMessage(obj[i]);
                    this.stream = obj;
                } else if (!super.storeUnknownField(codedInputByteBufferNano, readTag)) {
                    return this;
                }
            }
        }

        public static ServiceDescriptorProto parseFrom(byte[] bArr) throws InvalidProtocolBufferNanoException {
            return (ServiceDescriptorProto) MessageNano.mergeFrom(new ServiceDescriptorProto(), bArr);
        }

        public static ServiceDescriptorProto parseFrom(CodedInputByteBufferNano codedInputByteBufferNano) throws IOException {
            return new ServiceDescriptorProto().mergeFrom(codedInputByteBufferNano);
        }
    }

    public static final class ServiceOptions extends ExtendableMessageNano<ServiceOptions> {
        private static volatile ServiceOptions[] _emptyArray;
        public boolean deprecated;
        public double failureDetectionDelay;
        public boolean multicastStub;
        public UninterpretedOption[] uninterpretedOption;

        public static ServiceOptions[] emptyArray() {
            if (_emptyArray == null) {
                synchronized (InternalNano.LAZY_INIT_LOCK) {
                    if (_emptyArray == null) {
                        _emptyArray = new ServiceOptions[0];
                    }
                }
            }
            return _emptyArray;
        }

        public ServiceOptions() {
            clear();
        }

        public ServiceOptions clear() {
            this.multicastStub = false;
            this.failureDetectionDelay = -1.0d;
            this.deprecated = false;
            this.uninterpretedOption = UninterpretedOption.emptyArray();
            this.unknownFieldData = null;
            this.cachedSize = -1;
            return this;
        }

        public void writeTo(CodedOutputByteBufferNano codedOutputByteBufferNano) throws IOException {
            if (Double.doubleToLongBits(this.failureDetectionDelay) != Double.doubleToLongBits(-1.0d)) {
                codedOutputByteBufferNano.writeDouble(16, this.failureDetectionDelay);
            }
            if (this.multicastStub) {
                codedOutputByteBufferNano.writeBool(20, this.multicastStub);
            }
            if (this.deprecated) {
                codedOutputByteBufferNano.writeBool(33, this.deprecated);
            }
            if (this.uninterpretedOption != null && this.uninterpretedOption.length > 0) {
                for (MessageNano messageNano : this.uninterpretedOption) {
                    if (messageNano != null) {
                        codedOutputByteBufferNano.writeMessage(999, messageNano);
                    }
                }
            }
            super.writeTo(codedOutputByteBufferNano);
        }

        protected int computeSerializedSize() {
            int computeSerializedSize = super.computeSerializedSize();
            if (Double.doubleToLongBits(this.failureDetectionDelay) != Double.doubleToLongBits(-1.0d)) {
                computeSerializedSize += CodedOutputByteBufferNano.computeDoubleSize(16, this.failureDetectionDelay);
            }
            if (this.multicastStub) {
                computeSerializedSize += CodedOutputByteBufferNano.computeBoolSize(20, this.multicastStub);
            }
            if (this.deprecated) {
                computeSerializedSize += CodedOutputByteBufferNano.computeBoolSize(33, this.deprecated);
            }
            if (this.uninterpretedOption != null && this.uninterpretedOption.length > 0) {
                for (MessageNano messageNano : this.uninterpretedOption) {
                    if (messageNano != null) {
                        computeSerializedSize += CodedOutputByteBufferNano.computeMessageSize(999, messageNano);
                    }
                }
            }
            return computeSerializedSize;
        }

        public ServiceOptions mergeFrom(CodedInputByteBufferNano codedInputByteBufferNano) throws IOException {
            while (true) {
                int readTag = codedInputByteBufferNano.readTag();
                if (readTag == 0) {
                    return this;
                }
                if (readTag == 129) {
                    this.failureDetectionDelay = codedInputByteBufferNano.readDouble();
                } else if (readTag == 160) {
                    this.multicastStub = codedInputByteBufferNano.readBool();
                } else if (readTag == 264) {
                    this.deprecated = codedInputByteBufferNano.readBool();
                } else if (readTag == 7994) {
                    int i;
                    readTag = WireFormatNano.getRepeatedFieldArrayLength(codedInputByteBufferNano, 7994);
                    if (this.uninterpretedOption == null) {
                        i = 0;
                    } else {
                        i = this.uninterpretedOption.length;
                    }
                    Object obj = new UninterpretedOption[(readTag + i)];
                    if (i != 0) {
                        System.arraycopy(this.uninterpretedOption, 0, obj, 0, i);
                    }
                    while (i < obj.length - 1) {
                        obj[i] = new UninterpretedOption();
                        codedInputByteBufferNano.readMessage(obj[i]);
                        codedInputByteBufferNano.readTag();
                        i++;
                    }
                    obj[i] = new UninterpretedOption();
                    codedInputByteBufferNano.readMessage(obj[i]);
                    this.uninterpretedOption = obj;
                } else if (!super.storeUnknownField(codedInputByteBufferNano, readTag)) {
                    return this;
                }
            }
        }

        public static ServiceOptions parseFrom(byte[] bArr) throws InvalidProtocolBufferNanoException {
            return (ServiceOptions) MessageNano.mergeFrom(new ServiceOptions(), bArr);
        }

        public static ServiceOptions parseFrom(CodedInputByteBufferNano codedInputByteBufferNano) throws IOException {
            return new ServiceOptions().mergeFrom(codedInputByteBufferNano);
        }
    }

    public static final class SourceCodeInfo extends ExtendableMessageNano<SourceCodeInfo> {
        private static volatile SourceCodeInfo[] _emptyArray;
        public Location[] location;

        public static final class Location extends ExtendableMessageNano<Location> {
            private static volatile Location[] _emptyArray;
            public String leadingComments;
            public String[] leadingDetachedComments;
            public int[] path;
            public int[] span;
            public String trailingComments;

            public static Location[] emptyArray() {
                if (_emptyArray == null) {
                    synchronized (InternalNano.LAZY_INIT_LOCK) {
                        if (_emptyArray == null) {
                            _emptyArray = new Location[0];
                        }
                    }
                }
                return _emptyArray;
            }

            public Location() {
                clear();
            }

            public Location clear() {
                this.path = WireFormatNano.EMPTY_INT_ARRAY;
                this.span = WireFormatNano.EMPTY_INT_ARRAY;
                this.leadingComments = "";
                this.trailingComments = "";
                this.leadingDetachedComments = WireFormatNano.EMPTY_STRING_ARRAY;
                this.unknownFieldData = null;
                this.cachedSize = -1;
                return this;
            }

            public void writeTo(CodedOutputByteBufferNano codedOutputByteBufferNano) throws IOException {
                int i;
                int i2;
                int i3 = 0;
                if (this.path != null && this.path.length > 0) {
                    i = 0;
                    i2 = i;
                    while (i < this.path.length) {
                        i2 += CodedOutputByteBufferNano.computeInt32SizeNoTag(this.path[i]);
                        i++;
                    }
                    codedOutputByteBufferNano.writeRawVarint32(10);
                    codedOutputByteBufferNano.writeRawVarint32(i2);
                    for (int i22 : this.path) {
                        codedOutputByteBufferNano.writeInt32NoTag(i22);
                    }
                }
                if (this.span != null && this.span.length > 0) {
                    i = 0;
                    i22 = i;
                    while (i < this.span.length) {
                        i22 += CodedOutputByteBufferNano.computeInt32SizeNoTag(this.span[i]);
                        i++;
                    }
                    codedOutputByteBufferNano.writeRawVarint32(18);
                    codedOutputByteBufferNano.writeRawVarint32(i22);
                    for (int i222 : this.span) {
                        codedOutputByteBufferNano.writeInt32NoTag(i222);
                    }
                }
                if (!(this.leadingComments == null || this.leadingComments.equals(""))) {
                    codedOutputByteBufferNano.writeString(3, this.leadingComments);
                }
                if (!(this.trailingComments == null || this.trailingComments.equals(""))) {
                    codedOutputByteBufferNano.writeString(4, this.trailingComments);
                }
                if (this.leadingDetachedComments != null && this.leadingDetachedComments.length > 0) {
                    while (i3 < this.leadingDetachedComments.length) {
                        String str = this.leadingDetachedComments[i3];
                        if (str != null) {
                            codedOutputByteBufferNano.writeString(6, str);
                        }
                        i3++;
                    }
                }
                super.writeTo(codedOutputByteBufferNano);
            }

            protected int computeSerializedSize() {
                int i;
                int i2;
                int computeSerializedSize = super.computeSerializedSize();
                int i3 = 0;
                if (this.path != null && this.path.length > 0) {
                    i = 0;
                    i2 = i;
                    while (i < this.path.length) {
                        i2 += CodedOutputByteBufferNano.computeInt32SizeNoTag(this.path[i]);
                        i++;
                    }
                    computeSerializedSize = ((computeSerializedSize + i2) + 1) + CodedOutputByteBufferNano.computeRawVarint32Size(i2);
                }
                if (this.span != null && this.span.length > 0) {
                    i = 0;
                    i2 = i;
                    while (i < this.span.length) {
                        i2 += CodedOutputByteBufferNano.computeInt32SizeNoTag(this.span[i]);
                        i++;
                    }
                    computeSerializedSize = ((computeSerializedSize + i2) + 1) + CodedOutputByteBufferNano.computeRawVarint32Size(i2);
                }
                if (!(this.leadingComments == null || this.leadingComments.equals(""))) {
                    computeSerializedSize += CodedOutputByteBufferNano.computeStringSize(3, this.leadingComments);
                }
                if (!(this.trailingComments == null || this.trailingComments.equals(""))) {
                    computeSerializedSize += CodedOutputByteBufferNano.computeStringSize(4, this.trailingComments);
                }
                if (this.leadingDetachedComments == null || this.leadingDetachedComments.length <= 0) {
                    return computeSerializedSize;
                }
                i = 0;
                i2 = i;
                while (i3 < this.leadingDetachedComments.length) {
                    String str = this.leadingDetachedComments[i3];
                    if (str != null) {
                        i2++;
                        i += CodedOutputByteBufferNano.computeStringSizeNoTag(str);
                    }
                    i3++;
                }
                return (computeSerializedSize + i) + (1 * i2);
            }

            public Location mergeFrom(CodedInputByteBufferNano codedInputByteBufferNano) throws IOException {
                while (true) {
                    int readTag = codedInputByteBufferNano.readTag();
                    if (readTag == 0) {
                        return this;
                    }
                    int i;
                    Object obj;
                    int i2;
                    Object obj2;
                    if (readTag == 8) {
                        readTag = WireFormatNano.getRepeatedFieldArrayLength(codedInputByteBufferNano, 8);
                        if (this.path == null) {
                            i = 0;
                        } else {
                            i = this.path.length;
                        }
                        obj = new int[(readTag + i)];
                        if (i != 0) {
                            System.arraycopy(this.path, 0, obj, 0, i);
                        }
                        while (i < obj.length - 1) {
                            obj[i] = codedInputByteBufferNano.readInt32();
                            codedInputByteBufferNano.readTag();
                            i++;
                        }
                        obj[i] = codedInputByteBufferNano.readInt32();
                        this.path = obj;
                    } else if (readTag == 10) {
                        readTag = codedInputByteBufferNano.pushLimit(codedInputByteBufferNano.readRawVarint32());
                        i = codedInputByteBufferNano.getPosition();
                        i2 = 0;
                        while (codedInputByteBufferNano.getBytesUntilLimit() > 0) {
                            codedInputByteBufferNano.readInt32();
                            i2++;
                        }
                        codedInputByteBufferNano.rewindToPosition(i);
                        if (this.path == null) {
                            i = 0;
                        } else {
                            i = this.path.length;
                        }
                        obj2 = new int[(i2 + i)];
                        if (i != 0) {
                            System.arraycopy(this.path, 0, obj2, 0, i);
                        }
                        while (i < obj2.length) {
                            obj2[i] = codedInputByteBufferNano.readInt32();
                            i++;
                        }
                        this.path = obj2;
                        codedInputByteBufferNano.popLimit(readTag);
                    } else if (readTag == 16) {
                        readTag = WireFormatNano.getRepeatedFieldArrayLength(codedInputByteBufferNano, 16);
                        if (this.span == null) {
                            i = 0;
                        } else {
                            i = this.span.length;
                        }
                        obj = new int[(readTag + i)];
                        if (i != 0) {
                            System.arraycopy(this.span, 0, obj, 0, i);
                        }
                        while (i < obj.length - 1) {
                            obj[i] = codedInputByteBufferNano.readInt32();
                            codedInputByteBufferNano.readTag();
                            i++;
                        }
                        obj[i] = codedInputByteBufferNano.readInt32();
                        this.span = obj;
                    } else if (readTag == 18) {
                        readTag = codedInputByteBufferNano.pushLimit(codedInputByteBufferNano.readRawVarint32());
                        i = codedInputByteBufferNano.getPosition();
                        i2 = 0;
                        while (codedInputByteBufferNano.getBytesUntilLimit() > 0) {
                            codedInputByteBufferNano.readInt32();
                            i2++;
                        }
                        codedInputByteBufferNano.rewindToPosition(i);
                        if (this.span == null) {
                            i = 0;
                        } else {
                            i = this.span.length;
                        }
                        obj2 = new int[(i2 + i)];
                        if (i != 0) {
                            System.arraycopy(this.span, 0, obj2, 0, i);
                        }
                        while (i < obj2.length) {
                            obj2[i] = codedInputByteBufferNano.readInt32();
                            i++;
                        }
                        this.span = obj2;
                        codedInputByteBufferNano.popLimit(readTag);
                    } else if (readTag == 26) {
                        this.leadingComments = codedInputByteBufferNano.readString();
                    } else if (readTag == 34) {
                        this.trailingComments = codedInputByteBufferNano.readString();
                    } else if (readTag == 50) {
                        readTag = WireFormatNano.getRepeatedFieldArrayLength(codedInputByteBufferNano, 50);
                        if (this.leadingDetachedComments == null) {
                            i = 0;
                        } else {
                            i = this.leadingDetachedComments.length;
                        }
                        obj = new String[(readTag + i)];
                        if (i != 0) {
                            System.arraycopy(this.leadingDetachedComments, 0, obj, 0, i);
                        }
                        while (i < obj.length - 1) {
                            obj[i] = codedInputByteBufferNano.readString();
                            codedInputByteBufferNano.readTag();
                            i++;
                        }
                        obj[i] = codedInputByteBufferNano.readString();
                        this.leadingDetachedComments = obj;
                    } else if (!super.storeUnknownField(codedInputByteBufferNano, readTag)) {
                        return this;
                    }
                }
            }

            public static Location parseFrom(byte[] bArr) throws InvalidProtocolBufferNanoException {
                return (Location) MessageNano.mergeFrom(new Location(), bArr);
            }

            public static Location parseFrom(CodedInputByteBufferNano codedInputByteBufferNano) throws IOException {
                return new Location().mergeFrom(codedInputByteBufferNano);
            }
        }

        public static SourceCodeInfo[] emptyArray() {
            if (_emptyArray == null) {
                synchronized (InternalNano.LAZY_INIT_LOCK) {
                    if (_emptyArray == null) {
                        _emptyArray = new SourceCodeInfo[0];
                    }
                }
            }
            return _emptyArray;
        }

        public SourceCodeInfo() {
            clear();
        }

        public SourceCodeInfo clear() {
            this.location = Location.emptyArray();
            this.unknownFieldData = null;
            this.cachedSize = -1;
            return this;
        }

        public void writeTo(CodedOutputByteBufferNano codedOutputByteBufferNano) throws IOException {
            if (this.location != null && this.location.length > 0) {
                for (MessageNano messageNano : this.location) {
                    if (messageNano != null) {
                        codedOutputByteBufferNano.writeMessage(1, messageNano);
                    }
                }
            }
            super.writeTo(codedOutputByteBufferNano);
        }

        protected int computeSerializedSize() {
            int computeSerializedSize = super.computeSerializedSize();
            if (this.location != null && this.location.length > 0) {
                for (MessageNano messageNano : this.location) {
                    if (messageNano != null) {
                        computeSerializedSize += CodedOutputByteBufferNano.computeMessageSize(1, messageNano);
                    }
                }
            }
            return computeSerializedSize;
        }

        public SourceCodeInfo mergeFrom(CodedInputByteBufferNano codedInputByteBufferNano) throws IOException {
            while (true) {
                int readTag = codedInputByteBufferNano.readTag();
                if (readTag == 0) {
                    return this;
                }
                if (readTag == 10) {
                    int i;
                    readTag = WireFormatNano.getRepeatedFieldArrayLength(codedInputByteBufferNano, 10);
                    if (this.location == null) {
                        i = 0;
                    } else {
                        i = this.location.length;
                    }
                    Object obj = new Location[(readTag + i)];
                    if (i != 0) {
                        System.arraycopy(this.location, 0, obj, 0, i);
                    }
                    while (i < obj.length - 1) {
                        obj[i] = new Location();
                        codedInputByteBufferNano.readMessage(obj[i]);
                        codedInputByteBufferNano.readTag();
                        i++;
                    }
                    obj[i] = new Location();
                    codedInputByteBufferNano.readMessage(obj[i]);
                    this.location = obj;
                } else if (!super.storeUnknownField(codedInputByteBufferNano, readTag)) {
                    return this;
                }
            }
        }

        public static SourceCodeInfo parseFrom(byte[] bArr) throws InvalidProtocolBufferNanoException {
            return (SourceCodeInfo) MessageNano.mergeFrom(new SourceCodeInfo(), bArr);
        }

        public static SourceCodeInfo parseFrom(CodedInputByteBufferNano codedInputByteBufferNano) throws IOException {
            return new SourceCodeInfo().mergeFrom(codedInputByteBufferNano);
        }
    }

    public static final class StreamDescriptorProto extends ExtendableMessageNano<StreamDescriptorProto> {
        private static volatile StreamDescriptorProto[] _emptyArray;
        public String clientMessageType;
        public String name;
        public StreamOptions options;
        public String serverMessageType;

        public static StreamDescriptorProto[] emptyArray() {
            if (_emptyArray == null) {
                synchronized (InternalNano.LAZY_INIT_LOCK) {
                    if (_emptyArray == null) {
                        _emptyArray = new StreamDescriptorProto[0];
                    }
                }
            }
            return _emptyArray;
        }

        public StreamDescriptorProto() {
            clear();
        }

        public StreamDescriptorProto clear() {
            this.name = "";
            this.clientMessageType = "";
            this.serverMessageType = "";
            this.options = null;
            this.unknownFieldData = null;
            this.cachedSize = -1;
            return this;
        }

        public void writeTo(CodedOutputByteBufferNano codedOutputByteBufferNano) throws IOException {
            if (!(this.name == null || this.name.equals(""))) {
                codedOutputByteBufferNano.writeString(1, this.name);
            }
            if (!(this.clientMessageType == null || this.clientMessageType.equals(""))) {
                codedOutputByteBufferNano.writeString(2, this.clientMessageType);
            }
            if (!(this.serverMessageType == null || this.serverMessageType.equals(""))) {
                codedOutputByteBufferNano.writeString(3, this.serverMessageType);
            }
            if (this.options != null) {
                codedOutputByteBufferNano.writeMessage(4, this.options);
            }
            super.writeTo(codedOutputByteBufferNano);
        }

        protected int computeSerializedSize() {
            int computeSerializedSize = super.computeSerializedSize();
            if (!(this.name == null || this.name.equals(""))) {
                computeSerializedSize += CodedOutputByteBufferNano.computeStringSize(1, this.name);
            }
            if (!(this.clientMessageType == null || this.clientMessageType.equals(""))) {
                computeSerializedSize += CodedOutputByteBufferNano.computeStringSize(2, this.clientMessageType);
            }
            if (!(this.serverMessageType == null || this.serverMessageType.equals(""))) {
                computeSerializedSize += CodedOutputByteBufferNano.computeStringSize(3, this.serverMessageType);
            }
            if (this.options != null) {
                return computeSerializedSize + CodedOutputByteBufferNano.computeMessageSize(4, this.options);
            }
            return computeSerializedSize;
        }

        public StreamDescriptorProto mergeFrom(CodedInputByteBufferNano codedInputByteBufferNano) throws IOException {
            while (true) {
                int readTag = codedInputByteBufferNano.readTag();
                if (readTag == 0) {
                    return this;
                }
                if (readTag == 10) {
                    this.name = codedInputByteBufferNano.readString();
                } else if (readTag == 18) {
                    this.clientMessageType = codedInputByteBufferNano.readString();
                } else if (readTag == 26) {
                    this.serverMessageType = codedInputByteBufferNano.readString();
                } else if (readTag == 34) {
                    if (this.options == null) {
                        this.options = new StreamOptions();
                    }
                    codedInputByteBufferNano.readMessage(this.options);
                } else if (!super.storeUnknownField(codedInputByteBufferNano, readTag)) {
                    return this;
                }
            }
        }

        public static StreamDescriptorProto parseFrom(byte[] bArr) throws InvalidProtocolBufferNanoException {
            return (StreamDescriptorProto) MessageNano.mergeFrom(new StreamDescriptorProto(), bArr);
        }

        public static StreamDescriptorProto parseFrom(CodedInputByteBufferNano codedInputByteBufferNano) throws IOException {
            return new StreamDescriptorProto().mergeFrom(codedInputByteBufferNano);
        }
    }

    public static final class StreamOptions extends ExtendableMessageNano<StreamOptions> {
        private static volatile StreamOptions[] _emptyArray;
        public long clientInitialTokens;
        public int clientLogging;
        public double deadline;
        public boolean deprecated;
        public boolean endUserCredsRequested;
        public boolean failFast;
        @NanoEnumValue(legacy = false, value = LogLevel.class)
        public int logLevel;
        public String securityLabel;
        @NanoEnumValue(legacy = false, value = SecurityLevel.class)
        public int securityLevel;
        public long serverInitialTokens;
        public int serverLogging;
        @NanoEnumValue(legacy = false, value = TokenUnit.class)
        public int tokenUnit;
        public UninterpretedOption[] uninterpretedOption;

        public interface TokenUnit {
            @NanoEnumValue(legacy = false, value = TokenUnit.class)
            public static final int BYTE = 1;
            @NanoEnumValue(legacy = false, value = TokenUnit.class)
            public static final int MESSAGE = 0;
        }

        @NanoEnumValue(legacy = false, value = TokenUnit.class)
        public static int checkTokenUnitOrThrow(int i) {
            if (i >= 0 && i <= 1) {
                return i;
            }
            StringBuilder stringBuilder = new StringBuilder(41);
            stringBuilder.append(i);
            stringBuilder.append(" is not a valid enum TokenUnit");
            throw new IllegalArgumentException(stringBuilder.toString());
        }

        @NanoEnumValue(legacy = false, value = TokenUnit.class)
        public static int[] checkTokenUnitOrThrow(int[] iArr) {
            iArr = (int[]) iArr.clone();
            for (int checkTokenUnitOrThrow : iArr) {
                checkTokenUnitOrThrow(checkTokenUnitOrThrow);
            }
            return iArr;
        }

        public static StreamOptions[] emptyArray() {
            if (_emptyArray == null) {
                synchronized (InternalNano.LAZY_INIT_LOCK) {
                    if (_emptyArray == null) {
                        _emptyArray = new StreamOptions[0];
                    }
                }
            }
            return _emptyArray;
        }

        public StreamOptions() {
            clear();
        }

        public StreamOptions clear() {
            this.clientInitialTokens = -1;
            this.serverInitialTokens = -1;
            this.tokenUnit = 0;
            this.securityLevel = 0;
            this.securityLabel = "";
            this.clientLogging = 256;
            this.serverLogging = 256;
            this.deadline = -1.0d;
            this.failFast = false;
            this.endUserCredsRequested = false;
            this.logLevel = 2;
            this.deprecated = false;
            this.uninterpretedOption = UninterpretedOption.emptyArray();
            this.unknownFieldData = null;
            this.cachedSize = -1;
            return this;
        }

        public void writeTo(CodedOutputByteBufferNano codedOutputByteBufferNano) throws IOException {
            if (this.clientInitialTokens != -1) {
                codedOutputByteBufferNano.writeInt64(1, this.clientInitialTokens);
            }
            if (this.serverInitialTokens != -1) {
                codedOutputByteBufferNano.writeInt64(2, this.serverInitialTokens);
            }
            if (this.tokenUnit != 0) {
                codedOutputByteBufferNano.writeInt32(3, this.tokenUnit);
            }
            if (this.securityLevel != 0) {
                codedOutputByteBufferNano.writeInt32(4, this.securityLevel);
            }
            if (!(this.securityLabel == null || this.securityLabel.equals(""))) {
                codedOutputByteBufferNano.writeString(5, this.securityLabel);
            }
            if (this.clientLogging != 256) {
                codedOutputByteBufferNano.writeInt32(6, this.clientLogging);
            }
            if (this.serverLogging != 256) {
                codedOutputByteBufferNano.writeInt32(7, this.serverLogging);
            }
            if (Double.doubleToLongBits(this.deadline) != Double.doubleToLongBits(-1.0d)) {
                codedOutputByteBufferNano.writeDouble(8, this.deadline);
            }
            if (this.failFast) {
                codedOutputByteBufferNano.writeBool(9, this.failFast);
            }
            if (this.endUserCredsRequested) {
                codedOutputByteBufferNano.writeBool(10, this.endUserCredsRequested);
            }
            if (this.logLevel != 2) {
                codedOutputByteBufferNano.writeInt32(11, this.logLevel);
            }
            if (this.deprecated) {
                codedOutputByteBufferNano.writeBool(33, this.deprecated);
            }
            if (this.uninterpretedOption != null && this.uninterpretedOption.length > 0) {
                for (MessageNano messageNano : this.uninterpretedOption) {
                    if (messageNano != null) {
                        codedOutputByteBufferNano.writeMessage(999, messageNano);
                    }
                }
            }
            super.writeTo(codedOutputByteBufferNano);
        }

        protected int computeSerializedSize() {
            int computeSerializedSize = super.computeSerializedSize();
            if (this.clientInitialTokens != -1) {
                computeSerializedSize += CodedOutputByteBufferNano.computeInt64Size(1, this.clientInitialTokens);
            }
            if (this.serverInitialTokens != -1) {
                computeSerializedSize += CodedOutputByteBufferNano.computeInt64Size(2, this.serverInitialTokens);
            }
            if (this.tokenUnit != 0) {
                computeSerializedSize += CodedOutputByteBufferNano.computeInt32Size(3, this.tokenUnit);
            }
            if (this.securityLevel != 0) {
                computeSerializedSize += CodedOutputByteBufferNano.computeInt32Size(4, this.securityLevel);
            }
            if (!(this.securityLabel == null || this.securityLabel.equals(""))) {
                computeSerializedSize += CodedOutputByteBufferNano.computeStringSize(5, this.securityLabel);
            }
            if (this.clientLogging != 256) {
                computeSerializedSize += CodedOutputByteBufferNano.computeInt32Size(6, this.clientLogging);
            }
            if (this.serverLogging != 256) {
                computeSerializedSize += CodedOutputByteBufferNano.computeInt32Size(7, this.serverLogging);
            }
            if (Double.doubleToLongBits(this.deadline) != Double.doubleToLongBits(-1.0d)) {
                computeSerializedSize += CodedOutputByteBufferNano.computeDoubleSize(8, this.deadline);
            }
            if (this.failFast) {
                computeSerializedSize += CodedOutputByteBufferNano.computeBoolSize(9, this.failFast);
            }
            if (this.endUserCredsRequested) {
                computeSerializedSize += CodedOutputByteBufferNano.computeBoolSize(10, this.endUserCredsRequested);
            }
            if (this.logLevel != 2) {
                computeSerializedSize += CodedOutputByteBufferNano.computeInt32Size(11, this.logLevel);
            }
            if (this.deprecated) {
                computeSerializedSize += CodedOutputByteBufferNano.computeBoolSize(33, this.deprecated);
            }
            if (this.uninterpretedOption != null && this.uninterpretedOption.length > 0) {
                for (MessageNano messageNano : this.uninterpretedOption) {
                    if (messageNano != null) {
                        computeSerializedSize += CodedOutputByteBufferNano.computeMessageSize(999, messageNano);
                    }
                }
            }
            return computeSerializedSize;
        }

        public StreamOptions mergeFrom(CodedInputByteBufferNano codedInputByteBufferNano) throws IOException {
            int position;
            while (true) {
                int readTag = codedInputByteBufferNano.readTag();
                switch (readTag) {
                    case 0:
                        return this;
                    case 8:
                        this.clientInitialTokens = codedInputByteBufferNano.readInt64();
                        break;
                    case 16:
                        this.serverInitialTokens = codedInputByteBufferNano.readInt64();
                        break;
                    case 24:
                        position = codedInputByteBufferNano.getPosition();
                        try {
                            this.tokenUnit = checkTokenUnitOrThrow(codedInputByteBufferNano.readInt32());
                            break;
                        } catch (IllegalArgumentException e) {
                            codedInputByteBufferNano.rewindToPosition(position);
                            storeUnknownField(codedInputByteBufferNano, readTag);
                            break;
                        }
                    case 32:
                        position = codedInputByteBufferNano.getPosition();
                        try {
                            this.securityLevel = MethodOptions.checkSecurityLevelOrThrow(codedInputByteBufferNano.readInt32());
                            break;
                        } catch (IllegalArgumentException e2) {
                            codedInputByteBufferNano.rewindToPosition(position);
                            storeUnknownField(codedInputByteBufferNano, readTag);
                            break;
                        }
                    case 42:
                        this.securityLabel = codedInputByteBufferNano.readString();
                        break;
                    case 48:
                        this.clientLogging = codedInputByteBufferNano.readInt32();
                        break;
                    case 56:
                        this.serverLogging = codedInputByteBufferNano.readInt32();
                        break;
                    case 65:
                        this.deadline = codedInputByteBufferNano.readDouble();
                        break;
                    case 72:
                        this.failFast = codedInputByteBufferNano.readBool();
                        break;
                    case 80:
                        this.endUserCredsRequested = codedInputByteBufferNano.readBool();
                        break;
                    case 88:
                        position = codedInputByteBufferNano.getPosition();
                        try {
                            this.logLevel = MethodOptions.checkLogLevelOrThrow(codedInputByteBufferNano.readInt32());
                            break;
                        } catch (IllegalArgumentException e3) {
                            codedInputByteBufferNano.rewindToPosition(position);
                            storeUnknownField(codedInputByteBufferNano, readTag);
                            break;
                        }
                    case 264:
                        this.deprecated = codedInputByteBufferNano.readBool();
                        break;
                    case 7994:
                        readTag = WireFormatNano.getRepeatedFieldArrayLength(codedInputByteBufferNano, 7994);
                        if (this.uninterpretedOption == null) {
                            position = 0;
                        } else {
                            position = this.uninterpretedOption.length;
                        }
                        Object obj = new UninterpretedOption[(readTag + position)];
                        if (position != 0) {
                            System.arraycopy(this.uninterpretedOption, 0, obj, 0, position);
                        }
                        while (position < obj.length - 1) {
                            obj[position] = new UninterpretedOption();
                            codedInputByteBufferNano.readMessage(obj[position]);
                            codedInputByteBufferNano.readTag();
                            position++;
                        }
                        obj[position] = new UninterpretedOption();
                        codedInputByteBufferNano.readMessage(obj[position]);
                        this.uninterpretedOption = obj;
                        break;
                    default:
                        if (super.storeUnknownField(codedInputByteBufferNano, readTag)) {
                            break;
                        }
                        return this;
                }
            }
        }

        public static StreamOptions parseFrom(byte[] bArr) throws InvalidProtocolBufferNanoException {
            return (StreamOptions) MessageNano.mergeFrom(new StreamOptions(), bArr);
        }

        public static StreamOptions parseFrom(CodedInputByteBufferNano codedInputByteBufferNano) throws IOException {
            return new StreamOptions().mergeFrom(codedInputByteBufferNano);
        }
    }

    public static final class UninterpretedOption extends ExtendableMessageNano<UninterpretedOption> {
        private static volatile UninterpretedOption[] _emptyArray;
        public String aggregateValue;
        public double doubleValue;
        public String identifierValue;
        public NamePart[] name;
        public long negativeIntValue;
        public long positiveIntValue;
        public byte[] stringValue;

        public static final class NamePart extends ExtendableMessageNano<NamePart> {
            private static volatile NamePart[] _emptyArray;
            public boolean isExtension;
            public String namePart;

            public static NamePart[] emptyArray() {
                if (_emptyArray == null) {
                    synchronized (InternalNano.LAZY_INIT_LOCK) {
                        if (_emptyArray == null) {
                            _emptyArray = new NamePart[0];
                        }
                    }
                }
                return _emptyArray;
            }

            public NamePart() {
                clear();
            }

            public NamePart clear() {
                this.namePart = "";
                this.isExtension = false;
                this.unknownFieldData = null;
                this.cachedSize = -1;
                return this;
            }

            public void writeTo(CodedOutputByteBufferNano codedOutputByteBufferNano) throws IOException {
                codedOutputByteBufferNano.writeString(1, this.namePart);
                codedOutputByteBufferNano.writeBool(2, this.isExtension);
                super.writeTo(codedOutputByteBufferNano);
            }

            protected int computeSerializedSize() {
                return (super.computeSerializedSize() + CodedOutputByteBufferNano.computeStringSize(1, this.namePart)) + CodedOutputByteBufferNano.computeBoolSize(2, this.isExtension);
            }

            public NamePart mergeFrom(CodedInputByteBufferNano codedInputByteBufferNano) throws IOException {
                while (true) {
                    int readTag = codedInputByteBufferNano.readTag();
                    if (readTag == 0) {
                        return this;
                    }
                    if (readTag == 10) {
                        this.namePart = codedInputByteBufferNano.readString();
                    } else if (readTag == 16) {
                        this.isExtension = codedInputByteBufferNano.readBool();
                    } else if (!super.storeUnknownField(codedInputByteBufferNano, readTag)) {
                        return this;
                    }
                }
            }

            public static NamePart parseFrom(byte[] bArr) throws InvalidProtocolBufferNanoException {
                return (NamePart) MessageNano.mergeFrom(new NamePart(), bArr);
            }

            public static NamePart parseFrom(CodedInputByteBufferNano codedInputByteBufferNano) throws IOException {
                return new NamePart().mergeFrom(codedInputByteBufferNano);
            }
        }

        public static UninterpretedOption[] emptyArray() {
            if (_emptyArray == null) {
                synchronized (InternalNano.LAZY_INIT_LOCK) {
                    if (_emptyArray == null) {
                        _emptyArray = new UninterpretedOption[0];
                    }
                }
            }
            return _emptyArray;
        }

        public UninterpretedOption() {
            clear();
        }

        public UninterpretedOption clear() {
            this.name = NamePart.emptyArray();
            this.identifierValue = "";
            this.positiveIntValue = 0;
            this.negativeIntValue = 0;
            this.doubleValue = 0.0d;
            this.stringValue = WireFormatNano.EMPTY_BYTES;
            this.aggregateValue = "";
            this.unknownFieldData = null;
            this.cachedSize = -1;
            return this;
        }

        public void writeTo(CodedOutputByteBufferNano codedOutputByteBufferNano) throws IOException {
            if (this.name != null && this.name.length > 0) {
                for (MessageNano messageNano : this.name) {
                    if (messageNano != null) {
                        codedOutputByteBufferNano.writeMessage(2, messageNano);
                    }
                }
            }
            if (!(this.identifierValue == null || this.identifierValue.equals(""))) {
                codedOutputByteBufferNano.writeString(3, this.identifierValue);
            }
            if (this.positiveIntValue != 0) {
                codedOutputByteBufferNano.writeUInt64(4, this.positiveIntValue);
            }
            if (this.negativeIntValue != 0) {
                codedOutputByteBufferNano.writeInt64(5, this.negativeIntValue);
            }
            if (Double.doubleToLongBits(this.doubleValue) != Double.doubleToLongBits(0.0d)) {
                codedOutputByteBufferNano.writeDouble(6, this.doubleValue);
            }
            if (!Arrays.equals(this.stringValue, WireFormatNano.EMPTY_BYTES)) {
                codedOutputByteBufferNano.writeBytes(7, this.stringValue);
            }
            if (!(this.aggregateValue == null || this.aggregateValue.equals(""))) {
                codedOutputByteBufferNano.writeString(8, this.aggregateValue);
            }
            super.writeTo(codedOutputByteBufferNano);
        }

        protected int computeSerializedSize() {
            int computeSerializedSize = super.computeSerializedSize();
            if (this.name != null && this.name.length > 0) {
                for (MessageNano messageNano : this.name) {
                    if (messageNano != null) {
                        computeSerializedSize += CodedOutputByteBufferNano.computeMessageSize(2, messageNano);
                    }
                }
            }
            if (!(this.identifierValue == null || this.identifierValue.equals(""))) {
                computeSerializedSize += CodedOutputByteBufferNano.computeStringSize(3, this.identifierValue);
            }
            if (this.positiveIntValue != 0) {
                computeSerializedSize += CodedOutputByteBufferNano.computeUInt64Size(4, this.positiveIntValue);
            }
            if (this.negativeIntValue != 0) {
                computeSerializedSize += CodedOutputByteBufferNano.computeInt64Size(5, this.negativeIntValue);
            }
            if (Double.doubleToLongBits(this.doubleValue) != Double.doubleToLongBits(0.0d)) {
                computeSerializedSize += CodedOutputByteBufferNano.computeDoubleSize(6, this.doubleValue);
            }
            if (!Arrays.equals(this.stringValue, WireFormatNano.EMPTY_BYTES)) {
                computeSerializedSize += CodedOutputByteBufferNano.computeBytesSize(7, this.stringValue);
            }
            if (this.aggregateValue == null || this.aggregateValue.equals("")) {
                return computeSerializedSize;
            }
            return computeSerializedSize + CodedOutputByteBufferNano.computeStringSize(8, this.aggregateValue);
        }

        public UninterpretedOption mergeFrom(CodedInputByteBufferNano codedInputByteBufferNano) throws IOException {
            while (true) {
                int readTag = codedInputByteBufferNano.readTag();
                if (readTag == 0) {
                    return this;
                }
                if (readTag == 18) {
                    int i;
                    readTag = WireFormatNano.getRepeatedFieldArrayLength(codedInputByteBufferNano, 18);
                    if (this.name == null) {
                        i = 0;
                    } else {
                        i = this.name.length;
                    }
                    Object obj = new NamePart[(readTag + i)];
                    if (i != 0) {
                        System.arraycopy(this.name, 0, obj, 0, i);
                    }
                    while (i < obj.length - 1) {
                        obj[i] = new NamePart();
                        codedInputByteBufferNano.readMessage(obj[i]);
                        codedInputByteBufferNano.readTag();
                        i++;
                    }
                    obj[i] = new NamePart();
                    codedInputByteBufferNano.readMessage(obj[i]);
                    this.name = obj;
                } else if (readTag == 26) {
                    this.identifierValue = codedInputByteBufferNano.readString();
                } else if (readTag == 32) {
                    this.positiveIntValue = codedInputByteBufferNano.readUInt64();
                } else if (readTag == 40) {
                    this.negativeIntValue = codedInputByteBufferNano.readInt64();
                } else if (readTag == 49) {
                    this.doubleValue = codedInputByteBufferNano.readDouble();
                } else if (readTag == 58) {
                    this.stringValue = codedInputByteBufferNano.readBytes();
                } else if (readTag == 66) {
                    this.aggregateValue = codedInputByteBufferNano.readString();
                } else if (!super.storeUnknownField(codedInputByteBufferNano, readTag)) {
                    return this;
                }
            }
        }

        public static UninterpretedOption parseFrom(byte[] bArr) throws InvalidProtocolBufferNanoException {
            return (UninterpretedOption) MessageNano.mergeFrom(new UninterpretedOption(), bArr);
        }

        public static UninterpretedOption parseFrom(CodedInputByteBufferNano codedInputByteBufferNano) throws IOException {
            return new UninterpretedOption().mergeFrom(codedInputByteBufferNano);
        }
    }

    private DescriptorProtos() {
    }
}
