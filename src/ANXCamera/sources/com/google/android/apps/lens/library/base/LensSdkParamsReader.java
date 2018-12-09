package com.google.android.apps.lens.library.base;

import android.content.Context;
import android.content.Intent;
import android.content.pm.PackageInfo;
import android.content.pm.PackageManager;
import android.content.pm.PackageManager.NameNotFoundException;
import android.os.AsyncTask;
import android.os.Build.VERSION;
import android.support.annotation.NonNull;
import android.util.Log;
import com.google.android.apps.lens.library.base.proto.nano.LensSdkParamsProto.LensSdkParams;
import java.util.ArrayList;
import java.util.List;

public class LensSdkParamsReader {
    public static final String AGSA_AUTHORITY = "com.google.android.googlequicksearchbox.GsaPublicContentProvider";
    private static final LensSdkParams DEFAULT_PARAMS = new LensSdkParams();
    public static final String LENS_AR_STICKERS_ACTIVITY = "com.google.vr.apps.ornament.app.MainActivity";
    public static final String LENS_AR_STICKERS_PACKAGE = "com.google.ar.lens";
    public static final String LENS_AVAILABILITY_PROVIDER_URI = String.format("content://%s/publicvalue/lens_oem_availability", new Object[]{AGSA_AUTHORITY});
    private static final String LENS_SDK_VERSION = "0.1.0";
    private static final int MIN_AR_CORE_VERSION = 24;
    private static final String TAG = "LensSdkParamsReader";
    private final List<LensSdkParamsCallback> callbacks;
    private final Context context;
    private LensSdkParams lensSdkParams;
    private boolean lensSdkParamsReady;
    private final PackageManager packageManager;

    public interface LensSdkParamsCallback {
        void onLensSdkParamsAvailable(LensSdkParams lensSdkParams);
    }

    private class QueryGsaTask extends AsyncTask<Void, Void, Integer> {
        private QueryGsaTask() {
        }

        /* JADX WARNING: Removed duplicated region for block: B:31:0x0067  */
        /* JADX WARNING: Removed duplicated region for block: B:28:0x0061  */
        protected java.lang.Integer doInBackground(java.lang.Void... r9) {
            /*
            r8 = this;
            r9 = 4;
            r0 = 0;
            r1 = com.google.android.apps.lens.library.base.LensSdkParamsReader.this;	 Catch:{ Exception -> 0x005a }
            r1 = r1.context;	 Catch:{ Exception -> 0x005a }
            r2 = r1.getContentResolver();	 Catch:{ Exception -> 0x005a }
            r1 = com.google.android.apps.lens.library.base.LensSdkParamsReader.LENS_AVAILABILITY_PROVIDER_URI;	 Catch:{ Exception -> 0x005a }
            r3 = android.net.Uri.parse(r1);	 Catch:{ Exception -> 0x005a }
            r4 = r0;
            r4 = (java.lang.String[]) r4;	 Catch:{ Exception -> 0x005a }
            r5 = r0;
            r5 = (java.lang.String) r5;	 Catch:{ Exception -> 0x005a }
            r6 = r0;
            r6 = (java.lang.String[]) r6;	 Catch:{ Exception -> 0x005a }
            r7 = r0;
            r7 = (java.lang.String) r7;	 Catch:{ Exception -> 0x005a }
            r1 = r2.query(r3, r4, r5, r6, r7);	 Catch:{ Exception -> 0x005a }
            if (r1 == 0) goto L_0x004d;
        L_0x0025:
            r0 = r1.getCount();	 Catch:{ Exception -> 0x004a, all -> 0x0047 }
            if (r0 == 0) goto L_0x004d;
        L_0x002b:
            r1.moveToFirst();	 Catch:{ Exception -> 0x004a, all -> 0x0047 }
            r0 = 0;
            r0 = r1.getString(r0);	 Catch:{ Exception -> 0x004a, all -> 0x0047 }
            r0 = java.lang.Integer.parseInt(r0);	 Catch:{ Exception -> 0x004a, all -> 0x0047 }
            r2 = 6;
            if (r0 <= r2) goto L_0x003c;
            r0 = r2;
        L_0x003c:
            r0 = java.lang.Integer.valueOf(r0);	 Catch:{ Exception -> 0x004a, all -> 0x0047 }
            if (r1 == 0) goto L_0x0046;
        L_0x0043:
            r1.close();
        L_0x0046:
            return r0;
        L_0x0047:
            r9 = move-exception;
            r0 = r1;
            goto L_0x0065;
        L_0x004a:
            r0 = move-exception;
            r0 = r1;
            goto L_0x005b;
        L_0x004d:
            r0 = java.lang.Integer.valueOf(r9);	 Catch:{ Exception -> 0x004a, all -> 0x0047 }
            if (r1 == 0) goto L_0x0056;
        L_0x0053:
            r1.close();
        L_0x0056:
            r9 = r0;
            goto L_0x0064;
        L_0x0058:
            r9 = move-exception;
            goto L_0x0065;
        L_0x005a:
            r1 = move-exception;
        L_0x005b:
            r9 = java.lang.Integer.valueOf(r9);	 Catch:{ all -> 0x0058 }
            if (r0 == 0) goto L_0x0064;
        L_0x0061:
            r0.close();
        L_0x0064:
            return r9;
        L_0x0065:
            if (r0 == 0) goto L_0x006a;
        L_0x0067:
            r0.close();
        L_0x006a:
            throw r9;
            */
            throw new UnsupportedOperationException("Method not decompiled: com.google.android.apps.lens.library.base.LensSdkParamsReader.QueryGsaTask.doInBackground(java.lang.Void[]):java.lang.Integer");
        }

        protected void onPostExecute(Integer num) {
            String valueOf = String.valueOf(num);
            String str = LensSdkParamsReader.TAG;
            StringBuilder stringBuilder = new StringBuilder(25 + String.valueOf(valueOf).length());
            stringBuilder.append("Lens availability result:");
            stringBuilder.append(valueOf);
            Log.i(str, stringBuilder.toString());
            LensSdkParamsReader.this.lensSdkParams.lensAvailabilityStatus = num.intValue();
            LensSdkParamsReader.this.lensSdkParamsReady = true;
            for (LensSdkParamsCallback onLensSdkParamsAvailable : LensSdkParamsReader.this.callbacks) {
                onLensSdkParamsAvailable.onLensSdkParamsAvailable(LensSdkParamsReader.this.lensSdkParams);
            }
            LensSdkParamsReader.this.callbacks.clear();
        }
    }

    static {
        DEFAULT_PARAMS.lensSdkVersion = LENS_SDK_VERSION;
        DEFAULT_PARAMS.agsaVersionName = "";
        DEFAULT_PARAMS.lensAvailabilityStatus = -1;
        DEFAULT_PARAMS.arStickersAvailabilityStatus = -1;
    }

    public LensSdkParamsReader(@NonNull Context context) {
        this(context, context.getPackageManager());
    }

    LensSdkParamsReader(@NonNull Context context, @NonNull PackageManager packageManager) {
        this.callbacks = new ArrayList();
        this.context = context;
        this.packageManager = packageManager;
        updateParams();
    }

    public String getLensSdkVersion() {
        return this.lensSdkParams.lensSdkVersion;
    }

    public String getAgsaVersionName() {
        return this.lensSdkParams.agsaVersionName;
    }

    public int getArStickersAvailability() {
        return this.lensSdkParams.arStickersAvailabilityStatus;
    }

    public void getParams(@NonNull LensSdkParamsCallback lensSdkParamsCallback) {
        if (this.lensSdkParamsReady) {
            lensSdkParamsCallback.onLensSdkParamsAvailable(this.lensSdkParams);
        } else {
            this.callbacks.add(lensSdkParamsCallback);
        }
    }

    private void updateParams() {
        this.lensSdkParamsReady = false;
        this.lensSdkParams = DEFAULT_PARAMS.clone();
        try {
            PackageInfo packageInfo = this.packageManager.getPackageInfo("com.google.android.googlequicksearchbox", 0);
            if (packageInfo != null) {
                this.lensSdkParams.agsaVersionName = packageInfo.versionName;
            }
        } catch (NameNotFoundException e) {
            Log.e(TAG, "Unable to find agsa package: com.google.android.googlequicksearchbox");
        }
        this.lensSdkParams.arStickersAvailabilityStatus = 1;
        if (VERSION.SDK_INT >= 24) {
            Intent intent = new Intent();
            intent.setClassName("com.google.ar.lens", LENS_AR_STICKERS_ACTIVITY);
            if (this.packageManager.resolveActivity(intent, 0) != null) {
                this.lensSdkParams.arStickersAvailabilityStatus = 0;
            }
        }
        new QueryGsaTask().execute(new Void[0]);
    }
}
