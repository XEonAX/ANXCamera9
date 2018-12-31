package com.android.camera.storage;

import android.content.ContentUris;
import android.content.Context;
import android.location.Location;
import android.net.Uri;
import android.provider.MediaStore.Images.Media;
import com.android.camera.Exif;
import com.android.camera.Thumbnail;
import com.android.camera.Util;
import com.android.camera.db.DbRepository;
import com.android.camera.db.element.SaveTask;
import com.android.camera.log.Log;
import com.xiaomi.camera.base.PerformanceTracker;
import com.xiaomi.camera.parallelservice.util.ParallelUtil;

public final class ParallelSaveRequest implements SaveRequest {
    private static final String TAG = ParallelSaveRequest.class.getSimpleName();
    private Context mContext;
    private byte[] mData;
    private int mImageHeight;
    private int mImageWidth;
    private int mJpegRotation;
    private Location mLocation;
    private boolean mNeedThumbnail;
    private String mSavePath;
    private SaverCallback mSaverCallback;
    private int mSize;
    private long mStartTime;

    public void setContextAndCallback(Context context, SaverCallback saverCallback) {
        this.mContext = context;
        this.mSaverCallback = saverCallback;
    }

    public ParallelSaveRequest(byte[] bArr, long j, Location location, int i, String str, int i2, int i3, boolean z) {
        this.mData = bArr;
        this.mStartTime = j;
        this.mSize = bArr.length;
        this.mLocation = location == null ? null : new Location(location);
        this.mJpegRotation = i;
        this.mSavePath = str;
        this.mImageWidth = i2;
        this.mImageHeight = i3;
        this.mNeedThumbnail = z;
    }

    public void save() {
        String str = TAG;
        StringBuilder stringBuilder = new StringBuilder();
        stringBuilder.append("save: ");
        stringBuilder.append(this.mSavePath);
        stringBuilder.append(" | ");
        stringBuilder.append(this.mStartTime);
        Log.d(str, stringBuilder.toString());
        int i = this.mImageWidth;
        int i2 = this.mImageHeight;
        int orientation = Exif.getOrientation(this.mData);
        if ((this.mJpegRotation + orientation) % 180 != 0) {
            int i3 = i2;
            i2 = i;
            i = i3;
        }
        SaveTask itemByPath = DbRepository.dbItemSaveTask().getItemByPath(this.mSavePath);
        Uri addImage;
        if (itemByPath == null || !itemByPath.isValid()) {
            long currentTimeMillis = System.currentTimeMillis();
            String fileTitleFromPath = this.mSavePath != null ? Util.getFileTitleFromPath(this.mSavePath) : Util.createJpegName(currentTimeMillis);
            String str2 = fileTitleFromPath;
            addImage = Storage.addImage(this.mContext, fileTitleFromPath, currentTimeMillis, this.mLocation, orientation, this.mData, i, i2, false, false, false, false, false, null, null);
            if (addImage != null) {
                if (this.mNeedThumbnail) {
                    Thumbnail createThumbnail = Thumbnail.createThumbnail(this.mData, orientation, Integer.highestOneBit((int) Math.ceil(Math.max((double) i, (double) i2) / 512.0d)), addImage, false);
                    if (createThumbnail != null) {
                        this.mSaverCallback.postUpdateThumbnail(createThumbnail, true);
                    } else {
                        this.mSaverCallback.postHideThumbnailProgressing();
                    }
                }
                this.mSaverCallback.notifyNewMediaData(addImage, str2, 31);
                return;
            }
            return;
        }
        String fileTitleFromPath2 = Util.getFileTitleFromPath(this.mSavePath);
        addImage = ParallelUtil.getResultUri(itemByPath.getMediaStoreId().longValue());
        String str3 = TAG;
        StringBuilder stringBuilder2 = new StringBuilder();
        stringBuilder2.append("algo mark: uri: ");
        stringBuilder2.append(addImage.toString());
        stringBuilder2.append(" | ");
        stringBuilder2.append(itemByPath.getPath());
        Log.d(str3, stringBuilder2.toString());
        String str4 = TAG;
        StringBuilder stringBuilder3 = new StringBuilder();
        stringBuilder3.append("algo mark: ");
        stringBuilder3.append(this.mJpegRotation);
        stringBuilder3.append(" | ");
        stringBuilder3.append(i);
        stringBuilder3.append(" | ");
        stringBuilder3.append(i2);
        stringBuilder3.append(" | ");
        stringBuilder3.append(orientation);
        Log.d(str4, stringBuilder3.toString());
        Storage.updateImage(this.mContext, this.mData, null, ContentUris.withAppendedId(Media.EXTERNAL_CONTENT_URI, itemByPath.getMediaStoreId().longValue()), fileTitleFromPath2, this.mLocation, orientation, i, i2, null);
        ParallelUtil.markTaskFinish(this.mContext, itemByPath, false);
    }

    public int getSize() {
        return this.mSize;
    }

    public boolean isFinal() {
        return true;
    }

    public void onFinish() {
        PerformanceTracker.trackImageSaver(this.mData, 1);
        this.mData = null;
        this.mSaverCallback.onSaveFinish(this.mSize);
    }

    public void run() {
        save();
        onFinish();
    }
}
