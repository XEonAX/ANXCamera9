package org.jcodec.containers.mp4.boxes;

import java.nio.ByteBuffer;

public class SyncSamplesBox extends FullBox {
    public static final String STSS = "stss";
    protected int[] syncSamples;

    public static SyncSamplesBox createSyncSamplesBox(int[] iArr) {
        SyncSamplesBox syncSamplesBox = new SyncSamplesBox(new Header(STSS));
        syncSamplesBox.syncSamples = iArr;
        return syncSamplesBox;
    }

    public SyncSamplesBox(Header header) {
        super(header);
    }

    public void parse(ByteBuffer byteBuffer) {
        super.parse(byteBuffer);
        int i = byteBuffer.getInt();
        this.syncSamples = new int[i];
        for (int i2 = 0; i2 < i; i2++) {
            this.syncSamples[i2] = byteBuffer.getInt();
        }
    }

    protected void doWrite(ByteBuffer byteBuffer) {
        super.doWrite(byteBuffer);
        byteBuffer.putInt(this.syncSamples.length);
        for (int putInt : this.syncSamples) {
            byteBuffer.putInt(putInt);
        }
    }

    public int estimateSize() {
        return 16 + (this.syncSamples.length * 4);
    }

    public int[] getSyncSamples() {
        return this.syncSamples;
    }
}
