package com.android.camera.fragment;

import android.support.v4.view.ViewCompat;
import android.text.TextUtils;
import android.view.View;
import android.view.ViewGroup.MarginLayoutParams;
import android.widget.TextView;
import com.android.camera.R;
import com.android.camera.Util;
import com.android.camera.animation.type.AlphaInOnSubscribe;
import com.android.camera.animation.type.AlphaOutOnSubscribe;
import com.android.camera.data.DataRepository;
import com.android.camera.protocol.ModeProtocol.ModeCoordinator;
import com.android.camera.protocol.ModeProtocol.VerticalProtocol;
import io.reactivex.Completable;
import java.util.List;

public class FragmentVertical extends BaseFragment implements VerticalProtocol {
    private TextView mLeftAlertStatus;
    private TextView mLeftLightingPattern;
    private TextView mRightAlertStatus;
    private TextView mRightLightingPattern;
    private String mStateValueText = "";
    private View mVerticalViewMenu;
    private int oldDegree;
    private int stringLightingRes;

    protected void initView(View view) {
        this.mVerticalViewMenu = view.findViewById(R.id.vertical_view_menu);
        adjustViewHeight(this.mVerticalViewMenu);
        this.mLeftAlertStatus = (TextView) view.findViewById(R.id.alert_status_value_left);
        this.mLeftLightingPattern = (TextView) view.findViewById(R.id.lighting_pattern_left);
        this.mRightAlertStatus = (TextView) view.findViewById(R.id.alert_status_value_right);
        this.mRightLightingPattern = (TextView) view.findViewById(R.id.lighting_pattern_right);
        this.oldDegree = this.mDegree;
        ViewCompat.setRotation(this.mLeftAlertStatus, 90.0f);
        ViewCompat.setRotation(this.mLeftLightingPattern, 90.0f);
        ViewCompat.setRotation(this.mRightAlertStatus, 270.0f);
        ViewCompat.setRotation(this.mRightLightingPattern, 270.0f);
    }

    private void adjustViewHeight(View view) {
        ((MarginLayoutParams) view.getLayoutParams()).topMargin = (Util.sWindowHeight - ((int) (((float) getResources().getDisplayMetrics().widthPixels) / 0.75f))) - Util.getBottomHeight(getContext().getResources());
    }

    protected int getLayoutResourceId() {
        return R.layout.fragment_vertical;
    }

    public int getFragmentInto() {
        return BaseFragmentDelegate.FRAGMENT_VERTICAL;
    }

    protected void register(ModeCoordinator modeCoordinator) {
        super.register(modeCoordinator);
        modeCoordinator.attachProtocol(198, this);
    }

    protected void unRegister(ModeCoordinator modeCoordinator) {
        super.unRegister(modeCoordinator);
        modeCoordinator.detachProtocol(198, this);
    }

    public void provideAnimateElement(int i, List<Completable> list, boolean z) {
        super.provideAnimateElement(i, list, z);
        if (isAnyViewVisible()) {
            updateLightingRelativeView(z, false);
        }
    }

    public void provideRotateItem(List<View> list, int i) {
        super.provideRotateItem(list, i);
        if (this.mCurrentMode == 171) {
            updateLightingRelativeView(false, true);
        }
    }

    public void setLightingPattern(java.lang.String r2) {
        /*
        r1 = this;
        r0 = r2.hashCode();
        switch(r0) {
            case 48: goto L_0x004e;
            case 49: goto L_0x0044;
            case 50: goto L_0x003a;
            case 51: goto L_0x0030;
            case 52: goto L_0x0026;
            case 53: goto L_0x001c;
            case 54: goto L_0x0012;
            case 55: goto L_0x0008;
            default: goto L_0x0007;
        };
    L_0x0007:
        goto L_0x0058;
    L_0x0008:
        r0 = "7";
        r2 = r2.equals(r0);
        if (r2 == 0) goto L_0x0058;
    L_0x0010:
        r2 = 7;
        goto L_0x0059;
    L_0x0012:
        r0 = "6";
        r2 = r2.equals(r0);
        if (r2 == 0) goto L_0x0058;
    L_0x001a:
        r2 = 6;
        goto L_0x0059;
    L_0x001c:
        r0 = "5";
        r2 = r2.equals(r0);
        if (r2 == 0) goto L_0x0058;
    L_0x0024:
        r2 = 5;
        goto L_0x0059;
    L_0x0026:
        r0 = "4";
        r2 = r2.equals(r0);
        if (r2 == 0) goto L_0x0058;
    L_0x002e:
        r2 = 4;
        goto L_0x0059;
    L_0x0030:
        r0 = "3";
        r2 = r2.equals(r0);
        if (r2 == 0) goto L_0x0058;
    L_0x0038:
        r2 = 3;
        goto L_0x0059;
    L_0x003a:
        r0 = "2";
        r2 = r2.equals(r0);
        if (r2 == 0) goto L_0x0058;
    L_0x0042:
        r2 = 2;
        goto L_0x0059;
    L_0x0044:
        r0 = "1";
        r2 = r2.equals(r0);
        if (r2 == 0) goto L_0x0058;
    L_0x004c:
        r2 = 1;
        goto L_0x0059;
    L_0x004e:
        r0 = "0";
        r2 = r2.equals(r0);
        if (r2 == 0) goto L_0x0058;
    L_0x0056:
        r2 = 0;
        goto L_0x0059;
    L_0x0058:
        r2 = -1;
    L_0x0059:
        r0 = -2;
        switch(r2) {
            case 0: goto L_0x0088;
            case 1: goto L_0x0082;
            case 2: goto L_0x007c;
            case 3: goto L_0x0076;
            case 4: goto L_0x0070;
            case 5: goto L_0x006a;
            case 6: goto L_0x0064;
            case 7: goto L_0x005e;
            default: goto L_0x005d;
        };
    L_0x005d:
        goto L_0x008b;
    L_0x005e:
        r2 = 2131427843; // 0x7f0b0203 float:1.8477314E38 double:1.053065274E-314;
        r1.stringLightingRes = r2;
        goto L_0x008b;
    L_0x0064:
        r2 = 2131427844; // 0x7f0b0204 float:1.8477316E38 double:1.0530652743E-314;
        r1.stringLightingRes = r2;
        goto L_0x008b;
    L_0x006a:
        r2 = 2131427845; // 0x7f0b0205 float:1.8477318E38 double:1.053065275E-314;
        r1.stringLightingRes = r2;
        goto L_0x008b;
    L_0x0070:
        r2 = 2131427842; // 0x7f0b0202 float:1.8477312E38 double:1.0530652733E-314;
        r1.stringLightingRes = r2;
        goto L_0x008b;
    L_0x0076:
        r2 = 2131427841; // 0x7f0b0201 float:1.847731E38 double:1.053065273E-314;
        r1.stringLightingRes = r2;
        goto L_0x008b;
    L_0x007c:
        r2 = 2131427840; // 0x7f0b0200 float:1.8477308E38 double:1.0530652723E-314;
        r1.stringLightingRes = r2;
        goto L_0x008b;
    L_0x0082:
        r2 = 2131427839; // 0x7f0b01ff float:1.8477306E38 double:1.053065272E-314;
        r1.stringLightingRes = r2;
        goto L_0x008b;
    L_0x0088:
        r1.stringLightingRes = r0;
    L_0x008b:
        r2 = r1.stringLightingRes;
        if (r2 != r0) goto L_0x009a;
    L_0x008f:
        r2 = r1.mLeftLightingPattern;
        com.android.camera.animation.type.AlphaOutOnSubscribe.directSetResult(r2);
        r2 = r1.mRightLightingPattern;
        com.android.camera.animation.type.AlphaOutOnSubscribe.directSetResult(r2);
        goto L_0x00bf;
    L_0x009a:
        r2 = r1.mLeftLightingPattern;
        r0 = r1.stringLightingRes;
        r2.setText(r0);
        r2 = r1.mRightLightingPattern;
        r0 = r1.stringLightingRes;
        r2.setText(r0);
        r2 = r1.isLeftLandScape();
        if (r2 == 0) goto L_0x00b4;
    L_0x00ae:
        r2 = r1.mLeftLightingPattern;
        com.android.camera.animation.type.AlphaInOnSubscribe.directSetResult(r2);
        goto L_0x00bf;
    L_0x00b4:
        r2 = r1.isRightLandScape();
        if (r2 == 0) goto L_0x00bf;
    L_0x00ba:
        r2 = r1.mRightLightingPattern;
        com.android.camera.animation.type.AlphaInOnSubscribe.directSetResult(r2);
    L_0x00bf:
        return;
        */
        throw new UnsupportedOperationException("Method not decompiled: com.android.camera.fragment.FragmentVertical.setLightingPattern(java.lang.String):void");
    }

    public void alertLightingHint(int i) {
        switch (i) {
            case 3:
                i = R.string.lighting_hint_too_close;
                break;
            case 4:
                i = R.string.lighting_hint_too_far;
                break;
            case 5:
                i = R.string.lighting_hint_needed;
                break;
            default:
                i = -1;
                break;
        }
        if (i == -1) {
            this.mStateValueText = "";
            AlphaOutOnSubscribe.directSetResult(this.mRightAlertStatus);
            AlphaOutOnSubscribe.directSetResult(this.mLeftAlertStatus);
            return;
        }
        this.mStateValueText = getResources().getString(i);
        this.mRightAlertStatus.setText(this.mStateValueText);
        this.mLeftAlertStatus.setText(this.mStateValueText);
        if (isLeftLandScape()) {
            AlphaInOnSubscribe.directSetResult(this.mLeftAlertStatus);
        } else if (isRightLandScape()) {
            AlphaInOnSubscribe.directSetResult(this.mRightAlertStatus);
        }
    }

    private void updateLightingRelativeView(boolean z, boolean z2) {
        AlphaOutOnSubscribe.directSetResult(this.mRightAlertStatus);
        AlphaOutOnSubscribe.directSetResult(this.mRightLightingPattern);
        AlphaOutOnSubscribe.directSetResult(this.mLeftAlertStatus);
        AlphaOutOnSubscribe.directSetResult(this.mLeftLightingPattern);
        if (z) {
            this.stringLightingRes = -2;
            this.mStateValueText = "";
        } else if (!DataRepository.dataItemRunning().getComponentRunningLighting().getComponentValue(171).equals("0")) {
            if (isLandScape()) {
                if (isLeftLandScape()) {
                    if (!TextUtils.isEmpty(this.mStateValueText)) {
                        startAnimateViewVisible(this.mLeftAlertStatus, z2);
                    }
                    if (this.stringLightingRes > 0) {
                        startAnimateViewVisible(this.mLeftLightingPattern, z2);
                    }
                } else if (isRightLandScape()) {
                    if (!TextUtils.isEmpty(this.mStateValueText)) {
                        startAnimateViewVisible(this.mRightAlertStatus, z2);
                    }
                    if (this.stringLightingRes > 0) {
                        startAnimateViewVisible(this.mRightLightingPattern, z2);
                    }
                }
            } else if (this.oldDegree == 90) {
                starAnimatetViewGone(this.mRightAlertStatus, false);
                starAnimatetViewGone(this.mRightLightingPattern, false);
                starAnimatetViewGone(this.mLeftAlertStatus, z2);
                starAnimatetViewGone(this.mLeftLightingPattern, z2);
            } else if (this.oldDegree == 270) {
                starAnimatetViewGone(this.mLeftAlertStatus, false);
                starAnimatetViewGone(this.mLeftLightingPattern, false);
                starAnimatetViewGone(this.mRightAlertStatus, z2);
                starAnimatetViewGone(this.mRightLightingPattern, z2);
            }
            this.oldDegree = this.mDegree;
        }
    }

    public boolean isAnyViewVisible() {
        return this.mLeftAlertStatus.getVisibility() == 0 || this.mRightAlertStatus.getVisibility() == 0 || this.mLeftLightingPattern.getVisibility() == 0 || this.mRightLightingPattern.getVisibility() == 0;
    }
}
