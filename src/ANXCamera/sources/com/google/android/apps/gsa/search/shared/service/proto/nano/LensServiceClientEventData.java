package com.google.android.apps.gsa.search.shared.service.proto.nano;

import com.google.protobuf.nano.CodedInputByteBufferNano;
import com.google.protobuf.nano.CodedOutputByteBufferNano;
import com.google.protobuf.nano.ExtendableMessageNano;
import com.google.protobuf.nano.InternalNano;
import com.google.protobuf.nano.InvalidProtocolBufferNanoException;
import com.google.protobuf.nano.MessageNano;
import java.io.IOException;

public final class LensServiceClientEventData extends ExtendableMessageNano<LensServiceClientEventData> implements Cloneable {
    private static volatile LensServiceClientEventData[] _emptyArray;
    private int bitField0_;
    private int targetServiceApiVersion_;

    public static LensServiceClientEventData[] emptyArray() {
        if (_emptyArray == null) {
            synchronized (InternalNano.LAZY_INIT_LOCK) {
                if (_emptyArray == null) {
                    _emptyArray = new LensServiceClientEventData[0];
                }
            }
        }
        return _emptyArray;
    }

    public int getTargetServiceApiVersion() {
        return this.targetServiceApiVersion_;
    }

    public boolean hasTargetServiceApiVersion() {
        return (this.bitField0_ & 1) != 0;
    }

    public LensServiceClientEventData clearTargetServiceApiVersion() {
        this.targetServiceApiVersion_ = 0;
        this.bitField0_ &= -2;
        return this;
    }

    public LensServiceClientEventData setTargetServiceApiVersion(int i) {
        this.bitField0_ |= 1;
        this.targetServiceApiVersion_ = i;
        return this;
    }

    public LensServiceClientEventData() {
        clear();
    }

    public LensServiceClientEventData clear() {
        this.bitField0_ = 0;
        this.targetServiceApiVersion_ = 0;
        this.unknownFieldData = null;
        this.cachedSize = -1;
        return this;
    }

    public LensServiceClientEventData clone() {
        try {
            return (LensServiceClientEventData) super.clone();
        } catch (CloneNotSupportedException e) {
            throw new AssertionError(e);
        }
    }

    public void writeTo(CodedOutputByteBufferNano codedOutputByteBufferNano) throws IOException {
        if ((this.bitField0_ & 1) != 0) {
            codedOutputByteBufferNano.writeInt32(1, this.targetServiceApiVersion_);
        }
        super.writeTo(codedOutputByteBufferNano);
    }

    protected int computeSerializedSize() {
        int computeSerializedSize = super.computeSerializedSize();
        if ((this.bitField0_ & 1) != 0) {
            return computeSerializedSize + CodedOutputByteBufferNano.computeInt32Size(1, this.targetServiceApiVersion_);
        }
        return computeSerializedSize;
    }

    public LensServiceClientEventData mergeFrom(CodedInputByteBufferNano codedInputByteBufferNano) throws IOException {
        while (true) {
            int readTag = codedInputByteBufferNano.readTag();
            if (readTag == 0) {
                return this;
            }
            if (readTag == 8) {
                this.targetServiceApiVersion_ = codedInputByteBufferNano.readInt32();
                this.bitField0_ |= 1;
            } else if (!super.storeUnknownField(codedInputByteBufferNano, readTag)) {
                return this;
            }
        }
    }

    public static LensServiceClientEventData parseFrom(byte[] bArr) throws InvalidProtocolBufferNanoException {
        return (LensServiceClientEventData) MessageNano.mergeFrom(new LensServiceClientEventData(), bArr);
    }

    public static LensServiceClientEventData parseFrom(CodedInputByteBufferNano codedInputByteBufferNano) throws IOException {
        return new LensServiceClientEventData().mergeFrom(codedInputByteBufferNano);
    }
}
