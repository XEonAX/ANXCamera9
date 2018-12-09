package org.jcodec.containers.mp4.boxes;

public class Edit {
    private long duration;
    private long mediaTime;
    private float rate;

    public static Edit createEdit(Edit edit) {
        return new Edit(edit.duration, edit.mediaTime, edit.rate);
    }

    public Edit(long j, long j2, float f) {
        this.duration = j;
        this.mediaTime = j2;
        this.rate = f;
    }

    public long getDuration() {
        return this.duration;
    }

    public long getMediaTime() {
        return this.mediaTime;
    }

    public float getRate() {
        return this.rate;
    }

    public void shift(long j) {
        this.mediaTime += j;
    }

    public void setMediaTime(long j) {
        this.mediaTime = j;
    }

    public void setDuration(long j) {
        this.duration = j;
    }
}
