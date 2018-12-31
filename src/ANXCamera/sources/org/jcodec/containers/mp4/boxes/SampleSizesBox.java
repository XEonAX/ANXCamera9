package org.jcodec.containers.mp4.boxes;

import java.nio.ByteBuffer;

public class SampleSizesBox extends FullBox {
    private int count;
    private int defaultSize;
    private int[] sizes;

    public SampleSizesBox(Header header) {
        super(header);
    }

    public static String fourcc() {
        return "stsz";
    }

    public static SampleSizesBox createSampleSizesBox(int i, int i2) {
        SampleSizesBox sampleSizesBox = new SampleSizesBox(new Header(fourcc()));
        sampleSizesBox.defaultSize = i;
        sampleSizesBox.count = i2;
        return sampleSizesBox;
    }

    public static SampleSizesBox createSampleSizesBox2(int[] iArr) {
        SampleSizesBox sampleSizesBox = new SampleSizesBox(new Header(fourcc()));
        sampleSizesBox.sizes = iArr;
        sampleSizesBox.count = iArr.length;
        return sampleSizesBox;
    }

    public void parse(ByteBuffer byteBuffer) {
        super.parse(byteBuffer);
        this.defaultSize = byteBuffer.getInt();
        this.count = byteBuffer.getInt();
        if (this.defaultSize == 0) {
            this.sizes = new int[this.count];
            for (int i = 0; i < this.count; i++) {
                this.sizes[i] = byteBuffer.getInt();
            }
        }
    }

    public int getDefaultSize() {
        return this.defaultSize;
    }

    public int[] getSizes() {
        return this.sizes;
    }

    public int getCount() {
        return this.count;
    }

    public void setCount(int i) {
        this.count = i;
    }

    public void doWrite(ByteBuffer byteBuffer) {
        super.doWrite(byteBuffer);
        byteBuffer.putInt(this.defaultSize);
        if (this.defaultSize == 0) {
            byteBuffer.putInt(this.count);
            for (int i : this.sizes) {
                byteBuffer.putInt((int) ((long) i));
            }
            return;
        }
        byteBuffer.putInt(this.count);
    }

    public int estimateSize() {
        return (this.defaultSize == 0 ? this.sizes.length * 4 : 0) + 20;
    }

    public void setSizes(int[] iArr) {
        this.sizes = iArr;
        this.count = iArr.length;
    }
}
