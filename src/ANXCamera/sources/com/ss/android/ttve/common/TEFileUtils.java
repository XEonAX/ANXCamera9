package com.ss.android.ttve.common;

import android.os.Environment;
import java.io.File;

public class TEFileUtils {
    private static final String DEFAULT_FOLDER_NAME = "BDMedia";
    protected static String msFolderPath;

    public static String getPath() {
        if (msFolderPath == null) {
            StringBuilder stringBuilder = new StringBuilder();
            stringBuilder.append(Environment.getExternalStorageDirectory().getAbsolutePath());
            stringBuilder.append(File.separator);
            stringBuilder.append(DEFAULT_FOLDER_NAME);
            msFolderPath = stringBuilder.toString();
            File file = new File(msFolderPath);
            if (!(file.exists() || file.mkdirs())) {
                return null;
            }
        }
        return msFolderPath;
    }
}
