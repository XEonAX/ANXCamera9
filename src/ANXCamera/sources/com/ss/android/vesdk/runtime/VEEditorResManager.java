package com.ss.android.vesdk.runtime;

import java.io.File;

public class VEEditorResManager {
    public String[] mAudioPaths;
    private String mComposedVideoPath;
    private String mCropedAudioPath;
    private String mCropedVideoPath;
    public String[] mReverseVideoPath;
    public String[] mTransitions;
    public String[] mVideoPaths;
    private String mWorkSpace;

    public VEEditorResManager(String str) {
        this.mWorkSpace = str;
    }

    public String genComposedVideoPath() {
        StringBuilder stringBuilder = new StringBuilder();
        stringBuilder.append(VEResManager.getFolder(this.mWorkSpace, "compose"));
        stringBuilder.append(File.separator);
        stringBuilder.append(System.currentTimeMillis());
        stringBuilder.append("_");
        stringBuilder.append("composed");
        stringBuilder.append(".mp4");
        return stringBuilder.toString();
    }

    public String genReverseVideoPath(int i) {
        StringBuilder stringBuilder = new StringBuilder();
        stringBuilder.append(VEResManager.getFolder(this.mWorkSpace, "concat"));
        stringBuilder.append(File.separator);
        stringBuilder.append(i);
        stringBuilder.append("_");
        stringBuilder.append("reverse");
        stringBuilder.append(".mp4");
        return stringBuilder.toString();
    }
}
