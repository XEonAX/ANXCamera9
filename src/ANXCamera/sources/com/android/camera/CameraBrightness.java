package com.android.camera;

import android.app.Activity;
import android.miui.R;
import android.os.AsyncTask;
import android.os.Build.VERSION;
import android.os.PowerManager;
import android.provider.Settings.System;
import android.support.annotation.Nullable;
import android.text.TextUtils;
import android.util.Spline;
import android.view.WindowManager.LayoutParams;
import com.android.camera.log.Log;
import com.android.camera.ui.drawable.PanoramaArrowAnimateDrawable;
import com.android.internal.R.array;
import com.android.internal.R.bool;
import com.android.internal.R.integer;
import com.mi.config.b;
import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.lang.ref.WeakReference;
import miui.reflect.Field;
import miui.reflect.NoSuchFieldException;
import miui.util.ReflectionUtils;

public class CameraBrightness implements CameraBrightnessCallback {
    private static final String TAG = "CameraBrightness";
    private int mBrightness;
    private AsyncTask<Void, Void, Integer> mCameraBrightnessTask;
    private Activity mCurrentActivity;
    private boolean mFirstFocusChanged = false;
    private boolean mPaused;
    private boolean mUseDefaultValue = true;

    private static class CameraBrightnessTask extends AsyncTask<Void, Void, Integer> {
        private final float ADJUST_RATIO_BASE = 0.1f;
        private final float ADJUST_RATIO_RANGE = 0.3f;
        private final boolean DEBUG = false;
        private WeakReference<Activity> mActivityWeakReference;
        private WeakReference<CameraBrightnessCallback> mCallbackWeakReference;
        private boolean mPaused;
        private Spline mPositiveScreenManualBrightnessSpline;
        private Spline mScreenManualBrightnessSpline;
        private boolean mUseDefaultValue;

        public CameraBrightnessTask(Activity activity, CameraBrightnessCallback cameraBrightnessCallback, boolean z, boolean z2) {
            this.mActivityWeakReference = new WeakReference(activity);
            this.mCallbackWeakReference = new WeakReference(cameraBrightnessCallback);
            this.mPaused = z2;
            this.mUseDefaultValue = z;
        }

        protected Integer doInBackground(Void... voidArr) {
            String str = CameraBrightness.TAG;
            StringBuilder stringBuilder = new StringBuilder();
            stringBuilder.append("doInBackground useDefaultValue=");
            stringBuilder.append(this.mUseDefaultValue);
            stringBuilder.append(" paused=");
            stringBuilder.append(this.mPaused);
            Log.v(str, stringBuilder.toString());
            Activity activity = (Activity) this.mActivityWeakReference.get();
            if (activity == null || this.mUseDefaultValue || this.mPaused) {
                return Integer.valueOf(-1);
            }
            LayoutParams attributes = activity.getWindow().getAttributes();
            return VERSION.SDK_INT >= 28 ? getBrightIsAndroidP(attributes, activity) : getBrightNotAndroidP(attributes);
        }

        @Nullable
        private Integer getBrightNotAndroidP(LayoutParams layoutParams) {
            int currentBackLight = getCurrentBackLight();
            String str = CameraBrightness.TAG;
            StringBuilder stringBuilder = new StringBuilder();
            stringBuilder.append("current back light -> ");
            stringBuilder.append(currentBackLight);
            Log.d(str, stringBuilder.toString());
            if (currentBackLight <= 0) {
                return null;
            }
            createSpline();
            if (layoutParams.screenBrightness > PanoramaArrowAnimateDrawable.LEFT_ARROW_RATIO) {
                int round;
                float f = layoutParams.screenBrightness * 255.0f;
                if (this.mPositiveScreenManualBrightnessSpline != null) {
                    round = Math.round(this.mPositiveScreenManualBrightnessSpline.interpolate(f));
                } else {
                    round = Math.round(f);
                }
                if (Math.abs(round - currentBackLight) <= 1) {
                    Log.v(CameraBrightness.TAG, "doInBackground brightness unchanged");
                    return null;
                }
            }
            if (this.mScreenManualBrightnessSpline != null) {
                currentBackLight = (int) this.mScreenManualBrightnessSpline.interpolate((float) currentBackLight);
            }
            return Integer.valueOf(toEnLargeBrightness(currentBackLight));
        }

        @Nullable
        private Integer getBrightIsAndroidP(LayoutParams layoutParams, Activity activity) {
            try {
                int i = ReflectionUtils.findField(PowerManager.class, "BRIGHTNESS_ON").getInt(PowerManager.class);
                int i2 = System.getInt(activity.getContentResolver(), "screen_brightness");
                String str = CameraBrightness.TAG;
                StringBuilder stringBuilder = new StringBuilder();
                stringBuilder.append("android P -> current back light -> ");
                stringBuilder.append(i2);
                Log.d(str, stringBuilder.toString());
                float toEnLargeBrightness = (float) toEnLargeBrightness((int) Math.ceil((double) (((float) (i2 * 256)) / ((float) (i + 1)))));
                if (layoutParams.screenBrightness <= PanoramaArrowAnimateDrawable.LEFT_ARROW_RATIO || toEnLargeBrightness != ((float) ((int) (layoutParams.screenBrightness * 255.0f)))) {
                    return Integer.valueOf((int) toEnLargeBrightness);
                }
                Log.v(CameraBrightness.TAG, "android P -> doInBackground brightness unchanged");
                return null;
            } catch (Exception e) {
                Log.e(CameraBrightness.TAG, e.toString());
                return null;
            }
        }

        protected void onPostExecute(Integer num) {
            if (!isCancelled() && num != null) {
                updateBrightness(num.intValue());
            }
        }

        private void updateBrightness(int i) {
            Activity activity = (Activity) this.mActivityWeakReference.get();
            if (activity != null && (i != -1 || this.mUseDefaultValue || this.mPaused)) {
                LayoutParams attributes = activity.getWindow().getAttributes();
                if (this.mUseDefaultValue || this.mPaused) {
                    attributes.screenBrightness = -1.0f;
                } else {
                    attributes.screenBrightness = ((float) i) / 255.0f;
                }
                String str = CameraBrightness.TAG;
                StringBuilder stringBuilder = new StringBuilder();
                stringBuilder.append("updateBrightness setting=");
                stringBuilder.append(i);
                stringBuilder.append(" useDefaultValue=");
                stringBuilder.append(this.mUseDefaultValue);
                stringBuilder.append(" screenBrightness=");
                stringBuilder.append(attributes.screenBrightness);
                Log.v(str, stringBuilder.toString());
                activity.getWindow().setAttributes(attributes);
                CameraBrightnessCallback cameraBrightnessCallback = (CameraBrightnessCallback) this.mCallbackWeakReference.get();
                if (cameraBrightnessCallback != null) {
                    cameraBrightnessCallback.setBrightness(i);
                }
            }
        }

        private int toEnLargeBrightness(int i) {
            return Integer.valueOf(Util.clamp((int) (((double) i) * (1.0d + ((double) (0.1f + ((((float) Util.clamp(i, 0, 185)) / 185.0f) * 0.3f))))), 0, 255)).intValue();
        }

        private int getCurrentBackLight() {
            Object obj = null;
            int i = 0;
            while (true) {
                if (("0".equals(obj) || obj == null) && i < 3 && !isCancelled()) {
                    obj = execCommand("cat sys/class/backlight/panel0-backlight/brightness");
                    if ("0".equals(obj) || obj == null) {
                        try {
                            Thread.sleep(300);
                        } catch (InterruptedException e) {
                            Log.e(CameraBrightness.TAG, e.getMessage());
                        }
                        i++;
                    }
                }
            }
            String str = CameraBrightness.TAG;
            StringBuilder stringBuilder = new StringBuilder();
            stringBuilder.append("getCurrentBackLight currentSetting=");
            stringBuilder.append(obj);
            Log.v(str, stringBuilder.toString());
            if (TextUtils.isEmpty(obj)) {
                return -1;
            }
            i = getAndroidIntResource("config_backlightBits");
            if (i <= 0) {
                i = getMiuiIntResource("config_backlightBit");
            }
            int parseFloat = (int) Float.parseFloat(obj);
            if (i <= 8) {
                return -1;
            }
            i -= 8;
            int i2 = 1;
            if (parseFloat >= (1 << i)) {
                i2 = parseFloat >> i;
            }
            String str2 = CameraBrightness.TAG;
            StringBuilder stringBuilder2 = new StringBuilder();
            stringBuilder2.append("getCurrentBackLight convert to ");
            stringBuilder2.append(i2);
            Log.v(str2, stringBuilder2.toString());
            return i2;
        }

        private String execCommand(String str) {
            InterruptedException e;
            IOException e2;
            long currentTimeMillis = System.currentTimeMillis();
            String str2 = "";
            try {
                Process exec = Runtime.getRuntime().exec(str);
                if (exec.waitFor() != 0) {
                    String str3 = CameraBrightness.TAG;
                    StringBuilder stringBuilder = new StringBuilder();
                    stringBuilder.append("exit value = ");
                    stringBuilder.append(exec.exitValue());
                    Log.e(str3, stringBuilder.toString());
                    return str2;
                }
                BufferedReader bufferedReader = new BufferedReader(new InputStreamReader(exec.getInputStream()));
                StringBuffer stringBuffer = new StringBuffer();
                while (true) {
                    String readLine = bufferedReader.readLine();
                    if (readLine == null) {
                        break;
                    }
                    stringBuffer.append(readLine);
                }
                bufferedReader.close();
                str = stringBuffer.toString();
                try {
                    str2 = CameraBrightness.TAG;
                    StringBuilder stringBuilder2 = new StringBuilder();
                    stringBuilder2.append("execCommand lcd value=");
                    stringBuilder2.append(str);
                    stringBuilder2.append(" cost=");
                    stringBuilder2.append(System.currentTimeMillis() - currentTimeMillis);
                    Log.v(str2, stringBuilder2.toString());
                    str2 = str;
                } catch (InterruptedException e3) {
                    str2 = str;
                    e = e3;
                    Log.e(CameraBrightness.TAG, "execCommand InterruptedException");
                    e.printStackTrace();
                    return str2;
                } catch (IOException e4) {
                    str2 = str;
                    e2 = e4;
                    Log.e(CameraBrightness.TAG, "execCommand IOException");
                    e2.printStackTrace();
                    return str2;
                }
                return str2;
            } catch (InterruptedException e5) {
                e = e5;
                Log.e(CameraBrightness.TAG, "execCommand InterruptedException");
                e.printStackTrace();
                return str2;
            } catch (IOException e6) {
                e2 = e6;
                Log.e(CameraBrightness.TAG, "execCommand IOException");
                e2.printStackTrace();
                return str2;
            }
        }

        private void createSpline() {
            if ((this.mScreenManualBrightnessSpline == null || this.mPositiveScreenManualBrightnessSpline == null) && getAndroidBoolRes("config_manual_spline_available", true)) {
                int[] androidArrayRes = getAndroidArrayRes("config_manualBrightnessRemapIn");
                int[] androidArrayRes2 = getAndroidArrayRes("config_manualBrightnessRemapOut");
                this.mScreenManualBrightnessSpline = createManualBrightnessSpline(androidArrayRes2, androidArrayRes);
                this.mPositiveScreenManualBrightnessSpline = createManualBrightnessSpline(androidArrayRes, androidArrayRes2);
                if (this.mScreenManualBrightnessSpline == null || this.mPositiveScreenManualBrightnessSpline == null) {
                    Log.e(CameraBrightness.TAG, "Error to create manual brightness spline");
                }
            }
        }

        private boolean getAndroidBoolRes(String str, boolean z) {
            try {
                return CameraAppImpl.getAndroidContext().getResources().getBoolean(Field.of(bool.class, str, "I").getInt(null));
            } catch (NoSuchFieldException e) {
                Log.e(CameraBrightness.TAG, e.getMessage());
                try {
                    return CameraAppImpl.getAndroidContext().getResources().getBoolean(Field.of(R.bool.class, str, "I").getInt(null));
                } catch (NoSuchFieldException e2) {
                    Log.e(CameraBrightness.TAG, e2.getMessage());
                    return z;
                } catch (IllegalArgumentException e3) {
                    Log.e(CameraBrightness.TAG, e3.getMessage());
                    return z;
                }
            } catch (IllegalArgumentException e4) {
                Log.e(CameraBrightness.TAG, e4.getMessage());
                return CameraAppImpl.getAndroidContext().getResources().getBoolean(Field.of(R.bool.class, str, "I").getInt(null));
            }
        }

        private int[] getAndroidArrayRes(String str) {
            try {
                return CameraAppImpl.getAndroidContext().getResources().getIntArray(Field.of(array.class, str, "I").getInt(null));
            } catch (NoSuchFieldException e) {
                Log.e(CameraBrightness.TAG, e.getMessage());
                try {
                    return CameraAppImpl.getAndroidContext().getResources().getIntArray(Field.of(R.array.class, str, "I").getInt(null));
                } catch (NoSuchFieldException e2) {
                    Log.e(CameraBrightness.TAG, e2.getMessage());
                    return new int[]{0, 255};
                } catch (IllegalArgumentException e3) {
                    Log.e(CameraBrightness.TAG, e3.getMessage());
                    return new int[]{0, 255};
                }
            } catch (IllegalArgumentException e4) {
                Log.e(CameraBrightness.TAG, e4.getMessage());
                return CameraAppImpl.getAndroidContext().getResources().getIntArray(Field.of(R.array.class, str, "I").getInt(null));
            }
        }

        private int getAndroidIntResource(String str) {
            try {
                return CameraAppImpl.getAndroidContext().getResources().getInteger(Field.of(integer.class, str, "I").getInt(null));
            } catch (NoSuchFieldException e) {
                Log.e(CameraBrightness.TAG, e.getMessage());
                return 0;
            } catch (IllegalArgumentException e2) {
                Log.e(CameraBrightness.TAG, e2.getMessage());
                return 0;
            }
        }

        private int getMiuiIntResource(String str) {
            try {
                return CameraAppImpl.getAndroidContext().getResources().getInteger(Field.of(R.integer.class, str, "I").getInt(null));
            } catch (NoSuchFieldException e) {
                Log.e(CameraBrightness.TAG, e.getMessage());
                return 0;
            } catch (IllegalArgumentException e2) {
                Log.e(CameraBrightness.TAG, e2.getMessage());
                return 0;
            }
        }

        private Spline createManualBrightnessSpline(int[] iArr, int[] iArr2) {
            try {
                int length = iArr.length;
                float[] fArr = new float[length];
                float[] fArr2 = new float[length];
                for (int i = 0; i < length; i++) {
                    fArr[i] = (float) iArr[i];
                    fArr2[i] = (float) iArr2[i];
                }
                return new MonotoneCubicSpline(fArr, fArr2);
            } catch (Throwable e) {
                Log.e(CameraBrightness.TAG, "Could not create manual-brightness spline.", e);
                return null;
            }
        }
    }

    public static class MonotoneCubicSpline extends Spline {
        private float[] mM;
        private float[] mX;
        private float[] mY;

        public MonotoneCubicSpline(float[] fArr, float[] fArr2) {
            if (fArr == null || fArr2 == null || fArr.length != fArr2.length || fArr.length < 2) {
                throw new IllegalArgumentException("There must be at least two control points and the arrays must be of equal length.");
            }
            float f;
            int length = fArr.length;
            int i = length - 1;
            float[] fArr3 = new float[i];
            float[] fArr4 = new float[length];
            int i2 = 0;
            int i3 = 0;
            while (i3 < i) {
                int i4 = i3 + 1;
                f = fArr[i4] - fArr[i3];
                if (f > PanoramaArrowAnimateDrawable.LEFT_ARROW_RATIO) {
                    fArr3[i3] = (fArr2[i4] - fArr2[i3]) / f;
                    i3 = i4;
                } else {
                    throw new IllegalArgumentException("The control points must all have strictly increasing X values.");
                }
            }
            fArr4[0] = fArr3[0];
            for (i3 = 1; i3 < i; i3++) {
                fArr4[i3] = (fArr3[i3 - 1] + fArr3[i3]) * 0.5f;
            }
            fArr4[i] = fArr3[length - 2];
            while (i2 < i) {
                if (fArr3[i2] == PanoramaArrowAnimateDrawable.LEFT_ARROW_RATIO) {
                    fArr4[i2] = PanoramaArrowAnimateDrawable.LEFT_ARROW_RATIO;
                    fArr4[i2 + 1] = PanoramaArrowAnimateDrawable.LEFT_ARROW_RATIO;
                } else {
                    float f2 = fArr4[i2] / fArr3[i2];
                    int i5 = i2 + 1;
                    float f3 = fArr4[i5] / fArr3[i2];
                    if (f2 < PanoramaArrowAnimateDrawable.LEFT_ARROW_RATIO || f3 < PanoramaArrowAnimateDrawable.LEFT_ARROW_RATIO) {
                        throw new IllegalArgumentException("The control points must have monotonic Y values.");
                    }
                    float hypot = (float) Math.hypot((double) f2, (double) f3);
                    if (hypot > 9.0f) {
                        f = 3.0f / hypot;
                        fArr4[i2] = (f2 * f) * fArr3[i2];
                        fArr4[i5] = (f * f3) * fArr3[i2];
                    }
                }
                i2++;
            }
            this.mX = fArr;
            this.mY = fArr2;
            this.mM = fArr4;
        }

        public float interpolate(float f) {
            int length = this.mX.length;
            if (Float.isNaN(f)) {
                return f;
            }
            int i = 0;
            if (f <= this.mX[0]) {
                return this.mY[0];
            }
            length--;
            if (f >= this.mX[length]) {
                return this.mY[length];
            }
            while (true) {
                int i2 = i + 1;
                if (f < this.mX[i2]) {
                    float f2 = this.mX[i2] - this.mX[i];
                    f = (f - this.mX[i]) / f2;
                    float f3 = 2.0f * f;
                    float f4 = (this.mY[i] * (1.0f + f3)) + ((this.mM[i] * f2) * f);
                    float f5 = 1.0f - f;
                    return ((f4 * f5) * f5) + ((((this.mY[i2] * (3.0f - f3)) + ((f2 * this.mM[i2]) * (f - 1.0f))) * f) * f);
                } else if (f == this.mX[i2]) {
                    return this.mY[i2];
                } else {
                    i = i2;
                }
            }
        }

        public String toString() {
            StringBuilder stringBuilder = new StringBuilder();
            int length = this.mX.length;
            stringBuilder.append("MonotoneCubicSpline{[");
            for (int i = 0; i < length; i++) {
                if (i != 0) {
                    stringBuilder.append(", ");
                }
                stringBuilder.append("(");
                stringBuilder.append(this.mX[i]);
                stringBuilder.append(", ");
                stringBuilder.append(this.mY[i]);
                stringBuilder.append(": ");
                stringBuilder.append(this.mM[i]);
                stringBuilder.append(")");
            }
            stringBuilder.append("]}");
            return stringBuilder.toString();
        }
    }

    public CameraBrightness(Activity activity) {
        this.mCurrentActivity = activity;
    }

    public void setBrightness(int i) {
        this.mBrightness = i;
    }

    public void adjustBrightnessInAutoMode(float f) {
    }

    private void adjustBrightness() {
        if (this.mCurrentActivity != null && b.fX()) {
            cancelLastTask();
            this.mCameraBrightnessTask = new CameraBrightnessTask(this.mCurrentActivity, this, this.mUseDefaultValue, this.mPaused).execute(new Void[0]);
        }
    }

    private void cancelLastTask() {
        if (this.mCameraBrightnessTask != null) {
            this.mCameraBrightnessTask.cancel(true);
            this.mCameraBrightnessTask = null;
        }
    }

    public void onWindowFocusChanged(boolean z) {
        String str = TAG;
        StringBuilder stringBuilder = new StringBuilder();
        stringBuilder.append("onWindowFocusChanged hasFocus=");
        stringBuilder.append(z);
        stringBuilder.append(" mFirstFocusChanged=");
        stringBuilder.append(this.mFirstFocusChanged);
        Log.v(str, stringBuilder.toString());
        boolean z2 = true;
        if (!this.mFirstFocusChanged && z) {
            this.mFirstFocusChanged = true;
        } else if (!this.mPaused) {
            if (!(this.mCurrentActivity instanceof BasePreferenceActivity) && z) {
                z2 = false;
            }
            this.mUseDefaultValue = z2;
            adjustBrightness();
        }
    }

    public int getCurrentBrightness() {
        return this.mBrightness;
    }

    public int getCurrentBrightnessManual() {
        return this.mBrightness;
    }

    public float getCurrentBrightnessAuto() {
        return (float) this.mBrightness;
    }

    public void onResume() {
        this.mUseDefaultValue = this.mCurrentActivity instanceof BasePreferenceActivity;
        this.mPaused = false;
        Log.v(TAG, "onResume adjustBrightness");
        adjustBrightness();
    }

    public void onPause() {
        this.mFirstFocusChanged = false;
        this.mPaused = true;
        cancelLastTask();
    }
}
