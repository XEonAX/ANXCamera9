package org.jcodec.containers.mp4.boxes;

import java.nio.ByteBuffer;

public class TrackExtendsBox extends FullBox {
    private int defaultSampleBytes;
    private int defaultSampleDescriptionIndex;
    private int defaultSampleDuration;
    private int defaultSampleFlags;
    private int trackId;

    public TrackExtendsBox(Header header) {
        super(header);
    }

    public static String fourcc() {
        return "trex";
    }

    public void parse(ByteBuffer byteBuffer) {
        super.parse(byteBuffer);
        this.trackId = byteBuffer.getInt();
        this.defaultSampleDescriptionIndex = byteBuffer.getInt();
        this.defaultSampleDuration = byteBuffer.getInt();
        this.defaultSampleBytes = byteBuffer.getInt();
        this.defaultSampleFlags = byteBuffer.getInt();
    }

    protected void doWrite(ByteBuffer byteBuffer) {
        super.doWrite(byteBuffer);
        byteBuffer.putInt(this.trackId);
        byteBuffer.putInt(this.defaultSampleDescriptionIndex);
        byteBuffer.putInt(this.defaultSampleDuration);
        byteBuffer.putInt(this.defaultSampleBytes);
        byteBuffer.putInt(this.defaultSampleFlags);
    }

    public int estimateSize() {
        return 32;
    }

    public int getTrackId() {
        return this.trackId;
    }

    public void setTrackId(int i) {
        this.trackId = i;
    }

    public int getDefaultSampleDescriptionIndex() {
        return this.defaultSampleDescriptionIndex;
    }

    public void setDefaultSampleDescriptionIndex(int i) {
        this.defaultSampleDescriptionIndex = i;
    }

    public int getDefaultSampleDuration() {
        return this.defaultSampleDuration;
    }

    public void setDefaultSampleDuration(int i) {
        this.defaultSampleDuration = i;
    }

    public int getDefaultSampleBytes() {
        return this.defaultSampleBytes;
    }

    public void setDefaultSampleBytes(int i) {
        this.defaultSampleBytes = i;
    }

    public int getDefaultSampleFlags() {
        return this.defaultSampleFlags;
    }

    public void setDefaultSampleFlags(int i) {
        this.defaultSampleFlags = i;
    }

    public static TrackExtendsBox createTrackExtendsBox() {
        return new TrackExtendsBox(new Header(fourcc()));
    }
}
