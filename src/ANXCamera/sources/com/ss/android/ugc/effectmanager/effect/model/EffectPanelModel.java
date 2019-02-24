package com.ss.android.ugc.effectmanager.effect.model;

import com.ss.android.ugc.effectmanager.common.model.UrlModel;
import java.util.ArrayList;
import java.util.List;

public class EffectPanelModel {
    private UrlModel icon;
    private String id;
    private List<String> tags;
    private String tags_updated_at;
    private String text;

    public String getText() {
        return this.text;
    }

    public void setText(String str) {
        this.text = str;
    }

    public UrlModel getIcon() {
        return this.icon;
    }

    public void setIcon(UrlModel urlModel) {
        this.icon = urlModel;
    }

    public List<String> getTags() {
        return this.tags;
    }

    public void setTags(List<String> list) {
        this.tags = list;
    }

    public String getTags_updated_at() {
        return this.tags_updated_at;
    }

    public void setTags_updated_at(String str) {
        this.tags_updated_at = str;
    }

    public EffectPanelModel(String str, UrlModel urlModel, List<String> list, String str2) {
        this.text = str;
        this.icon = urlModel;
        this.tags = list;
        this.tags_updated_at = str2;
    }

    public EffectPanelModel() {
        if (this.icon == null) {
            this.icon = new UrlModel();
        }
        if (this.tags == null) {
            this.tags = new ArrayList();
        }
    }

    public String getId() {
        return this.id;
    }

    public void setId(String str) {
        this.id = str;
    }

    public boolean checkValued() {
        if (this.icon == null) {
            this.icon = new UrlModel();
        }
        if (this.tags == null) {
            this.tags = new ArrayList();
        }
        return true;
    }
}
