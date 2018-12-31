package com.ss.android.vesdk.runtime;

import com.ss.android.vesdk.VEException;
import com.ss.android.vesdk.VEResult;
import java.io.File;
import java.util.ArrayList;
import java.util.List;

public class VERecorderResManager {
    private String mConcatSegmentAudioPath;
    private String mConcatSegmentVideoPath;
    private String mConcatSementAudioVideoMixedVideoPath;
    private List<String> mSegmentAudioPathList = new ArrayList();
    private String mSegmentDirPath;
    private List<String> mSegmentVideoPathList = new ArrayList();
    private String mWorkspace;

    public VERecorderResManager(String str) {
        this.mWorkspace = str;
        StringBuilder stringBuilder = new StringBuilder();
        stringBuilder.append(this.mWorkspace);
        stringBuilder.append(File.separator);
        stringBuilder.append("segments");
        this.mSegmentDirPath = stringBuilder.toString();
    }

    public void release() {
        if (this.mSegmentVideoPathList != null) {
            this.mSegmentVideoPathList.clear();
            this.mSegmentVideoPathList = null;
        }
        if (this.mSegmentAudioPathList != null) {
            this.mSegmentAudioPathList.clear();
            this.mSegmentAudioPathList = null;
        }
    }

    public String genSegmentVideoPath(int i) {
        StringBuilder stringBuilder = new StringBuilder();
        stringBuilder.append(VEResManager.getFolder(this.mWorkspace, "segments"));
        stringBuilder.append(File.separator);
        stringBuilder.append(i);
        stringBuilder.append(".mp4");
        return stringBuilder.toString();
    }

    public void addSegmentVideoPath(String str) {
        this.mSegmentVideoPathList.add(str);
    }

    public String delSegmentVideoPath() throws VEException {
        if (this.mSegmentVideoPathList.size() > 0) {
            return (String) this.mSegmentVideoPathList.remove(this.mSegmentVideoPathList.size() - 1);
        }
        throw new VEException(VEResult.TER_INVALID_STAT, "segment video list size is 0");
    }

    public List<String> getSegmentVideoPathList() {
        return this.mSegmentVideoPathList;
    }

    public String genSegmentAudioPath(int i) {
        StringBuilder stringBuilder = new StringBuilder();
        stringBuilder.append(VEResManager.getFolder(this.mWorkspace, "segments"));
        stringBuilder.append(File.separator);
        stringBuilder.append(i);
        stringBuilder.append(".wav");
        return stringBuilder.toString();
    }

    public void addSegmentAudioPath(String str) {
        this.mSegmentAudioPathList.add(str);
    }

    public String delSegmentAudioPath() {
        if (this.mSegmentAudioPathList.size() > 0) {
            return (String) this.mSegmentAudioPathList.remove(this.mSegmentAudioPathList.size() - 1);
        }
        return "";
    }

    public List<String> getSegmentAudioPathList() {
        return this.mSegmentAudioPathList;
    }

    public String getSegmentDirPath() {
        return this.mSegmentDirPath;
    }

    public void genConcatSegmentVideoPath() {
        StringBuilder stringBuilder = new StringBuilder();
        stringBuilder.append(VEResManager.getFolder(this.mWorkspace, "concat"));
        stringBuilder.append(File.separator);
        stringBuilder.append("concat");
        stringBuilder.append(".mp4");
        this.mConcatSegmentVideoPath = stringBuilder.toString();
    }

    public String getConcatSegmentVideoPath() {
        return this.mConcatSegmentVideoPath;
    }

    public String getConcatSegmentAudioPath() {
        return this.mConcatSegmentAudioPath;
    }

    public void genConcatSegmentAudioPath() {
        StringBuilder stringBuilder = new StringBuilder();
        stringBuilder.append(VEResManager.getFolder(this.mWorkspace, "concat"));
        stringBuilder.append(File.separator);
        stringBuilder.append("concat");
        stringBuilder.append(".wav");
        this.mConcatSegmentAudioPath = stringBuilder.toString();
    }
}
