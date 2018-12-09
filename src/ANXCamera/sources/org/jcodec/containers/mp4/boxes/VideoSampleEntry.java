package org.jcodec.containers.mp4.boxes;

import java.nio.ByteBuffer;
import org.jcodec.common.JCodecUtil2;
import org.jcodec.common.io.NIOUtils;
import org.jcodec.common.model.Size;

public class VideoSampleEntry extends SampleEntry {
    private short clrTbl;
    private String compressorName;
    private short depth;
    private short frameCount;
    private float hRes;
    private short height;
    private short revision;
    private int spacialQual;
    private int temporalQual;
    private float vRes;
    private String vendor;
    private short version;
    private short width;

    public static VideoSampleEntry videoSampleEntry(String str, Size size, String str2) {
        return createVideoSampleEntry(new Header(str), (short) 0, (short) 0, "jcod", 0, 768, (short) size.getWidth(), (short) size.getHeight(), 72, 72, (short) 1, str2 != null ? str2 : "org/jcodec", (short) 24, (short) 1, (short) -1);
    }

    public static VideoSampleEntry createVideoSampleEntry(Header header, short s, short s2, String str, int i, int i2, short s3, short s4, long j, long j2, short s5, String str2, short s6, short s7, short s8) {
        VideoSampleEntry videoSampleEntry = new VideoSampleEntry(header);
        videoSampleEntry.drefInd = s7;
        videoSampleEntry.version = s;
        videoSampleEntry.revision = s2;
        videoSampleEntry.vendor = str;
        videoSampleEntry.temporalQual = i;
        videoSampleEntry.spacialQual = i2;
        videoSampleEntry.width = s3;
        videoSampleEntry.height = s4;
        videoSampleEntry.hRes = (float) j;
        videoSampleEntry.vRes = (float) j2;
        videoSampleEntry.frameCount = s5;
        videoSampleEntry.compressorName = str2;
        videoSampleEntry.depth = s6;
        videoSampleEntry.clrTbl = s8;
        return videoSampleEntry;
    }

    public VideoSampleEntry(Header header) {
        super(header);
    }

    public void parse(ByteBuffer byteBuffer) {
        super.parse(byteBuffer);
        this.version = byteBuffer.getShort();
        this.revision = byteBuffer.getShort();
        this.vendor = NIOUtils.readString(byteBuffer, 4);
        this.temporalQual = byteBuffer.getInt();
        this.spacialQual = byteBuffer.getInt();
        this.width = byteBuffer.getShort();
        this.height = byteBuffer.getShort();
        this.hRes = ((float) byteBuffer.getInt()) / 65536.0f;
        this.vRes = ((float) byteBuffer.getInt()) / 65536.0f;
        byteBuffer.getInt();
        this.frameCount = byteBuffer.getShort();
        this.compressorName = NIOUtils.readPascalStringL(byteBuffer, 31);
        this.depth = byteBuffer.getShort();
        this.clrTbl = byteBuffer.getShort();
        parseExtensions(byteBuffer);
    }

    public void doWrite(ByteBuffer byteBuffer) {
        super.doWrite(byteBuffer);
        byteBuffer.putShort(this.version);
        byteBuffer.putShort(this.revision);
        byteBuffer.put(JCodecUtil2.asciiString(this.vendor), 0, 4);
        byteBuffer.putInt(this.temporalQual);
        byteBuffer.putInt(this.spacialQual);
        byteBuffer.putShort(this.width);
        byteBuffer.putShort(this.height);
        byteBuffer.putInt((int) (this.hRes * 65536.0f));
        byteBuffer.putInt((int) (this.vRes * 65536.0f));
        byteBuffer.putInt(0);
        byteBuffer.putShort(this.frameCount);
        NIOUtils.writePascalStringL(byteBuffer, this.compressorName, 31);
        byteBuffer.putShort(this.depth);
        byteBuffer.putShort(this.clrTbl);
        writeExtensions(byteBuffer);
    }

    public int getWidth() {
        return this.width;
    }

    public int getHeight() {
        return this.height;
    }

    public float gethRes() {
        return this.hRes;
    }

    public float getvRes() {
        return this.vRes;
    }

    public long getFrameCount() {
        return (long) this.frameCount;
    }

    public String getCompressorName() {
        return this.compressorName;
    }

    public long getDepth() {
        return (long) this.depth;
    }

    public String getVendor() {
        return this.vendor;
    }

    public short getVersion() {
        return this.version;
    }

    public short getRevision() {
        return this.revision;
    }

    public int getTemporalQual() {
        return this.temporalQual;
    }

    public int getSpacialQual() {
        return this.spacialQual;
    }

    public short getClrTbl() {
        return this.clrTbl;
    }
}
