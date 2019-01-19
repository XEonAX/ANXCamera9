package com.ss.android.ugc.effectmanager.effect.model;

import java.util.ArrayList;
import java.util.List;

public class EffectChannelResponse {
    private List<Effect> allCategoryEffects;
    private List<EffectCategoryResponse> categoryResponseList;
    private Effect frontEffect;
    private String panel;
    private EffectPanelModel panelModel;
    private Effect rearEffect;
    private String version;

    public EffectChannelResponse(String str, List<Effect> list, List<EffectCategoryResponse> list2) {
        this.version = str;
        this.allCategoryEffects = list;
        this.categoryResponseList = list2;
    }

    public EffectChannelResponse() {
        this.allCategoryEffects = new ArrayList();
        this.categoryResponseList = new ArrayList();
    }

    public EffectChannelResponse(String str) {
        this.panel = str;
        this.allCategoryEffects = new ArrayList();
        this.categoryResponseList = new ArrayList();
    }

    public String getVersion() {
        return this.version;
    }

    public void setPanel(String str) {
        this.panel = str;
    }

    public String getPanel() {
        return this.panel;
    }

    public void setFrontEffect(Effect effect) {
        this.frontEffect = effect;
    }

    public void setRearEffect(Effect effect) {
        this.rearEffect = effect;
    }

    public Effect getFrontEffect() {
        return this.frontEffect;
    }

    public Effect getRearEffect() {
        return this.rearEffect;
    }

    public void setVersion(String str) {
        this.version = str;
    }

    public List<Effect> getAllCategoryEffects() {
        return this.allCategoryEffects;
    }

    public void setAllCategoryEffects(List<Effect> list) {
        this.allCategoryEffects = list;
    }

    public void setPanelModel(EffectPanelModel effectPanelModel) {
        if (effectPanelModel == null) {
            effectPanelModel = new EffectPanelModel();
        }
        this.panelModel = effectPanelModel;
    }

    public EffectPanelModel getPanelModel() {
        if (this.panelModel == null) {
            this.panelModel = new EffectPanelModel();
        }
        this.panelModel.setId(this.panel);
        return this.panelModel;
    }

    public List<EffectCategoryResponse> getCategoryResponseList() {
        return this.categoryResponseList;
    }

    public void setCategoryResponseList(List<EffectCategoryResponse> list) {
        this.categoryResponseList = list;
    }
}
