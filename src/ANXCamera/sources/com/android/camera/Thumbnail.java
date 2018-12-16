package com.android.camera;

import android.content.ContentResolver;
import android.graphics.Bitmap;
import android.graphics.Bitmap.CompressFormat;
import android.graphics.Bitmap.Config;
import android.graphics.BitmapFactory;
import android.graphics.BitmapFactory.Options;
import android.graphics.Canvas;
import android.graphics.Matrix;
import android.graphics.Paint;
import android.graphics.PaintFlagsDrawFilter;
import android.media.ThumbnailUtils;
import android.net.Uri;
import android.provider.MediaStore.Images;
import android.provider.MediaStore.Video.Thumbnails;
import android.provider.MiuiSettings.ScreenEffect;
import com.android.camera.log.Log;
import com.android.camera.storage.Storage;
import java.io.BufferedOutputStream;
import java.io.Closeable;
import java.io.DataOutputStream;
import java.io.File;
import java.io.FileDescriptor;
import java.io.FileOutputStream;
import java.io.IOException;
import java.util.ArrayList;

public class Thumbnail {
    private static final int BUFSIZE = 4096;
    private static final String LAST_THUMB_FILENAME = "last_thumb";
    private static final String TAG = "Thumbnail";
    public static final int THUMBNAIL_DELETED = 2;
    public static final int THUMBNAIL_FOUND = 1;
    public static final int THUMBNAIL_NOT_FOUND = 0;
    public static final int THUMBNAIL_USE_FROM_FILE = -1;
    private static Object sLock = new Object();
    private Bitmap mBitmap;
    private boolean mFromFile = false;
    private Uri mUri;
    private boolean mWaitingForUri = false;

    private static class Media {
        public final long dateTaken;
        public final long id;
        public final int orientation;
        public final String path;
        public final Uri uri;

        public Media(long j, int i, long j2, Uri uri, String str) {
            this.id = j;
            this.orientation = i;
            this.dateTaken = j2;
            this.uri = uri;
            this.path = str;
        }
    }

    private Thumbnail(Uri uri, Bitmap bitmap, int i, boolean z) {
        this.mUri = uri;
        this.mBitmap = adjustImage(bitmap, i, z);
    }

    public Uri getUri() {
        return this.mUri;
    }

    public void startWaitingForUri() {
        this.mWaitingForUri = true;
    }

    public boolean isWaitingForUri() {
        return this.mWaitingForUri;
    }

    public void setUri(Uri uri) {
        this.mUri = uri;
        this.mWaitingForUri = false;
    }

    public Bitmap getBitmap() {
        return this.mBitmap;
    }

    public void setFromFile(boolean z) {
        this.mFromFile = z;
    }

    public boolean fromFile() {
        return this.mFromFile;
    }

    private static Bitmap adjustImage(Bitmap bitmap, int i, boolean z) {
        Throwable e;
        if (i == 0 && !z && bitmap.getWidth() == bitmap.getHeight()) {
            return bitmap;
        }
        int height;
        int width;
        Bitmap createBitmap;
        Matrix matrix = new Matrix();
        if (i % 180 != 0) {
            height = bitmap.getHeight();
            width = bitmap.getWidth();
        } else {
            height = bitmap.getWidth();
            width = bitmap.getHeight();
        }
        matrix.postTranslate(((float) (-bitmap.getWidth())) / 2.0f, ((float) (-bitmap.getHeight())) / 2.0f);
        matrix.postRotate((float) i);
        float f = ((float) height) / 2.0f;
        float f2 = ((float) width) / 2.0f;
        matrix.postTranslate(f, f2);
        matrix.postScale(z ? -1.0f : 1.0f, 1.0f, f, f2);
        i = Math.min(height, width);
        matrix.postTranslate(((float) (i - height)) / 2.0f, ((float) (i - width)) / 2.0f);
        try {
            createBitmap = Bitmap.createBitmap(i, i, Config.ARGB_8888);
            try {
                Canvas canvas = new Canvas(createBitmap);
                canvas.setDrawFilter(new PaintFlagsDrawFilter(0, 3));
                Paint paint = new Paint();
                paint.setAntiAlias(true);
                paint.setFilterBitmap(true);
                canvas.drawBitmap(bitmap, matrix, paint);
                bitmap.recycle();
            } catch (Exception e2) {
                e = e2;
            } catch (OutOfMemoryError e3) {
                e = e3;
                Log.w(TAG, "Failed to rotate thumbnail", e);
                return createBitmap;
            }
        } catch (Exception e4) {
            e = e4;
            createBitmap = null;
            Log.w(TAG, "Failed to rotate thumbnail", e);
            return createBitmap;
        } catch (OutOfMemoryError e5) {
            e = e5;
            createBitmap = null;
            Log.w(TAG, "Failed to rotate thumbnail", e);
            return createBitmap;
        }
        return createBitmap;
    }

    public void saveLastThumbnailToFile(File file) {
        Closeable bufferedOutputStream;
        Closeable closeable;
        Throwable e;
        String str;
        StringBuilder stringBuilder;
        Throwable th;
        if (this.mUri == null) {
            Log.w(TAG, "Fail to store bitmap. uri is null");
            return;
        }
        File file2 = new File(file, LAST_THUMB_FILENAME);
        synchronized (sLock) {
            Closeable fileOutputStream;
            try {
                fileOutputStream = new FileOutputStream(file2);
                try {
                    bufferedOutputStream = new BufferedOutputStream(fileOutputStream, 4096);
                } catch (Throwable e2) {
                    closeable = null;
                    e = e2;
                    bufferedOutputStream = closeable;
                    try {
                        str = TAG;
                        stringBuilder = new StringBuilder();
                        stringBuilder.append("Fail to store bitmap. path=");
                        stringBuilder.append(file2.getPath());
                        Log.e(str, stringBuilder.toString(), e);
                        Util.closeSilently(fileOutputStream);
                        Util.closeSilently(bufferedOutputStream);
                        Util.closeSilently(closeable);
                    } catch (Throwable th2) {
                        th = th2;
                        Util.closeSilently(fileOutputStream);
                        Util.closeSilently(bufferedOutputStream);
                        Util.closeSilently(closeable);
                        throw th;
                    }
                } catch (Throwable th3) {
                    th = th3;
                    bufferedOutputStream = null;
                    closeable = bufferedOutputStream;
                    Util.closeSilently(fileOutputStream);
                    Util.closeSilently(bufferedOutputStream);
                    Util.closeSilently(closeable);
                    throw th;
                }
                try {
                    closeable = new DataOutputStream(bufferedOutputStream);
                } catch (Throwable e3) {
                    Throwable th4 = e3;
                    closeable = null;
                    e = th4;
                    str = TAG;
                    stringBuilder = new StringBuilder();
                    stringBuilder.append("Fail to store bitmap. path=");
                    stringBuilder.append(file2.getPath());
                    Log.e(str, stringBuilder.toString(), e);
                    Util.closeSilently(fileOutputStream);
                    Util.closeSilently(bufferedOutputStream);
                    Util.closeSilently(closeable);
                } catch (Throwable th5) {
                    th = th5;
                    closeable = null;
                    Util.closeSilently(fileOutputStream);
                    Util.closeSilently(bufferedOutputStream);
                    Util.closeSilently(closeable);
                    throw th;
                }
                try {
                    closeable.writeUTF(this.mUri.toString());
                    this.mBitmap.compress(CompressFormat.JPEG, 90, closeable);
                    closeable.close();
                    Util.closeSilently(fileOutputStream);
                    Util.closeSilently(bufferedOutputStream);
                } catch (IOException e4) {
                    e = e4;
                    str = TAG;
                    stringBuilder = new StringBuilder();
                    stringBuilder.append("Fail to store bitmap. path=");
                    stringBuilder.append(file2.getPath());
                    Log.e(str, stringBuilder.toString(), e);
                    Util.closeSilently(fileOutputStream);
                    Util.closeSilently(bufferedOutputStream);
                    Util.closeSilently(closeable);
                }
            } catch (Throwable e5) {
                bufferedOutputStream = null;
                closeable = bufferedOutputStream;
                e = e5;
                fileOutputStream = closeable;
                str = TAG;
                stringBuilder = new StringBuilder();
                stringBuilder.append("Fail to store bitmap. path=");
                stringBuilder.append(file2.getPath());
                Log.e(str, stringBuilder.toString(), e);
                Util.closeSilently(fileOutputStream);
                Util.closeSilently(bufferedOutputStream);
                Util.closeSilently(closeable);
            } catch (Throwable th6) {
                th = th6;
                fileOutputStream = null;
                bufferedOutputStream = fileOutputStream;
                closeable = bufferedOutputStream;
                Util.closeSilently(fileOutputStream);
                Util.closeSilently(bufferedOutputStream);
                Util.closeSilently(closeable);
                throw th;
            }
            Util.closeSilently(closeable);
        }
    }

    /* JADX WARNING: Missing block: B:22:0x0050, code:
            r7 = createThumbnail(r4, r8, 0, false);
     */
    /* JADX WARNING: Missing block: B:23:0x0055, code:
            if (r7 == null) goto L_0x005b;
     */
    /* JADX WARNING: Missing block: B:24:0x0057, code:
            r7.setFromFile(true);
     */
    /* JADX WARNING: Missing block: B:25:0x005b, code:
            return r7;
     */
    public static com.android.camera.Thumbnail getLastThumbnailFromFile(java.io.File r7, android.content.ContentResolver r8) {
        /*
        r0 = new java.io.File;
        r1 = "last_thumb";
        r0.<init>(r7, r1);
        r7 = sLock;
        monitor-enter(r7);
        r1 = 0;
        r2 = new java.io.FileInputStream;	 Catch:{ IOException -> 0x0071, all -> 0x006c }
        r2.<init>(r0);	 Catch:{ IOException -> 0x0071, all -> 0x006c }
        r0 = new java.io.BufferedInputStream;	 Catch:{ IOException -> 0x0068, all -> 0x0064 }
        r3 = 4096; // 0x1000 float:5.74E-42 double:2.0237E-320;
        r0.<init>(r2, r3);	 Catch:{ IOException -> 0x0068, all -> 0x0064 }
        r3 = new java.io.DataInputStream;	 Catch:{ IOException -> 0x0061, all -> 0x005e }
        r3.<init>(r0);	 Catch:{ IOException -> 0x0061, all -> 0x005e }
        r4 = r3.readUTF();	 Catch:{ IOException -> 0x005c }
        r4 = android.net.Uri.parse(r4);	 Catch:{ IOException -> 0x005c }
        r8 = com.android.camera.Util.isUriValid(r4, r8);	 Catch:{ IOException -> 0x005c }
        if (r8 != 0) goto L_0x003e;
    L_0x002f:
        r3.close();	 Catch:{ IOException -> 0x005c }
        com.android.camera.Util.closeSilently(r2);	 Catch:{ all -> 0x00a2 }
        com.android.camera.Util.closeSilently(r0);	 Catch:{ all -> 0x00a2 }
        com.android.camera.Util.closeSilently(r3);	 Catch:{ all -> 0x00a2 }
        monitor-exit(r7);	 Catch:{ all -> 0x00a2 }
        return r1;
    L_0x003e:
        r8 = android.graphics.BitmapFactory.decodeStream(r3);	 Catch:{ IOException -> 0x005c }
        r3.close();	 Catch:{ IOException -> 0x005c }
        com.android.camera.Util.closeSilently(r2);	 Catch:{ all -> 0x00a2 }
        com.android.camera.Util.closeSilently(r0);	 Catch:{ all -> 0x00a2 }
        com.android.camera.Util.closeSilently(r3);	 Catch:{ all -> 0x00a2 }
        monitor-exit(r7);	 Catch:{ all -> 0x00a2 }
        r7 = 0;
        r7 = createThumbnail(r4, r8, r7, r7);
        if (r7 == 0) goto L_0x005b;
    L_0x0057:
        r8 = 1;
        r7.setFromFile(r8);
    L_0x005b:
        return r7;
    L_0x005c:
        r8 = move-exception;
        goto L_0x0075;
    L_0x005e:
        r8 = move-exception;
        r3 = r1;
        goto L_0x0098;
    L_0x0061:
        r8 = move-exception;
        r3 = r1;
        goto L_0x0075;
    L_0x0064:
        r8 = move-exception;
        r0 = r1;
        r3 = r0;
        goto L_0x0098;
    L_0x0068:
        r8 = move-exception;
        r0 = r1;
        r3 = r0;
        goto L_0x0075;
    L_0x006c:
        r8 = move-exception;
        r0 = r1;
        r2 = r0;
        r3 = r2;
        goto L_0x0098;
    L_0x0071:
        r8 = move-exception;
        r0 = r1;
        r2 = r0;
        r3 = r2;
    L_0x0075:
        r4 = "Thumbnail";
        r5 = new java.lang.StringBuilder;	 Catch:{ all -> 0x0097 }
        r5.<init>();	 Catch:{ all -> 0x0097 }
        r6 = "Fail to load bitmap. ";
        r5.append(r6);	 Catch:{ all -> 0x0097 }
        r5.append(r8);	 Catch:{ all -> 0x0097 }
        r8 = r5.toString();	 Catch:{ all -> 0x0097 }
        com.android.camera.log.Log.i(r4, r8);	 Catch:{ all -> 0x0097 }
        com.android.camera.Util.closeSilently(r2);	 Catch:{ all -> 0x00a2 }
        com.android.camera.Util.closeSilently(r0);	 Catch:{ all -> 0x00a2 }
        com.android.camera.Util.closeSilently(r3);	 Catch:{ all -> 0x00a2 }
        monitor-exit(r7);	 Catch:{ all -> 0x00a2 }
        return r1;
    L_0x0097:
        r8 = move-exception;
    L_0x0098:
        com.android.camera.Util.closeSilently(r2);	 Catch:{ all -> 0x00a2 }
        com.android.camera.Util.closeSilently(r0);	 Catch:{ all -> 0x00a2 }
        com.android.camera.Util.closeSilently(r3);	 Catch:{ all -> 0x00a2 }
        throw r8;	 Catch:{ all -> 0x00a2 }
    L_0x00a2:
        r8 = move-exception;
        monitor-exit(r7);	 Catch:{ all -> 0x00a2 }
        throw r8;
        */
        throw new UnsupportedOperationException("Method not decompiled: com.android.camera.Thumbnail.getLastThumbnailFromFile(java.io.File, android.content.ContentResolver):com.android.camera.Thumbnail");
    }

    public static int getLastThumbnailFromContentResolver(ContentResolver contentResolver, Thumbnail[] thumbnailArr, Uri uri) {
        Media lastImageThumbnail = getLastImageThumbnail(contentResolver);
        Media lastVideoThumbnail = getLastVideoThumbnail(contentResolver);
        if (lastImageThumbnail == null && lastVideoThumbnail == null) {
            return 0;
        }
        Bitmap thumbnail;
        if (lastImageThumbnail == null || (lastVideoThumbnail != null && lastImageThumbnail.dateTaken < lastVideoThumbnail.dateTaken)) {
            if (uri != null && uri.equals(lastVideoThumbnail.uri)) {
                return -1;
            }
            thumbnail = Thumbnails.getThumbnail(contentResolver, lastVideoThumbnail.id, 1, null);
            if (thumbnail == null) {
                try {
                    thumbnail = ThumbnailUtils.createVideoThumbnail(lastVideoThumbnail.path, 1);
                } catch (Throwable e) {
                    Log.e(TAG, "exception in createVideoThumbnail", e);
                }
            }
            lastImageThumbnail = lastVideoThumbnail;
        } else if (uri != null && uri.equals(lastImageThumbnail.uri)) {
            return -1;
        } else {
            thumbnail = Images.Thumbnails.getThumbnail(contentResolver, lastImageThumbnail.id, 1, null);
            if (thumbnail == null) {
                try {
                    thumbnail = ThumbnailUtils.createImageThumbnail(lastImageThumbnail.path, 1);
                } catch (Throwable e2) {
                    Log.e(TAG, "exception in createImageThumbnail", e2);
                }
            }
        }
        if (thumbnail == null || !Util.isUriValid(lastImageThumbnail.uri, contentResolver)) {
            return 2;
        }
        thumbnailArr[0] = createThumbnail(lastImageThumbnail.uri, thumbnail, lastImageThumbnail.orientation, false);
        return 1;
    }

    private static String getImageBucketIds() {
        StringBuilder stringBuilder;
        if (Storage.secondaryStorageMounted()) {
            stringBuilder = new StringBuilder();
            stringBuilder.append("bucket_id IN (");
            stringBuilder.append(Storage.PRIMARY_BUCKET_ID);
            stringBuilder.append(",");
            stringBuilder.append(Storage.SECONDARY_BUCKET_ID);
            stringBuilder.append(")");
            return stringBuilder.toString();
        }
        stringBuilder = new StringBuilder();
        stringBuilder.append("bucket_id=");
        stringBuilder.append(Storage.BUCKET_ID);
        return stringBuilder.toString();
    }

    private static String getVideoBucketIds() {
        StringBuilder stringBuilder;
        if (Storage.secondaryStorageMounted()) {
            stringBuilder = new StringBuilder();
            stringBuilder.append("bucket_id IN (");
            stringBuilder.append(Storage.PRIMARY_BUCKET_ID);
            stringBuilder.append(",");
            stringBuilder.append(Storage.SECONDARY_BUCKET_ID);
            stringBuilder.append(")");
            return stringBuilder.toString();
        }
        stringBuilder = new StringBuilder();
        stringBuilder.append("bucket_id=");
        stringBuilder.append(Storage.BUCKET_ID);
        return stringBuilder.toString();
    }

    public static Uri getLastThumbnailUri(ContentResolver contentResolver) {
        Media lastImageThumbnail = getLastImageThumbnail(contentResolver);
        Media lastVideoThumbnail = getLastVideoThumbnail(contentResolver);
        if (lastImageThumbnail != null && (lastVideoThumbnail == null || lastImageThumbnail.dateTaken >= lastVideoThumbnail.dateTaken)) {
            return lastImageThumbnail.uri;
        }
        if (lastVideoThumbnail == null || (lastImageThumbnail != null && lastVideoThumbnail.dateTaken < lastImageThumbnail.dateTaken)) {
            return null;
        }
        return lastVideoThumbnail.uri;
    }

    /* JADX WARNING: Removed duplicated region for block: B:42:0x0115  */
    /* JADX WARNING: Removed duplicated region for block: B:24:0x00aa A:{Catch:{ Exception -> 0x00a3, all -> 0x009f }} */
    /* JADX WARNING: Removed duplicated region for block: B:44:0x0118  */
    /* JADX WARNING: Removed duplicated region for block: B:54:0x0131  */
    /* JADX WARNING: Removed duplicated region for block: B:59:0x013b  */
    /* JADX WARNING: Removed duplicated region for block: B:61:0x0140  */
    /* JADX WARNING: Removed duplicated region for block: B:54:0x0131  */
    /* JADX WARNING: Removed duplicated region for block: B:59:0x013b  */
    /* JADX WARNING: Removed duplicated region for block: B:61:0x0140  */
    /* JADX WARNING: Missing block: B:45:0x011b, code:
            if (r1 == null) goto L_0x0137;
     */
    /* JADX WARNING: Missing block: B:46:0x011d, code:
            r1.close();
     */
    /* JADX WARNING: Missing block: B:55:0x0134, code:
            if (r1 != null) goto L_0x011d;
     */
    /* JADX WARNING: Missing block: B:56:0x0137, code:
            return null;
     */
    private static com.android.camera.Thumbnail.Media getLastImageThumbnail(android.content.ContentResolver r24) {
        /*
        r0 = android.provider.MediaStore.Images.Media.EXTERNAL_CONTENT_URI;
        r1 = r0.buildUpon();
        r2 = "limit";
        r3 = "1";
        r1 = r1.appendQueryParameter(r2, r3);
        r3 = r1.build();
        r1 = "_id";
        r2 = "orientation";
        r4 = "datetaken";
        r5 = "_data";
        r8 = new java.lang.String[]{r1, r2, r4, r5};
        r1 = new java.lang.StringBuilder;
        r1.<init>();
        r2 = "mime_type='image/jpeg' AND ";
        r1.append(r2);
        r2 = getImageBucketIds();
        r1.append(r2);
        r2 = " AND ";
        r1.append(r2);
        r2 = "_size";
        r1.append(r2);
        r2 = " > 0";
        r1.append(r2);
        r9 = r1.toString();
        r10 = "datetaken DESC,_id DESC";
        r6 = 0;
        r11 = 0;
        r2 = r24;
        r4 = r8;
        r5 = r9;
        r7 = r10;
        r7 = r2.query(r3, r4, r5, r6, r7);	 Catch:{ Exception -> 0x0125, all -> 0x0121 }
        r12 = 2;
        r13 = 3;
        r14 = 1;
        r15 = 0;
        if (r7 == 0) goto L_0x00a7;
    L_0x0058:
        r1 = r7.moveToFirst();	 Catch:{ Exception -> 0x00a3, all -> 0x009f }
        if (r1 == 0) goto L_0x00a7;
    L_0x005e:
        r1 = r7.getString(r13);	 Catch:{ Exception -> 0x00a3, all -> 0x009f }
        r2 = android.text.TextUtils.isEmpty(r1);	 Catch:{ Exception -> 0x00a3, all -> 0x009f }
        if (r2 != 0) goto L_0x0095;
    L_0x0068:
        r2 = new java.io.File;	 Catch:{ Exception -> 0x00a3, all -> 0x009f }
        r2.<init>(r1);	 Catch:{ Exception -> 0x00a3, all -> 0x009f }
        r2 = r2.exists();	 Catch:{ Exception -> 0x00a3, all -> 0x009f }
        if (r2 == 0) goto L_0x0095;
    L_0x0073:
        r2 = r7.getLong(r15);	 Catch:{ Exception -> 0x00a3, all -> 0x009f }
        r4 = new com.android.camera.Thumbnail$Media;	 Catch:{ Exception -> 0x00a3, all -> 0x009f }
        r19 = r7.getInt(r14);	 Catch:{ Exception -> 0x00a3, all -> 0x009f }
        r20 = r7.getLong(r12);	 Catch:{ Exception -> 0x00a3, all -> 0x009f }
        r22 = android.content.ContentUris.withAppendedId(r0, r2);	 Catch:{ Exception -> 0x00a3, all -> 0x009f }
        r16 = r4;
        r17 = r2;
        r23 = r1;
        r16.<init>(r17, r19, r20, r22, r23);	 Catch:{ Exception -> 0x00a3, all -> 0x009f }
        if (r7 == 0) goto L_0x0093;
    L_0x0090:
        r7.close();
        return r4;
    L_0x0095:
        r1 = "Thumbnail";
        r2 = "getLastImageThumbnail first file is deleted";
        com.android.camera.log.Log.d(r1, r2);	 Catch:{ Exception -> 0x00a3, all -> 0x009f }
        r1 = r14;
        goto L_0x00a8;
    L_0x009f:
        r0 = move-exception;
        r1 = r11;
        goto L_0x0139;
    L_0x00a3:
        r0 = move-exception;
        r1 = r11;
        goto L_0x0128;
    L_0x00a7:
        r1 = r15;
    L_0x00a8:
        if (r1 == 0) goto L_0x0115;
    L_0x00aa:
        r5 = 0;
        r1 = r24;
        r2 = r0;
        r3 = r8;
        r4 = r9;
        r6 = r10;
        r1 = r1.query(r2, r3, r4, r5, r6);	 Catch:{ Exception -> 0x00a3, all -> 0x009f }
        if (r1 == 0) goto L_0x0116;
    L_0x00b7:
        r2 = "Thumbnail";
        r3 = new java.lang.StringBuilder;	 Catch:{ Exception -> 0x0113 }
        r3.<init>();	 Catch:{ Exception -> 0x0113 }
        r4 = "getLastImageThumbnail count=";
        r3.append(r4);	 Catch:{ Exception -> 0x0113 }
        r4 = r1.getCount();	 Catch:{ Exception -> 0x0113 }
        r3.append(r4);	 Catch:{ Exception -> 0x0113 }
        r3 = r3.toString();	 Catch:{ Exception -> 0x0113 }
        com.android.camera.log.Log.d(r2, r3);	 Catch:{ Exception -> 0x0113 }
    L_0x00d1:
        r2 = r1.moveToNext();	 Catch:{ Exception -> 0x0113 }
        if (r2 == 0) goto L_0x0116;
    L_0x00d7:
        r2 = r1.getString(r13);	 Catch:{ Exception -> 0x0113 }
        r3 = android.text.TextUtils.isEmpty(r2);	 Catch:{ Exception -> 0x0113 }
        if (r3 != 0) goto L_0x0112;
    L_0x00e1:
        r3 = new java.io.File;	 Catch:{ Exception -> 0x0113 }
        r3.<init>(r2);	 Catch:{ Exception -> 0x0113 }
        r3 = r3.exists();	 Catch:{ Exception -> 0x0113 }
        if (r3 == 0) goto L_0x0112;
    L_0x00ec:
        r3 = r1.getLong(r15);	 Catch:{ Exception -> 0x0113 }
        r5 = new com.android.camera.Thumbnail$Media;	 Catch:{ Exception -> 0x0113 }
        r19 = r1.getInt(r14);	 Catch:{ Exception -> 0x0113 }
        r20 = r1.getLong(r12);	 Catch:{ Exception -> 0x0113 }
        r22 = android.content.ContentUris.withAppendedId(r0, r3);	 Catch:{ Exception -> 0x0113 }
        r16 = r5;
        r17 = r3;
        r23 = r2;
        r16.<init>(r17, r19, r20, r22, r23);	 Catch:{ Exception -> 0x0113 }
        if (r7 == 0) goto L_0x010c;
    L_0x0109:
        r7.close();
    L_0x010c:
        if (r1 == 0) goto L_0x0111;
    L_0x010e:
        r1.close();
    L_0x0111:
        return r5;
    L_0x0112:
        goto L_0x00d1;
    L_0x0113:
        r0 = move-exception;
        goto L_0x0128;
    L_0x0115:
        r1 = r11;
    L_0x0116:
        if (r7 == 0) goto L_0x011b;
    L_0x0118:
        r7.close();
    L_0x011b:
        if (r1 == 0) goto L_0x0137;
    L_0x011d:
        r1.close();
        goto L_0x0137;
    L_0x0121:
        r0 = move-exception;
        r1 = r11;
        r7 = r1;
        goto L_0x0139;
    L_0x0125:
        r0 = move-exception;
        r1 = r11;
        r7 = r1;
    L_0x0128:
        r2 = "Thumbnail";
        r3 = "getLastImageThumbnail error";
        com.android.camera.log.Log.w(r2, r3, r0);	 Catch:{ all -> 0x0138 }
        if (r7 == 0) goto L_0x0134;
    L_0x0131:
        r7.close();
    L_0x0134:
        if (r1 == 0) goto L_0x0137;
    L_0x0136:
        goto L_0x011d;
    L_0x0137:
        return r11;
    L_0x0138:
        r0 = move-exception;
    L_0x0139:
        if (r7 == 0) goto L_0x013e;
    L_0x013b:
        r7.close();
    L_0x013e:
        if (r1 == 0) goto L_0x0143;
    L_0x0140:
        r1.close();
    L_0x0143:
        throw r0;
        */
        throw new UnsupportedOperationException("Method not decompiled: com.android.camera.Thumbnail.getLastImageThumbnail(android.content.ContentResolver):com.android.camera.Thumbnail$Media");
    }

    /* JADX WARNING: Removed duplicated region for block: B:39:0x0106  */
    /* JADX WARNING: Removed duplicated region for block: B:22:0x009d A:{Catch:{ all -> 0x0096 }} */
    /* JADX WARNING: Removed duplicated region for block: B:41:0x0109  */
    /* JADX WARNING: Removed duplicated region for block: B:43:0x010e  */
    /* JADX WARNING: Removed duplicated region for block: B:48:0x0117  */
    /* JADX WARNING: Removed duplicated region for block: B:50:0x011c  */
    /* JADX WARNING: Removed duplicated region for block: B:48:0x0117  */
    /* JADX WARNING: Removed duplicated region for block: B:50:0x011c  */
    private static com.android.camera.Thumbnail.Media getLastVideoThumbnail(android.content.ContentResolver r23) {
        /*
        r0 = android.provider.MediaStore.Video.Media.EXTERNAL_CONTENT_URI;
        r1 = r0.buildUpon();
        r2 = "limit";
        r3 = "1";
        r1 = r1.appendQueryParameter(r2, r3);
        r3 = r1.build();
        r1 = "_id";
        r2 = "_data";
        r4 = "datetaken";
        r8 = new java.lang.String[]{r1, r2, r4};
        r1 = new java.lang.StringBuilder;
        r1.<init>();
        r2 = getVideoBucketIds();
        r1.append(r2);
        r2 = " AND ";
        r1.append(r2);
        r2 = "_size";
        r1.append(r2);
        r2 = " > 0";
        r1.append(r2);
        r9 = r1.toString();
        r10 = "datetaken DESC,_id DESC";
        r6 = 0;
        r11 = 0;
        r2 = r23;
        r4 = r8;
        r5 = r9;
        r7 = r10;
        r7 = r2.query(r3, r4, r5, r6, r7);	 Catch:{ all -> 0x0112 }
        r12 = 2;
        r13 = 0;
        r14 = 1;
        if (r7 == 0) goto L_0x009a;
    L_0x0050:
        r1 = r7.moveToFirst();	 Catch:{ all -> 0x0096 }
        if (r1 == 0) goto L_0x009a;
    L_0x0056:
        r1 = r7.getLong(r13);	 Catch:{ all -> 0x0096 }
        r3 = r7.getString(r14);	 Catch:{ all -> 0x0096 }
        if (r3 == 0) goto L_0x008c;
    L_0x0060:
        r3 = new java.io.File;	 Catch:{ all -> 0x0096 }
        r4 = r7.getString(r14);	 Catch:{ all -> 0x0096 }
        r3.<init>(r4);	 Catch:{ all -> 0x0096 }
        r3 = r3.exists();	 Catch:{ all -> 0x0096 }
        if (r3 == 0) goto L_0x008c;
    L_0x006f:
        r3 = new com.android.camera.Thumbnail$Media;	 Catch:{ all -> 0x0096 }
        r18 = 0;
        r19 = r7.getLong(r12);	 Catch:{ all -> 0x0096 }
        r21 = android.content.ContentUris.withAppendedId(r0, r1);	 Catch:{ all -> 0x0096 }
        r22 = r7.getString(r14);	 Catch:{ all -> 0x0096 }
        r15 = r3;
        r16 = r1;
        r15.<init>(r16, r18, r19, r21, r22);	 Catch:{ all -> 0x0096 }
        if (r7 == 0) goto L_0x008a;
    L_0x0087:
        r7.close();
        return r3;
    L_0x008c:
        r1 = "Thumbnail";
        r2 = "getLastVideoThumbnail first file is deleted";
        com.android.camera.log.Log.d(r1, r2);	 Catch:{ all -> 0x0096 }
        r1 = r14;
        goto L_0x009b;
    L_0x0096:
        r0 = move-exception;
        r1 = r11;
        goto L_0x0115;
    L_0x009a:
        r1 = r13;
    L_0x009b:
        if (r1 == 0) goto L_0x0106;
    L_0x009d:
        r5 = 0;
        r1 = r23;
        r2 = r0;
        r3 = r8;
        r4 = r9;
        r6 = r10;
        r1 = r1.query(r2, r3, r4, r5, r6);	 Catch:{ all -> 0x0096 }
        r2 = "Thumbnail";
        r3 = new java.lang.StringBuilder;	 Catch:{ all -> 0x0104 }
        r3.<init>();	 Catch:{ all -> 0x0104 }
        r4 = "getLastVideoThumbnail count=";
        r3.append(r4);	 Catch:{ all -> 0x0104 }
        r4 = r1.getCount();	 Catch:{ all -> 0x0104 }
        r3.append(r4);	 Catch:{ all -> 0x0104 }
        r3 = r3.toString();	 Catch:{ all -> 0x0104 }
        com.android.camera.log.Log.d(r2, r3);	 Catch:{ all -> 0x0104 }
        if (r1 == 0) goto L_0x0107;
    L_0x00c4:
        r2 = r1.moveToNext();	 Catch:{ all -> 0x0104 }
        if (r2 == 0) goto L_0x0107;
    L_0x00ca:
        r2 = r1.getString(r14);	 Catch:{ all -> 0x0104 }
        if (r2 == 0) goto L_0x00c4;
    L_0x00d0:
        r2 = new java.io.File;	 Catch:{ all -> 0x0104 }
        r3 = r1.getString(r14);	 Catch:{ all -> 0x0104 }
        r2.<init>(r3);	 Catch:{ all -> 0x0104 }
        r2 = r2.exists();	 Catch:{ all -> 0x0104 }
        if (r2 == 0) goto L_0x00c4;
    L_0x00df:
        r2 = r1.getLong(r13);	 Catch:{ all -> 0x0104 }
        r4 = new com.android.camera.Thumbnail$Media;	 Catch:{ all -> 0x0104 }
        r18 = 0;
        r19 = r1.getLong(r12);	 Catch:{ all -> 0x0104 }
        r21 = android.content.ContentUris.withAppendedId(r0, r2);	 Catch:{ all -> 0x0104 }
        r22 = r1.getString(r14);	 Catch:{ all -> 0x0104 }
        r15 = r4;
        r16 = r2;
        r15.<init>(r16, r18, r19, r21, r22);	 Catch:{ all -> 0x0104 }
        if (r7 == 0) goto L_0x00fe;
    L_0x00fb:
        r7.close();
    L_0x00fe:
        if (r1 == 0) goto L_0x0103;
    L_0x0100:
        r1.close();
    L_0x0103:
        return r4;
    L_0x0104:
        r0 = move-exception;
        goto L_0x0115;
    L_0x0106:
        r1 = r11;
    L_0x0107:
        if (r7 == 0) goto L_0x010c;
    L_0x0109:
        r7.close();
    L_0x010c:
        if (r1 == 0) goto L_0x0111;
    L_0x010e:
        r1.close();
    L_0x0111:
        return r11;
    L_0x0112:
        r0 = move-exception;
        r1 = r11;
        r7 = r1;
    L_0x0115:
        if (r7 == 0) goto L_0x011a;
    L_0x0117:
        r7.close();
    L_0x011a:
        if (r1 == 0) goto L_0x011f;
    L_0x011c:
        r1.close();
    L_0x011f:
        throw r0;
        */
        throw new UnsupportedOperationException("Method not decompiled: com.android.camera.Thumbnail.getLastVideoThumbnail(android.content.ContentResolver):com.android.camera.Thumbnail$Media");
    }

    public static Thumbnail createThumbnail(byte[] bArr, int i, int i2, Uri uri, boolean z) {
        Options options = new Options();
        options.inSampleSize = i2;
        options.inPurgeable = true;
        return createThumbnail(uri, BitmapFactory.decodeByteArray(bArr, 0, bArr.length, options), i, z);
    }

    /* JADX WARNING: Removed duplicated region for block: B:24:0x0066  */
    /* JADX WARNING: Removed duplicated region for block: B:26:0x006d  */
    public static com.android.camera.Thumbnail createThumbnailFromUri(android.content.ContentResolver r9, android.net.Uri r10, boolean r11) {
        /*
        r0 = 0;
        if (r10 == 0) goto L_0x0089;
    L_0x0003:
        r1 = r10.getPath();
        if (r1 == 0) goto L_0x0089;
    L_0x0009:
        r1 = r10.getPath();
        r2 = android.provider.MediaStore.Images.Media.EXTERNAL_CONTENT_URI;
        r2 = r2.getPath();
        r1 = r1.contains(r2);
        if (r1 == 0) goto L_0x0026;
    L_0x001a:
        r2 = "_id";
        r3 = "_data";
        r4 = "orientation";
        r2 = new java.lang.String[]{r2, r3, r4};
    L_0x0024:
        r5 = r2;
        goto L_0x002f;
    L_0x0026:
        r2 = "_id";
        r3 = "_data";
        r2 = new java.lang.String[]{r2, r3};
        goto L_0x0024;
    L_0x002f:
        r6 = 0;
        r7 = 0;
        r8 = 0;
        r3 = r9;
        r4 = r10;
        r2 = r3.query(r4, r5, r6, r7, r8);
        r3 = -1;
        r5 = 0;
        r6 = 1;
        if (r2 == 0) goto L_0x0062;
    L_0x0041:
        r7 = r2.moveToFirst();	 Catch:{ all -> 0x005b }
        if (r7 == 0) goto L_0x0062;
    L_0x0047:
        r3 = r2.getLong(r5);	 Catch:{ all -> 0x005b }
        r7 = r2.getString(r6);	 Catch:{ all -> 0x005b }
        if (r1 == 0) goto L_0x0057;
    L_0x0051:
        r5 = 2;
        r5 = r2.getInt(r5);	 Catch:{ all -> 0x005b }
        r8 = r5;
        r5 = r6;
        goto L_0x0064;
    L_0x005b:
        r9 = move-exception;
        if (r2 == 0) goto L_0x0061;
    L_0x005e:
        r2.close();
    L_0x0061:
        throw r9;
    L_0x0062:
        r7 = r0;
        r8 = r5;
    L_0x0064:
        if (r2 == 0) goto L_0x006a;
    L_0x0066:
        r2.close();
        if (r5 == 0) goto L_0x0089;
    L_0x006d:
        if (r1 == 0) goto L_0x007a;
    L_0x006f:
        r9 = android.provider.MediaStore.Images.Thumbnails.getThumbnail(r9, r3, r6, r0);
        if (r9 != 0) goto L_0x0084;
    L_0x0075:
        r9 = android.media.ThumbnailUtils.createImageThumbnail(r7, r6);
        goto L_0x0084;
    L_0x007a:
        r9 = android.provider.MediaStore.Video.Thumbnails.getThumbnail(r9, r3, r6, r0);
        if (r9 != 0) goto L_0x0084;
    L_0x0080:
        r9 = android.media.ThumbnailUtils.createVideoThumbnail(r7, r6);
    L_0x0084:
        r9 = createThumbnail(r10, r9, r8, r11);
        return r9;
    L_0x0089:
        return r0;
        */
        throw new UnsupportedOperationException("Method not decompiled: com.android.camera.Thumbnail.createThumbnailFromUri(android.content.ContentResolver, android.net.Uri, boolean):com.android.camera.Thumbnail");
    }

    public static Bitmap createBitmap(byte[] bArr, int i, boolean z, int i2) {
        Options options = new Options();
        options.inSampleSize = i2;
        options.inPurgeable = true;
        Bitmap decodeByteArray = BitmapFactory.decodeByteArray(bArr, 0, bArr.length, options);
        i %= ScreenEffect.SCREEN_PAPER_MODE_TWILIGHT_START_DEAULT;
        if (decodeByteArray != null && (i != 0 || z)) {
            Matrix matrix = new Matrix();
            Matrix matrix2 = new Matrix();
            if (i != 0) {
                matrix.setRotate((float) i, ((float) decodeByteArray.getWidth()) * 0.5f, ((float) decodeByteArray.getHeight()) * 0.5f);
            }
            if (z) {
                matrix2.setScale(-1.0f, 1.0f, ((float) decodeByteArray.getWidth()) * 0.5f, ((float) decodeByteArray.getHeight()) * 0.5f);
                matrix.postConcat(matrix2);
            }
            try {
                Bitmap createBitmap = Bitmap.createBitmap(decodeByteArray, 0, 0, decodeByteArray.getWidth(), decodeByteArray.getHeight(), matrix, true);
                if (createBitmap != decodeByteArray) {
                    decodeByteArray.recycle();
                }
                return createBitmap;
            } catch (Throwable e) {
                Log.w(TAG, "Failed to rotate thumbnail", e);
            }
        }
        return decodeByteArray;
    }

    public static Bitmap createVideoThumbnailBitmap(FileDescriptor fileDescriptor, int i) {
        return createVideoThumbnailBitmap(null, fileDescriptor, i);
    }

    public static Bitmap createVideoThumbnailBitmap(String str, int i) {
        return createVideoThumbnailBitmap(str, null, i);
    }

    /* JADX WARNING: Removed duplicated region for block: B:27:0x006d  */
    /* JADX WARNING: Removed duplicated region for block: B:25:0x0056  */
    /* JADX WARNING: Removed duplicated region for block: B:25:0x0056  */
    /* JADX WARNING: Removed duplicated region for block: B:27:0x006d  */
    private static android.graphics.Bitmap createVideoThumbnailBitmap(java.lang.String r4, java.io.FileDescriptor r5, int r6) {
        /*
        r0 = new android.media.MediaMetadataRetriever;
        r0.<init>();
        r1 = 0;
        if (r4 == 0) goto L_0x0014;
    L_0x0009:
        r0.setDataSource(r4);	 Catch:{ IllegalArgumentException -> 0x0012, RuntimeException -> 0x0010 }
        goto L_0x0017;
    L_0x000d:
        r4 = move-exception;
        goto L_0x008b;
    L_0x0010:
        r5 = move-exception;
        goto L_0x002c;
    L_0x0012:
        r5 = move-exception;
        goto L_0x003a;
    L_0x0014:
        r0.setDataSource(r5);	 Catch:{ IllegalArgumentException -> 0x0012, RuntimeException -> 0x0010 }
    L_0x0017:
        r2 = -1;
        r5 = r0.getFrameAtTime(r2);	 Catch:{ IllegalArgumentException -> 0x0012, RuntimeException -> 0x0010 }
        r0.release();	 Catch:{ RuntimeException -> 0x0021 }
        goto L_0x0054;
    L_0x0021:
        r0 = move-exception;
        r2 = "Thumbnail";
        r3 = r0.getMessage();
        com.android.camera.log.Log.e(r2, r3, r0);
        goto L_0x0054;
        r2 = "Thumbnail";
        r3 = r5.getMessage();	 Catch:{ all -> 0x000d }
        com.android.camera.log.Log.e(r2, r3, r5);	 Catch:{ all -> 0x000d }
        r0.release();	 Catch:{ RuntimeException -> 0x0048 }
        goto L_0x0047;
        r2 = "Thumbnail";
        r3 = r5.getMessage();	 Catch:{ all -> 0x000d }
        com.android.camera.log.Log.e(r2, r3, r5);	 Catch:{ all -> 0x000d }
        r0.release();	 Catch:{ RuntimeException -> 0x0048 }
    L_0x0047:
        goto L_0x0053;
    L_0x0048:
        r5 = move-exception;
        r0 = "Thumbnail";
        r2 = r5.getMessage();
        com.android.camera.log.Log.e(r0, r2, r5);
    L_0x0053:
        r5 = r1;
    L_0x0054:
        if (r5 != 0) goto L_0x006d;
    L_0x0056:
        r5 = "Thumbnail";
        r6 = new java.lang.StringBuilder;
        r6.<init>();
        r0 = "fail to get thumbnail for ";
        r6.append(r0);
        r6.append(r4);
        r4 = r6.toString();
        com.android.camera.log.Log.e(r5, r4);
        return r1;
    L_0x006d:
        r4 = r5.getWidth();
        r0 = r5.getHeight();
        if (r4 <= r6) goto L_0x008a;
    L_0x0077:
        r6 = (float) r6;
        r4 = (float) r4;
        r6 = r6 / r4;
        r4 = r4 * r6;
        r4 = java.lang.Math.round(r4);
        r0 = (float) r0;
        r6 = r6 * r0;
        r6 = java.lang.Math.round(r6);
        r0 = 1;
        r5 = android.graphics.Bitmap.createScaledBitmap(r5, r4, r6, r0);
    L_0x008a:
        return r5;
        r0.release();	 Catch:{ RuntimeException -> 0x0090 }
        goto L_0x009a;
    L_0x0090:
        r5 = move-exception;
        r6 = r5.getMessage();
        r0 = "Thumbnail";
        com.android.camera.log.Log.e(r0, r6, r5);
    L_0x009a:
        throw r4;
        */
        throw new UnsupportedOperationException("Method not decompiled: com.android.camera.Thumbnail.createVideoThumbnailBitmap(java.lang.String, java.io.FileDescriptor, int):android.graphics.Bitmap");
    }

    public static Thumbnail createThumbnail(Uri uri, Bitmap bitmap, int i, boolean z) {
        if (bitmap != null) {
            return new Thumbnail(uri, bitmap, i, z);
        }
        Log.e(TAG, "Failed to create thumbnail from null bitmap");
        return null;
    }

    public static int getLastThumbnailFromUriList(ContentResolver contentResolver, Thumbnail[] thumbnailArr, ArrayList<Uri> arrayList, Uri uri) {
        if (arrayList == null || arrayList.size() == 0) {
            return 0;
        }
        int size = arrayList.size() - 1;
        while (size >= 0) {
            Uri uri2 = (Uri) arrayList.get(size);
            if (!Util.isUriValid(uri2, contentResolver)) {
                size--;
            } else if (uri != null && uri.equals(uri2)) {
                return -1;
            } else {
                thumbnailArr[0] = createThumbnailFromUri(contentResolver, uri2, false);
                return 1;
            }
        }
        return 0;
    }
}
