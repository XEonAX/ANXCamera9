package org.jcodec.containers.mp4.boxes;

import java.nio.ByteBuffer;

public class FielExtension extends Box {
    private int order;
    private int type;

    public FielExtension(Header header) {
        super(header);
    }

    public static String fourcc() {
        return "fiel";
    }

    public boolean isInterlaced() {
        return this.type == 2;
    }

    public boolean topFieldFirst() {
        return this.order == 1 || this.order == 6;
    }

    public String getOrderInterpretation() {
        if (isInterlaced()) {
            int i = this.order;
            if (i == 1) {
                return "top";
            }
            if (i == 6) {
                return "bottom";
            }
            if (i == 9) {
                return "bottomtop";
            }
            if (i == 14) {
                return "topbottom";
            }
        }
        return "";
    }

    public void parse(ByteBuffer byteBuffer) {
        this.type = byteBuffer.get() & 255;
        if (isInterlaced()) {
            this.order = byteBuffer.get() & 255;
        }
    }

    public void doWrite(ByteBuffer byteBuffer) {
        byteBuffer.put((byte) this.type);
        byteBuffer.put((byte) this.order);
    }

    public int estimateSize() {
        return 10;
    }
}
