package com.android.camera.fragment.beauty;

import android.support.v4.app.Fragment;
import com.android.camera.CameraSettings;
import com.android.camera.data.DataRepository;
import com.mi.config.b;
import java.util.ArrayList;
import java.util.List;

public class FrontFragmentBusiness extends AbBeautyFragmentBusiness {
    List<Fragment> mFragments;

    public List<Fragment> getCurrentShowFragmentList() {
        if (this.mFragments == null) {
            this.mFragments = new ArrayList();
        } else {
            this.mFragments.clear();
        }
        if (b.hr()) {
            this.mFragments.add(new LegacyBeautyLevelFragment());
            this.mFragments.add(new LegacyMakeupParamsFragment());
        } else if (b.hC()) {
            this.mFragments.add(new FrontBeautyLevelFragment());
            if (BeautyParameters.getInstance().getAdjustableTypes() != null && BeautyParameters.getInstance().getAdjustableTypes().size() > 0) {
                this.mFragments.add(new RemodelingParamsFragment());
            }
        } else {
            this.mFragments.add(new FrontBeautyLevelFragment());
            this.mFragments.add(new MakeupParamsFragment());
        }
        if (DataRepository.dataItemFeature().fm() && CameraSettings.isSupportBeautyMakeup()) {
            this.mFragments.add(new MakeupBeautyFragment());
        }
        return this.mFragments;
    }
}
