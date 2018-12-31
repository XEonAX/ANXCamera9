package com.sensetime.stmobile.model;

public class STImage {
    public int height;
    public byte[] imageData;
    public int pixelFormat;
    public int stride;
    public STTime timeStamp;
    public int width;

    public class STTime {
        long microSeconds;
        long second;
    }
}
