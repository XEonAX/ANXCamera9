package org.jcodec.codecs.h264.mp4;

import java.nio.ByteBuffer;
import java.util.ArrayList;
import java.util.List;
import org.jcodec.common.Preconditions;
import org.jcodec.common.io.NIOUtils;
import org.jcodec.containers.mp4.boxes.Box;
import org.jcodec.containers.mp4.boxes.Header;

public class AvcCBox extends Box {
    private int level;
    private int nalLengthSize;
    private List<ByteBuffer> ppsList = new ArrayList();
    private int profile;
    private int profileCompat;
    private List<ByteBuffer> spsList = new ArrayList();

    public AvcCBox(Header header) {
        super(header);
    }

    public static String fourcc() {
        return "avcC";
    }

    public void parse(ByteBuffer byteBuffer) {
        int i;
        short s;
        NIOUtils.skip(byteBuffer, 1);
        this.profile = byteBuffer.get() & 255;
        this.profileCompat = byteBuffer.get() & 255;
        this.level = byteBuffer.get() & 255;
        this.nalLengthSize = ((byteBuffer.get() & 255) & 3) + 1;
        int i2 = byteBuffer.get() & 31;
        for (i = 0; i < i2; i++) {
            s = byteBuffer.getShort();
            Preconditions.checkState(39 == (byteBuffer.get() & 63));
            this.spsList.add(NIOUtils.read(byteBuffer, s - 1));
        }
        i2 = byteBuffer.get() & 255;
        for (i = 0; i < i2; i++) {
            s = byteBuffer.getShort();
            Preconditions.checkState(40 == (byteBuffer.get() & 63));
            this.ppsList.add(NIOUtils.read(byteBuffer, s - 1));
        }
    }

    public void doWrite(ByteBuffer byteBuffer) {
        byteBuffer.put((byte) 1);
        byteBuffer.put((byte) this.profile);
        byteBuffer.put((byte) this.profileCompat);
        byteBuffer.put((byte) this.level);
        byteBuffer.put((byte) -1);
        byteBuffer.put((byte) (this.spsList.size() | 224));
        for (ByteBuffer byteBuffer2 : this.spsList) {
            byteBuffer.putShort((short) (byteBuffer2.remaining() + 1));
            byteBuffer.put((byte) 103);
            NIOUtils.write(byteBuffer, byteBuffer2);
        }
        byteBuffer.put((byte) this.ppsList.size());
        for (ByteBuffer byteBuffer22 : this.ppsList) {
            byteBuffer.putShort((short) ((byte) (byteBuffer22.remaining() + 1)));
            byteBuffer.put((byte) 104);
            NIOUtils.write(byteBuffer, byteBuffer22);
        }
    }

    public int estimateSize() {
        int i = 17;
        for (ByteBuffer remaining : this.spsList) {
            i += 3 + remaining.remaining();
        }
        for (ByteBuffer remaining2 : this.ppsList) {
            i += remaining2.remaining() + 3;
        }
        return i;
    }
}
