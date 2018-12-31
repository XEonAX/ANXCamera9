package com.android.camera.lib.compatibility.related.v23;

import android.annotation.TargetApi;
import android.content.Context;
import android.os.Build.VERSION;
import android.os.storage.DiskInfo;
import android.os.storage.StorageManager;
import android.os.storage.VolumeInfo;
import android.telecom.TelecomManager;
import android.util.Log;
import java.io.File;
import java.util.List;

@TargetApi(23)
public class V23Utils {
    private static final String TAG = "TelecomManagerProxy-v23";

    public static final boolean isInVideoCall(Context context) {
        Log.d(TAG, "isInVideoCall: start");
        if (VERSION.SDK_INT >= 21) {
            TelecomManager telecomManager = (TelecomManager) context.getSystemService("telecom");
            if (telecomManager != null) {
                return telecomManager.isInCall();
            }
        }
        return false;
    }

    public static String getSdcardPath(Context context) {
        String str = null;
        if (VERSION.SDK_INT >= 23) {
            List<VolumeInfo> volumes = ((StorageManager) context.getSystemService("storage")).getVolumes();
            if (volumes != null) {
                for (VolumeInfo volumeInfo : volumes) {
                    if (volumeInfo.getType() == 0 && volumeInfo.isMountedWritable()) {
                        DiskInfo disk = volumeInfo.getDisk();
                        String str2 = TAG;
                        StringBuilder stringBuilder = new StringBuilder();
                        stringBuilder.append("getSdcardPath: diskInfo = ");
                        stringBuilder.append(disk);
                        Log.d(str2, stringBuilder.toString());
                        if (disk != null && disk.isSd()) {
                            break;
                        }
                    }
                }
            }
        }
        VolumeInfo volumeInfo2 = null;
        String str3 = TAG;
        StringBuilder stringBuilder2 = new StringBuilder();
        stringBuilder2.append("getSdcardPath: sdcardVolume = ");
        stringBuilder2.append(volumeInfo2);
        Log.d(str3, stringBuilder2.toString());
        if (volumeInfo2 == null) {
            return null;
        }
        File path = volumeInfo2.getPath();
        if (path != null) {
            str = path.getPath();
        }
        str3 = TAG;
        StringBuilder stringBuilder3 = new StringBuilder();
        stringBuilder3.append("getSdcardPath sd=");
        stringBuilder3.append(str);
        Log.v(str3, stringBuilder3.toString());
        return str;
    }
}
