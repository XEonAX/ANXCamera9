package com.ss.android.vesdk;

import org.json.JSONObject;

public class VEListener {

    public interface VERecorderStateListener {
        void onHardEncoderInit(boolean z);

        void onNativeInit(int i, String str);
    }

    public interface VEAudioRecorderStateListener {
        void audioRecorderOpenFailed(int i, String str);

        void onAudioRecordError();

        void onPCMDataAvailable(byte[] bArr, int i);

        void onStartRecord(int i, int i2, int i3);

        void onStopRecord(boolean z);
    }

    public interface VECameraStateListener {
        void cameraOpenFailed(int i);

        void cameraOpenSuccess();
    }

    public interface VEMonitorListener {
        void monitorLog(String str, JSONObject jSONObject);
    }
}
