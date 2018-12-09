package com.android.camera.fragment.top;

import android.support.v4.view.ViewCompat;
import android.support.v7.widget.RecyclerView.Adapter;
import android.view.LayoutInflater;
import android.view.View;
import android.view.View.OnClickListener;
import android.view.ViewGroup;
import com.android.camera.R;
import com.android.camera.constant.ColorConstant;
import com.android.camera.data.DataRepository;
import com.android.camera.data.data.config.DataItemConfig;
import com.android.camera.data.data.config.SupportedConfigs;
import com.android.camera.data.data.runing.DataItemRunning;
import com.android.camera.fragment.CommonRecyclerViewHolder;

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
            r3 = (android.widget.TextView) r8.getView(com.android.camera.R.id.extra_item_text);
            r4 = (com.android.camera.ui.ColorImageView) r8.getView(com.android.camera.R.id.extra_item_image);
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
            r9.append(r8.itemView.getResources().getString(com.android.camera.R.string.accessibility_open));
     */
    /* JADX WARNING: Missing block: B:44:0x01a7, code:
            r9.append(r8.itemView.getResources().getString(com.android.camera.R.string.accessibility_closed));
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
    public void onBindViewHolder(final com.android.camera.fragment.CommonRecyclerViewHolder r8, int r9) {
        /*
        r7 = this;
        r0 = r7.mSupportedConfigs;
        r9 = r0.getConfig(r9);
        r0 = r8.itemView;
        r1 = java.lang.Integer.valueOf(r9);
        r0.setTag(r1);
        r0 = r8.itemView;
        r1 = r7.mOnClickListener;
        r0.setOnClickListener(r1);
        r0 = 0;
        r1 = 160; // 0xa0 float:2.24E-43 double:7.9E-322;
        switch(r9) {
            case 225: goto L_0x0142;
            case 226: goto L_0x0129;
            case 227: goto L_0x001f;
            case 228: goto L_0x0100;
            case 229: goto L_0x00f1;
            case 230: goto L_0x00e2;
            case 231: goto L_0x00d2;
            case 232: goto L_0x00c6;
            case 233: goto L_0x00ba;
            case 234: goto L_0x00aa;
            case 235: goto L_0x009a;
            case 236: goto L_0x008a;
            case 237: goto L_0x0082;
            case 238: goto L_0x0072;
            case 239: goto L_0x0056;
            case 240: goto L_0x004a;
            case 241: goto L_0x003a;
            case 242: goto L_0x0023;
            default: goto L_0x001f;
        };
    L_0x001f:
        r2 = -1;
        r1 = r0;
        goto L_0x014c;
        r1 = com.android.camera.Util.isGlobalVersion();
        if (r1 == 0) goto L_0x0032;
    L_0x002a:
        r1 = 2130837692; // 0x7f0200bc float:1.7280345E38 double:1.0527737005E-314;
        r2 = 2131427699; // 0x7f0b0173 float:1.8477022E38 double:1.0530652027E-314;
        goto L_0x0149;
    L_0x0032:
        r1 = 2130837691; // 0x7f0200bb float:1.7280343E38 double:1.0527737E-314;
        r2 = 2131427698; // 0x7f0b0172 float:1.847702E38 double:1.053065202E-314;
        goto L_0x0149;
    L_0x003a:
        r0 = 2130837708; // 0x7f0200cc float:1.7280378E38 double:1.0527737084E-314;
        r2 = 2131427785; // 0x7f0b01c9 float:1.8477196E38 double:1.053065245E-314;
        r1 = r7.mDataItemRunning;
        r3 = "pref_camera_super_resolution_key";
        r1 = r1.isSwitchOn(r3);
        goto L_0x014c;
    L_0x004a:
        r0 = 2130837696; // 0x7f0200c0 float:1.7280353E38 double:1.0527737025E-314;
        r2 = 2131427617; // 0x7f0b0121 float:1.8476855E38 double:1.053065162E-314;
        r1 = com.android.camera.CameraSettings.isDualCameraWaterMarkOpen();
        goto L_0x014c;
    L_0x0056:
        r0 = com.android.camera.data.DataRepository.dataItemGlobal();
        r0 = r0.getCurrentMode();
        r1 = r7.mDataItemConfig;
        r1 = r1.getComponentConfigBeauty();
        r2 = r1.isSwitchOn(r0);
        r3 = r1.getValueSelectedDrawable(r0);
        r0 = r1.getValueDisplayString(r0);
        goto L_0x013e;
    L_0x0072:
        r0 = 2130837699; // 0x7f0200c3 float:1.728036E38 double:1.052773704E-314;
        r2 = 2131427651; // 0x7f0b0143 float:1.8476924E38 double:1.053065179E-314;
        r1 = r7.mDataItemRunning;
        r3 = "pref_camera_show_gender_age_key";
        r1 = r1.isSwitchOn(r3);
        goto L_0x014c;
    L_0x0082:
        r1 = 2130837704; // 0x7f0200c8 float:1.728037E38 double:1.0527737064E-314;
        r2 = 2131427406; // 0x7f0b004e float:1.8476427E38 double:1.053065058E-314;
        goto L_0x0149;
    L_0x008a:
        r0 = 2130837703; // 0x7f0200c7 float:1.7280368E38 double:1.052773706E-314;
        r2 = 2131427720; // 0x7f0b0188 float:1.8477064E38 double:1.053065213E-314;
        r1 = r7.mDataItemRunning;
        r3 = "pref_camera_magic_mirror_key";
        r1 = r1.isSwitchOn(r3);
        goto L_0x014c;
    L_0x009a:
        r0 = 2130837700; // 0x7f0200c4 float:1.7280361E38 double:1.0527737044E-314;
        r2 = 2131427781; // 0x7f0b01c5 float:1.8477188E38 double:1.053065243E-314;
        r1 = r7.mDataItemRunning;
        r3 = "pref_camera_groupshot_mode_key";
        r1 = r1.isSwitchOn(r3);
        goto L_0x014c;
    L_0x00aa:
        r0 = 2130837705; // 0x7f0200c9 float:1.7280372E38 double:1.052773707E-314;
        r2 = 2131427783; // 0x7f0b01c7 float:1.8477192E38 double:1.053065244E-314;
        r1 = r7.mDataItemRunning;
        r3 = "pref_camera_scenemode_setting_key";
        r1 = r1.isSwitchOn(r3);
        goto L_0x014c;
    L_0x00ba:
        r0 = 2130837698; // 0x7f0200c2 float:1.7280357E38 double:1.0527737034E-314;
        r2 = 2131427665; // 0x7f0b0151 float:1.8476953E38 double:1.053065186E-314;
        r1 = com.android.camera.module.ModuleManager.isFastMotionModule();
        goto L_0x014c;
    L_0x00c6:
        r0 = 2130837706; // 0x7f0200ca float:1.7280374E38 double:1.0527737074E-314;
        r2 = 2131427666; // 0x7f0b0152 float:1.8476955E38 double:1.0530651864E-314;
        r1 = com.android.camera.module.ModuleManager.isSlowMotionModule();
        goto L_0x014c;
    L_0x00d2:
        r0 = 2130837702; // 0x7f0200c6 float:1.7280366E38 double:1.0527737054E-314;
        r2 = 2131427784; // 0x7f0b01c8 float:1.8477194E38 double:1.0530652447E-314;
        r1 = r7.mDataItemRunning;
        r3 = "pref_camera_ubifocus_key";
        r1 = r1.isSwitchOn(r3);
        goto L_0x014c;
    L_0x00e2:
        r0 = 2130837701; // 0x7f0200c5 float:1.7280364E38 double:1.052773705E-314;
        r2 = 2131427780; // 0x7f0b01c4 float:1.8477186E38 double:1.0530652427E-314;
        r1 = r7.mDataItemRunning;
        r3 = "pref_camera_hand_night_key";
        r1 = r1.isSwitchOn(r3);
        goto L_0x014c;
    L_0x00f1:
        r0 = 2130837707; // 0x7f0200cb float:1.7280376E38 double:1.052773708E-314;
        r2 = 2131427779; // 0x7f0b01c3 float:1.8477184E38 double:1.053065242E-314;
        r1 = r7.mDataItemRunning;
        r3 = "pref_camera_gradienter_key";
        r1 = r1.isSwitchOn(r3);
        goto L_0x014c;
    L_0x0100:
        r0 = r7.mDataItemRunning;
        r0 = r0.getComponentRunningTiltValue();
        r2 = r7.mDataItemRunning;
        r3 = "pref_camera_tilt_shift_mode";
        r2 = r2.isSwitchOn(r3);
        if (r2 == 0) goto L_0x011d;
        r3 = r0.getValueDisplayString(r1);
        r0 = r0.getValueSelectedDrawable(r1);
        r1 = r2;
        r2 = r3;
        goto L_0x014c;
    L_0x011d:
        r0 = 2131427782; // 0x7f0b01c6 float:1.847719E38 double:1.0530652437E-314;
        r1 = 2130837709; // 0x7f0200cd float:1.728038E38 double:1.052773709E-314;
        r6 = r2;
        r2 = r0;
        r0 = r1;
        r1 = r6;
        goto L_0x014c;
    L_0x0129:
        r0 = r7.mDataItemRunning;
        r0 = r0.getComponentRunningTimer();
        r2 = r0.isSwitchOn();
        r3 = r0.getValueSelectedDrawable(r1);
        r0 = r0.getValueDisplayString(r1);
    L_0x013e:
        r1 = r2;
        r2 = r0;
        r0 = r3;
        goto L_0x014c;
    L_0x0142:
        r1 = 2130837697; // 0x7f0200c1 float:1.7280355E38 double:1.052773703E-314;
        r2 = 2131427778; // 0x7f0b01c2 float:1.8477182E38 double:1.0530652417E-314;
    L_0x0149:
        r6 = r1;
        r1 = r0;
        r0 = r6;
    L_0x014c:
        r3 = 2131558516; // 0x7f0d0074 float:1.874235E38 double:1.053129835E-314;
        r3 = r8.getView(r3);
        r3 = (android.widget.TextView) r3;
        r4 = 2131558515; // 0x7f0d0073 float:1.8742348E38 double:1.0531298344E-314;
        r4 = r8.getView(r4);
        r4 = (com.android.camera.ui.ColorImageView) r4;
        r3.setText(r2);
        if (r1 == 0) goto L_0x0166;
    L_0x0163:
        r2 = r7.mSelectedColor;
        goto L_0x0168;
    L_0x0166:
        r2 = r7.mTextNormalColor;
    L_0x0168:
        if (r1 == 0) goto L_0x016d;
    L_0x016a:
        r5 = r7.mSelectedColor;
        goto L_0x016f;
    L_0x016d:
        r5 = r7.mImageNormalColor;
    L_0x016f:
        r3.setTextColor(r2);
        r4.setColor(r5);
        r4.setImageResource(r0);
        r0 = com.android.camera.Util.isAccessible();
        if (r0 != 0) goto L_0x0184;
    L_0x017e:
        r0 = com.android.camera.Util.isSetContentDesc();
        if (r0 == 0) goto L_0x01c8;
    L_0x0184:
        r0 = r7.mTAG;
        if (r0 != r9) goto L_0x01c8;
    L_0x0188:
        r9 = new java.lang.StringBuilder;
        r9.<init>();
        r0 = r3.getText();
        r9.append(r0);
        if (r1 == 0) goto L_0x01a7;
    L_0x0196:
        r0 = r8.itemView;
        r0 = r0.getResources();
        r1 = 2131427562; // 0x7f0b00ea float:1.8476744E38 double:1.053065135E-314;
        r0 = r0.getString(r1);
        r9.append(r0);
        goto L_0x01b7;
    L_0x01a7:
        r0 = r8.itemView;
        r0 = r0.getResources();
        r1 = 2131427563; // 0x7f0b00eb float:1.8476746E38 double:1.0530651355E-314;
        r0 = r0.getString(r1);
        r9.append(r0);
    L_0x01b7:
        r0 = r8.itemView;
        r0.setContentDescription(r9);
        r9 = r8.itemView;
        r0 = new com.android.camera.fragment.top.ExtraAdapter$1;
        r0.<init>(r8);
        r1 = 100;
        r9.postDelayed(r0, r1);
    L_0x01c8:
        return;
        */
        throw new UnsupportedOperationException("Method not decompiled: com.android.camera.fragment.top.ExtraAdapter.onBindViewHolder(com.android.camera.fragment.CommonRecyclerViewHolder, int):void");
    }

    public int getItemCount() {
        return this.mSupportedConfigs.getLength();
    }

    public void setOnClictTag(int i) {
        this.mTAG = i;
    }
}
