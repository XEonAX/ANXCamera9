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

public class ParallelSaveRequest implements SaveRequest {
    private Context context;
    private byte[] data;
    private int imageHeight;
    private int imageWidth;
    private int jpegRotation;
    private Location loc;
    private String savePath;
    private SaverCallback saverCallback;
    private int size;
    private long startTime;

    public void setContextAndCallback(Context context, SaverCallback saverCallback) {
        this.context = context;
        this.saverCallback = saverCallback;
    }

    public ParallelSaveRequest(byte[] bArr, long j, Location location, int i, String str, int i2, int i3) {
        this.data = bArr;
        this.startTime = j;
        this.size = bArr.length;
        this.loc = location == null ? null : new Location(location);
        this.jpegRotation = i;
        this.savePath = str;
        this.imageWidth = i2;
        this.imageHeight = i3;
    }

    public void save() {
        StringBuilder stringBuilder = new StringBuilder();
        stringBuilder.append(this.savePath);
        stringBuilder.append(" | ");
        stringBuilder.append(this.startTime);
        Log.e("algo save!!!!:", stringBuilder.toString());
        int i = this.imageWidth;
        int i2 = this.imageHeight;
        int orientation = Exif.getOrientation(this.data);
        if ((this.jpegRotation + orientation) % 180 != 0) {
            int i3 = i2;
            i2 = i;
            i = i3;
        }
        SaveTask itemByPath = DbRepository.dbItemSaveTask().getItemByPath(this.savePath);
        Uri addImage;
        if (itemByPath == null || !itemByPath.isValid()) {
            long currentTimeMillis = System.currentTimeMillis();
            addImage = Storage.addImage(this.context, Util.createJpegName(currentTimeMillis), currentTimeMillis, this.loc, orientation, this.data, i, i2, false, false, false, false, false, null, null);
            if (addImage != null) {
                Thumbnail createThumbnail = Thumbnail.createThumbnail(this.data, orientation, Integer.highestOneBit((int) Math.ceil(Math.max((double) i, (double) i2) / 512.0d)), addImage, false);
                if (createThumbnail != null) {
                    this.saverCallback.postUpdateThumbnail(createThumbnail, true);
                } else {
                    this.saverCallback.postHideThumbnailProgressing();
                }
                this.saverCallback.notifyNewImage(addImage, isFinal());
                return;
            }
            return;
        }
        String fileTitleFromPath = Util.getFileTitleFromPath(this.savePath);
        addImage = ParallelUtil.getResultUri(itemByPath.getMediaStoreId().longValue());
        StringBuilder stringBuilder2 = new StringBuilder();
        stringBuilder2.append("uri :");
        stringBuilder2.append(addImage.toString());
        stringBuilder2.append(" | ");
        stringBuilder2.append(itemByPath.getPath());
        Log.e("algo mark:", stringBuilder2.toString());
        StringBuilder stringBuilder3 = new StringBuilder();
        stringBuilder3.append(this.jpegRotation);
        stringBuilder3.append(" | ");
        stringBuilder3.append(i);
        stringBuilder3.append(" | ");
        stringBuilder3.append(i2);
        stringBuilder3.append(" | ");
        stringBuilder3.append(orientation);
        stringBuilder3.append(" | ");
        Log.e("algo mark:", stringBuilder3.toString());
        Storage.updateImage(this.context, this.data, null, ContentUris.withAppendedId(Media.EXTERNAL_CONTENT_URI, itemByPath.getMediaStoreId().longValue()), fileTitleFromPath, this.loc, orientation, i, i2, null);
        ParallelUtil.markTaskFinish(this.context, itemByPath, false);
    }

    public int getSize() {
        return this.size;
    }

    public boolean isFinal() {
        return false;
    }

    public void onFinish() {
        PerformanceTracker.trackImageSaver(this.data, 1);
        this.data = null;
        this.saverCallback.onSaveFinish(this.size);
    }

    public void run() {
        save();
        onFinish();
    }
}
