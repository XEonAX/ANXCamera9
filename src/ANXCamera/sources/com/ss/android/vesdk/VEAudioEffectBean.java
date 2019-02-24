package com.ss.android.vesdk;

public class VEAudioEffectBean {
    public int blockSize;
    public float centtone;
    public boolean formatShiftOn;
    public float octative;
    public int phaseAdjustMethod;
    public int phaseResetMode;
    public int pitchTunerMode;
    public int processChMode;
    public float semiton;
    public boolean smoothOn;
    public float speedRatio;
    public int transientDetectMode;
    public int type;
    public int windowMode;

    public VEAudioEffectBean(int i, boolean z, boolean z2, int i2, int i3, int i4, int i5, int i6, int i7, int i8, float f, float f2, float f3, float f4) {
        this.type = i;
        this.formatShiftOn = z;
        this.smoothOn = z2;
        this.processChMode = i2;
        this.transientDetectMode = i3;
        this.phaseResetMode = i4;
        this.phaseAdjustMethod = i5;
        this.windowMode = i6;
        this.pitchTunerMode = i7;
        this.blockSize = i8;
        this.centtone = f;
        this.semiton = f2;
        this.octative = f3;
        this.speedRatio = f4;
    }
}
