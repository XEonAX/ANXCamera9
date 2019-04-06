package com.android.camera.data.data.config;

import android.content.res.Resources;
import android.support.annotation.DrawableRes;
import android.support.annotation.NonNull;
import com.android.camera.CameraAppImpl;
import com.android.camera.R;
import com.android.camera.data.DataRepository;
import com.android.camera.data.data.ComponentData;
import com.android.camera.data.data.ComponentDataItem;
import com.android.camera.data.data.runing.DataItemRunning;
import com.android.camera.log.Log;
import com.android.camera2.CameraCapabilities;
import java.util.ArrayList;
import java.util.List;

public class ComponentRunningUltraPixel extends ComponentData {
    private static final String TAG = ComponentRunningUltraPixel.class.getSimpleName();
    public static final String ULTRA_PIXEL_OFF = "OFF";
    public static final String ULTRA_PIXEL_ON_FRONT_32M = "FRONT_32M";
    public static final String ULTRA_PIXEL_ON_REAR_48M = "REAR_48M";
    private String mCloseTipString = null;
    private boolean mIsClosed;
    @DrawableRes
    private int mMenuDrawable = -1;
    private String mMenuString = null;
    private String mOpenTipString = null;

    public @interface UltraPixelSupport {
    }

    public ComponentRunningUltraPixel(DataItemRunning dataItemRunning) {
        super(dataItemRunning);
    }

    /* JADX WARNING: Removed duplicated region for block: B:12:0x002f  */
    /* JADX WARNING: Removed duplicated region for block: B:14:0x0067  */
    /* JADX WARNING: Removed duplicated region for block: B:13:0x0046  */
    /* JADX WARNING: Removed duplicated region for block: B:12:0x002f  */
    /* JADX WARNING: Removed duplicated region for block: B:14:0x0067  */
    /* JADX WARNING: Removed duplicated region for block: B:13:0x0046  */
    /* Code decompiled incorrectly, please refer to instructions dump. */
    private void initUltraPixelResource(@UltraPixelSupport String str) {
        Object obj;
        Resources resources = CameraAppImpl.getAndroidContext().getResources();
        int hashCode = str.hashCode();
        if (hashCode == -1379357032) {
            if (str.equals(ULTRA_PIXEL_ON_FRONT_32M)) {
                obj = null;
                switch (obj) {
                    case null:
                        break;
                    case 1:
                        break;
                    default:
                        break;
                }
            }
        } else if (hashCode == -70723282 && str.equals(ULTRA_PIXEL_ON_REAR_48M)) {
            obj = 1;
            switch (obj) {
                case null:
                    this.mMenuDrawable = R.drawable.ic_eye_light_star;
                    this.mOpenTipString = resources.getString(R.string.accessibility_video_module_picker);
                    this.mCloseTipString = resources.getString(R.string.accessibility_audio_shutter_bg);
                    this.mMenuString = resources.getString(R.string.accessibility_camera_module_picker);
                    return;
                case 1:
                    this.mMenuDrawable = R.drawable.ic_eye_light_window;
                    this.mOpenTipString = resources.getString(R.string.color_effect_live_solar);
                    this.mCloseTipString = resources.getString(R.string.color_effect_live_years);
                    this.mMenuString = resources.getString(R.string.live_music_close_cancel_message);
                    return;
                default:
                    String str2 = TAG;
                    StringBuilder stringBuilder = new StringBuilder();
                    stringBuilder.append("Unknown ultra pixel size: ");
                    stringBuilder.append(str);
                    Log.d(str2, stringBuilder.toString());
                    return;
            }
        }
        obj = -1;
        switch (obj) {
            case null:
                break;
            case 1:
                break;
            default:
                break;
        }
    }

    @UltraPixelSupport
    public String getCurrentSupportUltraPixel() {
        return ((ComponentDataItem) this.mItems.get(1)).mValue;
    }

    @NonNull
    public String getDefaultValue(int i) {
        return "OFF";
    }

    public int getDisplayTitleString() {
        return 0;
    }

    public List<ComponentDataItem> getItems() {
        return this.mItems;
    }

    public String getKey(int i) {
        return "pref_ultra_pixel";
    }

    @DrawableRes
    public int getMenuDrawable() {
        return this.mMenuDrawable;
    }

    public String getMenuString() {
        return this.mMenuString;
    }

    public String getUltraPixelCloseTip() {
        return this.mCloseTipString;
    }

    public String getUltraPixelOpenTip() {
        return this.mOpenTipString;
    }

    public boolean isClosed() {
        return this.mIsClosed;
    }

    public boolean isFront32MPSwitchOn() {
        return ULTRA_PIXEL_ON_FRONT_32M.equals(getComponentValue(160));
    }

    public boolean isRear48MPSwitchOn() {
        return ULTRA_PIXEL_ON_REAR_48M.equals(getComponentValue(160));
    }

    public boolean isSwitchOn() {
        return isClosed() ? false : "OFF".equals(getComponentValue(160)) ^ 1;
    }

    public void reInit(int i, int i2, CameraCapabilities cameraCapabilities) {
        if (this.mItems == null) {
            this.mItems = new ArrayList();
        } else {
            this.mItems.clear();
        }
        if (cameraCapabilities != null) {
            if (i == 163 || i == 165) {
                if (i2 == 0 && !DataRepository.dataItemFeature().hr()) {
                    i = DataRepository.dataItemFeature().gS();
                    if (i > 0 && i == CameraCapabilities.ULTRA_PIXEL_48M) {
                        this.mItems.add(new ComponentDataItem(R.drawable.ic_eye_light_window, R.drawable.ic_eye_light_window, R.string.live_music_close_cancel_message, "OFF"));
                        this.mItems.add(new ComponentDataItem(R.drawable.ic_eye_light_window, R.drawable.ic_eye_light_window, R.string.live_music_close_cancel_message, ULTRA_PIXEL_ON_REAR_48M));
                        initUltraPixelResource(ULTRA_PIXEL_ON_REAR_48M);
                    }
                } else if (i2 == 1) {
                    i = DataRepository.dataItemFeature().gT();
                    if (i > 0 && cameraCapabilities.isUltraPixelPhotographySupported(i) && i == CameraCapabilities.ULTRA_PIXEL_32M) {
                        this.mItems.add(new ComponentDataItem(R.drawable.ic_eye_light_star, R.drawable.ic_eye_light_star, R.string.accessibility_camera_module_picker, "OFF"));
                        this.mItems.add(new ComponentDataItem(R.drawable.ic_eye_light_star, R.drawable.ic_eye_light_star, R.string.accessibility_camera_module_picker, ULTRA_PIXEL_ON_FRONT_32M));
                        initUltraPixelResource(ULTRA_PIXEL_ON_FRONT_32M);
                    }
                }
            } else if (i != 167) {
                if (i == 175 && i2 == 0) {
                    i = DataRepository.dataItemFeature().gS();
                    if (i > 0 && i == CameraCapabilities.ULTRA_PIXEL_48M) {
                        this.mItems.add(new ComponentDataItem(R.drawable.ic_eye_light_window, R.drawable.ic_eye_light_window, R.string.live_music_close_cancel_message, "OFF"));
                        this.mItems.add(new ComponentDataItem(R.drawable.ic_eye_light_window, R.drawable.ic_eye_light_window, R.string.live_music_close_cancel_message, ULTRA_PIXEL_ON_REAR_48M));
                        initUltraPixelResource(ULTRA_PIXEL_ON_REAR_48M);
                    }
                }
            } else if (i2 == 0) {
                i = DataRepository.dataItemFeature().gS();
                if (i > 0 && cameraCapabilities.isUltraPixelPhotographySupported(i)) {
                    this.mItems.add(new ComponentDataItem(R.drawable.ic_motionphoto, R.drawable.ic_motionphoto_highlight, R.string.live_music_close_cancel_message, "OFF"));
                    this.mItems.add(new ComponentDataItem(R.drawable.ic_motionphoto, R.drawable.ic_motionphoto_highlight, R.string.live_music_close_cancel_message, ULTRA_PIXEL_ON_REAR_48M));
                    initUltraPixelResource(ULTRA_PIXEL_ON_REAR_48M);
                }
            }
        }
    }

    public void setClosed(boolean z) {
        this.mIsClosed = z;
    }

    public void switchOff() {
        setComponentValue(160, "OFF");
    }

    public void switchOn(@UltraPixelSupport String str) {
        setClosed(false);
        setComponentValue(160, str);
    }

    public void switchOnCurrentSupported(int i, int i2, CameraCapabilities cameraCapabilities) {
        if (isEmpty()) {
            reInit(i, i2, cameraCapabilities);
        }
        if (isEmpty()) {
            Log.e("UltraPixel:", "CameraCapabilities not supported");
        } else {
            setComponentValue(160, getCurrentSupportUltraPixel());
        }
    }
}
