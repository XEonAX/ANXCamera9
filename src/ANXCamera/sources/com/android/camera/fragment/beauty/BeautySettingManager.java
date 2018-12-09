package com.android.camera.fragment.beauty;

import android.util.SparseArray;
import com.android.camera.fragment.beauty.BeautyParameters.Type;
import java.util.ArrayList;
import java.util.List;

public class BeautySettingManager {
    private static List<Type> mBackSupportedBeautyType;
    private static List<Type> mFrontSupportedBeautyType;
    private static List<Type> mLegacySupportedBeautyType;
    private SparseArray<IBeautySettingBusiness> mBeautySettingBusinessArray = new SparseArray();
    private int mBeautyType = 2;
    private IBeautySettingBusiness mCurrentBeautySetting;

    public BeautySettingManager() {
        updateBeautySettingBusiness();
    }

    public void setBeautyType(int i) {
        this.mBeautyType = i;
        updateBeautySettingBusiness();
    }

    public int getBeautyType() {
        return this.mBeautyType;
    }

    private void updateBeautySettingBusiness() {
        this.mCurrentBeautySetting = (IBeautySettingBusiness) this.mBeautySettingBusinessArray.get(this.mBeautyType);
        if (this.mCurrentBeautySetting == null) {
            int i = this.mBeautyType;
            IBeautySettingBusiness beautyModeSettingBusiness;
            if (i != 5) {
                switch (i) {
                    case 2:
                        beautyModeSettingBusiness = new BeautyModeSettingBusiness();
                        this.mCurrentBeautySetting = beautyModeSettingBusiness;
                        this.mBeautySettingBusinessArray.put(this.mBeautyType, beautyModeSettingBusiness);
                        break;
                    case 3:
                        beautyModeSettingBusiness = new BeautyMakeupSettingBusiness();
                        this.mCurrentBeautySetting = beautyModeSettingBusiness;
                        this.mBeautySettingBusinessArray.put(this.mBeautyType, beautyModeSettingBusiness);
                        break;
                }
            }
            beautyModeSettingBusiness = new BeautyBodySettingBusiness();
            this.mCurrentBeautySetting = beautyModeSettingBusiness;
            this.mBeautySettingBusinessArray.put(this.mBeautyType, beautyModeSettingBusiness);
        }
    }

    public IBeautySettingBusiness getCurrentBeautySettingBusiness() {
        return this.mCurrentBeautySetting;
    }

    public static List<Type> getFrontSupportedBeautyTypes() {
        if (mFrontSupportedBeautyType != null && !mFrontSupportedBeautyType.isEmpty()) {
            return mFrontSupportedBeautyType;
        }
        if (mFrontSupportedBeautyType == null) {
            mFrontSupportedBeautyType = new ArrayList();
        }
        mFrontSupportedBeautyType.addAll(BeautyModeSettingBusiness.getSupportBeautyTypes());
        mFrontSupportedBeautyType.addAll(BeautyMakeupSettingBusiness.getSupportBeautyTypes());
        return mFrontSupportedBeautyType;
    }

    public static List<Type> getBackSupportedBeautyTypes() {
        if (mBackSupportedBeautyType != null && !mBackSupportedBeautyType.isEmpty()) {
            return mBackSupportedBeautyType;
        }
        if (mBackSupportedBeautyType == null) {
            mBackSupportedBeautyType = new ArrayList();
        }
        mBackSupportedBeautyType.addAll(BeautyBodySettingBusiness.getSupportBeautyTypes());
        return mBackSupportedBeautyType;
    }

    public static List<Type> getLegacySupportedBeautyTypes() {
        if (mLegacySupportedBeautyType != null && !mLegacySupportedBeautyType.isEmpty()) {
            return mLegacySupportedBeautyType;
        }
        if (mLegacySupportedBeautyType == null) {
            mLegacySupportedBeautyType = new ArrayList();
        }
        mLegacySupportedBeautyType.addAll(BeautyModeSettingBusiness.getSupportLegacyBeautyModeTypes());
        return mLegacySupportedBeautyType;
    }
}
