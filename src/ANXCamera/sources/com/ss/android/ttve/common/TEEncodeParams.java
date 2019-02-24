package com.ss.android.ttve.common;

public class TEEncodeParams {
    public static final int ENCODE_LEVEL_FAST = 4;
    public static final int ENCODE_LEVEL_FASTER = 3;
    public static final int ENCODE_LEVEL_MEDIUM = 5;
    public static final int ENCODE_LEVEL_PLACEBO = 9;
    public static final int ENCODE_LEVEL_SLOW = 6;
    public static final int ENCODE_LEVEL_SLOWER = 7;
    public static final int ENCODE_LEVEL_SUPERFAST = 1;
    public static final int ENCODE_LEVEL_ULTRAFAST = 0;
    public static final int ENCODE_LEVEL_VERYFAST = 2;
    public static final int ENCODE_LEVEL_VERYSLOW = 8;
    public static final int MUSIC_LOOP_ALWAYS = 1;
    public static final int MUSIC_LOOP_ONLY_ONCE = 0;
    public int audioBitrate = 0;
    public int encodeLevel = 0;
    public int fps = 30;
    public int gopSize = 30;
    public boolean hasBFrame = false;
    public int musicLoopType = 0;
    public TESizei outputSize;
    public float speed;
    public String strAudioFilePath;
    public String strVideoFilePath;
    public boolean useHWEncoder;
    public int videoBitrate = 0;

    public TEEncodeParams(String str, String str2, TESizei tESizei, float f, boolean z) {
        this.strVideoFilePath = str;
        this.strAudioFilePath = str2;
        this.outputSize = tESizei;
        this.speed = f;
        this.useHWEncoder = z;
    }

    public TEEncodeParams(String str, TESizei tESizei, float f, boolean z, int i, int i2, int i3) {
        this.strVideoFilePath = str;
        this.outputSize = tESizei;
        this.speed = f;
        this.useHWEncoder = z;
        this.musicLoopType = i;
        this.fps = i2;
        this.gopSize = i3;
    }

    public TEEncodeParams(String str, TESizei tESizei, float f, boolean z, int i, int i2, int i3, int i4, int i5, int i6, boolean z2) {
        this.strVideoFilePath = str;
        this.outputSize = tESizei;
        this.speed = f;
        this.useHWEncoder = z;
        this.musicLoopType = i;
        this.fps = i2;
        this.gopSize = i3;
        this.videoBitrate = i4;
        this.audioBitrate = i5;
        this.encodeLevel = i6;
        this.hasBFrame = z2;
    }
}
