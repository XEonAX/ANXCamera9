package com.android.camera.sticker;

import com.android.camera.module.impl.component.FileUtils;
import com.android.camera.network.resource.LiveResource;
import java.io.File;

public class LiveStickerInfo extends LiveResource {
    public int downloadState;
    public String hash;
    public String icon;
    public int iconId;
    public String name;
    public String url;

    public LiveStickerInfo() {
        this.downloadState = 0;
    }

    public LiveStickerInfo(String str, int i) {
        this.downloadState = 0;
        this.isLocal = true;
        this.name = str;
        this.iconId = i;
    }

    public boolean isDownloaded() {
        StringBuilder stringBuilder = new StringBuilder();
        stringBuilder.append(FileUtils.STICKER_RESOURCE_DIR);
        stringBuilder.append(this.name);
        return new File(stringBuilder.toString()).exists();
    }

    public int getDownloadState() {
        if (this.downloadState == 3 || !isDownloaded()) {
            return this.downloadState;
        }
        return 1;
    }
}
