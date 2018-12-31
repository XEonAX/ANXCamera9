package org.jcodec.containers.mp4.boxes;

import java.io.ByteArrayOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.nio.ByteBuffer;
import org.jcodec.common.JCodecUtil2;
import org.jcodec.common.io.NIOUtils;
import org.jcodec.common.io.SeekableByteChannel;
import org.jcodec.common.io.StringReader;
import org.jcodec.platform.Platform;

public class Header {
    public static final byte[] FOURCC_FREE = new byte[]{(byte) 102, (byte) 114, (byte) 101, (byte) 101};
    private static final long MAX_UNSIGNED_INT = 4294967296L;
    private String fourcc;
    private boolean lng;
    private long size;

    public Header(String str) {
        this.fourcc = str;
    }

    public static Header createHeader(String str, long j) {
        Header header = new Header(str);
        header.size = j;
        return header;
    }

    public static Header newHeader(String str, long j, boolean z) {
        Header header = new Header(str);
        header.size = j;
        header.lng = z;
        return header;
    }

    public static Header read(ByteBuffer byteBuffer) {
        long j = 0;
        while (byteBuffer.remaining() >= 4) {
            j = Platform.unsignedInt(byteBuffer.getInt());
            if (j != 0) {
                break;
            }
        }
        if (byteBuffer.remaining() < 4 || (j < 8 && j != 1)) {
            return null;
        }
        String readString = NIOUtils.readString(byteBuffer, 4);
        boolean z = false;
        if (j == 1) {
            if (byteBuffer.remaining() < 8) {
                return null;
            }
            z = true;
            j = byteBuffer.getLong();
        }
        return newHeader(readString, j, z);
    }

    public void skip(InputStream inputStream) throws IOException {
        StringReader.sureSkip(inputStream, this.size - headerSize());
    }

    public long headerSize() {
        return (this.lng || this.size > MAX_UNSIGNED_INT) ? 16 : 8;
    }

    public static int estimateHeaderSize(int i) {
        return ((long) (i + 8)) > MAX_UNSIGNED_INT ? 16 : 8;
    }

    public byte[] readContents(InputStream inputStream) throws IOException {
        ByteArrayOutputStream byteArrayOutputStream = new ByteArrayOutputStream();
        for (int i = 0; ((long) i) < this.size - headerSize(); i++) {
            byteArrayOutputStream.write(inputStream.read());
        }
        return byteArrayOutputStream.toByteArray();
    }

    public String getFourcc() {
        return this.fourcc;
    }

    public long getBodySize() {
        return this.size - headerSize();
    }

    public void setBodySize(int i) {
        this.size = ((long) i) + headerSize();
    }

    public void write(ByteBuffer byteBuffer) {
        if (this.size > MAX_UNSIGNED_INT) {
            byteBuffer.putInt(1);
        } else {
            byteBuffer.putInt((int) this.size);
        }
        byte[] asciiString = JCodecUtil2.asciiString(this.fourcc);
        if (asciiString == null || asciiString.length != 4) {
            byteBuffer.put(FOURCC_FREE);
        } else {
            byteBuffer.put(asciiString);
        }
        if (this.size > MAX_UNSIGNED_INT) {
            byteBuffer.putLong(this.size);
        }
    }

    public void writeChannel(SeekableByteChannel seekableByteChannel) throws IOException {
        ByteBuffer allocate = ByteBuffer.allocate(16);
        write(allocate);
        allocate.flip();
        seekableByteChannel.write(allocate);
    }

    public long getSize() {
        return this.size;
    }

    public int hashCode() {
        return 31 + (this.fourcc == null ? 0 : this.fourcc.hashCode());
    }

    public boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (obj == null || getClass() != obj.getClass()) {
            return false;
        }
        Header header = (Header) obj;
        if (this.fourcc == null) {
            if (header.fourcc != null) {
                return false;
            }
        } else if (!this.fourcc.equals(header.fourcc)) {
            return false;
        }
        return true;
    }
}
