package org.jcodec.containers.mp4.boxes;

import java.nio.ByteBuffer;
import org.jcodec.common.io.NIOUtils;

public class TimecodeSampleEntry extends SampleEntry {
    public static final int FLAG_24HOURMAX = 2;
    public static final int FLAG_COUNTER = 8;
    public static final int FLAG_DROPFRAME = 1;
    public static final int FLAG_NEGATIVETIMEOK = 4;
    private static final String TMCD = "tmcd";
    private int flags;
    private int frameDuration;
    private byte numFrames;
    private int timescale;

    public static TimecodeSampleEntry createTimecodeSampleEntry(int i, int i2, int i3, int i4) {
        TimecodeSampleEntry timecodeSampleEntry = new TimecodeSampleEntry(new Header(TMCD));
        timecodeSampleEntry.flags = i;
        timecodeSampleEntry.timescale = i2;
        timecodeSampleEntry.frameDuration = i3;
        timecodeSampleEntry.numFrames = (byte) i4;
        return timecodeSampleEntry;
    }

    public TimecodeSampleEntry(Header header) {
        super(header);
    }

    public void parse(ByteBuffer byteBuffer) {
        super.parse(byteBuffer);
        NIOUtils.skip(byteBuffer, 4);
        this.flags = byteBuffer.getInt();
        this.timescale = byteBuffer.getInt();
        this.frameDuration = byteBuffer.getInt();
        this.numFrames = byteBuffer.get();
        NIOUtils.skip(byteBuffer, 1);
    }

    protected void doWrite(ByteBuffer byteBuffer) {
        super.doWrite(byteBuffer);
        byteBuffer.putInt(0);
        byteBuffer.putInt(this.flags);
        byteBuffer.putInt(this.timescale);
        byteBuffer.putInt(this.frameDuration);
        byteBuffer.put(this.numFrames);
        byteBuffer.put((byte) -49);
    }

    public int getFlags() {
        return this.flags;
    }

    public int getTimescale() {
        return this.timescale;
    }

    public int getFrameDuration() {
        return this.frameDuration;
    }

    public byte getNumFrames() {
        return this.numFrames;
    }

    public boolean isDropFrame() {
        return (this.flags & 1) != 0;
    }
}
