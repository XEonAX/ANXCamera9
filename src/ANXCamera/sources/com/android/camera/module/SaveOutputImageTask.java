package com.android.camera.module;

import android.location.Location;
import android.os.AsyncTask;
import com.android.camera.groupshot.GroupShot;
import com.android.camera.log.Log;
import com.android.camera.storage.SaverCallback;
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
    protected java.lang.Integer doInBackground(java.lang.Void... r15) {
        /*
        r14 = this;
        r15 = TAG;
        r0 = "doInBackground start";
        com.android.camera.log.Log.v(r15, r0);
        r15 = 0;
        r0 = r14.mGroupShotInternal;	 Catch:{ Exception -> 0x016a }
        r0 = r0.attach_end();	 Catch:{ Exception -> 0x016a }
        r1 = TAG;	 Catch:{ Exception -> 0x016a }
        r2 = "attach_end() = 0x%08x";
        r3 = 1;
        r4 = new java.lang.Object[r3];	 Catch:{ Exception -> 0x016a }
        r0 = java.lang.Integer.valueOf(r0);	 Catch:{ Exception -> 0x016a }
        r5 = 0;
        r4[r5] = r0;	 Catch:{ Exception -> 0x016a }
        r0 = java.lang.String.format(r2, r4);	 Catch:{ Exception -> 0x016a }
        com.android.camera.log.Log.v(r1, r0);	 Catch:{ Exception -> 0x016a }
        r0 = r14.isCancelled();	 Catch:{ Exception -> 0x016a }
        if (r0 == 0) goto L_0x002b;
    L_0x002a:
        return r15;
    L_0x002b:
        r0 = r14.mGroupShotInternal;	 Catch:{ Exception -> 0x016a }
        r0 = r0.setBaseImage(r5);	 Catch:{ Exception -> 0x016a }
        r1 = TAG;	 Catch:{ Exception -> 0x016a }
        r2 = "setBaseImage() = 0x%08x";
        r4 = new java.lang.Object[r3];	 Catch:{ Exception -> 0x016a }
        r0 = java.lang.Integer.valueOf(r0);	 Catch:{ Exception -> 0x016a }
        r4[r5] = r0;	 Catch:{ Exception -> 0x016a }
        r0 = java.lang.String.format(r2, r4);	 Catch:{ Exception -> 0x016a }
        com.android.camera.log.Log.v(r1, r0);	 Catch:{ Exception -> 0x016a }
        r0 = r14.mGroupShotInternal;	 Catch:{ Exception -> 0x016a }
        r0.setBestFace();	 Catch:{ Exception -> 0x016a }
        r0 = TAG;	 Catch:{ Exception -> 0x016a }
        r1 = new java.lang.StringBuilder;	 Catch:{ Exception -> 0x016a }
        r1.<init>();	 Catch:{ Exception -> 0x016a }
        r2 = "groupshot attach end & setbestface cost ";
        r1.append(r2);	 Catch:{ Exception -> 0x016a }
        r6 = java.lang.System.currentTimeMillis();	 Catch:{ Exception -> 0x016a }
        r8 = r14.mStartTime;	 Catch:{ Exception -> 0x016a }
        r6 = r6 - r8;
        r1.append(r6);	 Catch:{ Exception -> 0x016a }
        r1 = r1.toString();	 Catch:{ Exception -> 0x016a }
        com.android.camera.log.Log.v(r0, r1);	 Catch:{ Exception -> 0x016a }
        r0 = android.os.Build.VERSION.SDK_INT;	 Catch:{ Exception -> 0x016a }
        r1 = 28;
        if (r0 >= r1) goto L_0x0074;
    L_0x006c:
        r0 = r14.mTitle;	 Catch:{ Exception -> 0x016a }
        r0 = com.android.camera.storage.Storage.generateFilepath(r0);	 Catch:{ Exception -> 0x016a }
    L_0x0072:
        r7 = r0;
        goto L_0x008c;
    L_0x0074:
        r0 = new java.lang.StringBuilder;	 Catch:{ Exception -> 0x016a }
        r0.<init>();	 Catch:{ Exception -> 0x016a }
        r1 = r14.mTitle;	 Catch:{ Exception -> 0x016a }
        r0.append(r1);	 Catch:{ Exception -> 0x016a }
        r1 = ".jpg";
        r0.append(r1);	 Catch:{ Exception -> 0x016a }
        r0 = r0.toString();	 Catch:{ Exception -> 0x016a }
        r0 = com.android.camera.storage.Storage.generatePrimaryFilepath(r0);	 Catch:{ Exception -> 0x016a }
        goto L_0x0072;
    L_0x008c:
        r0 = r14.mGroupShotInternal;	 Catch:{ Exception -> 0x0168 }
        r0.getImageAndSaveJpeg(r7);	 Catch:{ Exception -> 0x0168 }
        r0 = TAG;	 Catch:{ Exception -> 0x0168 }
        r1 = new java.lang.StringBuilder;	 Catch:{ Exception -> 0x0168 }
        r1.<init>();	 Catch:{ Exception -> 0x0168 }
        r2 = "groupshot finish group cost ";
        r1.append(r2);	 Catch:{ Exception -> 0x0168 }
        r8 = java.lang.System.currentTimeMillis();	 Catch:{ Exception -> 0x0168 }
        r10 = r14.mStartTime;	 Catch:{ Exception -> 0x0168 }
        r8 = r8 - r10;
        r1.append(r8);	 Catch:{ Exception -> 0x0168 }
        r1 = r1.toString();	 Catch:{ Exception -> 0x0168 }
        com.android.camera.log.Log.v(r0, r1);	 Catch:{ Exception -> 0x0168 }
        r0 = r14.isCancelled();	 Catch:{ Exception -> 0x0168 }
        if (r0 == 0) goto L_0x00b5;
    L_0x00b4:
        return r15;
    L_0x00b5:
        r0 = com.android.camera.Util.sIsDumpOrigJpg;	 Catch:{ Exception -> 0x0168 }
        if (r0 == 0) goto L_0x00e1;
    L_0x00b9:
        r0 = ".jpg";
        r0 = r7.lastIndexOf(r0);	 Catch:{ Exception -> 0x0168 }
        r0 = r7.substring(r5, r0);	 Catch:{ Exception -> 0x0168 }
        r1 = new java.io.File;	 Catch:{ Exception -> 0x0168 }
        r1.<init>(r0);	 Catch:{ Exception -> 0x0168 }
        r1.mkdirs();	 Catch:{ Exception -> 0x0168 }
        r1 = new java.lang.StringBuilder;	 Catch:{ Exception -> 0x0168 }
        r1.<init>();	 Catch:{ Exception -> 0x0168 }
        r1.append(r0);	 Catch:{ Exception -> 0x0168 }
        r0 = java.io.File.separator;	 Catch:{ Exception -> 0x0168 }
        r1.append(r0);	 Catch:{ Exception -> 0x0168 }
        r0 = r1.toString();	 Catch:{ Exception -> 0x0168 }
        r1 = r14.mGroupShotInternal;	 Catch:{ Exception -> 0x0168 }
        r1.saveInputImages(r0);	 Catch:{ Exception -> 0x0168 }
    L_0x00e1:
        r0 = r14.isCancelled();	 Catch:{ Exception -> 0x0168 }
        if (r0 == 0) goto L_0x00e8;
    L_0x00e7:
        return r15;
        r0 = r14.isCancelled();
        if (r0 == 0) goto L_0x00f0;
    L_0x00ef:
        return r15;
    L_0x00f0:
        r0 = com.android.camera.CameraApplicationDelegate.getAndroidContext();
        r1 = r14.mOrientation;
        r2 = com.android.camera.LocationManager.instance();
        r2 = r2.getCurrentLocation();
        r8 = r14.mTimeTaken;
        com.android.camera.ExifHelper.writeExif(r7, r1, r2, r8);
        r8 = r14.mOrientation;
        r9 = r14.mTimeTaken;
        r11 = r14.mLocation;
        r12 = r14.mWidth;
        r13 = r14.mHeight;
        r6 = r0;
        r1 = com.android.camera.storage.Storage.addImageForGroupOrPanorama(r6, r7, r8, r9, r11, r12, r13);
        r2 = TAG;
        r4 = new java.lang.StringBuilder;
        r4.<init>();
        r6 = "groupshot insert db cost ";
        r4.append(r6);
        r6 = java.lang.System.currentTimeMillis();
        r8 = r14.mStartTime;
        r6 = r6 - r8;
        r4.append(r6);
        r4 = r4.toString();
        com.android.camera.log.Log.v(r2, r4);
        r2 = r14.mSaverCallbackWeakReference;
        r2 = r2.get();
        r2 = (com.android.camera.storage.SaverCallback) r2;
        if (r2 != 0) goto L_0x013a;
    L_0x0139:
        return r15;
    L_0x013a:
        if (r1 == 0) goto L_0x014a;
    L_0x013c:
        r2.notifyNewImage(r1, r3);
        r0 = r0.getContentResolver();
        r0 = com.android.camera.Thumbnail.createThumbnailFromUri(r0, r1, r5);
        r2.postUpdateThumbnail(r0, r5);
    L_0x014a:
        r0 = TAG;
        r1 = new java.lang.StringBuilder;
        r1.<init>();
        r2 = "groupshot asynctask cost ";
        r1.append(r2);
        r2 = java.lang.System.currentTimeMillis();
        r4 = r14.mStartTime;
        r2 = r2 - r4;
        r1.append(r2);
        r1 = r1.toString();
        com.android.camera.log.Log.v(r0, r1);
        return r15;
    L_0x0168:
        r0 = move-exception;
        goto L_0x016c;
    L_0x016a:
        r0 = move-exception;
        r7 = r15;
    L_0x016c:
        r1 = TAG;
        r2 = new java.lang.StringBuilder;
        r2.<init>();
        r3 = "SaveOutputImageTask exception occurs, ";
        r2.append(r3);
        r0 = r0.getMessage();
        r2.append(r0);
        r0 = r2.toString();
        com.android.camera.log.Log.e(r1, r0);
        if (r7 == 0) goto L_0x0190;
    L_0x0188:
        r0 = new java.io.File;
        r0.<init>(r7);
        r0.delete();
    L_0x0190:
        return r15;
        */
        throw new UnsupportedOperationException("Method not decompiled: com.android.camera.module.SaveOutputImageTask.doInBackground(java.lang.Void[]):java.lang.Integer");
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
