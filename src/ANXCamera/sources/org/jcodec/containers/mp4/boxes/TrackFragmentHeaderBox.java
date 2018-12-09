package org.jcodec.containers.mp4.boxes;

import java.nio.ByteBuffer;

public class TrackFragmentHeaderBox extends FullBox {
    public static final int FLAG_BASE_DATA_OFFSET = 1;
    public static final int FLAG_DEFAILT_SAMPLE_DURATION = 8;
    public static final int FLAG_DEFAILT_SAMPLE_FLAGS = 32;
    public static final int FLAG_DEFAULT_SAMPLE_SIZE = 16;
    public static final int FLAG_SAMPLE_DESCRIPTION_INDEX = 2;
    private long baseDataOffset;
    private int defaultSampleDuration;
    private int defaultSampleFlags;
    private int defaultSampleSize;
    private int sampleDescriptionIndex;
    private int trackId;

    public static class Factory {
        private TrackFragmentHeaderBox box;

        public Factory(TrackFragmentHeaderBox trackFragmentHeaderBox) {
            this.box = trackFragmentHeaderBox;
        }

        public Factory baseDataOffset(long j) {
            TrackFragmentHeaderBox trackFragmentHeaderBox = this.box;
            trackFragmentHeaderBox.flags |= 1;
            this.box.baseDataOffset = (long) ((int) j);
            return this;
        }

        public Factory sampleDescriptionIndex(long j) {
            TrackFragmentHeaderBox trackFragmentHeaderBox = this.box;
            trackFragmentHeaderBox.flags |= 2;
            this.box.sampleDescriptionIndex = (int) j;
            return this;
        }

        public Factory defaultSampleDuration(long j) {
            TrackFragmentHeaderBox trackFragmentHeaderBox = this.box;
            trackFragmentHeaderBox.flags |= 8;
            this.box.defaultSampleDuration = (int) j;
            return this;
        }

        public Factory defaultSampleSize(long j) {
            TrackFragmentHeaderBox trackFragmentHeaderBox = this.box;
            trackFragmentHeaderBox.flags |= 16;
            this.box.defaultSampleSize = (int) j;
            return this;
        }

        public Factory defaultSampleFlags(long j) {
            TrackFragmentHeaderBox trackFragmentHeaderBox = this.box;
            trackFragmentHeaderBox.flags |= 32;
            this.box.defaultSampleFlags = (int) j;
            return this;
        }

        public TrackFragmentHeaderBox create() {
            try {
                TrackFragmentHeaderBox trackFragmentHeaderBox = this.box;
                return trackFragmentHeaderBox;
            } finally {
                this.box = null;
            }
        }
    }

    public TrackFragmentHeaderBox(Header header) {
        super(header);
    }

    public static String fourcc() {
        return "tfhd";
    }

    public static TrackFragmentHeaderBox tfhd(int i, long j, int i2, int i3, int i4, int i5) {
        TrackFragmentHeaderBox trackFragmentHeaderBox = new TrackFragmentHeaderBox(new Header(fourcc()));
        trackFragmentHeaderBox.trackId = i;
        trackFragmentHeaderBox.baseDataOffset = j;
        trackFragmentHeaderBox.sampleDescriptionIndex = i2;
        trackFragmentHeaderBox.defaultSampleDuration = i3;
        trackFragmentHeaderBox.defaultSampleSize = i4;
        trackFragmentHeaderBox.defaultSampleFlags = i5;
        return trackFragmentHeaderBox;
    }

    public static Factory create(int i) {
        return new Factory(createTrackFragmentHeaderBoxWithId(i));
    }

    public static Factory copy(TrackFragmentHeaderBox trackFragmentHeaderBox) {
        TrackFragmentHeaderBox tfhd = tfhd(trackFragmentHeaderBox.trackId, trackFragmentHeaderBox.baseDataOffset, trackFragmentHeaderBox.sampleDescriptionIndex, trackFragmentHeaderBox.defaultSampleDuration, trackFragmentHeaderBox.defaultSampleSize, trackFragmentHeaderBox.defaultSampleFlags);
        tfhd.setFlags(trackFragmentHeaderBox.getFlags());
        tfhd.setVersion(trackFragmentHeaderBox.getVersion());
        return new Factory(tfhd);
    }

    public static TrackFragmentHeaderBox createTrackFragmentHeaderBoxWithId(int i) {
        TrackFragmentHeaderBox trackFragmentHeaderBox = new TrackFragmentHeaderBox(new Header(fourcc()));
        trackFragmentHeaderBox.trackId = i;
        return trackFragmentHeaderBox;
    }

    public void parse(ByteBuffer byteBuffer) {
        super.parse(byteBuffer);
        this.trackId = byteBuffer.getInt();
        if (isBaseDataOffsetAvailable()) {
            this.baseDataOffset = byteBuffer.getLong();
        }
        if (isSampleDescriptionIndexAvailable()) {
            this.sampleDescriptionIndex = byteBuffer.getInt();
        }
        if (isDefaultSampleDurationAvailable()) {
            this.defaultSampleDuration = byteBuffer.getInt();
        }
        if (isDefaultSampleSizeAvailable()) {
            this.defaultSampleSize = byteBuffer.getInt();
        }
        if (isDefaultSampleFlagsAvailable()) {
            this.defaultSampleFlags = byteBuffer.getInt();
        }
    }

    protected void doWrite(ByteBuffer byteBuffer) {
        super.doWrite(byteBuffer);
        byteBuffer.putInt(this.trackId);
        if (isBaseDataOffsetAvailable()) {
            byteBuffer.putLong(this.baseDataOffset);
        }
        if (isSampleDescriptionIndexAvailable()) {
            byteBuffer.putInt(this.sampleDescriptionIndex);
        }
        if (isDefaultSampleDurationAvailable()) {
            byteBuffer.putInt(this.defaultSampleDuration);
        }
        if (isDefaultSampleSizeAvailable()) {
            byteBuffer.putInt(this.defaultSampleSize);
        }
        if (isDefaultSampleFlagsAvailable()) {
            byteBuffer.putInt(this.defaultSampleFlags);
        }
    }

    public int estimateSize() {
        return 40;
    }

    public int getTrackId() {
        return this.trackId;
    }

    public long getBaseDataOffset() {
        return this.baseDataOffset;
    }

    public int getSampleDescriptionIndex() {
        return this.sampleDescriptionIndex;
    }

    public int getDefaultSampleDuration() {
        return this.defaultSampleDuration;
    }

    public int getDefaultSampleSize() {
        return this.defaultSampleSize;
    }

    public int getDefaultSampleFlags() {
        return this.defaultSampleFlags;
    }

    public boolean isBaseDataOffsetAvailable() {
        return (this.flags & 1) != 0;
    }

    public boolean isSampleDescriptionIndexAvailable() {
        return (this.flags & 2) != 0;
    }

    public boolean isDefaultSampleDurationAvailable() {
        return (this.flags & 8) != 0;
    }

    public boolean isDefaultSampleSizeAvailable() {
        return (this.flags & 16) != 0;
    }

    public boolean isDefaultSampleFlagsAvailable() {
        return (this.flags & 32) != 0;
    }

    public void setTrackId(int i) {
        this.trackId = i;
    }

    public void setDefaultSampleFlags(int i) {
        this.defaultSampleFlags = i;
    }

    public static TrackFragmentHeaderBox createTrackFragmentHeaderBox() {
        return new TrackFragmentHeaderBox(new Header(fourcc()));
    }
}
