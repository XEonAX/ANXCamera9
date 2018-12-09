package org.jcodec.common;

public class AudioFormat {
    private boolean bigEndian;
    private int channelCount;
    private int sampleRate;
    private int sampleSizeInBits;
    private boolean signed;

    public AudioFormat(int i, int i2, int i3, boolean z, boolean z2) {
        this.sampleRate = i;
        this.sampleSizeInBits = i2;
        this.channelCount = i3;
        this.signed = z;
        this.bigEndian = z2;
    }

    public int getChannels() {
        return this.channelCount;
    }

    public int getSampleSizeInBits() {
        return this.sampleSizeInBits;
    }

    public int getSampleRate() {
        return this.sampleRate;
    }

    public boolean isBigEndian() {
        return this.bigEndian;
    }
}
