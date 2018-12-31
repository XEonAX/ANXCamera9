package org.jcodec.containers.mp4.boxes;

import java.nio.ByteBuffer;
import org.jcodec.platform.Platform;

public class ChunkOffsetsBox extends FullBox {
    private long[] chunkOffsets;

    public ChunkOffsetsBox(Header header) {
        super(header);
    }

    public static String fourcc() {
        return "stco";
    }

    public static ChunkOffsetsBox createChunkOffsetsBox(long[] jArr) {
        ChunkOffsetsBox chunkOffsetsBox = new ChunkOffsetsBox(new Header(fourcc()));
        chunkOffsetsBox.chunkOffsets = jArr;
        return chunkOffsetsBox;
    }

    public void parse(ByteBuffer byteBuffer) {
        super.parse(byteBuffer);
        int i = byteBuffer.getInt();
        this.chunkOffsets = new long[i];
        for (int i2 = 0; i2 < i; i2++) {
            this.chunkOffsets[i2] = Platform.unsignedInt(byteBuffer.getInt());
        }
    }

    public void doWrite(ByteBuffer byteBuffer) {
        super.doWrite(byteBuffer);
        byteBuffer.putInt(this.chunkOffsets.length);
        for (long j : this.chunkOffsets) {
            byteBuffer.putInt((int) j);
        }
    }

    public int estimateSize() {
        return 16 + (this.chunkOffsets.length * 4);
    }

    public long[] getChunkOffsets() {
        return this.chunkOffsets;
    }

    public void setChunkOffsets(long[] jArr) {
        this.chunkOffsets = jArr;
    }
}
