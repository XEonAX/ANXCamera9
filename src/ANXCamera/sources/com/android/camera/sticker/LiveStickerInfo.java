package com.android.camera.sticker;

import com.android.camera.module.impl.component.FileUtils;
import com.android.camera.network.download.Verifier;
import com.android.camera.network.resource.LiveResource;
import java.io.File;

public class LiveStickerInfo extends LiveResource {
    public int downloadState;
    public String hash;
    public String hint;
    public String hintIcon;
    public String icon;
    public int iconId;
    public String name;
    public String url;

    public LiveStickerInfo() {
        this.downloadState = 0;
    }

    public LiveStickerInfo(String str, String str2, int i) {
        this.downloadState = 0;
        this.isLocal = true;
        this.name = str;
        this.iconId = i;
        this.hash = str2;
    }

    public LiveStickerInfo(String str, String str2, String str3) {
        this.downloadState = 0;
        this.isLocal = true;
        this.name = str;
        StringBuilder stringBuilder = new StringBuilder();
        stringBuilder.append("file:///android_asset/live/");
        stringBuilder.append(str3);
        this.icon = stringBuilder.toString();
        this.hash = str2;
    }

    public LiveStickerInfo(String str, String str2, String str3, String str4) {
        this(str, str2, str3);
        this.hint = str4;
    }

    public boolean isDownloaded() {
        StringBuilder stringBuilder = new StringBuilder();
        stringBuilder.append(FileUtils.STICKER_RESOURCE_DIR);
        stringBuilder.append(this.hash);
        stringBuilder.append(FileUtils.SUFFIX);
        File file = new File(stringBuilder.toString());
        if (!file.exists()) {
            return false;
        }
        byte[] hash = Verifier.hash(file, "MD5", 32768);
        if (this.hash.length() != hash.length * 2) {
            return false;
        }
        for (int i = 0; i < hash.length; i++) {
            int i2 = i * 2;
            if (hash[i] != ((byte) ((Character.digit(this.hash.charAt(i2), 16) << 4) | Character.digit(this.hash.charAt(i2 + 1), 16)))) {
                return false;
            }
        }
        return true;
    }

    private boolean isLocalExists() {
        StringBuilder stringBuilder = new StringBuilder();
        stringBuilder.append(FileUtils.STICKER_RESOURCE_DIR);
        stringBuilder.append(this.hash);
        return new File(stringBuilder.toString()).exists();
    }

    public int getDownloadState() {
        if (this.isLocal && this.downloadState == 0) {
            if (isLocalExists()) {
                this.downloadState = 1;
            }
        } else if ((this.downloadState == 0 || this.downloadState == 2 || this.downloadState == 4) && isDownloaded()) {
            this.downloadState = 1;
        }
        return this.downloadState;
    }
}
