package com.ss.android.vesdk.faceinfo;

import android.support.annotation.Keep;

@Keep
public class VEFaceAttributeInfo {
    VEFaceAttribute[] info;

    public VEFaceAttribute[] getInfo() {
        return this.info;
    }

    public void setInfo(VEFaceAttribute[] vEFaceAttributeArr) {
        this.info = vEFaceAttributeArr;
    }
}
