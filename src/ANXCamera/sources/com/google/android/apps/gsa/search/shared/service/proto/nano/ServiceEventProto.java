package com.google.android.apps.gsa.search.shared.service.proto.nano;

import com.google.protobuf.nano.CodedInputByteBufferNano;
import com.google.protobuf.nano.CodedOutputByteBufferNano;
import com.google.protobuf.nano.ExtendableMessageNano;
import com.google.protobuf.nano.InternalNano;
import com.google.protobuf.nano.InvalidProtocolBufferNanoException;
import com.google.protobuf.nano.MessageNano;
import java.io.IOException;

public final class ServiceEventProto extends ExtendableMessageNano<ServiceEventProto> implements Cloneable {
    private static volatile ServiceEventProto[] _emptyArray;
    private int bitField0_;
    private int eventId_;

    public static ServiceEventProto[] emptyArray() {
        if (_emptyArray == null) {
            synchronized (InternalNano.LAZY_INIT_LOCK) {
                if (_emptyArray == null) {
                    _emptyArray = new ServiceEventProto[0];
                }
            }
        }
        return _emptyArray;
    }

    public int getEventId() {
        return this.eventId_;
    }

    public boolean hasEventId() {
        return (this.bitField0_ & 1) != 0;
    }

    public ServiceEventProto clearEventId() {
        this.eventId_ = 0;
        this.bitField0_ &= -2;
        return this;
    }

    public ServiceEventProto setEventId(int i) {
        this.bitField0_ |= 1;
        this.eventId_ = i;
        return this;
    }

    public ServiceEventProto() {
        clear();
    }

    public ServiceEventProto clear() {
        this.bitField0_ = 0;
        this.eventId_ = 0;
        this.unknownFieldData = null;
        this.cachedSize = -1;
        return this;
    }

    public ServiceEventProto clone() {
        try {
            return (ServiceEventProto) super.clone();
        } catch (CloneNotSupportedException e) {
            throw new AssertionError(e);
        }
    }

    public void writeTo(CodedOutputByteBufferNano codedOutputByteBufferNano) throws IOException {
        if ((this.bitField0_ & 1) != 0) {
            codedOutputByteBufferNano.writeInt32(1, this.eventId_);
        }
        super.writeTo(codedOutputByteBufferNano);
    }

    protected int computeSerializedSize() {
        int computeSerializedSize = super.computeSerializedSize();
        if ((this.bitField0_ & 1) != 0) {
            return computeSerializedSize + CodedOutputByteBufferNano.computeInt32Size(1, this.eventId_);
        }
        return computeSerializedSize;
    }

    public ServiceEventProto mergeFrom(CodedInputByteBufferNano codedInputByteBufferNano) throws IOException {
        while (true) {
            int readTag = codedInputByteBufferNano.readTag();
            if (readTag == 0) {
                return this;
            }
            if (readTag == 8) {
                this.eventId_ = codedInputByteBufferNano.readInt32();
                this.bitField0_ |= 1;
            } else if (!super.storeUnknownField(codedInputByteBufferNano, readTag)) {
                return this;
            }
        }
    }

    public static ServiceEventProto parseFrom(byte[] bArr) throws InvalidProtocolBufferNanoException {
        return (ServiceEventProto) MessageNano.mergeFrom(new ServiceEventProto(), bArr);
    }

    public static ServiceEventProto parseFrom(CodedInputByteBufferNano codedInputByteBufferNano) throws IOException {
        return new ServiceEventProto().mergeFrom(codedInputByteBufferNano);
    }
}
