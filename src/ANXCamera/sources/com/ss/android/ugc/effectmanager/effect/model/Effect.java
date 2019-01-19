package com.ss.android.ugc.effectmanager.effect.model;

import android.text.TextUtils;
import com.ss.android.ugc.effectmanager.common.model.UrlModel;
import java.util.ArrayList;
import java.util.List;

public class Effect {
    private String app_version;
    private String device_platform;
    private boolean downloaded;
    private String effect_id;
    private UrlModel file_url;
    private String hint;
    private UrlModel icon_url;
    private String id;
    private String name;
    private String sdk_version;
    private List<String> tags;
    private String tags_updated_at;
    private String type;
    private List<String> types;
    private String unzipPath;
    private String zipPath;

    public String getName() {
        return this.name;
    }

    public void setName(String str) {
        this.name = str;
    }

    public String getHint() {
        return this.hint;
    }

    public void setHint(String str) {
        this.hint = str;
    }

    public String getSdkVersion() {
        return this.sdk_version;
    }

    public void setSdkVersion(String str) {
        this.sdk_version = str;
    }

    public String getAppVersion() {
        return this.app_version;
    }

    public void setApp_version(String str) {
        this.app_version = str;
    }

    public UrlModel getFileUrl() {
        return this.file_url;
    }

    public void setFileUrl(UrlModel urlModel) {
        this.file_url = urlModel;
    }

    public UrlModel getIconUrl() {
        return this.icon_url;
    }

    public void setIconUrl(UrlModel urlModel) {
        this.icon_url = urlModel;
    }

    public String getId() {
        return this.id;
    }

    public void setId(String str) {
        this.id = str;
    }

    public String getEffectId() {
        return this.effect_id;
    }

    public void setEffectId(String str) {
        this.effect_id = str;
    }

    public String getType() {
        return this.type;
    }

    public void setType(String str) {
        this.type = str;
    }

    public List<String> getTypes() {
        return this.types;
    }

    public void setTypes(List<String> list) {
        this.types = list;
    }

    public String getDevicePlatform() {
        return this.device_platform;
    }

    public void setDevicePlatform(String str) {
        this.device_platform = str;
    }

    public String getZipPath() {
        return this.zipPath;
    }

    public void setZipPath(String str) {
        this.zipPath = str;
    }

    public String getUnzipPath() {
        return this.unzipPath;
    }

    public void setUnzipPath(String str) {
        this.unzipPath = str;
    }

    public boolean isDownloaded() {
        return this.downloaded;
    }

    public void setDownloaded(boolean z) {
        this.downloaded = z;
    }

    public List<String> getTags() {
        return this.tags == null ? new ArrayList() : this.tags;
    }

    public void setTags(List<String> list) {
        this.tags = list;
    }

    public String getTags_updated_at() {
        return this.tags_updated_at;
    }

    public void setTagsUpdatedAt(String str) {
        this.tags_updated_at = str;
    }

    public boolean equals(Object obj) {
        if (obj instanceof Effect) {
            return TextUtils.equals(this.effect_id, ((Effect) obj).effect_id);
        }
        return super.equals(obj);
    }
}
