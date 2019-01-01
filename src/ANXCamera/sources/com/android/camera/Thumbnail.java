package com.android.camera;

import android.content.ContentResolver;
import android.content.ContentUris;
import android.database.Cursor;
import android.graphics.Bitmap;
import android.graphics.Bitmap.CompressFormat;
import android.graphics.Bitmap.Config;
import android.graphics.BitmapFactory;
import android.graphics.BitmapFactory.Options;
import android.graphics.Canvas;
import android.graphics.Matrix;
import android.graphics.Paint;
import android.graphics.PaintFlagsDrawFilter;
import android.media.MediaMetadataRetriever;
import android.media.ThumbnailUtils;
import android.net.Uri;
import android.provider.MediaStore.Images;
import android.provider.MediaStore.Video.Thumbnails;
import android.provider.MiuiSettings.ScreenEffect;
import android.text.TextUtils;
import com.android.camera.log.Log;
import com.android.camera.storage.Storage;
import java.io.BufferedInputStream;
import java.io.BufferedOutputStream;
import java.io.Closeable;
import java.io.DataInputStream;
import java.io.DataOutputStream;
import java.io.File;
import java.io.FileDescriptor;
import java.io.FileInputStream;
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
    /* Code decompiled incorrectly, please refer to instructions dump. */
    public static Thumbnail getLastThumbnailFromFile(File file, ContentResolver contentResolver) {
        Closeable bufferedInputStream;
        Object e;
        Closeable closeable;
        String str;
        StringBuilder stringBuilder;
        Throwable th;
        File file2 = new File(file, LAST_THUMB_FILENAME);
        synchronized (sLock) {
            Closeable fileInputStream;
            try {
                fileInputStream = new FileInputStream(file2);
                try {
                    bufferedInputStream = new BufferedInputStream(fileInputStream, 4096);
                } catch (IOException e2) {
                    e = e2;
                    bufferedInputStream = null;
                    closeable = bufferedInputStream;
                    try {
                        str = TAG;
                        stringBuilder = new StringBuilder();
                        stringBuilder.append("Fail to load bitmap. ");
                        stringBuilder.append(e);
                        Log.i(str, stringBuilder.toString());
                        Util.closeSilently(fileInputStream);
                        Util.closeSilently(bufferedInputStream);
                        Util.closeSilently(closeable);
                        return null;
                    } catch (Throwable th2) {
                        th = th2;
                    }
                } catch (Throwable th3) {
                    th = th3;
                    bufferedInputStream = null;
                    closeable = bufferedInputStream;
                    Util.closeSilently(fileInputStream);
                    Util.closeSilently(bufferedInputStream);
                    Util.closeSilently(closeable);
                    throw th;
                }
                try {
                    closeable = new DataInputStream(bufferedInputStream);
                } catch (IOException e3) {
                    e = e3;
                    closeable = null;
                    str = TAG;
                    stringBuilder = new StringBuilder();
                    stringBuilder.append("Fail to load bitmap. ");
                    stringBuilder.append(e);
                    Log.i(str, stringBuilder.toString());
                    Util.closeSilently(fileInputStream);
                    Util.closeSilently(bufferedInputStream);
                    Util.closeSilently(closeable);
                    return null;
                } catch (Throwable th4) {
                    th = th4;
                    closeable = null;
                    Util.closeSilently(fileInputStream);
                    Util.closeSilently(bufferedInputStream);
                    Util.closeSilently(closeable);
                    throw th;
                }
                try {
                    Uri parse = Uri.parse(closeable.readUTF());
                    if (Util.isUriValid(parse, contentResolver)) {
                        Bitmap decodeStream = BitmapFactory.decodeStream(closeable);
                        closeable.close();
                        Util.closeSilently(fileInputStream);
                        Util.closeSilently(bufferedInputStream);
                        Util.closeSilently(closeable);
                    } else {
                        closeable.close();
                        Util.closeSilently(fileInputStream);
                        Util.closeSilently(bufferedInputStream);
                        Util.closeSilently(closeable);
                        return null;
                    }
                } catch (IOException e4) {
                    e = e4;
                    str = TAG;
                    stringBuilder = new StringBuilder();
                    stringBuilder.append("Fail to load bitmap. ");
                    stringBuilder.append(e);
                    Log.i(str, stringBuilder.toString());
                    Util.closeSilently(fileInputStream);
                    Util.closeSilently(bufferedInputStream);
                    Util.closeSilently(closeable);
                    return null;
                }
            } catch (IOException e5) {
                e = e5;
                bufferedInputStream = null;
                fileInputStream = bufferedInputStream;
                closeable = fileInputStream;
                str = TAG;
                stringBuilder = new StringBuilder();
                stringBuilder.append("Fail to load bitmap. ");
                stringBuilder.append(e);
                Log.i(str, stringBuilder.toString());
                Util.closeSilently(fileInputStream);
                Util.closeSilently(bufferedInputStream);
                Util.closeSilently(closeable);
                return null;
            } catch (Throwable th5) {
                th = th5;
                bufferedInputStream = null;
                fileInputStream = bufferedInputStream;
                closeable = fileInputStream;
                Util.closeSilently(fileInputStream);
                Util.closeSilently(bufferedInputStream);
                Util.closeSilently(closeable);
                throw th;
            }
        }
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
    /* Code decompiled incorrectly, please refer to instructions dump. */
    private static Media getLastImageThumbnail(ContentResolver contentResolver) {
        Throwable e;
        Uri uri = android.provider.MediaStore.Images.Media.EXTERNAL_CONTENT_URI;
        Uri build = uri.buildUpon().appendQueryParameter("limit", "1").build();
        String[] strArr = new String[]{"_id", "orientation", "datetaken", "_data"};
        StringBuilder stringBuilder = new StringBuilder();
        stringBuilder.append("mime_type='image/jpeg' AND ");
        stringBuilder.append(getImageBucketIds());
        stringBuilder.append(" AND ");
        stringBuilder.append("_size");
        stringBuilder.append(" > 0");
        String stringBuilder2 = stringBuilder.toString();
        String str = "datetaken DESC,_id DESC";
        Cursor query;
        Cursor query2;
        try {
            int i;
            query = contentResolver.query(build, strArr, stringBuilder2, null, str);
            if (query != null) {
                try {
                    if (query.moveToFirst()) {
                        String string = query.getString(3);
                        Media media;
                        if (TextUtils.isEmpty(string) || !new File(string).exists()) {
                            Log.d(TAG, "getLastImageThumbnail first file is deleted");
                            i = 1;
                            if (i == 0) {
                                query2 = contentResolver.query(uri, strArr, stringBuilder2, null, str);
                                if (query2 != null) {
                                    try {
                                        String str2 = TAG;
                                        StringBuilder stringBuilder3 = new StringBuilder();
                                        stringBuilder3.append("getLastImageThumbnail count=");
                                        stringBuilder3.append(query2.getCount());
                                        Log.d(str2, stringBuilder3.toString());
                                        while (query2.moveToNext()) {
                                            str2 = query2.getString(3);
                                            if (!TextUtils.isEmpty(str2) && new File(str2).exists()) {
                                                long j = query2.getLong(0);
                                                media = new Media(j, query2.getInt(1), query2.getLong(2), ContentUris.withAppendedId(uri, j), str2);
                                                if (query != null) {
                                                    query.close();
                                                }
                                                if (query2 != null) {
                                                    query2.close();
                                                }
                                                return media;
                                            }
                                        }
                                    } catch (Exception e2) {
                                        e = e2;
                                        try {
                                            Log.w(TAG, "getLastImageThumbnail error", e);
                                            if (query != null) {
                                                query.close();
                                            }
                                        } catch (Throwable th) {
                                            e = th;
                                            if (query != null) {
                                                query.close();
                                            }
                                            if (query2 != null) {
                                                query2.close();
                                            }
                                            throw e;
                                        }
                                    }
                                }
                            }
                            query2 = null;
                            if (query != null) {
                                query.close();
                            }
                        } else {
                            long j2 = query.getLong(0);
                            media = new Media(j2, query.getInt(1), query.getLong(2), ContentUris.withAppendedId(uri, j2), string);
                            if (query != null) {
                                query.close();
                            }
                            return media;
                        }
                    }
                } catch (Exception e3) {
                    e = e3;
                    query2 = null;
                    Log.w(TAG, "getLastImageThumbnail error", e);
                    if (query != null) {
                    }
                } catch (Throwable th2) {
                    e = th2;
                    query2 = null;
                    if (query != null) {
                    }
                    if (query2 != null) {
                    }
                    throw e;
                }
            }
            i = 0;
            if (i == 0) {
            }
            if (query != null) {
            }
        } catch (Exception e4) {
            e = e4;
            query2 = null;
            query = query2;
            Log.w(TAG, "getLastImageThumbnail error", e);
            if (query != null) {
            }
        } catch (Throwable th3) {
            e = th3;
            query2 = null;
            query = query2;
            if (query != null) {
            }
            if (query2 != null) {
            }
            throw e;
        }
    }

    /* JADX WARNING: Removed duplicated region for block: B:39:0x0106  */
    /* JADX WARNING: Removed duplicated region for block: B:22:0x009d A:{Catch:{ all -> 0x0096 }} */
    /* JADX WARNING: Removed duplicated region for block: B:41:0x0109  */
    /* JADX WARNING: Removed duplicated region for block: B:43:0x010e  */
    /* JADX WARNING: Removed duplicated region for block: B:48:0x0117  */
    /* JADX WARNING: Removed duplicated region for block: B:50:0x011c  */
    /* JADX WARNING: Removed duplicated region for block: B:48:0x0117  */
    /* JADX WARNING: Removed duplicated region for block: B:50:0x011c  */
    /* Code decompiled incorrectly, please refer to instructions dump. */
    private static Media getLastVideoThumbnail(ContentResolver contentResolver) {
        Throwable th;
        Uri uri = android.provider.MediaStore.Video.Media.EXTERNAL_CONTENT_URI;
        Uri build = uri.buildUpon().appendQueryParameter("limit", "1").build();
        String[] strArr = new String[]{"_id", "_data", "datetaken"};
        StringBuilder stringBuilder = new StringBuilder();
        stringBuilder.append(getVideoBucketIds());
        stringBuilder.append(" AND ");
        stringBuilder.append("_size");
        stringBuilder.append(" > 0");
        String stringBuilder2 = stringBuilder.toString();
        String str = "datetaken DESC,_id DESC";
        Cursor query;
        Cursor query2;
        try {
            int i;
            query = contentResolver.query(build, strArr, stringBuilder2, null, str);
            if (query != null) {
                try {
                    if (query.moveToFirst()) {
                        long j = query.getLong(0);
                        Media media;
                        if (query.getString(1) == null || !new File(query.getString(1)).exists()) {
                            Log.d(TAG, "getLastVideoThumbnail first file is deleted");
                            i = 1;
                            if (i == 0) {
                                query2 = contentResolver.query(uri, strArr, stringBuilder2, null, str);
                                try {
                                    String str2 = TAG;
                                    StringBuilder stringBuilder3 = new StringBuilder();
                                    stringBuilder3.append("getLastVideoThumbnail count=");
                                    stringBuilder3.append(query2.getCount());
                                    Log.d(str2, stringBuilder3.toString());
                                    if (query2 != null) {
                                        while (query2.moveToNext()) {
                                            if (query2.getString(1) != null && new File(query2.getString(1)).exists()) {
                                                long j2 = query2.getLong(0);
                                                media = new Media(j2, 0, query2.getLong(2), ContentUris.withAppendedId(uri, j2), query2.getString(1));
                                                if (query != null) {
                                                    query.close();
                                                }
                                                if (query2 != null) {
                                                    query2.close();
                                                }
                                                return media;
                                            }
                                        }
                                    }
                                } catch (Throwable th2) {
                                    th = th2;
                                    if (query != null) {
                                    }
                                    if (query2 != null) {
                                    }
                                    throw th;
                                }
                            }
                            query2 = null;
                            if (query != null) {
                                query.close();
                            }
                            if (query2 != null) {
                                query2.close();
                            }
                            return null;
                        }
                        media = new Media(j, 0, query.getLong(2), ContentUris.withAppendedId(uri, j), query.getString(1));
                        if (query != null) {
                            query.close();
                        }
                        return media;
                    }
                } catch (Throwable th3) {
                    th = th3;
                    query2 = null;
                    if (query != null) {
                    }
                    if (query2 != null) {
                    }
                    throw th;
                }
            }
            i = 0;
            if (i == 0) {
            }
            if (query != null) {
            }
            if (query2 != null) {
            }
            return null;
        } catch (Throwable th4) {
            th = th4;
            query2 = null;
            query = query2;
            if (query != null) {
                query.close();
            }
            if (query2 != null) {
                query2.close();
            }
            throw th;
        }
    }

    public static Thumbnail createThumbnail(byte[] bArr, int i, int i2, Uri uri, boolean z) {
        Options options = new Options();
        options.inSampleSize = i2;
        options.inPurgeable = true;
        return createThumbnail(uri, BitmapFactory.decodeByteArray(bArr, 0, bArr.length, options), i, z);
    }

    /* JADX WARNING: Removed duplicated region for block: B:24:0x0066  */
    /* JADX WARNING: Removed duplicated region for block: B:26:0x006d  */
    /* Code decompiled incorrectly, please refer to instructions dump. */
    public static Thumbnail createThumbnailFromUri(ContentResolver contentResolver, Uri uri, boolean z) {
        if (!(uri == null || uri.getPath() == null)) {
            String[] strArr;
            String string;
            int i;
            boolean contains = uri.getPath().contains(android.provider.MediaStore.Images.Media.EXTERNAL_CONTENT_URI.getPath());
            if (contains) {
                strArr = new String[]{"_id", "_data", "orientation"};
            } else {
                strArr = new String[]{"_id", "_data"};
            }
            Cursor query = contentResolver.query(uri, strArr, null, null, null);
            long j = -1;
            int i2 = 0;
            if (query != null) {
                try {
                    if (query.moveToFirst()) {
                        j = query.getLong(0);
                        string = query.getString(1);
                        if (contains) {
                            i2 = query.getInt(2);
                        }
                        i = i2;
                        i2 = 1;
                        if (query != null) {
                            query.close();
                        }
                        if (i2 != 0) {
                            Bitmap thumbnail;
                            if (contains) {
                                thumbnail = Images.Thumbnails.getThumbnail(contentResolver, j, 1, null);
                                if (thumbnail == null) {
                                    thumbnail = ThumbnailUtils.createImageThumbnail(string, 1);
                                }
                            } else {
                                thumbnail = Thumbnails.getThumbnail(contentResolver, j, 1, null);
                                if (thumbnail == null) {
                                    thumbnail = ThumbnailUtils.createVideoThumbnail(string, 1);
                                }
                            }
                            return createThumbnail(uri, thumbnail, i, z);
                        }
                    }
                } catch (Throwable th) {
                    if (query != null) {
                        query.close();
                    }
                }
            }
            string = null;
            i = 0;
            if (query != null) {
            }
            if (i2 != 0) {
            }
        }
        return null;
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
    /* Code decompiled incorrectly, please refer to instructions dump. */
    private static Bitmap createVideoThumbnailBitmap(String str, FileDescriptor fileDescriptor, int i) {
        Bitmap bitmap;
        MediaMetadataRetriever mediaMetadataRetriever = new MediaMetadataRetriever();
        if (str != null) {
            try {
                mediaMetadataRetriever.setDataSource(str);
            } catch (Throwable e) {
                Log.e(TAG, e.getMessage(), e);
                mediaMetadataRetriever.release();
                bitmap = null;
                if (bitmap == null) {
                }
            } catch (Throwable e2) {
                Log.e(TAG, e2.getMessage(), e2);
                try {
                    mediaMetadataRetriever.release();
                } catch (Throwable e22) {
                    Log.e(TAG, e22.getMessage(), e22);
                }
                bitmap = null;
                if (bitmap == null) {
                }
            } catch (Throwable th) {
                try {
                    mediaMetadataRetriever.release();
                } catch (Throwable e222) {
                    Log.e(TAG, e222.getMessage(), e222);
                }
                throw th;
            }
        }
        mediaMetadataRetriever.setDataSource(fileDescriptor);
        bitmap = mediaMetadataRetriever.getFrameAtTime(-1);
        try {
            mediaMetadataRetriever.release();
        } catch (Throwable e3) {
            Log.e(TAG, e3.getMessage(), e3);
        }
        if (bitmap == null) {
            String str2 = TAG;
            StringBuilder stringBuilder = new StringBuilder();
            stringBuilder.append("fail to get thumbnail for ");
            stringBuilder.append(str);
            Log.e(str2, stringBuilder.toString());
            return null;
        }
        int width = bitmap.getWidth();
        int height = bitmap.getHeight();
        if (width > i) {
            float f = (float) width;
            float f2 = ((float) i) / f;
            bitmap = Bitmap.createScaledBitmap(bitmap, Math.round(f * f2), Math.round(f2 * ((float) height)), true);
        }
        return bitmap;
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
