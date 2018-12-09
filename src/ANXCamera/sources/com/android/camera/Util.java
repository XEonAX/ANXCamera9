package com.android.camera;

import android.animation.Animator;
import android.animation.AnimatorSet;
import android.animation.ValueAnimator;
import android.app.Activity;
import android.app.ActivityManager;
import android.app.ActivityManager.MemoryInfo;
import android.app.AlertDialog;
import android.app.AlertDialog.Builder;
import android.content.ActivityNotFoundException;
import android.content.ContentResolver;
import android.content.Context;
import android.content.DialogInterface;
import android.content.DialogInterface.OnClickListener;
import android.content.DialogInterface.OnDismissListener;
import android.content.Intent;
import android.content.res.AssetManager;
import android.content.res.Resources;
import android.graphics.Bitmap;
import android.graphics.Bitmap.CompressFormat;
import android.graphics.Bitmap.Config;
import android.graphics.BitmapFactory;
import android.graphics.BitmapFactory.Options;
import android.graphics.Canvas;
import android.graphics.Matrix;
import android.graphics.Paint;
import android.graphics.PaintFlagsDrawFilter;
import android.graphics.Point;
import android.graphics.Rect;
import android.graphics.RectF;
import android.graphics.Typeface;
import android.graphics.YuvImage;
import android.hardware.camera2.CaptureResult;
import android.hardware.camera2.params.MeteringRectangle;
import android.location.Country;
import android.location.CountryDetector;
import android.media.Image;
import android.media.Image.Plane;
import android.media.MediaMetadataRetriever;
import android.net.Uri;
import android.opengl.GLES20;
import android.os.Build.VERSION;
import android.os.CountDownTimer;
import android.os.Environment;
import android.os.IPowerManager;
import android.os.ParcelFileDescriptor;
import android.os.ServiceManager;
import android.os.SystemClock;
import android.os.SystemProperties;
import android.provider.MiuiSettings.Global;
import android.provider.Settings.Secure;
import android.provider.Settings.SettingNotFoundException;
import android.provider.Settings.System;
import android.renderscript.Allocation;
import android.renderscript.Element;
import android.renderscript.RenderScript;
import android.renderscript.ScriptIntrinsicBlur;
import android.support.v4.view.InputDeviceCompat;
import android.support.v4.view.ViewCompat;
import android.telephony.TelephonyManager;
import android.text.SpannableStringBuilder;
import android.text.TextUtils;
import android.text.format.Time;
import android.util.DisplayMetrics;
import android.util.SparseArray;
import android.view.IWindowManager;
import android.view.IWindowManager.Stub;
import android.view.KeyEvent;
import android.view.TouchDelegate;
import android.view.View;
import android.view.View.MeasureSpec;
import android.view.ViewGroup.MarginLayoutParams;
import android.view.Window;
import android.view.WindowManager;
import android.view.WindowManager.LayoutParams;
import android.view.accessibility.AccessibilityManager;
import android.view.animation.AlphaAnimation;
import android.view.animation.Animation;
import android.widget.Button;
import com.adobe.xmp.XMPMeta;
import com.android.camera.data.DataRepository;
import com.android.camera.effect.FilterInfo;
import com.android.camera.effect.renders.CustomTextWaterMark;
import com.android.camera.fragment.top.FragmentTopAlert;
import com.android.camera.lib.compatibility.util.CompatibilityUtils;
import com.android.camera.lib.compatibility.util.CompatibilityUtils.PackageInstallerListener;
import com.android.camera.log.Log;
import com.android.camera.module.loader.camera2.Camera2DataContainer;
import com.android.camera.permission.PermissionManager;
import com.android.camera.statistic.CameraStatUtil;
import com.android.camera.storage.Storage;
import com.android.camera2.AECFrameControl;
import com.android.camera2.AFFrameControl;
import com.android.camera2.CameraCapabilities;
import com.android.camera2.CaptureResultParser;
import com.android.gallery3d.exif.ExifInterface;
import com.android.gallery3d.exif.ExifInterface.GpsSpeedRef;
import com.android.gallery3d.ui.StringTexture;
import com.mi.config.b;
import com.xiaomi.camera.liveshot.util.XmpHelper;
import dalvik.system.VMRuntime;
import java.io.BufferedReader;
import java.io.ByteArrayInputStream;
import java.io.ByteArrayOutputStream;
import java.io.Closeable;
import java.io.File;
import java.io.FileDescriptor;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.OutputStream;
import java.nio.Buffer;
import java.nio.ByteBuffer;
import java.security.MessageDigest;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Date;
import java.util.HashMap;
import java.util.HashSet;
import java.util.Iterator;
import java.util.List;
import java.util.Locale;
import java.util.Objects;
import miui.R;
import miui.hardware.display.DisplayFeatureManager;
import miui.os.Build;
import miui.reflect.Field;
import miui.reflect.Method;
import miui.reflect.NoSuchClassException;
import miui.reflect.NoSuchFieldException;
import miui.reflect.NoSuchMethodException;
import miui.security.SecurityManager;
import miui.util.IOUtils;
import miui.view.animation.SineEaseInOutInterpolator;
import org.xmlpull.v1.XmlPullParser;
import org.xmlpull.v1.XmlPullParserException;

public final class Util {
    public static final String ACTION_BIND_GALLERY_SERVICE = "com.miui.gallery.action.BIND_SERVICE";
    public static final String ACTION_DISMISS_KEY_GUARD = "xiaomi.intent.action.SHOW_SECURE_KEYGUARD";
    public static final String ACTION_KILL_CAMERA_SERVICE = "com.android.camera.action.KILL_CAMERA_SERVICE";
    public static final String ALGORITHM_NAME_PORTRAIT = "portrait";
    public static final String ALGORITHM_NAME_SOFT_PORTRAIT = "soft-portrait";
    private static HashSet<String> ANTIBANDING_60_COUNTRY = new HashSet(Arrays.asList(new String[]{"TW", "KR", "SA", "US", "CA", "BR", "CO", "MX", "PH"}));
    public static final double ASPECT_TOLERANCE = 0.02d;
    public static final int BLUR_DURATION = 100;
    private static final List<Integer> COLOR_TEMPERATURE_LIST = new ArrayList();
    private static final List<Integer> COLOR_TEMPERATURE_MAP = new ArrayList();
    public static final boolean DEBUG = (Build.IS_STABLE_VERSION ^ 1);
    public static final String EXTRAS_SKIP_LOCK = "skip_interception";
    private static final String EXTRAS_START_WITH_EFFECT_RENDER = "android.intent.extras.START_WITH_EFFECT_RENDER";
    public static final int FLAG_DRAWS_SYSTEM_BAR_BACKGROUNDS = Integer.MIN_VALUE;
    private static final String FORCE_CAMERA_0_FILE = "force_camera_0";
    private static final String FORCE_NAME_SUFFIX_FILE = "force_name_suffix";
    public static final int GOING_TO_CROP = 5;
    public static final int GOING_TO_DETAIL = 3;
    public static final int GOING_TO_GALLERY = 1;
    public static final int GOING_TO_PLAYBACK = 4;
    public static final int GOING_TO_SETTING = 2;
    private static final File INTERNAL_STORAGE_DIRECTORY = new File("/data/sdcard");
    public static final int KEYCODE_SLIDE_OFF = 701;
    public static final int KEYCODE_SLIDE_ON = 700;
    public static final String KEY_CAMERA_BRIGHTNESS = "camera-brightness";
    public static final String KEY_CAMERA_BRIGHTNESS_AUTO = "camera-brightness-auto";
    public static final String KEY_CAMERA_BRIGHTNESS_MANUAL = "camera-brightness-manual";
    public static final String KEY_KILLED_MODULE_INDEX = "killed-moduleIndex";
    public static final String KEY_REVIEW_FROM_MIUICAMERA = "from_MiuiCamera";
    public static final String KEY_SECURE_ITEMS = "SecureUri";
    private static final String LAB_OPTIONS_VISIBLE_FILE = "lab_options_visible";
    public static final String LAST_FRAME_GAUSSIAN_FILE_NAME = "blur.jpg";
    public static final int LAST_FRAME_GAUSSIAN_RADIUS = 24;
    public static final int LIMIT_SURFACE_WIDTH = 720;
    public static final int MAX_SECURE_SIZE = 100;
    private static final String NONUI_MODE_PROPERTY = "sys.power.nonui";
    public static final int ORIENTATION_HYSTERESIS = 5;
    public static final String QRCODE_RECEIVER_ACTION = "com.xiaomi.scanner.receiver.senderbarcodescanner";
    public static final float RATIO_16_9 = 1.77f;
    public static final float RATIO_18_9 = 2.0f;
    public static final float RATIO_19P5_9 = 2.16f;
    public static final float RATIO_1_1 = 1.0f;
    public static final float RATIO_4_3 = 1.33f;
    public static final String REVIEW_ACTION = "com.android.camera.action.REVIEW";
    public static final String REVIEW_ACTIVITY_PACKAGE = "com.miui.gallery";
    public static final String REVIEW_SCAN_RESULT_PACKAGE = "com.xiaomi.scanner";
    public static final int SCREEN_EFFECT_CAMERA_STATE = 14;
    public static final Uri SCREEN_SLIDE_STATUS_SETTING_URI = System.getUriFor("sc_status");
    private static final String SCREEN_VENDOR = SystemProperties.get("sys.panel.display");
    private static final String TAG = "CameraUtil";
    private static final String TEMP_SUFFIX = ".tmp";
    public static final String WATERMARK_FILE_NAME;
    private static final String ZOOM_ANIMATION_PROPERTY = "camera_zoom_animation";
    public static boolean isLongRatioScreen;
    public static boolean isNotchDevice;
    private static String mCountryIso = null;
    private static int mLockedOrientation = -1;
    private static boolean sClearMemoryLimit;
    public static int sFullScreenExtraMargin;
    private static boolean sHasNavigationBar;
    private static ImageFileNamer sImageFileNamer;
    private static boolean sIsAccessibilityEnable;
    public static boolean sIsDumpLog;
    public static boolean sIsDumpOrigJpg;
    private static Boolean sIsForceNameSuffix;
    public static boolean sIsFullScreenNavBarHidden;
    public static boolean sIsKillCameraService;
    private static Boolean sIsLabOptionsVisible;
    public static int sNavigationBarHeight;
    private static float sPixelDensity = 1.0f;
    public static int sStatusBarHeight;
    private static HashMap<String, Typeface> sTypefaces = new HashMap();
    public static int sWindowHeight = 1080;
    private static IWindowManager sWindowManager;
    public static int sWindowWidth = LIMIT_SURFACE_WIDTH;

    private static class ImageFileNamer {
        private SimpleDateFormat mFormat;
        private long mLastDate;
        private int mSameSecondCount;

        public ImageFileNamer(String str) {
            this.mFormat = new SimpleDateFormat(str);
        }

        public String generateName(long j) {
            String format = this.mFormat.format(new Date(j));
            if (j / 1000 == this.mLastDate / 1000) {
                this.mSameSecondCount++;
                StringBuilder stringBuilder = new StringBuilder();
                stringBuilder.append(format);
                stringBuilder.append("_");
                stringBuilder.append(this.mSameSecondCount);
                return stringBuilder.toString();
            }
            this.mLastDate = j;
            this.mSameSecondCount = 0;
            return format;
        }
    }

    static {
        StringBuilder stringBuilder = new StringBuilder();
        stringBuilder.append(android.os.Build.DEVICE);
        stringBuilder.append("_custom_watermark.png");
        WATERMARK_FILE_NAME = stringBuilder.toString();
    }

    private Util() {
    }

    public static boolean isAntibanding60() {
        return ANTIBANDING_60_COUNTRY.contains(mCountryIso);
    }

    public static void updateCountryIso(Context context) {
        String str;
        if (((TelephonyManager) context.getSystemService("phone")).getSimState() != 5) {
            str = SystemProperties.get("ro.miui.region");
        } else {
            str = null;
        }
        if (TextUtils.isEmpty(str)) {
            Country detectCountry = ((CountryDetector) context.getSystemService("country_detector")).detectCountry();
            if (detectCountry != null) {
                str = detectCountry.getCountryIso();
            }
        }
        mCountryIso = str;
        String str2 = TAG;
        StringBuilder stringBuilder = new StringBuilder();
        stringBuilder.append("antiBanding mCountryIso=");
        stringBuilder.append(mCountryIso);
        Log.d(str2, stringBuilder.toString());
        sIsDumpLog = SystemProperties.getBoolean("camera_dump_parameters", DEBUG);
        sIsDumpOrigJpg = SystemProperties.getBoolean("camera_dump_orig_jpg", false);
        sIsKillCameraService = SystemProperties.getBoolean("kill_camera_service_enable", true);
    }

    public static void dumpBackTrace(String str) {
        RuntimeException runtimeException = new RuntimeException();
        String str2 = TAG;
        StringBuilder stringBuilder = new StringBuilder();
        stringBuilder.append("[");
        stringBuilder.append(str);
        stringBuilder.append("]\n");
        Log.d(str2, stringBuilder.toString());
        Log.d(TAG, "**********print backtrace start *************");
        for (StackTraceElement stackTraceElement : runtimeException.getStackTrace()) {
            String str3 = TAG;
            StringBuilder stringBuilder2 = new StringBuilder();
            stringBuilder2.append("[");
            stringBuilder2.append(str);
            stringBuilder2.append("]:backtrace: ");
            stringBuilder2.append(stackTraceElement.getClassName());
            stringBuilder2.append(" ");
            stringBuilder2.append(stackTraceElement.getMethodName());
            stringBuilder2.append(" ");
            stringBuilder2.append(stackTraceElement.getLineNumber());
            Log.d(str3, stringBuilder2.toString());
        }
        Log.d(TAG, "**********print backtrace end *************");
        String str4 = TAG;
        StringBuilder stringBuilder3 = new StringBuilder();
        stringBuilder3.append("[");
        stringBuilder3.append(str);
        stringBuilder3.append("]\n");
        Log.d(str4, stringBuilder3.toString());
    }

    public static void initialize(Context context) {
        isNotchDevice = SystemProperties.getInt("ro.miui.notch", 0) == 1;
        sIsFullScreenNavBarHidden = isFullScreenNavBarHidden(context);
        DisplayMetrics displayMetrics = new DisplayMetrics();
        WindowManager windowManager = (WindowManager) context.getSystemService("window");
        windowManager.getDefaultDisplay().getMetrics(displayMetrics);
        sPixelDensity = displayMetrics.noncompatDensity;
        sImageFileNamer = new ImageFileNamer(context.getString(R.string.image_file_name_format));
        sIsAccessibilityEnable = ((AccessibilityManager) context.getSystemService("accessibility")).isEnabled();
        Point point = new Point();
        windowManager.getDefaultDisplay().getRealSize(point);
        if (point.x < point.y) {
            sWindowWidth = point.x;
            sWindowHeight = point.y;
        } else {
            sWindowWidth = point.y;
            sWindowHeight = point.x;
        }
        isLongRatioScreen = isFind19_5_9LongRatioScreen(sWindowWidth, sWindowHeight);
        sFullScreenExtraMargin = context.getResources().getDimensionPixelSize(R.dimen.fullscreen_extra_margin);
        sNavigationBarHeight = checkDeviceHasNavigationBar(context) ? getNavigationBarHeight(context) : calcNavigationBarHeight(context);
        if (isNotchDevice) {
            if (isLongRatioScreen) {
                sStatusBarHeight = getStatusBarHeight(context);
            } else {
                sStatusBarHeight = sWindowHeight - (sWindowWidth * 2);
            }
            if (sIsFullScreenNavBarHidden) {
                sNavigationBarHeight -= sFullScreenExtraMargin;
                sStatusBarHeight += sFullScreenExtraMargin / 2;
            }
        }
        CameraSettings.BOTTOM_CONTROL_HEIGHT = getBottomHeight(context.getResources());
        Log.i(TAG, String.format(Locale.ENGLISH, "windowSize=%dx%d density=%.2f", new Object[]{Integer.valueOf(sWindowWidth), Integer.valueOf(sWindowHeight), Float.valueOf(sPixelDensity)}));
    }

    public static void clearMemoryLimit() {
        if (!sClearMemoryLimit) {
            long currentTimeMillis = System.currentTimeMillis();
            VMRuntime.getRuntime().clearGrowthLimit();
            sClearMemoryLimit = true;
            long currentTimeMillis2 = System.currentTimeMillis();
            String str = TAG;
            StringBuilder stringBuilder = new StringBuilder();
            stringBuilder.append("clearMemoryLimit() consume:");
            stringBuilder.append(currentTimeMillis2 - currentTimeMillis);
            Log.v(str, stringBuilder.toString());
        }
    }

    public static int dpToPixel(float f) {
        return Math.round(sPixelDensity * f);
    }

    public static Bitmap rotate(Bitmap bitmap, int i) {
        return rotateAndMirror(bitmap, i, false);
    }

    public static Bitmap rotateAndMirror(Bitmap bitmap, int i, boolean z) {
        if ((i == 0 && !z) || bitmap == null) {
            return bitmap;
        }
        Matrix matrix = new Matrix();
        if (z) {
            matrix.postScale(-1.0f, 1.0f);
            i = (i + 360) % 360;
            if (i == 0 || i == 180) {
                matrix.postTranslate((float) bitmap.getWidth(), 0.0f);
            } else if (i == 90 || i == 270) {
                matrix.postTranslate((float) bitmap.getHeight(), 0.0f);
            } else {
                StringBuilder stringBuilder = new StringBuilder();
                stringBuilder.append("Invalid degrees=");
                stringBuilder.append(i);
                throw new IllegalArgumentException(stringBuilder.toString());
            }
        }
        if (i != 0) {
            matrix.postRotate((float) i, ((float) bitmap.getWidth()) / 2.0f, ((float) bitmap.getHeight()) / 2.0f);
        }
        try {
            Bitmap createBitmap = Bitmap.createBitmap(bitmap, 0, 0, bitmap.getWidth(), bitmap.getHeight(), matrix, true);
            if (bitmap == createBitmap) {
                return bitmap;
            }
            bitmap.recycle();
            return createBitmap;
        } catch (OutOfMemoryError e) {
            return bitmap;
        }
    }

    public static int computeSampleSize(Options options, int i, int i2) {
        int computeInitialSampleSize = computeInitialSampleSize(options, i, i2);
        if (computeInitialSampleSize > 8) {
            return 8 * ((computeInitialSampleSize + 7) / 8);
        }
        i = 1;
        while (i < computeInitialSampleSize) {
            i <<= 1;
        }
        return i;
    }

    private static int computeInitialSampleSize(Options options, int i, int i2) {
        int i3;
        int i4;
        double d = (double) options.outWidth;
        double d2 = (double) options.outHeight;
        if (i2 < 0) {
            i3 = 1;
        } else {
            i3 = (int) Math.ceil(Math.sqrt((d * d2) / ((double) i2)));
        }
        if (i < 0) {
            i4 = 128;
        } else {
            double d3 = (double) i;
            i4 = (int) Math.min(Math.floor(d / d3), Math.floor(d2 / d3));
        }
        if (i4 < i3) {
            return i3;
        }
        if (i2 < 0 && i < 0) {
            return 1;
        }
        if (i < 0) {
            return i3;
        }
        return i4;
    }

    public static Bitmap makeBitmap(byte[] bArr, int i) {
        try {
            Options options = new Options();
            options.inJustDecodeBounds = true;
            BitmapFactory.decodeByteArray(bArr, 0, bArr.length, options);
            if (options.mCancel || options.outWidth == -1 || options.outHeight == -1) {
                return null;
            }
            options.inSampleSize = computeSampleSize(options, -1, i);
            options.inJustDecodeBounds = false;
            options.inDither = false;
            options.inPreferredConfig = Config.ARGB_8888;
            return BitmapFactory.decodeByteArray(bArr, 0, bArr.length, options);
        } catch (Throwable e) {
            Log.e(TAG, "Got oom exception ", e);
            return null;
        }
    }

    /* JADX WARNING: Removed duplicated region for block: B:28:0x0054 A:{SYNTHETIC, Splitter: B:28:0x0054} */
    /* JADX WARNING: Removed duplicated region for block: B:22:0x0043 A:{SYNTHETIC, Splitter: B:22:0x0043} */
    public static boolean saveBitmap(java.nio.Buffer r1, int r2, int r3, android.graphics.Bitmap.Config r4, java.lang.String r5) {
        /*
        if (r1 == 0) goto L_0x0063;
    L_0x0003:
        r2 = android.graphics.Bitmap.createBitmap(r2, r3, r4);
        r2.copyPixelsFromBuffer(r1);
        r1 = 0;
        r3 = new java.io.FileOutputStream;	 Catch:{ FileNotFoundException -> 0x0039 }
        r4 = new java.io.File;	 Catch:{ FileNotFoundException -> 0x0039 }
        r4.<init>(r5);	 Catch:{ FileNotFoundException -> 0x0039 }
        r3.<init>(r4);	 Catch:{ FileNotFoundException -> 0x0039 }
        r1 = android.graphics.Bitmap.CompressFormat.JPEG;	 Catch:{ FileNotFoundException -> 0x0032, all -> 0x002d }
        r4 = 100;
        r2.compress(r1, r4, r3);	 Catch:{ FileNotFoundException -> 0x0032, all -> 0x002d }
        r1 = 1;
        r3.flush();	 Catch:{ Exception -> 0x0025 }
        r3.close();	 Catch:{ Exception -> 0x0025 }
        goto L_0x0029;
    L_0x0025:
        r3 = move-exception;
        r3.printStackTrace();
    L_0x0029:
        r2.recycle();
        goto L_0x0064;
    L_0x002d:
        r1 = move-exception;
        r0 = r3;
        r3 = r1;
        r1 = r0;
        goto L_0x0052;
    L_0x0032:
        r1 = move-exception;
        r0 = r3;
        r3 = r1;
        r1 = r0;
        goto L_0x003a;
    L_0x0037:
        r3 = move-exception;
        goto L_0x0052;
    L_0x0039:
        r3 = move-exception;
    L_0x003a:
        r4 = "CameraUtil";
        r5 = "saveBitmap failed!";
        com.android.camera.log.Log.e(r4, r5, r3);	 Catch:{ all -> 0x0037 }
        if (r1 == 0) goto L_0x004e;
    L_0x0043:
        r1.flush();	 Catch:{ Exception -> 0x004a }
        r1.close();	 Catch:{ Exception -> 0x004a }
        goto L_0x004e;
    L_0x004a:
        r1 = move-exception;
        r1.printStackTrace();
    L_0x004e:
        r2.recycle();
        goto L_0x0063;
    L_0x0052:
        if (r1 == 0) goto L_0x005f;
    L_0x0054:
        r1.flush();	 Catch:{ Exception -> 0x005b }
        r1.close();	 Catch:{ Exception -> 0x005b }
        goto L_0x005f;
    L_0x005b:
        r1 = move-exception;
        r1.printStackTrace();
    L_0x005f:
        r2.recycle();
        throw r3;
    L_0x0063:
        r1 = 0;
    L_0x0064:
        return r1;
        */
        throw new UnsupportedOperationException("Method not decompiled: com.android.camera.Util.saveBitmap(java.nio.Buffer, int, int, android.graphics.Bitmap$Config, java.lang.String):boolean");
    }

    public static boolean saveCameraCalibrationToFile(byte[] bArr, boolean z) {
        String str;
        if (z) {
            str = "front_dual_camera_caldata.bin";
        } else {
            str = "back_dual_camera_caldata.bin";
        }
        return saveCameraCalibrationToFile(bArr, str);
    }

    /* JADX WARNING: Removed duplicated region for block: B:31:0x0047 A:{SYNTHETIC, Splitter: B:31:0x0047} */
    /* JADX WARNING: Removed duplicated region for block: B:25:0x0036 A:{SYNTHETIC, Splitter: B:25:0x0036} */
    /* JADX WARNING: Removed duplicated region for block: B:34:0x0050 A:{SYNTHETIC, Splitter: B:34:0x0050} */
    private static boolean saveCameraCalibrationToFile(byte[] r3, java.lang.String r4) {
        /*
        r0 = com.android.camera.CameraAppImpl.getAndroidContext();
        r1 = 0;
        if (r3 == 0) goto L_0x005c;
    L_0x0008:
        if (r0 == 0) goto L_0x005c;
    L_0x000a:
        r2 = 0;
        r4 = r0.openFileOutput(r4, r1);	 Catch:{ FileNotFoundException -> 0x003d, IOException -> 0x002c }
        r4.write(r3);	 Catch:{ FileNotFoundException -> 0x0027, IOException -> 0x0024, all -> 0x0021 }
        r1 = 1;
        if (r4 == 0) goto L_0x005c;
    L_0x0015:
        r4.flush();	 Catch:{ Exception -> 0x001c }
        r4.close();	 Catch:{ Exception -> 0x001c }
        goto L_0x0020;
    L_0x001c:
        r3 = move-exception;
        r3.printStackTrace();
    L_0x0020:
        goto L_0x005c;
    L_0x0021:
        r3 = move-exception;
        r2 = r4;
        goto L_0x004e;
    L_0x0024:
        r3 = move-exception;
        r2 = r4;
        goto L_0x002d;
    L_0x0027:
        r3 = move-exception;
        r2 = r4;
        goto L_0x003e;
    L_0x002a:
        r3 = move-exception;
        goto L_0x004e;
    L_0x002c:
        r3 = move-exception;
    L_0x002d:
        r4 = "CameraUtil";
        r0 = "saveCameraCalibrationToFile: IOException";
        com.android.camera.log.Log.e(r4, r0, r3);	 Catch:{ all -> 0x002a }
        if (r2 == 0) goto L_0x005c;
    L_0x0036:
        r2.flush();	 Catch:{ Exception -> 0x001c }
        r2.close();	 Catch:{ Exception -> 0x001c }
        goto L_0x0020;
    L_0x003d:
        r3 = move-exception;
    L_0x003e:
        r4 = "CameraUtil";
        r0 = "saveCameraCalibrationToFile: FileNotFoundException";
        com.android.camera.log.Log.e(r4, r0, r3);	 Catch:{ all -> 0x002a }
        if (r2 == 0) goto L_0x005c;
    L_0x0047:
        r2.flush();	 Catch:{ Exception -> 0x001c }
        r2.close();	 Catch:{ Exception -> 0x001c }
        goto L_0x0020;
    L_0x004e:
        if (r2 == 0) goto L_0x005b;
    L_0x0050:
        r2.flush();	 Catch:{ Exception -> 0x0057 }
        r2.close();	 Catch:{ Exception -> 0x0057 }
        goto L_0x005b;
    L_0x0057:
        r4 = move-exception;
        r4.printStackTrace();
    L_0x005b:
        throw r3;
    L_0x005c:
        return r1;
        */
        throw new UnsupportedOperationException("Method not decompiled: com.android.camera.Util.saveCameraCalibrationToFile(byte[], java.lang.String):boolean");
    }

    public static void closeSilently(Closeable closeable) {
        if (closeable != null) {
            try {
                closeable.close();
            } catch (Exception e) {
            }
        }
    }

    public static void Assert(boolean z) {
        if (!z) {
            throw new AssertionError();
        }
    }

    public static void showErrorAndFinish(final Activity activity, int i) {
        boolean z;
        AlertDialog show = new Builder(activity).setCancelable(false).setIconAttribute(16843605).setTitle(R.string.camera_error_title).setMessage(i).setNeutralButton(R.string.dialog_ok, new OnClickListener() {
            public void onClick(DialogInterface dialogInterface, int i) {
                Camera2DataContainer.getInstance().reset();
                activity.finish();
            }
        }).show();
        if (i == R.string.cannot_connect_camera_twice || i == R.string.cannot_connect_camera_once) {
            z = true;
        } else {
            z = false;
        }
        if (z) {
            CameraStatUtil.trackCameraErrorDialogShow();
        }
        if (sIsKillCameraService && VERSION.SDK_INT >= 26 && b.fW() && z) {
            if (SystemClock.elapsedRealtime() - CameraSettings.getBroadcastKillServiceTime() > 60000) {
                broadcastKillService(activity);
            }
            final Button button = show.getButton(-3);
            button.setTextAppearance(R.style.Widget_Button_Dialog);
            button.setEnabled(false);
            final Activity activity2 = activity;
            final CountDownTimer start = new CountDownTimer(5000, 1000) {
                public void onTick(long j) {
                    if (!((ActivityBase) activity2).isActivityPaused()) {
                        button.setText(activity2.getResources().getString(R.string.dialog_ok_time, new Object[]{Long.valueOf(j / 1000)}));
                    }
                }

                public void onFinish() {
                    if (!((ActivityBase) activity2).isActivityPaused()) {
                        button.setEnabled(true);
                        button.setText(activity2.getResources().getString(R.string.dialog_ok));
                    }
                }
            }.start();
            show.setOnDismissListener(new OnDismissListener() {
                public void onDismiss(DialogInterface dialogInterface) {
                    if (start != null) {
                        start.cancel();
                    }
                }
            });
        }
        ((ActivityBase) activity).setErrorDialog(show);
    }

    public static <T> T checkNotNull(T t) {
        if (t != null) {
            return t;
        }
        throw new NullPointerException();
    }

    public static boolean equals(Object obj, Object obj2) {
        return obj == obj2 || (obj != null && obj.equals(obj2));
    }

    public static int nextPowerOf2(int i) {
        i--;
        i |= i >>> 16;
        i |= i >>> 8;
        i |= i >>> 4;
        i |= i >>> 2;
        return (i | (i >>> 1)) + 1;
    }

    public static float distance(float f, float f2, float f3, float f4) {
        f -= f3;
        f2 -= f4;
        return (float) Math.sqrt((double) ((f * f) + (f2 * f2)));
    }

    public static int clamp(int i, int i2, int i3) {
        if (i > i3) {
            return i3;
        }
        if (i < i2) {
            return i2;
        }
        return i;
    }

    public static float clamp(float f, float f2, float f3) {
        if (f > f3) {
            return f3;
        }
        if (f < f2) {
            return f2;
        }
        return f;
    }

    public static void checkLockedOrientation(Activity activity) {
        try {
            if (System.getInt(activity.getContentResolver(), "accelerometer_rotation") == 0) {
                mLockedOrientation = System.getInt(activity.getContentResolver(), "user_rotation");
            } else {
                mLockedOrientation = -1;
            }
        } catch (SettingNotFoundException e) {
            Log.e(TAG, "user rotation cannot found");
        }
    }

    public static int getShootOrientation(Activity activity, int i) {
        return ((i - getDisplayRotation(activity)) + 360) % 360;
    }

    public static float getShootRotation(Activity activity, float f) {
        f -= (float) getDisplayRotation(activity);
        while (f < 0.0f) {
            f += 360.0f;
        }
        while (f > 360.0f) {
            f -= 360.0f;
        }
        return f;
    }

    public static int getDisplayRotation(Activity activity) {
        int rotation;
        if (b.hk() && CameraSettings.isFrontCamera() && activity.getRequestedOrientation() == 7) {
            rotation = activity.getWindowManager().getDefaultDisplay().getRotation();
        } else if (mLockedOrientation == 0 || mLockedOrientation == 2) {
            rotation = mLockedOrientation;
        } else {
            rotation = 0;
        }
        switch (rotation) {
            case 0:
                return 0;
            case 1:
                return 90;
            case 2:
                return 180;
            case 3:
                return 270;
            default:
                return 0;
        }
    }

    public static boolean isActivityInvert(Activity activity) {
        return getDisplayRotation(activity) == 180;
    }

    public static int getDisplayOrientation(int i, int i2) {
        CameraCapabilities capabilities = Camera2DataContainer.getInstance().getCapabilities(i2);
        if (capabilities == null) {
            return 90;
        }
        int sensorOrientation = capabilities.getSensorOrientation();
        if (capabilities.getFacing() == 0) {
            i = (360 - ((sensorOrientation + i) % 360)) % 360;
        } else {
            i = ((sensorOrientation - i) + 360) % 360;
        }
        return i;
    }

    public static int getSensorOrientation(int i) {
        return Camera2DataContainer.getInstance().getCapabilities(i).getSensorOrientation();
    }

    public static void printLog(String str, Object... objArr) {
        StringBuilder stringBuilder = new StringBuilder();
        for (int i = 0; i < objArr.length; i += 2) {
            stringBuilder.append(objArr[i].toString());
            stringBuilder.append(" = ");
            stringBuilder.append(objArr[i + 1].toString());
            stringBuilder.append(" ");
        }
        Log.d(str, stringBuilder.toString());
    }

    public static int roundOrientation(int i, int i2) {
        Object obj = 1;
        if (i2 != -1) {
            int abs = Math.abs(i - i2);
            if (Math.min(abs, 360 - abs) < 50) {
                obj = null;
            }
        }
        if (obj != null) {
            return (((i + 45) / 90) * 90) % 360;
        }
        return i2;
    }

    /* JADX WARNING: Removed duplicated region for block: B:35:0x006a  */
    /* JADX WARNING: Removed duplicated region for block: B:34:0x0061  */
    /* JADX WARNING: Removed duplicated region for block: B:43:0x0082  */
    /* JADX WARNING: Removed duplicated region for block: B:47:0x00a1  */
    /* JADX WARNING: Removed duplicated region for block: B:71:0x0136  */
    /* JADX WARNING: Removed duplicated region for block: B:73:0x0139  */
    /* JADX WARNING: Removed duplicated region for block: B:81:0x0189  */
    public static com.android.camera.CameraSize getOptimalPreviewSize(int r21, int r22, java.util.List<com.android.camera.CameraSize> r23, double r24) {
        /*
        r0 = r21;
        r1 = 0;
        if (r23 != 0) goto L_0x000d;
    L_0x0005:
        r0 = "CameraUtil";
        r2 = "null preview size list";
        com.android.camera.log.Log.w(r0, r2);
        return r1;
        r3 = "camera_reduce_preview_flag";
        r4 = 0;
        r3 = com.mi.config.d.getInteger(r3, r4);
        r5 = 1080; // 0x438 float:1.513E-42 double:5.336E-321;
        r7 = 1;
        if (r3 == 0) goto L_0x005a;
        r8 = com.android.camera.module.loader.camera2.Camera2DataContainer.getInstance();
        r8 = r8.getFrontCameraId();
        r9 = r22;
        if (r9 != r8) goto L_0x002d;
    L_0x002b:
        r8 = r7;
        goto L_0x002f;
        r8 = r4;
    L_0x002f:
        r9 = sWindowWidth;
        if (r9 >= r5) goto L_0x0035;
    L_0x0033:
        r3 = r3 & -15;
    L_0x0035:
        if (r8 == 0) goto L_0x0039;
    L_0x0037:
        r8 = 2;
        goto L_0x003a;
    L_0x0039:
        r8 = r7;
    L_0x003a:
        r9 = 162; // 0xa2 float:2.27E-43 double:8.0E-322;
        if (r0 == r9) goto L_0x0050;
    L_0x003e:
        r9 = 169; // 0xa9 float:2.37E-43 double:8.35E-322;
        if (r0 == r9) goto L_0x0050;
    L_0x0042:
        r9 = 168; // 0xa8 float:2.35E-43 double:8.3E-322;
        if (r0 == r9) goto L_0x0050;
    L_0x0046:
        r9 = 170; // 0xaa float:2.38E-43 double:8.4E-322;
        if (r0 == r9) goto L_0x0050;
    L_0x004a:
        r9 = 174; // 0xae float:2.44E-43 double:8.6E-322;
        if (r0 == r9) goto L_0x0050;
    L_0x004e:
        r0 = r4;
        goto L_0x0051;
    L_0x0050:
        r0 = 2;
    L_0x0051:
        r0 = r8 << r0;
        r0 = r0 | r4;
        r0 = r0 & r3;
        if (r0 == 0) goto L_0x0059;
    L_0x0057:
        r0 = r7;
        goto L_0x005b;
    L_0x005a:
        r0 = r4;
    L_0x005b:
        r3 = new android.graphics.Point;
        r8 = sWindowWidth;
        if (r0 == 0) goto L_0x006a;
    L_0x0061:
        r9 = sWindowHeight;
        r10 = 1920; // 0x780 float:2.69E-42 double:9.486E-321;
        r9 = java.lang.Math.min(r9, r10);
        goto L_0x006c;
    L_0x006a:
        r9 = sWindowHeight;
    L_0x006c:
        r3.<init>(r8, r9);
        r8 = com.mi.config.b.gK();
        if (r8 != 0) goto L_0x007e;
    L_0x0075:
        r8 = com.mi.config.b.gE();
        if (r8 == 0) goto L_0x007e;
    L_0x007b:
        r5 = 720; // 0x2d0 float:1.009E-42 double:3.557E-321;
    L_0x007e:
        r8 = r3.x;
        if (r8 <= r5) goto L_0x008c;
    L_0x0082:
        r8 = r3.y;
        r8 = r8 * r5;
        r9 = r3.x;
        r8 = r8 / r9;
        r3.y = r8;
        r3.x = r5;
    L_0x008c:
        r5 = r23.iterator();
        r10 = r1;
        r11 = 9218868437227405311; // 0x7fefffffffffffff float:NaN double:1.7976931348623157E308;
        r13 = 9218868437227405311; // 0x7fefffffffffffff float:NaN double:1.7976931348623157E308;
    L_0x009b:
        r15 = r5.hasNext();
        if (r15 == 0) goto L_0x0132;
    L_0x00a1:
        r15 = r5.next();
        r15 = (com.android.camera.CameraSize) r15;
        r8 = r15.width;
        r8 = (double) r8;
        r6 = r15.height;
        r18 = r5;
        r4 = (double) r6;
        r8 = r8 / r4;
        r8 = r8 - r24;
        r8 = java.lang.Math.abs(r8);
        r19 = 4581421828931458171; // 0x3f947ae147ae147b float:89128.96 double:0.02;
        r6 = (r8 > r19 ? 1 : (r8 == r19 ? 0 : -1));
        if (r6 <= 0) goto L_0x00c0;
    L_0x00bf:
        goto L_0x00f5;
    L_0x00c0:
        if (r0 == 0) goto L_0x00f9;
    L_0x00c2:
        r6 = r3.x;
        r8 = r15.height;
        if (r6 <= r8) goto L_0x00ce;
    L_0x00c8:
        r6 = r3.y;
        r8 = r15.width;
        if (r6 > r8) goto L_0x00f9;
    L_0x00ce:
        r6 = "CameraUtil";
        r8 = new java.lang.StringBuilder;
        r8.<init>();
        r9 = "getOptimalPreviewSize: ";
        r8.append(r9);
        r9 = r15.toString();
        r8.append(r9);
        r9 = " | ";
        r8.append(r9);
        r9 = r3.toString();
        r8.append(r9);
        r8 = r8.toString();
        com.android.camera.log.Log.e(r6, r8);
    L_0x00f5:
        r5 = r18;
        r4 = 0;
        goto L_0x009b;
    L_0x00f9:
        r6 = r3.x;
        r8 = r15.height;
        r6 = r6 - r8;
        r6 = java.lang.Math.abs(r6);
        r8 = r3.y;
        r9 = r15.width;
        r8 = r8 - r9;
        r8 = java.lang.Math.abs(r8);
        r6 = r6 + r8;
        if (r6 != 0) goto L_0x0113;
        r10 = r15;
        goto L_0x0133;
    L_0x0113:
        r8 = r15.height;
        r9 = r3.x;
        if (r8 > r9) goto L_0x0128;
    L_0x0119:
        r8 = r15.width;
        r9 = r3.y;
        if (r8 > r9) goto L_0x0128;
    L_0x011f:
        r8 = (double) r6;
        r19 = (r8 > r11 ? 1 : (r8 == r11 ? 0 : -1));
        if (r19 >= 0) goto L_0x0128;
        r11 = r8;
        r10 = r15;
    L_0x0128:
        r8 = (double) r6;
        r6 = (r8 > r13 ? 1 : (r8 == r13 ? 0 : -1));
        if (r6 >= 0) goto L_0x0131;
        r13 = r8;
        r1 = r15;
    L_0x0131:
        goto L_0x00f5;
    L_0x0132:
        r15 = r1;
    L_0x0133:
        if (r10 == 0) goto L_0x0136;
    L_0x0135:
        goto L_0x0137;
    L_0x0136:
        r10 = r15;
    L_0x0137:
        if (r10 != 0) goto L_0x0187;
    L_0x0139:
        r0 = "CameraUtil";
        r1 = java.util.Locale.ENGLISH;
        r6 = "no preview size match the aspect ratio: %.2f";
        r8 = new java.lang.Object[r7];
        r4 = java.lang.Double.valueOf(r24);
        r5 = 0;
        r8[r5] = r4;
        r1 = java.lang.String.format(r1, r6, r8);
        com.android.camera.log.Log.w(r0, r1);
        r0 = r23.iterator();
        r16 = 9218868437227405311; // 0x7fefffffffffffff float:NaN double:1.7976931348623157E308;
    L_0x0159:
        r1 = r0.hasNext();
        if (r1 == 0) goto L_0x0187;
    L_0x015f:
        r1 = r0.next();
        r1 = (com.android.camera.CameraSize) r1;
        r2 = r3.x;
        r4 = r1.getHeight();
        r2 = r2 - r4;
        r2 = java.lang.Math.abs(r2);
        r4 = r3.y;
        r5 = r1.getWidth();
        r4 = r4 - r5;
        r4 = java.lang.Math.abs(r4);
        r2 = r2 + r4;
        r4 = (double) r2;
        r2 = (r4 > r16 ? 1 : (r4 == r16 ? 0 : -1));
        if (r2 >= 0) goto L_0x0186;
        r10 = r1;
        r16 = r4;
    L_0x0186:
        goto L_0x0159;
    L_0x0187:
        if (r10 == 0) goto L_0x01ae;
    L_0x0189:
        r0 = "CameraUtil";
        r1 = java.util.Locale.ENGLISH;
        r2 = "best preview size: %dx%d";
        r3 = 2;
        r3 = new java.lang.Object[r3];
        r4 = r10.getWidth();
        r4 = java.lang.Integer.valueOf(r4);
        r5 = 0;
        r3[r5] = r4;
        r4 = r10.getHeight();
        r4 = java.lang.Integer.valueOf(r4);
        r3[r7] = r4;
        r1 = java.lang.String.format(r1, r2, r3);
        com.android.camera.log.Log.i(r0, r1);
    L_0x01ae:
        return r10;
        */
        throw new UnsupportedOperationException("Method not decompiled: com.android.camera.Util.getOptimalPreviewSize(int, int, java.util.List, double):com.android.camera.CameraSize");
    }

    public static CameraSize getOptimalJpegThumbnailSize(List<CameraSize> list, double d) {
        CameraSize cameraSize = null;
        if (list == null) {
            Log.w(TAG, "null thumbnail size list");
            return null;
        }
        double d2 = 0.0d;
        for (CameraSize cameraSize2 : list) {
            if (cameraSize2.getWidth() != 0) {
                if (cameraSize2.getHeight() != 0) {
                    double width = ((double) cameraSize2.getWidth()) / ((double) cameraSize2.getHeight());
                    double abs = Math.abs(width - d);
                    double d3 = d2 - d;
                    if (abs <= Math.abs(d3) || abs <= 0.001d) {
                        if (cameraSize == null || abs < Math.abs(d3) || cameraSize2.getWidth() > cameraSize.getWidth()) {
                            cameraSize = cameraSize2;
                            d2 = width;
                        }
                    }
                }
            }
        }
        if (cameraSize == null) {
            Log.w(TAG, "No thumbnail size match the aspect ratio");
            for (CameraSize cameraSize3 : list) {
                if (cameraSize == null || cameraSize3.getWidth() > cameraSize.getWidth()) {
                    cameraSize = cameraSize3;
                }
            }
        }
        return cameraSize;
    }

    public static CameraSize getOptimalVideoSnapshotPictureSize(List<CameraSize> list, double d, int i, int i2) {
        CameraSize cameraSize = null;
        if (list == null) {
            Log.e(TAG, "null size list");
            return null;
        }
        for (CameraSize cameraSize2 : list) {
            if (Math.abs((((double) cameraSize2.getWidth()) / ((double) cameraSize2.getHeight())) - d) <= 0.02d) {
                if ((cameraSize == null || cameraSize2.getWidth() > cameraSize.getWidth()) && cameraSize2.getWidth() <= i && cameraSize2.getHeight() <= i2) {
                    cameraSize = cameraSize2;
                }
            }
        }
        if (cameraSize == null) {
            Log.w(TAG, "No picture size match the aspect ratio");
            for (CameraSize cameraSize3 : list) {
                if (cameraSize == null || cameraSize3.getWidth() > cameraSize.getWidth()) {
                    cameraSize = cameraSize3;
                }
            }
        }
        return cameraSize;
    }

    public static int replaceStartEffectRender(Activity activity) {
        if (b.fI()) {
            String stringExtra = activity.getIntent().getStringExtra(EXTRAS_START_WITH_EFFECT_RENDER);
            if (stringExtra != null) {
                int identifier = activity.getResources().getIdentifier(stringExtra, "integer", activity.getPackageName());
                if (identifier != 0) {
                    int integer = activity.getResources().getInteger(identifier);
                    CameraSettings.setShaderEffect(integer);
                    return integer;
                }
            }
        }
        return FilterInfo.FILTER_ID_NONE;
    }

    public static boolean pointInView(float f, float f2, View view) {
        boolean z = false;
        if (view == null) {
            return false;
        }
        int[] iArr = new int[2];
        view.getLocationInWindow(iArr);
        if (f >= ((float) iArr[0]) && f < ((float) (iArr[0] + view.getWidth())) && f2 >= ((float) iArr[1]) && f2 < ((float) (iArr[1] + view.getHeight()))) {
            z = true;
        }
        return z;
    }

    public static boolean isViewIntersectWindow(View view) {
        int[] iArr = new int[2];
        view.getLocationInWindow(iArr);
        return iArr[0] < sWindowWidth && iArr[0] + view.getWidth() >= 0 && iArr[1] < sWindowHeight && iArr[1] + view.getHeight() >= 0;
    }

    public static int[] getRelativeLocation(View view, View view2) {
        int[] iArr = new int[2];
        view.getLocationInWindow(iArr);
        int i = iArr[0];
        int i2 = iArr[1];
        view2.getLocationInWindow(iArr);
        iArr[0] = iArr[0] - i;
        iArr[1] = iArr[1] - i2;
        return iArr;
    }

    public static boolean isUriValid(Uri uri, ContentResolver contentResolver) {
        if (uri == null) {
            return false;
        }
        String str;
        StringBuilder stringBuilder;
        try {
            ParcelFileDescriptor openFileDescriptor = contentResolver.openFileDescriptor(uri, "r");
            if (openFileDescriptor == null) {
                str = TAG;
                stringBuilder = new StringBuilder();
                stringBuilder.append("Fail to open URI. URI=");
                stringBuilder.append(uri);
                Log.e(str, stringBuilder.toString());
                return false;
            }
            openFileDescriptor.close();
            return true;
        } catch (Throwable e) {
            str = TAG;
            stringBuilder = new StringBuilder();
            stringBuilder.append("IOException occurs when opening URI: ");
            stringBuilder.append(e.getMessage());
            Log.e(str, stringBuilder.toString(), e);
            return false;
        }
    }

    public static void viewUri(Uri uri, Context context) {
        if (isUriValid(uri, context.getContentResolver())) {
            try {
                context.startActivity(new Intent(REVIEW_ACTION, uri));
            } catch (ActivityNotFoundException e) {
                try {
                    context.startActivity(new Intent("android.intent.action.VIEW", uri));
                } catch (Throwable e2) {
                    String str = TAG;
                    StringBuilder stringBuilder = new StringBuilder();
                    stringBuilder.append("review image fail. uri=");
                    stringBuilder.append(uri);
                    Log.e(str, stringBuilder.toString(), e2);
                }
            }
            return;
        }
        String str2 = TAG;
        StringBuilder stringBuilder2 = new StringBuilder();
        stringBuilder2.append("Uri invalid. uri=");
        stringBuilder2.append(uri);
        Log.e(str2, stringBuilder2.toString());
    }

    public static void dumpRect(RectF rectF, String str) {
        String str2 = TAG;
        StringBuilder stringBuilder = new StringBuilder();
        stringBuilder.append(str);
        stringBuilder.append("=(");
        stringBuilder.append(rectF.left);
        stringBuilder.append(",");
        stringBuilder.append(rectF.top);
        stringBuilder.append(",");
        stringBuilder.append(rectF.right);
        stringBuilder.append(",");
        stringBuilder.append(rectF.bottom);
        stringBuilder.append(")");
        Log.v(str2, stringBuilder.toString());
    }

    public static void rectFToRect(RectF rectF, Rect rect) {
        rect.left = Math.round(rectF.left);
        rect.top = Math.round(rectF.top);
        rect.right = Math.round(rectF.right);
        rect.bottom = Math.round(rectF.bottom);
    }

    public static void prepareMatrix(Matrix matrix, boolean z, int i, int i2, int i3, int i4, int i5, int i6, int i7) {
        matrix.setScale(z ? -1.0f : 1.0f, 1.0f);
        matrix.postRotate((float) i);
        if (i == 90 || i == 270) {
            matrix.postScale(((float) i2) / ((float) i7), ((float) i3) / ((float) i6));
        } else {
            matrix.postScale(((float) i2) / ((float) i6), ((float) i3) / ((float) i7));
        }
        matrix.postTranslate((float) i4, (float) i5);
    }

    public static void scaleCamera2Matrix(Matrix matrix, Rect rect, float f) {
        matrix.postScale(f, f);
        matrix.preTranslate(((float) (-rect.width())) / 2.0f, ((float) (-rect.height())) / 2.0f);
    }

    public static String dumpMatrix(float[] fArr) {
        int length = fArr.length;
        StringBuilder stringBuilder = new StringBuilder("[");
        for (int i = 0; i < length; i++) {
            stringBuilder.append(String.format("%f", new Object[]{Float.valueOf(fArr[i])}));
            if (i != length - 1) {
                stringBuilder.append(" ");
            }
        }
        stringBuilder.append("]");
        return stringBuilder.toString();
    }

    public static ByteBuffer dumpToBitmap(int i, int i2, int i3, int i4, String str) {
        Buffer allocate = ByteBuffer.allocate(((i3 - i) * (i4 - i2)) * 4);
        GLES20.glReadPixels(i, i2, i3, i4, 6408, 5121, allocate);
        if (allocate != null) {
            StringBuilder stringBuilder = new StringBuilder();
            stringBuilder.append("tex_");
            stringBuilder.append(createJpegName(System.currentTimeMillis()));
            stringBuilder.append(str);
            String generateFilepath = Storage.generateFilepath(stringBuilder.toString(), Storage.JPEG_SUFFIX);
            saveBitmap(allocate, i3, i4, Config.ARGB_8888, generateFilepath);
            String str2 = TAG;
            StringBuilder stringBuilder2 = new StringBuilder();
            stringBuilder2.append("dump to ");
            stringBuilder2.append(generateFilepath);
            Log.d(str2, stringBuilder2.toString());
        }
        allocate.rewind();
        return allocate;
    }

    public static String createJpegName(long j) {
        String generateName;
        synchronized (sImageFileNamer) {
            generateName = sImageFileNamer.generateName(j);
        }
        return generateName;
    }

    public static String getFileTitleFromPath(String str) {
        if (TextUtils.isEmpty(str)) {
            return null;
        }
        int lastIndexOf = str.lastIndexOf("/");
        if (lastIndexOf < 0 || lastIndexOf >= str.length() - 1) {
            return null;
        }
        str = str.substring(lastIndexOf + 1);
        if (TextUtils.isEmpty(str)) {
            return null;
        }
        lastIndexOf = str.indexOf(".");
        if (lastIndexOf >= 0) {
            str = str.substring(0, lastIndexOf);
        }
        return str;
    }

    public static void broadcastNewPicture(Context context, Uri uri) {
        if (VERSION.SDK_INT < 24) {
            context.sendBroadcast(new Intent("android.hardware.action.NEW_PICTURE", uri));
            context.sendBroadcast(new Intent("com.android.camera.NEW_PICTURE", uri));
        }
    }

    public static void broadcastKillService(Context context) {
        long elapsedRealtime = SystemClock.elapsedRealtime();
        CameraSettings.setBroadcastKillServiceTime(elapsedRealtime);
        Intent intent = new Intent(ACTION_KILL_CAMERA_SERVICE);
        intent.putExtra("time", elapsedRealtime + FragmentTopAlert.HINT_DELAY_TIME);
        intent.putExtra("process_name", new String[]{"android.hardware.camera.provider@2.4-service"});
        context.sendBroadcast(intent);
        CameraStatUtil.trackBroadcastKillService();
    }

    public static void fadeIn(View view, int i) {
        if (view != null && view.getVisibility() != 0) {
            view.setVisibility(0);
            Animation alphaAnimation = new AlphaAnimation(0.0f, 1.0f);
            alphaAnimation.setDuration((long) i);
            view.clearAnimation();
            view.startAnimation(alphaAnimation);
        }
    }

    public static void fadeIn(View view) {
        fadeIn(view, 400);
    }

    public static void fadeOut(View view, int i) {
        if (view != null && view.getVisibility() == 0) {
            Animation alphaAnimation = new AlphaAnimation(1.0f, 0.0f);
            alphaAnimation.setDuration((long) i);
            view.clearAnimation();
            view.startAnimation(alphaAnimation);
            view.setVisibility(8);
        }
    }

    public static void fadeOut(View view) {
        fadeOut(view, 400);
    }

    public static int getJpegRotation(int i, int i2) {
        CameraCapabilities capabilities = Camera2DataContainer.getInstance().getCapabilities(i);
        int sensorOrientation = capabilities.getSensorOrientation();
        if (i2 == -1) {
            return sensorOrientation;
        }
        if (capabilities.getFacing() == 0) {
            return ((sensorOrientation - i2) + 360) % 360;
        }
        return (sensorOrientation + i2) % 360;
    }

    public static void enterLightsOutMode(Window window) {
        LayoutParams attributes = window.getAttributes();
        attributes.systemUiVisibility |= 1;
        window.setAttributes(attributes);
    }

    public static <T> int getArrayIndex(T[] tArr, T t) {
        if (tArr == null) {
            return -1;
        }
        int length = tArr.length;
        int i = 0;
        int i2 = 0;
        while (i < length) {
            if (Objects.equals(tArr[i], t)) {
                return i2;
            }
            i2++;
            i++;
        }
        return -1;
    }

    public static int getArrayIndex(int[] iArr, int i) {
        if (iArr == null) {
            return -1;
        }
        for (int i2 = 0; i2 < iArr.length; i2++) {
            if (iArr[i2] == i) {
                return i2;
            }
        }
        return -1;
    }

    public static boolean isSupported(String str, List<String> list) {
        return list != null && list.indexOf(str) >= 0;
    }

    public static <T> boolean isSupported(T t, T[] tArr) {
        return getArrayIndex((Object[]) tArr, (Object) t) != -1;
    }

    public static boolean isSupported(int i, int[] iArr) {
        return getArrayIndex(iArr, i) != -1;
    }

    public static boolean isLayoutRTL(Context context) {
        boolean z = false;
        if (context == null) {
            return false;
        }
        if (context.getResources().getConfiguration().getLayoutDirection() == 1) {
            z = true;
        }
        return z;
    }

    public static boolean isExternalStorageMounted() {
        return "mounted".equals(Environment.getExternalStorageState());
    }

    public static File getStorageDirectory() {
        return isExternalStorageMounted() ? Environment.getExternalStorageDirectory() : INTERNAL_STORAGE_DIRECTORY;
    }

    public static boolean mkdirs(File file, int i, int i2, int i3) {
        if (file.exists()) {
            return false;
        }
        String parent = file.getParent();
        if (parent != null) {
            mkdirs(new File(parent), i, i2, i3);
        }
        return file.mkdir();
    }

    public static boolean createFile(File file) {
        if (file.exists()) {
            return false;
        }
        String parent = file.getParent();
        if (parent != null) {
            mkdirs(new File(parent), 511, -1, -1);
        }
        try {
            file.createNewFile();
        } catch (IOException e) {
        }
        return true;
    }

    public static boolean isTimeout(long j, long j2, long j3) {
        return j < j2 || j - j2 > j3;
    }

    public static Typeface getMiuiTypeface(Context context) {
        return getTypeface(context, "fonts/MIUI_Normal.ttf");
    }

    public static Typeface getMiuiBoldTypeface(Context context) {
        return getTypeface(context, "fonts/MIUI_Bold.ttf");
    }

    public static Typeface getMFYueYuanTypeface(Context context) {
        return getTypeface(context, "fonts/MFYueYuan-Regular.ttf");
    }

    public static Typeface getLanTineGBTypeface(Context context) {
        return getTypeface(context, "fonts/MI+LanTing_GB+Outside+YS_V2.3_20160322.ttf");
    }

    public static Typeface getMiuiTimeTypeface(Context context) {
        return getTypeface(context, "fonts/MIUI_Time.ttf");
    }

    private static synchronized Typeface getTypeface(Context context, String str) {
        Typeface typeface;
        synchronized (Util.class) {
            if (!sTypefaces.containsKey(str)) {
                sTypefaces.put(str, Typeface.createFromAsset(context.getAssets(), str));
            }
            typeface = (Typeface) sTypefaces.get(str);
        }
        return typeface;
    }

    public static boolean isProduceFocusInfoSuccess(byte[] bArr) {
        return bArr != null && 25 < bArr.length && bArr[bArr.length - 25] == (byte) 0;
    }

    public static int getCenterFocusDepthIndex(byte[] bArr, int i, int i2) {
        int i3 = 1;
        if (bArr == null || bArr.length < 25) {
            return 1;
        }
        int length = bArr.length - 25;
        int i4 = length + 1;
        if (bArr[length] != (byte) 0) {
            return 1;
        }
        length = i4 + 1;
        int i5 = length + 1;
        length = ((bArr[length] & 255) << 16) | ((bArr[i4] & 255) << 24);
        i4 = i5 + 1;
        length |= (bArr[i5] & 255) << 8;
        i5 = i4 + 1;
        length |= bArr[i4] & 255;
        i4 = i5 + 1;
        int i6 = i4 + 1;
        i4 = ((((bArr[i4] & 255) << 16) | ((bArr[i5] & 255) << 24)) | ((bArr[i6] & 255) << 8)) | (bArr[i6 + 1] & 255);
        Resources resources = CameraAppImpl.getAndroidContext().getResources();
        i6 = resources.getDimensionPixelSize(R.dimen.focus_area_width);
        i6 = (i6 * length) / sWindowWidth;
        i = (int) (((float) (resources.getDimensionPixelSize(R.dimen.focus_area_height) * i4)) / ((((float) sWindowWidth) * ((float) i2)) / ((float) i)));
        int[] iArr = new int[5];
        int i7 = 0;
        int i8 = (i4 - i) / 2;
        i4 = 0;
        while (i4 < i) {
            int i9 = i8 + 1;
            int i10 = (i8 * length) + ((length - i6) / 2);
            i8 = 0;
            while (i8 < i6) {
                int i11 = i10 + 1;
                byte b = bArr[i10];
                iArr[b] = iArr[b] + 1;
                i8++;
                i10 = i11;
            }
            i4++;
            i8 = i9;
        }
        while (i3 < 5) {
            if (iArr[i7] < iArr[i3]) {
                i7 = i3;
            }
            i3++;
        }
        return i7;
    }

    public static void expandViewTouchDelegate(View view) {
        if (view.isShown()) {
            Rect rect = new Rect();
            view.getHitRect(rect);
            int dpToPixel = dpToPixel(10.0f);
            rect.top -= dpToPixel;
            rect.bottom += dpToPixel;
            rect.left -= dpToPixel;
            rect.right += dpToPixel;
            TouchDelegate touchDelegate = new TouchDelegate(rect, view);
            if (View.class.isInstance(view.getParent())) {
                ((View) view.getParent()).setTouchDelegate(touchDelegate);
            }
        } else if (View.class.isInstance(view.getParent())) {
            ((View) view.getParent()).setTouchDelegate(null);
        }
    }

    public static String getTimeWatermark() {
        return getTimeWatermark(b.fR());
    }

    public static String getTimeWatermark(boolean z) {
        StringBuilder stringBuilder = new StringBuilder();
        if (z) {
            stringBuilder.append(new SimpleDateFormat("yyyy/M/d", Locale.ENGLISH).format(new Date()).toCharArray());
        } else {
            stringBuilder.append(new SimpleDateFormat("yyyy-M-d", Locale.ENGLISH).format(new Date()).toCharArray());
        }
        stringBuilder.append(" ");
        new Time().set(System.currentTimeMillis());
        stringBuilder.append(String.format(Locale.ENGLISH, "%02d", new Object[]{Integer.valueOf(r7.hour)}));
        stringBuilder.append(":");
        stringBuilder.append(String.format(Locale.ENGLISH, "%02d", new Object[]{Integer.valueOf(r7.minute)}));
        return stringBuilder.toString();
    }

    public static Method getMethod(Class<?>[] clsArr, String str, String str2) {
        Method method = null;
        if (clsArr != null) {
            try {
                if (clsArr.length == 1) {
                    method = Method.of(clsArr[0], str, str2);
                }
            } catch (NoSuchMethodException e) {
                if (clsArr[0].getSuperclass() != null) {
                    clsArr[0] = clsArr[0].getSuperclass();
                    method = getMethod(clsArr, str, str2);
                }
            }
        }
        if (method == null) {
            String str3 = TAG;
            StringBuilder stringBuilder = new StringBuilder();
            stringBuilder.append("getMethod fail, ");
            stringBuilder.append(str);
            stringBuilder.append("[");
            stringBuilder.append(str2);
            stringBuilder.append("]");
            Log.e(str3, stringBuilder.toString());
        }
        return method;
    }

    public static int safeDelete(Uri uri, String str, String[] strArr) {
        int delete;
        Exception e;
        try {
            delete = CameraAppImpl.getAndroidContext().getContentResolver().delete(uri, str, strArr);
            try {
                String str2 = TAG;
                StringBuilder stringBuilder = new StringBuilder();
                stringBuilder.append("safeDelete url=");
                stringBuilder.append(uri);
                stringBuilder.append(" where=");
                stringBuilder.append(str);
                stringBuilder.append(" selectionArgs=");
                stringBuilder.append(strArr);
                stringBuilder.append(" result=");
                stringBuilder.append(delete);
                Log.v(str2, stringBuilder.toString());
            } catch (Exception e2) {
                e = e2;
            }
        } catch (Exception e3) {
            e = e3;
            delete = -1;
            e.printStackTrace();
            return delete;
        }
        return delete;
    }

    public static boolean isShowPreviewDebugInfo() {
        return "1".equals(SystemProperties.get("camera.preview.enable.log"));
    }

    public static boolean isShowAfRegionView() {
        return "1".equals(SystemProperties.get("camera.preview.debug.afRegion_view"));
    }

    public static String getDebugInformation(CaptureResult captureResult) {
        StringBuilder stringBuilder;
        StringBuilder stringBuilder2;
        StringBuilder stringBuilder3 = new StringBuilder();
        AECFrameControl aECFrameControl = CaptureResultParser.getAECFrameControl(captureResult);
        AFFrameControl aFFrameControl = CaptureResultParser.getAFFrameControl(captureResult);
        int i = 0;
        if (!(!"1".equals(SystemProperties.get("camera.preview.debug.show_shortGain")) || aECFrameControl == null || aECFrameControl.getAecExposureDatas() == null)) {
            stringBuilder = new StringBuilder();
            stringBuilder.append("short gain : ");
            stringBuilder.append(aECFrameControl.getAecExposureDatas()[0].getLinearGain());
            stringBuilder3.append(addDebugInfo(stringBuilder.toString()));
        }
        if (!(!"1".equals(SystemProperties.get("camera.preview.debug.show_adrcGain")) || aECFrameControl == null || aECFrameControl.getAecExposureDatas() == null)) {
            stringBuilder = new StringBuilder();
            stringBuilder.append("adrc gain : ");
            stringBuilder.append(aECFrameControl.getAecExposureDatas()[2].getSensitivity() / aECFrameControl.getAecExposureDatas()[0].getSensitivity());
            stringBuilder3.append(addDebugInfo(stringBuilder.toString()));
        }
        if ("1".equals(SystemProperties.get("camera.preview.debug.show_afRegion"))) {
            MeteringRectangle[] meteringRectangleArr = (MeteringRectangle[]) captureResult.get(CaptureResult.CONTROL_AF_REGIONS);
            if (meteringRectangleArr != null) {
                stringBuilder = new StringBuilder();
                stringBuilder.append("af region : ");
                stringBuilder.append(meteringRectangleArr[0].getRect().toString());
                stringBuilder3.append(addDebugInfo(stringBuilder.toString()));
            }
        }
        if ("1".equals(SystemProperties.get("camera.preview.debug.show_afMode"))) {
            stringBuilder2 = new StringBuilder();
            stringBuilder2.append("af mode : ");
            stringBuilder2.append(captureResult.get(CaptureResult.CONTROL_AF_MODE));
            stringBuilder3.append(addDebugInfo(stringBuilder2.toString()));
        }
        if ("1".equals(SystemProperties.get("camera.preview.debug.show_afStatus"))) {
            stringBuilder2 = new StringBuilder();
            stringBuilder2.append("af state : ");
            stringBuilder2.append(captureResult.get(CaptureResult.CONTROL_AF_STATE));
            stringBuilder3.append(addDebugInfo(stringBuilder2.toString()));
        }
        if ("1".equals(SystemProperties.get("camera.preview.debug.show_afLensPosition")) && aFFrameControl != null) {
            String str = "";
            if (aFFrameControl.getUseDACValue() == 0) {
                stringBuilder2 = new StringBuilder();
                stringBuilder2.append(aFFrameControl.getTargetLensPosition());
                stringBuilder2.append("");
                str = stringBuilder2.toString();
            }
            stringBuilder = new StringBuilder();
            stringBuilder.append("af lens position : ");
            stringBuilder.append(str);
            stringBuilder3.append(addDebugInfo(stringBuilder.toString()));
        }
        if ("1".equals(SystemProperties.get("camera.preview.debug.show_distance")) && captureResult.get(CaptureResult.LENS_FOCUS_DISTANCE) != null) {
            float floatValue = ((Float) captureResult.get(CaptureResult.LENS_FOCUS_DISTANCE)).floatValue();
            stringBuilder2 = new StringBuilder();
            stringBuilder2.append("distance : ");
            stringBuilder2.append(floatValue);
            stringBuilder3.append(addDebugInfo(stringBuilder2.toString()));
            stringBuilder2 = new StringBuilder();
            stringBuilder2.append("distance(m) : ");
            stringBuilder2.append(1.0f / floatValue);
            stringBuilder3.append(addDebugInfo(stringBuilder2.toString()));
        }
        if ("1".equals(SystemProperties.get("camera.preview.debug.show_gyro")) && aFFrameControl != null) {
            while (i < aFFrameControl.getAFGyroData().getSampleCount()) {
                StringBuilder stringBuilder4 = new StringBuilder();
                stringBuilder4.append("gyro : x: ");
                stringBuilder4.append(aFFrameControl.getAFGyroData().getpAngularVelocityX()[i]);
                stringBuilder4.append(", y: ");
                stringBuilder4.append(aFFrameControl.getAFGyroData().getpAngularVelocityY()[i]);
                stringBuilder4.append(", z: ");
                stringBuilder4.append(aFFrameControl.getAFGyroData().getpAngularVelocityZ()[i]);
                stringBuilder3.append(addDebugInfo(stringBuilder4.toString()));
                i++;
            }
        }
        return stringBuilder3.toString();
    }

    public static boolean isShowDebugInfo() {
        return "1".equals(SystemProperties.get("persist.camera.enable.log")) || "1".equals(SystemProperties.get("persist.camera.debug.show_af")) || "1".equals(SystemProperties.get("persist.camera.debug.show_awb")) || "1".equals(SystemProperties.get("persist.camera.debug.show_aec")) || "1".equals(SystemProperties.get("persist.camera.debug.autoscene")) || "1".equals(SystemProperties.get("persist.camera.debug.hht"));
    }

    public static String getDebugInfo() {
        StringBuilder stringBuilder = new StringBuilder();
        if ("1".equals(SystemProperties.get("persist.camera.debug.show_af")) || "1".equals(SystemProperties.get("persist.camera.debug.enable"))) {
            stringBuilder.append(addProperties("persist.camera.debug.param0"));
            stringBuilder.append(addProperties("persist.camera.debug.param1"));
            stringBuilder.append(addProperties("persist.camera.debug.param2"));
            stringBuilder.append(addProperties("persist.camera.debug.param3"));
            stringBuilder.append(addProperties("persist.camera.debug.param4"));
            stringBuilder.append(addProperties("persist.camera.debug.param5"));
            stringBuilder.append(addProperties("persist.camera.debug.param6"));
            stringBuilder.append(addProperties("persist.camera.debug.param7"));
            stringBuilder.append(addProperties("persist.camera.debug.param8"));
            stringBuilder.append(addProperties("persist.camera.debug.param9"));
        }
        if ("1".equals(SystemProperties.get("persist.camera.debug.show_awb"))) {
            stringBuilder.append(addProperties("persist.camera.debug.param10"));
            stringBuilder.append(addProperties("persist.camera.debug.param11"));
            stringBuilder.append(addProperties("persist.camera.debug.param12"));
            stringBuilder.append(addProperties("persist.camera.debug.param13"));
            stringBuilder.append(addProperties("persist.camera.debug.param14"));
            stringBuilder.append(addProperties("persist.camera.debug.param15"));
            stringBuilder.append(addProperties("persist.camera.debug.param16"));
            stringBuilder.append(addProperties("persist.camera.debug.param17"));
            stringBuilder.append(addProperties("persist.camera.debug.param18"));
            stringBuilder.append(addProperties("persist.camera.debug.param19"));
        }
        if ("1".equals(SystemProperties.get("persist.camera.debug.show_aec"))) {
            stringBuilder.append(addProperties("persist.camera.debug.param20"));
            stringBuilder.append(addProperties("persist.camera.debug.param21"));
            stringBuilder.append(addProperties("persist.camera.debug.param22"));
            stringBuilder.append(addProperties("persist.camera.debug.param23"));
            stringBuilder.append(addProperties("persist.camera.debug.param24"));
            stringBuilder.append(addProperties("persist.camera.debug.param25"));
            stringBuilder.append(addProperties("persist.camera.debug.param26"));
            stringBuilder.append(addProperties("persist.camera.debug.param27"));
            stringBuilder.append(addProperties("persist.camera.debug.param28"));
            stringBuilder.append(addProperties("persist.camera.debug.param29"));
        }
        stringBuilder.append(addProperties("persist.camera.debug.checkerf"));
        stringBuilder.append(addProperties("persist.camera.debug.fc"));
        if ("1".equals(SystemProperties.get("persist.camera.debug.hht"))) {
            stringBuilder.append(addProperties("camera.debug.hht.luma"));
        }
        if ("1".equals(SystemProperties.get("persist.camera.debug.autoscene"))) {
            stringBuilder.append(addProperties("camera.debug.hht.iso"));
        }
        return stringBuilder.toString();
    }

    private static String addProperties(String str) {
        String str2 = "";
        if (SystemProperties.get(str) == null) {
            return str2;
        }
        StringBuilder stringBuilder = new StringBuilder();
        stringBuilder.append("\t ");
        stringBuilder.append(SystemProperties.get(str));
        str = stringBuilder.toString();
        stringBuilder = new StringBuilder();
        stringBuilder.append(str);
        stringBuilder.append("\n");
        return stringBuilder.toString();
    }

    private static String addDebugInfo(String str) {
        String str2 = "";
        if (str == null) {
            return str2;
        }
        StringBuilder stringBuilder = new StringBuilder();
        stringBuilder.append("\t ");
        stringBuilder.append(str);
        str = stringBuilder.toString();
        stringBuilder = new StringBuilder();
        stringBuilder.append(str);
        stringBuilder.append("\n");
        return stringBuilder.toString();
    }

    public static int getIntField(String str, Object obj, String str2, String str3) {
        try {
            return Field.of(str, str2, str3).getInt(obj);
        } catch (NoSuchClassException e) {
            str2 = TAG;
            StringBuilder stringBuilder = new StringBuilder();
            stringBuilder.append("no class ");
            stringBuilder.append(str);
            Log.e(str2, stringBuilder.toString(), e);
            return Integer.MIN_VALUE;
        } catch (NoSuchFieldException e2) {
            Log.e(TAG, "no field ", e2);
            return Integer.MIN_VALUE;
        }
    }

    public static double getScreenInches(Context context) {
        DisplayMetrics displayMetrics = new DisplayMetrics();
        ((WindowManager) context.getSystemService("window")).getDefaultDisplay().getMetrics(displayMetrics);
        double sqrt = Math.sqrt(Math.pow((double) (((float) sWindowWidth) / displayMetrics.xdpi), 2.0d) + Math.pow((double) (((float) sWindowHeight) / displayMetrics.ydpi), 2.0d));
        String str = TAG;
        StringBuilder stringBuilder = new StringBuilder();
        stringBuilder.append("getScreenInches=");
        stringBuilder.append(sqrt);
        Log.d(str, stringBuilder.toString());
        return sqrt;
    }

    public static boolean isContains(RectF rectF, RectF rectF2) {
        boolean z = false;
        if (rectF == null || rectF2 == null) {
            return false;
        }
        if (rectF.left < rectF.right && rectF.top < rectF.bottom && rectF.left <= rectF2.left && rectF.top <= rectF2.top && rectF.right >= rectF2.right && rectF.bottom >= rectF2.bottom) {
            z = true;
        }
        return z;
    }

    public static boolean isStringValueContained(Object obj, int i) {
        return isStringValueContained(obj, CameraAppImpl.getAndroidContext().getResources().getStringArray(i));
    }

    public static boolean isStringValueContained(Object obj, CharSequence[] charSequenceArr) {
        if (charSequenceArr == null || obj == null) {
            return false;
        }
        for (Object equals : charSequenceArr) {
            if (equals.equals(obj)) {
                return true;
            }
        }
        return false;
    }

    public static boolean isStringValueContained(Object obj, List<? extends CharSequence> list) {
        if (list == null || obj == null) {
            return false;
        }
        for (CharSequence equals : list) {
            if (equals.equals(obj)) {
                return true;
            }
        }
        return false;
    }

    public static int getNavigationBarHeight(Context context) {
        Resources resources = context.getResources();
        int dimensionPixelSize = resources.getDimensionPixelSize(resources.getIdentifier("navigation_bar_height", "dimen", "android"));
        String str = TAG;
        StringBuilder stringBuilder = new StringBuilder();
        stringBuilder.append("navBarHeight=");
        stringBuilder.append(dimensionPixelSize);
        Log.v(str, stringBuilder.toString());
        return dimensionPixelSize;
    }

    public static int calcNavigationBarHeight(Context context) {
        int dimensionPixelSize = context.getResources().getDimensionPixelSize(R.dimen.top_control_panel_height);
        int i = sWindowHeight - ((sWindowWidth * 16) / 9);
        if (i > 0) {
            i -= dimensionPixelSize;
        } else {
            i = 0;
        }
        String str = TAG;
        StringBuilder stringBuilder = new StringBuilder();
        stringBuilder.append("calculate navBarHeight=");
        stringBuilder.append(i);
        Log.d(str, stringBuilder.toString());
        return i;
    }

    public static int getStatusBarHeight(Context context) {
        int dimensionPixelSize;
        int identifier = context.getResources().getIdentifier("status_bar_height", "dimen", "android");
        if (identifier > 0) {
            dimensionPixelSize = context.getResources().getDimensionPixelSize(identifier);
        } else {
            dimensionPixelSize = 0;
        }
        String str = TAG;
        StringBuilder stringBuilder = new StringBuilder();
        stringBuilder.append("StatusBarHeight=");
        stringBuilder.append(dimensionPixelSize);
        Log.v(str, stringBuilder.toString());
        return dimensionPixelSize;
    }

    public static boolean checkDeviceHasNavigationBar(Context context) {
        if (sWindowManager == null) {
            sWindowManager = Stub.asInterface(ServiceManager.getService("window"));
            try {
                sHasNavigationBar = sWindowManager.hasNavigationBar();
            } catch (Exception e) {
                Log.e(TAG, "checkDeviceHasNavigationBar exception");
            }
        }
        return sHasNavigationBar;
    }

    public static boolean isInVideoCall(Activity activity) {
        if (b.fZ() && PermissionManager.checkPhoneStatePermission(activity)) {
            return CompatibilityUtils.isInVideoCall(activity);
        }
        return false;
    }

    public static boolean isFingerPrintKeyEvent(KeyEvent keyEvent) {
        return keyEvent != null && 27 == keyEvent.getKeyCode() && keyEvent.getDevice() != null && b.hd().contains(keyEvent.getDevice().getName());
    }

    public static boolean isMemoryRich(Context context) {
        ActivityManager activityManager = (ActivityManager) context.getSystemService("activity");
        MemoryInfo memoryInfo = new MemoryInfo();
        activityManager.getMemoryInfo(memoryInfo);
        return memoryInfo.availMem > 419430400;
    }

    public static <T> int binarySearchRightMost(List<? extends Comparable<? super T>> list, T t) {
        int size = list.size() - 1;
        int i = 0;
        while (i <= size) {
            int i2 = (i + size) / 2;
            if (((Comparable) list.get(i2)).compareTo(t) >= 0) {
                size = i2 - 1;
            } else {
                i = i2 + 1;
            }
        }
        return i;
    }

    public static boolean isForceNameSuffix() {
        if (sIsForceNameSuffix == null) {
            sIsForceNameSuffix = Boolean.valueOf(new File(Storage.generatePrimaryFilepath(FORCE_NAME_SUFFIX_FILE)).exists());
        }
        return sIsForceNameSuffix.booleanValue();
    }

    public static boolean isLabOptionsVisible() {
        if (sIsLabOptionsVisible == null) {
            sIsLabOptionsVisible = Boolean.valueOf(new File(Storage.generatePrimaryFilepath(LAB_OPTIONS_VISIBLE_FILE)).exists());
        }
        return sIsLabOptionsVisible.booleanValue();
    }

    public static Rect getDisplayRect(Context context) {
        return getDisplayRect(context, DataRepository.dataItemRunning().getUiStyle());
    }

    public static Rect getDisplayRect(Context context, int i) {
        int bottomHeight;
        if (i == 0) {
            i = (int) (((float) (sWindowWidth * 4)) / 3.0f);
            bottomHeight = (sWindowHeight - i) - getBottomHeight(context.getResources());
        } else if (i != 3) {
            i = (int) (((float) (sWindowWidth * 16)) / 9.0f);
            if (isLongRatioScreen) {
                bottomHeight = (sWindowHeight - ((int) (((float) (sWindowWidth * 4)) / 3.0f))) - getBottomHeight(context.getResources());
            } else {
                bottomHeight = (sWindowHeight - i) - sNavigationBarHeight;
            }
        } else {
            i = sWindowHeight;
            bottomHeight = sStatusBarHeight;
        }
        if (bottomHeight <= 2) {
            bottomHeight = 0;
        }
        return new Rect(0, bottomHeight, sWindowWidth, i + bottomHeight);
    }

    public static int getBottomHeight(Resources resources) {
        int dimensionPixelSize = resources.getDimensionPixelSize(R.dimen.bottom_control_height);
        if (isNotchDevice && sIsFullScreenNavBarHidden) {
            return dimensionPixelSize - sFullScreenExtraMargin;
        }
        return dimensionPixelSize;
    }

    public static int getDialogTopMargin(int i) {
        if (isNotchDevice) {
            return i - sStatusBarHeight;
        }
        return i;
    }

    public static boolean isFullScreenNavBarHidden(Context context) {
        return Global.getBoolean(context.getContentResolver(), "force_fsg_nav_bar");
    }

    public static boolean isPackageAvailable(Context context, String str) {
        if (context == null || str == null || str.isEmpty()) {
            String str2 = TAG;
            StringBuilder stringBuilder = new StringBuilder();
            stringBuilder.append("invalid params. packageName=");
            stringBuilder.append(str);
            Log.w(str2, stringBuilder.toString());
            return false;
        }
        try {
            int applicationEnabledSetting = context.getPackageManager().getApplicationEnabledSetting(str);
            boolean z = true;
            if (!(applicationEnabledSetting == 0 || applicationEnabledSetting == 1)) {
                z = false;
            }
            return z;
        } catch (IllegalArgumentException e) {
            Log.e(TAG, e.getMessage());
            return false;
        } catch (NullPointerException e2) {
            Log.e(TAG, e2.getMessage());
            return false;
        }
    }

    public static void installPackage(Context context, String str, PackageInstallerListener packageInstallerListener, boolean z, boolean z2) {
        if (context == null || TextUtils.isEmpty(str)) {
            String str2 = TAG;
            StringBuilder stringBuilder = new StringBuilder();
            stringBuilder.append("invalid params. pkgName=");
            stringBuilder.append(str);
            Log.w(str2, stringBuilder.toString());
            return;
        }
        try {
            Object packageInstallObserver = CompatibilityUtils.getPackageInstallObserver(packageInstallerListener);
            Class cls = Class.forName("miui.content.pm.PreloadedAppPolicy");
            Method of = Method.of(cls, "installPreloadedDataApp", CompatibilityUtils.getInstallMethodDescription());
            int i = z ? 1 : z2 ? 2 : 0;
            boolean invokeBoolean = of.invokeBoolean(cls, null, new Object[]{context, str, packageInstallObserver, Integer.valueOf(i)});
            String str3 = TAG;
            StringBuilder stringBuilder2 = new StringBuilder();
            stringBuilder2.append("installPackage: result=");
            stringBuilder2.append(invokeBoolean);
            Log.d(str3, stringBuilder2.toString());
        } catch (Throwable e) {
            Log.e(TAG, e.getMessage(), e);
            if (packageInstallerListener != null) {
                packageInstallerListener.onPackageInstalled(str, false);
            }
        }
    }

    public static final int calculateDefaultPreviewEdgeSlop(Context context) {
        int i;
        DisplayMetrics displayMetrics = context.getResources().getDisplayMetrics();
        float f = ((float) displayMetrics.widthPixels) / displayMetrics.xdpi;
        float f2 = ((float) displayMetrics.heightPixels) / displayMetrics.ydpi;
        if (((float) Math.sqrt((double) ((f * f) + (f2 * f2)))) < 5.0f) {
            i = R.dimen.preview_edge_touch_slop_small_screen;
        } else {
            i = R.dimen.preview_edge_touch_slop;
        }
        return context.getResources().getDimensionPixelSize(i);
    }

    public static final boolean isAppLocked(Context context, String str) {
        boolean z = false;
        if (!(Secure.getInt(context.getContentResolver(), "access_control_lock_enabled", -1) == 1)) {
            return false;
        }
        SecurityManager securityManager = (SecurityManager) context.getSystemService("security");
        boolean applicationAccessControlEnabled = securityManager.getApplicationAccessControlEnabled(str);
        boolean checkAccessControlPass = securityManager.checkAccessControlPass(str);
        if (applicationAccessControlEnabled && !checkAccessControlPass) {
            z = true;
        }
        return z;
    }

    public static SpannableStringBuilder appendInApi26(SpannableStringBuilder spannableStringBuilder, CharSequence charSequence, Object obj, int i) {
        int length = spannableStringBuilder.length();
        spannableStringBuilder.append(charSequence);
        spannableStringBuilder.setSpan(obj, length, spannableStringBuilder.length(), i);
        return spannableStringBuilder;
    }

    public static void reverseAnimatorSet(AnimatorSet animatorSet) {
        Iterator it = animatorSet.getChildAnimations().iterator();
        while (it.hasNext()) {
            Animator animator = (Animator) it.next();
            if (animator instanceof ValueAnimator) {
                ((ValueAnimator) animator).reverse();
            } else if (animator instanceof AnimatorSet) {
                reverseAnimatorSet((AnimatorSet) animator);
            }
        }
    }

    public static boolean isDebugOsBuild() {
        return "userdebug".equals(android.os.Build.TYPE) || "eng".equals(android.os.Build.TYPE) || sIsDumpLog;
    }

    public static int stringSparseArraysIndexOf(SparseArray<String> sparseArray, String str) {
        if (str != null) {
            for (int i = 0; i < sparseArray.size(); i++) {
                if (str.equals(sparseArray.valueAt(i))) {
                    return i;
                }
            }
        }
        return -1;
    }

    public static boolean isPathExist(String str) {
        return !TextUtils.isEmpty(str) && new File(str).exists();
    }

    public static ExifInterface getExif(byte[] bArr) {
        ExifInterface exifInterface = new ExifInterface();
        try {
            exifInterface.readExif(bArr);
        } catch (IOException e) {
            Log.d(TAG, e.getMessage());
        }
        return exifInterface;
    }

    public static ExifInterface getExif(String str) {
        ExifInterface exifInterface = new ExifInterface();
        try {
            exifInterface.readExif(str);
        } catch (IOException e) {
            Log.d(TAG, e.getMessage());
        }
        return exifInterface;
    }

    public static boolean isZoomAnimationEnabled() {
        return SystemProperties.getBoolean(ZOOM_ANIMATION_PROPERTY, DataRepository.dataItemFeature().fn() ^ 1);
    }

    public static boolean isNonUI() {
        return SystemProperties.getBoolean(NONUI_MODE_PROPERTY, false);
    }

    public static boolean isNonUIEnabled() {
        return SystemProperties.get(NONUI_MODE_PROPERTY).equals("") ^ 1;
    }

    public static int getChildMeasureWidth(View view) {
        MarginLayoutParams marginLayoutParams = (MarginLayoutParams) view.getLayoutParams();
        int i = marginLayoutParams.leftMargin + marginLayoutParams.rightMargin;
        int measuredWidth = view.getMeasuredWidth();
        if (measuredWidth > 0) {
            return measuredWidth + i;
        }
        measuredWidth = MeasureSpec.makeMeasureSpec(0, 0);
        view.measure(measuredWidth, measuredWidth);
        return view.getMeasuredWidth() + i;
    }

    public static String join(String str, List<String> list) {
        StringBuffer stringBuffer = new StringBuffer();
        for (int i = 0; i < list.size(); i++) {
            if (i == list.size() - 1) {
                stringBuffer.append((String) list.get(i));
            } else {
                stringBuffer.append((String) list.get(i));
                stringBuffer.append(str);
            }
        }
        return stringBuffer.toString();
    }

    public static int parseInt(String str, int i) {
        try {
            return Integer.parseInt(str);
        } catch (Throwable e) {
            Log.e(TAG, e.getMessage(), e);
            if (!isDebugOsBuild()) {
                return i;
            }
            throw e;
        }
    }

    public static void setBrightnessRampRate(int i) {
        CompatibilityUtils.setBrightnessRampRate(IPowerManager.Stub.asInterface(ServiceManager.getService("power")), i);
    }

    public static void setScreenEffect(boolean z) {
        if (b.hu()) {
            try {
                DisplayFeatureManager.getInstance().setScreenEffect(14, z);
            } catch (Throwable e) {
                Log.d(TAG, "Meet Exception when calling DisplayFeatureManager#setScreenEffect()", e);
            }
        }
    }

    private static File getColorMapXmlMapFile() {
        File file;
        if (VERSION.SDK_INT >= 26) {
            file = new File("/vendor/etc/screen_light.xml");
            if (file.exists()) {
                return file;
            }
            Log.e(TAG, "screen_light.xml do not found under /vendor/etc, roll back to /system/etc");
        }
        file = new File("/system/etc/screen_light.xml");
        if (file.exists()) {
            return file;
        }
        Log.e(TAG, "screen_light.xml do not found under /system/etc");
        return null;
    }

    /* JADX WARNING: Removed duplicated region for block: B:20:0x0040  */
    /* JADX WARNING: Removed duplicated region for block: B:28:0x007c A:{Catch:{ XmlPullParserException -> 0x0123, IOException -> 0x011a, all -> 0x010c }} */
    /* JADX WARNING: Removed duplicated region for block: B:15:0x0035 A:{ExcHandler: org.xmlpull.v1.XmlPullParserException (e org.xmlpull.v1.XmlPullParserException), Splitter: B:6:0x001c} */
    /* JADX WARNING: Removed duplicated region for block: B:20:0x0040  */
    /* JADX WARNING: Removed duplicated region for block: B:28:0x007c A:{Catch:{ XmlPullParserException -> 0x0123, IOException -> 0x011a, all -> 0x010c }} */
    /* JADX WARNING: Removed duplicated region for block: B:13:0x0032 A:{ExcHandler: org.xmlpull.v1.XmlPullParserException (e org.xmlpull.v1.XmlPullParserException), Splitter: B:8:0x0021} */
    /* JADX WARNING: Removed duplicated region for block: B:12:0x0030 A:{ExcHandler: org.xmlpull.v1.XmlPullParserException (e org.xmlpull.v1.XmlPullParserException), Splitter: B:10:0x002c} */
    /* JADX WARNING: Missing block: B:12:0x0030, code:
            r4 = e;
     */
    /* JADX WARNING: Missing block: B:13:0x0032, code:
            r4 = e;
     */
    /* JADX WARNING: Missing block: B:14:0x0033, code:
            r0 = null;
     */
    /* JADX WARNING: Missing block: B:15:0x0035, code:
            r4 = e;
     */
    /* JADX WARNING: Missing block: B:16:0x0036, code:
            r0 = null;
            r3 = r0;
     */
    /* JADX WARNING: Missing block: B:17:0x0038, code:
            r4.printStackTrace();
     */
    /* JADX WARNING: Missing block: B:47:0x0109, code:
            if ((r0 instanceof android.content.res.XmlResourceParser) == false) goto L_0x0130;
     */
    /* JADX WARNING: Missing block: B:55:0x0120, code:
            if ((r0 instanceof android.content.res.XmlResourceParser) == false) goto L_0x0130;
     */
    /* JADX WARNING: Missing block: B:58:0x0129, code:
            if ((r0 instanceof android.content.res.XmlResourceParser) == false) goto L_0x0130;
     */
    /* JADX WARNING: Missing block: B:59:0x012b, code:
            ((android.content.res.XmlResourceParser) r0).close();
     */
    /* JADX WARNING: Missing block: B:60:0x0130, code:
            return;
     */
    private static void initScreenLightColorMap() {
        /*
        r0 = COLOR_TEMPERATURE_LIST;
        r0 = r0.size();
        if (r0 > 0) goto L_0x0131;
    L_0x0008:
        r0 = COLOR_TEMPERATURE_MAP;
        r0 = r0.size();
        if (r0 <= 0) goto L_0x0012;
    L_0x0010:
        goto L_0x0131;
    L_0x0012:
        r0 = getColorMapXmlMapFile();
        r1 = 0;
        r2 = 0;
        if (r0 == 0) goto L_0x003c;
    L_0x001c:
        r3 = new java.io.FileReader;	 Catch:{ XmlPullParserException -> 0x0035, XmlPullParserException -> 0x0035 }
        r3.<init>(r0);	 Catch:{ XmlPullParserException -> 0x0035, XmlPullParserException -> 0x0035 }
        r0 = org.xmlpull.v1.XmlPullParserFactory.newInstance();	 Catch:{ XmlPullParserException -> 0x0032, XmlPullParserException -> 0x0032 }
        r0.setNamespaceAware(r2);	 Catch:{ XmlPullParserException -> 0x0032, XmlPullParserException -> 0x0032 }
        r0 = r0.newPullParser();	 Catch:{ XmlPullParserException -> 0x0032, XmlPullParserException -> 0x0032 }
        r0.setInput(r3);	 Catch:{ XmlPullParserException -> 0x0030, XmlPullParserException -> 0x0030 }
        goto L_0x003e;
    L_0x0030:
        r4 = move-exception;
        goto L_0x0038;
    L_0x0032:
        r4 = move-exception;
        r0 = r1;
        goto L_0x0038;
    L_0x0035:
        r4 = move-exception;
        r0 = r1;
        r3 = r0;
    L_0x0038:
        r4.printStackTrace();
        goto L_0x003e;
    L_0x003c:
        r0 = r1;
        r3 = r0;
    L_0x003e:
        if (r0 != 0) goto L_0x0075;
    L_0x0040:
        r0 = "CameraUtil";
        r4 = "Cannot find screen color map in system, try local resource.";
        com.android.camera.log.Log.d(r0, r4);
        r0 = com.android.camera.CameraAppImpl.getAndroidContext();
        r0 = r0.getResources();
        r4 = "screen_light";
        r5 = "xml";
        r6 = com.android.camera.CameraAppImpl.getAndroidContext();
        r6 = r6.getPackageName();
        r0 = r0.getIdentifier(r4, r5, r6);
        if (r0 > 0) goto L_0x0069;
    L_0x0061:
        r0 = "CameraUtil";
        r1 = "res/xml/screen_light.xml not found!";
        com.android.camera.log.Log.e(r0, r1);
        return;
    L_0x0069:
        r4 = com.android.camera.CameraAppImpl.getAndroidContext();
        r4 = r4.getResources();
        r0 = r4.getXml(r0);
    L_0x0075:
        r4 = r0.next();	 Catch:{ XmlPullParserException -> 0x0123, IOException -> 0x011a, all -> 0x010c }
        r5 = 3;
        if (r4 == r5) goto L_0x0104;
    L_0x007c:
        r4 = r0.getEventType();	 Catch:{ XmlPullParserException -> 0x0123, IOException -> 0x011a, all -> 0x010c }
        r5 = 2;
        if (r4 == r5) goto L_0x0084;
    L_0x0083:
        goto L_0x0075;
    L_0x0084:
        r4 = "screen";
        r6 = r0.getName();	 Catch:{ XmlPullParserException -> 0x0123, IOException -> 0x011a, all -> 0x010c }
        r4 = r4.equals(r6);	 Catch:{ XmlPullParserException -> 0x0123, IOException -> 0x011a, all -> 0x010c }
        if (r4 == 0) goto L_0x0075;
    L_0x0090:
        r4 = SCREEN_VENDOR;	 Catch:{ XmlPullParserException -> 0x0123, IOException -> 0x011a, all -> 0x010c }
        r6 = "vendor";
        r6 = r0.getAttributeValue(r1, r6);	 Catch:{ XmlPullParserException -> 0x0123, IOException -> 0x011a, all -> 0x010c }
        r4 = r4.equals(r6);	 Catch:{ XmlPullParserException -> 0x0123, IOException -> 0x011a, all -> 0x010c }
        if (r4 != 0) goto L_0x00a2;
    L_0x009e:
        skip(r0);	 Catch:{ XmlPullParserException -> 0x0123, IOException -> 0x011a, all -> 0x010c }
        goto L_0x0075;
    L_0x00a2:
        r1 = "CameraUtil";
        r4 = new java.lang.StringBuilder;	 Catch:{ XmlPullParserException -> 0x0123, IOException -> 0x011a, all -> 0x010c }
        r4.<init>();	 Catch:{ XmlPullParserException -> 0x0123, IOException -> 0x011a, all -> 0x010c }
        r6 = "load screen light parameters for ";
        r4.append(r6);	 Catch:{ XmlPullParserException -> 0x0123, IOException -> 0x011a, all -> 0x010c }
        r6 = SCREEN_VENDOR;	 Catch:{ XmlPullParserException -> 0x0123, IOException -> 0x011a, all -> 0x010c }
        r4.append(r6);	 Catch:{ XmlPullParserException -> 0x0123, IOException -> 0x011a, all -> 0x010c }
        r4 = r4.toString();	 Catch:{ XmlPullParserException -> 0x0123, IOException -> 0x011a, all -> 0x010c }
        com.android.camera.log.Log.d(r1, r4);	 Catch:{ XmlPullParserException -> 0x0123, IOException -> 0x011a, all -> 0x010c }
    L_0x00ba:
        r1 = r0.next();	 Catch:{ XmlPullParserException -> 0x0123, IOException -> 0x011a, all -> 0x010c }
        r4 = 1;
        if (r1 == r4) goto L_0x0104;
    L_0x00c1:
        r1 = r0.getEventType();	 Catch:{ XmlPullParserException -> 0x0123, IOException -> 0x011a, all -> 0x010c }
        if (r1 == r5) goto L_0x00c8;
    L_0x00c7:
        goto L_0x00ba;
    L_0x00c8:
        r1 = "light";
        r4 = r0.getName();	 Catch:{ XmlPullParserException -> 0x0123, IOException -> 0x011a, all -> 0x010c }
        r1 = r1.equals(r4);	 Catch:{ XmlPullParserException -> 0x0123, IOException -> 0x011a, all -> 0x010c }
        if (r1 != 0) goto L_0x00d5;
    L_0x00d4:
        goto L_0x0104;
    L_0x00d5:
        r1 = "CCT";
        r1 = getAttributeIntValue(r0, r1, r2);	 Catch:{ XmlPullParserException -> 0x0123, IOException -> 0x011a, all -> 0x010c }
        r4 = "R";
        r4 = getAttributeIntValue(r0, r4, r2);	 Catch:{ XmlPullParserException -> 0x0123, IOException -> 0x011a, all -> 0x010c }
        r6 = "G";
        r6 = getAttributeIntValue(r0, r6, r2);	 Catch:{ XmlPullParserException -> 0x0123, IOException -> 0x011a, all -> 0x010c }
        r7 = "B";
        r7 = getAttributeIntValue(r0, r7, r2);	 Catch:{ XmlPullParserException -> 0x0123, IOException -> 0x011a, all -> 0x010c }
        r8 = COLOR_TEMPERATURE_LIST;	 Catch:{ XmlPullParserException -> 0x0123, IOException -> 0x011a, all -> 0x010c }
        r1 = java.lang.Integer.valueOf(r1);	 Catch:{ XmlPullParserException -> 0x0123, IOException -> 0x011a, all -> 0x010c }
        r8.add(r1);	 Catch:{ XmlPullParserException -> 0x0123, IOException -> 0x011a, all -> 0x010c }
        r1 = COLOR_TEMPERATURE_MAP;	 Catch:{ XmlPullParserException -> 0x0123, IOException -> 0x011a, all -> 0x010c }
        r4 = android.graphics.Color.rgb(r4, r6, r7);	 Catch:{ XmlPullParserException -> 0x0123, IOException -> 0x011a, all -> 0x010c }
        r4 = java.lang.Integer.valueOf(r4);	 Catch:{ XmlPullParserException -> 0x0123, IOException -> 0x011a, all -> 0x010c }
        r1.add(r4);	 Catch:{ XmlPullParserException -> 0x0123, IOException -> 0x011a, all -> 0x010c }
        goto L_0x00ba;
    L_0x0104:
        closeSafely(r3);
        r1 = r0 instanceof android.content.res.XmlResourceParser;
        if (r1 == 0) goto L_0x0130;
    L_0x010b:
        goto L_0x012b;
    L_0x010c:
        r1 = move-exception;
        closeSafely(r3);
        r2 = r0 instanceof android.content.res.XmlResourceParser;
        if (r2 == 0) goto L_0x0119;
    L_0x0114:
        r0 = (android.content.res.XmlResourceParser) r0;
        r0.close();
    L_0x0119:
        throw r1;
    L_0x011a:
        r1 = move-exception;
        closeSafely(r3);
        r1 = r0 instanceof android.content.res.XmlResourceParser;
        if (r1 == 0) goto L_0x0130;
    L_0x0122:
        goto L_0x012b;
    L_0x0123:
        r1 = move-exception;
        closeSafely(r3);
        r1 = r0 instanceof android.content.res.XmlResourceParser;
        if (r1 == 0) goto L_0x0130;
    L_0x012b:
        r0 = (android.content.res.XmlResourceParser) r0;
        r0.close();
    L_0x0130:
        return;
    L_0x0131:
        return;
        */
        throw new UnsupportedOperationException("Method not decompiled: com.android.camera.Util.initScreenLightColorMap():void");
    }

    public static void closeSafely(Closeable closeable) {
        if (closeable != null) {
            try {
                closeable.close();
            } catch (Exception e) {
                e.printStackTrace();
            }
        }
    }

    private static int getAttributeIntValue(XmlPullParser xmlPullParser, String str, int i) {
        Object attributeValue = xmlPullParser.getAttributeValue(null, str);
        if (TextUtils.isEmpty(attributeValue)) {
            return i;
        }
        try {
            return Integer.parseInt(attributeValue);
        } catch (Throwable e) {
            String str2 = TAG;
            StringBuilder stringBuilder = new StringBuilder();
            stringBuilder.append("get attribute ");
            stringBuilder.append(str);
            stringBuilder.append(" failed");
            Log.w(str2, stringBuilder.toString(), e);
            return i;
        }
    }

    private static void skip(XmlPullParser xmlPullParser) throws XmlPullParserException, IOException {
        if (xmlPullParser.getEventType() == 2) {
            int i = 1;
            while (i != 0) {
                switch (xmlPullParser.next()) {
                    case 2:
                        i++;
                        break;
                    case 3:
                        i--;
                        break;
                    default:
                        break;
                }
            }
            return;
        }
        throw new IllegalStateException();
    }

    public static int getScreenLightColor(int i) {
        initScreenLightColorMap();
        if (COLOR_TEMPERATURE_LIST.size() == 0 || COLOR_TEMPERATURE_MAP.size() == 0) {
            Log.e(TAG, "color temperature list empty!");
            return -1;
        }
        int binarySearchRightMost = binarySearchRightMost(COLOR_TEMPERATURE_LIST, Integer.valueOf(i));
        if (binarySearchRightMost >= COLOR_TEMPERATURE_LIST.size()) {
            binarySearchRightMost = COLOR_TEMPERATURE_LIST.size() - 1;
        } else if (binarySearchRightMost > 0) {
            int i2 = binarySearchRightMost - 1;
            if (((Integer) COLOR_TEMPERATURE_LIST.get(binarySearchRightMost)).intValue() - i > i - ((Integer) COLOR_TEMPERATURE_LIST.get(i2)).intValue()) {
                binarySearchRightMost = i2;
            }
        }
        String str = TAG;
        StringBuilder stringBuilder = new StringBuilder();
        stringBuilder.append("getScreenLightColor ");
        stringBuilder.append(i);
        stringBuilder.append("K -> ");
        stringBuilder.append(COLOR_TEMPERATURE_LIST.get(binarySearchRightMost));
        stringBuilder.append(GpsSpeedRef.KILOMETERS);
        Log.d(str, stringBuilder.toString());
        return ((Integer) COLOR_TEMPERATURE_MAP.get(binarySearchRightMost)).intValue();
    }

    private static String getCaller(StackTraceElement[] stackTraceElementArr, int i) {
        int i2 = 4 + i;
        if (i2 >= stackTraceElementArr.length) {
            return "<bottom of call stack>";
        }
        StackTraceElement stackTraceElement = stackTraceElementArr[i2];
        StringBuilder stringBuilder = new StringBuilder();
        stringBuilder.append(stackTraceElement.getClassName());
        stringBuilder.append(".");
        stringBuilder.append(stackTraceElement.getMethodName());
        stringBuilder.append(":");
        stringBuilder.append(stackTraceElement.getLineNumber());
        return stringBuilder.toString();
    }

    public static String getCallers(int i) {
        StackTraceElement[] stackTrace = Thread.currentThread().getStackTrace();
        StringBuffer stringBuffer = new StringBuffer();
        for (int i2 = 0; i2 < i; i2++) {
            stringBuffer.append(getCaller(stackTrace, i2));
            stringBuffer.append(" ");
        }
        return stringBuffer.toString();
    }

    public static byte[] getTimeWaterMarkData(int i, int i2, String str) {
        return StringTexture.newInstance(str, 30.079576f * (((float) Math.min(i, i2)) / 1080.0f), -1, 2).getBitmapData(CompressFormat.PNG);
    }

    public static long getDuration(String str) {
        MediaMetadataRetriever mediaMetadataRetriever = new MediaMetadataRetriever();
        long parseLong;
        try {
            mediaMetadataRetriever.setDataSource(str);
            parseLong = Long.parseLong(mediaMetadataRetriever.extractMetadata(9));
            return parseLong;
        } catch (Throwable e) {
            parseLong = TAG;
            Log.e(parseLong, e.getMessage(), e);
            return 0;
        } finally {
            mediaMetadataRetriever.release();
        }
    }

    public static long getDuration(FileDescriptor fileDescriptor) {
        MediaMetadataRetriever mediaMetadataRetriever = new MediaMetadataRetriever();
        long parseLong;
        try {
            mediaMetadataRetriever.setDataSource(fileDescriptor);
            parseLong = Long.parseLong(mediaMetadataRetriever.extractMetadata(9));
            return parseLong;
        } catch (Throwable e) {
            parseLong = TAG;
            Log.e(parseLong, e.getMessage(), e);
            return 0;
        } finally {
            mediaMetadataRetriever.release();
        }
    }

    public static boolean isSetContentDesc() {
        return "1".equals(SystemProperties.get("camera.content.description.debug"));
    }

    public static boolean isAccessible() {
        if (VERSION.SDK_INT < 14 || !isAccessibilityEnable()) {
            return false;
        }
        return true;
    }

    private static boolean isAccessibilityEnable() {
        return sIsAccessibilityEnable;
    }

    public static void setAccessibilityFocusable(View view, boolean z) {
        if (VERSION.SDK_INT < 16) {
            return;
        }
        if (z) {
            ViewCompat.setImportantForAccessibility(view, 1);
        } else {
            ViewCompat.setImportantForAccessibility(view, 2);
        }
    }

    public static boolean isQuotaExceeded(Exception exception) {
        if (exception != null && (exception instanceof FileNotFoundException)) {
            String message = exception.getMessage();
            String str = TAG;
            StringBuilder stringBuilder = new StringBuilder();
            stringBuilder.append("isQuotaExceeded: msg=");
            stringBuilder.append(message);
            Log.e(str, stringBuilder.toString());
            if (message != null) {
                return message.toLowerCase().contains("quota exceeded");
            }
        }
        return false;
    }

    public static boolean isGlobalVersion() {
        return SystemProperties.get("ro.product.mod_device", "").contains("_global");
    }

    public static boolean isInternationalBuild() {
        return SystemProperties.get("ro.product.mod_device", "").endsWith("_global");
    }

    private static boolean isDevices(String str) {
        try {
            Class cls = Class.forName("miui.os.Build");
            if (cls != null) {
                Object staticObjectField = getStaticObjectField(cls, str);
                if (staticObjectField == null) {
                    return false;
                }
                return Boolean.parseBoolean(staticObjectField.toString());
            }
        } catch (Throwable e) {
            Log.e(TAG, "getClass error", e);
        }
        return false;
    }

    private static Object getStaticObjectField(Class<?> cls, String str) throws NoSuchFieldException, SecurityException, IllegalArgumentException, IllegalAccessException {
        java.lang.reflect.Field declaredField = cls.getDeclaredField(str);
        declaredField.setAccessible(true);
        return declaredField.get(str);
    }

    public static byte[] getFirstPlane(Image image) {
        Plane[] planes = image.getPlanes();
        if (planes.length <= 0) {
            return null;
        }
        ByteBuffer buffer = planes[0].getBuffer();
        byte[] bArr = new byte[buffer.remaining()];
        buffer.get(bArr);
        return bArr;
    }

    public static int convertSizeToQuality(CameraSize cameraSize) {
        int i = cameraSize.width;
        int i2 = cameraSize.height;
        if (i < i2) {
            i = cameraSize.height;
            i2 = cameraSize.width;
        }
        if (i == 1920 && i2 == 1080) {
            return 6;
        }
        if (i == 3840 && i2 == 2160) {
            return 8;
        }
        if (i == 1280 && i2 == LIMIT_SURFACE_WIDTH) {
            return 5;
        }
        if (i < 640 || i2 != 480) {
            return -1;
        }
        return 4;
    }

    public static Bitmap getBlurBitmap(Bitmap bitmap) {
        return getBlurBitmap(bitmap, 24);
    }

    public static Bitmap getBlurBitmap(Bitmap bitmap, int i) {
        if (bitmap == null || bitmap.isRecycled()) {
            return null;
        }
        String str = TAG;
        StringBuilder stringBuilder = new StringBuilder();
        stringBuilder.append("getBlurBitmap: size = ");
        stringBuilder.append(bitmap.getWidth());
        stringBuilder.append("x");
        stringBuilder.append(bitmap.getHeight());
        stringBuilder.append(", radius = ");
        stringBuilder.append(i);
        Log.i(str, stringBuilder.toString());
        RenderScript create = RenderScript.create(CameraAppImpl.getAndroidContext());
        ScriptIntrinsicBlur create2 = ScriptIntrinsicBlur.create(create, Element.U8_4(create));
        Allocation createFromBitmap = Allocation.createFromBitmap(create, bitmap);
        Allocation createTyped = Allocation.createTyped(create, createFromBitmap.getType());
        create2.setRadius((float) i);
        create2.setInput(createFromBitmap);
        create2.forEach(createTyped);
        createTyped.copyTo(bitmap);
        createFromBitmap.destroy();
        createTyped.destroy();
        create2.destroy();
        RenderScript.releaseAllContexts();
        return bitmap;
    }

    public static byte[] getBitmapData(Bitmap bitmap) {
        OutputStream byteArrayOutputStream = new ByteArrayOutputStream();
        bitmap.compress(CompressFormat.JPEG, 87, byteArrayOutputStream);
        return byteArrayOutputStream.toByteArray();
    }

    public static Bitmap flipBitmap(Bitmap bitmap) {
        Bitmap bitmap2 = null;
        if (bitmap == null) {
            return null;
        }
        int width = bitmap.getWidth();
        int height = bitmap.getHeight();
        Matrix matrix = new Matrix();
        matrix.postScale(-1.0f, 1.0f, (float) (width / 2), (float) (height / 2));
        try {
            bitmap2 = Bitmap.createBitmap(width, height, Config.ARGB_8888);
        } catch (OutOfMemoryError e) {
            e.printStackTrace();
        } catch (NullPointerException e2) {
            e2.printStackTrace();
        }
        if (bitmap2 == null) {
            return bitmap;
        }
        Canvas canvas = new Canvas(bitmap2);
        canvas.setDrawFilter(new PaintFlagsDrawFilter(0, 3));
        Paint paint = new Paint();
        paint.setAntiAlias(true);
        paint.setFilterBitmap(true);
        canvas.drawBitmap(bitmap, matrix, paint);
        bitmap.recycle();
        return bitmap2;
    }

    /* JADX WARNING: Removed duplicated region for block: B:7:0x0028 A:{ExcHandler: java.lang.OutOfMemoryError (r1_2 'e' java.lang.Throwable), Splitter: B:4:0x001f} */
    /* JADX WARNING: Missing block: B:7:0x0028, code:
            r1 = move-exception;
     */
    /* JADX WARNING: Missing block: B:8:0x0029, code:
            com.android.camera.log.Log.e(TAG, "flip_y_bitmp:", r1);
     */
    public static android.graphics.Bitmap flipYBitmap(android.graphics.Bitmap r8) {
        /*
        r0 = 0;
        if (r8 != 0) goto L_0x0004;
    L_0x0003:
        return r0;
    L_0x0004:
        r1 = r8.getWidth();
        r2 = r8.getHeight();
        r3 = new android.graphics.Matrix;
        r3.<init>();
        r4 = 1065353216; // 0x3f800000 float:1.0 double:5.263544247E-315;
        r5 = -1082130432; // 0xffffffffbf800000 float:-1.0 double:NaN;
        r6 = r1 / 2;
        r6 = (float) r6;
        r7 = r2 / 2;
        r7 = (float) r7;
        r3.postScale(r4, r5, r6, r7);
        r4 = android.graphics.Bitmap.Config.ARGB_8888;	 Catch:{ OutOfMemoryError -> 0x0028, OutOfMemoryError -> 0x0028 }
        r1 = android.graphics.Bitmap.createBitmap(r1, r2, r4);	 Catch:{ OutOfMemoryError -> 0x0028, OutOfMemoryError -> 0x0028 }
        r0 = r1;
        goto L_0x0031;
    L_0x0028:
        r1 = move-exception;
        r2 = "CameraUtil";
        r4 = "flip_y_bitmp:";
        com.android.camera.log.Log.e(r2, r4, r1);
    L_0x0031:
        if (r0 != 0) goto L_0x0034;
    L_0x0033:
        return r8;
    L_0x0034:
        r1 = new android.graphics.Canvas;
        r1.<init>(r0);
        r2 = new android.graphics.PaintFlagsDrawFilter;
        r4 = 0;
        r5 = 3;
        r2.<init>(r4, r5);
        r1.setDrawFilter(r2);
        r2 = new android.graphics.Paint;
        r2.<init>();
        r4 = 1;
        r2.setAntiAlias(r4);
        r2.setFilterBitmap(r4);
        r1.drawBitmap(r8, r3, r2);
        r8.recycle();
        return r0;
        */
        throw new UnsupportedOperationException("Method not decompiled: com.android.camera.Util.flipYBitmap(android.graphics.Bitmap):android.graphics.Bitmap");
    }

    public static Bitmap generateCustomWatermark2File() {
        long currentTimeMillis = System.currentTimeMillis();
        Options options = new Options();
        options.inScaled = false;
        options.inPurgeable = true;
        options.inPremultiplied = true;
        if (!DataRepository.dataItemFeature().fc()) {
            return null;
        }
        Bitmap loadAppCameraWatermark = loadAppCameraWatermark(CameraAppImpl.getAndroidContext(), options, android.os.Build.DEVICE);
        if (loadAppCameraWatermark == null) {
            loadAppCameraWatermark = loadAppCameraWatermark(CameraAppImpl.getAndroidContext(), options, "common");
        }
        if (DataRepository.dataItemFeature().fC()) {
            loadAppCameraWatermark = CustomTextWaterMark.newInstance(loadAppCameraWatermark, 350.0f, 86.0f, CameraSettings.getCustomWatermark()).drawToBitmap();
        }
        saveCustomWatermark2File(loadAppCameraWatermark);
        String str = TAG;
        StringBuilder stringBuilder = new StringBuilder();
        stringBuilder.append("generateCustomWatermark2File cost time = ");
        stringBuilder.append(System.currentTimeMillis() - currentTimeMillis);
        stringBuilder.append("ms");
        Log.d(str, stringBuilder.toString());
        return loadAppCameraWatermark;
    }

    protected static Bitmap loadAppCameraWatermark(Context context, Options options, String str) {
        AssetManager assets = context.getAssets();
        try {
            StringBuilder stringBuilder = new StringBuilder();
            stringBuilder.append("watermarks/");
            stringBuilder.append(str);
            stringBuilder.append(".png");
            return BitmapFactory.decodeStream(assets.open(stringBuilder.toString()), null, options);
        } catch (Throwable e) {
            Log.d(TAG, "Failed to load app camera watermark ", e);
            return null;
        }
    }

    protected static void saveCustomWatermark2File(Bitmap bitmap) {
        boolean renameTo;
        Throwable e;
        String str;
        StringBuilder stringBuilder;
        Throwable th;
        String str2 = TAG;
        StringBuilder stringBuilder2 = new StringBuilder();
        stringBuilder2.append("saveLastFrameGaussian2File: start... watermarkBitmap = ");
        stringBuilder2.append(bitmap);
        Log.d(str2, stringBuilder2.toString());
        long currentTimeMillis = System.currentTimeMillis();
        if (!(bitmap == null || bitmap.isRecycled())) {
            Closeable closeable = null;
            try {
                File filesDir = CameraAppImpl.getAndroidContext().getFilesDir();
                StringBuilder stringBuilder3 = new StringBuilder();
                stringBuilder3.append(WATERMARK_FILE_NAME);
                stringBuilder3.append(TEMP_SUFFIX);
                File file = new File(filesDir, stringBuilder3.toString());
                Closeable fileOutputStream = new FileOutputStream(file);
                try {
                    bitmap.compress(CompressFormat.PNG, 90, fileOutputStream);
                    fileOutputStream.flush();
                    renameTo = file.renameTo(new File(filesDir, WATERMARK_FILE_NAME));
                    closeSilently(fileOutputStream);
                } catch (Throwable e2) {
                    e = e2;
                    closeable = fileOutputStream;
                    try {
                        Log.e(TAG, "saveCustomWatermark2File Failed to write image", e);
                        closeSilently(closeable);
                        renameTo = false;
                        str = TAG;
                        stringBuilder = new StringBuilder();
                        stringBuilder.append("saveCustomWatermark2File: watermarkBitmap = ");
                        stringBuilder.append(bitmap);
                        stringBuilder.append(", save result = ");
                        stringBuilder.append(renameTo);
                        stringBuilder.append(", cost time = ");
                        stringBuilder.append(System.currentTimeMillis() - currentTimeMillis);
                        stringBuilder.append("ms");
                        Log.d(str, stringBuilder.toString());
                    } catch (Throwable th2) {
                        th = th2;
                        closeSilently(closeable);
                        throw th;
                    }
                } catch (Throwable th3) {
                    th = th3;
                    closeable = fileOutputStream;
                    closeSilently(closeable);
                    throw th;
                }
            } catch (IOException e3) {
                e = e3;
                Log.e(TAG, "saveCustomWatermark2File Failed to write image", e);
                closeSilently(closeable);
                renameTo = false;
                str = TAG;
                stringBuilder = new StringBuilder();
                stringBuilder.append("saveCustomWatermark2File: watermarkBitmap = ");
                stringBuilder.append(bitmap);
                stringBuilder.append(", save result = ");
                stringBuilder.append(renameTo);
                stringBuilder.append(", cost time = ");
                stringBuilder.append(System.currentTimeMillis() - currentTimeMillis);
                stringBuilder.append("ms");
                Log.d(str, stringBuilder.toString());
            }
            str = TAG;
            stringBuilder = new StringBuilder();
            stringBuilder.append("saveCustomWatermark2File: watermarkBitmap = ");
            stringBuilder.append(bitmap);
            stringBuilder.append(", save result = ");
            stringBuilder.append(renameTo);
            stringBuilder.append(", cost time = ");
            stringBuilder.append(System.currentTimeMillis() - currentTimeMillis);
            stringBuilder.append("ms");
            Log.d(str, stringBuilder.toString());
        }
        renameTo = false;
        str = TAG;
        stringBuilder = new StringBuilder();
        stringBuilder.append("saveCustomWatermark2File: watermarkBitmap = ");
        stringBuilder.append(bitmap);
        stringBuilder.append(", save result = ");
        stringBuilder.append(renameTo);
        stringBuilder.append(", cost time = ");
        stringBuilder.append(System.currentTimeMillis() - currentTimeMillis);
        stringBuilder.append("ms");
        Log.d(str, stringBuilder.toString());
    }

    public static void saveLastFrameGaussian2File(Bitmap bitmap) {
        Closeable fileOutputStream;
        Throwable e;
        boolean z;
        String str;
        StringBuilder stringBuilder;
        Throwable th;
        String str2 = TAG;
        StringBuilder stringBuilder2 = new StringBuilder();
        stringBuilder2.append("saveLastFrameGaussian2File: start... blurBitmap = ");
        stringBuilder2.append(bitmap);
        Log.d(str2, stringBuilder2.toString());
        long currentTimeMillis = System.currentTimeMillis();
        if (!(bitmap == null || bitmap.isRecycled())) {
            File filesDir;
            File file;
            try {
                filesDir = CameraAppImpl.getAndroidContext().getFilesDir();
                file = new File(filesDir, "blur.jpg.tmp");
                fileOutputStream = new FileOutputStream(file);
            } catch (Throwable e2) {
                fileOutputStream = null;
                e = e2;
                try {
                    Log.e(TAG, "saveLastFrameGaussian2File Failed to write image", e);
                    closeSilently(fileOutputStream);
                    z = false;
                    str = TAG;
                    stringBuilder = new StringBuilder();
                    stringBuilder.append("saveLastFrameGaussian2File: blurBitmap = ");
                    stringBuilder.append(bitmap);
                    stringBuilder.append(", save result = ");
                    stringBuilder.append(z);
                    stringBuilder.append(", cost time = ");
                    stringBuilder.append(System.currentTimeMillis() - currentTimeMillis);
                    stringBuilder.append("ms");
                    Log.d(str, stringBuilder.toString());
                } catch (Throwable th2) {
                    th = th2;
                    closeSilently(fileOutputStream);
                    throw th;
                }
            } catch (Throwable th3) {
                th = th3;
                fileOutputStream = null;
                closeSilently(fileOutputStream);
                throw th;
            }
            try {
                bitmap.compress(CompressFormat.JPEG, 90, fileOutputStream);
                fileOutputStream.flush();
                z = file.renameTo(new File(filesDir, LAST_FRAME_GAUSSIAN_FILE_NAME));
                closeSilently(fileOutputStream);
            } catch (IOException e3) {
                e = e3;
                Log.e(TAG, "saveLastFrameGaussian2File Failed to write image", e);
                closeSilently(fileOutputStream);
                z = false;
                str = TAG;
                stringBuilder = new StringBuilder();
                stringBuilder.append("saveLastFrameGaussian2File: blurBitmap = ");
                stringBuilder.append(bitmap);
                stringBuilder.append(", save result = ");
                stringBuilder.append(z);
                stringBuilder.append(", cost time = ");
                stringBuilder.append(System.currentTimeMillis() - currentTimeMillis);
                stringBuilder.append("ms");
                Log.d(str, stringBuilder.toString());
            }
            str = TAG;
            stringBuilder = new StringBuilder();
            stringBuilder.append("saveLastFrameGaussian2File: blurBitmap = ");
            stringBuilder.append(bitmap);
            stringBuilder.append(", save result = ");
            stringBuilder.append(z);
            stringBuilder.append(", cost time = ");
            stringBuilder.append(System.currentTimeMillis() - currentTimeMillis);
            stringBuilder.append("ms");
            Log.d(str, stringBuilder.toString());
        }
        z = false;
        str = TAG;
        stringBuilder = new StringBuilder();
        stringBuilder.append("saveLastFrameGaussian2File: blurBitmap = ");
        stringBuilder.append(bitmap);
        stringBuilder.append(", save result = ");
        stringBuilder.append(z);
        stringBuilder.append(", cost time = ");
        stringBuilder.append(System.currentTimeMillis() - currentTimeMillis);
        stringBuilder.append("ms");
        Log.d(str, stringBuilder.toString());
    }

    public static String execCommand(String str, boolean z) {
        String str2;
        InterruptedException e;
        IOException e2;
        String[] strArr = new String[]{"sh", "-c", str};
        long currentTimeMillis = System.currentTimeMillis();
        str = "";
        try {
            Process exec = Runtime.getRuntime().exec(strArr);
            String str3;
            if (exec.waitFor() != 0) {
                str3 = TAG;
                StringBuilder stringBuilder = new StringBuilder();
                stringBuilder.append("exit value = ");
                stringBuilder.append(exec.exitValue());
                Log.e(str3, stringBuilder.toString());
                return str;
            }
            BufferedReader bufferedReader = new BufferedReader(new InputStreamReader(exec.getInputStream()));
            StringBuffer stringBuffer = new StringBuffer();
            if (!z) {
                while (true) {
                    str3 = bufferedReader.readLine();
                    if (str3 == null) {
                        break;
                    }
                    stringBuffer.append(str3);
                }
            } else {
                while (true) {
                    str3 = bufferedReader.readLine();
                    if (str3 == null) {
                        break;
                    }
                    StringBuilder stringBuilder2 = new StringBuilder();
                    stringBuilder2.append(str3);
                    stringBuilder2.append("\r\n");
                    stringBuffer.append(stringBuilder2.toString());
                }
            }
            bufferedReader.close();
            str3 = stringBuffer.toString();
            try {
                str = TAG;
                StringBuilder stringBuilder3 = new StringBuilder();
                stringBuilder3.append("execCommand value=");
                stringBuilder3.append(str3);
                stringBuilder3.append(" cost=");
                stringBuilder3.append(System.currentTimeMillis() - currentTimeMillis);
                Log.v(str, stringBuilder3.toString());
                str = str3;
            } catch (InterruptedException e3) {
                str2 = str3;
                e = e3;
                str = str2;
                Log.e(TAG, "execCommand InterruptedException");
                e.printStackTrace();
                return str;
            } catch (IOException e4) {
                str2 = str3;
                e2 = e4;
                str = str2;
                Log.e(TAG, "execCommand IOException");
                e2.printStackTrace();
                return str;
            }
            return str;
        } catch (InterruptedException e5) {
            e = e5;
            Log.e(TAG, "execCommand InterruptedException");
            e.printStackTrace();
            return str;
        } catch (IOException e6) {
            e2 = e6;
            Log.e(TAG, "execCommand IOException");
            e2.printStackTrace();
            return str;
        }
    }

    public static void startScreenSlideAlphaInAnimation(View view) {
        ViewCompat.setAlpha(view, 0.0f);
        ViewCompat.animate(view).alpha(1.0f).setDuration(350).setStartDelay(400).setInterpolator(new SineEaseInOutInterpolator()).start();
    }

    public static float getRatio(java.lang.String r1) {
        /*
        r0 = r1.hashCode();
        switch(r0) {
            case 50858: goto L_0x0030;
            case 53743: goto L_0x0026;
            case 1515430: goto L_0x001c;
            case 1517352: goto L_0x0012;
            case 1456894192: goto L_0x0008;
            default: goto L_0x0007;
        };
    L_0x0007:
        goto L_0x003a;
    L_0x0008:
        r0 = "19.5x9";
        r1 = r1.equals(r0);
        if (r1 == 0) goto L_0x003a;
    L_0x0010:
        r1 = 4;
        goto L_0x003b;
    L_0x0012:
        r0 = "18x9";
        r1 = r1.equals(r0);
        if (r1 == 0) goto L_0x003a;
    L_0x001a:
        r1 = 3;
        goto L_0x003b;
    L_0x001c:
        r0 = "16x9";
        r1 = r1.equals(r0);
        if (r1 == 0) goto L_0x003a;
    L_0x0024:
        r1 = 1;
        goto L_0x003b;
    L_0x0026:
        r0 = "4x3";
        r1 = r1.equals(r0);
        if (r1 == 0) goto L_0x003a;
    L_0x002e:
        r1 = 0;
        goto L_0x003b;
    L_0x0030:
        r0 = "1x1";
        r1 = r1.equals(r0);
        if (r1 == 0) goto L_0x003a;
    L_0x0038:
        r1 = 2;
        goto L_0x003b;
    L_0x003a:
        r1 = -1;
    L_0x003b:
        r0 = 1068121457; // 0x3faa3d71 float:1.33 double:5.277221175E-315;
        switch(r1) {
            case 0: goto L_0x0050;
            case 1: goto L_0x004c;
            case 2: goto L_0x0049;
            case 3: goto L_0x0046;
            case 4: goto L_0x0042;
            default: goto L_0x0041;
        };
    L_0x0041:
        return r0;
    L_0x0042:
        r1 = 1074412913; // 0x400a3d71 float:2.16 double:5.3083051E-315;
        return r1;
    L_0x0046:
        r1 = 1073741824; // 0x40000000 float:2.0 double:5.304989477E-315;
        return r1;
    L_0x0049:
        r1 = 1065353216; // 0x3f800000 float:1.0 double:5.263544247E-315;
        return r1;
    L_0x004c:
        r1 = 1071812444; // 0x3fe28f5c float:1.77 double:5.295457074E-315;
        return r1;
    L_0x0050:
        return r0;
        */
        throw new UnsupportedOperationException("Method not decompiled: com.android.camera.Util.getRatio(java.lang.String):float");
    }

    public static byte[] composeLiveShotPicture(Context context, byte[] bArr, int i, int i2, byte[] bArr2, long j, boolean z, String str) {
        OutputStream byteArrayOutputStream;
        Throwable th;
        Throwable th2;
        Throwable th3;
        XMPMeta createXMPMeta;
        AutoCloseable byteArrayInputStream;
        AutoCloseable byteArrayOutputStream2;
        int length;
        String str2;
        StringBuilder stringBuilder;
        Throwable th4;
        Throwable th5;
        Log.d(TAG, "composeLiveShotPicture(): E");
        if (bArr == null || bArr.length == 0) {
            Log.d(TAG, "composeLiveShotPicture(): The primary photo of LiveShot is empty");
            return new byte[0];
        } else if (bArr2 == null || bArr2.length == 0) {
            Log.d(TAG, "composeLiveShotPicture(): The corresponding movie of LiveShot is empty");
            return bArr;
        } else {
            byte[] dualCameraWatermarkData;
            Throwable th6 = null;
            try {
                byteArrayOutputStream = new ByteArrayOutputStream();
                try {
                    ExifInterface exifInterface = new ExifInterface();
                    exifInterface.readExif(bArr);
                    exifInterface.addFileTypeLiveShot(true);
                    if (z) {
                        dualCameraWatermarkData = getDualCameraWatermarkData(context);
                        if (dualCameraWatermarkData != null && dualCameraWatermarkData.length > 0) {
                            exifInterface.addDulCameraWaterMark(dualCameraWatermarkData);
                        }
                    }
                    if (!(str == null || str.isEmpty())) {
                        dualCameraWatermarkData = getTimeWaterMarkData(i, i2, str);
                        if (dualCameraWatermarkData != null && dualCameraWatermarkData.length > 0) {
                            exifInterface.addTimeWaterMark(dualCameraWatermarkData);
                        }
                    }
                    exifInterface.writeExif(bArr, byteArrayOutputStream);
                    dualCameraWatermarkData = byteArrayOutputStream.toByteArray();
                    try {
                        $closeResource(null, byteArrayOutputStream);
                    } catch (IOException e) {
                    }
                } catch (Throwable th22) {
                    th3 = th22;
                    th22 = th;
                    th = th3;
                }
            } catch (IOException e2) {
                dualCameraWatermarkData = bArr;
                Log.d(TAG, "composeLiveShotPicture(): Failed to insert xiaomi specific metadata");
                createXMPMeta = XmpHelper.createXMPMeta();
                byteArrayInputStream = new ByteArrayInputStream(dualCameraWatermarkData);
                try {
                    byteArrayOutputStream2 = new ByteArrayOutputStream();
                    try {
                        createXMPMeta.setPropertyInteger(XmpHelper.GOOGLE_MICROVIDEO_NAMESPACE, XmpHelper.MICROVIDEO_VERSION, 1);
                        createXMPMeta.setPropertyInteger(XmpHelper.GOOGLE_MICROVIDEO_NAMESPACE, XmpHelper.MICROVIDEO_TYPE, 1);
                        createXMPMeta.setPropertyInteger(XmpHelper.GOOGLE_MICROVIDEO_NAMESPACE, XmpHelper.MICROVIDEO_OFFSET, bArr2.length);
                        createXMPMeta.setPropertyLong(XmpHelper.GOOGLE_MICROVIDEO_NAMESPACE, XmpHelper.MICROVIDEO_PRESENTATION_TIMESTAMP, j);
                        XmpHelper.writeXMPMeta(byteArrayInputStream, byteArrayOutputStream2, createXMPMeta);
                        bArr = byteArrayOutputStream2.toByteArray();
                        $closeResource(null, byteArrayOutputStream2);
                        try {
                            $closeResource(null, byteArrayInputStream);
                        } catch (Exception e3) {
                        }
                        length = bArr.length + bArr2.length;
                        str2 = TAG;
                        stringBuilder = new StringBuilder();
                        stringBuilder.append("composeLiveShotPicture(): file size = ");
                        stringBuilder.append(length);
                        Log.d(str2, stringBuilder.toString());
                        dualCameraWatermarkData = new byte[length];
                        System.arraycopy(bArr, 0, dualCameraWatermarkData, 0, bArr.length);
                        System.arraycopy(bArr2, 0, dualCameraWatermarkData, bArr.length, bArr2.length);
                        Log.d(TAG, "composeLiveShotPicture(): X");
                        return dualCameraWatermarkData;
                    } catch (Throwable th52) {
                        th3 = th52;
                        th52 = th4;
                        th4 = th3;
                    }
                } catch (Throwable th42) {
                    th6 = th42;
                }
            }
            createXMPMeta = XmpHelper.createXMPMeta();
            try {
                byteArrayInputStream = new ByteArrayInputStream(dualCameraWatermarkData);
                byteArrayOutputStream2 = new ByteArrayOutputStream();
                createXMPMeta.setPropertyInteger(XmpHelper.GOOGLE_MICROVIDEO_NAMESPACE, XmpHelper.MICROVIDEO_VERSION, 1);
                createXMPMeta.setPropertyInteger(XmpHelper.GOOGLE_MICROVIDEO_NAMESPACE, XmpHelper.MICROVIDEO_TYPE, 1);
                createXMPMeta.setPropertyInteger(XmpHelper.GOOGLE_MICROVIDEO_NAMESPACE, XmpHelper.MICROVIDEO_OFFSET, bArr2.length);
                createXMPMeta.setPropertyLong(XmpHelper.GOOGLE_MICROVIDEO_NAMESPACE, XmpHelper.MICROVIDEO_PRESENTATION_TIMESTAMP, j);
                XmpHelper.writeXMPMeta(byteArrayInputStream, byteArrayOutputStream2, createXMPMeta);
                bArr = byteArrayOutputStream2.toByteArray();
                try {
                    $closeResource(null, byteArrayOutputStream2);
                    $closeResource(null, byteArrayInputStream);
                    length = bArr.length + bArr2.length;
                    str2 = TAG;
                    stringBuilder = new StringBuilder();
                    stringBuilder.append("composeLiveShotPicture(): file size = ");
                    stringBuilder.append(length);
                    Log.d(str2, stringBuilder.toString());
                    dualCameraWatermarkData = new byte[length];
                    System.arraycopy(bArr, 0, dualCameraWatermarkData, 0, bArr.length);
                    System.arraycopy(bArr2, 0, dualCameraWatermarkData, bArr.length, bArr2.length);
                    Log.d(TAG, "composeLiveShotPicture(): X");
                    return dualCameraWatermarkData;
                } catch (Throwable th7) {
                    byte[] bArr3 = bArr;
                    th42 = th7;
                    dualCameraWatermarkData = bArr3;
                    $closeResource(th6, byteArrayInputStream);
                    throw th42;
                }
            } catch (Exception e4) {
                bArr = dualCameraWatermarkData;
                Log.d(TAG, "composeLiveShotPicture(): failed to insert xmp metadata");
                length = bArr.length + bArr2.length;
                str2 = TAG;
                stringBuilder = new StringBuilder();
                stringBuilder.append("composeLiveShotPicture(): file size = ");
                stringBuilder.append(length);
                Log.d(str2, stringBuilder.toString());
                dualCameraWatermarkData = new byte[length];
                System.arraycopy(bArr, 0, dualCameraWatermarkData, 0, bArr.length);
                System.arraycopy(bArr2, 0, dualCameraWatermarkData, bArr.length, bArr2.length);
                Log.d(TAG, "composeLiveShotPicture(): X");
                return dualCameraWatermarkData;
            }
        }
        $closeResource(th22, byteArrayOutputStream);
        throw th7;
        $closeResource(th52, byteArrayOutputStream2);
        throw th42;
    }

    private static /* synthetic */ void $closeResource(Throwable th, AutoCloseable autoCloseable) {
        if (th != null) {
            try {
                autoCloseable.close();
                return;
            } catch (Throwable th2) {
                th.addSuppressed(th2);
                return;
            }
        }
        autoCloseable.close();
    }

    /* JADX WARNING: Removed duplicated region for block: B:16:0x008b  */
    /* JADX WARNING: Removed duplicated region for block: B:15:0x0067  */
    public static byte[] composeDepthMapPicture(byte[] r15, byte[] r16, byte[] r17, boolean r18, int r19, java.lang.String r20, int r21, int r22, boolean r23, boolean r24) {
        /*
        r1 = r17;
        r2 = r20;
        r3 = r21;
        r4 = r22;
        r0 = "CameraUtil";
        r5 = "composeDepthMapPicture: process in portrait depth map picture";
        com.android.camera.log.Log.d(r0, r5);
        r5 = java.lang.System.currentTimeMillis();
        r14 = new com.android.camera2.ArcsoftDepthMap;
        r0 = r16;
        r14.<init>(r0);
        r7 = 0;
        if (r18 == 0) goto L_0x0064;
    L_0x001e:
        r0 = com.android.camera.data.DataRepository.dataItemFeature();
        r0 = r0.fc();
        if (r0 == 0) goto L_0x0050;
    L_0x0028:
        r0 = new java.lang.StringBuilder;
        r0.<init>();
        r8 = com.android.camera.CameraAppImpl.getAndroidContext();
        r8 = r8.getFilesDir();
        r0.append(r8);
        r8 = WATERMARK_FILE_NAME;
        r0.append(r8);
        r0 = r0.toString();
        r8 = new java.io.File;
        r8.<init>(r0);
        r8 = r8.exists();
        if (r8 != 0) goto L_0x004f;
    L_0x004c:
        generateCustomWatermark2File();
    L_0x004f:
        goto L_0x0054;
    L_0x0050:
        r0 = com.android.camera.CameraSettings.getDualCameraWaterMarkFilePathVendor();
    L_0x0054:
        r8 = new java.io.FileInputStream;	 Catch:{ IOException -> 0x0060 }
        r8.<init>(r0);	 Catch:{ IOException -> 0x0060 }
        r0 = miui.util.IOUtils.toByteArray(r8);	 Catch:{ IOException -> 0x0060 }
        r9 = r0;
        goto L_0x0065;
    L_0x0060:
        r0 = move-exception;
        r0.printStackTrace();
    L_0x0064:
        r9 = r7;
    L_0x0065:
        if (r2 == 0) goto L_0x008b;
    L_0x0067:
        r0 = "CameraUtil";
        r7 = new java.lang.StringBuilder;
        r7.<init>();
        r8 = "generate a TimeWaterMarkData with :";
        r7.append(r8);
        r7.append(r3);
        r8 = "x";
        r7.append(r8);
        r7.append(r4);
        r7 = r7.toString();
        com.android.camera.log.Log.d(r0, r7);
        r0 = getTimeWaterMarkData(r3, r4, r2);
        r10 = r0;
        goto L_0x008c;
    L_0x008b:
        r10 = r7;
    L_0x008c:
        r7 = r14;
        r8 = r15;
        r11 = r19;
        r12 = r23;
        r13 = r24;
        r0 = r7.writePortraitExif(r8, r9, r10, r11, r12, r13);
        r2 = r14.getDepthMapData();
        r3 = r0.length;
        r4 = r1.length;
        r3 = r3 + r4;
        r4 = r2.length;
        r3 = r3 + r4;
        r3 = new byte[r3];
        r4 = r0.length;
        r7 = 0;
        java.lang.System.arraycopy(r0, r7, r3, r7, r4);
        r4 = r0.length;
        r8 = r1.length;
        java.lang.System.arraycopy(r1, r7, r3, r4, r8);
        r0 = r0.length;
        r1 = r1.length;
        r0 = r0 + r1;
        r1 = r2.length;
        java.lang.System.arraycopy(r2, r7, r3, r0, r1);
        r0 = "CameraUtil";
        r1 = new java.lang.StringBuilder;
        r1.<init>();
        r2 = "composeDepthMapPicture: compose portrait picture cost: ";
        r1.append(r2);
        r7 = java.lang.System.currentTimeMillis();
        r7 = r7 - r5;
        r1.append(r7);
        r1 = r1.toString();
        com.android.camera.log.Log.d(r0, r1);
        return r3;
        */
        throw new UnsupportedOperationException("Method not decompiled: com.android.camera.Util.composeDepthMapPicture(byte[], byte[], byte[], boolean, int, java.lang.String, int, int, boolean, boolean):byte[]");
    }

    /* JADX WARNING: Removed duplicated region for block: B:21:0x004f A:{SYNTHETIC, Splitter: B:21:0x004f} */
    public static void saveYuv(byte[] r4, int r5) {
        /*
        r0 = 0;
        r1 = new java.io.FileOutputStream;	 Catch:{ Exception -> 0x0030 }
        r2 = new java.lang.StringBuilder;	 Catch:{ Exception -> 0x0030 }
        r2.<init>();	 Catch:{ Exception -> 0x0030 }
        r3 = "sdcard/DCIM/Camera/dump_";
        r2.append(r3);	 Catch:{ Exception -> 0x0030 }
        r2.append(r5);	 Catch:{ Exception -> 0x0030 }
        r5 = ".yuv";
        r2.append(r5);	 Catch:{ Exception -> 0x0030 }
        r5 = r2.toString();	 Catch:{ Exception -> 0x0030 }
        r1.<init>(r5);	 Catch:{ Exception -> 0x0030 }
        r1.write(r4);	 Catch:{ Exception -> 0x002b, all -> 0x0028 }
        r1.flush();	 Catch:{ Exception -> 0x0041 }
        r1.close();	 Catch:{ Exception -> 0x0041 }
        goto L_0x004a;
    L_0x0028:
        r4 = move-exception;
        r0 = r1;
        goto L_0x004c;
    L_0x002b:
        r4 = move-exception;
        r0 = r1;
        goto L_0x0031;
    L_0x002e:
        r4 = move-exception;
        goto L_0x004c;
    L_0x0030:
        r4 = move-exception;
    L_0x0031:
        r5 = "CameraUtil";
        r1 = "Failed to write image";
        com.android.camera.log.Log.e(r5, r1, r4);	 Catch:{ all -> 0x002e }
        if (r0 == 0) goto L_0x004a;
    L_0x003a:
        r0.flush();	 Catch:{ Exception -> 0x0041 }
        r0.close();	 Catch:{ Exception -> 0x0041 }
        goto L_0x004a;
    L_0x0041:
        r4 = move-exception;
        r5 = "CameraUtil";
        r0 = "Failed to flush/close stream";
        com.android.camera.log.Log.e(r5, r0, r4);
        goto L_0x004b;
    L_0x004b:
        return;
        if (r0 == 0) goto L_0x005f;
    L_0x004f:
        r0.flush();	 Catch:{ Exception -> 0x0056 }
        r0.close();	 Catch:{ Exception -> 0x0056 }
        goto L_0x005f;
    L_0x0056:
        r5 = move-exception;
        r0 = "CameraUtil";
        r1 = "Failed to flush/close stream";
        com.android.camera.log.Log.e(r0, r1, r5);
    L_0x005f:
        throw r4;
        */
        throw new UnsupportedOperationException("Method not decompiled: com.android.camera.Util.saveYuv(byte[], int):void");
    }

    public static void saveYuvToJpg(byte[] bArr, int i, int i2, int[] iArr, long j) {
        if (bArr == null) {
            Log.w(TAG, "saveYuvToJpg: null data");
            return;
        }
        YuvImage yuvImage = new YuvImage(bArr, 17, i, i2, iArr);
        StringBuilder stringBuilder = new StringBuilder();
        stringBuilder.append("sdcard/DCIM/Camera/dump_");
        stringBuilder.append(j);
        stringBuilder.append(Storage.JPEG_SUFFIX);
        String stringBuilder2 = stringBuilder.toString();
        String str = TAG;
        StringBuilder stringBuilder3 = new StringBuilder();
        stringBuilder3.append("dump jpeg to: ");
        stringBuilder3.append(stringBuilder2);
        Log.v(str, stringBuilder3.toString());
        try {
            yuvImage.compressToJpeg(new Rect(0, 0, i, i2), 100, new FileOutputStream(stringBuilder2));
        } catch (Throwable e) {
            Log.e(TAG, e.getMessage(), e);
        }
    }

    public static void saveImageToJpeg(Image image) {
        Plane[] planes = image.getPlanes();
        ByteBuffer buffer = planes[0].getBuffer();
        ByteBuffer buffer2 = planes[2].getBuffer();
        int[] iArr = new int[]{planes[0].getRowStride(), planes[2].getRowStride()};
        int limit = buffer.limit();
        int limit2 = buffer2.limit();
        byte[] bArr = new byte[(limit + limit2)];
        buffer.get(bArr, 0, limit);
        buffer2.get(bArr, limit, limit2);
        saveYuvToJpg(bArr, image.getWidth(), image.getHeight(), iArr, System.currentTimeMillis());
        String str = TAG;
        StringBuilder stringBuilder = new StringBuilder();
        stringBuilder.append("saveImageToJpeg: ");
        stringBuilder.append(buffer.remaining());
        stringBuilder.append("|");
        stringBuilder.append(buffer2.remaining());
        Log.d(str, stringBuilder.toString());
    }

    public static void dumpImageInfo(String str, Image image) {
        StringBuilder stringBuilder = new StringBuilder();
        Plane[] planes = image.getPlanes();
        for (int i = 0; i < planes.length; i++) {
            Plane plane = planes[i];
            stringBuilder.append("plane_");
            stringBuilder.append(i);
            stringBuilder.append(": ");
            stringBuilder.append(plane.getPixelStride());
            stringBuilder.append("|");
            stringBuilder.append(plane.getRowStride());
            stringBuilder.append("|");
            stringBuilder.append(plane.getBuffer().remaining());
            stringBuilder.append("\n");
        }
        Log.d(str, stringBuilder.toString());
    }

    public static boolean isValidValue(String str) {
        return !TextUtils.isEmpty(str) && str.matches("^[0-9]+$");
    }

    public static boolean isScreenSlideOff(Context context) {
        return System.getInt(context.getContentResolver(), "sc_status", -1) == 1;
    }

    public static boolean isEqualsZero(double d) {
        return Math.abs(d) < 1.0E-8d;
    }

    public static boolean createGooglePhotosCompatibleLiveShot() {
        return true;
    }

    public static boolean saveLiveShotMicroVideoInSdcard() {
        return true;
    }

    public static boolean UI_DEBUG() {
        return DataRepository.dataItemFeature().fu();
    }

    private static byte[] getDualCameraWatermarkData(Context context) {
        Throwable th;
        Throwable th2;
        Throwable th3;
        AutoCloseable fileInputStream;
        byte[] toByteArray;
        AutoCloseable open;
        Throwable th4;
        try {
            fileInputStream = new FileInputStream(CameraSettings.getDualCameraWaterMarkFilePathVendor());
            try {
                toByteArray = IOUtils.toByteArray(fileInputStream);
                $closeResource(null, fileInputStream);
                return toByteArray;
            } catch (Throwable th22) {
                th3 = th22;
                th22 = th;
                th = th3;
            }
            if (fileInputStream != null) {
                $closeResource(th22, fileInputStream);
            }
            throw th;
            $closeResource(th22, fileInputStream);
            throw th;
            if (open != null) {
                $closeResource(th, open);
            }
            throw th4;
        } catch (Exception e) {
            Log.d(TAG, "Failed to load device specific dual camera water mark from vendor path");
            if (DataRepository.dataItemFeature().fc() && context != null) {
                AssetManager assets = context.getAssets();
                try {
                    StringBuilder stringBuilder = new StringBuilder();
                    stringBuilder.append("watermarks/");
                    stringBuilder.append(Build.DEVICE);
                    stringBuilder.append(".png");
                    fileInputStream = assets.open(stringBuilder.toString());
                    try {
                        toByteArray = IOUtils.toByteArray(fileInputStream);
                        if (fileInputStream != null) {
                            $closeResource(null, fileInputStream);
                        }
                        return toByteArray;
                    } catch (Throwable th222) {
                        th3 = th222;
                        th222 = th;
                        th = th3;
                    }
                } catch (Exception e2) {
                    Log.d(TAG, "Failed to load device specific dual camera water mark from app assets");
                    try {
                        open = assets.open("watermarks/common.png");
                        try {
                            byte[] toByteArray2 = IOUtils.toByteArray(open);
                            if (open != null) {
                                $closeResource(null, open);
                            }
                            return toByteArray2;
                        } catch (Throwable th5) {
                            th3 = th5;
                            th5 = th4;
                            th4 = th3;
                        }
                    } catch (Exception e3) {
                        Log.d(TAG, "Failed to load common dual camera water mark from app assets");
                        Log.d(TAG, "Failed to load dual camera water mark");
                        return null;
                    }
                }
            }
            Log.d(TAG, "Failed to load dual camera water mark");
            return null;
        }
    }

    private static boolean isFind19_5_9LongRatioScreen(int i, int i2) {
        if (((double) Math.abs((((float) i2) / ((float) i)) - 2.16f)) < 0.02d) {
            return true;
        }
        return false;
    }

    public static final String convertOutputFormatToMimeType(int i) {
        if (i == 2) {
            return "video/mp4";
        }
        return "video/3gpp";
    }

    public static String convertOutputFormatToFileExt(int i) {
        if (i == 2) {
            return ".mp4";
        }
        return ".3gp";
    }

    public static final String millisecondToTimeString(long j, boolean z) {
        long j2 = j / 1000;
        long j3 = j2 / 60;
        long j4 = j3 / 60;
        long j5 = j3 - (j4 * 60);
        long j6 = j2 - (j3 * 60);
        StringBuilder stringBuilder = new StringBuilder();
        if (j4 > 0) {
            if (j4 < 10) {
                stringBuilder.append('0');
            }
            stringBuilder.append(j4);
            stringBuilder.append(':');
        }
        if (j5 < 10) {
            stringBuilder.append('0');
        }
        stringBuilder.append(j5);
        stringBuilder.append(':');
        if (j6 < 10) {
            stringBuilder.append('0');
        }
        stringBuilder.append(j6);
        if (z) {
            stringBuilder.append('.');
            long j7 = (j - (j2 * 1000)) / 10;
            if (j7 < 10) {
                stringBuilder.append('0');
            }
            stringBuilder.append(j7);
        }
        return stringBuilder.toString();
    }

    public static String md5(String str) {
        try {
            MessageDigest instance = MessageDigest.getInstance("MD5");
            instance.update(str.getBytes("UTF8"));
            byte[] digest = instance.digest();
            String str2 = "";
            for (byte b : digest) {
                StringBuilder stringBuilder = new StringBuilder();
                stringBuilder.append(str2);
                stringBuilder.append(Integer.toHexString((255 & b) | InputDeviceCompat.SOURCE_ANY).substring(6));
                str2 = stringBuilder.toString();
            }
            return str2;
        } catch (Exception e) {
            e.printStackTrace();
            return null;
        }
    }
}
