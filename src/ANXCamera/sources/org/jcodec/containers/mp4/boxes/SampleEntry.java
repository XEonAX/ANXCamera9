package org.jcodec.containers.mp4.boxes;

import java.nio.ByteBuffer;

public class SampleEntry extends NodeBox {
    protected short drefInd;

    public SampleEntry(Header header) {
        super(header);
    }

    public void parse(ByteBuffer byteBuffer) {
        byteBuffer.getInt();
        byteBuffer.getShort();
        this.drefInd = byteBuffer.getShort();
    }

    protected void parseExtensions(ByteBuffer byteBuffer) {
        super.parse(byteBuffer);
    }

    protected void doWrite(ByteBuffer byteBuffer) {
        byteBuffer.put(new byte[]{(byte) 0, (byte) 0, (byte) 0, (byte) 0, (byte) 0, (byte) 0});
        byteBuffer.putShort(this.drefInd);
    }

    protected void writeExtensions(ByteBuffer byteBuffer) {
        super.doWrite(byteBuffer);
    }

    public short getDrefInd() {
        return this.drefInd;
    }

    public void setDrefInd(short s) {
        this.drefInd = s;
    }

    public void setMediaType(String str) {
        this.header = new Header(str);
    }

    public int estimateSize() {
        return 8 + super.estimateSize();
    }
}
