package com.android.camera.module.loader;

import android.hardware.camera2.CaptureResult;
import android.hardware.camera2.params.Face;
import com.android.camera.CameraSettings;
import com.android.camera.log.Log;
import com.android.camera2.CaptureResultParser;
import io.reactivex.functions.Function;

public class FunctionParseAiScene implements Function<CaptureResult, Integer> {
    private static final String TAG = "FunctionParseAiScene";
    private int mCurrentFaceScene;
    private int mLatestFaceScene;
    private int mModuleIndex;
    private int mParsedAiScene;
    private int mSameFaceSceneDetectedTimes;

    public FunctionParseAiScene(int i) {
        this.mModuleIndex = i;
    }

    public Integer apply(CaptureResult captureResult) {
        int i;
        Face[] faceArr = (Face[]) captureResult.get(CaptureResult.STATISTICS_FACES);
        if (this.mModuleIndex == 171 || CameraSettings.isFrontCamera() || faceArr == null || faceArr.length <= 0) {
            i = Integer.MIN_VALUE;
        } else {
            i = Integer.MIN_VALUE;
            for (Face face : faceArr) {
                if (face.getBounds().width() > 300) {
                    i = CaptureResultParser.getHDRDetectedScene(captureResult);
                    String str = TAG;
                    StringBuilder stringBuilder = new StringBuilder();
                    stringBuilder.append("parseAiSceneResult: AI_SCENE_MODE_HUMAN  face.length = ");
                    stringBuilder.append(faceArr.length);
                    stringBuilder.append(";face.width = ");
                    stringBuilder.append(face.getBounds().width());
                    stringBuilder.append(";hdrMode = ");
                    stringBuilder.append(i);
                    Log.c(str, stringBuilder.toString());
                    if (i == 1) {
                        i = -1;
                    } else {
                        i = 25;
                    }
                }
            }
        }
        if (faceSceneFiltering(i)) {
            if (i == Integer.MIN_VALUE) {
                int asdDetectedModes = CaptureResultParser.getAsdDetectedModes(captureResult);
                if (asdDetectedModes < 0) {
                    String str2 = TAG;
                    StringBuilder stringBuilder2 = new StringBuilder();
                    stringBuilder2.append("parseAiSceneResult: parse a error result: ");
                    stringBuilder2.append(asdDetectedModes);
                    Log.e(str2, stringBuilder2.toString());
                    this.mParsedAiScene = 0;
                } else {
                    this.mParsedAiScene = asdDetectedModes;
                }
            } else {
                this.mParsedAiScene = i;
            }
        }
        return Integer.valueOf(this.mParsedAiScene);
    }

    private boolean faceSceneFiltering(int i) {
        if (this.mLatestFaceScene != i) {
            this.mLatestFaceScene = i;
            this.mSameFaceSceneDetectedTimes = 0;
        } else if (this.mSameFaceSceneDetectedTimes < 20) {
            this.mSameFaceSceneDetectedTimes++;
            if (20 == this.mSameFaceSceneDetectedTimes && this.mCurrentFaceScene != this.mLatestFaceScene) {
                this.mLatestFaceScene = this.mCurrentFaceScene;
                this.mCurrentFaceScene = this.mLatestFaceScene;
                return true;
            }
        }
        return false;
    }

    public void resetScene() {
        this.mLatestFaceScene = 0;
        this.mParsedAiScene = 0;
    }
}
