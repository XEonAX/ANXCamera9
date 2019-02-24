package org.jcodec.containers.mp4.boxes;

import java.nio.ByteBuffer;

public class CleanApertureExtension extends Box {
    private int apertureHeightDenominator;
    private int apertureHeightNumerator;
    private int apertureWidthDenominator;
    private int apertureWidthNumerator;
    private int horizOffsetDenominator;
    private int horizOffsetNumerator;
    private int vertOffsetDenominator;
    private int vertOffsetNumerator;

    public CleanApertureExtension(Header header) {
        super(header);
    }

    public static CleanApertureExtension createCleanApertureExtension(int i, int i2, int i3, int i4, int i5, int i6, int i7, int i8) {
        CleanApertureExtension cleanApertureExtension = new CleanApertureExtension(new Header(fourcc()));
        cleanApertureExtension.apertureWidthNumerator = i;
        cleanApertureExtension.apertureWidthDenominator = i2;
        cleanApertureExtension.apertureHeightNumerator = i3;
        cleanApertureExtension.apertureHeightDenominator = i4;
        cleanApertureExtension.horizOffsetNumerator = i5;
        cleanApertureExtension.horizOffsetDenominator = i6;
        cleanApertureExtension.vertOffsetNumerator = i7;
        cleanApertureExtension.vertOffsetDenominator = i8;
        return cleanApertureExtension;
    }

    public void parse(ByteBuffer byteBuffer) {
        this.apertureWidthNumerator = byteBuffer.getInt();
        this.apertureWidthDenominator = byteBuffer.getInt();
        this.apertureHeightNumerator = byteBuffer.getInt();
        this.apertureHeightDenominator = byteBuffer.getInt();
        this.horizOffsetNumerator = byteBuffer.getInt();
        this.horizOffsetDenominator = byteBuffer.getInt();
        this.vertOffsetNumerator = byteBuffer.getInt();
        this.vertOffsetDenominator = byteBuffer.getInt();
    }

    public static String fourcc() {
        return "clap";
    }

    public void doWrite(ByteBuffer byteBuffer) {
        byteBuffer.putInt(this.apertureWidthNumerator);
        byteBuffer.putInt(this.apertureWidthDenominator);
        byteBuffer.putInt(this.apertureHeightNumerator);
        byteBuffer.putInt(this.apertureHeightDenominator);
        byteBuffer.putInt(this.horizOffsetNumerator);
        byteBuffer.putInt(this.horizOffsetDenominator);
        byteBuffer.putInt(this.vertOffsetNumerator);
        byteBuffer.putInt(this.vertOffsetDenominator);
    }

    public int estimateSize() {
        return 40;
    }
}
