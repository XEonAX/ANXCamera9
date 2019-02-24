package com.android.camera.fragment.beauty;

import android.util.SparseArray;

public class BeautyFragmentManager {
    private SparseArray<IBeautyFragmentBusiness> mBeautyBusinessArray = new SparseArray();

    public IBeautyFragmentBusiness getBeautyFragmentBusiness(int i) {
        IBeautyFragmentBusiness iBeautyFragmentBusiness = (IBeautyFragmentBusiness) this.mBeautyBusinessArray.get(i);
        if (iBeautyFragmentBusiness != null) {
            return iBeautyFragmentBusiness;
        }
        switch (i) {
            case 161:
                iBeautyFragmentBusiness = new FrontFragmentBusiness();
                break;
            case 162:
                iBeautyFragmentBusiness = new BackMainFragmentBusiness();
                break;
            case 163:
                iBeautyFragmentBusiness = new LiveBeautyFragmentBusiness();
                break;
            default:
                iBeautyFragmentBusiness = new FrontFragmentBusiness();
                break;
        }
        this.mBeautyBusinessArray.put(i, iBeautyFragmentBusiness);
        return iBeautyFragmentBusiness;
    }
}
