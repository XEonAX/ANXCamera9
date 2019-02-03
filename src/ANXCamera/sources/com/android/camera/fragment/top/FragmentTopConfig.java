package com.android.camera.fragment.top;

import android.animation.ObjectAnimator;
import android.content.res.TypedArray;
import android.graphics.drawable.Drawable;
import android.graphics.drawable.LayerDrawable;
import android.graphics.drawable.RotateDrawable;
import android.support.annotation.DrawableRes;
import android.support.annotation.StringRes;
import android.support.v4.app.Fragment;
import android.support.v4.view.GravityCompat;
import android.support.v4.view.ViewCompat;
import android.support.v7.widget.LinearLayoutManager;
import android.support.v7.widget.RecyclerView;
import android.support.v7.widget.RecyclerView.Adapter;
import android.support.v7.widget.RecyclerView.LayoutManager;
import android.view.View;
import android.view.View.OnClickListener;
import android.view.ViewGroup;
import android.view.ViewGroup.MarginLayoutParams;
import android.widget.FrameLayout.LayoutParams;
import android.widget.ImageView;
import com.android.camera.ActivityBase;
import com.android.camera.Camera;
import com.android.camera.CameraAppImpl;
import com.android.camera.CameraSettings;
import com.android.camera.R;
import com.android.camera.ToastUtils;
import com.android.camera.Util;
import com.android.camera.animation.type.AlphaInOnSubscribe;
import com.android.camera.animation.type.AlphaOutOnSubscribe;
import com.android.camera.constant.DurationConstant;
import com.android.camera.constant.EyeLightConstant;
import com.android.camera.data.DataRepository;
import com.android.camera.data.data.ComponentData;
import com.android.camera.data.data.config.ComponentConfigFlash;
import com.android.camera.data.data.config.ComponentConfigHdr;
import com.android.camera.data.data.config.ComponentConfigUltraWide;
import com.android.camera.data.data.config.DataItemConfig;
import com.android.camera.data.data.config.SupportedConfigFactory;
import com.android.camera.data.data.config.SupportedConfigs;
import com.android.camera.data.data.config.TopConfigItem;
import com.android.camera.effect.FilterInfo;
import com.android.camera.fragment.BaseFragment;
import com.android.camera.fragment.FragmentUtils;
import com.android.camera.fragment.music.FragmentLiveMusic;
import com.android.camera.fragment.top.ExpandAdapter.ExpandListener;
import com.android.camera.log.Log;
import com.android.camera.module.loader.camera2.Camera2DataContainer;
import com.android.camera.protocol.ModeCoordinatorImpl;
import com.android.camera.protocol.ModeProtocol.ActionProcessing;
import com.android.camera.protocol.ModeProtocol.CameraAction;
import com.android.camera.protocol.ModeProtocol.ConfigChanges;
import com.android.camera.protocol.ModeProtocol.HandleBackTrace;
import com.android.camera.protocol.ModeProtocol.HandleBeautyRecording;
import com.android.camera.protocol.ModeProtocol.ModeCoordinator;
import com.android.camera.protocol.ModeProtocol.TopAlert;
import com.android.camera.statistic.CameraStatUtil;
import io.reactivex.Completable;
import java.util.ArrayList;
import java.util.HashSet;
import java.util.List;
import java.util.Locale;
import java.util.Set;
import miui.view.animation.CubicEaseInOutInterpolator;

public class FragmentTopConfig extends BaseFragment implements OnClickListener, ExpandListener, HandleBackTrace, HandleBeautyRecording, TopAlert {
    private static final int EXPAND_STATE_CENTER = 2;
    private static final int EXPAND_STATE_LEFT = 0;
    private static final int EXPAND_STATE_LEFT_FROM_SIBLING = 1;
    private static final int EXPAND_STATE_RIGHT = 4;
    private static final int EXPAND_STATE_RIGHT_FROM_SIBLING = 3;
    private static final String TAG = "FragmentTopConfig";
    private int[] mAiSceneResources;
    private int[] mAutoZoomResources;
    private List<ImageView> mConfigViews;
    private int mCurrentAiSceneLevel = CameraSettings.getAiSceneOpen();
    private Set<Integer> mDisabledFunctionMenu;
    private int mDisplayRectTopMargin;
    private RecyclerView mExpandView;
    private int[] mFilterResources;
    private FragmentTopAlert mFragmentTopAlert;
    private FragmentTopConfigExtra mFragmentTopConfigExtra;
    private boolean mIsRTL;
    private LastAnimationComponent mLastAnimationComponent;
    private int[] mLightingResource;
    private int[] mLiveMusicSelectResources;
    private ObjectAnimator mLiveShotAnimator;
    private int[] mLiveShotResource;
    private SupportedConfigs mSupportedConfigs;
    private View mTopConfigMenu;
    private int mTopDrawableWidth;
    private ViewGroup mTopExtraParent;
    private int mTotalWidth;
    private int[] mUltraPixelPhotographyResources;
    private int[] mUltraWideBokehResources;
    private int[] mUltraWideResource;
    private int[] mVideoBokehResource;
    private boolean mVideoRecordingStarted;
    private int mViewPadding;

    protected void initView(View view) {
        this.mAiSceneResources = getAiSceneResources();
        this.mAutoZoomResources = getAutoZoomResources();
        this.mUltraWideResource = getUltraWideResources();
        this.mUltraWideBokehResources = getUltraWideBokehResources();
        this.mUltraPixelPhotographyResources = getUltraPixelPhotographyResources();
        this.mLiveShotResource = getLiveShotResources();
        this.mLightingResource = getLightingResources();
        this.mVideoBokehResource = getVideoBokehResources();
        this.mFilterResources = getFilterResources();
        this.mLiveMusicSelectResources = getMusicSelectResources();
        this.mIsRTL = Util.isLayoutRTL(getContext());
        this.mLastAnimationComponent = new LastAnimationComponent();
        this.mDisabledFunctionMenu = new HashSet();
        this.mTopExtraParent = (ViewGroup) view.findViewById(R.id.top_config_extra);
        this.mTopConfigMenu = view.findViewById(R.id.top_config_menu);
        if (Util.isNotchDevice) {
            ((MarginLayoutParams) this.mTopConfigMenu.getLayoutParams()).topMargin = Util.sStatusBarHeight;
        }
        initTopView();
        this.mExpandView = (RecyclerView) view.findViewById(R.id.top_config_expand_view);
        LayoutManager linearLayoutManager = new LinearLayoutManager(getContext());
        linearLayoutManager.setOrientation(0);
        this.mExpandView.setLayoutManager(linearLayoutManager);
        this.mViewPadding = getResources().getDimensionPixelSize(R.dimen.panel_imageview_button_padding_width);
        this.mTopDrawableWidth = getResources().getDrawable(R.drawable.ic_new_config_flash_off).getIntrinsicWidth();
        this.mTotalWidth = getResources().getDisplayMetrics().widthPixels;
        if (((ActivityBase) getContext()).getCameraIntentManager().isFromScreenSlide().booleanValue()) {
            Util.startScreenSlideAlphaInAnimation(this.mTopConfigMenu);
        }
        provideAnimateElement(this.mCurrentMode, null, 2);
    }

    private void initTopView() {
        ImageView imageView = (ImageView) this.mTopConfigMenu.findViewById(R.id.top_config_00);
        ImageView imageView2 = (ImageView) this.mTopConfigMenu.findViewById(R.id.top_config_01);
        ImageView imageView3 = (ImageView) this.mTopConfigMenu.findViewById(R.id.top_config_02);
        ImageView imageView4 = (ImageView) this.mTopConfigMenu.findViewById(R.id.top_config_03);
        ImageView imageView5 = (ImageView) this.mTopConfigMenu.findViewById(R.id.top_config_04);
        ImageView imageView6 = (ImageView) this.mTopConfigMenu.findViewById(R.id.top_config_05);
        ImageView imageView7 = (ImageView) this.mTopConfigMenu.findViewById(R.id.top_config_06);
        ImageView imageView8 = (ImageView) this.mTopConfigMenu.findViewById(R.id.top_config_07);
        ImageView imageView9 = (ImageView) this.mTopConfigMenu.findViewById(R.id.top_config_08);
        ImageView imageView10 = (ImageView) this.mTopConfigMenu.findViewById(R.id.top_config_09);
        ImageView imageView11 = (ImageView) this.mTopConfigMenu.findViewById(R.id.top_config_10);
        imageView.setOnClickListener(this);
        imageView2.setOnClickListener(this);
        imageView3.setOnClickListener(this);
        imageView4.setOnClickListener(this);
        imageView5.setOnClickListener(this);
        imageView6.setOnClickListener(this);
        imageView7.setOnClickListener(this);
        imageView8.setOnClickListener(this);
        imageView9.setOnClickListener(this);
        imageView10.setOnClickListener(this);
        imageView11.setOnClickListener(this);
        this.mConfigViews = new ArrayList();
        this.mConfigViews.add(imageView);
        this.mConfigViews.add(imageView2);
        this.mConfigViews.add(imageView3);
        this.mConfigViews.add(imageView4);
        this.mConfigViews.add(imageView5);
        this.mConfigViews.add(imageView6);
        this.mConfigViews.add(imageView7);
        this.mConfigViews.add(imageView8);
        this.mConfigViews.add(imageView9);
        this.mConfigViews.add(imageView10);
        this.mConfigViews.add(imageView11);
    }

    private int getInitialMargin(int i) {
        if (this.mSupportedConfigs == null || this.mSupportedConfigs.getConfigsSize() <= 0) {
            return 0;
        }
        int configsSize = this.mSupportedConfigs.getConfigsSize();
        int findConfigPositionFromType = this.mSupportedConfigs.findConfigPositionFromType(i);
        TopConfigItem findConfigItem = this.mSupportedConfigs.findConfigItem(i);
        ImageView topImage = getTopImage(i);
        LayoutParams layoutParams = (LayoutParams) topImage.getLayoutParams();
        layoutParams.gravity = 0;
        int i2 = 8388611;
        int i3 = GravityCompat.END;
        switch (configsSize) {
            case 1:
                layoutParams.leftMargin = 0;
                if (findConfigItem.gravity != 0) {
                    i3 = findConfigItem.gravity;
                }
                layoutParams.gravity = i3;
                topImage.setLayoutParams(layoutParams);
                return 0;
            case 2:
                if (findConfigPositionFromType == 0) {
                    layoutParams.leftMargin = 0;
                    if (findConfigItem.gravity != 0) {
                        i2 = findConfigItem.gravity;
                    }
                    layoutParams.gravity = i2;
                } else if (findConfigPositionFromType == 1) {
                    layoutParams.leftMargin = 0;
                    if (findConfigItem.gravity != 0) {
                        i3 = findConfigItem.gravity;
                    }
                    layoutParams.gravity = i3;
                }
                topImage.setLayoutParams(layoutParams);
                return 0;
            default:
                if (findConfigPositionFromType == 0) {
                    layoutParams.leftMargin = 0;
                    layoutParams.gravity = 8388611;
                    topImage.setLayoutParams(layoutParams);
                    return 0;
                }
                configsSize--;
                if (findConfigPositionFromType != configsSize) {
                    return (((this.mTotalWidth - (this.mViewPadding * 2)) / configsSize) * findConfigPositionFromType) + this.mViewPadding;
                }
                layoutParams.leftMargin = 0;
                layoutParams.gravity = GravityCompat.END;
                topImage.setLayoutParams(layoutParams);
                return 0;
        }
    }

    protected int getLayoutResourceId() {
        return R.layout.fragment_top_config;
    }

    public int getFragmentInto() {
        return 244;
    }

    public void setClickEnable(boolean z) {
        super.setClickEnable(z);
        FragmentTopAlert topAlert = getTopAlert();
        if (topAlert != null) {
            topAlert.setClickEnable(z);
        }
    }

    public void onClick(View view) {
        Log.d(TAG, "top config onclick");
        if (isEnableClick()) {
            ConfigChanges configChanges = (ConfigChanges) ModeCoordinatorImpl.getInstance().getAttachProtocol(164);
            if (configChanges != null) {
                CameraAction cameraAction = (CameraAction) ModeCoordinatorImpl.getInstance().getAttachProtocol(161);
                if (cameraAction != null && cameraAction.isDoingAction()) {
                    return;
                }
                if (!CameraSettings.isFrontCamera() || !((Camera) getContext()).isScreenSlideOff()) {
                    int intValue = ((Integer) view.getTag()).intValue();
                    if (this.mDisabledFunctionMenu.isEmpty() || !this.mDisabledFunctionMenu.contains(Integer.valueOf(intValue))) {
                        if (intValue == 199) {
                            configChanges.onConfigChanged(199);
                            ((ImageView) view).setImageResource(getFocusPeakImageResource());
                        } else if (intValue == 209) {
                            configChanges.onConfigChanged(209);
                        } else if (intValue == 225) {
                            configChanges.showSetting();
                        } else if (intValue == 243) {
                            configChanges.onConfigChanged(243);
                        } else if (intValue == 245) {
                            Fragment fragmentByTag = FragmentUtils.getFragmentByTag(getFragmentManager(), FragmentLiveMusic.TAG);
                            CameraStatUtil.trackLiveMusicClick();
                            if (fragmentByTag == null) {
                                fragmentByTag = new FragmentLiveMusic();
                                fragmentByTag.setStyle(2, R.style.TTMusicDialogFragment);
                                getFragmentManager().beginTransaction().add(fragmentByTag, FragmentLiveMusic.TAG).commitAllowingStateLoss();
                            }
                        } else if (intValue != 253) {
                            switch (intValue) {
                                case 193:
                                    ComponentData componentFlash = ((DataItemConfig) DataRepository.provider().dataConfig()).getComponentFlash();
                                    if (!componentFlash.disableUpdate()) {
                                        expandExtra(componentFlash, view, intValue);
                                        break;
                                    }
                                    int disableReasonString = componentFlash.getDisableReasonString();
                                    if (disableReasonString != 0) {
                                        ToastUtils.showToast(CameraAppImpl.getAndroidContext(), disableReasonString);
                                    }
                                    Log.w(TAG, "ignore click flash for disable update");
                                    break;
                                case 194:
                                    expandExtra(((DataItemConfig) DataRepository.provider().dataConfig()).getComponentHdr(), view, intValue);
                                    break;
                                case 195:
                                    configChanges.onConfigChanged(195);
                                    break;
                                case 196:
                                    configChanges.onConfigChanged(196);
                                    updateConfigItem(196);
                                    break;
                                case 197:
                                    showMenu();
                                    break;
                                default:
                                    switch (intValue) {
                                        case 201:
                                            configChanges.onConfigChanged(201);
                                            break;
                                        case 202:
                                            configChanges.onConfigChanged(202);
                                            break;
                                        case 203:
                                            configChanges.onConfigChanged(203);
                                            break;
                                        case 204:
                                            configChanges.onConfigChanged(204);
                                            break;
                                        case 205:
                                            configChanges.onConfigChanged(205);
                                            break;
                                        case 206:
                                            configChanges.onConfigChanged(206);
                                            break;
                                        case 207:
                                            configChanges.onConfigChanged(207);
                                            break;
                                    }
                                    break;
                            }
                        } else {
                            configChanges.onConfigChanged(253);
                        }
                    }
                }
            }
        }
    }

    public void alertMusicClose(boolean z) {
        FragmentTopAlert topAlert = getTopAlert();
        if (topAlert != null) {
            topAlert.alertMusicClose(z);
        }
    }

    private void alertTopMusicHint(int i, String str) {
        FragmentTopAlert topAlert = getTopAlert();
        int dimensionPixelSize = getResources().getDimensionPixelSize(R.dimen.music_hint_top_margin);
        if (topAlert != null) {
            topAlert.alertTopMusicHint(i, str, dimensionPixelSize);
        }
    }

    public void onExpandValueChange(ComponentData componentData, String str) {
        if (isEnableClick()) {
            DataItemConfig dataItemConfig = DataRepository.dataItemConfig();
            ConfigChanges configChanges = (ConfigChanges) ModeCoordinatorImpl.getInstance().getAttachProtocol(164);
            if (configChanges != null) {
                int displayTitleString = componentData.getDisplayTitleString();
                if (displayTitleString == R.string.pref_camera_flashmode_title) {
                    CameraStatUtil.trackFlashChanged(this.mCurrentMode, str);
                    updateConfigItem(193);
                    if (dataItemConfig.reConfigHhrIfFlashChanged(this.mCurrentMode, str)) {
                        updateConfigItem(194);
                    }
                    configChanges.configFlash(str);
                } else if (displayTitleString == R.string.pref_camera_hdr_title) {
                    CameraStatUtil.trackHdrChanged(this.mCurrentMode, str);
                    updateConfigItem(194);
                    if (dataItemConfig.reConfigFlashIfHdrChanged(this.mCurrentMode, str)) {
                        updateConfigItem(193);
                    }
                    configChanges.configHdr(str);
                }
                this.mLastAnimationComponent.reverse(true);
            }
        }
    }

    public ImageView getTopImage(int i) {
        return (ImageView) this.mConfigViews.get(SupportedConfigFactory.findViewPosition(i));
    }

    public int getTopImagePosition(int i) {
        return SupportedConfigFactory.findViewPosition(i);
    }

    @DrawableRes
    private int getFocusPeakImageResource() {
        boolean isSwitchOn = DataRepository.dataItemRunning().isSwitchOn("pref_camera_peak_key");
        if ("zh".equals(Locale.getDefault().getLanguage())) {
            if (isSwitchOn) {
                return R.drawable.ic_new_config_focus_peak_ch_on;
            }
            return R.drawable.ic_new_config_foucs_peak_ch_off;
        } else if (isSwitchOn) {
            return R.drawable.ic_new_config_focus_peak_en_on;
        } else {
            return R.drawable.ic_new_config_focus_peak_en_off;
        }
    }

    @DrawableRes
    private int getHFRImageResource(int i) {
        if ((i == 170 ? 1 : null) != null) {
            return R.drawable.ic_new_config_video_fps_120;
        }
        return R.drawable.ic_new_config_video_fps_30;
    }

    @StringRes
    private int getHFRContentDesc(int i) {
        if ((i == 170 ? 1 : null) != null) {
            return R.string.accessibility_camera_video_fps_120;
        }
        return R.string.accessibility_camera_video_fps_30;
    }

    @DrawableRes
    private int getFPS960ImageResource(int i) {
        return DataRepository.dataItemConfig().getComponentConfigSlowMotion().getImageResource();
    }

    private void expandExtra(ComponentData componentData, View view, int i) {
        int i2 = 1;
        if (!this.mLastAnimationComponent.reverse(true)) {
            int i3;
            Adapter expandAdapter = new ExpandAdapter(componentData, this);
            int dimensionPixelSize = getResources().getDimensionPixelSize(R.dimen.expanded_text_item_width) * componentData.getItems().size();
            this.mExpandView.getLayoutParams().width = dimensionPixelSize;
            this.mExpandView.setAdapter(expandAdapter);
            int i4 = 0;
            this.mExpandView.setVisibility(0);
            this.mExpandView.setTag(Integer.valueOf(i));
            int dimensionPixelSize2 = getResources().getDimensionPixelSize(R.dimen.panel_imageview_button_padding_width) * 3;
            int i5 = ((LayoutParams) view.getLayoutParams()).gravity == 8388611 ? 1 : 0;
            if (i5 != 0) {
                i2 = 0;
            }
            if (this.mIsRTL) {
                i2 = 4 - i2;
            }
            switch (i2) {
                case 0:
                    this.mLastAnimationComponent.setExpandGravity(5);
                    dimensionPixelSize2 = view.getRight() - dimensionPixelSize2;
                    i2 = view.getWidth() + 0;
                    break;
                case 1:
                    this.mLastAnimationComponent.setExpandGravity(3);
                    dimensionPixelSize2 = view.getRight();
                    i2 = view.getWidth() + 0;
                    break;
                case 2:
                    i2 = getView().getWidth() - view.getWidth();
                    dimensionPixelSize2 = (view.getLeft() - dimensionPixelSize) - dimensionPixelSize2;
                    i3 = i2 - dimensionPixelSize;
                    break;
                case 3:
                    i2 = getView().getWidth() - view.getWidth();
                    dimensionPixelSize2 = (view.getLeft() - dimensionPixelSize) - dimensionPixelSize2;
                    i3 = i2 - dimensionPixelSize;
                    break;
                case 4:
                    this.mLastAnimationComponent.setExpandGravity(3);
                    i2 = getView().getWidth() - view.getWidth();
                    dimensionPixelSize2 += view.getLeft() - dimensionPixelSize;
                    i3 = i2 - dimensionPixelSize;
                    break;
                default:
                    dimensionPixelSize2 = 0;
                    i2 = dimensionPixelSize2;
                    i3 = i2;
                    break;
            }
            i3 = i2;
            i2 = 0;
            this.mLastAnimationComponent.mRecyclerView = this.mExpandView;
            this.mLastAnimationComponent.mReverseLeft = view.getLeft();
            this.mLastAnimationComponent.mReverseRecyclerViewLeft = dimensionPixelSize2;
            this.mLastAnimationComponent.hideOtherViews(i, this.mConfigViews);
            if (i5 == 0) {
                this.mLastAnimationComponent.mAnchorView = view;
                this.mLastAnimationComponent.translateAnchorView(i2 - view.getLeft());
            }
            if (this.mIsRTL) {
                i4 = getView().getWidth() - dimensionPixelSize;
            }
            this.mLastAnimationComponent.showExtraView(dimensionPixelSize2 - i4, i3 - i4);
        }
    }

    private void showMenu() {
        this.mTopConfigMenu.setVisibility(8);
        hideAlert();
        this.mFragmentTopConfigExtra = new FragmentTopConfigExtra();
        this.mFragmentTopConfigExtra.setDegree(this.mDegree);
        MarginLayoutParams marginLayoutParams = (MarginLayoutParams) this.mTopExtraParent.getLayoutParams();
        if (Util.isLongRatioScreen) {
            marginLayoutParams.topMargin = 0;
        } else {
            marginLayoutParams.topMargin = this.mDisplayRectTopMargin;
        }
        FragmentUtils.addFragmentWithTag(getChildFragmentManager(), (int) R.id.top_config_extra, this.mFragmentTopConfigExtra, this.mFragmentTopConfigExtra.getFragmentTag());
    }

    protected void register(ModeCoordinator modeCoordinator) {
        super.register(modeCoordinator);
        registerBackStack(modeCoordinator, this);
        modeCoordinator.attachProtocol(172, this);
    }

    protected void unRegister(ModeCoordinator modeCoordinator) {
        super.unRegister(modeCoordinator);
        unRegisterBackStack(modeCoordinator, this);
        modeCoordinator.detachProtocol(172, this);
    }

    public boolean onBackEvent(int i) {
        if (this.mLastAnimationComponent.reverse(i != 4)) {
            return true;
        }
        FragmentTopConfigExtra topExtra = getTopExtra();
        if (topExtra == null) {
            return false;
        }
        if (i != 6) {
            switch (i) {
                case 1:
                case 2:
                    topExtra.animateOut();
                    Completable.create(new AlphaInOnSubscribe(this.mTopConfigMenu).setStartDelayTime(200)).subscribe();
                    break;
                default:
                    FragmentUtils.removeFragmentByTag(getChildFragmentManager(), String.valueOf(245));
                    this.mTopConfigMenu.setVisibility(0);
                    break;
            }
        }
        topExtra.animateOut();
        Completable.create(new AlphaInOnSubscribe(this.mTopConfigMenu).setStartDelayTime(200)).subscribe();
        if (i != 4) {
            reInitAlert(true);
        }
        return true;
    }

    /* JADX WARNING: Missing block: B:80:0x0193, code:
            r8 = 0;
     */
    /* Code decompiled incorrectly, please refer to instructions dump. */
    private boolean setTopImageResource(int i, ImageView imageView, int i2, DataItemConfig dataItemConfig, boolean z) {
        ActionProcessing actionProcessing = (ActionProcessing) ModeCoordinatorImpl.getInstance().getAttachProtocol(162);
        int i3 = 0;
        boolean isUltraPixelPhotographyOn;
        if (i == 209) {
            isUltraPixelPhotographyOn = CameraSettings.isUltraPixelPhotographyOn();
            i3 = isUltraPixelPhotographyOn ? this.mUltraPixelPhotographyResources[1] : this.mUltraPixelPhotographyResources[0];
            i2 = isUltraPixelPhotographyOn ? R.string.accessibility_ultra_pixel_photography_48mp_on : R.string.accessibility_ultra_pixel_photography_48mp_off;
        } else if (i == 225) {
            i3 = getSettingResources();
            i2 = R.string.accessibility_setting;
        } else if (i != 243) {
            boolean z2;
            if (i == 245) {
                String[] currentLiveMusic = CameraSettings.getCurrentLiveMusic();
                if (currentLiveMusic[1].isEmpty()) {
                    i2 = this.mLiveMusicSelectResources[0];
                } else {
                    alertTopMusicHint(0, currentLiveMusic[1]);
                    i2 = this.mLiveMusicSelectResources[1];
                }
            } else if (i != 253) {
                switch (i) {
                    case 193:
                        ComponentConfigFlash componentFlash = dataItemConfig.getComponentFlash();
                        if (!componentFlash.isEmpty()) {
                            i3 = componentFlash.getValueSelectedDrawableIgnoreClose(i2);
                            i2 = componentFlash.getValueSelectedStringIdIgnoreClose(i2);
                            if (!z) {
                                reConfigTipOfFlash(true);
                                break;
                            }
                        }
                        break;
                    case 194:
                        ComponentConfigHdr componentHdr = dataItemConfig.getComponentHdr();
                        if (!componentHdr.isEmpty()) {
                            i3 = componentHdr.getValueSelectedDrawableIgnoreClose(i2);
                            i2 = componentHdr.getValueSelectedStringIdIgnoreClose(i2);
                            if (!z) {
                                reConfigTipOfHdr(true);
                                break;
                            }
                        }
                        break;
                    case 195:
                        i3 = getPortraitResources();
                        i2 = R.string.accessibility_protrait;
                        break;
                    case 196:
                        String backupFilter;
                        if (z) {
                            backupFilter = DataRepository.getInstance().backUp().getBackupFilter(i2, DataRepository.dataItemGlobal().getCurrentCameraId());
                        } else {
                            backupFilter = DataRepository.dataItemRunning().getComponentConfigFilter().getComponentValue(i2);
                        }
                        i2 = Integer.parseInt(backupFilter);
                        if (i2 == FilterInfo.FILTER_ID_NONE || i2 <= 0) {
                            i2 = this.mFilterResources[0];
                        } else {
                            i2 = this.mFilterResources[1];
                        }
                        if (actionProcessing != null) {
                            if (!actionProcessing.isShowFilterView()) {
                                z2 = true;
                                break;
                            }
                            z2 = true;
                            break;
                        }
                        break;
                    case 197:
                        i3 = getMoreResources();
                        i2 = R.string.accessibility_more;
                        break;
                    case 198:
                        return false;
                    case 199:
                        i3 = getFocusPeakImageResource();
                        i2 = R.string.accessibility_foucs_peak;
                        break;
                    default:
                        switch (i) {
                            case 201:
                                i3 = CameraSettings.getAiSceneOpen() ? this.mAiSceneResources[1] : this.mAiSceneResources[0];
                                if (!CameraSettings.getAiSceneOpen()) {
                                    i2 = R.string.accessibility_ai_scene_off;
                                    break;
                                }
                                i2 = R.string.accessibility_ai_scene_on;
                                break;
                            case 202:
                                i3 = getHFRImageResource(i2);
                                i2 = getHFRContentDesc(i2);
                                break;
                            case 203:
                                if (DataRepository.dataItemRunning().getComponentRunningLighting().isSwitchOn(i2)) {
                                    i2 = this.mLightingResource[1];
                                } else {
                                    i2 = this.mLightingResource[0];
                                }
                                if (actionProcessing != null) {
                                    if (!actionProcessing.isShowLightingView()) {
                                        z2 = true;
                                        break;
                                    }
                                    z2 = true;
                                    break;
                                }
                                break;
                            case 204:
                                i3 = getFPS960ImageResource(i2);
                                i2 = DataRepository.dataItemConfig().getComponentConfigSlowMotion().getContentDesc();
                                break;
                            case 205:
                                ComponentConfigUltraWide componentConfigUltraWide = dataItemConfig.getComponentConfigUltraWide();
                                if (!componentConfigUltraWide.isEmpty()) {
                                    i3 = componentConfigUltraWide.getValueSelectedDrawableIgnoreClose(i2);
                                    i2 = componentConfigUltraWide.getValueSelectedStringIdIgnoreClose(i2);
                                    break;
                                }
                            case 206:
                                isUltraPixelPhotographyOn = CameraSettings.isLiveShotOn();
                                i3 = isUltraPixelPhotographyOn ? this.mLiveShotResource[1] : this.mLiveShotResource[0];
                                if (!isUltraPixelPhotographyOn) {
                                    i2 = R.string.accessibility_camera_liveshot_off;
                                    break;
                                }
                                i2 = R.string.accessibility_camera_liveshot_on;
                                break;
                            case 207:
                                if (z) {
                                    isUltraPixelPhotographyOn = DataRepository.getInstance().backUp().getBackupSwitchState(i2, "pref_ultra_wide_bokeh_enabled", DataRepository.dataItemGlobal().getCurrentCameraId());
                                } else {
                                    isUltraPixelPhotographyOn = DataRepository.dataItemRunning().isSwitchOn("pref_ultra_wide_bokeh_enabled");
                                }
                                i3 = isUltraPixelPhotographyOn ? this.mUltraWideBokehResources[1] : this.mUltraWideBokehResources[0];
                                if (!isUltraPixelPhotographyOn) {
                                    i2 = R.string.accessibility_camera_ultra_wide_bokeh_off;
                                    break;
                                }
                                i2 = R.string.accessibility_camera_ultra_wide_bokeh_on;
                                break;
                        }
                        break;
                }
            } else {
                i3 = DataRepository.dataItemRunning().isSwitchOn("pref_camera_auto_zoom") ? this.mAutoZoomResources[1] : this.mAutoZoomResources[0];
                i2 = R.string.autozoom_hint;
            }
            boolean z3 = z2;
            i3 = i2;
            i2 = z3;
        } else {
            isUltraPixelPhotographyOn = CameraSettings.isVideoBokehOn();
            String str = TAG;
            StringBuilder stringBuilder = new StringBuilder();
            stringBuilder.append("setTopImageResource: VIDEO_BOKEH isSwitchOn = ");
            stringBuilder.append(isUltraPixelPhotographyOn);
            Log.d(str, stringBuilder.toString());
            i3 = isUltraPixelPhotographyOn ? this.mVideoBokehResource[1] : this.mVideoBokehResource[0];
            i2 = isUltraPixelPhotographyOn ? R.string.pref_camera_video_bokeh_on : R.string.pref_camera_video_bokeh_off;
        }
        if (imageView != null && i3 > 0) {
            Drawable drawable = getResources().getDrawable(i3);
            i = getInitialMargin(i);
            imageView.setTag(R.id.tag_config_view_margin_key, Integer.valueOf(i));
            if (i > 0) {
                LayoutParams layoutParams = (LayoutParams) imageView.getLayoutParams();
                i -= (drawable.getIntrinsicWidth() / 2) + this.mViewPadding;
                if (this.mIsRTL) {
                    layoutParams.leftMargin = ((this.mTotalWidth - i) - drawable.getIntrinsicWidth()) - (this.mViewPadding * 2);
                } else {
                    layoutParams.leftMargin = i;
                }
                imageView.setLayoutParams(layoutParams);
            }
            imageView.setImageDrawable(drawable);
            if (i2 > 0 && (Util.isAccessible() || Util.isSetContentDesc())) {
                imageView.setContentDescription(getString(i2));
            }
        }
        return true;
    }

    private int[] getFilterResources() {
        return new int[]{R.drawable.ic_new_effect_button_normal, R.drawable.ic_new_effect_button_selected};
    }

    private int[] getVideoBokehResources() {
        return new int[]{R.drawable.ic_new_portrait_button_normal, R.drawable.ic_new_portrait_button_on};
    }

    private int getPortraitResources() {
        return R.drawable.ic_new_portrait_button_normal;
    }

    private int getSettingResources() {
        return R.drawable.ic_new_config_setting;
    }

    private int getMoreResources() {
        return R.drawable.ic_new_more;
    }

    private int[] getLightingResources() {
        return new int[]{R.drawable.ic_new_lighting_off, R.drawable.ic_new_lighting_on};
    }

    private int[] getAiSceneResources() {
        return new int[]{R.drawable.ic_new_ai_scene_off, R.drawable.ic_new_ai_scene_on};
    }

    private int[] getAutoZoomResources() {
        return new int[]{R.drawable.ic_autozoom_off, R.drawable.ic_autozoom_on};
    }

    private int[] getUltraWideResources() {
        return new int[]{R.drawable.icon_config_ultra_wide_off, R.drawable.icon_config_ultra_wide_on};
    }

    private int[] getLiveShotResources() {
        return new int[]{R.drawable.ic_motionphoto, R.drawable.ic_motionphoto_highlight};
    }

    private int[] getUltraPixelPhotographyResources() {
        return new int[]{R.drawable.ic_ultra_pixel_photography_48mp, R.drawable.ic_ultra_pixel_photography_48mp_highlight};
    }

    private int[] getUltraWideBokehResources() {
        return new int[]{R.drawable.ic_ultra_wide_bokeh, R.drawable.ic_ultra_wide_bokeh_highlight};
    }

    private int[] getMusicSelectResources() {
        return new int[]{R.drawable.ic_live_music_normal, R.drawable.ic_live_music_selected};
    }

    /* JADX WARNING: Missing block: B:8:0x001f, code:
            if (r7 == 162) goto L_0x0026;
     */
    /* JADX WARNING: Missing block: B:9:0x0021, code:
            switch(r7) {
                case 168: goto L_0x0026;
                case 169: goto L_0x0026;
                case 170: goto L_0x0026;
                default: goto L_0x0024;
            };
     */
    /* JADX WARNING: Missing block: B:10:0x0024, code:
            r2 = true;
     */
    /* JADX WARNING: Missing block: B:11:0x0026, code:
            r2 = false;
     */
    /* JADX WARNING: Missing block: B:15:0x0030, code:
            r2 = true;
     */
    /* JADX WARNING: Missing block: B:16:0x0031, code:
            if (r2 == false) goto L_0x0037;
     */
    /* JADX WARNING: Missing block: B:17:0x0033, code:
            onBackEvent(4);
     */
    /* JADX WARNING: Missing block: B:18:0x0037, code:
            if (r1 == false) goto L_0x003e;
     */
    /* JADX WARNING: Missing block: B:19:0x0039, code:
            r6.mDisabledFunctionMenu.clear();
     */
    /* JADX WARNING: Missing block: B:20:0x003e, code:
            r1 = getTopAlert();
     */
    /* JADX WARNING: Missing block: B:21:0x0042, code:
            if (r1 == null) goto L_0x0047;
     */
    /* JADX WARNING: Missing block: B:22:0x0044, code:
            r1.provideAnimateElement(r7, r8, r0);
     */
    /* JADX WARNING: Missing block: B:23:0x0047, code:
            r12 = com.android.camera.data.DataRepository.dataItemConfig();
            r0 = com.android.camera.data.DataRepository.dataItemGlobal().getCurrentCameraId();
            r1 = com.android.camera.module.loader.camera2.Camera2DataContainer.getInstance().getCapabilitiesByBogusCameraId(r0, r6.mCurrentMode);
     */
    /* JADX WARNING: Missing block: B:24:0x005d, code:
            if (r1 != null) goto L_0x0060;
     */
    /* JADX WARNING: Missing block: B:25:0x005f, code:
            return;
     */
    /* JADX WARNING: Missing block: B:27:0x0066, code:
            if (r6.mTopConfigMenu.getVisibility() == 0) goto L_0x006d;
     */
    /* JADX WARNING: Missing block: B:28:0x0068, code:
            com.android.camera.animation.type.AlphaInOnSubscribe.directSetResult(r6.mTopConfigMenu);
     */
    /* JADX WARNING: Missing block: B:29:0x006d, code:
            r6.mSupportedConfigs = com.android.camera.data.data.config.SupportedConfigFactory.getSupportedTopConfigs(r6.mCurrentMode, r12, r0, r1, com.android.camera.data.DataRepository.dataItemGlobal().isNormalIntent());
            r13 = 0;
     */
    /* JADX WARNING: Missing block: B:31:0x0084, code:
            if (r13 >= r6.mConfigViews.size()) goto L_0x0149;
     */
    /* JADX WARNING: Missing block: B:32:0x0086, code:
            r14 = (android.widget.ImageView) r6.mConfigViews.get(r13);
            r14.setEnabled(r11);
            r16 = r14.getTag(com.android.camera.R.id.tag_config_view_margin_key);
     */
    /* JADX WARNING: Missing block: B:33:0x0099, code:
            if (r16 == null) goto L_0x00a5;
     */
    /* JADX WARNING: Missing block: B:34:0x009b, code:
            r5 = ((java.lang.Integer) r16).intValue();
     */
    /* JADX WARNING: Missing block: B:35:0x00a5, code:
            r5 = 0;
     */
    /* JADX WARNING: Missing block: B:36:0x00a7, code:
            r4 = r6.mSupportedConfigs.getConfigTypeForViewPosition(r13);
     */
    /* JADX WARNING: Missing block: B:37:0x00ad, code:
            if (r8 == null) goto L_0x00b2;
     */
    /* JADX WARNING: Missing block: B:38:0x00af, code:
            r17 = r11;
     */
    /* JADX WARNING: Missing block: B:39:0x00b2, code:
            r17 = false;
     */
    /* JADX WARNING: Missing block: B:40:0x00b4, code:
            r10 = r4;
            r11 = r5;
            r0 = setTopImageResource(r4, r14, r7, r12, r17);
     */
    /* JADX WARNING: Missing block: B:41:0x00c1, code:
            if (r0 == false) goto L_0x00d2;
     */
    /* JADX WARNING: Missing block: B:43:0x00cd, code:
            if (r6.mDisabledFunctionMenu.contains(java.lang.Integer.valueOf(r10)) == false) goto L_0x00d2;
     */
    /* JADX WARNING: Missing block: B:44:0x00d2, code:
            if (r0 == false) goto L_0x00e5;
     */
    /* JADX WARNING: Missing block: B:45:0x00d4, code:
            if (r16 == null) goto L_0x00e5;
     */
    /* JADX WARNING: Missing block: B:47:0x00e0, code:
            if (r11 != ((java.lang.Integer) r14.getTag(com.android.camera.R.id.tag_config_view_margin_key)).intValue()) goto L_0x00e3;
     */
    /* JADX WARNING: Missing block: B:48:0x00e3, code:
            r11 = null;
     */
    /* JADX WARNING: Missing block: B:49:0x00e5, code:
            r11 = 1;
     */
    /* JADX WARNING: Missing block: B:51:0x00ea, code:
            if (r14.getTag() == null) goto L_0x00fb;
     */
    /* JADX WARNING: Missing block: B:53:0x00f6, code:
            if (((java.lang.Integer) r14.getTag()).intValue() != r10) goto L_0x00fb;
     */
    /* JADX WARNING: Missing block: B:54:0x00f8, code:
            if (r11 == null) goto L_0x00fb;
     */
    /* JADX WARNING: Missing block: B:55:0x00fb, code:
            r14.setTag(java.lang.Integer.valueOf(r10));
     */
    /* JADX WARNING: Missing block: B:56:0x0102, code:
            if (r8 != null) goto L_0x010e;
     */
    /* JADX WARNING: Missing block: B:57:0x0104, code:
            if (r0 == false) goto L_0x010a;
     */
    /* JADX WARNING: Missing block: B:58:0x0106, code:
            com.android.camera.animation.type.AlphaInOnSubscribe.directSetResult(r14);
     */
    /* JADX WARNING: Missing block: B:59:0x010a, code:
            com.android.camera.animation.type.AlphaOutOnSubscribe.directSetResult(r14);
     */
    /* JADX WARNING: Missing block: B:61:0x0110, code:
            if (r0 == false) goto L_0x0127;
     */
    /* JADX WARNING: Missing block: B:62:0x0112, code:
            r0 = new com.android.camera.animation.type.AlphaInOnSubscribe(r14);
            r0.setStartDelayTime(150).setDurationTime(150);
            r8.add(io.reactivex.Completable.create(r0));
     */
    /* JADX WARNING: Missing block: B:64:0x0129, code:
            if (r9 == 165) goto L_0x0141;
     */
    /* JADX WARNING: Missing block: B:66:0x012d, code:
            if (r6.mCurrentMode != 165) goto L_0x0130;
     */
    /* JADX WARNING: Missing block: B:67:0x0130, code:
            r8.add(io.reactivex.Completable.create(new com.android.camera.animation.type.AlphaOutOnSubscribe(r14).setDurationTime(150)));
     */
    /* JADX WARNING: Missing block: B:68:0x0141, code:
            com.android.camera.animation.type.AlphaOutOnSubscribe.directSetResult(r14);
     */
    /* JADX WARNING: Missing block: B:69:0x0144, code:
            r13 = r13 + 1;
            r11 = true;
     */
    /* JADX WARNING: Missing block: B:70:0x0149, code:
            return;
     */
    /* Code decompiled incorrectly, please refer to instructions dump. */
    public void provideAnimateElement(int i, List<Completable> list, int i2) {
        int i3 = i;
        List<Completable> list2 = list;
        int i4 = i2;
        int i5 = this.mCurrentMode;
        boolean z = true;
        boolean z2 = i4 == 3;
        super.provideAnimateElement(i, list, i2);
        switch (i5) {
            case 161:
                if (i3 == 161) {
                    boolean z3 = false;
                    break;
                }
            case 162:
                break;
            default:
                switch (i5) {
                    case 168:
                    case 169:
                    case 170:
                        break;
                }
                break;
        }
    }

    private void resetImages() {
        DataItemConfig dataItemConfig = DataRepository.dataItemConfig();
        int currentCameraId = DataRepository.dataItemGlobal().getCurrentCameraId();
        this.mSupportedConfigs = SupportedConfigFactory.getSupportedTopConfigs(this.mCurrentMode, dataItemConfig, currentCameraId, Camera2DataContainer.getInstance().getCapabilitiesByBogusCameraId(currentCameraId, this.mCurrentMode), DataRepository.dataItemGlobal().isNormalIntent());
        for (int i = 0; i < this.mConfigViews.size(); i++) {
            ImageView imageView = (ImageView) this.mConfigViews.get(i);
            boolean z = true;
            imageView.setEnabled(true);
            imageView.setColorFilter(null);
            Object tag = imageView.getTag(R.id.tag_config_view_margin_key);
            int intValue;
            if (tag != null) {
                intValue = ((Integer) tag).intValue();
            } else {
                intValue = 0;
            }
            int configTypeForViewPosition = this.mSupportedConfigs.getConfigTypeForViewPosition(i);
            boolean topImageResource = setTopImageResource(configTypeForViewPosition, imageView, this.mCurrentMode, dataItemConfig, false);
            if (!(!topImageResource || tag == null || intValue == ((Integer) imageView.getTag(R.id.tag_config_view_margin_key)).intValue())) {
                z = false;
            }
            if (imageView.getTag() == null || ((Integer) imageView.getTag()).intValue() != configTypeForViewPosition || !z) {
                imageView.setTag(Integer.valueOf(configTypeForViewPosition));
                imageView.clearAnimation();
                imageView.setVisibility(0);
                if (topImageResource) {
                    ViewCompat.setAlpha(imageView, 0.0f);
                    ViewCompat.animate(imageView).alpha(1.0f).setDuration(150).setStartDelay(150).start();
                } else {
                    imageView.setVisibility(4);
                }
            }
        }
    }

    public void updateConfigItem(int... iArr) {
        DataItemConfig dataItemConfig = DataRepository.dataItemConfig();
        for (int i : iArr) {
            if (this.mSupportedConfigs.isHasConfigItem(i)) {
                setTopImageResource(i, getTopImage(i), this.mCurrentMode, dataItemConfig, false);
            }
        }
    }

    public void insertConfigItem(int i) {
        resetImages();
    }

    public void removeConfigItem(int i) {
        resetImages();
    }

    public void removeExtraMenu(int i) {
        onBackEvent(i);
    }

    public void hideExtraMenu() {
        onBackEvent(6);
    }

    public void startLiveShotAnimation() {
        ImageView topImage = getTopImage(206);
        if (topImage != null) {
            Drawable drawable = topImage.getDrawable();
            if (drawable instanceof LayerDrawable) {
                RotateDrawable rotateDrawable = (RotateDrawable) ((LayerDrawable) drawable).getDrawable(0);
                if (this.mLiveShotAnimator == null || this.mLiveShotAnimator.getTarget() != rotateDrawable) {
                    this.mLiveShotAnimator = ObjectAnimator.ofInt(rotateDrawable, "level", new int[]{0, DurationConstant.DURATION_VIDEO_RECORDING_CIRCLE});
                    this.mLiveShotAnimator.setDuration(1000);
                    this.mLiveShotAnimator.setInterpolator(new CubicEaseInOutInterpolator());
                }
                if (this.mLiveShotAnimator.isRunning()) {
                    this.mLiveShotAnimator.cancel();
                }
                this.mLiveShotAnimator.start();
            }
        }
    }

    public void refreshExtraMenu() {
        if (this.mFragmentTopConfigExtra != null && this.mFragmentTopConfigExtra.isAdded()) {
            this.mFragmentTopConfigExtra.reFresh();
        }
    }

    public void hideConfigMenu() {
        Completable.create(new AlphaOutOnSubscribe(this.mTopConfigMenu)).subscribe();
    }

    public void showConfigMenu() {
        Completable.create(new AlphaInOnSubscribe(this.mTopConfigMenu)).subscribe();
    }

    public void disableMenuItem(int... iArr) {
        if (iArr != null) {
            for (int i : iArr) {
                this.mDisabledFunctionMenu.add(Integer.valueOf(i));
                AlphaOutOnSubscribe.directSetResult(getTopImage(i));
            }
        }
    }

    public void enableMenuItem(int... iArr) {
        if (!this.mDisabledFunctionMenu.isEmpty()) {
            for (int i : iArr) {
                this.mDisabledFunctionMenu.remove(Integer.valueOf(i));
                AlphaInOnSubscribe.directSetResult(getTopImage(i));
            }
        }
    }

    public void setRecordingTimeState(int i) {
        FragmentTopAlert topAlert = getTopAlert();
        if (topAlert != null) {
            topAlert.setRecordingTimeState(i);
        } else {
            FragmentTopAlert.setPendingRecordingState(i);
        }
    }

    public void updateRecordingTime(String str) {
        FragmentTopAlert topAlert = getTopAlert();
        if (topAlert != null) {
            topAlert.updateRecordingTime(str);
        }
    }

    private void alertHDR(int i, boolean z, boolean z2, boolean z3) {
        FragmentTopAlert topAlert = getTopAlert();
        if (topAlert != null && topAlert.isShow()) {
            if (z3) {
                if (i != 0) {
                    this.mLastAnimationComponent.reverse(true);
                } else if (z2) {
                    getTopImage(194).performClick();
                }
            }
            topAlert.alertHDR(i, getAlertTopMargin(), z);
        }
    }

    public void alertHDR(int i, boolean z, boolean z2) {
        alertHDR(i, z, z2, true);
    }

    public void alertFlash(int i, boolean z, boolean z2, boolean z3) {
        FragmentTopAlert topAlert = getTopAlert();
        if (topAlert != null && topAlert.isShow()) {
            if (z3) {
                if (i != 0) {
                    this.mLastAnimationComponent.reverse(true);
                } else if (z2) {
                    getTopImage(193).performClick();
                }
            }
            topAlert.alertFlash(i, getAlertTopMargin(), z);
        }
    }

    public void alertFlash(int i, boolean z, boolean z2) {
        alertFlash(i, z, z2, true);
    }

    public void alertUpdateValue(int i) {
        FragmentTopAlert topAlert = getTopAlert();
        if (topAlert != null && topAlert.isShow()) {
            topAlert.alertUpdateValue(i, getAlertTopMargin());
        }
    }

    public void alertAiSceneSelector(int i) {
        FragmentTopAlert topAlert = getTopAlert();
        if (topAlert != null && topAlert.isShow()) {
            topAlert.alertAiSceneSelector(i, getAlertTopMargin());
        }
    }

    public void alertMoonModeSelector(int i) {
        FragmentTopAlert topAlert = getTopAlert();
        if (topAlert != null && topAlert.isShow()) {
            topAlert.alertMoonSelector(getResources().getString(R.string.ai_scene_top_tip), getResources().getString(R.string.ai_scene_top_moon_off), i, getAlertTopMargin());
        }
    }

    public void setAiSceneImageLevel(int i) {
        if (i == 25) {
            i = 23;
        }
        Drawable aiSceneDrawable = getAiSceneDrawable(i);
        ImageView topImage = getTopImage(201);
        if (aiSceneDrawable != null && topImage != null) {
            topImage.setImageDrawable(aiSceneDrawable);
            this.mCurrentAiSceneLevel = i;
        }
    }

    public void alertSwitchHint(int i, @StringRes int i2) {
        FragmentTopAlert topAlert = getTopAlert();
        if (topAlert != null && topAlert.isShow()) {
            topAlert.alertSwitchHint(i, i2, getAlertTopMargin());
        }
    }

    public void alertSwitchHint(int i, String str) {
        FragmentTopAlert topAlert = getTopAlert();
        if (topAlert != null && topAlert.isShow()) {
            topAlert.alertSwitchHint(i, str, getAlertTopMargin());
        }
    }

    public void alertTopHint(int i, @StringRes int i2) {
        FragmentTopAlert topAlert = getTopAlert();
        if (topAlert != null && topAlert.isShow()) {
            topAlert.alertTopHint(i, i2, getAlertTopMargin());
        }
    }

    public void alertTopHint(int i, String str) {
        FragmentTopAlert topAlert = getTopAlert();
        if (topAlert != null && topAlert.isShow()) {
            topAlert.alertTopHint(i, getAlertTopMargin(), str);
        }
    }

    private FragmentTopAlert getTopAlert() {
        if (this.mFragmentTopAlert == null) {
            Log.d(TAG, "getTopAlert(): fragment is null");
            return null;
        } else if (this.mFragmentTopAlert.isAdded()) {
            return this.mFragmentTopAlert;
        } else {
            Log.d(TAG, "getTopAlert(): fragment is not added yet");
            return null;
        }
    }

    public void setShow(boolean z) {
        if (getTopAlert() != null) {
            getTopAlert().setShow(z);
        }
    }

    private FragmentTopConfigExtra getTopExtra() {
        return (FragmentTopConfigExtra) getChildFragmentManager().findFragmentByTag(String.valueOf(245));
    }

    private int getAlertTopMargin() {
        if (this.mCurrentMode == 165 && this.mDisplayRectTopMargin == 0) {
            float f = (float) getResources().getDisplayMetrics().widthPixels;
            return (((int) (((f / 0.75f) - f) / 2.0f)) - this.mDisplayRectTopMargin) + getResources().getDimensionPixelSize(R.dimen.panel_imageview_button_padding_width);
        } else if (Util.isNotchDevice && this.mDisplayRectTopMargin == Util.sStatusBarHeight) {
            return this.mDisplayRectTopMargin + this.mTopConfigMenu.getHeight();
        } else {
            if (this.mDisplayRectTopMargin <= 0) {
                return this.mTopConfigMenu.getHeight() + getResources().getDimensionPixelSize(R.dimen.panel_imageview_button_padding_width);
            }
            int dimensionPixelSize = getResources().getDimensionPixelSize(R.dimen.top_alert_margin_top);
            if (!Util.isLongRatioScreen || dimensionPixelSize <= 0) {
                return this.mDisplayRectTopMargin + getResources().getDimensionPixelSize(R.dimen.panel_imageview_button_padding_width);
            }
            return dimensionPixelSize;
        }
    }

    public void rotate() {
    }

    public void onAngleChanged(float f) {
    }

    public void onBeautyRecordingStart() {
        onBackEvent(5);
        ViewCompat.animate(this.mTopConfigMenu).alpha(0.0f).start();
    }

    public void onBeautyRecordingStop() {
        ViewCompat.animate(this.mTopConfigMenu).alpha(1.0f).start();
    }

    public void notifyDataChanged(int i, int i2) {
        super.notifyDataChanged(i, i2);
        this.mDisplayRectTopMargin = Util.getDisplayRect(getContext()).top;
        provideAnimateElement(this.mCurrentMode, null, 2);
    }

    public void notifyAfterFrameAvailable(int i) {
        super.notifyAfterFrameAvailable(i);
        if (this.mFragmentTopAlert == null) {
            this.mFragmentTopAlert = new FragmentTopAlert();
            this.mFragmentTopAlert.setShow(true);
            this.mFragmentTopAlert.setDegree(this.mDegree);
            this.mFragmentTopAlert.setAlertTopMargin(getAlertTopMargin());
            FragmentUtils.addFragmentWithTag(getChildFragmentManager(), (int) R.id.top_alert, this.mFragmentTopAlert, this.mFragmentTopAlert.getFragmentTag());
        }
        ConfigChanges configChanges = (ConfigChanges) ModeCoordinatorImpl.getInstance().getAttachProtocol(164);
        if (configChanges != null) {
            configChanges.reCheckMutexConfigs(this.mCurrentMode);
            configChanges.reCheckUltraPixelPhotoGraphy();
            configChanges.reCheckLiveShot();
            configChanges.reCheckHandGesture();
        }
    }

    private void reConfigCommonTip() {
        if (CameraSettings.isHangGestureOpen()) {
            alertTopHint(0, (int) R.string.hand_gesture_tip);
        } else if (CameraSettings.isRearMenuUltraPixelPhotographyOn() || CameraSettings.isUltraPixelPhotographyOn()) {
            alertTopHint(0, DataRepository.dataItemConfig().getRearComponentConfigUltraPixel().getUltraPixelOpenTip());
        } else if (CameraSettings.isFrontMenuUltraPixelPhotographyOn()) {
            alertTopHint(0, DataRepository.dataItemConfig().getFrontComponentConfigUltraPixel().getUltraPixelOpenTip());
        } else if (!EyeLightConstant.OFF.equals(CameraSettings.getEyeLightType())) {
            alertTopHint(0, (int) R.string.eye_light);
        }
    }

    private void reConfigTipOfFlash(boolean z) {
        ComponentConfigFlash componentFlash = DataRepository.dataItemConfig().getComponentFlash();
        if (!componentFlash.isEmpty()) {
            String componentValue = componentFlash.getComponentValue(this.mCurrentMode);
            if ("1".equals(componentValue) || ComponentConfigFlash.FLASH_VALUE_SCREEN_LIGHT_ON.equals(componentValue)) {
                alertFlash(0, false, false, z);
            } else if ("2".equals(componentValue)) {
                alertFlash(0, true, false, z);
            } else {
                alertFlash(8, false, false, z);
            }
        }
    }

    private void reConfigTipOfHdr(boolean z) {
        ComponentConfigHdr componentHdr = DataRepository.dataItemConfig().getComponentHdr();
        if (!componentHdr.isEmpty()) {
            String componentValue = componentHdr.getComponentValue(this.mCurrentMode);
            if ("on".equals(componentValue) || "normal".equals(componentValue)) {
                alertHDR(0, false, false, z);
            } else if (ComponentConfigHdr.HDR_VALUE_LIVE.equals(componentValue)) {
                alertHDR(0, true, false, z);
            } else {
                alertHDR(8, false, false, z);
            }
        }
    }

    public void provideRotateItem(List<View> list, int i) {
        super.provideRotateItem(list, i);
        FragmentTopConfigExtra topExtra = getTopExtra();
        if (topExtra != null) {
            topExtra.provideRotateItem(list, i);
        }
        FragmentTopAlert topAlert = getTopAlert();
        if (topAlert != null) {
            topAlert.provideRotateItem(list, i);
        }
    }

    private Drawable getAiSceneDrawable(int i) {
        Drawable drawable;
        TypedArray obtainTypedArray = getResources().obtainTypedArray(R.array.ai_scene_drawables);
        if (i < 0 || i >= obtainTypedArray.length()) {
            drawable = null;
        } else {
            drawable = obtainTypedArray.getDrawable(i);
        }
        obtainTypedArray.recycle();
        return drawable;
    }

    public void updateContentDescription() {
        ImageView topImage = getTopImage(196);
        if (topImage != null) {
            topImage.setContentDescription(getString(R.string.accessibility_filter_open_panel));
        }
    }

    public void alertLightingTitle(boolean z) {
        FragmentTopAlert topAlert = getTopAlert();
        if (topAlert != null && topAlert.isShow()) {
            topAlert.alertLightingTitle(z, getAlertTopMargin());
        }
    }

    public void alertLightingHint(int i) {
        FragmentTopAlert topAlert = getTopAlert();
        if (topAlert != null && topAlert.isShow()) {
            topAlert.alertLightingHint(i, getAlertTopMargin());
        }
    }

    public boolean needViewClear() {
        return true;
    }

    public void alertAiDetectTipHint(int i, int i2, long j) {
        FragmentTopAlert topAlert = getTopAlert();
        if (topAlert != null && topAlert.isShow()) {
            topAlert.alertAiDetectTipHint(i, i2, getAlertTopMargin(), j);
        }
    }

    public void hideAlert() {
        FragmentTopAlert topAlert = getTopAlert();
        if (topAlert != null) {
            topAlert.clear();
            topAlert.setShow(false);
        }
    }

    public void clearAlertStatus() {
        FragmentTopAlert topAlert = getTopAlert();
        if (topAlert != null) {
            topAlert.clearAlertStatus();
        }
    }

    public void reInitAlert(boolean z) {
        FragmentTopAlert topAlert = getTopAlert();
        if (topAlert != null) {
            topAlert.setShow(true);
            reConfigCommonTip();
            reConfigTipOfFlash(z);
            reConfigTipOfHdr(z);
            topAlert.updateMusicHint();
            alertUpdateValue(4);
        }
    }
}
