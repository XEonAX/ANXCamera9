package com.android.camera.module;

import android.content.Context;
import android.location.Location;
import android.net.Uri;
import android.os.AsyncTask;
import android.os.ParcelFileDescriptor;
import com.android.camera.CameraApplicationDelegate;
import com.android.camera.ExifHelper;
import com.android.camera.FileCompat;
import com.android.camera.LocationManager;
import com.android.camera.Thumbnail;
import com.android.camera.Util;
import com.android.camera.groupshot.GroupShot;
import com.android.camera.log.Log;
import com.android.camera.storage.SaverCallback;
import com.android.camera.storage.Storage;
import java.io.File;
import java.lang.ref.WeakReference;

public class SaveOutputImageTask extends AsyncTask<Void, Integer, Thumbnail> {
    private static final String TAG = "SaveOutputImageTask";
    private GroupShot mGroupShotInternal;
    private int mHeight;
    private Location mLocation;
    private int mOrientation;
    private WeakReference<SaverCallback> mSaverCallbackWeakReference;
    private volatile long mStartTime;
    private long mTimeTaken;
    private String mTitle;
    private int mWidth;

    public SaveOutputImageTask(SaverCallback saverCallback, long j, Location location, int i, int i2, int i3, String str, GroupShot groupShot) {
        this.mSaverCallbackWeakReference = new WeakReference(saverCallback);
        this.mTimeTaken = j;
        this.mLocation = location;
        this.mWidth = i;
        this.mHeight = i2;
        this.mOrientation = i3;
        this.mTitle = str;
        this.mGroupShotInternal = groupShot;
    }

    /* JADX WARNING: Removed duplicated region for block: B:30:0x0169  */
    /* Code decompiled incorrectly, please refer to instructions dump. */
    protected Thumbnail doInBackground(Void... voidArr) {
        Exception e;
        String str;
        StringBuilder stringBuilder;
        Log.v(TAG, "doInBackground start");
        String generateFilepath;
        try {
            int attach_end = this.mGroupShotInternal.attach_end();
            Log.v(TAG, String.format("attach_end() = 0x%08x", new Object[]{Integer.valueOf(attach_end)}));
            if (isCancelled()) {
                return null;
            }
            attach_end = this.mGroupShotInternal.setBaseImage(0);
            Log.v(TAG, String.format("setBaseImage() = 0x%08x", new Object[]{Integer.valueOf(attach_end)}));
            this.mGroupShotInternal.setBestFace();
            String str2 = TAG;
            StringBuilder stringBuilder2 = new StringBuilder();
            stringBuilder2.append("groupshot attach end & setbestface cost ");
            stringBuilder2.append(System.currentTimeMillis() - this.mStartTime);
            Log.v(str2, stringBuilder2.toString());
            generateFilepath = Storage.generateFilepath(this.mTitle);
            try {
                saveGroupShotImage(generateFilepath);
                str2 = TAG;
                stringBuilder2 = new StringBuilder();
                stringBuilder2.append("groupshot finish group cost ");
                stringBuilder2.append(System.currentTimeMillis() - this.mStartTime);
                stringBuilder2.append(", path = ");
                stringBuilder2.append(generateFilepath);
                Log.v(str2, stringBuilder2.toString());
                if (isCancelled()) {
                    return null;
                }
                if (Util.sIsDumpOrigJpg) {
                    str2 = generateFilepath.substring(0, generateFilepath.lastIndexOf(Storage.JPEG_SUFFIX));
                    new File(str2).mkdirs();
                    stringBuilder2 = new StringBuilder();
                    stringBuilder2.append(str2);
                    stringBuilder2.append(File.separator);
                    this.mGroupShotInternal.saveInputImages(stringBuilder2.toString());
                }
                if (isCancelled() || isCancelled()) {
                    return null;
                }
                Context androidContext = CameraApplicationDelegate.getAndroidContext();
                Uri addImageForGroupOrPanorama = Storage.addImageForGroupOrPanorama(androidContext, generateFilepath, this.mOrientation, this.mTimeTaken, this.mLocation, this.mWidth, this.mHeight);
                String str3 = TAG;
                StringBuilder stringBuilder3 = new StringBuilder();
                stringBuilder3.append("groupshot insert db cost ");
                stringBuilder3.append(System.currentTimeMillis() - this.mStartTime);
                stringBuilder3.append(", uri = ");
                stringBuilder3.append(addImageForGroupOrPanorama);
                Log.v(str3, stringBuilder3.toString());
                SaverCallback saverCallback = (SaverCallback) this.mSaverCallbackWeakReference.get();
                if (saverCallback == null || addImageForGroupOrPanorama == null) {
                    return null;
                }
                saverCallback.notifyNewMediaData(addImageForGroupOrPanorama, this.mTitle, 31);
                Thumbnail createThumbnailFromUri = Thumbnail.createThumbnailFromUri(androidContext.getContentResolver(), addImageForGroupOrPanorama, false);
                str2 = TAG;
                stringBuilder2 = new StringBuilder();
                stringBuilder2.append("groupshot asynctask cost ");
                stringBuilder2.append(System.currentTimeMillis() - this.mStartTime);
                Log.v(str2, stringBuilder2.toString());
                return createThumbnailFromUri;
            } catch (Exception e2) {
                e = e2;
                str = TAG;
                stringBuilder = new StringBuilder();
                stringBuilder.append("SaveOutputImageTask exception occurs, ");
                stringBuilder.append(e.getMessage());
                Log.e(str, stringBuilder.toString());
                if (generateFilepath != null) {
                }
                return null;
            }
        } catch (Exception e3) {
            e = e3;
            generateFilepath = null;
            str = TAG;
            stringBuilder = new StringBuilder();
            stringBuilder.append("SaveOutputImageTask exception occurs, ");
            stringBuilder.append(e.getMessage());
            Log.e(str, stringBuilder.toString());
            if (generateFilepath != null) {
                new File(generateFilepath).delete();
            }
            return null;
        }
    }

    private void saveGroupShotImage(String str) {
        if (Storage.isUseDocumentMode()) {
            ParcelFileDescriptor parcelFileDescriptor;
            try {
                parcelFileDescriptor = FileCompat.getParcelFileDescriptor(str, true);
                this.mGroupShotInternal.getImageAndSaveJpeg(parcelFileDescriptor.getFileDescriptor());
                if (parcelFileDescriptor != null) {
                    parcelFileDescriptor.close();
                }
            } catch (Throwable th) {
                String str2 = TAG;
                StringBuilder stringBuilder = new StringBuilder();
                stringBuilder.append("open file failed, filePath ");
                stringBuilder.append(str);
                Log.e(str2, stringBuilder.toString(), th);
            } catch (Throwable th2) {
                r1.addSuppressed(th2);
            }
            return;
        }
        this.mGroupShotInternal.getImageAndSaveJpeg(str);
        ExifHelper.writeExifByFilePath(str, this.mOrientation, LocationManager.instance().getCurrentLocation(), this.mTimeTaken);
    }

    protected void onPreExecute() {
        this.mStartTime = System.currentTimeMillis();
    }

    protected void onCancelled() {
        Log.v(TAG, "SaveOutputImageTask onCancelled");
        finishGroupShot();
    }

    protected void onPostExecute(Thumbnail thumbnail) {
        Log.v(TAG, "SaveOutputImageTask onPostExecute");
        SaverCallback saverCallback = (SaverCallback) this.mSaverCallbackWeakReference.get();
        if (saverCallback != null) {
            if (thumbnail == null) {
                Log.e(TAG, "onPostExecute thumbnail is null");
                saverCallback.postHideThumbnailProgressing();
            } else {
                String str = TAG;
                StringBuilder stringBuilder = new StringBuilder();
                stringBuilder.append("onPostExecute thumbnail = ");
                stringBuilder.append(thumbnail);
                Log.v(str, stringBuilder.toString());
                saverCallback.postUpdateThumbnail(thumbnail, false);
            }
            String str2 = TAG;
            StringBuilder stringBuilder2 = new StringBuilder();
            stringBuilder2.append("groupshot image process cost ");
            stringBuilder2.append(System.currentTimeMillis() - this.mStartTime);
            Log.v(str2, stringBuilder2.toString());
            finishGroupShot();
        }
    }

    private void finishGroupShot() {
        this.mGroupShotInternal.clearImages();
        this.mGroupShotInternal.finish();
        this.mGroupShotInternal = null;
    }
}
