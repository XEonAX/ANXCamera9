package com.android.camera2;

import android.annotation.TargetApi;
import android.graphics.Point;
import android.graphics.Rect;
import android.hardware.camera2.params.Face;
import com.android.camera.effect.FaceAnalyzeInfo;

@TargetApi(21)
public class CameraHardwareFace {
    public static final int CAMERA_META_DATA_T2T = 64206;
    private static final String TAG = CameraHardwareFace.class.getSimpleName();
    public float ageFemale;
    public float ageMale;
    public float beautyscore;
    public int blinkDetected = 0;
    public int faceRecognised = 0;
    public int faceType = 0;
    public float gender;
    public int id = -1;
    public Point leftEye = null;
    public Point mouth = null;
    public float prob;
    public Rect rect;
    public Point rightEye = null;
    public int score;
    public int smileDegree = 0;
    public int smileScore = 0;
    public int t2tStop = 0;

    public static CameraHardwareFace[] convertCameraHardwareFace(Face[] faceArr) {
        CameraHardwareFace[] cameraHardwareFaceArr = new CameraHardwareFace[faceArr.length];
        for (int i = 0; i < faceArr.length; i++) {
            cameraHardwareFaceArr[i] = new CameraHardwareFace();
            copyFace(cameraHardwareFaceArr[i], faceArr[i]);
        }
        return cameraHardwareFaceArr;
    }

    public static CameraHardwareFace[] convertExCameraHardwareFace(Face[] faceArr, FaceAnalyzeInfo faceAnalyzeInfo) {
        int min = Math.min(faceArr.length, faceAnalyzeInfo.mAge.length);
        CameraHardwareFace[] cameraHardwareFaceArr = new CameraHardwareFace[min];
        for (int i = 0; i < min; i++) {
            cameraHardwareFaceArr[i] = new CameraHardwareFace();
            copyExFace(cameraHardwareFaceArr[i], faceArr[i], faceAnalyzeInfo.mAge[i], faceAnalyzeInfo.mGender[i], faceAnalyzeInfo.mFaceScore[i], faceAnalyzeInfo.mProp[i]);
        }
        return cameraHardwareFaceArr;
    }

    private static void copyFace(CameraHardwareFace cameraHardwareFace, Face face) {
        cameraHardwareFace.rect = face.getBounds();
        cameraHardwareFace.score = face.getScore();
        cameraHardwareFace.id = face.getId();
    }

    /* JADX WARNING: Removed duplicated region for block: B:5:0x0034 A:{ExcHandler: java.lang.IllegalArgumentException (r3_2 'e' java.lang.Exception), Splitter: B:3:0x0020} */
    /* JADX WARNING: Removed duplicated region for block: B:5:0x0034 A:{ExcHandler: java.lang.IllegalArgumentException (r3_2 'e' java.lang.Exception), Splitter: B:3:0x0020} */
    /* JADX WARNING: Missing block: B:5:0x0034, code:
            r3 = move-exception;
     */
    /* JADX WARNING: Missing block: B:6:0x0035, code:
            com.android.camera.log.Log.e(TAG, r3.getMessage());
     */
    private static void copyExFace(com.android.camera2.CameraHardwareFace r6, android.hardware.camera2.params.Face r7, float r8, float r9, float r10, float r11) {
        /*
        r0 = r7.getBounds();
        r6.rect = r0;
        r0 = r7.getScore();
        r6.score = r0;
        r0 = r7.getId();
        r6.id = r0;
        r0 = r7.getClass();
        r0 = r0.getFields();
        r1 = r0.length;
        r2 = 0;
    L_0x001c:
        if (r2 >= r1) goto L_0x0041;
    L_0x001e:
        r3 = r0[r2];
        r4 = r6.getClass();	 Catch:{ IllegalArgumentException -> 0x0034, IllegalArgumentException -> 0x0034, IllegalArgumentException -> 0x0034 }
        r5 = r3.getName();	 Catch:{ IllegalArgumentException -> 0x0034, IllegalArgumentException -> 0x0034, IllegalArgumentException -> 0x0034 }
        r4 = r4.getField(r5);	 Catch:{ IllegalArgumentException -> 0x0034, IllegalArgumentException -> 0x0034, IllegalArgumentException -> 0x0034 }
        r3 = r3.get(r7);	 Catch:{ IllegalArgumentException -> 0x0034, IllegalArgumentException -> 0x0034, IllegalArgumentException -> 0x0034 }
        r4.set(r6, r3);	 Catch:{ IllegalArgumentException -> 0x0034, IllegalArgumentException -> 0x0034, IllegalArgumentException -> 0x0034 }
        goto L_0x003e;
    L_0x0034:
        r3 = move-exception;
        r4 = TAG;
        r3 = r3.getMessage();
        com.android.camera.log.Log.e(r4, r3);
    L_0x003e:
        r2 = r2 + 1;
        goto L_0x001c;
    L_0x0041:
        r6.gender = r9;
        r6.beautyscore = r10;
        r6.ageMale = r8;
        r6.ageFemale = r8;
        r6.prob = r11;
        return;
        */
        throw new UnsupportedOperationException("Method not decompiled: com.android.camera2.CameraHardwareFace.copyExFace(com.android.camera2.CameraHardwareFace, android.hardware.camera2.params.Face, float, float, float, float):void");
    }
}
