package com.android.camera.fragment.top;

import android.support.v4.view.ViewCompat;
import android.support.v7.widget.RecyclerView.Adapter;
import android.view.LayoutInflater;
import android.view.View;
import android.view.View.OnClickListener;
import android.view.ViewGroup;
import com.aeonax.camera.R;
import com.android.camera.CameraSettings;
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

    /* JADX WARNING: Missing block: B:25:0x013e, code:
            r1 = r2;
            r2 = r0;
            r0 = r3;
     */
    /* JADX WARNING: Missing block: B:27:0x0149, code:
            r6 = r1;
            r1 = false;
            r0 = r6;
     */
    /* JADX WARNING: Missing block: B:28:0x014c, code:
            r3 = (android.widget.TextView) r8.getView(com.aeonax.camera.R.id.extra_item_text);
            r4 = (com.android.camera.ui.ColorImageView) r8.getView(com.aeonax.camera.R.id.extra_item_image);
            r3.setText(r2);
     */
    /* JADX WARNING: Missing block: B:29:0x0161, code:
            if (r1 == false) goto L_0x0166;
     */
    /* JADX WARNING: Missing block: B:30:0x0163, code:
            r2 = r7.mSelectedColor;
     */
    /* JADX WARNING: Missing block: B:31:0x0166, code:
            r2 = r7.mTextNormalColor;
     */
    /* JADX WARNING: Missing block: B:32:0x0168, code:
            if (r1 == false) goto L_0x016d;
     */
    /* JADX WARNING: Missing block: B:33:0x016a, code:
            r5 = r7.mSelectedColor;
     */
    /* JADX WARNING: Missing block: B:34:0x016d, code:
            r5 = r7.mImageNormalColor;
     */
    /* JADX WARNING: Missing block: B:35:0x016f, code:
            r3.setTextColor(r2);
            r4.setColor(r5);
            r4.setImageResource(r0);
     */
    /* JADX WARNING: Missing block: B:36:0x017c, code:
            if (com.android.camera.Util.isAccessible() != false) goto L_0x0184;
     */
    /* JADX WARNING: Missing block: B:38:0x0182, code:
            if (com.android.camera.Util.isSetContentDesc() == false) goto L_?;
     */
    /* JADX WARNING: Missing block: B:40:0x0186, code:
            if (r7.mTAG != r9) goto L_?;
     */
    /* JADX WARNING: Missing block: B:41:0x0188, code:
            r9 = new java.lang.StringBuilder();
            r9.append(r3.getText());
     */
    /* JADX WARNING: Missing block: B:42:0x0194, code:
            if (r1 == false) goto L_0x01a7;
     */
    /* JADX WARNING: Missing block: B:43:0x0196, code:
            r9.append(r8.itemView.getResources().getString(com.aeonax.camera.R.string.accessibility_open));
     */
    /* JADX WARNING: Missing block: B:44:0x01a7, code:
            r9.append(r8.itemView.getResources().getString(com.aeonax.camera.R.string.accessibility_closed));
     */
    /* JADX WARNING: Missing block: B:45:0x01b7, code:
            r8.itemView.setContentDescription(r9);
            r8.itemView.postDelayed(new com.android.camera.fragment.top.ExtraAdapter.AnonymousClass1(r7), 100);
     */
    /* JADX WARNING: Missing block: B:46:?, code:
            return;
     */
    /* JADX WARNING: Missing block: B:47:?, code:
            return;
     */
    /* JADX WARNING: Missing block: B:48:?, code:
            return;
     */
    /* Code decompiled incorrectly, please refer to instructions dump. */
    public void onBindViewHolder(final CommonRecyclerViewHolder commonRecyclerViewHolder, int i) {
        i = this.mSupportedConfigs.getConfig(i);
        commonRecyclerViewHolder.itemView.setTag(Integer.valueOf(i));
        commonRecyclerViewHolder.itemView.setOnClickListener(this.mOnClickListener);
        int i2 = 0;
        int i3;
        int i4;
        boolean isSwitchOn;
        int valueSelectedDrawable;
        boolean z;
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
            case 228:
                ComponentRunningTiltValue componentRunningTiltValue = this.mDataItemRunning.getComponentRunningTiltValue();
                isSwitchOn = this.mDataItemRunning.isSwitchOn("pref_camera_tilt_shift_mode");
                if (!isSwitchOn) {
                    boolean z2 = isSwitchOn;
                    i4 = R.string.config_name_tilt;
                    i2 = R.drawable.ic_config_tilt;
                    z = z2;
                    break;
                }
                valueSelectedDrawable = componentRunningTiltValue.getValueDisplayString(160);
                i2 = componentRunningTiltValue.getValueSelectedDrawable(160);
                z = isSwitchOn;
                i4 = valueSelectedDrawable;
                break;
            case 229:
                i2 = R.drawable.ic_config_straighten;
                i4 = R.string.config_name_straighten;
                z = this.mDataItemRunning.isSwitchOn("pref_camera_gradienter_key");
                break;
            case 230:
                i2 = R.drawable.ic_config_hht;
                i4 = R.string.config_name_hht;
                z = this.mDataItemRunning.isSwitchOn("pref_camera_hand_night_key");
                break;
            case 231:
                i2 = R.drawable.ic_config_magic;
                i4 = R.string.config_name_magic;
                z = this.mDataItemRunning.isSwitchOn("pref_camera_ubifocus_key");
                break;
            case 232:
                i2 = R.drawable.ic_config_slow_motion;
                i4 = R.string.pref_video_speed_slow_title;
                z = ModuleManager.isSlowMotionModule();
                break;
            case 233:
                i2 = R.drawable.ic_config_fast_motion;
                i4 = R.string.pref_video_speed_fast_title;
                z = ModuleManager.isFastMotionModule();
                break;
            case 234:
                i2 = R.drawable.ic_config_scene;
                i4 = R.string.config_name_scene;
                z = this.mDataItemRunning.isSwitchOn("pref_camera_scenemode_setting_key");
                break;
            case 235:
                i2 = R.drawable.ic_config_group;
                i4 = R.string.config_name_group;
                z = this.mDataItemRunning.isSwitchOn("pref_camera_groupshot_mode_key");
                break;
            case 236:
                i2 = R.drawable.ic_config_magic_mirror;
                i4 = R.string.pref_camera_magic_mirror_title;
                z = this.mDataItemRunning.isSwitchOn("pref_camera_magic_mirror_key");
                break;
            case 237:
                i3 = R.drawable.ic_config_raw;
                i4 = R.string.pref_camera_picture_format_entry_raw;
                break;
            case 238:
                i2 = R.drawable.ic_config_gender_age;
                i4 = R.string.pref_camera_show_gender_age_config_title;
                z = this.mDataItemRunning.isSwitchOn("pref_camera_show_gender_age_key");
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
                i4 = R.string.pref_dualcamera_watermark_title;
                z = CameraSettings.isDualCameraWaterMarkOpen();
                break;
            case 241:
                i2 = R.drawable.ic_config_super_resolution;
                i4 = R.string.config_name_super_resolution;
                z = this.mDataItemRunning.isSwitchOn("pref_camera_super_resolution_key");
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
                i4 = -1;
                z = false;
                break;
        }
    }

    public int getItemCount() {
        return this.mSupportedConfigs.getLength();
    }

    public void setOnClictTag(int i) {
        this.mTAG = i;
    }
}
