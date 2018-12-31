package com.android.camera.fragment.top;

import android.os.Bundle;
import android.support.v7.widget.GridLayoutManager;
import android.support.v7.widget.RecyclerView;
import android.text.TextUtils;
import android.view.View;
import android.view.View.OnClickListener;
import android.view.ViewGroup.MarginLayoutParams;
import android.view.animation.AlphaAnimation;
import android.view.animation.Animation;
import android.view.animation.Animation.AnimationListener;
import android.view.animation.AnimationSet;
import android.view.animation.ScaleAnimation;
import android.view.animation.TranslateAnimation;
import com.android.camera.CameraSettings;
import com.android.camera.R;
import com.android.camera.Util;
import com.android.camera.data.DataRepository;
import com.android.camera.data.data.config.ComponentConfigBeauty;
import com.android.camera.data.data.config.DataItemConfig;
import com.android.camera.data.data.config.SupportedConfigFactory;
import com.android.camera.data.data.config.SupportedConfigs;
import com.android.camera.data.data.runing.ComponentRunningTiltValue;
import com.android.camera.data.data.runing.ComponentRunningTimer;
import com.android.camera.data.data.runing.DataItemRunning;
import com.android.camera.fragment.BaseFragment;
import com.android.camera.fragment.FragmentUtils;
import com.android.camera.module.loader.camera2.Camera2DataContainer;
import com.android.camera.protocol.ModeCoordinatorImpl;
import com.android.camera.protocol.ModeProtocol.ConfigChanges;
import com.android.camera.protocol.ModeProtocol.TopAlert;
import com.android.camera.protocol.ModeProtocol.TopConfigProtocol;
import com.android.camera.statistic.CameraStat;
import com.android.camera.ui.drawable.PanoramaArrowAnimateDrawable;
import io.reactivex.Completable;
import java.util.List;
import miui.view.animation.CubicEaseOutInterpolator;
import miui.view.animation.QuarticEaseInOutInterpolator;
import miui.view.animation.QuarticEaseOutInterpolator;
import miui.view.animation.SineEaseInInterpolator;

public class FragmentTopConfigExtra extends BaseFragment implements OnClickListener {
    public static final int FRAGMENT_INFO = 245;
    private View mBackgroundView;
    private int mDisplayRectTopMargin;
    private ExtraAdapter mExtraAdapter;
    private RecyclerView mRecyclerView;

    protected void initView(View view) {
        this.mBackgroundView = view.findViewById(R.id.top_config_extra_background);
        this.mRecyclerView = (RecyclerView) view.findViewById(R.id.top_config_extra_recyclerview);
        this.mDisplayRectTopMargin = Util.getDisplayRect(getContext()).top;
        int currentCameraId = DataRepository.dataItemGlobal().getCurrentCameraId();
        SupportedConfigs supportedExtraConfigs = SupportedConfigFactory.getSupportedExtraConfigs(this.mCurrentMode, currentCameraId, DataRepository.dataCloudMgr().DataCloudFeature(), Camera2DataContainer.getInstance().getCapabilitiesByBogusCameraId(currentCameraId, this.mCurrentMode), DataRepository.dataItemGlobal().isNormalIntent());
        int i = 4;
        if (supportedExtraConfigs.getLength() <= 4) {
            i = supportedExtraConfigs.getLength();
        }
        int max = Math.max(1, i);
        ((MarginLayoutParams) this.mRecyclerView.getLayoutParams()).height = getResources().getDimensionPixelSize(R.dimen.config_item_height) * ((int) Math.ceil((double) (((float) supportedExtraConfigs.getLength()) / ((float) max))));
        if (Util.isLongRatioScreen) {
            adjustViewBackground(this.mCurrentMode);
            this.mBackgroundView.setPadding(0, this.mDisplayRectTopMargin, 0, 0);
        }
        this.mRecyclerView.setLayoutManager(new GridLayoutManager(getContext(), max));
        this.mExtraAdapter = new ExtraAdapter(supportedExtraConfigs, this);
        this.mExtraAdapter.setNewDegree(this.mDegree);
        this.mRecyclerView.setAdapter(this.mExtraAdapter);
        this.mRecyclerView.setFocusable(false);
    }

    protected int getLayoutResourceId() {
        return R.layout.fragment_top_config_extra;
    }

    public int getFragmentInto() {
        return 245;
    }

    private void adjustViewBackground(int i) {
        if (DataRepository.dataItemRunning().getUiStyle() != 3) {
            this.mBackgroundView.setBackgroundColor(-16777216);
        } else {
            this.mBackgroundView.setBackgroundColor(R.color.halfscreen_background);
        }
    }

    public void provideAnimateElement(int i, List<Completable> list, boolean z) {
        super.provideAnimateElement(i, list, z);
    }

    public void onClick(View view) {
        if (isEnableClick()) {
            ConfigChanges configChanges = (ConfigChanges) ModeCoordinatorImpl.getInstance().getAttachProtocol(164);
            if (configChanges != null) {
                int intValue = ((Integer) view.getTag()).intValue();
                configChanges.onConfigChanged(intValue);
                TopAlert topAlert = (TopAlert) ModeCoordinatorImpl.getInstance().getAttachProtocol(172);
                if (Util.isAccessible()) {
                    this.mExtraAdapter.setOnClictTag(intValue);
                }
                if (intValue == 225) {
                    topAlert.removeExtraMenu(5);
                } else if (intValue != 242) {
                    this.mRecyclerView.getAdapter().notifyDataSetChanged();
                } else {
                    topAlert.hideExtraMenu();
                    ((TopConfigProtocol) ModeCoordinatorImpl.getInstance().getAttachProtocol(193)).startAiLens();
                    CameraStat.recordCountEvent(CameraStat.CATEGORY_COUNTER, CameraStat.KEY_AI_DETECT_CHANGED);
                }
            }
        }
    }

    public void reFresh() {
        this.mRecyclerView.getAdapter().notifyDataSetChanged();
    }

    public void onViewCreated(View view, Bundle bundle) {
        super.onViewCreated(view, bundle);
        animateIn();
    }

    protected Animation provideEnterAnimation(int i) {
        return null;
    }

    public void animateIn() {
        Animation scaleAnimation;
        if (Util.isLongRatioScreen) {
            scaleAnimation = new ScaleAnimation(1.0f, 1.0f, PanoramaArrowAnimateDrawable.LEFT_ARROW_RATIO, 1.0f);
            scaleAnimation.setInterpolator(new QuarticEaseInOutInterpolator());
            scaleAnimation.setDuration(320);
            this.mBackgroundView.startAnimation(scaleAnimation);
            scaleAnimation = new AlphaAnimation(PanoramaArrowAnimateDrawable.LEFT_ARROW_RATIO, 1.0f);
            scaleAnimation.setInterpolator(new QuarticEaseOutInterpolator());
            scaleAnimation.setStartOffset(120);
            scaleAnimation.setDuration(280);
            this.mRecyclerView.startAnimation(scaleAnimation);
            return;
        }
        scaleAnimation = new AnimationSet(true);
        Animation alphaAnimation = new AlphaAnimation(PanoramaArrowAnimateDrawable.LEFT_ARROW_RATIO, 1.0f);
        Animation translateAnimation = new TranslateAnimation(1, PanoramaArrowAnimateDrawable.LEFT_ARROW_RATIO, 1, PanoramaArrowAnimateDrawable.LEFT_ARROW_RATIO, 1, -0.1f, 1, PanoramaArrowAnimateDrawable.LEFT_ARROW_RATIO);
        scaleAnimation.addAnimation(alphaAnimation);
        scaleAnimation.addAnimation(translateAnimation);
        scaleAnimation.setInterpolator(new CubicEaseOutInterpolator());
        scaleAnimation.setDuration(350);
        getView().startAnimation(scaleAnimation);
    }

    protected Animation provideExitAnimation() {
        return null;
    }

    public void animateOut() {
        AnimationListener anonymousClass1 = new AnimationListener() {
            public void onAnimationStart(Animation animation) {
                FragmentTopConfigExtra.this.setClickEnable(false);
            }

            public void onAnimationEnd(Animation animation) {
                FragmentUtils.removeFragmentByTag(FragmentTopConfigExtra.this.getFragmentManager(), FragmentTopConfigExtra.this.getFragmentTag());
            }

            public void onAnimationRepeat(Animation animation) {
            }
        };
        Animation scaleAnimation;
        if (Util.isLongRatioScreen) {
            scaleAnimation = new ScaleAnimation(1.0f, 1.0f, 1.0f, PanoramaArrowAnimateDrawable.LEFT_ARROW_RATIO);
            scaleAnimation.setInterpolator(new QuarticEaseInOutInterpolator());
            scaleAnimation.setDuration(320);
            scaleAnimation.setAnimationListener(anonymousClass1);
            this.mBackgroundView.startAnimation(scaleAnimation);
            Animation alphaAnimation = new AlphaAnimation(1.0f, PanoramaArrowAnimateDrawable.LEFT_ARROW_RATIO);
            alphaAnimation.setInterpolator(new SineEaseInInterpolator());
            alphaAnimation.setDuration(120);
            alphaAnimation.setFillAfter(true);
            this.mRecyclerView.startAnimation(alphaAnimation);
            return;
        }
        scaleAnimation = new AnimationSet(true);
        Animation alphaAnimation2 = new AlphaAnimation(1.0f, PanoramaArrowAnimateDrawable.LEFT_ARROW_RATIO);
        Animation translateAnimation = new TranslateAnimation(1, PanoramaArrowAnimateDrawable.LEFT_ARROW_RATIO, 1, PanoramaArrowAnimateDrawable.LEFT_ARROW_RATIO, 1, PanoramaArrowAnimateDrawable.LEFT_ARROW_RATIO, 1, -0.07f);
        scaleAnimation.addAnimation(alphaAnimation2);
        scaleAnimation.addAnimation(translateAnimation);
        scaleAnimation.setInterpolator(new CubicEaseOutInterpolator());
        scaleAnimation.setDuration(200);
        scaleAnimation.setAnimationListener(anonymousClass1);
        getView().startAnimation(scaleAnimation);
    }

    public void provideRotateItem(List<View> list, int i) {
        super.provideRotateItem(list, i);
        this.mExtraAdapter.setNewDegree(i);
        for (i = 0; i < this.mRecyclerView.getChildCount(); i++) {
            list.add(this.mRecyclerView.getChildAt(i));
        }
    }

    private void addContentDescriptionForConfigs(int i) {
        DataItemRunning dataItemRunning = DataRepository.dataItemRunning();
        DataItemConfig dataItemConfig = DataRepository.dataItemConfig();
        CharSequence stringBuilder = new StringBuilder();
        boolean isSwitchOn;
        switch (i) {
            case 226:
                ComponentRunningTimer componentRunningTimer = dataItemRunning.getComponentRunningTimer();
                boolean isSwitchOn2 = componentRunningTimer.isSwitchOn();
                stringBuilder.append(getString(componentRunningTimer.getValueDisplayString(160)));
                if (!isSwitchOn2) {
                    stringBuilder.append(getString(R.string.accessibility_closed));
                    break;
                }
                break;
            case 228:
                ComponentRunningTiltValue componentRunningTiltValue = dataItemRunning.getComponentRunningTiltValue();
                if (!dataItemRunning.isSwitchOn("pref_camera_tilt_shift_mode")) {
                    stringBuilder.append(getString(R.string.config_name_tilt));
                    stringBuilder.append(getString(R.string.accessibility_closed));
                    break;
                }
                stringBuilder.append(getString(componentRunningTiltValue.getValueDisplayString(160)));
                break;
            case 229:
                isSwitchOn = dataItemRunning.isSwitchOn("pref_camera_gradienter_key");
                stringBuilder.append(getString(R.string.config_name_straighten));
                if (!isSwitchOn) {
                    stringBuilder.append(getString(R.string.accessibility_closed));
                    break;
                } else {
                    stringBuilder.append(getString(R.string.accessibility_open));
                    break;
                }
            case 230:
                isSwitchOn = dataItemRunning.isSwitchOn("pref_camera_hand_night_key");
                stringBuilder.append(getString(R.string.config_name_hht));
                if (!isSwitchOn) {
                    stringBuilder.append(getString(R.string.accessibility_closed));
                    break;
                } else {
                    stringBuilder.append(getString(R.string.accessibility_open));
                    break;
                }
            case 231:
                isSwitchOn = dataItemRunning.isSwitchOn("pref_camera_ubifocus_key");
                stringBuilder.append(getString(R.string.config_name_magic));
                if (!isSwitchOn) {
                    stringBuilder.append(getString(R.string.accessibility_closed));
                    break;
                } else {
                    stringBuilder.append(getString(R.string.accessibility_open));
                    break;
                }
            case 232:
                isSwitchOn = dataItemRunning.isSwitchOn("pref_video_speed_slow_key");
                stringBuilder.append(getString(R.string.pref_video_speed_slow_title));
                if (!isSwitchOn) {
                    stringBuilder.append(getString(R.string.accessibility_closed));
                    break;
                } else {
                    stringBuilder.append(getString(R.string.accessibility_open));
                    break;
                }
            case 233:
                isSwitchOn = dataItemRunning.isSwitchOn("pref_video_speed_fast_key");
                stringBuilder.append(getString(R.string.pref_video_speed_fast_title));
                if (!isSwitchOn) {
                    stringBuilder.append(getString(R.string.accessibility_closed));
                    break;
                } else {
                    stringBuilder.append(getString(R.string.accessibility_open));
                    break;
                }
            case 234:
                isSwitchOn = dataItemRunning.isSwitchOn("pref_camera_scenemode_setting_key");
                stringBuilder.append(getString(R.string.config_name_scene));
                if (!isSwitchOn) {
                    stringBuilder.append(getString(R.string.accessibility_closed));
                    break;
                } else {
                    stringBuilder.append(getString(R.string.accessibility_open));
                    break;
                }
            case 235:
                isSwitchOn = dataItemRunning.isSwitchOn("pref_camera_groupshot_mode_key");
                stringBuilder.append(getString(R.string.config_name_group));
                if (!isSwitchOn) {
                    stringBuilder.append(getString(R.string.accessibility_closed));
                    break;
                } else {
                    stringBuilder.append(getString(R.string.accessibility_open));
                    break;
                }
            case 236:
                isSwitchOn = dataItemRunning.isSwitchOn("pref_camera_magic_mirror_key");
                stringBuilder.append(getString(R.string.pref_camera_magic_mirror_title));
                if (!isSwitchOn) {
                    stringBuilder.append(getString(R.string.accessibility_closed));
                    break;
                } else {
                    stringBuilder.append(getString(R.string.accessibility_open));
                    break;
                }
            case 238:
                isSwitchOn = dataItemRunning.isSwitchOn("pref_camera_show_gender_age_key");
                stringBuilder.append(getString(R.string.pref_camera_show_gender_age_config_title));
                if (!isSwitchOn) {
                    stringBuilder.append(getString(R.string.accessibility_closed));
                    break;
                } else {
                    stringBuilder.append(getString(R.string.accessibility_open));
                    break;
                }
            case 239:
                i = DataRepository.dataItemGlobal().getCurrentMode();
                ComponentConfigBeauty componentConfigBeauty = dataItemConfig.getComponentConfigBeauty();
                boolean isSwitchOn3 = componentConfigBeauty.isSwitchOn(i);
                stringBuilder.append(getString(componentConfigBeauty.getValueDisplayString(i)));
                if (!isSwitchOn3) {
                    stringBuilder.append(getString(R.string.accessibility_closed));
                    break;
                } else {
                    stringBuilder.append(getString(R.string.accessibility_open));
                    break;
                }
            case 240:
                isSwitchOn = CameraSettings.isDualCameraWaterMarkOpen();
                stringBuilder.append(getString(R.string.pref_camera_device_watermark_title));
                if (!isSwitchOn) {
                    stringBuilder.append(getString(R.string.accessibility_closed));
                    break;
                } else {
                    stringBuilder.append(getString(R.string.accessibility_open));
                    break;
                }
        }
        if (!TextUtils.isEmpty(stringBuilder) && Util.isAccessible()) {
            this.mRecyclerView.setContentDescription(stringBuilder);
            this.mRecyclerView.sendAccessibilityEvent(4);
        }
    }
}
