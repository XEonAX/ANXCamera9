package com.google.protobuf.nano;

import java.io.IOException;
import java.util.Arrays;

final class UnknownFieldData {
    final byte[] bytes;
    final int tag;

    UnknownFieldData(int i, byte[] bArr) {
        this.tag = i;
        this.bytes = bArr;
    }

    int computeSerializedSize() {
        return (0 + CodedOutputByteBufferNano.computeRawVarint32Size(this.tag)) + this.bytes.length;
    }

    void writeTo(CodedOutputByteBufferNano codedOutputByteBufferNano) throws IOException {
        codedOutputByteBufferNano.writeRawVarint32(this.tag);
        codedOutputByteBufferNano.writeRawBytes(this.bytes);
    }

    int computeSerializedSizeAsMessageSet() {
        return CodedOutputByteBufferNano.computeRawMessageSetExtensionSize(this.tag, this.bytes);
    }

    void writeAsMessageSetTo(CodedOutputByteBufferNano codedOutputByteBufferNano) throws IOException {
        codedOutputByteBufferNano.writeRawMessageSetExtension(this.tag, this.bytes);
    }

    public boolean equals(Object obj) {
        boolean z = true;
        if (obj == this) {
            return true;
        }
        if (!(obj instanceof UnknownFieldData)) {
            return false;
        }
        UnknownFieldData unknownFieldData = (UnknownFieldData) obj;
        if (!(this.tag == unknownFieldData.tag && Arrays.equals(this.bytes, unknownFieldData.bytes))) {
            z = false;
        }
        return z;
    }

    public int hashCode() {
        return (31 * (527 + this.tag)) + Arrays.hashCode(this.bytes);
    }
}
