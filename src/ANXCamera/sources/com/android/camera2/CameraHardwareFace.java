package com.android.camera2;

import android.annotation.TargetApi;
import android.graphics.Point;
import android.graphics.Rect;
import android.hardware.camera2.params.Face;
import com.android.camera.effect.FaceAnalyzeInfo;
import java.lang.reflect.Field;

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
    /* Code decompiled incorrectly, please refer to instructions dump. */
    private static void copyExFace(CameraHardwareFace cameraHardwareFace, Face face, float f, float f2, float f3, float f4) {
        cameraHardwareFace.rect = face.getBounds();
        cameraHardwareFace.score = face.getScore();
        cameraHardwareFace.id = face.getId();
        for (Field field : face.getClass().getFields()) {
            try {
                cameraHardwareFace.getClass().getField(field.getName()).set(cameraHardwareFace, field.get(face));
            } catch (Exception e) {
            }
        }
        cameraHardwareFace.gender = f2;
        cameraHardwareFace.beautyscore = f3;
        cameraHardwareFace.ageMale = f;
        cameraHardwareFace.ageFemale = f;
        cameraHardwareFace.prob = f4;
    }
}
