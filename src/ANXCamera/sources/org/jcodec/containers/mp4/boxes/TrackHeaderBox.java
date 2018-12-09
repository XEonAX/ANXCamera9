package org.jcodec.containers.mp4.boxes;

import java.nio.ByteBuffer;
import org.jcodec.containers.mp4.TimeUtil;

public class TrackHeaderBox extends FullBox {
    private long altGroup;
    private long created;
    private long duration;
    private float height;
    private short layer;
    private int[] matrix;
    private long modified;
    private int trackId;
    private float volume;
    private float width;

    public static String fourcc() {
        return "tkhd";
    }

    public static TrackHeaderBox createTrackHeaderBox(int i, long j, float f, float f2, long j2, long j3, float f3, short s, long j4, int[] iArr) {
        TrackHeaderBox trackHeaderBox = new TrackHeaderBox(new Header(fourcc()));
        trackHeaderBox.trackId = i;
        trackHeaderBox.duration = j;
        trackHeaderBox.width = f;
        trackHeaderBox.height = f2;
        trackHeaderBox.created = j2;
        trackHeaderBox.modified = j3;
        trackHeaderBox.volume = f3;
        trackHeaderBox.layer = s;
        trackHeaderBox.altGroup = j4;
        trackHeaderBox.matrix = iArr;
        return trackHeaderBox;
    }

    public TrackHeaderBox(Header header) {
        super(header);
    }

    public void parse(ByteBuffer byteBuffer) {
        super.parse(byteBuffer);
        if (this.version == (byte) 0) {
            this.created = TimeUtil.fromMovTime(byteBuffer.getInt());
            this.modified = TimeUtil.fromMovTime(byteBuffer.getInt());
        } else {
            this.created = TimeUtil.fromMovTime((int) byteBuffer.getLong());
            this.modified = TimeUtil.fromMovTime((int) byteBuffer.getLong());
        }
        this.trackId = byteBuffer.getInt();
        byteBuffer.getInt();
        if (this.version == (byte) 0) {
            this.duration = (long) byteBuffer.getInt();
        } else {
            this.duration = byteBuffer.getLong();
        }
        byteBuffer.getInt();
        byteBuffer.getInt();
        this.layer = byteBuffer.getShort();
        this.altGroup = (long) byteBuffer.getShort();
        this.volume = readVolume(byteBuffer);
        byteBuffer.getShort();
        readMatrix(byteBuffer);
        this.width = ((float) byteBuffer.getInt()) / 65536.0f;
        this.height = ((float) byteBuffer.getInt()) / 65536.0f;
    }

    private void readMatrix(ByteBuffer byteBuffer) {
        this.matrix = new int[9];
        for (int i = 0; i < 9; i++) {
            this.matrix[i] = byteBuffer.getInt() / 65536;
        }
    }

    private float readVolume(ByteBuffer byteBuffer) {
        return (float) (((double) byteBuffer.getShort()) / 256.0d);
    }

    public int getNo() {
        return this.trackId;
    }

    public long getDuration() {
        return this.duration;
    }

    public float getWidth() {
        return this.width;
    }

    public float getHeight() {
        return this.height;
    }

    public void doWrite(ByteBuffer byteBuffer) {
        super.doWrite(byteBuffer);
        byteBuffer.putInt(TimeUtil.toMovTime(this.created));
        byteBuffer.putInt(TimeUtil.toMovTime(this.modified));
        byteBuffer.putInt(this.trackId);
        byteBuffer.putInt(0);
        byteBuffer.putInt((int) this.duration);
        byteBuffer.putInt(0);
        byteBuffer.putInt(0);
        byteBuffer.putShort(this.layer);
        byteBuffer.putShort((short) ((int) this.altGroup));
        writeVolume(byteBuffer);
        byteBuffer.putShort((short) 0);
        writeMatrix(byteBuffer);
        byteBuffer.putInt((int) (this.width * 65536.0f));
        byteBuffer.putInt((int) (this.height * 65536.0f));
    }

    public int estimateSize() {
        return 92;
    }

    private void writeMatrix(ByteBuffer byteBuffer) {
        for (int i = 0; i < 9; i++) {
            byteBuffer.putInt(this.matrix[i] * 65536);
        }
    }

    private void writeVolume(ByteBuffer byteBuffer) {
        byteBuffer.putShort((short) ((int) (((double) this.volume) * 256.0d)));
    }

    public int getTrackId() {
        return this.trackId;
    }

    public long getCreated() {
        return this.created;
    }

    public long getModified() {
        return this.modified;
    }

    public float getVolume() {
        return this.volume;
    }

    public short getLayer() {
        return this.layer;
    }

    public long getAltGroup() {
        return this.altGroup;
    }

    public int[] getMatrix() {
        return this.matrix;
    }

    public void setWidth(float f) {
        this.width = f;
    }

    public void setHeight(float f) {
        this.height = f;
    }

    public void setDuration(long j) {
        this.duration = j;
    }

    public void setNo(int i) {
        this.trackId = i;
    }

    public boolean isOrientation0() {
        return this.matrix != null && this.matrix[0] == 1 && this.matrix[4] == 1;
    }

    public boolean isOrientation90() {
        return this.matrix != null && this.matrix[1] == 1 && this.matrix[3] == -1;
    }

    public boolean isOrientation180() {
        return this.matrix != null && this.matrix[0] == -1 && this.matrix[4] == -1;
    }

    public boolean isOrientation270() {
        return this.matrix != null && this.matrix[1] == -1 && this.matrix[3] == 1;
    }
}
