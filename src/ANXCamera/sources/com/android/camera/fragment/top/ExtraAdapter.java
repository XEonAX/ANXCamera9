package com.android.camera.fragment.top;

import android.support.v4.view.ViewCompat;
import android.support.v7.widget.RecyclerView.Adapter;
import android.view.LayoutInflater;
import android.view.View;
import android.view.View.OnClickListener;
import android.view.ViewGroup;
import com.android.camera.CameraSettings;
import com.android.camera.Util;
import com.android.camera.constant.ColorConstant;
import com.android.camera.data.DataRepository;
import com.android.camera.data.data.config.ComponentConfigBeauty;
import com.android.camera.data.data.config.ComponentConfigUltraPixel;
import com.android.camera.data.data.config.DataItemConfig;
import com.android.camera.data.data.config.SupportedConfigs;
import com.android.camera.data.data.runing.ComponentRunningTiltValue;
import com.android.camera.data.data.runing.ComponentRunningTimer;
import com.android.camera.data.data.runing.DataItemRunning;
import com.android.camera.fragment.CommonRecyclerViewHolder;
import com.android.camera.module.ModuleManager;
import com.oneplus.camera.R;

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

    /* JADX WARNING: Missing block: B:32:0x018c, code:
            r1 = r0;
            r0 = r5;
     */
    /* JADX WARNING: Missing block: B:34:0x0196, code:
            r7 = r4;
            r4 = false;
            r0 = r1;
            r1 = r7;
     */
    /* JADX WARNING: Missing block: B:35:0x019a, code:
            r5 = (android.widget.TextView) r9.getView(com.oneplus.camera.R.id.extra_item_text);
            r6 = (com.android.camera.ui.ColorImageView) r9.getView(com.oneplus.camera.R.id.extra_item_image);
     */
    /* JADX WARNING: Missing block: B:36:0x01ac, code:
            if (r1 == -1) goto L_0x01b2;
     */
    /* JADX WARNING: Missing block: B:37:0x01ae, code:
            r5.setText(r1);
     */
    /* JADX WARNING: Missing block: B:38:0x01b2, code:
            r5.setText(r3);
     */
    /* JADX WARNING: Missing block: B:39:0x01b5, code:
            if (r4 == false) goto L_0x01ba;
     */
    /* JADX WARNING: Missing block: B:40:0x01b7, code:
            r1 = r8.mSelectedColor;
     */
    /* JADX WARNING: Missing block: B:41:0x01ba, code:
            r1 = r8.mTextNormalColor;
     */
    /* JADX WARNING: Missing block: B:42:0x01bc, code:
            if (r4 == false) goto L_0x01c1;
     */
    /* JADX WARNING: Missing block: B:43:0x01be, code:
            r2 = r8.mSelectedColor;
     */
    /* JADX WARNING: Missing block: B:44:0x01c1, code:
            r2 = r8.mImageNormalColor;
     */
    /* JADX WARNING: Missing block: B:45:0x01c3, code:
            r5.setTextColor(r1);
            r6.setColor(r2);
            r6.setImageResource(r0);
     */
    /* JADX WARNING: Missing block: B:46:0x01d0, code:
            if (com.android.camera.Util.isAccessible() != false) goto L_0x01d8;
     */
    /* JADX WARNING: Missing block: B:48:0x01d6, code:
            if (com.android.camera.Util.isSetContentDesc() == false) goto L_?;
     */
    /* JADX WARNING: Missing block: B:50:0x01da, code:
            if (r8.mTAG != r10) goto L_?;
     */
    /* JADX WARNING: Missing block: B:51:0x01dc, code:
            r10 = new java.lang.StringBuilder();
            r10.append(r5.getText());
     */
    /* JADX WARNING: Missing block: B:52:0x01e8, code:
            if (r4 == false) goto L_0x01fb;
     */
    /* JADX WARNING: Missing block: B:53:0x01ea, code:
            r10.append(r9.itemView.getResources().getString(com.oneplus.camera.R.string.accessibility_open));
     */
    /* JADX WARNING: Missing block: B:54:0x01fb, code:
            r10.append(r9.itemView.getResources().getString(com.oneplus.camera.R.string.accessibility_closed));
     */
    /* JADX WARNING: Missing block: B:55:0x020b, code:
            r9.itemView.setContentDescription(r10);
            r9.itemView.postDelayed(new com.android.camera.fragment.top.ExtraAdapter.AnonymousClass1(r8), 100);
     */
    /* JADX WARNING: Missing block: B:56:?, code:
            return;
     */
    /* JADX WARNING: Missing block: B:57:?, code:
            return;
     */
    /* JADX WARNING: Missing block: B:58:?, code:
            return;
     */
    /* Code decompiled incorrectly, please refer to instructions dump. */
    public void onBindViewHolder(final CommonRecyclerViewHolder commonRecyclerViewHolder, int i) {
        i = this.mSupportedConfigs.getConfig(i);
        commonRecyclerViewHolder.itemView.setTag(Integer.valueOf(i));
        commonRecyclerViewHolder.itemView.setOnClickListener(this.mOnClickListener);
        int i2 = 0;
        CharSequence charSequence = null;
        int i3;
        int i4;
        boolean isSwitchOn;
        int valueSelectedDrawable;
        switch (i) {
            case 225:
                i3 = R.drawable.ic_config_extra_setting;
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
                            i3 = R.string.config_name_tilt;
                            i2 = R.drawable.ic_config_tilt;
                            break;
                        }
                        valueSelectedDrawable = componentRunningTiltValue.getValueDisplayString(160);
                        i2 = componentRunningTiltValue.getValueSelectedDrawable(160);
                        i3 = valueSelectedDrawable;
                        break;
                    case 229:
                        i2 = R.drawable.ic_config_straighten;
                        i3 = R.string.config_name_straighten;
                        isSwitchOn = this.mDataItemRunning.isSwitchOn("pref_camera_gradienter_key");
                        break;
                    case 230:
                        i2 = R.drawable.ic_config_hht;
                        i3 = R.string.config_name_hht;
                        isSwitchOn = this.mDataItemRunning.isSwitchOn("pref_camera_hand_night_key");
                        break;
                    case 231:
                        i2 = R.drawable.ic_config_magic;
                        i3 = R.string.config_name_magic;
                        isSwitchOn = this.mDataItemRunning.isSwitchOn("pref_camera_ubifocus_key");
                        break;
                    case 232:
                        i2 = R.drawable.ic_config_slow_motion;
                        i3 = R.string.pref_video_speed_slow_title;
                        isSwitchOn = ModuleManager.isSlowMotionModule();
                        break;
                    case 233:
                        i2 = R.drawable.ic_config_fast_motion;
                        i3 = R.string.pref_video_speed_fast_title;
                        isSwitchOn = ModuleManager.isFastMotionModule();
                        break;
                    case 234:
                        i2 = R.drawable.ic_config_scene;
                        i3 = R.string.config_name_scene;
                        isSwitchOn = this.mDataItemRunning.isSwitchOn("pref_camera_scenemode_setting_key");
                        break;
                    case 235:
                        i2 = R.drawable.ic_config_group;
                        i3 = R.string.config_name_group;
                        isSwitchOn = this.mDataItemRunning.isSwitchOn("pref_camera_groupshot_mode_key");
                        break;
                    case 236:
                        i2 = R.drawable.ic_config_magic_mirror;
                        i3 = R.string.pref_camera_magic_mirror_title;
                        isSwitchOn = this.mDataItemRunning.isSwitchOn("pref_camera_magic_mirror_key");
                        break;
                    case 237:
                        i3 = R.drawable.ic_config_raw;
                        i4 = R.string.pref_camera_picture_format_entry_raw;
                        break;
                    case 238:
                        i2 = R.drawable.ic_config_gender_age;
                        i3 = R.string.pref_camera_show_gender_age_config_title;
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
                        i2 = R.drawable.ic_config_dual_watermark;
                        i3 = R.string.pref_camera_device_watermark_title;
                        isSwitchOn = CameraSettings.isDualCameraWaterMarkOpen();
                        break;
                    case 241:
                        i2 = R.drawable.ic_config_super_resolution;
                        i3 = R.string.config_name_super_resolution;
                        isSwitchOn = this.mDataItemRunning.isSwitchOn("pref_camera_super_resolution_key");
                        break;
                    case 242:
                        if (!Util.isGlobalVersion()) {
                            i3 = R.drawable.ic_config_ai_detect_unselected;
                            i4 = R.string.pref_ai_detect;
                            break;
                        }
                        i3 = R.drawable.ic_config_ai_glens;
                        i4 = R.string.pref_google_lens;
                        break;
                    default:
                        boolean isSwitchOn2;
                        ComponentConfigUltraPixel rearComponentConfigUltraPixel;
                        switch (i) {
                            case 250:
                                rearComponentConfigUltraPixel = DataRepository.dataItemConfig().getRearComponentConfigUltraPixel();
                                i3 = rearComponentConfigUltraPixel.getMenuDrawable();
                                charSequence = rearComponentConfigUltraPixel.getMenuString();
                                isSwitchOn2 = this.mDataItemRunning.isSwitchOn("pref_menu_ultra_pixel_photography_rear");
                                break;
                            case 251:
                                rearComponentConfigUltraPixel = DataRepository.dataItemConfig().getFrontComponentConfigUltraPixel();
                                i3 = rearComponentConfigUltraPixel.getMenuDrawable();
                                charSequence = rearComponentConfigUltraPixel.getMenuString();
                                isSwitchOn2 = this.mDataItemRunning.isSwitchOn("pref_menu_ultra_pixel_photography_front");
                                break;
                            case 252:
                                i2 = R.drawable.ic_config_hand_gesture;
                                i3 = R.string.hand_gesture_tip;
                                isSwitchOn = this.mDataItemRunning.isSwitchOn("pref_hand_gesture");
                                break;
                            default:
                                isSwitchOn = false;
                                break;
                        }
                        isSwitchOn = isSwitchOn2;
                        i2 = i3;
                        i3 = -1;
                        break;
                }
        }
    }

    public int getItemCount() {
        return this.mSupportedConfigs.getLength();
    }

    public void setOnClictTag(int i) {
        this.mTAG = i;
    }
}
