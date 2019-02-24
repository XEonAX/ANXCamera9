package org.jcodec.containers.mp4.boxes;

import java.nio.ByteBuffer;
import org.jcodec.common.io.NIOUtils;

public class DataBox extends Box {
    private static final String FOURCC = "data";
    private byte[] data;
    private int locale;
    private int type;

    public DataBox(Header header) {
        super(header);
    }

    public static DataBox createDataBox(int i, int i2, byte[] bArr) {
        DataBox dataBox = new DataBox(Header.createHeader("data", 0));
        dataBox.type = i;
        dataBox.locale = i2;
        dataBox.data = bArr;
        return dataBox;
    }

    public void parse(ByteBuffer byteBuffer) {
        this.type = byteBuffer.getInt();
        this.locale = byteBuffer.getInt();
        this.data = NIOUtils.toArray(NIOUtils.readBuf(byteBuffer));
    }

    public int getType() {
        return this.type;
    }

    public int getLocale() {
        return this.locale;
    }

    public byte[] getData() {
        return this.data;
    }

    protected void doWrite(ByteBuffer byteBuffer) {
        byteBuffer.putInt(this.type);
        byteBuffer.putInt(this.locale);
        byteBuffer.put(this.data);
    }

    public int estimateSize() {
        return 16 + this.data.length;
    }

    public static String fourcc() {
        return "data";
    }
}
