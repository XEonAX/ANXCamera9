package com.ss.android.ugc.effectmanager.common.cache;

import android.text.TextUtils;
import com.ss.android.ugc.effectmanager.EffectConfiguration;
import com.ss.android.ugc.effectmanager.common.listener.ICache;
import com.ss.android.ugc.effectmanager.common.utils.FileUtils;
import java.io.File;
import java.io.InputStream;

public class FileCache implements ICache {
    private EffectConfiguration mConfiguration;

    public FileCache(EffectConfiguration effectConfiguration) {
        this.mConfiguration = effectConfiguration;
    }

    public void save(String str, String str2) {
        synchronized (FileCache.class) {
            StringBuilder stringBuilder = new StringBuilder();
            stringBuilder.append(this.mConfiguration.getEffectDir());
            stringBuilder.append(File.separator);
            stringBuilder.append(str);
            FileUtils.writeToExternal(str2, stringBuilder.toString());
        }
    }

    public String queryToString(String str) {
        StringBuilder stringBuilder = new StringBuilder();
        stringBuilder.append(this.mConfiguration.getEffectDir().getPath());
        stringBuilder.append(File.separator);
        stringBuilder.append(str);
        str = stringBuilder.toString();
        synchronized (FileCache.class) {
            Object fileContent = FileUtils.getFileContent(str);
            if (TextUtils.isEmpty(fileContent)) {
                str = "";
                return str;
            }
            return fileContent;
        }
    }

    public InputStream queryToStream(String str) {
        InputStream fileStream;
        StringBuilder stringBuilder = new StringBuilder();
        stringBuilder.append(this.mConfiguration.getEffectDir().getPath());
        stringBuilder.append(File.separator);
        stringBuilder.append(str);
        str = stringBuilder.toString();
        synchronized (FileCache.class) {
            fileStream = FileUtils.getFileStream(str);
        }
        return fileStream;
    }

    public boolean remove(String str) {
        boolean removeFile;
        synchronized (FileCache.class) {
            StringBuilder stringBuilder = new StringBuilder();
            stringBuilder.append(this.mConfiguration.getEffectDir());
            stringBuilder.append(File.separator);
            stringBuilder.append(str);
            removeFile = FileUtils.removeFile(stringBuilder.toString());
        }
        return removeFile;
    }

    public boolean has(String str) {
        StringBuilder stringBuilder = new StringBuilder();
        stringBuilder.append(this.mConfiguration.getEffectDir());
        stringBuilder.append(File.separator);
        stringBuilder.append(str);
        return FileUtils.checkFileExists(stringBuilder.toString());
    }

    public void clear() {
        FileUtils.removeDir(this.mConfiguration.getEffectDir());
    }
}
