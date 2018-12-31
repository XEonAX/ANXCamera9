package com.android.camera.module.loader.camera2;

public class Camera2Result {
    public static final int RESULT_ERROR = 3;
    public static final int RESULT_OPEN_NEW_OK = 2;
    private int mCameraError;
    @Camera2ResultType
    private int mResult;

    public @interface Camera2ResultType {
    }

    private Camera2Result(@Camera2ResultType int i) {
        this.mResult = i;
    }

    public static Camera2Result create(@Camera2ResultType int i) {
        return new Camera2Result(i);
    }

    public Camera2Result setCameraError(int i) {
        this.mCameraError = i;
        return this;
    }

    @Camera2ResultType
    public int getResult() {
        return this.mResult;
    }

    public int getCameraError() {
        return this.mCameraError;
    }
}
