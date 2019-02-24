package org.jcodec.containers.mp4.boxes;

import java.nio.ByteBuffer;
import org.jcodec.common.io.NIOUtils;

public class TimecodeMediaInfoBox extends FullBox {
    private short[] bgcolor = new short[3];
    private short[] color = new short[3];
    private short face;
    private short font;
    private String name;
    private short size;

    public static String fourcc() {
        return "tcmi";
    }

    public static TimecodeMediaInfoBox createTimecodeMediaInfoBox(short s, short s2, short s3, short[] sArr, short[] sArr2, String str) {
        TimecodeMediaInfoBox timecodeMediaInfoBox = new TimecodeMediaInfoBox(new Header(fourcc()));
        timecodeMediaInfoBox.font = s;
        timecodeMediaInfoBox.face = s2;
        timecodeMediaInfoBox.size = s3;
        timecodeMediaInfoBox.color = sArr;
        timecodeMediaInfoBox.bgcolor = sArr2;
        timecodeMediaInfoBox.name = str;
        return timecodeMediaInfoBox;
    }

    public TimecodeMediaInfoBox(Header header) {
        super(header);
    }

    public void parse(ByteBuffer byteBuffer) {
        super.parse(byteBuffer);
        this.font = byteBuffer.getShort();
        this.face = byteBuffer.getShort();
        this.size = byteBuffer.getShort();
        byteBuffer.getShort();
        this.color[0] = byteBuffer.getShort();
        this.color[1] = byteBuffer.getShort();
        this.color[2] = byteBuffer.getShort();
        this.bgcolor[0] = byteBuffer.getShort();
        this.bgcolor[1] = byteBuffer.getShort();
        this.bgcolor[2] = byteBuffer.getShort();
        this.name = NIOUtils.readPascalString(byteBuffer);
    }

    protected void doWrite(ByteBuffer byteBuffer) {
        super.doWrite(byteBuffer);
        byteBuffer.putShort(this.font);
        byteBuffer.putShort(this.face);
        byteBuffer.putShort(this.size);
        byteBuffer.putShort((short) 0);
        byteBuffer.putShort(this.color[0]);
        byteBuffer.putShort(this.color[1]);
        byteBuffer.putShort(this.color[2]);
        byteBuffer.putShort(this.bgcolor[0]);
        byteBuffer.putShort(this.bgcolor[1]);
        byteBuffer.putShort(this.bgcolor[2]);
        NIOUtils.writePascalString(byteBuffer, this.name);
    }

    public int estimateSize() {
        return 33 + NIOUtils.asciiString(this.name).length;
    }
}
