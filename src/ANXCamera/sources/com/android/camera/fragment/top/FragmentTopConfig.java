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
import com.android.camera.CameraSettings;
import com.android.camera.R;
import com.android.camera.Util;
import com.android.camera.animation.type.AlphaInOnSubscribe;
import com.android.camera.animation.type.AlphaOutOnSubscribe;
import com.android.camera.constant.DurationConstant;
import com.android.camera.data.DataRepository;
import com.android.camera.data.data.ComponentData;
import com.android.camera.data.data.config.ComponentConfigFlash;
import com.android.camera.data.data.config.ComponentConfigHdr;
import com.android.camera.data.data.config.DataItemConfig;
import com.android.camera.data.data.config.SupportedConfigFactory;
import com.android.camera.data.data.config.SupportedConfigs;
import com.android.camera.data.data.config.TopConfigItem;
import com.android.camera.effect.FilterInfo;
import com.android.camera.fragment.BaseFragment;
import com.android.camera.fragment.FragmentUtils;
import com.android.camera.fragment.live.FragmentLiveMusic;
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
    private int mBeforeMode = 160;
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
    private int mViewPadding;

    protected void initView(View view) {
        this.mAiSceneResources = getAiSceneResources();
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
        provideAnimateElement(this.mCurrentMode, null, false);
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
        if (z && this.mDisabledFunctionMenu != null) {
            this.mDisabledFunctionMenu.clear();
        }
    }

    public void onClick(View view) {
        if (isEnableClick()) {
            ConfigChanges configChanges = (ConfigChanges) ModeCoordinatorImpl.getInstance().getAttachProtocol(164);
            if (configChanges != null) {
                CameraAction cameraAction = (CameraAction) ModeCoordinatorImpl.getInstance().getAttachProtocol(161);
                if (cameraAction != null && cameraAction.isDoingAction()) {
                    return;
                }
                if (!CameraSettings.isFrontCamera() || !((Camera) getContext()).isScreenSlideOff()) {
                    int intValue = ((Integer) view.getTag()).intValue();
                    if (this.mDisabledFunctionMenu == null || !this.mDisabledFunctionMenu.contains(Integer.valueOf(intValue))) {
                        if (intValue == 199) {
                            configChanges.onConfigChanged(199);
                            ((ImageView) view).setImageResource(getFocusPeakImageResource());
                        } else if (intValue == 209) {
                            configChanges.onConfigChanged(209);
                        } else if (intValue == 225) {
                            configChanges.showSetting();
                        } else if (intValue == 243) {
                            configChanges.onConfigChanged(243);
                        } else if (intValue != 245) {
                            switch (intValue) {
                                case 193:
                                    expandExtra(((DataItemConfig) DataRepository.provider().dataConfig()).getComponentFlash(), view, intValue);
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
                        } else if (FragmentUtils.getFragmentByTag(getChildFragmentManager(), FragmentLiveMusic.TAG) == null) {
                            Fragment fragmentLiveMusic = new FragmentLiveMusic();
                            fragmentLiveMusic.setStyle(2, R.style.LensDirtyDetectDialogFragment);
                            getChildFragmentManager().beginTransaction().add(fragmentLiveMusic, FragmentLiveMusic.TAG).commitAllowingStateLoss();
                        }
                    }
                }
            }
        }
    }

    public void alertTopMusicHint(int i, String str) {
        getTopAlert().alertTopMusicHint(i, str, getResources().getDimensionPixelSize(R.dimen.music_hint_top_margin));
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
            reInitAlert();
        }
        return true;
    }

    /* JADX WARNING: Missing block: B:86:0x0186, code:
            r8 = r3;
     */
    /* JADX WARNING: Missing block: B:87:0x0189, code:
            r8 = 0;
     */
    /* Code decompiled incorrectly, please refer to instructions dump. */
    private boolean setTopImageResource(int i, ImageView imageView, int i2, DataItemConfig dataItemConfig, int i3, boolean z) {
        ActionProcessing actionProcessing = (ActionProcessing) ModeCoordinatorImpl.getInstance().getAttachProtocol(162);
        int i4 = 0;
        boolean isUltraPixelPhotographyOn;
        if (i == 209) {
            isUltraPixelPhotographyOn = CameraSettings.isUltraPixelPhotographyOn();
            i4 = isUltraPixelPhotographyOn ? this.mUltraPixelPhotographyResources[1] : this.mUltraPixelPhotographyResources[0];
            i2 = isUltraPixelPhotographyOn ? R.string.accessibility_ultra_pixel_photography_on : R.string.accessibility_ultra_pixel_photography_off;
        } else if (i == 225) {
            i4 = getSettingResources();
            i2 = R.string.accessibility_setting;
        } else if (i != 243) {
            boolean z2;
            if (i != 245) {
                int i5;
                String componentValue;
                switch (i) {
                    case 193:
                        ComponentConfigFlash componentFlash = dataItemConfig.getComponentFlash();
                        if (componentFlash.isEmpty()) {
                            i5 = 0;
                        } else {
                            i3 = componentFlash.getValueSelectedDrawableIgnoreClose(i2);
                            i5 = componentFlash.getValueSelectedStringIdIgnoreClose(i2);
                            if (!z) {
                                componentValue = componentFlash.getComponentValue(i2);
                                if ("1".equals(componentValue) || ComponentConfigFlash.FLASH_VALUE_SCREEN_LIGHT_ON.equals(componentValue)) {
                                    alertFlash(0, false, false);
                                } else if ("2".equals(componentValue)) {
                                    alertFlash(0, true, false);
                                } else {
                                    alertFlash(8, false, false);
                                }
                            }
                            i4 = i3;
                        }
                        TopConfigItem findConfigItem = this.mSupportedConfigs.findConfigItem(i);
                        imageView.setEnabled(findConfigItem.enable);
                        if (!findConfigItem.enable) {
                            imageView.setAlpha(0.6f);
                            break;
                        }
                        imageView.setAlpha(1.0f);
                        break;
                        break;
                    case 194:
                        ComponentConfigHdr componentHdr = dataItemConfig.getComponentHdr();
                        if (!componentHdr.isEmpty()) {
                            i3 = componentHdr.getValueSelectedDrawableIgnoreClose(i2);
                            i5 = componentHdr.getValueSelectedStringIdIgnoreClose(i2);
                            if (!z) {
                                componentValue = componentHdr.getComponentValue(i2);
                                if ("on".equals(componentValue) || "normal".equals(componentValue)) {
                                    alertHDR(0, false, false);
                                } else if (ComponentConfigHdr.HDR_VALUE_LIVE.equals(componentValue)) {
                                    alertHDR(0, true, false);
                                } else {
                                    alertHDR(8, false, false);
                                }
                            }
                            i4 = i3;
                            break;
                        }
                        break;
                    case 195:
                        i4 = getPortraitResources();
                        i2 = R.string.accessibility_protrait;
                        break;
                    case 196:
                        if (z) {
                            componentValue = DataRepository.getInstance().backUp().getBackupFilter(i2, DataRepository.dataItemGlobal().getCurrentCameraId());
                        } else {
                            componentValue = DataRepository.dataItemRunning().getComponentConfigFilter().getComponentValue(i2);
                        }
                        i2 = Integer.parseInt(componentValue);
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
                        i4 = getMoreResources();
                        i2 = R.string.accessibility_more;
                        break;
                    case 198:
                        return false;
                    case 199:
                        i4 = getFocusPeakImageResource();
                        i2 = R.string.accessibility_foucs_peak;
                        break;
                    default:
                        switch (i) {
                            case 201:
                                i4 = CameraSettings.getAiSceneOpen() ? this.mAiSceneResources[1] : this.mAiSceneResources[0];
                                if (!CameraSettings.getAiSceneOpen()) {
                                    i2 = R.string.accessibility_ai_scene_off;
                                    break;
                                }
                                i2 = R.string.accessibility_ai_scene_on;
                                break;
                            case 202:
                                i4 = getHFRImageResource(i2);
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
                                i4 = getFPS960ImageResource(i2);
                                i2 = DataRepository.dataItemConfig().getComponentConfigSlowMotion().getContentDesc();
                                break;
                            case 205:
                                isUltraPixelPhotographyOn = CameraSettings.isUltraWideConfigOpen();
                                i4 = isUltraPixelPhotographyOn ? this.mUltraWideResource[1] : this.mUltraWideResource[0];
                                if (!isUltraPixelPhotographyOn) {
                                    i2 = R.string.accessibility_ultra_wide_off;
                                    break;
                                }
                                i2 = R.string.accessibility_ultra_wide_on;
                                break;
                            case 206:
                                isUltraPixelPhotographyOn = CameraSettings.isLiveShotOn();
                                i4 = isUltraPixelPhotographyOn ? this.mLiveShotResource[1] : this.mLiveShotResource[0];
                                if (!isUltraPixelPhotographyOn) {
                                    i2 = R.string.accessibility_camera_liveshot_off;
                                    break;
                                }
                                i2 = R.string.accessibility_camera_liveshot_on;
                                break;
                            case 207:
                                isUltraPixelPhotographyOn = CameraSettings.isUltraWideBokehOn();
                                i4 = isUltraPixelPhotographyOn ? this.mUltraWideBokehResources[1] : this.mUltraWideBokehResources[0];
                                if (!isUltraPixelPhotographyOn) {
                                    i2 = R.string.accessibility_camera_ultra_wide_bokeh_off;
                                    break;
                                }
                                i2 = R.string.accessibility_camera_ultra_wide_bokeh_on;
                                break;
                        }
                        break;
                }
            }
            i2 = this.mLiveMusicSelectResources[0];
            boolean z3 = z2;
            i4 = i2;
            i2 = z3;
        } else {
            isUltraPixelPhotographyOn = CameraSettings.isVideoBokehOn();
            String str = TAG;
            StringBuilder stringBuilder = new StringBuilder();
            stringBuilder.append("setTopImageResource: VIDEO_BOKEH isSwitchOn = ");
            stringBuilder.append(isUltraPixelPhotographyOn);
            Log.d(str, stringBuilder.toString());
            i4 = isUltraPixelPhotographyOn ? this.mVideoBokehResource[1] : this.mVideoBokehResource[0];
            i2 = isUltraPixelPhotographyOn ? R.string.pref_camera_video_bokeh_on : R.string.pref_camera_video_bokeh_off;
        }
        if (imageView != null && i4 > 0) {
            Drawable drawable = getResources().getDrawable(i4);
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
        if ("zh".equals(Locale.getDefault().getLanguage())) {
            return new int[]{R.drawable.ic_ultra_wide_bokeh_chs, R.drawable.ic_ultra_wide_bokeh_highlight_chs};
        }
        return new int[]{R.drawable.ic_ultra_wide_bokeh_eng, R.drawable.ic_ultra_wide_bokeh_highlight_eng};
    }

    private int[] getMusicSelectResources() {
        return new int[]{R.drawable.ic_live_music_normal, R.drawable.ic_live_music_selected};
    }

    /* JADX WARNING: Missing block: B:7:0x001f, code:
            if (r8 == 162) goto L_0x0026;
     */
    /* JADX WARNING: Missing block: B:8:0x0021, code:
            switch(r8) {
                case 168: goto L_0x0026;
                case 169: goto L_0x0026;
                case 170: goto L_0x0026;
                default: goto L_0x0024;
            };
     */
    /* JADX WARNING: Missing block: B:9:0x0024, code:
            r0 = true;
     */
    /* JADX WARNING: Missing block: B:10:0x0026, code:
            r0 = false;
     */
    /* JADX WARNING: Missing block: B:14:0x0030, code:
            r0 = true;
     */
    /* JADX WARNING: Missing block: B:15:0x0031, code:
            if (r0 == false) goto L_0x0037;
     */
    /* JADX WARNING: Missing block: B:16:0x0033, code:
            onBackEvent(4);
     */
    /* JADX WARNING: Missing block: B:17:0x0037, code:
            r0 = getTopAlert();
     */
    /* JADX WARNING: Missing block: B:18:0x003b, code:
            if (r0 == null) goto L_0x0040;
     */
    /* JADX WARNING: Missing block: B:19:0x003d, code:
            r0.provideAnimateElement(r8, r9, false);
     */
    /* JADX WARNING: Missing block: B:20:0x0040, code:
            r13 = com.android.camera.data.DataRepository.dataItemConfig();
            r0 = com.android.camera.data.DataRepository.dataItemGlobal().getCurrentCameraId();
            r1 = com.android.camera.module.loader.camera2.Camera2DataContainer.getInstance().getCapabilitiesByBogusCameraId(r0, r7.mCurrentMode);
     */
    /* JADX WARNING: Missing block: B:21:0x0056, code:
            if (r1 != null) goto L_0x0059;
     */
    /* JADX WARNING: Missing block: B:22:0x0058, code:
            return;
     */
    /* JADX WARNING: Missing block: B:23:0x0059, code:
            r7.mSupportedConfigs = com.android.camera.data.data.config.SupportedConfigFactory.getSupportedTopConfigs(r7.mCurrentMode, r13, r0, r1, com.android.camera.data.DataRepository.dataItemGlobal().isNormalIntent());
            r14 = 0;
     */
    /* JADX WARNING: Missing block: B:25:0x0070, code:
            if (r14 >= r7.mConfigViews.size()) goto L_0x012a;
     */
    /* JADX WARNING: Missing block: B:26:0x0072, code:
            r15 = (android.widget.ImageView) r7.mConfigViews.get(r14);
            r15.setEnabled(r11);
            r16 = r15.getTag(com.android.camera.R.id.tag_config_view_margin_key);
     */
    /* JADX WARNING: Missing block: B:27:0x0085, code:
            if (r16 == null) goto L_0x0091;
     */
    /* JADX WARNING: Missing block: B:28:0x0087, code:
            r5 = ((java.lang.Integer) r16).intValue();
     */
    /* JADX WARNING: Missing block: B:29:0x0091, code:
            r5 = r12;
     */
    /* JADX WARNING: Missing block: B:30:0x0093, code:
            r4 = r7.mSupportedConfigs.getConfigTypeForViewPosition(r14);
     */
    /* JADX WARNING: Missing block: B:31:0x0099, code:
            if (r9 == null) goto L_0x009e;
     */
    /* JADX WARNING: Missing block: B:32:0x009b, code:
            r17 = r11;
     */
    /* JADX WARNING: Missing block: B:33:0x009e, code:
            r17 = r12;
     */
    /* JADX WARNING: Missing block: B:34:0x00a0, code:
            r11 = r4;
            r12 = r5;
            r8 = com.android.camera.R.id.tag_config_view_margin_key;
            r0 = setTopImageResource(r4, r15, r8, r13, r14, r17);
     */
    /* JADX WARNING: Missing block: B:35:0x00b0, code:
            if (r0 == false) goto L_0x00c3;
     */
    /* JADX WARNING: Missing block: B:36:0x00b2, code:
            if (r16 == null) goto L_0x00c3;
     */
    /* JADX WARNING: Missing block: B:38:0x00be, code:
            if (r12 != ((java.lang.Integer) r15.getTag(r8)).intValue()) goto L_0x00c1;
     */
    /* JADX WARNING: Missing block: B:39:0x00c1, code:
            r1 = null;
     */
    /* JADX WARNING: Missing block: B:40:0x00c3, code:
            r1 = 1;
     */
    /* JADX WARNING: Missing block: B:42:0x00c8, code:
            if (r15.getTag() == null) goto L_0x00d9;
     */
    /* JADX WARNING: Missing block: B:44:0x00d4, code:
            if (((java.lang.Integer) r15.getTag()).intValue() != r11) goto L_0x00d9;
     */
    /* JADX WARNING: Missing block: B:45:0x00d6, code:
            if (r1 == null) goto L_0x00d9;
     */
    /* JADX WARNING: Missing block: B:46:0x00d9, code:
            r15.setTag(java.lang.Integer.valueOf(r11));
     */
    /* JADX WARNING: Missing block: B:47:0x00e0, code:
            if (r9 != null) goto L_0x00ec;
     */
    /* JADX WARNING: Missing block: B:48:0x00e2, code:
            if (r0 == false) goto L_0x00e8;
     */
    /* JADX WARNING: Missing block: B:49:0x00e4, code:
            com.android.camera.animation.type.AlphaInOnSubscribe.directSetResult(r15);
     */
    /* JADX WARNING: Missing block: B:50:0x00e8, code:
            com.android.camera.animation.type.AlphaOutOnSubscribe.directSetResult(r15);
     */
    /* JADX WARNING: Missing block: B:52:0x00ee, code:
            if (r0 == false) goto L_0x0105;
     */
    /* JADX WARNING: Missing block: B:53:0x00f0, code:
            r0 = new com.android.camera.animation.type.AlphaInOnSubscribe(r15);
            r0.setStartDelayTime(150).setDurationTime(150);
            r9.add(io.reactivex.Completable.create(r0));
     */
    /* JADX WARNING: Missing block: B:55:0x0107, code:
            if (r10 == 165) goto L_0x011f;
     */
    /* JADX WARNING: Missing block: B:57:0x010b, code:
            if (r7.mCurrentMode != 165) goto L_0x010e;
     */
    /* JADX WARNING: Missing block: B:58:0x010e, code:
            r9.add(io.reactivex.Completable.create(new com.android.camera.animation.type.AlphaOutOnSubscribe(r15).setDurationTime(150)));
     */
    /* JADX WARNING: Missing block: B:59:0x011f, code:
            com.android.camera.animation.type.AlphaOutOnSubscribe.directSetResult(r15);
     */
    /* JADX WARNING: Missing block: B:60:0x0122, code:
            r14 = r14 + 1;
            r8 = r20;
            r11 = true;
            r12 = false;
     */
    /* JADX WARNING: Missing block: B:61:0x012a, code:
            return;
     */
    /* Code decompiled incorrectly, please refer to instructions dump. */
    public void provideAnimateElement(int i, List<Completable> list, boolean z) {
        int i2 = i;
        List<Completable> list2 = list;
        if (this.mCurrentMode != i2) {
            this.mBeforeMode = this.mCurrentMode;
        }
        int i3 = this.mCurrentMode;
        super.provideAnimateElement(i, list, z);
        boolean z2 = true;
        boolean z3 = false;
        switch (i3) {
            case 161:
                if (i2 == 161) {
                    boolean z4 = false;
                    break;
                }
            case 162:
                break;
            default:
                switch (i3) {
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
            int intValue;
            ImageView imageView = (ImageView) this.mConfigViews.get(i);
            imageView.setEnabled(true);
            Object tag = imageView.getTag(R.id.tag_config_view_margin_key);
            if (tag != null) {
                intValue = ((Integer) tag).intValue();
            } else {
                intValue = 0;
            }
            int configTypeForViewPosition = this.mSupportedConfigs.getConfigTypeForViewPosition(i);
            int i2 = configTypeForViewPosition;
            boolean topImageResource = setTopImageResource(configTypeForViewPosition, imageView, this.mCurrentMode, dataItemConfig, i, false);
            int i3 = (!topImageResource || tag == null || intValue == ((Integer) imageView.getTag(R.id.tag_config_view_margin_key)).intValue()) ? 1 : 0;
            if (imageView.getTag() == null || ((Integer) imageView.getTag()).intValue() != i2 || i3 == 0) {
                imageView.setTag(Integer.valueOf(i2));
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
        this.mBeforeMode = this.mCurrentMode;
        DataItemConfig dataItemConfig = DataRepository.dataItemConfig();
        for (int i : iArr) {
            if (this.mSupportedConfigs.isHasConfigItem(i)) {
                setTopImageResource(i, getTopImage(i), this.mCurrentMode, dataItemConfig, getTopImagePosition(i), false);
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
            for (int valueOf : iArr) {
                this.mDisabledFunctionMenu.add(Integer.valueOf(valueOf));
            }
        }
    }

    public void enableMenuItem(int... iArr) {
        if (iArr == null || iArr.length == 0) {
            this.mDisabledFunctionMenu.clear();
            return;
        }
        for (int valueOf : iArr) {
            this.mDisabledFunctionMenu.remove(Integer.valueOf(valueOf));
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

    public void alertHDR(int i, boolean z, boolean z2) {
        FragmentTopAlert topAlert = getTopAlert();
        if (topAlert != null && topAlert.isShow()) {
            if (i != 0) {
                this.mLastAnimationComponent.reverse(true);
            } else if (z2) {
                getTopImage(194).performClick();
            }
            topAlert.alertHDR(i, getAlertTopMargin(), z);
        }
    }

    public void alertFlash(int i, boolean z, boolean z2) {
        FragmentTopAlert topAlert = getTopAlert();
        if (topAlert != null && topAlert.isShow()) {
            if (i != 0) {
                this.mLastAnimationComponent.reverse(true);
            } else if (z2) {
                getTopImage(193).performClick();
            }
            topAlert.alertFlash(i, getAlertTopMargin(), z);
        }
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

    public void alertTopHint(int i, @StringRes int i2) {
        FragmentTopAlert topAlert = getTopAlert();
        if (topAlert != null && topAlert.isShow()) {
            topAlert.alertTopHint(i, i2, getAlertTopMargin());
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
        provideAnimateElement(this.mCurrentMode, null, false);
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
        }
    }

    private void reConfigTipImage() {
        DataItemConfig dataItemConfig = DataRepository.dataItemConfig();
        ComponentConfigFlash componentFlash = dataItemConfig.getComponentFlash();
        if (!(componentFlash.isEmpty() || componentFlash.isClosed())) {
            String componentValue = componentFlash.getComponentValue(this.mCurrentMode);
            if ("1".equals(componentValue)) {
                alertFlash(0, false, false);
                return;
            } else if ("2".equals(componentValue)) {
                alertFlash(0, true, false);
                return;
            }
        }
        ComponentConfigHdr componentHdr = dataItemConfig.getComponentHdr();
        if (!(componentHdr.isEmpty() || componentHdr.isClosed())) {
            String componentValue2 = componentHdr.getComponentValue(this.mCurrentMode);
            if ("on".equals(componentValue2) || "normal".equals(componentValue2)) {
                alertHDR(0, false, false);
            } else if (ComponentConfigHdr.HDR_VALUE_LIVE.equals(componentValue2)) {
                alertHDR(0, true, false);
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

    public void reInitAlert() {
        FragmentTopAlert topAlert = getTopAlert();
        if (topAlert != null) {
            topAlert.setShow(true);
            reConfigTipImage();
            alertUpdateValue(4);
        }
    }
}
