package org.jcodec.containers.mp4.boxes;

import java.nio.ByteBuffer;

public class DataRefBox extends NodeBox {
    public static String fourcc() {
        return "dref";
    }

    public static DataRefBox createDataRefBox() {
        return new DataRefBox(new Header(fourcc()));
    }

    public DataRefBox(Header header) {
        super(header);
    }

    public void parse(ByteBuffer byteBuffer) {
        byteBuffer.getInt();
        byteBuffer.getInt();
        super.parse(byteBuffer);
    }

    public void doWrite(ByteBuffer byteBuffer) {
        byteBuffer.putInt(0);
        byteBuffer.putInt(this.boxes.size());
        super.doWrite(byteBuffer);
    }

    public int estimateSize() {
        return 8 + super.estimateSize();
    }
}
