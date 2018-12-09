package com.android.camera.storage;

import android.content.ContentUris;
import android.content.ContentValues;
import android.content.Context;
import android.net.Uri;
import android.provider.MediaStore.Files;
import android.provider.MediaStore.Images.Media;
import android.provider.MediaStore.Video;
import com.android.camera.log.Log;
import java.io.File;

public class MediaProviderUtil {
    public static final String TAG = "MediaProviderUtil";

    private MediaProviderUtil() {
    }

    public static Uri insertCameraDirectory(Context context, String str) {
        long parent = getParent(context, str);
        if (parent > 0) {
            return insertDirectory(context, str, parent);
        }
        Uri insertDirectory = insertDirectory(context, new File(str).getParent(), 0);
        if (insertDirectory == null) {
            return null;
        }
        return insertDirectory(context, str, ContentUris.parseId(insertDirectory));
    }

    public static Uri insertDirectory(Context context, String str, long j) {
        Uri contentUri = Files.getContentUri("external");
        ContentValues contentValues = new ContentValues();
        contentValues.put("format", Integer.valueOf(12289));
        contentValues.put("media_type", Integer.valueOf(0));
        contentValues.put("_data", str);
        contentValues.put("parent", Long.valueOf(j));
        File file = new File(str);
        if (file.exists()) {
            contentValues.put("date_modified", Long.valueOf(file.lastModified() / 1000));
        }
        try {
            return context.getContentResolver().insert(contentUri, contentValues);
        } catch (Throwable e) {
            String str2 = TAG;
            StringBuilder stringBuilder = new StringBuilder();
            stringBuilder.append("insertDirectory fail, path = ");
            stringBuilder.append(str);
            Log.w(str2, stringBuilder.toString(), e);
            return null;
        }
    }

    private static long getParent(Context context, String str) {
        Throwable th;
        Uri contentUri = Files.getContentUri("external");
        str = new File(str).getParent();
        AutoCloseable query;
        try {
            query = context.getContentResolver().query(contentUri, new String[]{"_id"}, "_data = ?", new String[]{str}, "");
            if (query.moveToNext()) {
                long j = query.getLong(0);
                if (query != null) {
                    $closeResource(null, query);
                }
                return j;
            }
            if (query != null) {
                $closeResource(null, query);
            }
            return 0;
        } catch (Exception e) {
        } catch (Throwable th2) {
            if (query != null) {
                $closeResource(th, query);
            }
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

    public static Uri getContentUriFromPath(Context context, String str) {
        Throwable th;
        Throwable th2;
        try {
            AutoCloseable query = context.getContentResolver().query(Files.getContentUri("external"), new String[]{"_id", "media_type"}, "_data = ?", new String[]{str}, "");
            try {
                if (query.moveToNext()) {
                    long j = (long) query.getInt(0);
                    int i = query.getInt(1);
                    Uri withAppendedId;
                    if (i == 1) {
                        withAppendedId = ContentUris.withAppendedId(Media.getContentUri("external"), j);
                        if (query != null) {
                            $closeResource(null, query);
                        }
                        return withAppendedId;
                    } else if (i == 3) {
                        withAppendedId = ContentUris.withAppendedId(Video.Media.getContentUri("external"), j);
                        if (query != null) {
                            $closeResource(null, query);
                        }
                        return withAppendedId;
                    } else {
                        withAppendedId = ContentUris.withAppendedId(Files.getContentUri("external"), j);
                        if (query != null) {
                            $closeResource(null, query);
                        }
                        return withAppendedId;
                    }
                }
                if (query != null) {
                    $closeResource(null, query);
                }
                return null;
            } catch (Throwable th22) {
                Throwable th3 = th22;
                th22 = th;
                th = th3;
            }
            if (query != null) {
                $closeResource(th22, query);
            }
            throw th;
        } catch (Exception e) {
        }
    }
}
