package com.android.camera.storage;

import android.app.Activity;
import android.app.usage.StorageStatsManager;
import android.content.ComponentName;
import android.content.ContentResolver;
import android.content.ContentUris;
import android.content.ContentValues;
import android.content.Context;
import android.content.Intent;
import android.content.pm.ApplicationInfo;
import android.content.pm.ResolveInfo;
import android.graphics.Bitmap;
import android.graphics.BitmapFactory;
import android.graphics.BitmapFactory.Options;
import android.graphics.Matrix;
import android.location.Location;
import android.net.Uri;
import android.os.Build.VERSION;
import android.os.Environment;
import android.os.StatFs;
import android.os.UserHandle;
import android.os.storage.StorageManager;
import android.provider.MediaStore.Files;
import android.provider.MediaStore.Images.Media;
import android.text.TextUtils;
import com.android.camera.CameraAppImpl;
import com.android.camera.CameraSettings;
import com.android.camera.FileCompat;
import com.android.camera.LocationManager;
import com.android.camera.Util;
import com.android.camera.lib.compatibility.util.CompatibilityUtils;
import com.android.camera.log.Log;
import com.android.gallery3d.exif.ExifInterface;
import com.mi.config.b;
import com.xiaomi.camera.core.PictureInfo;
import com.xiaomi.camera.parallelservice.util.ParallelUtil;
import java.io.BufferedInputStream;
import java.io.BufferedOutputStream;
import java.io.ByteArrayInputStream;
import java.io.ByteArrayOutputStream;
import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.OutputStream;
import java.lang.ref.WeakReference;
import java.util.List;
import java.util.Locale;
import java.util.concurrent.atomic.AtomicLong;
import miui.reflect.Method;

public class Storage {
    public static final String AVOID_SCAN_FILE_NAME = ".nomedia";
    public static int BUCKET_ID = DIRECTORY.toLowerCase(Locale.ENGLISH).hashCode();
    private static final String CAMERA_STORAGE_PATH_SUFFIX = "/DCIM/Camera";
    private static final String CAMERA_STORAGE_PATH_TEMP = "/DCIM/Camera/temp";
    public static String CAMERA_TEMP_DIRECTORY = null;
    public static String DIRECTORY = null;
    public static String FIRST_CONSIDER_STORAGE_PATH = (b.pR ? SECONDARY_STORAGE_PATH : PRIMARY_STORAGE_PATH);
    public static String HIDEDIRECTORY = null;
    private static final String HIDE_CAMERA_STORAGE_PATH_SUFFIX = "/DCIM/Camera/.ubifocus";
    public static final String JPEG_SUFFIX = ".jpg";
    private static final AtomicLong LEFT_SPACE = new AtomicLong(0);
    public static final long LOW_STORAGE_THRESHOLD = 52428800;
    protected static final String PARALLEL_PROCESS_EXIF_PROCESS_TAG = "processing";
    public static final long PREPARING = -2;
    public static int PRIMARY_BUCKET_ID = 0;
    private static final String PRIMARY_STORAGE_PATH = Environment.getExternalStorageDirectory().toString();
    public static final float QUOTA_RATIO = 0.9f;
    private static final String SAVE_TO_CLOUD_ALBUM_ACTION = "com.miui.gallery.SAVE_TO_CLOUD";
    private static final String SAVE_TO_CLOUD_ALBUM_CACHE_LOCATION_KEY = "extra_cache_location";
    private static final String SAVE_TO_CLOUD_ALBUM_FILE_LENGTH = "extra_file_length";
    private static final String SAVE_TO_CLOUD_ALBUM_PACKAGE = "com.miui.gallery";
    private static final String SAVE_TO_CLOUD_ALBUM_PATH_KAY = "extra_file_path";
    private static final String SAVE_TO_CLOUD_ALBUM_STORE_ID_KAY = "extra_media_store_id";
    private static final String SAVE_TO_CLOUD_ALBUM_TEMP_FILE_KAY = "extra_is_temp_file";
    public static int SECONDARY_BUCKET_ID = 0;
    private static String SECONDARY_STORAGE_PATH = System.getenv("SECONDARY_STORAGE");
    private static final String TAG = "CameraStorage";
    public static final String UBIFOCUS_SUFFIX = "_UBIFOCUS_";
    public static final long UNAVAILABLE = -1;
    public static final long UNKNOWN_SIZE = -3;
    private static String sCurrentStoragePath = FIRST_CONSIDER_STORAGE_PATH;
    private static long sQuotaBytes;
    private static boolean sQuotaSupported;
    private static long sReserveBytes;
    private static WeakReference<StorageListener> sStorageListener;

    public interface StorageListener {
        void onStoragePathChanged();
    }

    static {
        StringBuilder stringBuilder = new StringBuilder();
        stringBuilder.append(FIRST_CONSIDER_STORAGE_PATH);
        stringBuilder.append(CAMERA_STORAGE_PATH_SUFFIX);
        DIRECTORY = stringBuilder.toString();
        stringBuilder = new StringBuilder();
        stringBuilder.append(FIRST_CONSIDER_STORAGE_PATH);
        stringBuilder.append(HIDE_CAMERA_STORAGE_PATH_SUFFIX);
        HIDEDIRECTORY = stringBuilder.toString();
        stringBuilder = new StringBuilder();
        stringBuilder.append(FIRST_CONSIDER_STORAGE_PATH);
        stringBuilder.append(CAMERA_STORAGE_PATH_TEMP);
        CAMERA_TEMP_DIRECTORY = stringBuilder.toString();
        stringBuilder = new StringBuilder();
        stringBuilder.append(PRIMARY_STORAGE_PATH);
        stringBuilder.append(CAMERA_STORAGE_PATH_SUFFIX);
        PRIMARY_BUCKET_ID = stringBuilder.toString().toLowerCase(Locale.ENGLISH).hashCode();
        stringBuilder = new StringBuilder();
        stringBuilder.append(SECONDARY_STORAGE_PATH);
        stringBuilder.append(CAMERA_STORAGE_PATH_SUFFIX);
        SECONDARY_BUCKET_ID = stringBuilder.toString().toLowerCase(Locale.ENGLISH).hashCode();
        StringBuilder stringBuilder2 = new StringBuilder();
        stringBuilder2.append(DIRECTORY);
        stringBuilder2.append(File.separator);
        stringBuilder2.append(AVOID_SCAN_FILE_NAME);
        File file = new File(stringBuilder2.toString());
        if (file.exists()) {
            file.delete();
        }
    }

    public static void initStorage(Context context) {
        initQuota(context);
        if (b.ga()) {
            FileCompat.updateSDPath();
            String sdcardPath = CompatibilityUtils.getSdcardPath(context);
            String str = TAG;
            StringBuilder stringBuilder = new StringBuilder();
            stringBuilder.append("initStorage sd=");
            stringBuilder.append(sdcardPath);
            Log.v(str, stringBuilder.toString());
            if (sdcardPath != null) {
                SECONDARY_STORAGE_PATH = sdcardPath;
                StringBuilder stringBuilder2 = new StringBuilder();
                stringBuilder2.append(SECONDARY_STORAGE_PATH);
                stringBuilder2.append(CAMERA_STORAGE_PATH_SUFFIX);
                SECONDARY_BUCKET_ID = stringBuilder2.toString().toLowerCase(Locale.ENGLISH).hashCode();
            }
            readSystemPriorityStorage();
        }
    }

    private static void initQuota(Context context) {
        if (VERSION.SDK_INT >= 26) {
            StorageStatsManager storageStatsManager = (StorageStatsManager) context.getSystemService(StorageStatsManager.class);
            Class[] clsArr = new Class[]{StorageStatsManager.class};
            Method method = Util.getMethod(clsArr, "isQuotaSupported", "(Ljava/util/UUID;)Z");
            if (method != null) {
                sQuotaSupported = method.invokeBoolean(clsArr[0], storageStatsManager, new Object[]{StorageManager.UUID_DEFAULT});
                if (sQuotaSupported) {
                    long totalBytes = new StatFs(PRIMARY_STORAGE_PATH).getTotalBytes();
                    sQuotaBytes = (long) (0.9f * ((float) totalBytes));
                    sReserveBytes = totalBytes - sQuotaBytes;
                    String str = TAG;
                    StringBuilder stringBuilder = new StringBuilder();
                    stringBuilder.append("quota: ");
                    stringBuilder.append(sQuotaBytes);
                    stringBuilder.append("|");
                    stringBuilder.append(sReserveBytes);
                    Log.d(str, stringBuilder.toString());
                }
            }
        }
    }

    public static boolean isQuotaSupported() {
        return sQuotaSupported && sQuotaBytes > 0;
    }

    public static Uri addImageForEffect(Activity activity, String str, long j, Location location, int i, byte[] bArr, int i2, int i3, boolean z, boolean z2, String str2, PictureInfo pictureInfo) {
        return addImage(activity, str, j, location, i, bArr, i2, i3, z, false, false, false, z2, str2, pictureInfo);
    }

    public static Uri addImageForSnapCamera(Context context, String str, long j, Location location, int i, byte[] bArr, int i2, int i3, boolean z, boolean z2, boolean z3, String str2, PictureInfo pictureInfo) {
        return addImage(context, str, j, location, i, bArr, i2, i3, z, z2, z3, false, false, str2, pictureInfo);
    }

    /* JADX WARNING: Removed duplicated region for block: B:74:0x0110 A:{Splitter: B:3:0x005d, ExcHandler: all (r0_23 'th' java.lang.Throwable)} */
    /* JADX WARNING: Failed to process nested try/catch */
    /* JADX WARNING: Missing block: B:72:0x010d, code:
            r0 = th;
     */
    /* JADX WARNING: Missing block: B:73:0x010e, code:
            r8 = null;
     */
    /* JADX WARNING: Missing block: B:74:0x0110, code:
            r0 = move-exception;
     */
    /* JADX WARNING: Missing block: B:75:0x0111, code:
            r8 = r0;
     */
    /* JADX WARNING: Missing block: B:80:?, code:
            $closeResource(r8, r3);
     */
    /* JADX WARNING: Missing block: B:81:0x0117, code:
            throw r0;
     */
    public static android.net.Uri addImage(android.content.Context r23, java.lang.String r24, long r25, android.location.Location r27, int r28, byte[] r29, int r30, int r31, boolean r32, boolean r33, boolean r34, boolean r35, boolean r36, java.lang.String r37, com.xiaomi.camera.core.PictureInfo r38) {
        /*
        r15 = r23;
        r1 = r24;
        r14 = r27;
        r9 = r28;
        r10 = r33;
        r11 = r34;
        r0 = "CameraStorage";
        r2 = new java.lang.StringBuilder;
        r2.<init>();
        r3 = "addImage: parallel=";
        r2.append(r3);
        r13 = r36;
        r2.append(r13);
        r2 = r2.toString();
        com.android.camera.log.Log.d(r0, r2);
        r2 = r29;
        r3 = r13;
        r4 = r37;
        r5 = r38;
        r6 = r9;
        r7 = r30;
        r8 = r31;
        r12 = updateExif(r2, r3, r4, r5, r6, r7, r8);
        r2 = generateFilepath(r1, r10, r11);
        r0 = "algo append:";
        r3 = new java.lang.StringBuilder;
        r3.<init>();
        r4 = r35;
        r3.append(r4);
        r5 = "";
        r3.append(r5);
        r3 = r3.toString();
        com.android.camera.log.Log.e(r0, r3);
        r7 = 1;
        r3 = new java.io.BufferedInputStream;	 Catch:{ Exception -> 0x0118 }
        r0 = new java.io.ByteArrayInputStream;	 Catch:{ Exception -> 0x0118 }
        r0.<init>(r12);	 Catch:{ Exception -> 0x0118 }
        r3.<init>(r0);	 Catch:{ Exception -> 0x0118 }
        r0 = isUseDocumentMode();	 Catch:{ Throwable -> 0x0110, all -> 0x010d }
        if (r0 == 0) goto L_0x0069;
    L_0x0063:
        r0 = com.android.camera.FileCompat.getFileOutputStream(r2, r7);	 Catch:{ Throwable -> 0x0110, all -> 0x010d }
    L_0x0067:
        r5 = r0;
        goto L_0x006f;
    L_0x0069:
        r0 = new java.io.FileOutputStream;	 Catch:{ Throwable -> 0x0110, all -> 0x010d }
        r0.<init>(r2);	 Catch:{ Throwable -> 0x0110, all -> 0x010d }
        goto L_0x0067;
        r7 = new java.io.BufferedOutputStream;	 Catch:{ Throwable -> 0x0103, all -> 0x0100 }
        r7.<init>(r5);	 Catch:{ Throwable -> 0x0103, all -> 0x0100 }
        r8 = 4096; // 0x1000 float:5.74E-42 double:2.0237E-320;
        if (r32 == 0) goto L_0x00c6;
    L_0x007a:
        r6 = r9 % 180;
        if (r6 != 0) goto L_0x0080;
    L_0x007e:
        r6 = 1;
        goto L_0x0082;
        r6 = 0;
    L_0x0082:
        r0 = r6 ^ 1;
        r0 = flipJpeg(r12, r6, r0);	 Catch:{ Throwable -> 0x00c3, all -> 0x00c0 }
        if (r0 == 0) goto L_0x00af;
    L_0x008a:
        r8 = com.android.camera.Util.getExif(r12);	 Catch:{ Throwable -> 0x00c3, all -> 0x00c0 }
        r4 = r8.getThumbnailBytes();	 Catch:{ Throwable -> 0x00c3, all -> 0x00c0 }
        if (r4 == 0) goto L_0x00a6;
    L_0x0094:
        r13 = r6 ^ 1;
        r4 = flipJpeg(r4, r6, r13);	 Catch:{ Throwable -> 0x00c3, all -> 0x00c0 }
        if (r4 == 0) goto L_0x00a2;
    L_0x009c:
        r8.setCompressedThumbnail(r4);	 Catch:{ Throwable -> 0x00c3, all -> 0x00c0 }
        r4.recycle();	 Catch:{ Throwable -> 0x00c3, all -> 0x00c0 }
        r20 = 0;
        goto L_0x00a8;
    L_0x00a6:
        r20 = r35;
    L_0x00a8:
        r8.writeExif(r0, r7);	 Catch:{ Throwable -> 0x00c3, all -> 0x00c0 }
        r0.recycle();	 Catch:{ Throwable -> 0x00c3, all -> 0x00c0 }
        goto L_0x00bf;
    L_0x00af:
        r0 = new byte[r8];	 Catch:{ Throwable -> 0x00c3, all -> 0x00c0 }
    L_0x00b1:
        r4 = r3.read(r0);	 Catch:{ Throwable -> 0x00c3, all -> 0x00c0 }
        r6 = -1;
        if (r4 == r6) goto L_0x00bd;
    L_0x00b8:
        r6 = 0;
        r7.write(r0, r6, r4);	 Catch:{ Throwable -> 0x00c3, all -> 0x00c0 }
        goto L_0x00b1;
    L_0x00bd:
        r20 = r35;
    L_0x00bf:
        goto L_0x00d6;
    L_0x00c0:
        r0 = move-exception;
        r8 = 0;
        goto L_0x00fc;
    L_0x00c3:
        r0 = move-exception;
        r8 = r0;
        goto L_0x00fa;
    L_0x00c6:
        r0 = new byte[r8];	 Catch:{ Throwable -> 0x00c3, all -> 0x00c0 }
    L_0x00c8:
        r4 = r3.read(r0);	 Catch:{ Throwable -> 0x00c3, all -> 0x00c0 }
        r6 = -1;
        if (r4 == r6) goto L_0x00d4;
    L_0x00cf:
        r8 = 0;
        r7.write(r0, r8, r4);	 Catch:{ Throwable -> 0x00c3, all -> 0x00c0 }
        goto L_0x00c8;
    L_0x00d4:
        r20 = r35;
    L_0x00d6:
        if (r20 == 0) goto L_0x00e2;
    L_0x00d8:
        r7.flush();	 Catch:{ Throwable -> 0x00c3, all -> 0x00c0 }
        r0 = java.lang.System.currentTimeMillis();	 Catch:{ Throwable -> 0x00c3, all -> 0x00c0 }
        com.android.camera.ExifHelper.writeExif(r2, r9, r14, r0);	 Catch:{ Throwable -> 0x00c3, all -> 0x00c0 }
    L_0x00e2:
        r1 = 0;
        $closeResource(r1, r7);	 Catch:{ Throwable -> 0x0103, all -> 0x0100 }
        if (r5 == 0) goto L_0x00ef;
    L_0x00e8:
        $closeResource(r1, r5);	 Catch:{ Throwable -> 0x0110, all -> 0x00ec }
        goto L_0x00ef;
    L_0x00ec:
        r0 = move-exception;
        r8 = r1;
        goto L_0x0114;
    L_0x00ef:
        $closeResource(r1, r3);	 Catch:{ Exception -> 0x0118 }
        r21 = r2;
        r0 = 0;
        r16 = 1;
        goto L_0x01b6;
    L_0x00fa:
        throw r8;	 Catch:{ all -> 0x00fb }
    L_0x00fb:
        r0 = move-exception;
    L_0x00fc:
        $closeResource(r8, r7);	 Catch:{ Throwable -> 0x0103, all -> 0x0100 }
        throw r0;	 Catch:{ Throwable -> 0x0103, all -> 0x0100 }
    L_0x0100:
        r0 = move-exception;
        r8 = 0;
        goto L_0x0107;
    L_0x0103:
        r0 = move-exception;
        r8 = r0;
        throw r8;	 Catch:{ all -> 0x0106 }
    L_0x0106:
        r0 = move-exception;
    L_0x0107:
        if (r5 == 0) goto L_0x010c;
    L_0x0109:
        $closeResource(r8, r5);	 Catch:{ Throwable -> 0x0110, all -> 0x010d }
    L_0x010c:
        throw r0;	 Catch:{ Throwable -> 0x0110, all -> 0x010d }
    L_0x010d:
        r0 = move-exception;
        r8 = 0;
        goto L_0x0114;
    L_0x0110:
        r0 = move-exception;
        r8 = r0;
        throw r8;	 Catch:{ all -> 0x0113 }
    L_0x0113:
        r0 = move-exception;
    L_0x0114:
        $closeResource(r8, r3);	 Catch:{ Exception -> 0x0118 }
        throw r0;	 Catch:{ Exception -> 0x0118 }
    L_0x0118:
        r0 = move-exception;
        r1 = r0 instanceof java.io.FileNotFoundException;
        if (r1 == 0) goto L_0x018d;
    L_0x011d:
        r1 = java.lang.Runtime.getRuntime();
        r3 = r1.maxMemory();
        r1 = java.lang.Runtime.getRuntime();
        r5 = r1.totalMemory();
        r1 = java.lang.Runtime.getRuntime();
        r7 = r1.freeMemory();
        r1 = new java.io.File;
        r1.<init>(r2);
        r13 = "CameraStorage";
        r21 = r2;
        r2 = java.util.Locale.ENGLISH;
        r14 = "Failed to write image, memory state(max:%d, total:%d, free:%d), file state(%s;%s;%s)";
        r9 = 6;
        r9 = new java.lang.Object[r9];
        r3 = java.lang.Long.valueOf(r3);
        r4 = 0;
        r9[r4] = r3;
        r3 = java.lang.Long.valueOf(r5);
        r16 = 1;
        r9[r16] = r3;
        r3 = 2;
        r4 = java.lang.Long.valueOf(r7);
        r9[r3] = r4;
        r3 = 3;
        r4 = r1.exists();
        if (r4 == 0) goto L_0x0165;
    L_0x0162:
        r4 = "exists";
        goto L_0x0167;
    L_0x0165:
        r4 = "not exists";
    L_0x0167:
        r9[r3] = r4;
        r3 = 4;
        r4 = r1.isDirectory();
        if (r4 == 0) goto L_0x0173;
    L_0x0170:
        r4 = "isDirectory";
        goto L_0x0175;
    L_0x0173:
        r4 = "isNotDirectory";
    L_0x0175:
        r9[r3] = r4;
        r3 = 5;
        r1 = r1.canWrite();
        if (r1 == 0) goto L_0x0181;
    L_0x017e:
        r1 = "canWrite";
        goto L_0x0183;
    L_0x0181:
        r1 = "canNotWrite";
    L_0x0183:
        r9[r3] = r1;
        r1 = java.lang.String.format(r2, r14, r9);
        com.android.camera.log.Log.e(r13, r1, r0);
        goto L_0x0191;
    L_0x018d:
        r21 = r2;
        r16 = 1;
    L_0x0191:
        r1 = "CameraStorage";
        r2 = "Failed to write image";
        com.android.camera.log.Log.e(r1, r2, r0);
        r0 = com.android.camera.Util.isQuotaExceeded(r0);
        if (r0 == 0) goto L_0x01b4;
    L_0x019f:
        r0 = r15 instanceof com.android.camera.ActivityBase;
        if (r0 == 0) goto L_0x01b4;
    L_0x01a3:
        r0 = r15;
        r0 = (com.android.camera.ActivityBase) r0;
        r1 = r0.isActivityPaused();
        if (r1 != 0) goto L_0x01b4;
    L_0x01ac:
        r1 = new com.android.camera.storage.Storage$1;
        r1.<init>(r15);
        r0.runOnUiThread(r1);
    L_0x01b4:
        r0 = r16;
    L_0x01b6:
        if (r0 == 0) goto L_0x01ba;
    L_0x01b8:
        r1 = 0;
        return r1;
    L_0x01ba:
        if (r11 == 0) goto L_0x0240;
    L_0x01bc:
        r0 = com.android.camera.Util.isProduceFocusInfoSuccess(r12);
        r13 = r30;
        r14 = r31;
        r1 = com.android.camera.Util.getCenterFocusDepthIndex(r12, r13, r14);
        if (r0 == 0) goto L_0x01d3;
    L_0x01ca:
        r2 = "_";
        r3 = r24;
    L_0x01ce:
        r2 = r3.lastIndexOf(r2);
        goto L_0x01d8;
    L_0x01d3:
        r3 = r24;
        r2 = "_UBIFOCUS_";
        goto L_0x01ce;
    L_0x01d8:
        r4 = 0;
        r2 = r3.substring(r4, r2);
        r3 = generateFilepath(r2, r4, r4);
        r4 = new java.lang.StringBuilder;
        r4.<init>();
        r4.append(r2);
        if (r0 == 0) goto L_0x01ee;
    L_0x01eb:
        r5 = "_";
        goto L_0x01f0;
    L_0x01ee:
        r5 = "_UBIFOCUS_";
    L_0x01f0:
        r4.append(r5);
        r4.append(r1);
        r1 = r4.toString();
        r6 = 0;
        r1 = generateFilepath(r1, r10, r6);
        if (r3 == 0) goto L_0x0211;
    L_0x0201:
        if (r1 == 0) goto L_0x0211;
    L_0x0203:
        r4 = new java.io.File;
        r4.<init>(r1);
        r1 = new java.io.File;
        r1.<init>(r3);
        r4.renameTo(r1);
        goto L_0x0239;
    L_0x0211:
        r4 = "CameraStorage";
        r5 = new java.lang.StringBuilder;
        r5.<init>();
        r7 = "oldPath: ";
        r5.append(r7);
        if (r1 != 0) goto L_0x0221;
    L_0x021f:
        r1 = "null";
    L_0x0221:
        r5.append(r1);
        r1 = " newPath: ";
        r5.append(r1);
        if (r3 != 0) goto L_0x022e;
    L_0x022b:
        r1 = "null";
        goto L_0x022f;
    L_0x022e:
        r1 = r3;
    L_0x022f:
        r5.append(r1);
        r1 = r5.toString();
        com.android.camera.log.Log.e(r4, r1);
    L_0x0239:
        if (r0 != 0) goto L_0x023e;
    L_0x023b:
        deleteImage(r2);
    L_0x023e:
        r0 = r3;
        goto L_0x024a;
    L_0x0240:
        r13 = r30;
        r14 = r31;
        r3 = r24;
        r6 = 0;
        r2 = r3;
        r0 = r21;
    L_0x024a:
        if (r10 == 0) goto L_0x0250;
    L_0x024c:
        if (r11 != 0) goto L_0x0250;
    L_0x024e:
        r8 = 0;
        return r8;
    L_0x0250:
        r8 = 0;
        r1 = new java.lang.StringBuilder;
        r1.<init>();
        r1.append(r2);
        r3 = ".jpg";
        r1.append(r3);
        r3 = r1.toString();
        r7 = "image/jpeg";
        r1 = new java.io.File;
        r1.<init>(r0);
        r9 = r1.length();
        r1 = r15;
        r4 = r25;
        r17 = r6;
        r6 = r7;
        r7 = r28;
        r18 = r8;
        r8 = r0;
        r11 = r13;
        r13 = r12;
        r12 = r14;
        r14 = r13;
        r13 = r27;
        r19 = r27;
        r15 = r14;
        r14 = r36;
        r9 = insertToMediaStore(r1, r2, r3, r4, r6, r7, r8, r9, r11, r12, r13, r14);
        if (r9 != 0) goto L_0x02a0;
    L_0x0289:
        r1 = "CameraStorage";
        r2 = new java.lang.StringBuilder;
        r2.<init>();
        r3 = "failed to insert to DB: ";
        r2.append(r3);
        r2.append(r0);
        r0 = r2.toString();
        com.android.camera.log.Log.e(r1, r0);
        return r18;
    L_0x02a0:
        r1 = r15.length;
        r3 = (long) r1;
        r6 = android.content.ContentUris.parseId(r9);
        if (r19 != 0) goto L_0x02ab;
    L_0x02a8:
        r8 = r16;
        goto L_0x02ad;
    L_0x02ab:
        r8 = r17;
    L_0x02ad:
        r1 = r23;
        r2 = r0;
        r5 = r36;
        saveToCloudAlbum(r1, r2, r3, r5, r6, r8);
        return r9;
        */
        throw new UnsupportedOperationException("Method not decompiled: com.android.camera.storage.Storage.addImage(android.content.Context, java.lang.String, long, android.location.Location, int, byte[], int, int, boolean, boolean, boolean, boolean, boolean, java.lang.String, com.xiaomi.camera.core.PictureInfo):android.net.Uri");
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

    private static byte[] updateExif(byte[] bArr, boolean z, String str, PictureInfo pictureInfo, int i, int i2, int i3) {
        if (!z && TextUtils.isEmpty(str) && pictureInfo == null) {
            return bArr;
        }
        String str2;
        StringBuilder stringBuilder;
        long currentTimeMillis = System.currentTimeMillis();
        OutputStream byteArrayOutputStream = new ByteArrayOutputStream();
        try {
            ExifInterface exifInterface = new ExifInterface();
            exifInterface.readExif(bArr);
            if (z) {
                exifInterface.addParallelProcessComment("processing", i, i2, i3);
            }
            if (!TextUtils.isEmpty(str)) {
                str2 = TAG;
                StringBuilder stringBuilder2 = new StringBuilder();
                stringBuilder2.append("save algorithm: ");
                stringBuilder2.append(str);
                Log.d(str2, stringBuilder2.toString());
                exifInterface.addAlgorithmComment(str);
            }
            if (pictureInfo != null) {
                str2 = TAG;
                stringBuilder = new StringBuilder();
                stringBuilder.append("save xiaomi comment: ");
                stringBuilder.append(pictureInfo.getInfoString());
                stringBuilder.append(", aiType = ");
                stringBuilder.append(pictureInfo.getAiType());
                Log.d(str2, stringBuilder.toString());
                exifInterface.addAiType(pictureInfo.getAiType());
                if (pictureInfo.isBokehFrontCamera()) {
                    exifInterface.addFrontMirror(pictureInfo.isFrontMirror());
                }
                exifInterface.addXiaomiComment(pictureInfo.getInfoString());
            }
            exifInterface.writeExif(bArr, byteArrayOutputStream);
            byte[] toByteArray = byteArrayOutputStream.toByteArray();
            byteArrayOutputStream.close();
            bArr = toByteArray;
        } catch (Throwable e) {
            Log.e(ExifInterface.class.getName(), e.getMessage(), e);
        }
        str2 = TAG;
        stringBuilder = new StringBuilder();
        stringBuilder.append("update exif cost=");
        stringBuilder.append(System.currentTimeMillis() - currentTimeMillis);
        Log.v(str2, stringBuilder.toString());
        return bArr;
    }

    public static Uri addImageForGroupOrPanorama(Context context, String str, int i, long j, Location location, int i2, int i3) {
        Context context2 = context;
        String str2 = str;
        if (context2 == null || str2 == null) {
            return null;
        }
        File file;
        try {
            file = new File(str2);
        } catch (Throwable e) {
            String str3 = TAG;
            StringBuilder stringBuilder = new StringBuilder();
            stringBuilder.append("Failed to open panorama file: ");
            stringBuilder.append(e.getMessage());
            Log.e(str3, stringBuilder.toString(), e);
            file = null;
        }
        if (file == null || !file.exists()) {
            return null;
        }
        String name = file.getName();
        String str4 = str2;
        Uri insertToMediaStore = insertToMediaStore(context2, name, name, j, "image/jpeg", i, str2, file.length(), i2, i3, location, false);
        saveToCloudAlbum(context, str4, -1, location == null);
        return insertToMediaStore;
    }

    private static Uri insertToMediaStore(Context context, String str, String str2, long j, String str3, int i, String str4, long j2, int i2, int i3, Location location, boolean z) {
        Throwable e;
        StringBuilder stringBuilder;
        ContentValues contentValues = new ContentValues(11);
        contentValues.put("title", str);
        contentValues.put("_display_name", str2);
        contentValues.put("datetaken", Long.valueOf(j));
        contentValues.put("mime_type", str3);
        contentValues.put("orientation", Integer.valueOf(i));
        contentValues.put("_data", str4);
        contentValues.put("_size", Long.valueOf(j2));
        contentValues.put("width", Integer.valueOf(i2));
        contentValues.put("height", Integer.valueOf(i3));
        if (location != null) {
            contentValues.put("latitude", Double.valueOf(location.getLatitude()));
            contentValues.put("longitude", Double.valueOf(location.getLongitude()));
        }
        Uri uri = null;
        if (z) {
            Uri insert = context.getContentResolver().insert(Files.getContentUri("external"), contentValues);
            try {
                ParallelUtil.insertImageToParallelService(context, ContentUris.parseId(insert), str4);
                Log.e("algo insertUri:", insert.toString());
                return insert;
            } catch (Exception e2) {
                e = e2;
                uri = insert;
                str2 = TAG;
                stringBuilder = new StringBuilder();
                stringBuilder.append("Failed to write MediaStore:");
                stringBuilder.append(e.getMessage());
                Log.e(str2, stringBuilder.toString(), e);
                return uri;
            }
        }
        try {
            return context.getContentResolver().insert(Media.EXTERNAL_CONTENT_URI, contentValues);
        } catch (Exception e3) {
            e = e3;
            str2 = TAG;
            stringBuilder = new StringBuilder();
            stringBuilder.append("Failed to write MediaStore:");
            stringBuilder.append(e.getMessage());
            Log.e(str2, stringBuilder.toString(), e);
            return uri;
        }
    }

    public static void deleteImage(String str) {
        File file = new File(HIDEDIRECTORY);
        if (file.exists() && file.isDirectory()) {
            for (File file2 : file.listFiles()) {
                if (file2.getName().indexOf(str) != -1) {
                    file2.delete();
                }
            }
        }
    }

    public static Uri newImage(Context context, String str, long j, int i, int i2, int i3) {
        str = generateFilepath(str);
        ContentValues contentValues = new ContentValues(6);
        contentValues.put("datetaken", Long.valueOf(j));
        contentValues.put("orientation", Integer.valueOf(i));
        contentValues.put("_data", str);
        contentValues.put("width", Integer.valueOf(i2));
        contentValues.put("height", Integer.valueOf(i3));
        contentValues.put("mime_type", "image/jpeg");
        try {
            return context.getContentResolver().insert(Media.EXTERNAL_CONTENT_URI, contentValues);
        } catch (Exception e) {
            str = TAG;
            StringBuilder stringBuilder = new StringBuilder();
            stringBuilder.append("Failed to new image");
            stringBuilder.append(e);
            Log.e(str, stringBuilder.toString());
            return null;
        }
    }

    public static boolean updateImageWithExtraExif(Context context, byte[] bArr, ExifInterface exifInterface, Uri uri, String str, Location location, int i, int i2, int i3, String str2, boolean z, boolean z2, String str3, PictureInfo pictureInfo) {
        return updateImage(context, updateExif(bArr, z2, str3, pictureInfo, i, i2, i3), exifInterface, uri, str, location, i, i2, i3, str2);
    }

    public static boolean updateImage(Context context, byte[] bArr, ExifInterface exifInterface, Uri uri, String str, Location location, int i, int i2, int i3, String str2) {
        OutputStream outputStream;
        Throwable th;
        Throwable th2;
        byte[] bArr2 = bArr;
        ExifInterface exifInterface2 = exifInterface;
        String str3 = str;
        String str4 = str2;
        String generateFilepath = generateFilepath(str);
        StringBuilder stringBuilder = new StringBuilder();
        stringBuilder.append(str4 != null ? generateFilepath(str2) : generateFilepath);
        stringBuilder.append(".tmp");
        String stringBuilder2 = stringBuilder.toString();
        File file = new File(stringBuilder2);
        boolean z = false;
        if (bArr2 != null) {
            AutoCloseable bufferedInputStream;
            try {
                OutputStream fileOutputStream;
                bufferedInputStream = new BufferedInputStream(new ByteArrayInputStream(bArr2));
                if (isUseDocumentMode()) {
                    fileOutputStream = FileCompat.getFileOutputStream(stringBuilder2, true);
                } else {
                    fileOutputStream = new BufferedOutputStream(new FileOutputStream(file));
                }
                outputStream = fileOutputStream;
                if (exifInterface2 == null) {
                    byte[] bArr3 = new byte[4096];
                    while (true) {
                        int read = bufferedInputStream.read(bArr3);
                        if (read == -1) {
                            break;
                        }
                        outputStream.write(bArr3, 0, read);
                    }
                } else {
                    try {
                        exifInterface2.writeExif(bArr2, outputStream);
                    } catch (IOException e) {
                        try {
                            Log.e(TAG, "Failed to rewrite Exif");
                            outputStream.write(bArr2);
                        } catch (Throwable th3) {
                            th2 = th3;
                        }
                    }
                }
                if (outputStream != null) {
                    $closeResource(null, outputStream);
                }
                $closeResource(null, bufferedInputStream);
            } catch (Throwable th22) {
                Log.e(TAG, "Failed to write image", th22);
                return false;
            } catch (Throwable th4) {
                $closeResource(th22, bufferedInputStream);
            }
        } else if (str4 != null) {
            stringBuilder2 = generateFilepath(str2);
        }
        long length = file.length();
        if (isUseDocumentMode()) {
            try {
                FileCompat.renameFile(stringBuilder2, generateFilepath);
            } catch (IOException e2) {
            }
        } else {
            boolean renameTo = file.renameTo(new File(generateFilepath));
            if (!(exifInterface2 == null || str4 == null)) {
                try {
                    new File(generateFilepath(str2)).delete();
                } catch (Throwable th222) {
                    String str5 = TAG;
                    StringBuilder stringBuilder3 = new StringBuilder();
                    stringBuilder3.append("Exception when delete old file ");
                    stringBuilder3.append(str4);
                    Log.e(str5, stringBuilder3.toString(), th222);
                }
            }
            if (!renameTo) {
                String str6 = TAG;
                StringBuilder stringBuilder4 = new StringBuilder();
                stringBuilder4.append("renameTo failed, tmpPath = ");
                stringBuilder4.append(stringBuilder2);
                Log.w(str6, stringBuilder4.toString());
                return false;
            }
        }
        ContentValues contentValues = new ContentValues(10);
        contentValues.put("title", str3);
        StringBuilder stringBuilder5 = new StringBuilder();
        stringBuilder5.append(str3);
        stringBuilder5.append(JPEG_SUFFIX);
        contentValues.put("_display_name", stringBuilder5.toString());
        if (bArr2 != null) {
            contentValues.put("mime_type", "image/jpeg");
            contentValues.put("orientation", Integer.valueOf(i));
            contentValues.put("_size", Long.valueOf(length));
            contentValues.put("width", Integer.valueOf(i2));
            contentValues.put("height", Integer.valueOf(i3));
            if (location != null) {
                contentValues.put("latitude", Double.valueOf(location.getLatitude()));
                contentValues.put("longitude", Double.valueOf(location.getLongitude()));
            }
            contentValues.put("_data", generateFilepath);
        } else if (str4 != null) {
            contentValues.put("_data", generateFilepath);
        }
        context.getContentResolver().update(uri, contentValues, null, null);
        long length2 = (long) bArr2.length;
        if (location == null) {
            z = true;
        }
        saveToCloudAlbum(context, generateFilepath, length2, z);
        return true;
        if (outputStream != null) {
            $closeResource(th, outputStream);
        }
        throw th222;
    }

    public static void addDNGToDataBase(Activity activity, String str) {
        String generateFilepath = generateFilepath(str, ".dng");
        ContentValues contentValues = new ContentValues(4);
        contentValues.put("title", str);
        StringBuilder stringBuilder = new StringBuilder();
        stringBuilder.append(str);
        stringBuilder.append(".dng");
        contentValues.put("_display_name", stringBuilder.toString());
        contentValues.put("media_type", Integer.valueOf(1));
        contentValues.put("_data", generateFilepath);
        try {
            activity.getContentResolver().insert(Files.getContentUri("external"), contentValues);
        } catch (Exception e) {
            str = TAG;
            StringBuilder stringBuilder2 = new StringBuilder();
            stringBuilder2.append("Failed to write MediaStore");
            stringBuilder2.append(e);
            Log.e(str, stringBuilder2.toString());
        }
    }

    public static void saveToCloudAlbum(Context context, String str, long j, boolean z) {
        saveToCloudAlbum(context, str, j, false, -1, z);
    }

    public static void saveToCloudAlbum(Context context, String str, long j, boolean z, long j2, boolean z2) {
        context.sendBroadcast(getSaveToCloudIntent(context, str, j, z, j2, z2));
    }

    private static Intent getSaveToCloudIntent(Context context, String str, long j, boolean z, long j2, boolean z2) {
        Intent intent = new Intent(SAVE_TO_CLOUD_ALBUM_ACTION);
        intent.setPackage("com.miui.gallery");
        List queryBroadcastReceivers = context.getPackageManager().queryBroadcastReceivers(intent, 0);
        if (queryBroadcastReceivers != null && queryBroadcastReceivers.size() > 0) {
            intent.setComponent(new ComponentName("com.miui.gallery", ((ResolveInfo) queryBroadcastReceivers.get(0)).activityInfo.name));
        }
        intent.putExtra(SAVE_TO_CLOUD_ALBUM_PATH_KAY, str);
        intent.putExtra(SAVE_TO_CLOUD_ALBUM_FILE_LENGTH, j);
        if (z) {
            intent.putExtra(SAVE_TO_CLOUD_ALBUM_TEMP_FILE_KAY, true);
            intent.putExtra(SAVE_TO_CLOUD_ALBUM_STORE_ID_KAY, j2);
        }
        if (z2) {
            intent.putExtra(SAVE_TO_CLOUD_ALBUM_CACHE_LOCATION_KEY, LocationManager.instance().getLastKnownLocation());
            Log.d(TAG, "broadcast last location to gallery");
        }
        return intent;
    }

    public static Bitmap flipJpeg(byte[] bArr, boolean z, boolean z2) {
        if (bArr == null) {
            return null;
        }
        Options options = new Options();
        options.inPurgeable = true;
        Bitmap decodeByteArray = BitmapFactory.decodeByteArray(bArr, 0, bArr.length, options);
        Matrix matrix = new Matrix();
        float f = 1.0f;
        float f2 = z ? -1.0f : 1.0f;
        if (z2) {
            f = -1.0f;
        }
        matrix.setScale(f2, f, ((float) decodeByteArray.getWidth()) * 0.5f, ((float) decodeByteArray.getHeight()) * 0.5f);
        try {
            Bitmap createBitmap = Bitmap.createBitmap(decodeByteArray, 0, 0, decodeByteArray.getWidth(), decodeByteArray.getHeight(), matrix, true);
            if (createBitmap != decodeByteArray) {
                decodeByteArray.recycle();
            }
            if (createBitmap.getWidth() == -1 || createBitmap.getHeight() == -1) {
                return null;
            }
            return createBitmap;
        } catch (Throwable e) {
            Log.w(TAG, "Failed to rotate thumbnail", e);
            return null;
        }
    }

    public static String generatePrimaryFilepath(String str) {
        StringBuilder stringBuilder = new StringBuilder();
        stringBuilder.append(PRIMARY_STORAGE_PATH);
        stringBuilder.append(CAMERA_STORAGE_PATH_SUFFIX);
        stringBuilder.append('/');
        stringBuilder.append(str);
        return stringBuilder.toString();
    }

    public static String generateFilepath(String str) {
        return generateFilepath(str, JPEG_SUFFIX);
    }

    public static String generateFilepath(String str, boolean z, boolean z2) {
        if (z && isLowStorageSpace(HIDEDIRECTORY)) {
            return null;
        }
        StringBuilder stringBuilder = new StringBuilder();
        stringBuilder.append(z ? HIDEDIRECTORY : DIRECTORY);
        stringBuilder.append('/');
        stringBuilder.append(str);
        stringBuilder.append(z2 ? ".y" : JPEG_SUFFIX);
        return stringBuilder.toString();
    }

    public static String generateFilepath(String str, String str2) {
        StringBuilder stringBuilder = new StringBuilder();
        stringBuilder.append(DIRECTORY);
        stringBuilder.append('/');
        stringBuilder.append(str);
        stringBuilder.append(str2);
        return stringBuilder.toString();
    }

    public static long getAvailableSpace(String str) {
        if (TextUtils.isEmpty(str)) {
            Log.w(TAG, "getAvailableSpace path is empty");
            return -1;
        }
        boolean mkdirs;
        File file = new File(str);
        if (isUseDocumentMode()) {
            mkdirs = FileCompat.mkdirs(str);
        } else {
            mkdirs = Util.mkdirs(file, 511, -1, -1);
        }
        if (file.exists() && file.isDirectory()) {
            StringBuilder stringBuilder;
            if (mkdirs && str.endsWith(CAMERA_STORAGE_PATH_SUFFIX)) {
                String str2;
                if ((MediaProviderUtil.insertCameraDirectory(CameraAppImpl.getAndroidContext(), str) != null ? 1 : null) != null) {
                    str2 = TAG;
                    stringBuilder = new StringBuilder();
                    stringBuilder.append("insertDirectory success, path ");
                    stringBuilder.append(str);
                    Log.d(str2, stringBuilder.toString());
                } else {
                    str2 = TAG;
                    stringBuilder = new StringBuilder();
                    stringBuilder.append("insertDirectory fail, path ");
                    stringBuilder.append(str);
                    Log.w(str2, stringBuilder.toString());
                }
            }
            try {
                if (HIDEDIRECTORY.equals(str)) {
                    stringBuilder = new StringBuilder();
                    stringBuilder.append(HIDEDIRECTORY);
                    stringBuilder.append(File.separator);
                    stringBuilder.append(AVOID_SCAN_FILE_NAME);
                    Util.createFile(new File(stringBuilder.toString()));
                }
                long availableBytes = new StatFs(str).getAvailableBytes();
                if (DIRECTORY.equals(str)) {
                    if (isUsePhoneStorage() && isQuotaSupported() && availableBytes < sReserveBytes) {
                        Context androidContext = CameraAppImpl.getAndroidContext();
                        ApplicationInfo applicationInfo = androidContext.getApplicationInfo();
                        try {
                            long totalBytes = sQuotaBytes - ((StorageStatsManager) androidContext.getSystemService(StorageStatsManager.class)).queryExternalStatsForUser(applicationInfo.storageUuid, UserHandle.getUserHandleForUid(applicationInfo.uid)).getTotalBytes();
                            availableBytes = 0;
                            if (totalBytes >= 0) {
                                availableBytes = totalBytes;
                            }
                        } catch (Throwable e) {
                            Log.e(TAG, e.getMessage(), e);
                        }
                    }
                    setLeftSpace(availableBytes);
                }
                return availableBytes;
            } catch (Throwable e2) {
                Log.i(TAG, "Fail to access external storage", e2);
                return -3;
            }
        }
        String str3 = TAG;
        StringBuilder stringBuilder2 = new StringBuilder();
        stringBuilder2.append("getAvailableSpace path = ");
        stringBuilder2.append(str);
        stringBuilder2.append(", exists = ");
        stringBuilder2.append(file.exists());
        stringBuilder2.append(", isDirectory = ");
        stringBuilder2.append(file.isDirectory());
        stringBuilder2.append(", canWrite = ");
        stringBuilder2.append(file.canWrite());
        Log.w(str3, stringBuilder2.toString());
        return -1;
    }

    public static long getAvailableSpace() {
        return getAvailableSpace(DIRECTORY);
    }

    public static boolean updateImageSize(ContentResolver contentResolver, Uri uri, long j) {
        ContentValues contentValues = new ContentValues(1);
        contentValues.put("_size", Long.valueOf(j));
        try {
            contentResolver.update(uri, contentValues, null, null);
            return true;
        } catch (Exception e) {
            String str = TAG;
            StringBuilder stringBuilder = new StringBuilder();
            stringBuilder.append("Failed to updateMediaStore");
            stringBuilder.append(e);
            Log.e(str, stringBuilder.toString());
            return false;
        }
    }

    public static boolean isLowStorageSpace(String str) {
        return getAvailableSpace(str) < LOW_STORAGE_THRESHOLD;
    }

    public static boolean hasSecondaryStorage() {
        boolean z = false;
        if (VERSION.SDK_INT == 28) {
            if (UserHandle.myUserId() == 0 && b.ga() && SECONDARY_STORAGE_PATH != null) {
                z = true;
            }
            return z;
        }
        if (b.ga() && SECONDARY_STORAGE_PATH != null) {
            z = true;
        }
        return z;
    }

    public static boolean secondaryStorageMounted() {
        StringBuilder stringBuilder = new StringBuilder();
        stringBuilder.append(SECONDARY_STORAGE_PATH);
        stringBuilder.append(File.separator);
        stringBuilder.append(Environment.DIRECTORY_DCIM);
        return hasSecondaryStorage() && getAvailableSpace(stringBuilder.toString()) > 0;
    }

    public static boolean isCurrentStorageIsSecondary() {
        return SECONDARY_STORAGE_PATH != null && SECONDARY_STORAGE_PATH.equals(sCurrentStoragePath);
    }

    public static void switchStoragePathIfNeeded() {
        if (hasSecondaryStorage()) {
            String str = FIRST_CONSIDER_STORAGE_PATH;
            String str2 = SECONDARY_STORAGE_PATH;
            if (FIRST_CONSIDER_STORAGE_PATH.equals(SECONDARY_STORAGE_PATH)) {
                str2 = PRIMARY_STORAGE_PATH;
            }
            String str3 = sCurrentStoragePath;
            StringBuilder stringBuilder = new StringBuilder();
            stringBuilder.append(str);
            stringBuilder.append(CAMERA_STORAGE_PATH_SUFFIX);
            if (isLowStorageSpace(stringBuilder.toString())) {
                StringBuilder stringBuilder2 = new StringBuilder();
                stringBuilder2.append(str2);
                stringBuilder2.append(CAMERA_STORAGE_PATH_SUFFIX);
                if (!isLowStorageSpace(stringBuilder2.toString())) {
                    sCurrentStoragePath = str2;
                } else {
                    return;
                }
            }
            sCurrentStoragePath = str;
            if (!sCurrentStoragePath.equals(str3)) {
                updateDirectory();
                if (!(sStorageListener == null || sStorageListener.get() == null)) {
                    ((StorageListener) sStorageListener.get()).onStoragePathChanged();
                }
            }
            str = TAG;
            StringBuilder stringBuilder3 = new StringBuilder();
            stringBuilder3.append("Storage path is switched path = ");
            stringBuilder3.append(DIRECTORY);
            stringBuilder3.append(", FIRST_CONSIDER_STORAGE_PATH = ");
            stringBuilder3.append(FIRST_CONSIDER_STORAGE_PATH);
            stringBuilder3.append(", SECONDARY_STORAGE_PATH = ");
            stringBuilder3.append(SECONDARY_STORAGE_PATH);
            Log.i(str, stringBuilder3.toString());
        }
    }

    public static void switchToPhoneStorage() {
        FIRST_CONSIDER_STORAGE_PATH = PRIMARY_STORAGE_PATH;
        if (!PRIMARY_STORAGE_PATH.equals(sCurrentStoragePath)) {
            Log.v(TAG, "switchToPhoneStorage");
            sCurrentStoragePath = PRIMARY_STORAGE_PATH;
            updateDirectory();
            if (sStorageListener != null && sStorageListener.get() != null) {
                ((StorageListener) sStorageListener.get()).onStoragePathChanged();
            }
        }
    }

    public static void readSystemPriorityStorage() {
        boolean isPriorityStorage;
        if (hasSecondaryStorage()) {
            isPriorityStorage = PriorityStorageBroadcastReceiver.isPriorityStorage();
            CameraSettings.setPriorityStoragePreference(isPriorityStorage);
        } else {
            isPriorityStorage = false;
        }
        FIRST_CONSIDER_STORAGE_PATH = isPriorityStorage ? SECONDARY_STORAGE_PATH : PRIMARY_STORAGE_PATH;
        sCurrentStoragePath = FIRST_CONSIDER_STORAGE_PATH;
        updateDirectory();
    }

    public static boolean isRelatedStorage(Uri uri) {
        boolean z = false;
        if (uri == null) {
            return false;
        }
        String path = uri.getPath();
        if (path != null && (path.equals(PRIMARY_STORAGE_PATH) || path.equals(SECONDARY_STORAGE_PATH))) {
            z = true;
        }
        return z;
    }

    public static boolean isUsePhoneStorage() {
        return PRIMARY_STORAGE_PATH.equals(sCurrentStoragePath);
    }

    public static boolean isPhoneStoragePriority() {
        return PRIMARY_STORAGE_PATH.equals(FIRST_CONSIDER_STORAGE_PATH);
    }

    public static void setStorageListener(StorageListener storageListener) {
        if (storageListener != null) {
            sStorageListener = new WeakReference(storageListener);
        }
    }

    public static boolean isLowStorageAtLastPoint() {
        return getLeftSpace() < LOW_STORAGE_THRESHOLD;
    }

    public static long getLeftSpace() {
        long j = LEFT_SPACE.get();
        String str = TAG;
        StringBuilder stringBuilder = new StringBuilder();
        stringBuilder.append("getLeftSpace() return ");
        stringBuilder.append(j);
        Log.i(str, stringBuilder.toString());
        return j;
    }

    private static void setLeftSpace(long j) {
        LEFT_SPACE.set(j);
        String str = TAG;
        StringBuilder stringBuilder = new StringBuilder();
        stringBuilder.append("setLeftSpace(");
        stringBuilder.append(j);
        stringBuilder.append(")");
        Log.i(str, stringBuilder.toString());
    }

    private static void updateDirectory() {
        StringBuilder stringBuilder = new StringBuilder();
        stringBuilder.append(sCurrentStoragePath);
        stringBuilder.append(CAMERA_STORAGE_PATH_SUFFIX);
        DIRECTORY = stringBuilder.toString();
        stringBuilder = new StringBuilder();
        stringBuilder.append(sCurrentStoragePath);
        stringBuilder.append(HIDE_CAMERA_STORAGE_PATH_SUFFIX);
        HIDEDIRECTORY = stringBuilder.toString();
        BUCKET_ID = DIRECTORY.toLowerCase(Locale.ENGLISH).hashCode();
    }

    /* JADX WARNING: Removed duplicated region for block: B:27:0x009c A:{SYNTHETIC, Splitter: B:27:0x009c} */
    /* JADX WARNING: Removed duplicated region for block: B:33:? A:{SYNTHETIC, RETURN} */
    /* JADX WARNING: Removed duplicated region for block: B:24:0x0094 A:{SYNTHETIC, Splitter: B:24:0x0094} */
    public static void saveMorphoPanoramaOriginalPic(java.nio.ByteBuffer r2, int r3, java.lang.String r4) {
        /*
        r0 = new java.lang.StringBuilder;
        r0.<init>();
        r1 = DIRECTORY;
        r0.append(r1);
        r1 = java.io.File.separator;
        r0.append(r1);
        r0.append(r4);
        r1 = java.io.File.separator;
        r0.append(r1);
        r0 = r0.toString();
        r1 = new java.io.File;
        r1.<init>(r0);
        r0 = r1.exists();
        if (r0 != 0) goto L_0x002a;
    L_0x0027:
        r1.mkdirs();
    L_0x002a:
        r0 = new java.lang.StringBuilder;
        r0.<init>();
        r0.append(r4);
        r1 = java.io.File.separator;
        r0.append(r1);
        r0.append(r4);
        r4 = "_";
        r0.append(r4);
        r0.append(r3);
        r3 = r0.toString();
        r3 = generateFilepath(r3);
        r4 = 0;
        r0 = new java.io.File;	 Catch:{ Exception -> 0x0077 }
        r0.<init>(r3);	 Catch:{ Exception -> 0x0077 }
        r3 = r0.exists();	 Catch:{ Exception -> 0x0077 }
        if (r3 != 0) goto L_0x0059;
    L_0x0056:
        r0.createNewFile();	 Catch:{ Exception -> 0x0077 }
    L_0x0059:
        r3 = new java.io.FileOutputStream;	 Catch:{ Exception -> 0x0077 }
        r1 = 0;
        r3.<init>(r0, r1);	 Catch:{ Exception -> 0x0077 }
        r3 = r3.getChannel();	 Catch:{ Exception -> 0x0077 }
        r3.write(r2);	 Catch:{ Exception -> 0x0072, all -> 0x006f }
        if (r3 == 0) goto L_0x006e;
    L_0x0068:
        r3.close();	 Catch:{ Exception -> 0x006c }
        goto L_0x006e;
    L_0x006c:
        r2 = move-exception;
        goto L_0x0098;
    L_0x006e:
        goto L_0x0098;
    L_0x006f:
        r2 = move-exception;
        r4 = r3;
        goto L_0x0099;
    L_0x0072:
        r2 = move-exception;
        r4 = r3;
        goto L_0x0078;
    L_0x0075:
        r2 = move-exception;
        goto L_0x0099;
    L_0x0077:
        r2 = move-exception;
    L_0x0078:
        r3 = "CameraStorage";
        r0 = new java.lang.StringBuilder;	 Catch:{ all -> 0x0075 }
        r0.<init>();	 Catch:{ all -> 0x0075 }
        r1 = "saveMorphoPanoramaOriginalPic  ";
        r0.append(r1);	 Catch:{ all -> 0x0075 }
        r2 = r2.toString();	 Catch:{ all -> 0x0075 }
        r0.append(r2);	 Catch:{ all -> 0x0075 }
        r2 = r0.toString();	 Catch:{ all -> 0x0075 }
        com.android.camera.log.Log.e(r3, r2);	 Catch:{ all -> 0x0075 }
        if (r4 == 0) goto L_0x006e;
    L_0x0094:
        r4.close();	 Catch:{ Exception -> 0x006c }
        goto L_0x006e;
    L_0x0098:
        return;
        if (r4 == 0) goto L_0x00a2;
    L_0x009c:
        r4.close();	 Catch:{ Exception -> 0x00a0 }
        goto L_0x00a2;
    L_0x00a0:
        r3 = move-exception;
    L_0x00a2:
        throw r2;
        */
        throw new UnsupportedOperationException("Method not decompiled: com.android.camera.storage.Storage.saveMorphoPanoramaOriginalPic(java.nio.ByteBuffer, int, java.lang.String):void");
    }

    /* JADX WARNING: Removed duplicated region for block: B:26:0x0089 A:{SYNTHETIC, Splitter: B:26:0x0089} */
    public static void saveOriginalPic(byte[] r2, int r3, java.lang.String r4) {
        /*
        r0 = new java.lang.StringBuilder;
        r0.<init>();
        r1 = DIRECTORY;
        r0.append(r1);
        r1 = java.io.File.separator;
        r0.append(r1);
        r0.append(r4);
        r1 = java.io.File.separator;
        r0.append(r1);
        r0 = r0.toString();
        r1 = new java.io.File;
        r1.<init>(r0);
        r0 = r1.exists();
        if (r0 != 0) goto L_0x002a;
    L_0x0027:
        r1.mkdirs();
    L_0x002a:
        r0 = new java.lang.StringBuilder;
        r0.<init>();
        r0.append(r4);
        r1 = java.io.File.separator;
        r0.append(r1);
        r0.append(r4);
        r4 = "_";
        r0.append(r4);
        r0.append(r3);
        r3 = r0.toString();
        r3 = generateFilepath(r3);
        r4 = 0;
        r0 = new java.io.File;	 Catch:{ Exception -> 0x0071 }
        r0.<init>(r3);	 Catch:{ Exception -> 0x0071 }
        r3 = r0.exists();	 Catch:{ Exception -> 0x0071 }
        if (r3 != 0) goto L_0x0059;
    L_0x0056:
        r0.createNewFile();	 Catch:{ Exception -> 0x0071 }
    L_0x0059:
        r3 = new java.io.FileOutputStream;	 Catch:{ Exception -> 0x0071 }
        r3.<init>(r0);	 Catch:{ Exception -> 0x0071 }
        r3.write(r2);	 Catch:{ Exception -> 0x006c, all -> 0x0069 }
        r3.flush();	 Catch:{ Exception -> 0x0082 }
        r3.close();	 Catch:{ Exception -> 0x0082 }
        goto L_0x0084;
    L_0x0069:
        r2 = move-exception;
        r4 = r3;
        goto L_0x0086;
    L_0x006c:
        r2 = move-exception;
        r4 = r3;
        goto L_0x0072;
    L_0x006f:
        r2 = move-exception;
        goto L_0x0086;
    L_0x0071:
        r2 = move-exception;
    L_0x0072:
        r3 = "CameraStorage";
        r0 = "saveMorphoPanoramaOriginalPic exception occurs";
        com.android.camera.log.Log.e(r3, r0, r2);	 Catch:{ all -> 0x006f }
        if (r4 == 0) goto L_0x0084;
    L_0x007b:
        r4.flush();	 Catch:{ Exception -> 0x0082 }
        r4.close();	 Catch:{ Exception -> 0x0082 }
        goto L_0x0084;
    L_0x0082:
        r2 = move-exception;
        goto L_0x0085;
    L_0x0085:
        return;
        if (r4 == 0) goto L_0x0092;
    L_0x0089:
        r4.flush();	 Catch:{ Exception -> 0x0090 }
        r4.close();	 Catch:{ Exception -> 0x0090 }
        goto L_0x0092;
    L_0x0090:
        r3 = move-exception;
    L_0x0092:
        throw r2;
        */
        throw new UnsupportedOperationException("Method not decompiled: com.android.camera.storage.Storage.saveOriginalPic(byte[], int, java.lang.String):void");
    }

    public static boolean isUseDocumentMode() {
        return VERSION.SDK_INT >= 28 && !isPhoneStoragePriority();
    }
}
