package com.android.camera.fragment.top;

import android.animation.LayoutTransition;
import android.app.AlertDialog.Builder;
import android.content.DialogInterface;
import android.os.Bundle;
import android.support.annotation.Nullable;
import android.support.annotation.StringRes;
import android.support.v4.view.ViewCompat;
import android.text.TextUtils;
import android.view.View;
import android.view.View.MeasureSpec;
import android.view.View.OnClickListener;
import android.view.ViewGroup.MarginLayoutParams;
import android.view.animation.AlphaAnimation;
import android.view.animation.DecelerateInterpolator;
import android.widget.ImageView;
import android.widget.LinearLayout;
import android.widget.TextView;
import com.android.camera.CameraSettings;
import com.android.camera.R;
import com.android.camera.Util;
import com.android.camera.animation.type.AlphaInOnSubscribe;
import com.android.camera.animation.type.AlphaOutOnSubscribe;
import com.android.camera.animation.type.TranslateYOnSubscribe;
import com.android.camera.data.DataRepository;
import com.android.camera.effect.FilterInfo;
import com.android.camera.fragment.BaseFragment;
import com.android.camera.module.loader.camera2.Camera2DataContainer;
import com.android.camera.protocol.ModeCoordinatorImpl;
import com.android.camera.protocol.ModeProtocol.ConfigChanges;
import com.android.camera.protocol.ModeProtocol.DualController;
import com.android.camera.protocol.ModeProtocol.LiveConfigChanges;
import com.android.camera.protocol.ModeProtocol.ModeCoordinator;
import com.android.camera.protocol.ModeProtocol.TopAlert;
import com.android.camera.ui.ToggleSwitch;
import com.android.camera.ui.ToggleSwitch.OnCheckedChangeListener;
import com.mi.config.b;
import io.reactivex.Completable;
import java.util.List;
import java.util.Locale;
import miui.view.animation.CubicEaseOutInterpolator;
import miui.view.animation.SineEaseInOutInterpolator;

public class FragmentTopAlert extends BaseFragment {
    public static final int FRAGMENT_INFO = 253;
    public static final long HINT_DELAY_TIME = 2000;
    private static final String TAG = FragmentTopAlert.class.getSimpleName();
    private static int sPendingRecordingTimeState = 0;
    private ToggleSwitch mAiSceneSelectView;
    private TextView mAiSceneSwitchHintText;
    private TextView mAlertAiDetectHintTv;
    private Runnable mAlertAiDetectTipHitRunable = new Runnable() {
        public void run() {
            if (FragmentTopAlert.this.mAlertAiDetectHintTv.getVisibility() != 8) {
                FragmentTopAlert.this.mAlertAiDetectHintTv.setVisibility(8);
                if (!(FragmentTopAlert.this.mAlertImageView.getVisibility() == 0 || FragmentTopAlert.this.mAlertTopHintText.getVisibility() == 0)) {
                    FragmentTopAlert.this.transViewAnim(FragmentTopAlert.this.mAlertStatusValue, ((MarginLayoutParams) FragmentTopAlert.this.mAlertAiDetectHintTv.getLayoutParams()).topMargin);
                }
            }
        }
    };
    private long mAlertAiSceneSwitchHintTime;
    private int mAlertAiSceneSwitchHintTopMargin;
    private int mAlertImageType = -1;
    private ImageView mAlertImageView;
    private LinearLayout mAlertLiearLayout;
    private TextView mAlertRecordingText;
    private TextView mAlertStatusValue;
    private TextView mAlertTopHintText;
    private int mAlertTopMargin = 0;
    private AlphaAnimation mBlingAnimation;
    private int mDisplayRectTopMargin;
    private LayoutTransition mLayoutTransition;
    private TextView mLiveMusiHintText;
    private ImageView mLiveMusicClose;
    private LinearLayout mLiveMusicHintLayout;
    private int mSelectorTopMargin;
    private boolean mShow;
    private Runnable mShowAction = new Runnable() {
        public void run() {
            FragmentTopAlert.this.updateAiSceneSelectViewMargin();
            if (FragmentTopAlert.this.mAiSceneSelectView.getVisibility() == 8) {
                ViewCompat.setAlpha(FragmentTopAlert.this.mAiSceneSelectView, 0.0f);
                FragmentTopAlert.this.mAiSceneSelectView.setVisibility(0);
                FragmentTopAlert.this.transViewAnim(FragmentTopAlert.this.mAlertStatusValue, FragmentTopAlert.this.getViewBottom(FragmentTopAlert.this.mAiSceneSelectView));
                ViewCompat.animate(FragmentTopAlert.this.mAiSceneSelectView).setInterpolator(new CubicEaseOutInterpolator()).alpha(1.0f).setDuration(400).start();
            }
        }
    };
    private String mStateValueText = "";
    private boolean mStateValueTextFromLighting;
    private int mTopHintTextResource = 0;
    public final Runnable mViewHideRunnable = new Runnable() {
        public void run() {
            if (FragmentTopAlert.this.isAdded()) {
                FragmentTopAlert.this.updateAiSceneSelectViewMargin();
                if (FragmentTopAlert.this.mAiSceneSwitchHintText.getVisibility() != 8) {
                    FragmentTopAlert.this.mAiSceneSwitchHintText.setVisibility(8);
                    if (!(FragmentTopAlert.this.mAlertImageView.getVisibility() == 0 || FragmentTopAlert.this.mAlertTopHintText.getVisibility() == 0)) {
                        int access$500;
                        FragmentTopAlert.this.transViewAnim(FragmentTopAlert.this.mAiSceneSelectView, FragmentTopAlert.this.mAlertAiSceneSwitchHintTopMargin);
                        FragmentTopAlert fragmentTopAlert = FragmentTopAlert.this;
                        View access$400 = FragmentTopAlert.this.mAlertStatusValue;
                        if (FragmentTopAlert.this.mAiSceneSelectView.getVisibility() == 0) {
                            access$500 = FragmentTopAlert.this.getViewBottom(FragmentTopAlert.this.mAiSceneSelectView);
                        } else {
                            access$500 = FragmentTopAlert.this.getStateTextTopMargin(FragmentTopAlert.this.mAlertAiSceneSwitchHintTopMargin, FragmentTopAlert.this.mStateValueTextFromLighting);
                        }
                        fragmentTopAlert.transViewAnim(access$400, access$500);
                    }
                }
            }
        }
    };

    protected void initView(View view) {
        this.mAlertImageView = (ImageView) view.findViewById(R.id.alert_image);
        this.mAlertRecordingText = (TextView) view.findViewById(R.id.alert_recording_time_view);
        this.mAlertStatusValue = (TextView) view.findViewById(R.id.alert_status_value);
        this.mAiSceneSelectView = (ToggleSwitch) view.findViewById(R.id.alert_ai_scene_select);
        this.mAiSceneSwitchHintText = (TextView) view.findViewById(R.id.alert_ai_scene_hint);
        this.mAlertTopHintText = (TextView) view.findViewById(R.id.alert_top_hint);
        this.mAlertLiearLayout = (LinearLayout) view.findViewById(R.id.top_alert_container);
        this.mAlertAiDetectHintTv = (TextView) view.findViewById(R.id.alert_ai_detect_tip);
        this.mLiveMusiHintText = (TextView) view.findViewById(R.id.live_music_title_hint);
        this.mLiveMusicHintLayout = (LinearLayout) view.findViewById(R.id.live_music_hint_layout);
        this.mLiveMusicClose = (ImageView) this.mLiveMusicHintLayout.findViewById(R.id.live_music_close);
        this.mLiveMusicClose.setOnClickListener(new OnClickListener() {
            public void onClick(View view) {
                FragmentTopAlert.this.showCloseConfirm();
            }
        });
        if (Util.isNotchDevice) {
            setViewMargin(this.mAlertRecordingText, Util.sStatusBarHeight);
        }
        this.mLayoutTransition = customTransition();
        this.mAlertLiearLayout.setLayoutTransition(this.mLayoutTransition);
        ViewCompat.setAlpha(this.mAlertRecordingText, 0.0f);
        updateAlertStatusView(false);
        if (sPendingRecordingTimeState != 0) {
            setRecordingTimeState(sPendingRecordingTimeState);
            setPendingRecordingState(0);
        }
    }

    private void showCloseConfirm() {
        Builder builder = new Builder(getContext());
        builder.setMessage(R.string.live_music_close_message);
        builder.setCancelable(false);
        builder.setPositiveButton(R.string.live_music_close_sure_message, new DialogInterface.OnClickListener() {
            public void onClick(DialogInterface dialogInterface, int i) {
                FragmentTopAlert.this.mLiveMusicHintLayout.setVisibility(8);
                LiveConfigChanges liveConfigChanges = (LiveConfigChanges) ModeCoordinatorImpl.getInstance().getAttachProtocol(201);
                if (liveConfigChanges != null && !liveConfigChanges.isRecording() && !liveConfigChanges.isRecordingPaused()) {
                    liveConfigChanges.closeBGM();
                    ((TopAlert) ModeCoordinatorImpl.getInstance().getAttachProtocol(172)).updateConfigItem(245);
                }
            }
        });
        builder.setNegativeButton(R.string.live_music_close_cancel_message, new DialogInterface.OnClickListener() {
            public void onClick(DialogInterface dialogInterface, int i) {
            }
        });
        builder.show();
    }

    protected int getLayoutResourceId() {
        return R.layout.fragment_top_alert;
    }

    public int getFragmentInto() {
        return 253;
    }

    protected void register(ModeCoordinator modeCoordinator) {
        super.register(modeCoordinator);
    }

    protected void unRegister(ModeCoordinator modeCoordinator) {
        super.unRegister(modeCoordinator);
        if (this.mBlingAnimation != null) {
            this.mBlingAnimation.cancel();
            this.mBlingAnimation = null;
        }
    }

    public void onActivityCreated(@Nullable Bundle bundle) {
        super.onActivityCreated(bundle);
        TopAlert topAlert = (TopAlert) ModeCoordinatorImpl.getInstance().getAttachProtocol(172);
        if (topAlert != null) {
            topAlert.reInitAlert(false);
        }
    }

    public void setAlertTopMargin(int i) {
        this.mAlertTopMargin = i;
    }

    public void provideAnimateElement(int i, List<Completable> list, int i2) {
        super.provideAnimateElement(i, list, i2);
        this.mDisplayRectTopMargin = Util.getDisplayRect(getContext()).top;
        clear();
        setShow(true);
    }

    public static void setPendingRecordingState(int i) {
        sPendingRecordingTimeState = i;
    }

    public void setRecordingTimeState(int i) {
        switch (i) {
            case 1:
                i = this.mCurrentMode;
                if (i != 172) {
                    switch (i) {
                        case 161:
                            this.mAlertRecordingText.setText("00:15");
                            break;
                        case 162:
                            break;
                        default:
                            switch (i) {
                                case 168:
                                case 169:
                                case 170:
                                    break;
                            }
                            break;
                    }
                }
                this.mAlertRecordingText.setText("00:00");
                Completable.create(new AlphaInOnSubscribe(this.mAlertRecordingText)).subscribe();
                return;
            case 2:
                if (this.mBlingAnimation != null) {
                    this.mBlingAnimation.cancel();
                }
                Completable.create(new AlphaOutOnSubscribe(this.mAlertRecordingText)).subscribe();
                return;
            case 3:
                if (this.mBlingAnimation == null) {
                    this.mBlingAnimation = new AlphaAnimation(1.0f, 0.0f);
                    this.mBlingAnimation.setDuration(400);
                    this.mBlingAnimation.setStartOffset(100);
                    this.mBlingAnimation.setInterpolator(new DecelerateInterpolator());
                    this.mBlingAnimation.setRepeatMode(2);
                    this.mBlingAnimation.setRepeatCount(-1);
                }
                this.mAlertRecordingText.startAnimation(this.mBlingAnimation);
                return;
            case 4:
                this.mBlingAnimation.cancel();
                return;
            default:
                return;
        }
    }

    private LayoutTransition customTransition() {
        LayoutTransition layoutTransition = new LayoutTransition();
        layoutTransition.setInterpolator(2, new SineEaseInOutInterpolator());
        layoutTransition.setStartDelay(2, 0);
        layoutTransition.setDuration(2, 200);
        layoutTransition.setInterpolator(3, new SineEaseInOutInterpolator());
        layoutTransition.setStartDelay(3, 0);
        layoutTransition.setDuration(3, 200);
        layoutTransition.setInterpolator(4, new DecelerateInterpolator());
        layoutTransition.setStartDelay(4, 0);
        layoutTransition.setDuration(4, 200);
        layoutTransition.setInterpolator(0, new CubicEaseOutInterpolator());
        layoutTransition.setStartDelay(0, 0);
        layoutTransition.setDuration(0, 200);
        layoutTransition.setInterpolator(1, new CubicEaseOutInterpolator());
        layoutTransition.setStartDelay(1, 0);
        layoutTransition.setDuration(1, 200);
        layoutTransition.setAnimateParentHierarchy(true);
        return layoutTransition;
    }

    public void updateRecordingTime(String str) {
        this.mAlertRecordingText.setText(str);
    }

    public void alertHDR(int i, int i2, boolean z) {
        int i3 = 3;
        if (i == 0) {
            if (z) {
                i3 = 4;
            }
            if (this.mAlertImageType != i3) {
                this.mAlertImageType = i3;
                this.mAlertImageView.setImageResource(z ? R.drawable.ic_alert_hdr_live : R.drawable.ic_alert_hdr);
            } else {
                return;
            }
        } else if (this.mAlertImageType == 4 || this.mAlertImageType == 3) {
            this.mAlertImageType = -1;
        } else {
            return;
        }
        setAlertImageVisible(i, i2);
    }

    public void alertFlash(int i, int i2, boolean z) {
        int i3 = 1;
        if (i == 0) {
            if (z) {
                i3 = 2;
            }
            if (this.mAlertImageType != i3) {
                this.mAlertImageType = i3;
                if (CameraSettings.isFrontCamera() && b.hF()) {
                    z = false;
                }
                this.mAlertImageView.setImageResource(z ? R.drawable.ic_alert_flash_torch : R.drawable.ic_alert_flash);
            } else {
                return;
            }
        } else if (this.mAlertImageType == 2 || this.mAlertImageType == 1) {
            this.mAlertImageType = -1;
        } else {
            return;
        }
        setAlertImageVisible(i, i2);
        updateMusicHint();
    }

    public void alertMusicClose(boolean z) {
        if (this.mLiveMusicClose == null) {
            return;
        }
        if (z) {
            this.mLiveMusicClose.setAlpha(1.0f);
            this.mLiveMusicClose.setClickable(true);
            return;
        }
        this.mLiveMusicClose.setAlpha(0.4f);
        this.mLiveMusicClose.setClickable(false);
    }

    public void updateMusicHint() {
        String[] currentLiveMusic = CameraSettings.getCurrentLiveMusic();
        int dimensionPixelSize = getResources().getDimensionPixelSize(R.dimen.music_hint_top_margin);
        if (this.mLiveMusicHintLayout.getVisibility() == 0) {
            alertTopMusicHint(0, this.mLiveMusiHintText.getText().toString(), dimensionPixelSize);
        } else if (!currentLiveMusic[1].isEmpty() && this.mCurrentMode == 174) {
            alertTopMusicHint(0, currentLiveMusic[1], dimensionPixelSize);
        }
    }

    private void updateAiSceneSelectViewMargin() {
        if (this.mAlertImageView.getVisibility() == 0) {
            setViewMargin(this.mAiSceneSelectView, getAlertImageBottom());
        } else if (this.mAiSceneSwitchHintText.getVisibility() == 0) {
            setViewMargin(this.mAiSceneSelectView, getViewBottom(this.mAiSceneSwitchHintText));
        } else if (this.mAlertTopHintText.getVisibility() == 0) {
            setViewMargin(this.mAiSceneSelectView, getViewBottom(this.mAlertTopHintText));
        } else {
            setViewMargin(this.mAiSceneSelectView, this.mSelectorTopMargin);
        }
    }

    public void alertAiSceneSelector(int i, int i2) {
        alertAiSceneSelector(getResources().getString(R.string.text_ai_scene_selector_text_on), getResources().getString(R.string.text_ai_scene_selector_text_off), i, i2, i == 0 ? new OnCheckedChangeListener() {
            public void onCheckedChanged(ToggleSwitch toggleSwitch, boolean z) {
                ConfigChanges configChanges = (ConfigChanges) ModeCoordinatorImpl.getInstance().getAttachProtocol(164);
                if (z) {
                    if (configChanges != null) {
                        configChanges.onConfigChanged(248);
                    }
                } else if (configChanges != null) {
                    configChanges.onConfigChanged(249);
                }
            }
        } : null);
    }

    public void alertMoonSelector(String str, String str2, int i, int i2) {
        alertAiSceneSelector(str, str2, i, i2, i == 0 ? new OnCheckedChangeListener() {
            public void onCheckedChanged(ToggleSwitch toggleSwitch, boolean z) {
                ConfigChanges configChanges = (ConfigChanges) ModeCoordinatorImpl.getInstance().getAttachProtocol(164);
                if (z) {
                    if (configChanges != null) {
                        configChanges.onConfigChanged(246);
                    }
                } else if (configChanges != null) {
                    configChanges.onConfigChanged(247);
                }
            }
        } : null);
    }

    private void alertAiSceneSelector(String str, String str2, int i, int i2, OnCheckedChangeListener onCheckedChangeListener) {
        if (!(TextUtils.isEmpty(str) || TextUtils.isEmpty(str2))) {
            this.mAiSceneSelectView.setTextOnAndOff(str, str2);
        }
        if (i == 0) {
            this.mSelectorTopMargin = i2;
            long currentTimeMillis = HINT_DELAY_TIME - (System.currentTimeMillis() - this.mAlertAiSceneSwitchHintTime);
            if (CameraSettings.getShaderEffect() == FilterInfo.FILTER_ID_NONE) {
                ToggleSwitch toggleSwitch = this.mAiSceneSelectView;
                Runnable runnable = this.mShowAction;
                if (currentTimeMillis < 0) {
                    currentTimeMillis = 0;
                }
                toggleSwitch.postDelayed(runnable, currentTimeMillis);
            }
        } else {
            this.mAiSceneSelectView.removeCallbacks(this.mShowAction);
            if (this.mAiSceneSelectView.getVisibility() == 0) {
                ViewCompat.setAlpha(this.mAiSceneSelectView, 1.0f);
                ViewCompat.animate(this.mAiSceneSelectView).setInterpolator(new CubicEaseOutInterpolator()).alpha(0.0f).setDuration(400).start();
                this.mAiSceneSelectView.setVisibility(8);
                transViewAnim(this.mAlertStatusValue, getStateTextTopMargin(i2, this.mStateValueTextFromLighting));
            }
        }
        this.mAiSceneSelectView.setOnCheckedChangeListener(onCheckedChangeListener);
        this.mAiSceneSelectView.setChecked(false);
    }

    public void alertSwitchHint(int i, String str, int i2) {
        setViewMargin(this.mAiSceneSwitchHintText, i2);
        this.mAlertAiSceneSwitchHintTopMargin = i2;
        this.mAiSceneSwitchHintText.setTag(Integer.valueOf(i));
        this.mAiSceneSwitchHintText.setText(str);
        this.mAiSceneSwitchHintText.setContentDescription(str);
        this.mAiSceneSwitchHintText.setVisibility(0);
        if (!(this.mAlertImageView.getVisibility() == 0 || this.mAlertTopHintText.getVisibility() == 0)) {
            transViewAnim(this.mAlertStatusValue, getViewBottom(this.mAiSceneSwitchHintText));
        }
        this.mAlertAiSceneSwitchHintTime = System.currentTimeMillis();
        updateAiSceneSelectViewMargin();
        this.mAiSceneSwitchHintText.postDelayed(new Runnable() {
            public void run() {
                if (FragmentTopAlert.this.isAdded()) {
                    FragmentTopAlert.this.mAiSceneSwitchHintText.sendAccessibilityEvent(32768);
                }
            }
        }, 300);
        this.mAiSceneSwitchHintText.removeCallbacks(this.mViewHideRunnable);
        this.mAiSceneSwitchHintText.postDelayed(this.mViewHideRunnable, HINT_DELAY_TIME);
    }

    public void alertSwitchHint(int i, @StringRes int i2, int i3) {
        alertSwitchHint(i, getString(i2), i3);
    }

    public void alertUpdateValue(int i, int i2) {
        this.mStateValueText = "";
        DualController dualController = (DualController) ModeCoordinatorImpl.getInstance().getAttachProtocol(182);
        if (dualController == null || !dualController.isZoomVisible()) {
            String updateZoom = getUpdateZoom();
            if (updateZoom != null) {
                StringBuilder stringBuilder = new StringBuilder();
                stringBuilder.append(this.mStateValueText);
                stringBuilder.append(updateZoom);
                this.mStateValueText = stringBuilder.toString();
            }
            updateStateText(i2, false);
        }
    }

    public void alertTopMusicHint(int i, String str, int i2) {
        this.mLiveMusicHintLayout.setVisibility(i);
        setViewMargin(this.mLiveMusicHintLayout, getStateTextTopMargin(i2, false));
        if (i == 0) {
            this.mLiveMusiHintText.setText(str);
        }
    }

    private void updateTopHint(int i, String str, int i2) {
        if (i == 0) {
            this.mAlertTopHintText.setText(str);
            this.mAlertTopHintText.setContentDescription(str);
            if (this.mAlertImageView.getVisibility() != 0 && this.mAiSceneSwitchHintText.getVisibility() != 0) {
                transViewAnim(this.mAiSceneSelectView, getViewBottom(this.mAlertTopHintText));
                transViewAnim(this.mAlertStatusValue, getViewBottom(this.mAlertTopHintText));
                return;
            }
            return;
        }
        transViewAnim(this.mAiSceneSelectView, i2);
        transViewAnim(this.mAlertStatusValue, this.mAiSceneSelectView.getVisibility() == 0 ? getViewBottom(this.mAiSceneSelectView) : getStateTextTopMargin(i2, this.mStateValueTextFromLighting));
    }

    public void alertTopHint(int i, int i2, String str) {
        if (TextUtils.isEmpty(str) && i == 0) {
            i = 8;
        }
        this.mAlertTopHintText.setVisibility(i);
        setViewMargin(this.mAlertTopHintText, i2);
        updateTopHint(i, str, i2);
    }

    public void alertTopHint(int i, @StringRes int i2, int i3) {
        if (i2 > 0 && i == 0) {
            this.mTopHintTextResource = i2;
        } else if (i == 8) {
            this.mTopHintTextResource = 0;
        }
        String str = null;
        if (this.mTopHintTextResource == 0) {
            i = 8;
        } else {
            str = getString(i2);
        }
        this.mAlertTopHintText.setVisibility(i);
        setViewMargin(this.mAlertTopHintText, i3);
        updateTopHint(i, str, i3);
    }

    public void alertLightingTitle(boolean z, int i) {
        if (z) {
            setViewMargin(this.mAiSceneSwitchHintText, i);
            this.mAiSceneSwitchHintText.setText(R.string.lighting_hint_title);
            this.mAiSceneSwitchHintText.setVisibility(0);
            this.mAiSceneSwitchHintText.removeCallbacks(this.mViewHideRunnable);
            this.mAiSceneSwitchHintText.postDelayed(this.mViewHideRunnable, HINT_DELAY_TIME);
        } else if (this.mAiSceneSwitchHintText.getVisibility() != 8) {
            this.mAiSceneSwitchHintText.removeCallbacks(this.mViewHideRunnable);
            this.mAiSceneSwitchHintText.setVisibility(8);
        }
    }

    public void alertLightingHint(int i, int i2) {
        if (i != -1) {
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
            }
        }
        i = -1;
        if (i == -1) {
            this.mStateValueText = "";
        } else {
            this.mStateValueText = getResources().getString(i);
        }
        updateStateText(i2, true);
    }

    private int getStateTextTopMargin(int i, boolean z) {
        if (this.mAiSceneSelectView.getVisibility() == 0) {
            return getViewBottom(this.mAiSceneSelectView);
        }
        if (this.mAlertImageView.getVisibility() == 0) {
            return getAlertImageBottom();
        }
        if (this.mAiSceneSwitchHintText.getVisibility() == 0) {
            return getViewBottom(this.mAiSceneSwitchHintText);
        }
        if (this.mAlertTopHintText.getVisibility() == 0) {
            return getViewBottom(this.mAlertTopHintText);
        }
        if (this.mAlertAiDetectHintTv.getVisibility() == 0) {
            return getViewBottom(this.mAlertAiDetectHintTv);
        }
        int dimensionPixelSize = getResources().getDimensionPixelSize(R.dimen.top_alert_margin_top);
        return (Util.isLongRatioScreen && dimensionPixelSize > 0 && this.mDisplayRectTopMargin == 0 && this.mStateValueTextFromLighting) ? dimensionPixelSize : i;
    }

    private void updateStateText(int i, boolean z) {
        if (TextUtils.isEmpty(this.mStateValueText)) {
            this.mStateValueTextFromLighting = false;
            AlphaOutOnSubscribe.directSetResult(this.mAlertStatusValue);
            return;
        }
        this.mStateValueTextFromLighting = z;
        if (this.mAlertStatusValue.getVisibility() != 0) {
            setViewMargin(this.mAlertStatusValue, getStateTextTopMargin(i, z));
            if (!(z && isLandScape())) {
                AlphaInOnSubscribe.directSetResult(this.mAlertStatusValue);
            }
        }
        this.mAlertStatusValue.setText(this.mStateValueText);
    }

    public void setShow(boolean z) {
        this.mShow = z;
    }

    public boolean isShow() {
        return this.mShow;
    }

    public void clearAlertStatus() {
        this.mStateValueText = "";
        this.mStateValueTextFromLighting = false;
        if (this.mAlertStatusValue.getVisibility() != 8) {
            this.mAlertStatusValue.setVisibility(8);
        }
    }

    public void clear() {
        clearAlertStatus();
        this.mAlertImageType = -1;
        if (this.mAlertImageView.getVisibility() != 8) {
            this.mAlertImageView.setVisibility(8);
        }
        if (this.mAiSceneSelectView.getVisibility() != 8) {
            this.mAiSceneSelectView.setVisibility(8);
        }
        Object tag = this.mAiSceneSwitchHintText.getTag();
        if (!(this.mAiSceneSwitchHintText.getVisibility() == 8 || tag == null || !(tag instanceof Integer) || ((Integer) tag).intValue() == 2)) {
            this.mAiSceneSwitchHintText.setVisibility(8);
        }
        if (this.mAlertTopHintText.getVisibility() != 8) {
            this.mAlertTopHintText.setVisibility(8);
        }
        if (this.mLiveMusicHintLayout.getVisibility() != 8) {
            this.mLiveMusicHintLayout.setVisibility(8);
        }
        if (this.mAlertAiDetectHintTv != null && this.mAlertAiDetectHintTv.getVisibility() != 8) {
            this.mAlertAiDetectHintTv.setVisibility(8);
        }
    }

    private void setAlertImageVisible(int i, int i2) {
        if (i == 0) {
            setViewMargin(this.mAlertImageView, i2);
            this.mAlertImageView.setVisibility(0);
            if (this.mAiSceneSwitchHintText.getVisibility() != 0 && this.mAlertTopHintText.getVisibility() != 0) {
                transViewAnim(this.mAiSceneSelectView, getAlertImageBottom());
                transViewAnim(this.mAlertStatusValue, getAlertImageBottom());
                return;
            }
            return;
        }
        if (this.mAlertImageView.getVisibility() == 0) {
            this.mAlertImageView.setVisibility(8);
        }
        if (this.mAiSceneSwitchHintText.getVisibility() != 0 && this.mAlertTopHintText.getVisibility() != 0) {
            transViewAnim(this.mAiSceneSelectView, i2);
            transViewAnim(this.mAlertStatusValue, this.mAiSceneSelectView.getVisibility() == 0 ? getViewBottom(this.mAiSceneSelectView) : getStateTextTopMargin(i2, this.mStateValueTextFromLighting));
        }
    }

    private void transViewAnim(View view, int i) {
        if (view.getVisibility() == 0) {
            Completable.create(new TranslateYOnSubscribe(view, i - ((MarginLayoutParams) view.getLayoutParams()).topMargin).setDurationTime(100)).subscribe();
        }
    }

    private void setViewMargin(View view, int i) {
        MarginLayoutParams marginLayoutParams = (MarginLayoutParams) view.getLayoutParams();
        marginLayoutParams.topMargin = i;
        view.setLayoutParams(marginLayoutParams);
        ViewCompat.setTranslationY(view, 0.0f);
    }

    private int getAlertImageBottom() {
        if (this.mAlertImageView.getVisibility() != 0) {
            return 0;
        }
        int dimensionPixelSize = getResources().getDimensionPixelSize(R.dimen.top_alert_margin_top);
        int dimensionPixelSize2 = getResources().getDimensionPixelSize(R.dimen.top_alert_lower_margin_top);
        if (Util.isLongRatioScreen && dimensionPixelSize2 > 0 && this.mDisplayRectTopMargin > 0) {
            return dimensionPixelSize2;
        }
        if (Util.isLongRatioScreen && dimensionPixelSize > 0 && this.mDisplayRectTopMargin == 0 && this.mStateValueTextFromLighting) {
            return dimensionPixelSize;
        }
        return ((((MarginLayoutParams) this.mAlertImageView.getLayoutParams()).topMargin + this.mAlertImageView.getDrawable().getIntrinsicHeight()) + getResources().getDimensionPixelSize(R.dimen.panel_imageview_button_padding_width)) - getResources().getDimensionPixelSize(R.dimen.top_alert_correct_height);
    }

    private int getViewBottom(View view) {
        if (view.getVisibility() != 0) {
            return 0;
        }
        int dimensionPixelSize = getResources().getDimensionPixelSize(R.dimen.top_alert_margin_top);
        int dimensionPixelSize2 = getResources().getDimensionPixelSize(R.dimen.top_alert_lower_margin_top);
        if (Util.isLongRatioScreen && dimensionPixelSize2 > 0 && this.mDisplayRectTopMargin > 0) {
            return dimensionPixelSize2;
        }
        if (Util.isLongRatioScreen && dimensionPixelSize > 0 && this.mDisplayRectTopMargin == 0 && this.mStateValueTextFromLighting) {
            return dimensionPixelSize;
        }
        MarginLayoutParams marginLayoutParams = (MarginLayoutParams) view.getLayoutParams();
        dimensionPixelSize2 = view.getHeight();
        if (dimensionPixelSize2 == 0) {
            dimensionPixelSize2 = getChildMeasureHeight(view);
        }
        return ((marginLayoutParams.topMargin + dimensionPixelSize2) + getResources().getDimensionPixelSize(R.dimen.panel_imageview_button_padding_width)) - getResources().getDimensionPixelSize(R.dimen.top_alert_correct_height);
    }

    private int getChildMeasureHeight(View view) {
        int measuredHeight = view.getMeasuredHeight();
        if (measuredHeight > 0) {
            return measuredHeight;
        }
        measuredHeight = MeasureSpec.makeMeasureSpec(0, 0);
        view.measure(measuredHeight, measuredHeight);
        return view.getMeasuredHeight();
    }

    private String getUpdateEV() {
        float readExposure = ((float) CameraSettings.readExposure()) * Camera2DataContainer.getInstance().getCurrentCameraCapabilities().getExposureCompensationStep();
        if (Math.abs(readExposure) <= 0.05f || b.isSupportedPortrait()) {
            return null;
        }
        String str = readExposure < 0.0f ? "-" : "+";
        return String.format(Locale.ENGLISH, "%s %.1f", new Object[]{str, Float.valueOf(Math.abs(readExposure))});
    }

    private String getUpdateZoom() {
        float readZoom = CameraSettings.readZoom();
        if (readZoom == 1.0f) {
            return null;
        }
        int i = (int) readZoom;
        int i2 = (int) ((readZoom - ((float) i)) * 10.0f);
        StringBuilder stringBuilder = new StringBuilder();
        stringBuilder.append("x ");
        stringBuilder.append(i);
        stringBuilder.append(".");
        stringBuilder.append(i2);
        return stringBuilder.toString();
    }

    public void provideRotateItem(List<View> list, int i) {
        super.provideRotateItem(list, i);
        updateAlertStatusView(true);
    }

    private void updateAlertStatusView(boolean z) {
        if (!DataRepository.dataItemRunning().getComponentRunningLighting().getComponentValue(171).equals("0")) {
            if (isLandScape()) {
                starAnimatetViewGone(this.mAlertStatusValue, z);
            } else if (!TextUtils.isEmpty(this.mStateValueText)) {
                startAnimateViewVisible(this.mAlertStatusValue, z);
            }
        }
    }

    public void alertAiDetectTipHint(int i, @StringRes int i2, int i3, long j) {
        if (this.mAlertAiDetectHintTv.getVisibility() != i) {
            this.mAlertAiDetectHintTv.setVisibility(i);
            setViewMargin(this.mAlertAiDetectHintTv, i3);
            if (i == 0) {
                this.mAlertAiDetectHintTv.setText(i2);
                this.mAlertAiDetectHintTv.setContentDescription(getString(i2));
                if (!(this.mAlertImageView.getVisibility() == 0 || this.mAiSceneSwitchHintText.getVisibility() == 0)) {
                    transViewAnim(this.mAiSceneSelectView, getViewBottom(this.mAlertAiDetectHintTv));
                    transViewAnim(this.mAlertStatusValue, getViewBottom(this.mAlertAiDetectHintTv));
                }
                this.mAlertAiDetectHintTv.removeCallbacks(this.mAlertAiDetectTipHitRunable);
                if (j >= 0) {
                    this.mAlertAiDetectHintTv.postDelayed(this.mAlertAiDetectTipHitRunable, j);
                }
            } else {
                this.mAlertAiDetectHintTv.removeCallbacks(this.mAlertAiDetectTipHitRunable);
                transViewAnim(this.mAiSceneSelectView, i3);
                transViewAnim(this.mAlertStatusValue, this.mAiSceneSelectView.getVisibility() == 0 ? getViewBottom(this.mAiSceneSelectView) : getStateTextTopMargin(i3, this.mStateValueTextFromLighting));
            }
        }
    }
}
