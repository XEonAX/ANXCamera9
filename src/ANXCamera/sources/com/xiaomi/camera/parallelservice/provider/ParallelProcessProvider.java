package com.xiaomi.camera.parallelservice.provider;

import android.content.ContentProvider;
import android.content.ContentUris;
import android.content.ContentValues;
import android.content.Context;
import android.content.UriMatcher;
import android.content.pm.ProviderInfo;
import android.database.Cursor;
import android.database.MatrixCursor;
import android.net.Uri;
import android.os.Bundle;
import android.os.ParcelFileDescriptor;
import android.support.annotation.NonNull;
import android.support.annotation.Nullable;
import android.text.TextUtils;
import com.android.camera.db.DbContainer;
import com.android.camera.db.DbRepository;
import com.android.camera.db.element.SaveTask;
import com.android.camera.db.item.DbItemSaveTask;
import com.android.camera.log.Log;
import com.google.android.apps.photos.api.ProcessingMetadataQuery;
import com.google.android.apps.photos.api.ProcessingMetadataQuery.ProgressStatus;
import com.xiaomi.camera.parallelservice.util.ParallelUtil.DEBUG;
import com.xiaomi.camera.parallelservice.util.ParallelUtil.ParallelService;
import java.io.File;
import java.io.FileNotFoundException;

public class ParallelProcessProvider extends ContentProvider {
    private static final int DELETE_BY_ID = 6;
    private static final String MATCH_PATH_DELETE_BY_ID = "delete/#";
    private static final String MATCH_PROCESSING_BY_ID = "processing/#";
    private static final String MATCH_PROCESSING_METADATA = "processing";
    private static final int QUERY_PROCESSING_METADATA = 7;
    private static final int QUERY_PROCESSING_METADATA_BY_ID = 8;
    private static final String TAG = "ParallelProcessProvider";
    private static final int VERSION = 1;
    private DbItemSaveTask dbItemSaveTask;
    private UriMatcher mUriMatcher;

    public void attachInfo(Context context, ProviderInfo providerInfo) {
        super.attachInfo(context, providerInfo);
        this.mUriMatcher = new UriMatcher(-1);
        this.mUriMatcher.addURI(providerInfo.authority, MATCH_PATH_DELETE_BY_ID, 6);
        this.mUriMatcher.addURI(providerInfo.authority, "processing", 7);
        this.mUriMatcher.addURI(providerInfo.authority, MATCH_PROCESSING_BY_ID, 8);
    }

    public boolean onCreate() {
        Log.v(TAG, "onCreate");
        DbContainer.init(getContext());
        this.dbItemSaveTask = DbRepository.dbItemSaveTask();
        return true;
    }

    @Nullable
    public Bundle call(@NonNull String str, @Nullable String str2, @Nullable Bundle bundle) {
        if (TextUtils.equals("version", str)) {
            return querySpecialTypesVersion();
        }
        return super.call(str, str2, bundle);
    }

    private Bundle querySpecialTypesVersion() {
        Bundle bundle = new Bundle();
        bundle.putInt("version", 1);
        return bundle;
    }

    @Nullable
    public Cursor query(@NonNull Uri uri, @Nullable String[] strArr, @Nullable String str, @Nullable String[] strArr2, @Nullable String str2) {
        String str3 = TAG;
        StringBuilder stringBuilder = new StringBuilder();
        stringBuilder.append("query uri: ");
        stringBuilder.append(uri);
        Log.v(str3, stringBuilder.toString());
        ParallelService.start(getContext());
        switch (this.mUriMatcher.match(uri)) {
            case 7:
                return queryProcessingMetadata(null);
            case 8:
                return queryProcessingMetadata(Long.valueOf(ContentUris.parseId(uri)));
            default:
                stringBuilder = new StringBuilder();
                stringBuilder.append("Unrecognized uri: ");
                stringBuilder.append(uri);
                throw new IllegalArgumentException(stringBuilder.toString());
        }
    }

    private Cursor queryProcessingMetadata(@Nullable Long l) {
        Cursor matrixCursor = new MatrixCursor(new String[]{ProcessingMetadataQuery.MEDIA_STORE_ID, ProcessingMetadataQuery.MEDIA_PATH, ProcessingMetadataQuery.PROGRESS_STATUS, ProcessingMetadataQuery.PROGRESS_PERCENTAGE, ProcessingMetadataQuery.START_TIME});
        int i = l == null ? 1 : 0;
        for (SaveTask saveTask : this.dbItemSaveTask.getAllItems()) {
            if (i != 0 || saveTask.getMediaStoreId() == l) {
                matrixCursor.addRow(new Object[]{saveTask.getMediaStoreId(), saveTask.getPath(), Integer.valueOf(ProgressStatus.INDETERMINATE.getIdentifier()), Integer.valueOf(saveTask.getPercentage()), saveTask.getStartTime()});
            }
        }
        matrixCursor.moveToPosition(-1);
        return matrixCursor;
    }

    @Nullable
    public String getType(@NonNull Uri uri) {
        throw new UnsupportedOperationException();
    }

    @Nullable
    public Uri insert(@NonNull Uri uri, @Nullable ContentValues contentValues) {
        String str = TAG;
        StringBuilder stringBuilder = new StringBuilder();
        stringBuilder.append("insert uri: ");
        stringBuilder.append(uri);
        Log.v(str, stringBuilder.toString());
        ParallelService.start(getContext());
        if (this.mUriMatcher.match(uri) != 7) {
            StringBuilder stringBuilder2 = new StringBuilder();
            stringBuilder2.append("Unrecognized uri: ");
            stringBuilder2.append(uri);
            throw new IllegalArgumentException(stringBuilder2.toString());
        } else if (contentValues != null) {
            return insertProcessingMetadata(uri, contentValues.getAsLong(ProcessingMetadataQuery.MEDIA_STORE_ID), contentValues.getAsString(ProcessingMetadataQuery.MEDIA_PATH));
        } else {
            throw new IllegalArgumentException("contentValues is null");
        }
    }

    private void notifyChange(Uri uri) {
        Context context = getContext();
        DEBUG.doAssert(context != null);
        if (context != null) {
            context.getContentResolver().notifyChange(uri, null);
        }
    }

    private Uri insertProcessingMetadata(Uri uri, @Nullable Long l, String str) {
        if (l == null || TextUtils.isEmpty(str)) {
            throw new IllegalArgumentException("error insert values");
        }
        String str2 = TAG;
        StringBuilder stringBuilder = new StringBuilder();
        stringBuilder.append("algo db: insert: ");
        stringBuilder.append(l);
        stringBuilder.append(" | ");
        stringBuilder.append(str);
        Log.d(str2, stringBuilder.toString());
        SaveTask itemByPath = this.dbItemSaveTask.getItemByPath(str);
        itemByPath.setMediaStoreId(l);
        this.dbItemSaveTask.updateItem(itemByPath);
        uri = Uri.withAppendedPath(uri, l.toString());
        notifyChange(uri);
        return uri;
    }

    public int delete(@NonNull Uri uri, @Nullable String str, @Nullable String[] strArr) {
        str = TAG;
        StringBuilder stringBuilder = new StringBuilder();
        stringBuilder.append("delete uri: ");
        stringBuilder.append(uri);
        Log.v(str, stringBuilder.toString());
        ParallelService.start(getContext());
        if (this.mUriMatcher.match(uri) == 8) {
            return deleteProcessingMetadata(uri);
        }
        stringBuilder = new StringBuilder();
        stringBuilder.append("Unrecognized uri: ");
        stringBuilder.append(uri);
        throw new IllegalArgumentException(stringBuilder.toString());
    }

    private int deleteProcessingMetadata(Uri uri) {
        long parseId = ContentUris.parseId(uri);
        SaveTask itemByMediaId = this.dbItemSaveTask.getItemByMediaId(Long.valueOf(parseId));
        String str = TAG;
        StringBuilder stringBuilder = new StringBuilder();
        stringBuilder.append("deleteProcessingMetadata: mediaStoreId=");
        stringBuilder.append(parseId);
        Log.d(str, stringBuilder.toString());
        if (itemByMediaId != null) {
            this.dbItemSaveTask.removeItem(itemByMediaId);
            notifyChange(uri);
            return 1;
        }
        Log.v(TAG, "deleteProcessingMetadata: no match task found");
        return 0;
    }

    public int update(@NonNull Uri uri, @Nullable ContentValues contentValues, @Nullable String str, @Nullable String[] strArr) {
        str = TAG;
        StringBuilder stringBuilder = new StringBuilder();
        stringBuilder.append("update uri: ");
        stringBuilder.append(uri);
        Log.d(str, stringBuilder.toString());
        if (this.mUriMatcher.match(uri) != 8) {
            StringBuilder stringBuilder2 = new StringBuilder();
            stringBuilder2.append("Unrecognized uri: ");
            stringBuilder2.append(uri);
            throw new IllegalArgumentException(stringBuilder2.toString());
        } else if (contentValues != null) {
            updateProcessingMetadata(ContentUris.parseId(uri), contentValues.getAsInteger(ProcessingMetadataQuery.PROGRESS_PERCENTAGE).intValue());
            notifyChange(uri);
            return 1;
        } else {
            throw new IllegalArgumentException("contentValues is null");
        }
    }

    private void updateProcessingMetadata(long j, int i) {
        String str = TAG;
        StringBuilder stringBuilder = new StringBuilder();
        stringBuilder.append("updateProcessingMetadata: mediaStoreId=");
        stringBuilder.append(j);
        Log.v(str, stringBuilder.toString());
        SaveTask itemByMediaId = this.dbItemSaveTask.getItemByMediaId(Long.valueOf(j));
        if (itemByMediaId != null) {
            itemByMediaId.setPercentage(i);
            this.dbItemSaveTask.updateItem(itemByMediaId);
            return;
        }
        Log.v(TAG, "updateProcessingMetadata: no match task found");
    }

    @Nullable
    public ParcelFileDescriptor openFile(@NonNull Uri uri, @NonNull String str) throws FileNotFoundException {
        StringBuilder stringBuilder;
        if (!"r".equals(str)) {
            stringBuilder = new StringBuilder();
            stringBuilder.append("Unsupported mode: ");
            stringBuilder.append(str);
            throw new IllegalArgumentException(stringBuilder.toString());
        } else if (this.mUriMatcher.match(uri) == 8) {
            str = TAG;
            stringBuilder = new StringBuilder();
            stringBuilder.append("loading processing thumb: ");
            stringBuilder.append(uri);
            Log.v(str, stringBuilder.toString());
            return loadProcessingImage(ContentUris.parseId(uri));
        } else {
            stringBuilder = new StringBuilder();
            stringBuilder.append("Unrecognized format: ");
            stringBuilder.append(uri);
            throw new IllegalArgumentException(stringBuilder.toString());
        }
    }

    private ParcelFileDescriptor loadProcessingImage(long j) throws FileNotFoundException {
        SaveTask itemByMediaId = this.dbItemSaveTask.getItemByMediaId(Long.valueOf(j));
        if (itemByMediaId != null) {
            return ParcelFileDescriptor.open(new File(itemByMediaId.getPath()), 268435456);
        }
        StringBuilder stringBuilder = new StringBuilder();
        stringBuilder.append("Media removed: ");
        stringBuilder.append(j);
        throw new FileNotFoundException(stringBuilder.toString());
    }
}
