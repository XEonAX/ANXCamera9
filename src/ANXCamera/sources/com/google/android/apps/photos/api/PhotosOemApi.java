package com.google.android.apps.photos.api;

import android.content.Context;
import android.database.Cursor;
import android.net.Uri;
import android.net.Uri.Builder;
import android.os.Bundle;
import com.android.camera.R;

public final class PhotosOemApi {
    public static final int INITIAL_VERSION = 1;
    public static final String METHOD_VERSION = "version";
    public static final String METHOD_VERSION_KEY_VERSION_INT = "version";
    public static final String PATH_DELETE = "delete";
    public static final String PATH_PROCESSING_DATA = "processing";
    public static final String PATH_SPECIAL_TYPE_DATA = "data";
    public static final String PATH_SPECIAL_TYPE_ID = "type";

    public static int getVersion(Context context) {
        Bundle call = context.getContentResolver().call(new Builder().scheme("content").authority(getAuthority(context)).build(), "version", null, null);
        if (call == null) {
            return 1;
        }
        return call.getInt("version");
    }

    public static String getAuthority(Context context) {
        return context.getString(R.string.provider_authority);
    }

    public static long getMediaStoreIdFromQueryTypeUri(Uri uri) {
        return Long.parseLong(Uri.decode(uri.getLastPathSegment()));
    }

    public static String getSpecialTypeIdFromQueryDataUri(Uri uri) {
        return Uri.decode(uri.getLastPathSegment());
    }

    public static String getSpecialTypeId(Context context, long j) {
        Cursor query = context.getContentResolver().query(getQueryTypeUri(context, j), null, null, null, null);
        if (query != null) {
            try {
                if (query.moveToFirst()) {
                    String string = query.getString(query.getColumnIndexOrThrow(SpecialTypeIdQuery.SPECIAL_TYPE_ID));
                    return string;
                }
            } finally {
                if (query != null) {
                    query.close();
                }
            }
        }
        if (query != null) {
            query.close();
        }
        return null;
    }

    public static Uri getQueryProcessingUri(Context context, long j) {
        return getBaseBuilder(context).appendPath(PATH_PROCESSING_DATA).appendPath(String.valueOf(j)).build();
    }

    public static Uri getQueryProcessingUri(Context context) {
        return getBaseBuilder(context).appendPath(PATH_PROCESSING_DATA).build();
    }

    public static Uri getQueryTypeUri(Context context, long j) {
        return getBaseBuilder(context).appendPath("type").appendPath(String.valueOf(j)).build();
    }

    public static Uri getQueryDataUri(Context context, String str) {
        return getBaseBuilder(context).appendPath("data").appendEncodedPath(Uri.encode(str)).build();
    }

    public static Uri getDeleteUri(Context context, long j) {
        return getBaseBuilder(context).appendPath(PATH_DELETE).appendPath(String.valueOf(j)).build();
    }

    private static Builder getBaseBuilder(Context context) {
        return new Builder().scheme("content").authority(getAuthority(context));
    }
}
