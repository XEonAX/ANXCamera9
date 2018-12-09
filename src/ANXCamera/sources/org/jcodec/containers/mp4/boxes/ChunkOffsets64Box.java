package org.jcodec.containers.mp4.boxes;

import java.nio.ByteBuffer;

public class ChunkOffsets64Box extends FullBox {
    private long[] chunkOffsets;

    public static String fourcc() {
        return "co64";
    }

    public static ChunkOffsets64Box createChunkOffsets64Box(long[] jArr) {
        ChunkOffsets64Box chunkOffsets64Box = new ChunkOffsets64Box(Header.createHeader(fourcc(), 0));
        chunkOffsets64Box.chunkOffsets = jArr;
        return chunkOffsets64Box;
    }

    public ChunkOffsets64Box(Header header) {
        super(header);
    }

    public void parse(ByteBuffer byteBuffer) {
        super.parse(byteBuffer);
        int i = byteBuffer.getInt();
        this.chunkOffsets = new long[i];
        for (int i2 = 0; i2 < i; i2++) {
            this.chunkOffsets[i2] = byteBuffer.getLong();
        }
    }

    protected void doWrite(ByteBuffer byteBuffer) {
        super.doWrite(byteBuffer);
        byteBuffer.putInt(this.chunkOffsets.length);
        for (long putLong : this.chunkOffsets) {
            byteBuffer.putLong(putLong);
        }
    }

    public int estimateSize() {
        return 16 + (this.chunkOffsets.length * 8);
    }

    public long[] getChunkOffsets() {
        return this.chunkOffsets;
    }

    public void setChunkOffsets(long[] jArr) {
        this.chunkOffsets = jArr;
    }
}
