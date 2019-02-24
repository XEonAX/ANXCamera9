package org.jcodec.containers.mp4.boxes;

import java.nio.ByteBuffer;

public class GamaExtension extends Box {
    private float gamma;

    public static GamaExtension createGamaExtension(float f) {
        GamaExtension gamaExtension = new GamaExtension(new Header(fourcc()));
        gamaExtension.gamma = f;
        return gamaExtension;
    }

    public GamaExtension(Header header) {
        super(header);
    }

    public void parse(ByteBuffer byteBuffer) {
        this.gamma = ((float) byteBuffer.getInt()) / 65536.0f;
    }

    protected void doWrite(ByteBuffer byteBuffer) {
        byteBuffer.putInt((int) (this.gamma * 65536.0f));
    }

    public float getGamma() {
        return this.gamma;
    }

    public static String fourcc() {
        return "gama";
    }

    public int estimateSize() {
        return 12;
    }
}
