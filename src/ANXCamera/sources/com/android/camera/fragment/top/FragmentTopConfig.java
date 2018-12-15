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
import com.android.camera.fragment.BaseFragment;
import com.android.camera.fragment.FragmentUtils;
import com.android.camera.fragment.live.FragmentLiveMusic;
import com.android.camera.fragment.top.ExpandAdapter.ExpandListener;
import com.android.camera.log.Log;
import com.android.camera.module.loader.camera2.Camera2DataContainer;
import com.android.camera.protocol.ModeCoordinatorImpl;
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
    private boolean setTopImageResource(int r6, android.widget.ImageView r7, int r8, com.android.camera.data.data.config.DataItemConfig r9, int r10, boolean r11) {
        /*
        r5 = this;
        r10 = com.android.camera.protocol.ModeCoordinatorImpl.getInstance();
        r0 = 162; // 0xa2 float:2.27E-43 double:8.0E-322;
        r10 = r10.getAttachProtocol(r0);
        r10 = (com.android.camera.protocol.ModeProtocol.ActionProcessing) r10;
        r0 = 209; // 0xd1 float:2.93E-43 double:1.033E-321;
        r1 = 1;
        r2 = 0;
        if (r6 == r0) goto L_0x0228;
    L_0x0014:
        r0 = 225; // 0xe1 float:3.15E-43 double:1.11E-321;
        if (r6 == r0) goto L_0x0220;
    L_0x0018:
        r0 = 243; // 0xf3 float:3.4E-43 double:1.2E-321;
        if (r6 == r0) goto L_0x01ef;
    L_0x001c:
        r0 = 245; // 0xf5 float:3.43E-43 double:1.21E-321;
        if (r6 == r0) goto L_0x01e7;
    L_0x0020:
        r0 = 8;
        switch(r6) {
            case 193: goto L_0x018c;
            case 194: goto L_0x0148;
            case 195: goto L_0x013f;
            case 196: goto L_0x00f6;
            case 197: goto L_0x00ed;
            case 198: goto L_0x00ec;
            case 199: goto L_0x00e3;
            default: goto L_0x0025;
        };
    L_0x0025:
        switch(r6) {
            case 201: goto L_0x00c3;
            case 202: goto L_0x00b9;
            case 203: goto L_0x0090;
            case 204: goto L_0x007e;
            case 205: goto L_0x0062;
            case 206: goto L_0x0046;
            case 207: goto L_0x002a;
            default: goto L_0x0028;
        };
    L_0x0028:
        goto L_0x0189;
    L_0x002a:
        r8 = com.android.camera.CameraSettings.isUltraWideBokehOn();
        if (r8 == 0) goto L_0x0036;
    L_0x0030:
        r9 = r5.mUltraWideBokehResources;
        r9 = r9[r1];
    L_0x0034:
        r2 = r9;
        goto L_0x003b;
    L_0x0036:
        r9 = r5.mUltraWideBokehResources;
        r9 = r9[r2];
        goto L_0x0034;
    L_0x003b:
        if (r8 == 0) goto L_0x0041;
    L_0x003d:
        r8 = 2131427907; // 0x7f0b0243 float:1.8477443E38 double:1.0530653054E-314;
        goto L_0x0044;
    L_0x0041:
        r8 = 2131427908; // 0x7f0b0244 float:1.8477446E38 double:1.053065306E-314;
    L_0x0044:
        goto L_0x0243;
    L_0x0046:
        r8 = com.android.camera.CameraSettings.isLiveShotOn();
        if (r8 == 0) goto L_0x0052;
    L_0x004c:
        r9 = r5.mLiveShotResource;
        r9 = r9[r1];
    L_0x0050:
        r2 = r9;
        goto L_0x0057;
    L_0x0052:
        r9 = r5.mLiveShotResource;
        r9 = r9[r2];
        goto L_0x0050;
    L_0x0057:
        if (r8 == 0) goto L_0x005d;
    L_0x0059:
        r8 = 2131427894; // 0x7f0b0236 float:1.8477417E38 double:1.053065299E-314;
        goto L_0x0060;
    L_0x005d:
        r8 = 2131427895; // 0x7f0b0237 float:1.847742E38 double:1.0530652995E-314;
    L_0x0060:
        goto L_0x0243;
    L_0x0062:
        r8 = com.android.camera.CameraSettings.isUltraWideConfigOpen();
        if (r8 == 0) goto L_0x006e;
    L_0x0068:
        r9 = r5.mUltraWideResource;
        r9 = r9[r1];
    L_0x006c:
        r2 = r9;
        goto L_0x0073;
    L_0x006e:
        r9 = r5.mUltraWideResource;
        r9 = r9[r2];
        goto L_0x006c;
    L_0x0073:
        if (r8 == 0) goto L_0x0079;
    L_0x0075:
        r8 = 2131427898; // 0x7f0b023a float:1.8477425E38 double:1.053065301E-314;
        goto L_0x007c;
    L_0x0079:
        r8 = 2131427899; // 0x7f0b023b float:1.8477427E38 double:1.0530653015E-314;
    L_0x007c:
        goto L_0x0243;
    L_0x007e:
        r2 = r5.getFPS960ImageResource(r8);
        r8 = com.android.camera.data.DataRepository.dataItemConfig();
        r8 = r8.getComponentConfigSlowMotion();
        r8 = r8.getContentDesc();
        goto L_0x0243;
    L_0x0090:
        r9 = com.android.camera.data.DataRepository.dataItemRunning();
        r9 = r9.getComponentRunningLighting();
        r8 = r9.isSwitchOn(r8);
        if (r8 == 0) goto L_0x00a3;
    L_0x009e:
        r8 = r5.mLightingResource;
        r8 = r8[r1];
        goto L_0x00a7;
    L_0x00a3:
        r8 = r5.mLightingResource;
        r8 = r8[r2];
    L_0x00a7:
        if (r10 == 0) goto L_0x01eb;
    L_0x00a9:
        r9 = r10.isShowLightingView();
        if (r9 == 0) goto L_0x00b4;
    L_0x00af:
        r2 = 2131427582; // 0x7f0b00fe float:1.8476784E38 double:1.053065145E-314;
        goto L_0x01eb;
    L_0x00b4:
        r2 = 2131427581; // 0x7f0b00fd float:1.8476782E38 double:1.0530651444E-314;
        goto L_0x01eb;
    L_0x00b9:
        r2 = r5.getHFRImageResource(r8);
        r8 = r5.getHFRContentDesc(r8);
        goto L_0x0243;
    L_0x00c3:
        r8 = com.android.camera.CameraSettings.getAiSceneOpen();
        if (r8 == 0) goto L_0x00cf;
    L_0x00c9:
        r8 = r5.mAiSceneResources;
        r8 = r8[r1];
    L_0x00cd:
        r2 = r8;
        goto L_0x00d4;
    L_0x00cf:
        r8 = r5.mAiSceneResources;
        r8 = r8[r2];
        goto L_0x00cd;
    L_0x00d4:
        r8 = com.android.camera.CameraSettings.getAiSceneOpen();
        if (r8 == 0) goto L_0x00de;
    L_0x00da:
        r8 = 2131427555; // 0x7f0b00e3 float:1.847673E38 double:1.0530651315E-314;
        goto L_0x00e1;
    L_0x00de:
        r8 = 2131427556; // 0x7f0b00e4 float:1.8476732E38 double:1.053065132E-314;
    L_0x00e1:
        goto L_0x0243;
    L_0x00e3:
        r2 = r5.getFocusPeakImageResource();
        r8 = 2131427560; // 0x7f0b00e8 float:1.847674E38 double:1.053065134E-314;
        goto L_0x0243;
    L_0x00ec:
        return r2;
    L_0x00ed:
        r2 = r5.getMoreResources();
        r8 = 2131427557; // 0x7f0b00e5 float:1.8476734E38 double:1.0530651325E-314;
        goto L_0x0243;
    L_0x00f6:
        if (r11 == 0) goto L_0x010d;
    L_0x00f8:
        r9 = com.android.camera.data.DataRepository.getInstance();
        r9 = r9.backUp();
        r11 = com.android.camera.data.DataRepository.dataItemGlobal();
        r11 = r11.getCurrentCameraId();
        r8 = r9.getBackupFilter(r8, r11);
        goto L_0x0119;
    L_0x010d:
        r9 = com.android.camera.data.DataRepository.dataItemRunning();
        r9 = r9.getComponentConfigFilter();
        r8 = r9.getComponentValue(r8);
    L_0x0119:
        r8 = java.lang.Integer.parseInt(r8);
        r9 = com.android.camera.effect.FilterInfo.FILTER_ID_NONE;
        if (r8 == r9) goto L_0x0129;
    L_0x0121:
        if (r8 > 0) goto L_0x0124;
    L_0x0123:
        goto L_0x0129;
    L_0x0124:
        r8 = r5.mFilterResources;
        r8 = r8[r1];
        goto L_0x012d;
    L_0x0129:
        r8 = r5.mFilterResources;
        r8 = r8[r2];
    L_0x012d:
        if (r10 == 0) goto L_0x01eb;
    L_0x012f:
        r9 = r10.isShowFilterView();
        if (r9 == 0) goto L_0x013a;
    L_0x0135:
        r2 = 2131427554; // 0x7f0b00e2 float:1.8476728E38 double:1.053065131E-314;
        goto L_0x01eb;
    L_0x013a:
        r2 = 2131427553; // 0x7f0b00e1 float:1.8476725E38 double:1.0530651305E-314;
        goto L_0x01eb;
    L_0x013f:
        r2 = r5.getPortraitResources();
        r8 = 2131427559; // 0x7f0b00e7 float:1.8476738E38 double:1.0530651335E-314;
        goto L_0x0243;
    L_0x0148:
        r9 = r9.getComponentHdr();
        r10 = r9.isEmpty();
        if (r10 != 0) goto L_0x0189;
    L_0x0152:
        r10 = r9.getValueSelectedDrawableIgnoreClose(r8);
        r3 = r9.getValueSelectedStringIdIgnoreClose(r8);
        if (r11 != 0) goto L_0x0185;
    L_0x015c:
        r8 = r9.getComponentValue(r8);
        r9 = "on";
        r9 = r9.equals(r8);
        if (r9 != 0) goto L_0x0181;
    L_0x0168:
        r9 = "normal";
        r9 = r9.equals(r8);
        if (r9 == 0) goto L_0x0171;
    L_0x0170:
        goto L_0x0181;
    L_0x0171:
        r9 = "live";
        r8 = r9.equals(r8);
        if (r8 == 0) goto L_0x017d;
    L_0x0179:
        r5.alertHDR(r2, r1, r2);
        goto L_0x0184;
    L_0x017d:
        r5.alertHDR(r0, r2, r2);
        goto L_0x0184;
    L_0x0181:
        r5.alertHDR(r2, r2, r2);
    L_0x0185:
        r2 = r10;
    L_0x0186:
        r8 = r3;
        goto L_0x0243;
    L_0x0189:
        r8 = r2;
        goto L_0x0243;
    L_0x018c:
        r9 = r9.getComponentFlash();
        r10 = r9.isEmpty();
        if (r10 != 0) goto L_0x01ca;
    L_0x0196:
        r10 = r9.getValueSelectedDrawableIgnoreClose(r8);
        r3 = r9.getValueSelectedStringIdIgnoreClose(r8);
        if (r11 != 0) goto L_0x01c8;
    L_0x01a0:
        r8 = r9.getComponentValue(r8);
        r9 = "1";
        r9 = r9.equals(r8);
        if (r9 != 0) goto L_0x01c5;
    L_0x01ac:
        r9 = "101";
        r9 = r9.equals(r8);
        if (r9 == 0) goto L_0x01b5;
    L_0x01b4:
        goto L_0x01c5;
    L_0x01b5:
        r9 = "2";
        r8 = r9.equals(r8);
        if (r8 == 0) goto L_0x01c1;
    L_0x01bd:
        r5.alertFlash(r2, r1, r2);
        goto L_0x01c8;
    L_0x01c1:
        r5.alertFlash(r0, r2, r2);
        goto L_0x01c8;
    L_0x01c5:
        r5.alertFlash(r2, r2, r2);
    L_0x01c8:
        r2 = r10;
        goto L_0x01cb;
    L_0x01ca:
        r3 = r2;
    L_0x01cb:
        r8 = r5.mSupportedConfigs;
        r8 = r8.findConfigItem(r6);
        r9 = r8.enable;
        r7.setEnabled(r9);
        r8 = r8.enable;
        if (r8 != 0) goto L_0x01e1;
    L_0x01da:
        r8 = 1058642330; // 0x3f19999a float:0.6 double:5.230388065E-315;
        r7.setAlpha(r8);
        goto L_0x0186;
    L_0x01e1:
        r8 = 1065353216; // 0x3f800000 float:1.0 double:5.263544247E-315;
        r7.setAlpha(r8);
        goto L_0x0186;
    L_0x01e7:
        r8 = r5.mLiveMusicSelectResources;
        r8 = r8[r2];
    L_0x01eb:
        r4 = r2;
        r2 = r8;
        r8 = r4;
        goto L_0x0243;
    L_0x01ef:
        r8 = com.android.camera.CameraSettings.isVideoBokehOn();
        r9 = "FragmentTopConfig";
        r10 = new java.lang.StringBuilder;
        r10.<init>();
        r11 = "setTopImageResource: VIDEO_BOKEH isSwitchOn = ";
        r10.append(r11);
        r10.append(r8);
        r10 = r10.toString();
        com.android.camera.log.Log.d(r9, r10);
        if (r8 == 0) goto L_0x0211;
    L_0x020b:
        r9 = r5.mVideoBokehResource;
        r9 = r9[r1];
    L_0x020f:
        r2 = r9;
        goto L_0x0216;
    L_0x0211:
        r9 = r5.mVideoBokehResource;
        r9 = r9[r2];
        goto L_0x020f;
    L_0x0216:
        if (r8 == 0) goto L_0x021c;
    L_0x0218:
        r8 = 2131427846; // 0x7f0b0206 float:1.847732E38 double:1.0530652753E-314;
        goto L_0x021f;
    L_0x021c:
        r8 = 2131427847; // 0x7f0b0207 float:1.8477322E38 double:1.053065276E-314;
    L_0x021f:
        goto L_0x0243;
    L_0x0220:
        r2 = r5.getSettingResources();
        r8 = 2131427558; // 0x7f0b00e6 float:1.8476736E38 double:1.053065133E-314;
        goto L_0x0243;
    L_0x0228:
        r8 = com.android.camera.CameraSettings.isUltraPixelPhotographyOn();
        if (r8 == 0) goto L_0x0234;
    L_0x022e:
        r9 = r5.mUltraPixelPhotographyResources;
        r9 = r9[r1];
    L_0x0232:
        r2 = r9;
        goto L_0x0239;
    L_0x0234:
        r9 = r5.mUltraPixelPhotographyResources;
        r9 = r9[r2];
        goto L_0x0232;
    L_0x0239:
        if (r8 == 0) goto L_0x023f;
    L_0x023b:
        r8 = 2131427912; // 0x7f0b0248 float:1.8477454E38 double:1.053065308E-314;
        goto L_0x0242;
    L_0x023f:
        r8 = 2131427913; // 0x7f0b0249 float:1.8477456E38 double:1.0530653084E-314;
    L_0x0243:
        if (r7 == 0) goto L_0x02a1;
    L_0x0245:
        if (r2 <= 0) goto L_0x02a1;
    L_0x0247:
        r9 = r5.getResources();
        r9 = r9.getDrawable(r2);
        r6 = r5.getInitialMargin(r6);
        r10 = 2131558407; // 0x7f0d0007 float:1.8742129E38 double:1.053129781E-314;
        r11 = java.lang.Integer.valueOf(r6);
        r7.setTag(r10, r11);
        if (r6 <= 0) goto L_0x0289;
        r10 = r7.getLayoutParams();
        r10 = (android.widget.FrameLayout.LayoutParams) r10;
        r11 = r9.getIntrinsicWidth();
        r11 = r11 / 2;
        r0 = r5.mViewPadding;
        r11 = r11 + r0;
        r6 = r6 - r11;
        r11 = r5.mIsRTL;
        if (r11 == 0) goto L_0x0284;
    L_0x0274:
        r11 = r5.mTotalWidth;
        r11 = r11 - r6;
        r6 = r9.getIntrinsicWidth();
        r11 = r11 - r6;
        r6 = r5.mViewPadding;
        r6 = r6 * 2;
        r11 = r11 - r6;
        r10.leftMargin = r11;
        goto L_0x0286;
    L_0x0284:
        r10.leftMargin = r6;
    L_0x0286:
        r7.setLayoutParams(r10);
    L_0x0289:
        r7.setImageDrawable(r9);
        if (r8 <= 0) goto L_0x02a1;
    L_0x028e:
        r6 = com.android.camera.Util.isAccessible();
        if (r6 != 0) goto L_0x029a;
    L_0x0294:
        r6 = com.android.camera.Util.isSetContentDesc();
        if (r6 == 0) goto L_0x02a1;
    L_0x029a:
        r6 = r5.getString(r8);
        r7.setContentDescription(r6);
    L_0x02a1:
        return r1;
        */
        throw new UnsupportedOperationException("Method not decompiled: com.android.camera.fragment.top.FragmentTopConfig.setTopImageResource(int, android.widget.ImageView, int, com.android.camera.data.data.config.DataItemConfig, int, boolean):boolean");
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
    public void provideAnimateElement(int r20, java.util.List<io.reactivex.Completable> r21, boolean r22) {
        /*
        r19 = this;
        r7 = r19;
        r8 = r20;
        r9 = r21;
        r0 = r7.mCurrentMode;
        if (r0 == r8) goto L_0x000e;
    L_0x000a:
        r0 = r7.mCurrentMode;
        r7.mBeforeMode = r0;
    L_0x000e:
        r10 = r7.mCurrentMode;
        super.provideAnimateElement(r20, r21, r22);
        r11 = 1;
        r12 = 0;
        switch(r10) {
            case 161: goto L_0x0029;
            case 162: goto L_0x001d;
            default: goto L_0x0019;
        };
    L_0x0019:
        switch(r10) {
            case 168: goto L_0x001d;
            case 169: goto L_0x001d;
            case 170: goto L_0x001d;
            default: goto L_0x001c;
        };
    L_0x001c:
        goto L_0x0030;
    L_0x001d:
        r0 = 162; // 0xa2 float:2.27E-43 double:8.0E-322;
        if (r8 == r0) goto L_0x0026;
    L_0x0021:
        switch(r8) {
            case 168: goto L_0x0026;
            case 169: goto L_0x0026;
            case 170: goto L_0x0026;
            default: goto L_0x0024;
        };
    L_0x0024:
        r0 = r11;
        goto L_0x0028;
        r0 = r12;
    L_0x0028:
        goto L_0x0031;
    L_0x0029:
        r0 = 161; // 0xa1 float:2.26E-43 double:7.95E-322;
        if (r8 != r0) goto L_0x0030;
        r0 = r12;
        goto L_0x0031;
    L_0x0030:
        r0 = r11;
    L_0x0031:
        if (r0 == 0) goto L_0x0037;
    L_0x0033:
        r0 = 4;
        r7.onBackEvent(r0);
    L_0x0037:
        r0 = r19.getTopAlert();
        if (r0 == 0) goto L_0x0040;
    L_0x003d:
        r0.provideAnimateElement(r8, r9, r12);
    L_0x0040:
        r13 = com.android.camera.data.DataRepository.dataItemConfig();
        r0 = com.android.camera.data.DataRepository.dataItemGlobal();
        r0 = r0.getCurrentCameraId();
        r1 = com.android.camera.module.loader.camera2.Camera2DataContainer.getInstance();
        r2 = r7.mCurrentMode;
        r1 = r1.getCapabilitiesByBogusCameraId(r0, r2);
        if (r1 != 0) goto L_0x0059;
    L_0x0058:
        return;
    L_0x0059:
        r2 = r7.mCurrentMode;
        r3 = com.android.camera.data.DataRepository.dataItemGlobal();
        r3 = r3.isNormalIntent();
        r0 = com.android.camera.data.data.config.SupportedConfigFactory.getSupportedTopConfigs(r2, r13, r0, r1, r3);
        r7.mSupportedConfigs = r0;
        r14 = r12;
    L_0x006a:
        r0 = r7.mConfigViews;
        r0 = r0.size();
        if (r14 >= r0) goto L_0x012a;
    L_0x0072:
        r0 = r7.mConfigViews;
        r0 = r0.get(r14);
        r15 = r0;
        r15 = (android.widget.ImageView) r15;
        r15.setEnabled(r11);
        r6 = 2131558407; // 0x7f0d0007 float:1.8742129E38 double:1.053129781E-314;
        r16 = r15.getTag(r6);
        if (r16 == 0) goto L_0x0091;
    L_0x0087:
        r0 = r16;
        r0 = (java.lang.Integer) r0;
        r0 = r0.intValue();
        r5 = r0;
        goto L_0x0093;
        r5 = r12;
    L_0x0093:
        r0 = r7.mSupportedConfigs;
        r4 = r0.getConfigTypeForViewPosition(r14);
        if (r9 == 0) goto L_0x009e;
    L_0x009b:
        r17 = r11;
        goto L_0x00a0;
    L_0x009e:
        r17 = r12;
    L_0x00a0:
        r0 = r7;
        r1 = r4;
        r2 = r15;
        r3 = r8;
        r11 = r4;
        r4 = r13;
        r12 = r5;
        r5 = r14;
        r8 = r6;
        r6 = r17;
        r0 = r0.setTopImageResource(r1, r2, r3, r4, r5, r6);
        if (r0 == 0) goto L_0x00c3;
    L_0x00b2:
        if (r16 == 0) goto L_0x00c3;
    L_0x00b4:
        r1 = r15.getTag(r8);
        r1 = (java.lang.Integer) r1;
        r1 = r1.intValue();
        if (r12 != r1) goto L_0x00c1;
    L_0x00c0:
        goto L_0x00c3;
    L_0x00c1:
        r1 = 0;
        goto L_0x00c4;
    L_0x00c3:
        r1 = 1;
    L_0x00c4:
        r2 = r15.getTag();
        if (r2 == 0) goto L_0x00d9;
    L_0x00ca:
        r2 = r15.getTag();
        r2 = (java.lang.Integer) r2;
        r2 = r2.intValue();
        if (r2 != r11) goto L_0x00d9;
    L_0x00d6:
        if (r1 == 0) goto L_0x00d9;
    L_0x00d8:
        goto L_0x0122;
    L_0x00d9:
        r1 = java.lang.Integer.valueOf(r11);
        r15.setTag(r1);
        if (r9 != 0) goto L_0x00ec;
    L_0x00e2:
        if (r0 == 0) goto L_0x00e8;
    L_0x00e4:
        com.android.camera.animation.type.AlphaInOnSubscribe.directSetResult(r15);
        goto L_0x0122;
    L_0x00e8:
        com.android.camera.animation.type.AlphaOutOnSubscribe.directSetResult(r15);
        goto L_0x0122;
    L_0x00ec:
        r1 = 150; // 0x96 float:2.1E-43 double:7.4E-322;
        if (r0 == 0) goto L_0x0105;
    L_0x00f0:
        r0 = new com.android.camera.animation.type.AlphaInOnSubscribe;
        r0.<init>(r15);
        r2 = r0.setStartDelayTime(r1);
        r2.setDurationTime(r1);
        r0 = io.reactivex.Completable.create(r0);
        r9.add(r0);
        goto L_0x0122;
    L_0x0105:
        r0 = 165; // 0xa5 float:2.31E-43 double:8.15E-322;
        if (r10 == r0) goto L_0x011f;
    L_0x0109:
        r2 = r7.mCurrentMode;
        if (r2 != r0) goto L_0x010e;
    L_0x010d:
        goto L_0x011f;
    L_0x010e:
        r0 = new com.android.camera.animation.type.AlphaOutOnSubscribe;
        r0.<init>(r15);
        r0 = r0.setDurationTime(r1);
        r0 = io.reactivex.Completable.create(r0);
        r9.add(r0);
        goto L_0x0122;
    L_0x011f:
        com.android.camera.animation.type.AlphaOutOnSubscribe.directSetResult(r15);
    L_0x0122:
        r14 = r14 + 1;
        r8 = r20;
        r11 = 1;
        r12 = 0;
        goto L_0x006a;
    L_0x012a:
        return;
        */
        throw new UnsupportedOperationException("Method not decompiled: com.android.camera.fragment.top.FragmentTopConfig.provideAnimateElement(int, java.util.List, boolean):void");
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
