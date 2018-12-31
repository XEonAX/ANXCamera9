package com.ss.android.vesdk.faceinfo;

import android.support.annotation.Keep;

@Keep
public class VEFaceAttributeItem {
    String category;
    float label;
    float score;

    public String getCategory() {
        return this.category;
    }

    public void setCategory(String str) {
        this.category = str;
    }

    public float getLabel() {
        return this.label;
    }

    public void setLabel(float f) {
        this.label = f;
    }

    public float getScore() {
        return this.score;
    }

    public void setScore(float f) {
        this.score = f;
    }
}
