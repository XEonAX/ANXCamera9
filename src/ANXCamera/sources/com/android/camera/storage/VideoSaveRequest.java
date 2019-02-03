package com.android.camera.storage;

import android.content.ContentValues;
import android.content.Context;
import android.graphics.Bitmap;
import android.net.Uri;
import android.os.ParcelFileDescriptor;
import android.provider.MediaStore.Video.Media;
import com.android.camera.FileCompat;
import com.android.camera.Thumbnail;
import com.android.camera.Util;
import com.android.camera.log.Log;
import java.io.File;

public class VideoSaveRequest implements SaveRequest {
    private static final String TAG = "VideoSaveRequest";
    private Context context;
    private ContentValues mContentValues;
    private boolean mIsFinal;
    public Uri mUri;
    private String mVideoPath;
    private SaverCallback saverCallback;

    public void setContextAndCallback(Context context, SaverCallback saverCallback) {
        this.context = context;
        this.saverCallback = saverCallback;
    }

    public VideoSaveRequest(String str, ContentValues contentValues, boolean z) {
        this.mVideoPath = str;
        this.mContentValues = contentValues;
        this.mIsFinal = z;
    }

    public void run() {
        save();
        onFinish();
    }

    public void save() {
        String str;
        StringBuilder stringBuilder;
        Log.d(TAG, "save video: start");
        String asString = this.mContentValues.getAsString("_data");
        if (!asString.equals(this.mVideoPath)) {
            if (new File(this.mVideoPath).renameTo(new File(asString))) {
                this.mVideoPath = asString;
            } else {
                this.mContentValues.put("_data", this.mVideoPath);
            }
        }
        boolean needThumbnail = this.saverCallback.needThumbnail(isFinal());
        this.mUri = addVideoToMediaStore(this.mVideoPath, this.mContentValues);
        if (this.mUri == null) {
            str = TAG;
            stringBuilder = new StringBuilder();
            stringBuilder.append("insert MediaProvider failed, attempt to find uri by path, ");
            stringBuilder.append(this.mVideoPath);
            Log.w(str, stringBuilder.toString());
            this.mUri = MediaProviderUtil.getContentUriFromPath(this.context, this.mVideoPath);
        }
        str = TAG;
        stringBuilder = new StringBuilder();
        stringBuilder.append("save video: media has been stored, Uri: ");
        stringBuilder.append(this.mUri);
        stringBuilder.append(", has thumbnail: ");
        stringBuilder.append(needThumbnail);
        Log.d(str, stringBuilder.toString());
        if (this.mUri != null) {
            boolean z = true;
            if (needThumbnail) {
                Bitmap createVideoThumbnailBitmap = Thumbnail.createVideoThumbnailBitmap(this.mVideoPath, 512);
                if (createVideoThumbnailBitmap != null) {
                    this.saverCallback.postUpdateThumbnail(Thumbnail.createThumbnail(this.mUri, createVideoThumbnailBitmap, 0, false), true);
                } else {
                    this.saverCallback.postHideThumbnailProgressing();
                }
            }
            this.saverCallback.notifyNewMediaData(this.mUri, this.mContentValues.getAsString("title"), 21);
            Context context = this.context;
            String str2 = this.mVideoPath;
            if (!(this.mContentValues.get("latitude") == null && this.mContentValues.get("longitude") == null)) {
                z = false;
            }
            Storage.saveToCloudAlbum(context, str2, -1, z);
        } else if (needThumbnail) {
            this.saverCallback.postHideThumbnailProgressing();
        }
        Log.d(TAG, "save video: end");
    }

    public int getSize() {
        return 0;
    }

    public boolean isFinal() {
        return this.mIsFinal;
    }

    public void onFinish() {
        Log.d(TAG, "onFinish: runnable process finished");
        this.saverCallback.onSaveFinish(getSize());
    }

    private Uri addVideoToMediaStore(String str, ContentValues contentValues) {
        ParcelFileDescriptor parcelFileDescriptor;
        long duration;
        String str2;
        StringBuilder stringBuilder;
        Throwable th;
        Throwable th2;
        Throwable e;
        StringBuilder stringBuilder2;
        Uri uri;
        Uri uri2 = null;
        if (Storage.isUseDocumentMode()) {
            try {
                parcelFileDescriptor = FileCompat.getParcelFileDescriptor(str, false);
                try {
                    duration = Util.getDuration(parcelFileDescriptor.getFileDescriptor());
                    if (parcelFileDescriptor != null) {
                        try {
                            parcelFileDescriptor.close();
                        } catch (Exception e2) {
                        }
                    }
                    if (0 == duration) {
                        str2 = TAG;
                        stringBuilder = new StringBuilder();
                        stringBuilder.append("delete invalid video: ");
                        stringBuilder.append(str);
                        Log.e(str2, stringBuilder.toString());
                        FileCompat.deleteFile(str);
                        return null;
                    }
                } catch (Throwable th22) {
                    Throwable th3 = th22;
                    th22 = th;
                    th = th3;
                }
            } catch (Exception e3) {
                duration = 0;
            }
        } else {
            duration = Util.getDuration(str);
            if (0 == duration) {
                boolean delete = new File(str).delete();
                String str3 = TAG;
                StringBuilder stringBuilder3 = new StringBuilder();
                stringBuilder3.append("delete invalid video: ");
                stringBuilder3.append(str);
                stringBuilder3.append(", deleted : ");
                stringBuilder3.append(delete);
                Log.e(str3, stringBuilder3.toString());
                return null;
            }
        }
        contentValues.put("_size", Long.valueOf(new File(str).length()));
        contentValues.put("duration", Long.valueOf(duration));
        try {
            long currentTimeMillis = System.currentTimeMillis();
            Object insert = this.context.getContentResolver().insert(Media.EXTERNAL_CONTENT_URI, contentValues);
            try {
                str2 = TAG;
                StringBuilder stringBuilder4 = new StringBuilder();
                stringBuilder4.append("addVideoToMediaStore: insert video cost: ");
                stringBuilder4.append(System.currentTimeMillis() - currentTimeMillis);
                stringBuilder4.append("ms");
                Log.d(str2, stringBuilder4.toString());
                str2 = TAG;
                stringBuilder = new StringBuilder();
                stringBuilder.append("Current video URI: ");
                stringBuilder.append(insert);
                Log.d(str2, stringBuilder.toString());
            } catch (Exception e4) {
                e = e4;
                uri2 = insert;
                try {
                    Log.e(TAG, "failed to add video to media store", e);
                    str = TAG;
                    stringBuilder2 = new StringBuilder();
                    stringBuilder2.append("Current video URI: ");
                    stringBuilder2.append(uri2);
                    Log.d(str, stringBuilder2.toString());
                    uri = uri2;
                    return uri;
                } catch (Throwable th4) {
                    e = th4;
                    insert = uri2;
                    stringBuilder = new StringBuilder();
                    stringBuilder.append("Current video URI: ");
                    stringBuilder.append(insert);
                    Log.d(TAG, stringBuilder.toString());
                    throw e;
                }
            } catch (Throwable th5) {
                e = th5;
                stringBuilder = new StringBuilder();
                stringBuilder.append("Current video URI: ");
                stringBuilder.append(insert);
                Log.d(TAG, stringBuilder.toString());
                throw e;
            }
        } catch (Exception e5) {
            e = e5;
            Log.e(TAG, "failed to add video to media store", e);
            str = TAG;
            stringBuilder2 = new StringBuilder();
            stringBuilder2.append("Current video URI: ");
            stringBuilder2.append(uri2);
            Log.d(str, stringBuilder2.toString());
            uri = uri2;
            return uri;
        }
        return uri;
        throw th;
        if (parcelFileDescriptor != null) {
            if (th22 != null) {
                try {
                    parcelFileDescriptor.close();
                } catch (Throwable th6) {
                    th22.addSuppressed(th6);
                }
            } else {
                parcelFileDescriptor.close();
            }
        }
        throw th;
    }
}
