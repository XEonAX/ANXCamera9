package com.google.lens.sdk;

import android.app.Activity;
import android.app.KeyguardManager;
import android.app.KeyguardManager.KeyguardDismissCallback;
import android.content.Context;
import android.content.Intent;
import android.net.Uri;
import android.os.Build.VERSION;
import android.support.annotation.NonNull;
import android.support.annotation.VisibleForTesting;
import android.util.Log;
import com.google.android.apps.lens.library.base.LensSdkParamsReader;
import com.google.android.apps.lens.library.base.LensServiceBridge;
import com.google.android.apps.lens.library.base.proto.nano.LensSdkParamsProto.LensSdkParams;

public class LensApi {
    @VisibleForTesting
    static final String LENS_BITMAP_URI_KEY = "LensBitmapUriKey";
    @VisibleForTesting
    static final String LENS_DEEPLINKING_STRING = "googleapp://lens";
    @VisibleForTesting
    static final Uri LENS_DEEPLINKING_URI = Uri.parse(LENS_DEEPLINKING_STRING);
    private static final String TAG = "LensApi";
    private final Context context;
    private final LensSdkParamsReader paramsReader;
    private final LensServiceBridge serviceBridge;

    public interface LensAvailabilityCallback {
        void onAvailabilityStatusFetched(@LensAvailabilityStatus int i);
    }

    public @interface LensAvailabilityStatus {
        public static final int LENS_READY = 0;
        public static final int LENS_UNAVAILABLE = 1;
        public static final int LENS_UNAVAILABLE_DEVICE_INCOMPATIBLE = 3;
        public static final int LENS_UNAVAILABLE_DEVICE_LOCKED = 5;
        public static final int LENS_UNAVAILABLE_LOCALE_NOT_SUPPORTED = 2;
        public static final int LENS_UNAVAILABLE_UNKNOWN_ERROR_CODE = 6;
    }

    public @interface LensFeature {
        public static final int LENS_AR_STICKERS = 1;
        public static final int LENS_CORE = 0;
    }

    private static final class LensSdkParamsCallback implements com.google.android.apps.lens.library.base.LensSdkParamsReader.LensSdkParamsCallback {
        private final LensAvailabilityCallback lensAvailabilityCallback;

        LensSdkParamsCallback(@NonNull LensAvailabilityCallback lensAvailabilityCallback) {
            this.lensAvailabilityCallback = lensAvailabilityCallback;
        }

        public void onLensSdkParamsAvailable(LensSdkParams lensSdkParams) {
            this.lensAvailabilityCallback.onAvailabilityStatusFetched(LensApi.mapInternalLensAvailabilityToExternal(lensSdkParams.lensAvailabilityStatus));
        }
    }

    public LensApi(Context context) {
        this.context = context;
        this.paramsReader = new LensSdkParamsReader(context);
        this.serviceBridge = new LensServiceBridge(context);
    }

    public void onResume() {
        this.serviceBridge.bindService();
    }

    public void onPause() {
        this.serviceBridge.unbindService();
    }

    public void launchLensActivity(final Activity activity) {
        KeyguardManager keyguardManager = (KeyguardManager) activity.getSystemService("keyguard");
        if (!keyguardManager.isKeyguardLocked()) {
            startLensActivity(activity);
        } else if (VERSION.SDK_INT >= 26) {
            keyguardManager.requestDismissKeyguard(activity, new KeyguardDismissCallback() {
                public void onDismissSucceeded() {
                    Log.d(LensApi.TAG, "Keyguard successfully dismissed");
                    LensApi.this.startLensActivity(activity);
                }

                public void onDismissError() {
                    Log.e(LensApi.TAG, "Error dismissing keyguard");
                }

                public void onDismissCancelled() {
                    Log.d(LensApi.TAG, "Keyguard dismiss cancelled");
                }
            });
        } else {
            String str = TAG;
            int i = VERSION.SDK_INT;
            StringBuilder stringBuilder = new StringBuilder(64);
            stringBuilder.append("Cannot start Lens when device is locked with Android ");
            stringBuilder.append(i);
            Log.e(str, stringBuilder.toString());
        }
    }

    public void launchLensActivity(Activity activity, @LensFeature int i) {
        switch (i) {
            case 0:
                launchLensActivity(activity);
                return;
            case 1:
                if (this.paramsReader.getArStickersAvailability() == 0) {
                    Intent intent = new Intent();
                    intent.setClassName("com.google.ar.lens", LensSdkParamsReader.LENS_AR_STICKERS_ACTIVITY);
                    activity.startActivity(intent);
                    return;
                }
                return;
            default:
                String str = TAG;
                StringBuilder stringBuilder = new StringBuilder(34);
                stringBuilder.append("Invalid lens activity: ");
                stringBuilder.append(i);
                Log.w(str, stringBuilder.toString());
                return;
        }
    }

    private void startLensActivity(Activity activity) {
        if (this.serviceBridge.prewarmLensActivity()) {
            Log.i(TAG, "Lens is pre-warmed.");
        }
        Intent intent = new Intent();
        intent.setAction("android.intent.action.VIEW");
        intent.setData(Uri.parse(LENS_DEEPLINKING_STRING));
        activity.startActivityForResult(intent, 0);
    }

    public void launchLensActivityWithBitmapUri(Activity activity, Uri uri) {
        if (uri == null) {
            Log.e(TAG, "Image URI is null!");
            return;
        }
        Intent intent = new Intent();
        intent.setAction("android.intent.action.VIEW");
        intent.setData(appendBitmapUri(LENS_DEEPLINKING_URI, uri));
        activity.startActivityForResult(intent, 0);
    }

    public void checkLensAvailability(LensAvailabilityCallback lensAvailabilityCallback) {
        if (!((KeyguardManager) this.context.getSystemService("keyguard")).isKeyguardLocked() || VERSION.SDK_INT >= 26) {
            this.paramsReader.getParams(new LensSdkParamsCallback(lensAvailabilityCallback));
        } else {
            lensAvailabilityCallback.onAvailabilityStatusFetched(5);
        }
    }

    public void checkArStickersAvailability(LensAvailabilityCallback lensAvailabilityCallback) {
        lensAvailabilityCallback.onAvailabilityStatusFetched(mapInternalLensAvailabilityToExternal(this.paramsReader.getArStickersAvailability()));
    }

    private Uri appendBitmapUri(Uri uri, Uri uri2) {
        if (uri == null || uri2 == null) {
            return uri;
        }
        return uri.buildUpon().appendQueryParameter(LENS_BITMAP_URI_KEY, uri2.toString()).build();
    }

    @LensAvailabilityStatus
    private static int mapInternalLensAvailabilityToExternal(int i) {
        switch (i) {
            case 0:
            case 1:
            case 2:
            case 3:
            case 5:
            case 6:
                return i;
            default:
                String str = TAG;
                StringBuilder stringBuilder = new StringBuilder(32);
                stringBuilder.append("Internal error code: ");
                stringBuilder.append(i);
                Log.d(str, stringBuilder.toString());
                return 1;
        }
    }
}
