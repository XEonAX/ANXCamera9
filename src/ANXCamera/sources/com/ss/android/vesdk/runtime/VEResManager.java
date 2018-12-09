package com.ss.android.vesdk.runtime;

import com.ss.android.vesdk.VEException;
import java.io.File;

public class VEResManager {
    static final String AAC_SURFIX = ".aac";
    static final String AUDIO_FOLDER = "audio";
    static final String COMPOSE_FOLDER = "compose";
    static final String CONCAT_FOLDER = "concat";
    static final String RECORD_AUDIO_SURFIX = ".wav";
    static final String RECORD_VIDEO_SURFIX = ".mp4";
    static final String SEGMENT_FOLDER = "segments";
    static final String UNDERLINE_CONCAT = "_";
    private String mWorkspace = VERuntime.getInstance().getEnv().getWorkspace();

    VEResManager() {
    }

    private String getFolder(String str) throws VEException {
        File file = new File(this.mWorkspace, str);
        if (file.exists() || file.mkdirs()) {
            return file.getAbsolutePath();
        }
        StringBuilder stringBuilder = new StringBuilder();
        stringBuilder.append("mkdirs failed, workspace path: ");
        stringBuilder.append(this.mWorkspace);
        throw new VEException(-100, stringBuilder.toString());
    }

    public static String getFolder(String str, String str2) throws VEException {
        File file = new File(str, str2);
        if (file.exists() || file.mkdirs()) {
            return file.getAbsolutePath();
        }
        StringBuilder stringBuilder = new StringBuilder();
        stringBuilder.append("mkdirs failed, workspace path: ");
        stringBuilder.append(str);
        throw new VEException(-100, stringBuilder.toString());
    }

    public String genRecordWavPath() {
        StringBuilder stringBuilder = new StringBuilder();
        stringBuilder.append(getFolder(AUDIO_FOLDER));
        stringBuilder.append(File.separator);
        stringBuilder.append(System.currentTimeMillis());
        stringBuilder.append(UNDERLINE_CONCAT);
        stringBuilder.append("record");
        stringBuilder.append(RECORD_AUDIO_SURFIX);
        return stringBuilder.toString();
    }

    public String genRecordAacPath() {
        StringBuilder stringBuilder = new StringBuilder();
        stringBuilder.append(getFolder(AUDIO_FOLDER));
        stringBuilder.append(File.separator);
        stringBuilder.append(System.currentTimeMillis());
        stringBuilder.append(UNDERLINE_CONCAT);
        stringBuilder.append("record");
        stringBuilder.append(AAC_SURFIX);
        return stringBuilder.toString();
    }
}
