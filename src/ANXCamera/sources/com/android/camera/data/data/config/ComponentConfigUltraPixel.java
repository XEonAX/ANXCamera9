package com.android.camera.data.data.config;

import android.content.res.Resources;
import android.support.annotation.DrawableRes;
import android.support.annotation.NonNull;
import com.android.camera.CameraAppImpl;
import com.android.camera.R;
import com.android.camera.data.data.ComponentData;
import com.android.camera.data.data.ComponentDataItem;
import com.android.camera.log.Log;
import com.android.camera2.CameraCapabilities;
import java.util.List;

public class ComponentConfigUltraPixel extends ComponentData {
    private static final String TAG = ComponentConfigUltraPixel.class.getSimpleName();
    private String mCloseTipString = null;
    @DrawableRes
    private int mMenuDrawable = -1;
    private String mMenuString = null;
    private String mOpenTipString = null;

    public ComponentConfigUltraPixel(DataItemConfig dataItemConfig) {
        super(dataItemConfig);
    }

    public int getDisplayTitleString() {
        return 0;
    }

    public String getKey(int i) {
        return null;
    }

    @NonNull
    public String getDefaultValue(int i) {
        return null;
    }

    public List<ComponentDataItem> getItems() {
        return null;
    }

    public void initUltraPixelResource(int i) {
        Resources resources = CameraAppImpl.getAndroidContext().getResources();
        if (i == CameraCapabilities.ULTRA_PIXEL_32M) {
            this.mMenuDrawable = R.drawable.ic_menu_ultra_pixel_photography_32mp;
            this.mOpenTipString = resources.getString(R.string.ultra_pixel_photography_32mp_open_tip);
            this.mCloseTipString = resources.getString(R.string.ultra_pixel_photography_32mp_close_tip);
            this.mMenuString = resources.getString(R.string.pref_menu_ultra_pixel_photography_32mp);
        } else if (i != CameraCapabilities.ULTRA_PIXEL_48M) {
            String str = TAG;
            StringBuilder stringBuilder = new StringBuilder();
            stringBuilder.append("Unknown ultra pixel size: ");
            stringBuilder.append(i);
            Log.d(str, stringBuilder.toString());
        } else {
            this.mMenuDrawable = R.drawable.ic_menu_ultra_pixel_photography_48mp;
            this.mOpenTipString = resources.getString(R.string.ultra_pixel_photography_48mp_open_tip);
            this.mCloseTipString = resources.getString(R.string.ultra_pixel_photography_48mp_close_tip);
            this.mMenuString = resources.getString(R.string.pref_menu_ultra_pixel_photography_48mp);
        }
    }

    public String getUltraPixelOpenTip() {
        return this.mOpenTipString;
    }

    public String getUltraPixelCloseTip() {
        return this.mCloseTipString;
    }

    @DrawableRes
    public int getMenuDrawable() {
        return this.mMenuDrawable;
    }

    public String getMenuString() {
        return this.mMenuString;
    }
}
