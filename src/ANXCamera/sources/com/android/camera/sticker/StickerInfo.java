package com.android.camera.sticker;

import android.text.TextUtils;
import com.android.camera.effect.FilterInfo;
import com.android.camera.network.resource.Resource;
import java.io.File;
import org.json.JSONException;
import org.json.JSONObject;

public class StickerInfo extends Resource {
    private static final String EXTRA_FILTER_ID = "filterId";
    public int downloadState = 0;
    public int imageId;
    public boolean isLocal;
    public String srcPath;

    public StickerInfo(String str, int i) {
        this.srcPath = str;
        this.imageId = i;
        this.isLocal = true;
    }

    public String getSrcPath() {
        if (this.isLocal) {
            return this.srcPath;
        }
        return StickerHelper.getInstance().getStickerPath(this.id);
    }

    public boolean isDownloaded() {
        if (this.isLocal) {
            return true;
        }
        return new File(StickerHelper.getInstance().getStickerPath(this.id)).exists();
    }

    public int getDownloadState() {
        if (this.downloadState == 3 || !isDownloaded()) {
            return this.downloadState;
        }
        return 1;
    }

    public int getFilterId() {
        if (!TextUtils.isEmpty(this.extra)) {
            try {
                return new JSONObject(this.extra).getInt(EXTRA_FILTER_ID);
            } catch (JSONException e) {
                e.printStackTrace();
            }
        }
        return FilterInfo.FILTER_ID_NONE;
    }
}
