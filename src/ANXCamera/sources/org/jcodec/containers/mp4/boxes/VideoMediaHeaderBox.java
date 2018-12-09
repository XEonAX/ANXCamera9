package org.jcodec.containers.mp4.boxes;

import java.nio.ByteBuffer;

public class VideoMediaHeaderBox extends FullBox {
    int bOpColor;
    int gOpColor;
    int graphicsMode;
    int rOpColor;

    public static String fourcc() {
        return "vmhd";
    }

    public static VideoMediaHeaderBox createVideoMediaHeaderBox(int i, int i2, int i3, int i4) {
        VideoMediaHeaderBox videoMediaHeaderBox = new VideoMediaHeaderBox(new Header(fourcc()));
        videoMediaHeaderBox.graphicsMode = i;
        videoMediaHeaderBox.rOpColor = i2;
        videoMediaHeaderBox.gOpColor = i3;
        videoMediaHeaderBox.bOpColor = i4;
        return videoMediaHeaderBox;
    }

    public VideoMediaHeaderBox(Header header) {
        super(header);
    }

    public void parse(ByteBuffer byteBuffer) {
        super.parse(byteBuffer);
        this.graphicsMode = byteBuffer.getShort();
        this.rOpColor = byteBuffer.getShort();
        this.gOpColor = byteBuffer.getShort();
        this.bOpColor = byteBuffer.getShort();
    }

    protected void doWrite(ByteBuffer byteBuffer) {
        super.doWrite(byteBuffer);
        byteBuffer.putShort((short) this.graphicsMode);
        byteBuffer.putShort((short) this.rOpColor);
        byteBuffer.putShort((short) this.gOpColor);
        byteBuffer.putShort((short) this.bOpColor);
    }

    public int estimateSize() {
        return 20;
    }

    public int getGraphicsMode() {
        return this.graphicsMode;
    }

    public int getrOpColor() {
        return this.rOpColor;
    }

    public int getgOpColor() {
        return this.gOpColor;
    }

    public int getbOpColor() {
        return this.bOpColor;
    }
}
