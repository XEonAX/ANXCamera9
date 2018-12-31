package org.jcodec.containers.mp4.boxes;

import java.nio.ByteBuffer;

public class GenericMediaInfoBox extends FullBox {
    private short bOpColor;
    private short balance;
    private short gOpColor;
    private short graphicsMode;
    private short rOpColor;

    public static String fourcc() {
        return "gmin";
    }

    public static GenericMediaInfoBox createGenericMediaInfoBox() {
        return new GenericMediaInfoBox(new Header(fourcc()));
    }

    public GenericMediaInfoBox(Header header) {
        super(header);
    }

    public void parse(ByteBuffer byteBuffer) {
        super.parse(byteBuffer);
        this.graphicsMode = byteBuffer.getShort();
        this.rOpColor = byteBuffer.getShort();
        this.gOpColor = byteBuffer.getShort();
        this.bOpColor = byteBuffer.getShort();
        this.balance = byteBuffer.getShort();
        byteBuffer.getShort();
    }

    protected void doWrite(ByteBuffer byteBuffer) {
        super.doWrite(byteBuffer);
        byteBuffer.putShort(this.graphicsMode);
        byteBuffer.putShort(this.rOpColor);
        byteBuffer.putShort(this.gOpColor);
        byteBuffer.putShort(this.bOpColor);
        byteBuffer.putShort(this.balance);
        byteBuffer.putShort((short) 0);
    }

    public int estimateSize() {
        return 24;
    }
}
