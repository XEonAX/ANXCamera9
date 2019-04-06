package com.arcsoft.camera.wideselfie;

import android.graphics.Point;
import android.graphics.Rect;

public class ProcessResult {
    public int direction;
    public boolean hasCapture;
    public int maxResultWidth;
    public int progress;
    public byte[] progressBarThumbArray;
    public int progressBarThumbImageHeight;
    public int progressBarThumbImageWidth;
    public Point progressBarThumbOffset;
    public Point progressBarThumbOffsetCapture;
    public Rect progressBarThumbRect;
    public ProjectGuide projectGuide;
    public byte[] resultImageArray;
    public int resultImageHeight;
    public int resultImageWidth;

    public static class ProjectGuide {
        public Point leftBottomOffset;
        public Point leftTopOffset;
        public Point rightBottomOffset;
        public Point rightTopOffset;
    }
}
