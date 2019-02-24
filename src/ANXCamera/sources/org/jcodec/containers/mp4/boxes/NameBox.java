package org.jcodec.containers.mp4.boxes;

import java.nio.ByteBuffer;
import org.jcodec.common.JCodecUtil2;
import org.jcodec.common.io.NIOUtils;

public class NameBox extends Box {
    private String name;

    public static String fourcc() {
        return "name";
    }

    public static NameBox createNameBox(String str) {
        NameBox nameBox = new NameBox(new Header(fourcc()));
        nameBox.name = str;
        return nameBox;
    }

    public NameBox(Header header) {
        super(header);
    }

    public void parse(ByteBuffer byteBuffer) {
        this.name = NIOUtils.readNullTermString(byteBuffer);
    }

    protected void doWrite(ByteBuffer byteBuffer) {
        byteBuffer.put(JCodecUtil2.asciiString(this.name));
        byteBuffer.putInt(0);
    }

    public int estimateSize() {
        return 12 + JCodecUtil2.asciiString(this.name).length;
    }

    public String getName() {
        return this.name;
    }
}
