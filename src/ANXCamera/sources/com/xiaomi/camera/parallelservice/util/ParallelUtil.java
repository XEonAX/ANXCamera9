package com.xiaomi.camera.parallelservice.util;

import android.content.ContentUris;
import android.content.ContentValues;
import android.content.Context;
import android.net.Uri;
import android.util.Log;
import com.android.camera.db.element.SaveTask;
import com.google.android.apps.photos.api.ProcessingMetadataQuery;

public class ParallelUtil {
    private static final String PROCESSING_URI = "content://com.xiaomi.camera.parallelservice.provider.SpecialTypesProvider/processing";
    private static final String TAG = ParallelUtil.class.getSimpleName();

    public static class DEBUG {
        public static final boolean ENABLE = false;

        public static void doAssert(boolean z) {
            doAssert(z, null);
        }

        public static void doAssert(boolean z, String str) {
        }

        public static void crash() {
            doAssert(false);
        }
    }

    public static class ParallelProvider {
        public static void deleteInProvider(Context context, Uri uri) {
            DEBUG.doAssert(context != null);
            if (context != null) {
                String access$000 = ParallelUtil.TAG;
                StringBuilder stringBuilder = new StringBuilder();
                stringBuilder.append("deleteInProvider resultUri:");
                stringBuilder.append(uri);
                Log.v(access$000, stringBuilder.toString());
                context.getContentResolver().delete(uri, null, null);
            }
        }

        public static void deleteInProvider(Context context, long j) {
            deleteInProvider(context, ParallelUtil.getResultUri(j));
        }
    }

    public static class ParallelService {
        public static void start(Context context) {
        }
    }

    public static void markTaskFinish(Context context, SaveTask saveTask, boolean z) {
        StringBuilder stringBuilder = new StringBuilder();
        stringBuilder.append(saveTask.getMediaStoreId());
        stringBuilder.append(" | ");
        stringBuilder.append(saveTask.getPath());
        Log.e("algo markfinish:", stringBuilder.toString());
        if (z) {
            ParallelExifUtil.updateExif(saveTask.getPath());
        }
        ParallelProvider.deleteInProvider(context, saveTask.getMediaStoreId().longValue());
    }

    public static void insertImageToParallelService(Context context, long j, String str) {
        StringBuilder stringBuilder = new StringBuilder();
        stringBuilder.append("first:");
        stringBuilder.append(j);
        stringBuilder.append(" | ");
        stringBuilder.append(str);
        Log.e("algo db:", stringBuilder.toString());
        ContentValues contentValues = new ContentValues();
        contentValues.put(ProcessingMetadataQuery.MEDIA_STORE_ID, Long.valueOf(j));
        contentValues.put(ProcessingMetadataQuery.MEDIA_PATH, str);
        try {
            Uri insert = context.getContentResolver().insert(Uri.parse(PROCESSING_URI), contentValues);
            StringBuilder stringBuilder2 = new StringBuilder();
            stringBuilder2.append("uri:");
            stringBuilder2.append(insert.toString());
            Log.e("algo db:", stringBuilder2.toString());
        } catch (Exception e) {
            Log.e(TAG, "Error! insert to parallel provider failed!!!");
        }
    }

    public static Uri getResultUri(long j) {
        return ContentUris.withAppendedId(Uri.parse(PROCESSING_URI), j);
    }
}
