package com.android.camera.module;

import android.content.Context;
import android.location.Location;
import android.net.Uri;
import android.os.AsyncTask;
import android.os.Build.VERSION;
import com.android.camera.CameraApplicationDelegate;
import com.android.camera.ExifHelper;
import com.android.camera.LocationManager;
import com.android.camera.Thumbnail;
import com.android.camera.Util;
import com.android.camera.groupshot.GroupShot;
import com.android.camera.log.Log;
import com.android.camera.storage.SaverCallback;
import com.android.camera.storage.Storage;
import java.io.File;
import java.lang.ref.WeakReference;

public class SaveOutputImageTask extends AsyncTask<Void, Integer, Integer> {
    private static final String TAG = SaveOutputImageTask.class.getName();
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

    /* JADX WARNING: Removed duplicated region for block: B:35:0x0188  */
    /* Code decompiled incorrectly, please refer to instructions dump. */
    protected Integer doInBackground(Void... voidArr) {
        Exception e;
        String str;
        StringBuilder stringBuilder;
        Log.v(TAG, "doInBackground start");
        String str2;
        try {
            int attach_end = this.mGroupShotInternal.attach_end();
            Log.v(TAG, String.format("attach_end() = 0x%08x", new Object[]{Integer.valueOf(attach_end)}));
            if (isCancelled()) {
                return null;
            }
            attach_end = this.mGroupShotInternal.setBaseImage(0);
            Log.v(TAG, String.format("setBaseImage() = 0x%08x", new Object[]{Integer.valueOf(attach_end)}));
            this.mGroupShotInternal.setBestFace();
            String str3 = TAG;
            StringBuilder stringBuilder2 = new StringBuilder();
            stringBuilder2.append("groupshot attach end & setbestface cost ");
            stringBuilder2.append(System.currentTimeMillis() - this.mStartTime);
            Log.v(str3, stringBuilder2.toString());
            if (VERSION.SDK_INT < 28) {
                str3 = Storage.generateFilepath(this.mTitle);
            } else {
                StringBuilder stringBuilder3 = new StringBuilder();
                stringBuilder3.append(this.mTitle);
                stringBuilder3.append(Storage.JPEG_SUFFIX);
                str3 = Storage.generatePrimaryFilepath(stringBuilder3.toString());
            }
            str2 = str3;
            try {
                this.mGroupShotInternal.getImageAndSaveJpeg(str2);
                str3 = TAG;
                stringBuilder2 = new StringBuilder();
                stringBuilder2.append("groupshot finish group cost ");
                stringBuilder2.append(System.currentTimeMillis() - this.mStartTime);
                Log.v(str3, stringBuilder2.toString());
                if (isCancelled()) {
                    return null;
                }
                if (Util.sIsDumpOrigJpg) {
                    str3 = str2.substring(0, str2.lastIndexOf(Storage.JPEG_SUFFIX));
                    new File(str3).mkdirs();
                    stringBuilder2 = new StringBuilder();
                    stringBuilder2.append(str3);
                    stringBuilder2.append(File.separator);
                    this.mGroupShotInternal.saveInputImages(stringBuilder2.toString());
                }
                if (isCancelled() || isCancelled()) {
                    return null;
                }
                Context androidContext = CameraApplicationDelegate.getAndroidContext();
                ExifHelper.writeExif(str2, this.mOrientation, LocationManager.instance().getCurrentLocation(), this.mTimeTaken);
                Uri addImageForGroupOrPanorama = Storage.addImageForGroupOrPanorama(androidContext, str2, this.mOrientation, this.mTimeTaken, this.mLocation, this.mWidth, this.mHeight);
                String str4 = TAG;
                StringBuilder stringBuilder4 = new StringBuilder();
                stringBuilder4.append("groupshot insert db cost ");
                stringBuilder4.append(System.currentTimeMillis() - this.mStartTime);
                Log.v(str4, stringBuilder4.toString());
                SaverCallback saverCallback = (SaverCallback) this.mSaverCallbackWeakReference.get();
                if (saverCallback == null) {
                    return null;
                }
                if (addImageForGroupOrPanorama != null) {
                    saverCallback.notifyNewImage(addImageForGroupOrPanorama, true);
                    saverCallback.postUpdateThumbnail(Thumbnail.createThumbnailFromUri(androidContext.getContentResolver(), addImageForGroupOrPanorama, false), false);
                }
                str3 = TAG;
                stringBuilder2 = new StringBuilder();
                stringBuilder2.append("groupshot asynctask cost ");
                stringBuilder2.append(System.currentTimeMillis() - this.mStartTime);
                Log.v(str3, stringBuilder2.toString());
                return null;
            } catch (Exception e2) {
                e = e2;
                str = TAG;
                stringBuilder = new StringBuilder();
                stringBuilder.append("SaveOutputImageTask exception occurs, ");
                stringBuilder.append(e.getMessage());
                Log.e(str, stringBuilder.toString());
                if (str2 != null) {
                }
                return null;
            }
        } catch (Exception e3) {
            e = e3;
            str2 = null;
            str = TAG;
            stringBuilder = new StringBuilder();
            stringBuilder.append("SaveOutputImageTask exception occurs, ");
            stringBuilder.append(e.getMessage());
            Log.e(str, stringBuilder.toString());
            if (str2 != null) {
                new File(str2).delete();
            }
            return null;
        }
    }

    protected void onPreExecute() {
        this.mStartTime = System.currentTimeMillis();
    }

    protected void onCancelled() {
        Log.v(TAG, "SaveOutputImageTask onCancelled");
        finishGroupShot();
    }

    protected void onPostExecute(Integer num) {
        Log.v(TAG, "SaveOutputImageTask onPostExecute");
        String str = TAG;
        StringBuilder stringBuilder = new StringBuilder();
        stringBuilder.append("groupshot image process cost ");
        stringBuilder.append(System.currentTimeMillis() - this.mStartTime);
        Log.v(str, stringBuilder.toString());
        finishGroupShot();
    }

    private void finishGroupShot() {
        this.mGroupShotInternal.clearImages();
        this.mGroupShotInternal.finish();
        this.mGroupShotInternal = null;
    }
}
