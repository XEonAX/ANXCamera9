package com.android.camera.db.element;

import com.android.camera.log.Log;

public class SaveTask {
    private Long id;
    private int jpegRotation;
    private Long mediaStoreId;
    private String path;
    private int percentage;
    private Long startTime;
    private int status = 1;

    public SaveTask(Long l, String str) {
        this.mediaStoreId = l;
        this.path = str;
    }

    public SaveTask(Long l, Long l2, Long l3, String str, int i, int i2, int i3) {
        this.id = l;
        this.startTime = l2;
        this.mediaStoreId = l3;
        this.path = str;
        this.status = i;
        this.percentage = i2;
        this.jpegRotation = i3;
    }

    public boolean isDeparted(long j) {
        return j - getStartTime().longValue() > 40000;
    }

    public boolean isValid() {
        return getMediaStoreId() != null;
    }

    public Long getId() {
        return this.id;
    }

    public void setId(Long l) {
        this.id = l;
    }

    public Long getStartTime() {
        return this.startTime;
    }

    public void setStartTime(Long l) {
        StringBuilder stringBuilder = new StringBuilder();
        stringBuilder.append(l);
        stringBuilder.append("");
        Log.e("algo setTime:", stringBuilder.toString());
        this.startTime = l;
    }

    public Long getMediaStoreId() {
        return this.mediaStoreId;
    }

    public void setMediaStoreId(Long l) {
        this.mediaStoreId = l;
    }

    public String getPath() {
        return this.path;
    }

    public void setPath(String str) {
        this.path = str;
    }

    public int getStatus() {
        return this.status;
    }

    public void setStatus(int i) {
        this.status = i;
    }

    public int getPercentage() {
        return this.percentage;
    }

    public void setPercentage(int i) {
        this.percentage = i;
    }

    public int getJpegRotation() {
        return this.jpegRotation;
    }

    public void setJpegRotation(int i) {
        this.jpegRotation = i;
    }
}
