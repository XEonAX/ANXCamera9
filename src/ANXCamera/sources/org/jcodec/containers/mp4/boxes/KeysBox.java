package org.jcodec.containers.mp4.boxes;

import java.nio.ByteBuffer;
import org.jcodec.containers.mp4.Boxes;

public class KeysBox extends NodeBox {
    private static final String FOURCC = "keys";

    private static class LocalBoxes extends Boxes {
        LocalBoxes() {
            this.mappings.put(MdtaBox.fourcc(), MdtaBox.class);
        }
    }

    public KeysBox(Header header) {
        super(header);
        this.factory = new SimpleBoxFactory(new LocalBoxes());
    }

    public static KeysBox createKeysBox() {
        return new KeysBox(Header.createHeader(FOURCC, 0));
    }

    public void parse(ByteBuffer byteBuffer) {
        byteBuffer.getInt();
        byteBuffer.getInt();
        super.parse(byteBuffer);
    }

    protected void doWrite(ByteBuffer byteBuffer) {
        byteBuffer.putInt(0);
        byteBuffer.putInt(this.boxes.size());
        super.doWrite(byteBuffer);
    }

    public static String fourcc() {
        return FOURCC;
    }

    public int estimateSize() {
        return 8 + super.estimateSize();
    }
}
