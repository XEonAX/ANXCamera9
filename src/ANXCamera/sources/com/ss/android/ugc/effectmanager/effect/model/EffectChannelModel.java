package com.ss.android.ugc.effectmanager.effect.model;

import java.util.ArrayList;
import java.util.List;

public class EffectChannelModel {
    private List<EffectCategoryModel> category;
    private List<Effect> effects;
    private String front_effect_id;
    private EffectPanelModel panel;
    private String rear_effect_id;
    private String version;

    public EffectChannelModel(String str, List<Effect> list, List<EffectCategoryModel> list2) {
        this.version = str;
        this.effects = list;
        this.category = list2;
    }

    public EffectChannelModel() {
        this.effects = new ArrayList();
        this.category = new ArrayList();
    }

    public String getVersion() {
        return this.version;
    }

    public void setVersion(String str) {
        this.version = str;
    }

    public List<Effect> getEffects() {
        return this.effects;
    }

    public void setEffects(List<Effect> list) {
        this.effects = list;
    }

    public List<EffectCategoryModel> getCategory() {
        return this.category;
    }

    public void setCategory(List<EffectCategoryModel> list) {
        this.category = list;
    }

    public void setFront_effect_id(String str) {
        this.front_effect_id = str;
    }

    public void setRear_effect_id(String str) {
        this.rear_effect_id = str;
    }

    public String getRear_effect_id() {
        return this.rear_effect_id;
    }

    public String getFront_effect_id() {
        return this.front_effect_id;
    }

    public void setPanel(EffectPanelModel effectPanelModel) {
        this.panel = effectPanelModel;
    }

    public EffectPanelModel getPanel() {
        return this.panel;
    }

    public boolean checkValued() {
        if (this.effects == null) {
            this.effects = new ArrayList();
        }
        if (this.category == null) {
            this.category = new ArrayList();
        }
        if (this.panel == null) {
            this.panel = new EffectPanelModel();
        }
        this.panel.checkValued();
        return true;
    }
}
