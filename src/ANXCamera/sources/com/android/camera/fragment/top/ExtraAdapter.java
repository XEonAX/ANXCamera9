package com.android.camera.fragment.top;

import android.support.v4.view.ViewCompat;
import android.support.v7.widget.RecyclerView.Adapter;
import android.view.LayoutInflater;
import android.view.View;
import android.view.View.OnClickListener;
import android.view.ViewGroup;
import android.widget.TextView;
import com.android.camera.CameraSettings;
import com.android.camera.R;
import com.android.camera.Util;
import com.android.camera.constant.ColorConstant;
import com.android.camera.data.DataRepository;
import com.android.camera.data.data.config.ComponentConfigBeauty;
import com.android.camera.data.data.config.DataItemConfig;
import com.android.camera.data.data.config.SupportedConfigs;
import com.android.camera.data.data.runing.ComponentRunningTiltValue;
import com.android.camera.data.data.runing.ComponentRunningTimer;
import com.android.camera.data.data.runing.DataItemRunning;
import com.android.camera.fragment.CommonRecyclerViewHolder;
import com.android.camera.module.ModuleManager;
import com.android.camera.ui.ColorImageView;

public class ExtraAdapter extends Adapter<CommonRecyclerViewHolder> {
    private DataItemConfig mDataItemConfig;
    private DataItemRunning mDataItemRunning;
    private int mDegree;
    private int mImageNormalColor;
    private OnClickListener mOnClickListener;
    private int mSelectedColor;
    private SupportedConfigs mSupportedConfigs;
    private int mTAG = -1;
    private int mTextNormalColor;

    public ExtraAdapter(SupportedConfigs supportedConfigs, OnClickListener onClickListener) {
        this.mSupportedConfigs = supportedConfigs;
        this.mOnClickListener = onClickListener;
        this.mDataItemRunning = DataRepository.dataItemRunning();
        this.mDataItemConfig = DataRepository.dataItemConfig();
        this.mTextNormalColor = ColorConstant.COLOR_COMMON_NORMAL;
        this.mImageNormalColor = -1315861;
        this.mSelectedColor = -15101209;
    }

    public void setNewDegree(int i) {
        this.mDegree = i;
    }

    public CommonRecyclerViewHolder onCreateViewHolder(ViewGroup viewGroup, int i) {
        View inflate = LayoutInflater.from(viewGroup.getContext()).inflate(R.layout.fragment_top_config_extra_item, viewGroup, false);
        if (this.mDegree != 0) {
            ViewCompat.setRotation(inflate, (float) this.mDegree);
        }
        return new CommonRecyclerViewHolder(inflate);
    }

    /* JADX WARNING: Missing block: B:28:0x013f, code:
            r1 = r3;
     */
    /* JADX WARNING: Missing block: B:30:0x0148, code:
            r1 = r0;
            r0 = r2;
            r2 = false;
     */
    /* Code decompiled incorrectly, please refer to instructions dump. */
    public void onBindViewHolder(final CommonRecyclerViewHolder commonRecyclerViewHolder, int i) {
        int i2;
        boolean isSwitchOn;
        i = this.mSupportedConfigs.getConfig(i);
        commonRecyclerViewHolder.itemView.setTag(Integer.valueOf(i));
        commonRecyclerViewHolder.itemView.setOnClickListener(this.mOnClickListener);
        int i3 = 0;
        if (i != 250) {
            int i4;
            int valueSelectedDrawable;
            switch (i) {
                case 225:
                    i2 = R.drawable.ic_config_extra_setting;
                    i4 = R.string.config_name_setting;
                    break;
                case 226:
                    ComponentRunningTimer componentRunningTimer = this.mDataItemRunning.getComponentRunningTimer();
                    isSwitchOn = componentRunningTimer.isSwitchOn();
                    valueSelectedDrawable = componentRunningTimer.getValueSelectedDrawable(160);
                    i2 = componentRunningTimer.getValueDisplayString(160);
                    break;
                default:
                    switch (i) {
                        case 228:
                            ComponentRunningTiltValue componentRunningTiltValue = this.mDataItemRunning.getComponentRunningTiltValue();
                            isSwitchOn = this.mDataItemRunning.isSwitchOn("pref_camera_tilt_shift_mode");
                            if (!isSwitchOn) {
                                i2 = R.string.config_name_tilt;
                                i3 = R.drawable.ic_config_tilt;
                                break;
                            }
                            valueSelectedDrawable = componentRunningTiltValue.getValueDisplayString(160);
                            i3 = componentRunningTiltValue.getValueSelectedDrawable(160);
                            i2 = valueSelectedDrawable;
                            break;
                        case 229:
                            i3 = R.drawable.ic_config_straighten;
                            i2 = R.string.config_name_straighten;
                            isSwitchOn = this.mDataItemRunning.isSwitchOn("pref_camera_gradienter_key");
                            break;
                        case 230:
                            i3 = R.drawable.ic_config_hht;
                            i2 = R.string.config_name_hht;
                            isSwitchOn = this.mDataItemRunning.isSwitchOn("pref_camera_hand_night_key");
                            break;
                        case 231:
                            i3 = R.drawable.ic_config_magic;
                            i2 = R.string.config_name_magic;
                            isSwitchOn = this.mDataItemRunning.isSwitchOn("pref_camera_ubifocus_key");
                            break;
                        case 232:
                            i3 = R.drawable.ic_config_slow_motion;
                            i2 = R.string.pref_video_speed_slow_title;
                            isSwitchOn = ModuleManager.isSlowMotionModule();
                            break;
                        case 233:
                            i3 = R.drawable.ic_config_fast_motion;
                            i2 = R.string.pref_video_speed_fast_title;
                            isSwitchOn = ModuleManager.isFastMotionModule();
                            break;
                        case 234:
                            i3 = R.drawable.ic_config_scene;
                            i2 = R.string.config_name_scene;
                            isSwitchOn = this.mDataItemRunning.isSwitchOn("pref_camera_scenemode_setting_key");
                            break;
                        case 235:
                            i3 = R.drawable.ic_config_group;
                            i2 = R.string.config_name_group;
                            isSwitchOn = this.mDataItemRunning.isSwitchOn("pref_camera_groupshot_mode_key");
                            break;
                        case 236:
                            i3 = R.drawable.ic_config_magic_mirror;
                            i2 = R.string.pref_camera_magic_mirror_title;
                            isSwitchOn = this.mDataItemRunning.isSwitchOn("pref_camera_magic_mirror_key");
                            break;
                        case 237:
                            i2 = R.drawable.ic_config_raw;
                            i4 = R.string.pref_camera_picture_format_entry_raw;
                            break;
                        case 238:
                            i3 = R.drawable.ic_config_gender_age;
                            i2 = R.string.pref_camera_show_gender_age_config_title;
                            isSwitchOn = this.mDataItemRunning.isSwitchOn("pref_camera_show_gender_age_key");
                            break;
                        case 239:
                            i2 = DataRepository.dataItemGlobal().getCurrentMode();
                            ComponentConfigBeauty componentConfigBeauty = this.mDataItemConfig.getComponentConfigBeauty();
                            isSwitchOn = componentConfigBeauty.isSwitchOn(i2);
                            valueSelectedDrawable = componentConfigBeauty.getValueSelectedDrawable(i2);
                            i2 = componentConfigBeauty.getValueDisplayString(i2);
                            break;
                        case 240:
                            i3 = R.drawable.ic_config_dual_watermark;
                            i2 = R.string.pref_camera_device_watermark_title;
                            isSwitchOn = CameraSettings.isDualCameraWaterMarkOpen();
                            break;
                        case 241:
                            i3 = R.drawable.ic_config_super_resolution;
                            i2 = R.string.config_name_super_resolution;
                            isSwitchOn = this.mDataItemRunning.isSwitchOn("pref_camera_super_resolution_key");
                            break;
                        case 242:
                            if (!Util.isGlobalVersion()) {
                                i2 = R.drawable.ic_config_ai_detect_unselected;
                                i4 = R.string.pref_ai_detect;
                                break;
                            }
                            i2 = R.drawable.ic_config_ai_glens;
                            i4 = R.string.pref_google_lens;
                            break;
                        default:
                            i2 = -1;
                            isSwitchOn = false;
                            break;
                    }
            }
        }
        i3 = R.drawable.ic_menu_ultra_pixel_photography_48mp;
        i2 = R.string.pref_menu_ultra_pixel_photography_48mp;
        isSwitchOn = this.mDataItemRunning.isSwitchOn("pref_menu_ultra_pixel_photography_48mp");
        TextView textView = (TextView) commonRecyclerViewHolder.getView(R.id.extra_item_text);
        ColorImageView colorImageView = (ColorImageView) commonRecyclerViewHolder.getView(R.id.extra_item_image);
        textView.setText(i2);
        i2 = isSwitchOn ? this.mSelectedColor : this.mTextNormalColor;
        int i5 = isSwitchOn ? this.mSelectedColor : this.mImageNormalColor;
        textView.setTextColor(i2);
        colorImageView.setColor(i5);
        colorImageView.setImageResource(i3);
        if ((Util.isAccessible() || Util.isSetContentDesc()) && this.mTAG == i) {
            CharSequence stringBuilder = new StringBuilder();
            stringBuilder.append(textView.getText());
            if (isSwitchOn) {
                stringBuilder.append(commonRecyclerViewHolder.itemView.getResources().getString(R.string.accessibility_open));
            } else {
                stringBuilder.append(commonRecyclerViewHolder.itemView.getResources().getString(R.string.accessibility_closed));
            }
            commonRecyclerViewHolder.itemView.setContentDescription(stringBuilder);
            commonRecyclerViewHolder.itemView.postDelayed(new Runnable() {
                public void run() {
                    commonRecyclerViewHolder.itemView.sendAccessibilityEvent(128);
                }
            }, 100);
        }
    }

    public int getItemCount() {
        return this.mSupportedConfigs.getLength();
    }

    public void setOnClictTag(int i) {
        this.mTAG = i;
    }
}
