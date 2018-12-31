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
import com.android.camera.constant.LightingConstant;
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

    /* Code decompiled incorrectly, please refer to instructions dump. */
    public void setLightingPattern(String str) {
        Object obj;
        switch (str.hashCode()) {
            case 48:
                if (str.equals("0")) {
                    obj = null;
                    break;
                }
            case 49:
                if (str.equals("1")) {
                    obj = 1;
                    break;
                }
            case 50:
                if (str.equals("2")) {
                    obj = 2;
                    break;
                }
            case 51:
                if (str.equals("3")) {
                    obj = 3;
                    break;
                }
            case 52:
                if (str.equals("4")) {
                    obj = 4;
                    break;
                }
            case 53:
                if (str.equals("5")) {
                    obj = 5;
                    break;
                }
            case 54:
                if (str.equals("6")) {
                    obj = 6;
                    break;
                }
            case 55:
                if (str.equals(LightingConstant.LIGHTING_LEAF)) {
                    obj = 7;
                    break;
                }
            default:
                obj = -1;
                break;
        }
        switch (obj) {
            case null:
                this.stringLightingRes = -2;
                break;
            case 1:
                this.stringLightingRes = R.string.lighting_pattern_nature;
                break;
            case 2:
                this.stringLightingRes = R.string.lighting_pattern_stage;
                break;
            case 3:
                this.stringLightingRes = R.string.lighting_pattern_movie;
                break;
            case 4:
                this.stringLightingRes = R.string.lighting_pattern_rainbow;
                break;
            case 5:
                this.stringLightingRes = R.string.lighting_pattern_shutter;
                break;
            case 6:
                this.stringLightingRes = R.string.lighting_pattern_dot;
                break;
            case 7:
                this.stringLightingRes = R.string.lighting_pattern_leaf;
                break;
        }
        if (this.stringLightingRes == -2) {
            AlphaOutOnSubscribe.directSetResult(this.mLeftLightingPattern);
            AlphaOutOnSubscribe.directSetResult(this.mRightLightingPattern);
            return;
        }
        this.mLeftLightingPattern.setText(this.stringLightingRes);
        this.mRightLightingPattern.setText(this.stringLightingRes);
        if (isLeftLandScape()) {
            AlphaInOnSubscribe.directSetResult(this.mLeftLightingPattern);
        } else if (isRightLandScape()) {
            AlphaInOnSubscribe.directSetResult(this.mRightLightingPattern);
        }
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
