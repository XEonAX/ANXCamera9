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
import com.android.camera.ActivityBase;
import com.android.camera.CameraAppImpl;
import com.android.camera.CameraSettings;
import com.android.camera.ExifHelper;
import com.android.camera.FileCompat;
import com.android.camera.LocationManager;
import com.android.camera.R;
import com.android.camera.ToastUtils;
import com.android.camera.Util;
import com.android.camera.lib.compatibility.util.CompatibilityUtils;
import com.android.camera.log.Log;
import com.android.gallery3d.exif.ExifInterface;
import com.mi.config.b;
import com.ss.android.ttve.common.TEDefine;
import com.xiaomi.camera.core.PictureInfo;
import com.xiaomi.camera.parallelservice.util.ParallelUtil;
import java.io.BufferedInputStream;
import java.io.BufferedOutputStream;
import java.io.ByteArrayInputStream;
import java.io.ByteArrayOutputStream;
import java.io.File;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.OutputStream;
import java.lang.ref.WeakReference;
import java.nio.ByteBuffer;
import java.nio.channels.FileChannel;
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
    private static final String TAG = Storage.class.getSimpleName();
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
        if (b.ge()) {
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
            } else {
                SECONDARY_STORAGE_PATH = null;
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

    /* JADX WARNING: Removed duplicated region for block: B:74:0x0117 A:{Splitter: B:3:0x0065, ExcHandler: all (r0_22 'th' java.lang.Throwable)} */
    /* JADX WARNING: Failed to process nested try/catch */
    /* JADX WARNING: Missing block: B:72:0x0114, code:
            r0 = th;
     */
    /* JADX WARNING: Missing block: B:73:0x0115, code:
            r7 = null;
     */
    /* JADX WARNING: Missing block: B:74:0x0117, code:
            r0 = move-exception;
     */
    /* JADX WARNING: Missing block: B:75:0x0118, code:
            r7 = r0;
     */
    /* JADX WARNING: Missing block: B:80:?, code:
            $closeResource(r7, r3);
     */
    /* JADX WARNING: Missing block: B:81:0x011e, code:
            throw r0;
     */
    /* Code decompiled incorrectly, please refer to instructions dump. */
    public static Uri addImage(Context context, String str, long j, Location location, int i, byte[] bArr, int i2, int i3, boolean z, boolean z2, boolean z3, boolean z4, boolean z5, String str2, PictureInfo pictureInfo) {
        Throwable th;
        final Context context2 = context;
        String str3 = str;
        Location location2 = location;
        int i4 = i;
        boolean z6 = z2;
        boolean z7 = z3;
        String str4 = TAG;
        StringBuilder stringBuilder = new StringBuilder();
        stringBuilder.append("addImage: parallel=");
        boolean z8 = z5;
        stringBuilder.append(z8);
        stringBuilder.append(" appendExif=");
        stringBuilder.append(z4);
        Log.d(str4, stringBuilder.toString());
        byte[] updateExif = updateExif(bArr, z8, str2, pictureInfo, i4, i2, i3);
        String generateFilepath = generateFilepath(str3, z6, z7);
        str4 = TAG;
        StringBuilder stringBuilder2 = new StringBuilder();
        stringBuilder2.append("addImage: path=");
        stringBuilder2.append(generateFilepath);
        Log.d(str4, stringBuilder2.toString());
        String str5;
        int i5;
        boolean z9;
        try {
            AutoCloseable bufferedInputStream = new BufferedInputStream(new ByteArrayInputStream(updateExif));
            Throwable th2;
            try {
                OutputStream fileOutputStream;
                if (isUseDocumentMode()) {
                    fileOutputStream = FileCompat.getFileOutputStream(generateFilepath, true);
                } else {
                    fileOutputStream = new FileOutputStream(generateFilepath);
                }
                OutputStream outputStream = fileOutputStream;
                try {
                    boolean z10;
                    boolean z11;
                    OutputStream bufferedOutputStream = new BufferedOutputStream(outputStream);
                    byte[] bArr2;
                    int read;
                    if (z) {
                        try {
                            z10 = i4 % 180 == 0;
                            Bitmap flipJpeg = flipJpeg(updateExif, z10, z10 ^ 1);
                            if (flipJpeg != null) {
                                ExifInterface exif = Util.getExif(updateExif);
                                byte[] thumbnailBytes = exif.getThumbnailBytes();
                                if (thumbnailBytes != null) {
                                    Bitmap flipJpeg2 = flipJpeg(thumbnailBytes, z10, z10 ^ 1);
                                    if (flipJpeg2 != null) {
                                        exif.setCompressedThumbnail(flipJpeg2);
                                        flipJpeg2.recycle();
                                    }
                                    z11 = false;
                                } else {
                                    z11 = z4;
                                }
                                exif.writeExif(flipJpeg, bufferedOutputStream);
                                flipJpeg.recycle();
                            } else {
                                bArr2 = new byte[4096];
                                while (true) {
                                    read = bufferedInputStream.read(bArr2);
                                    if (read == -1) {
                                        break;
                                    }
                                    bufferedOutputStream.write(bArr2, 0, read);
                                }
                                z11 = z4;
                            }
                        } catch (Throwable th3) {
                            th = th3;
                        }
                    } else {
                        bArr2 = new byte[4096];
                        while (true) {
                            read = bufferedInputStream.read(bArr2);
                            if (read == -1) {
                                break;
                            }
                            bufferedOutputStream.write(bArr2, 0, read);
                        }
                        z11 = z4;
                    }
                    if (z11) {
                        bufferedOutputStream.flush();
                        ExifHelper.writeExif(generateFilepath, i4, location2, System.currentTimeMillis());
                    }
                    $closeResource(null, bufferedOutputStream);
                    if (outputStream != null) {
                        $closeResource(null, outputStream);
                    }
                    $closeResource(null, bufferedInputStream);
                    str5 = generateFilepath;
                    i5 = 0;
                    z9 = true;
                    if (i5 != 0) {
                        return null;
                    }
                    int i6;
                    int i7;
                    boolean z12;
                    if (z7) {
                        boolean isProduceFocusInfoSuccess = Util.isProduceFocusInfoSuccess(updateExif);
                        i6 = i2;
                        i7 = i3;
                        int centerFocusDepthIndex = Util.getCenterFocusDepthIndex(updateExif, i6, i7);
                        str3 = str3.substring(0, str3.lastIndexOf(isProduceFocusInfoSuccess ? "_" : UBIFOCUS_SUFFIX));
                        String generateFilepath2 = generateFilepath(str3, false, false);
                        StringBuilder stringBuilder3 = new StringBuilder();
                        stringBuilder3.append(str3);
                        stringBuilder3.append(isProduceFocusInfoSuccess ? "_" : UBIFOCUS_SUFFIX);
                        stringBuilder3.append(centerFocusDepthIndex);
                        generateFilepath = stringBuilder3.toString();
                        z10 = z2;
                        z12 = false;
                        generateFilepath = generateFilepath(generateFilepath, z10, false);
                        if (generateFilepath2 == null || generateFilepath == null) {
                            String str6 = TAG;
                            StringBuilder stringBuilder4 = new StringBuilder();
                            stringBuilder4.append("oldPath: ");
                            if (generateFilepath == null) {
                                generateFilepath = TEDefine.FACE_BEAUTY_NULL;
                            }
                            stringBuilder4.append(generateFilepath);
                            stringBuilder4.append(" newPath: ");
                            stringBuilder4.append(generateFilepath2 == null ? TEDefine.FACE_BEAUTY_NULL : generateFilepath2);
                            Log.e(str6, stringBuilder4.toString());
                        } else {
                            new File(generateFilepath).renameTo(new File(generateFilepath2));
                        }
                        if (!isProduceFocusInfoSuccess) {
                            deleteImage(str3);
                        }
                        generateFilepath = str3;
                        str4 = generateFilepath2;
                    } else {
                        i6 = i2;
                        i7 = i3;
                        z10 = z2;
                        z12 = false;
                        generateFilepath = str3;
                        str4 = str5;
                    }
                    if (z10 && !z7) {
                        return null;
                    }
                    StringBuilder stringBuilder5 = new StringBuilder();
                    stringBuilder5.append(generateFilepath);
                    stringBuilder5.append(JPEG_SUFFIX);
                    boolean z13 = z12;
                    boolean z14 = z9;
                    Uri uri = null;
                    Location location3 = location;
                    byte[] bArr3 = updateExif;
                    Uri insertToMediaStore = insertToMediaStore(context2, generateFilepath, stringBuilder5.toString(), j, "image/jpeg", i, str4, new File(str4).length(), i6, i7, location, z5);
                    if (insertToMediaStore == null) {
                        str3 = TAG;
                        stringBuilder = new StringBuilder();
                        stringBuilder.append("failed to insert to DB: ");
                        stringBuilder.append(str4);
                        Log.e(str3, stringBuilder.toString());
                        return uri;
                    }
                    saveToCloudAlbum(context, str4, (long) bArr3.length, z5, ContentUris.parseId(insertToMediaStore), location3 == null ? z14 : z13);
                    return insertToMediaStore;
                    $closeResource(th2, bufferedOutputStream);
                    throw th;
                    if (outputStream != null) {
                        $closeResource(th2, outputStream);
                    }
                    throw th;
                } catch (Throwable th4) {
                    th = th4;
                }
            } catch (Throwable th5) {
                th = th5;
            }
        } catch (Throwable th6) {
            if (th6 instanceof FileNotFoundException) {
                long maxMemory = Runtime.getRuntime().maxMemory();
                long totalMemory = Runtime.getRuntime().totalMemory();
                long freeMemory = Runtime.getRuntime().freeMemory();
                File file = new File(generateFilepath);
                str5 = generateFilepath;
                generateFilepath = TAG;
                Locale locale = Locale.ENGLISH;
                String str7 = "Failed to write image, memory state(max:%d, total:%d, free:%d), file state(%s;%s;%s)";
                Object[] objArr = new Object[6];
                objArr[0] = Long.valueOf(maxMemory);
                z9 = true;
                objArr[1] = Long.valueOf(totalMemory);
                objArr[2] = Long.valueOf(freeMemory);
                objArr[3] = file.exists() ? "exists" : "not exists";
                objArr[4] = file.isDirectory() ? "isDirectory" : "isNotDirectory";
                objArr[5] = file.canWrite() ? "canWrite" : "canNotWrite";
                Log.e(generateFilepath, String.format(locale, str7, objArr), th6);
            } else {
                str5 = generateFilepath;
                z9 = true;
            }
            Log.e(TAG, "Failed to write image", th6);
            if (Util.isQuotaExceeded(th6) && (context2 instanceof ActivityBase)) {
                ActivityBase activityBase = (ActivityBase) context2;
                if (!activityBase.isActivityPaused()) {
                    activityBase.runOnUiThread(new Runnable() {
                        public void run() {
                            ToastUtils.showToast(context2, (int) R.string.spaceIsLow_content_primary_storage_priority);
                        }
                    });
                }
            }
            i5 = z9;
        }
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
        Uri insert;
        if (z) {
            insert = context.getContentResolver().insert(Files.getContentUri("external"), contentValues);
            try {
                ParallelUtil.insertImageToParallelService(context, ContentUris.parseId(insert), str4);
                String str5 = TAG;
                StringBuilder stringBuilder2 = new StringBuilder();
                stringBuilder2.append("algo insertUri: ");
                stringBuilder2.append(insert.toString());
                Log.d(str5, stringBuilder2.toString());
                return insert;
            } catch (Exception e2) {
                e = e2;
                str = TAG;
                stringBuilder = new StringBuilder();
                stringBuilder.append("Failed to write MediaStore:");
                stringBuilder.append(e.getMessage());
                Log.e(str, stringBuilder.toString(), e);
                return insert;
            }
        }
        try {
            return context.getContentResolver().insert(Media.EXTERNAL_CONTENT_URI, contentValues);
        } catch (Exception e3) {
            e = e3;
            insert = null;
            str = TAG;
            stringBuilder = new StringBuilder();
            stringBuilder.append("Failed to write MediaStore:");
            stringBuilder.append(e.getMessage());
            Log.e(str, stringBuilder.toString(), e);
            return insert;
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

    public static String generatePrimaryTempFile() {
        StringBuilder stringBuilder = new StringBuilder();
        stringBuilder.append(PRIMARY_STORAGE_PATH);
        stringBuilder.append(CAMERA_STORAGE_PATH_TEMP);
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
            if (UserHandle.myUserId() == 0 && b.ge() && SECONDARY_STORAGE_PATH != null) {
                z = true;
            }
            return z;
        }
        if (b.ge() && SECONDARY_STORAGE_PATH != null) {
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
            Log.d(str, stringBuilder3.toString());
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
    /* Code decompiled incorrectly, please refer to instructions dump. */
    public static void saveMorphoPanoramaOriginalPic(ByteBuffer byteBuffer, int i, String str) {
        Exception e;
        String str2;
        Throwable th;
        StringBuilder stringBuilder = new StringBuilder();
        stringBuilder.append(DIRECTORY);
        stringBuilder.append(File.separator);
        stringBuilder.append(str);
        stringBuilder.append(File.separator);
        File file = new File(stringBuilder.toString());
        if (!file.exists()) {
            file.mkdirs();
        }
        stringBuilder = new StringBuilder();
        stringBuilder.append(str);
        stringBuilder.append(File.separator);
        stringBuilder.append(str);
        stringBuilder.append("_");
        stringBuilder.append(i);
        FileChannel fileChannel = null;
        try {
            File file2 = new File(generateFilepath(stringBuilder.toString()));
            if (!file2.exists()) {
                file2.createNewFile();
            }
            FileChannel channel = new FileOutputStream(file2, false).getChannel();
            try {
                channel.write(byteBuffer);
                if (channel != null) {
                    try {
                        channel.close();
                    } catch (Exception e2) {
                    }
                }
            } catch (Exception e3) {
                e = e3;
                fileChannel = channel;
                try {
                    str2 = TAG;
                    stringBuilder = new StringBuilder();
                    stringBuilder.append("saveMorphoPanoramaOriginalPic  ");
                    stringBuilder.append(e.toString());
                    Log.e(str2, stringBuilder.toString());
                    if (fileChannel == null) {
                        fileChannel.close();
                    }
                } catch (Throwable th2) {
                    th = th2;
                    if (fileChannel != null) {
                        try {
                            fileChannel.close();
                        } catch (Exception e4) {
                        }
                    }
                    throw th;
                }
            } catch (Throwable th3) {
                th = th3;
                fileChannel = channel;
                if (fileChannel != null) {
                }
                throw th;
            }
        } catch (Exception e5) {
            e = e5;
            str2 = TAG;
            stringBuilder = new StringBuilder();
            stringBuilder.append("saveMorphoPanoramaOriginalPic  ");
            stringBuilder.append(e.toString());
            Log.e(str2, stringBuilder.toString());
            if (fileChannel == null) {
            }
        }
    }

    /* JADX WARNING: Removed duplicated region for block: B:26:0x0089 A:{SYNTHETIC, Splitter: B:26:0x0089} */
    /* Code decompiled incorrectly, please refer to instructions dump. */
    public static void saveOriginalPic(byte[] bArr, int i, String str) {
        Throwable e;
        StringBuilder stringBuilder = new StringBuilder();
        stringBuilder.append(DIRECTORY);
        stringBuilder.append(File.separator);
        stringBuilder.append(str);
        stringBuilder.append(File.separator);
        File file = new File(stringBuilder.toString());
        if (!file.exists()) {
            file.mkdirs();
        }
        stringBuilder = new StringBuilder();
        stringBuilder.append(str);
        stringBuilder.append(File.separator);
        stringBuilder.append(str);
        stringBuilder.append("_");
        stringBuilder.append(i);
        FileOutputStream fileOutputStream = null;
        try {
            File file2 = new File(generateFilepath(stringBuilder.toString()));
            if (!file2.exists()) {
                file2.createNewFile();
            }
            FileOutputStream fileOutputStream2 = new FileOutputStream(file2);
            try {
                fileOutputStream2.write(bArr);
            } catch (Exception e2) {
                e = e2;
                fileOutputStream = fileOutputStream2;
            } catch (Throwable th) {
                e = th;
                fileOutputStream = fileOutputStream2;
                if (fileOutputStream != null) {
                    try {
                        fileOutputStream.flush();
                        fileOutputStream.close();
                    } catch (Exception e3) {
                    }
                }
                throw e;
            }
            try {
                fileOutputStream2.flush();
                fileOutputStream2.close();
            } catch (Exception e4) {
            }
        } catch (Exception e5) {
            e = e5;
            try {
                Log.e(TAG, "saveMorphoPanoramaOriginalPic exception occurs", e);
                if (fileOutputStream != null) {
                    fileOutputStream.flush();
                    fileOutputStream.close();
                }
            } catch (Throwable th2) {
                e = th2;
                if (fileOutputStream != null) {
                }
                throw e;
            }
        }
    }

    public static boolean isUseDocumentMode() {
        return VERSION.SDK_INT >= 28 && !isPhoneStoragePriority();
    }
}
