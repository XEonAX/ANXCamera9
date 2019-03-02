package com.android.camera.data.data.config;

import android.support.annotation.NonNull;
import android.text.TextUtils;
import com.android.camera.data.DataRepository;
import com.android.camera.data.data.ComponentData;
import com.android.camera.data.data.ComponentDataItem;
import com.oneplus.camera.R;
import java.util.ArrayList;
import java.util.List;

public class ComponentConfigSlowMotion extends ComponentData {
    public static final String DATA_CONFIG_NEW_SLOW_MOTION_120 = "slow_motion_120";
    public static final String DATA_CONFIG_NEW_SLOW_MOTION_240 = "slow_motion_240";
    public static final String DATA_CONFIG_NEW_SLOW_MOTION_960 = "slow_motion_960";
    public static final String DATA_CONFIG_NEW_SLOW_MOTION_KEY = "key_new_slow_motion";
    private static final String[] SLOW_MOTION_MODE;

    static {
        if (DataRepository.dataItemFeature().fu()) {
            SLOW_MOTION_MODE = new String[]{DATA_CONFIG_NEW_SLOW_MOTION_960, DATA_CONFIG_NEW_SLOW_MOTION_120, DATA_CONFIG_NEW_SLOW_MOTION_240};
        } else {
            SLOW_MOTION_MODE = new String[]{DATA_CONFIG_NEW_SLOW_MOTION_120, DATA_CONFIG_NEW_SLOW_MOTION_240};
        }
    }

    public ComponentConfigSlowMotion(DataItemConfig dataItemConfig) {
        super(dataItemConfig);
    }

    public int getDisplayTitleString() {
        return 0;
    }

    public String getKey(int i) {
        return DATA_CONFIG_NEW_SLOW_MOTION_KEY;
    }

    @NonNull
    public String getDefaultValue(int i) {
        return SLOW_MOTION_MODE[0];
    }

    public List<ComponentDataItem> getItems() {
        return new ArrayList();
    }

    public void setVideoNewSlowMotionFPS(String str) {
        setComponentValue(172, str);
    }

    public boolean isSlowMotionFps120() {
        return DATA_CONFIG_NEW_SLOW_MOTION_120.equals(getComponentValue(172));
    }

    public boolean isSlowMotionFps960() {
        return DATA_CONFIG_NEW_SLOW_MOTION_960.equals(getComponentValue(172));
    }

    public String getNextValue(int i) {
        CharSequence componentValue = getComponentValue(i);
        int length = SLOW_MOTION_MODE.length;
        for (int i2 = 0; i2 < length; i2++) {
            if (TextUtils.equals(SLOW_MOTION_MODE[i2], componentValue)) {
                return SLOW_MOTION_MODE[(i2 + 1) % length];
            }
        }
        return getDefaultValue(i);
    }

    public int getImageResource() {
        String componentValue = getComponentValue(172);
        if (DATA_CONFIG_NEW_SLOW_MOTION_120.equals(componentValue)) {
            return R.drawable.ic_new_video_960fps_120;
        }
        if (DATA_CONFIG_NEW_SLOW_MOTION_240.equals(componentValue)) {
            return R.drawable.ic_new_video_960fps_240;
        }
        return R.drawable.ic_new_video_960fps_960;
    }

    public int getContentDesc() {
        String componentValue = getComponentValue(172);
        if (DATA_CONFIG_NEW_SLOW_MOTION_120.equals(componentValue)) {
            return R.string.accessibility_camera_video_960fps_120;
        }
        if (DATA_CONFIG_NEW_SLOW_MOTION_240.equals(componentValue)) {
            return R.string.accessibility_camera_video_960fps_240;
        }
        return R.string.accessibility_camera_video_960fps_960;
    }
}
