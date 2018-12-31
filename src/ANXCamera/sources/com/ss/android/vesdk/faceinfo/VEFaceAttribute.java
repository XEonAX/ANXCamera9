package com.ss.android.vesdk.faceinfo;

import android.support.annotation.Keep;

@Keep
public class VEFaceAttribute {
    VEFaceAttributeItem[] faceItems;

    public VEFaceAttributeItem[] getFaceItems() {
        return this.faceItems;
    }

    public void setFaceItems(VEFaceAttributeItem[] vEFaceAttributeItemArr) {
        this.faceItems = vEFaceAttributeItemArr;
    }
}
