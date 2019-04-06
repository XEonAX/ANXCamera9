package com.android.camera;

import android.content.Context;
import android.os.VibrationEffect;
import android.os.Vibrator;
import java.util.concurrent.atomic.AtomicReference;

public class VibratorUtils {
    public static final int DEFAULT_AMPLITUDE = 80;
    public static final int DEFAULT_MILLISECONDS = 100;
    private static final AtomicReference<VibratorUtils> INSTANCE = new AtomicReference();
    private VibrationEffect mDefaultVibrationEffect = VibrationEffect.createOneShot(100, 80);
    private Vibrator mVibrator;

    private VibratorUtils(Context context) {
        this.mVibrator = (Vibrator) context.getApplicationContext().getSystemService("vibrator");
    }

    public static VibratorUtils getInstance(Context context) {
        while (true) {
            VibratorUtils vibratorUtils = (VibratorUtils) INSTANCE.get();
            if (vibratorUtils != null) {
                return vibratorUtils;
            }
            vibratorUtils = new VibratorUtils(context);
            if (INSTANCE.compareAndSet(null, vibratorUtils)) {
                return vibratorUtils;
            }
        }
    }

    public void cancel() {
        this.mVibrator.cancel();
    }

    public void vibrate() {
        this.mVibrator.vibrate(this.mDefaultVibrationEffect);
    }

    public void vibrate(long j, int i) {
        this.mVibrator.vibrate(VibrationEffect.createOneShot(j, i));
    }

    public void vibrate(long[] jArr, int i) {
        this.mVibrator.vibrate(VibrationEffect.createWaveform(jArr, i));
    }
}
