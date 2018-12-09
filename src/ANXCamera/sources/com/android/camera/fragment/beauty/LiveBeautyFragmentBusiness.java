package com.android.camera.fragment.beauty;

import android.support.v4.app.Fragment;
import java.util.ArrayList;
import java.util.List;

public class LiveBeautyFragmentBusiness implements IBeautyFragmentBusiness {
    List<Fragment> mFragments;

    public List<Fragment> getCurrentShowFragmentList() {
        if (this.mFragments == null) {
            this.mFragments = new ArrayList();
        } else {
            this.mFragments.clear();
        }
        this.mFragments.add(new LiveBeautyFilterFragment());
        this.mFragments.add(new LiveBeautyModeFragment());
        return this.mFragments;
    }

    public Object operate(Object obj) {
        return null;
    }
}
