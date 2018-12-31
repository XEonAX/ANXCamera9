package com.ss.android.ugc.effectmanager.effect.model;

import android.text.TextUtils;
import com.ss.android.ugc.effectmanager.common.model.UrlModel;
import java.util.ArrayList;
import java.util.List;

public class Effect {
    private String app_version;
    private List<String> children;
    private String designer_id;
    private String device_platform;
    private boolean downloaded;
    private String effect_id;
    private int effect_type;
    private UrlModel file_url;
    private String hint;
    private UrlModel hint_icon;
    private UrlModel icon_url;
    private String id;
    private String name;
    private String parent;
    private String schema;
    private String sdk_version;
    private int source;
    private List<String> tags;
    private String tags_updated_at;
    private String type;
    private List<String> types;
    private String unzipPath;
    private String zipPath;

    public UrlModel getHintIcon() {
        return this.hint_icon;
    }

    public void setHintIcon(UrlModel urlModel) {
        this.hint_icon = urlModel;
    }

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

    public void setAppVersion(String str) {
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

    public String getTagsUpdatedAt() {
        return this.tags_updated_at;
    }

    public List<String> getChildren() {
        return this.children;
    }

    public void setChildren(List<String> list) {
        this.children = list;
    }

    public int getEffectType() {
        return this.effect_type;
    }

    public void setEffectType(int i) {
        this.effect_type = i;
    }

    public String getParentId() {
        return this.parent;
    }

    public void setParentId(String str) {
        this.parent = str;
    }

    public int getSource() {
        return this.source;
    }

    public void setSource(int i) {
        this.source = i;
    }

    public String getDesignerId() {
        return this.designer_id;
    }

    public void setDesignerId(String str) {
        this.designer_id = str;
    }

    public String getSchema() {
        return this.schema;
    }

    public void setSchema(String str) {
        this.schema = str;
    }

    public boolean equals(Object obj) {
        if (obj instanceof Effect) {
            return TextUtils.equals(this.effect_id, ((Effect) obj).effect_id);
        }
        return super.equals(obj);
    }

    public String toString() {
        StringBuilder stringBuilder = new StringBuilder();
        stringBuilder.append("Effect{name='");
        stringBuilder.append(this.name);
        stringBuilder.append('\'');
        stringBuilder.append(", effect_id='");
        stringBuilder.append(this.effect_id);
        stringBuilder.append('\'');
        stringBuilder.append(", type='");
        stringBuilder.append(this.type);
        stringBuilder.append('\'');
        stringBuilder.append(", unzipPath='");
        stringBuilder.append(this.unzipPath);
        stringBuilder.append('\'');
        stringBuilder.append(", children=");
        stringBuilder.append(this.children);
        stringBuilder.append(", effectType=");
        stringBuilder.append(this.effect_type);
        stringBuilder.append(", parentId=");
        stringBuilder.append(this.parent);
        stringBuilder.append('}');
        return stringBuilder.toString();
    }
}
