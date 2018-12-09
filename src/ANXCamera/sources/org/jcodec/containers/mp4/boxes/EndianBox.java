package org.jcodec.containers.mp4.boxes;

import java.nio.ByteBuffer;
import java.nio.ByteOrder;

public class EndianBox extends Box {
    private ByteOrder endian;

    public static String fourcc() {
        return "enda";
    }

    public static EndianBox createEndianBox(ByteOrder byteOrder) {
        EndianBox endianBox = new EndianBox(new Header(fourcc()));
        endianBox.endian = byteOrder;
        return endianBox;
    }

    public EndianBox(Header header) {
        super(header);
    }

    public void parse(ByteBuffer byteBuffer) {
        if (((long) byteBuffer.getShort()) == 1) {
            this.endian = ByteOrder.LITTLE_ENDIAN;
        } else {
            this.endian = ByteOrder.BIG_ENDIAN;
        }
    }

    protected void doWrite(ByteBuffer byteBuffer) {
        byteBuffer.putShort((short) (this.endian == ByteOrder.LITTLE_ENDIAN ? 1 : 0));
    }

    public int estimateSize() {
        return 10;
    }

    public ByteOrder getEndian() {
        return this.endian;
    }

    protected int calcSize() {
        return 2;
    }
}
