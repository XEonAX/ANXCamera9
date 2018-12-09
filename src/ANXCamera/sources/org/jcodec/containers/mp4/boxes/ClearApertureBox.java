package org.jcodec.containers.mp4.boxes;

import java.nio.ByteBuffer;

public class ClearApertureBox extends FullBox {
    public static final String CLEF = "clef";
    protected float height;
    protected float width;

    public static ClearApertureBox createClearApertureBox(int i, int i2) {
        ClearApertureBox clearApertureBox = new ClearApertureBox(new Header(CLEF));
        clearApertureBox.width = (float) i;
        clearApertureBox.height = (float) i2;
        return clearApertureBox;
    }

    public ClearApertureBox(Header header) {
        super(header);
    }

    public void parse(ByteBuffer byteBuffer) {
        super.parse(byteBuffer);
        this.width = ((float) byteBuffer.getInt()) / 65536.0f;
        this.height = ((float) byteBuffer.getInt()) / 65536.0f;
    }

    protected void doWrite(ByteBuffer byteBuffer) {
        super.doWrite(byteBuffer);
        byteBuffer.putInt((int) (this.width * 65536.0f));
        byteBuffer.putInt((int) (this.height * 65536.0f));
    }

    public int estimateSize() {
        return 20;
    }

    public float getWidth() {
        return this.width;
    }

    public float getHeight() {
        return this.height;
    }
}
