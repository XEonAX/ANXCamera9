package com.android.camera.storage;

import android.content.Context;
import android.location.Location;
import android.net.Uri;
import com.android.camera.Thumbnail;
import com.android.camera.log.Log;
import com.android.gallery3d.exif.ExifInterface;
import com.xiaomi.camera.core.PictureInfo;

public final class ImageSaveRequest implements SaveRequest {
    private static final String TAG = "ImageSaveRequest";
    private String algorithmName;
    private Context context;
    private byte[] data;
    private long date;
    private ExifInterface exif;
    private boolean finalImage;
    private int height;
    private PictureInfo info;
    private boolean isHide;
    private boolean isMap;
    private boolean isParallelProcess;
    private Location loc;
    private boolean mirror;
    private boolean needThumbnail;
    public String oldTitle;
    private int orientation;
    private SaverCallback saverCallback;
    private int size;
    public String title;
    private Uri uri;
    private int width;

    public void setContextAndCallback(Context context, SaverCallback saverCallback) {
        this.context = context;
        this.saverCallback = saverCallback;
    }

    ImageSaveRequest() {
    }

    ImageSaveRequest(byte[] bArr, boolean z, String str, String str2, long j, Uri uri, Location location, int i, int i2, ExifInterface exifInterface, int i3, boolean z2, boolean z3, boolean z4, boolean z5, boolean z6, String str3, PictureInfo pictureInfo) {
        byte[] bArr2 = bArr;
        Location location2 = location;
        this.data = bArr2;
        this.needThumbnail = z;
        this.date = j;
        this.uri = uri;
        this.title = str;
        this.oldTitle = str2;
        this.loc = location2 == null ? null : new Location(location2);
        this.width = i;
        this.height = i2;
        this.exif = exifInterface;
        this.orientation = i3;
        this.isHide = z2;
        this.isMap = z3;
        this.finalImage = z4;
        this.mirror = z5;
        this.isParallelProcess = z6;
        this.algorithmName = str3;
        this.size = bArr2 == null ? 0 : bArr2.length;
        this.info = pictureInfo;
    }

    public void run() {
        save();
        onFinish();
    }

    public void save() {
        boolean z;
        if (this.uri != null) {
            Storage.updateImageWithExtraExif(this.context, this.data, this.exif, this.uri, this.title, this.loc, this.orientation, this.width, this.height, this.oldTitle, this.mirror, this.isParallelProcess, this.algorithmName, this.info);
        } else if (this.data != null) {
            this.uri = Storage.addImage(this.context, this.title, this.date, this.loc, this.orientation, this.data, this.width, this.height, false, this.isHide, this.isMap, false, this.isParallelProcess, this.algorithmName, this.info);
        }
        Storage.getAvailableSpace();
        if (this.needThumbnail && this.saverCallback.needThumbnail(isFinal())) {
            z = true;
        } else {
            z = false;
        }
        if (this.uri != null) {
            if (z) {
                Thumbnail createThumbnailFromUri;
                int highestOneBit = Integer.highestOneBit((int) Math.ceil(Math.max((double) this.width, (double) this.height) / 512.0d));
                if (this.isMap) {
                    createThumbnailFromUri = Thumbnail.createThumbnailFromUri(this.context.getContentResolver(), this.uri, this.mirror);
                } else {
                    createThumbnailFromUri = Thumbnail.createThumbnail(this.data, this.orientation, highestOneBit, this.uri, this.mirror);
                }
                if (createThumbnailFromUri != null) {
                    this.saverCallback.postUpdateThumbnail(createThumbnailFromUri, true);
                } else {
                    this.saverCallback.postHideThumbnailProgressing();
                }
            } else {
                this.saverCallback.updatePreviewThumbnailUri(this.uri);
            }
            this.saverCallback.notifyNewMediaData(this.uri, this.title, 31);
            return;
        }
        Log.e(TAG, "image save failed");
        if (z) {
            this.saverCallback.postHideThumbnailProgressing();
            return;
        }
        Log.e(TAG, "set mWaitingForUri is false");
        this.saverCallback.updatePreviewThumbnailUri(null);
    }

    public int getSize() {
        return this.size;
    }

    public boolean isFinal() {
        return this.finalImage;
    }

    public void onFinish() {
        this.data = null;
        this.saverCallback.onSaveFinish(getSize());
    }
}
