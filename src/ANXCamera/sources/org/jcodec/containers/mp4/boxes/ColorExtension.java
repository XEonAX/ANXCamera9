package org.jcodec.containers.mp4.boxes;

import java.nio.ByteBuffer;
import org.jcodec.common.JCodecUtil2;
import org.jcodec.platform.Platform;

public class ColorExtension extends Box {
    static final byte AVCOL_RANGE_JPEG = (byte) 2;
    static final byte AVCOL_RANGE_MPEG = (byte) 1;
    static final byte RANGE_UNSPECIFIED = (byte) 0;
    private Byte colorRange = null;
    private short matrixIndex;
    private short primariesIndex;
    private short transferFunctionIndex;
    private String type = "nclc";

    public ColorExtension(Header header) {
        super(header);
    }

    public void setColorRange(Byte b) {
        this.colorRange = b;
    }

    public void parse(ByteBuffer byteBuffer) {
        byte[] bArr = new byte[4];
        byteBuffer.get(bArr);
        this.type = Platform.stringFromBytes(bArr);
        this.primariesIndex = byteBuffer.getShort();
        this.transferFunctionIndex = byteBuffer.getShort();
        this.matrixIndex = byteBuffer.getShort();
        if (byteBuffer.hasRemaining()) {
            this.colorRange = Byte.valueOf(byteBuffer.get());
        }
    }

    public void doWrite(ByteBuffer byteBuffer) {
        byteBuffer.put(JCodecUtil2.asciiString(this.type));
        byteBuffer.putShort(this.primariesIndex);
        byteBuffer.putShort(this.transferFunctionIndex);
        byteBuffer.putShort(this.matrixIndex);
        if (this.colorRange != null) {
            byteBuffer.put(this.colorRange.byteValue());
        }
    }

    public int estimateSize() {
        return 16;
    }

    public static String fourcc() {
        return "colr";
    }

    public static ColorExtension createColorExtension(short s, short s2, short s3) {
        ColorExtension colorExtension = new ColorExtension(new Header(fourcc()));
        colorExtension.primariesIndex = s;
        colorExtension.transferFunctionIndex = s2;
        colorExtension.matrixIndex = s3;
        return colorExtension;
    }

    public static ColorExtension createColr() {
        return new ColorExtension(new Header(fourcc()));
    }

    public short getPrimariesIndex() {
        return this.primariesIndex;
    }

    public short getTransferFunctionIndex() {
        return this.transferFunctionIndex;
    }

    public short getMatrixIndex() {
        return this.matrixIndex;
    }
}
