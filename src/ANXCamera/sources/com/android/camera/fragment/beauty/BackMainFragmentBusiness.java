package com.android.camera.fragment.beauty;

import android.support.v4.app.Fragment;
import java.util.ArrayList;
import java.util.List;

public class BackMainFragmentBusiness extends AbBeautyFragmentBusiness {
    List<Fragment> mFragments;

    public List<Fragment> getCurrentShowFragmentList() {
        if (this.mFragments == null) {
            this.mFragments = new ArrayList();
        } else {
            this.mFragments.clear();
        }
        this.mFragments.add(new BackBeautyLevelFragment());
        this.mFragments.add(new BeautyBodyFragment());
        return this.mFragments;
    }
}
