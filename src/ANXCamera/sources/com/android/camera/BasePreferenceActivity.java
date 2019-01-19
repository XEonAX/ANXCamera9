package com.android.camera;

import android.content.Intent;
import android.content.SharedPreferences;
import android.content.SharedPreferences.Editor;
import android.os.AsyncTask;
import android.os.Bundle;
import android.preference.CheckBoxPreference;
import android.preference.ListPreference;
import android.preference.Preference;
import android.preference.Preference.OnPreferenceChangeListener;
import android.preference.Preference.OnPreferenceClickListener;
import android.preference.PreferenceGroup;
import android.preference.PreferenceScreen;
import android.provider.MiuiSettings;
import android.provider.MiuiSettings.Key;
import android.provider.Settings.Secure;
import android.provider.Settings.System;
import android.text.TextUtils;
import android.view.MenuItem;
import android.widget.Toast;
import com.android.camera.constant.BeautyConstant;
import com.android.camera.data.DataRepository;
import com.android.camera.data.data.config.DataItemConfig;
import com.android.camera.data.data.global.DataItemGlobal;
import com.android.camera.lib.compatibility.util.CompatibilityUtils.PackageInstallerListener;
import com.android.camera.log.Log;
import com.android.camera.preferences.CameraSettingPreferences;
import com.android.camera.statistic.CameraStatUtil;
import com.android.camera.storage.PriorityStorageBroadcastReceiver;
import com.android.camera.storage.Storage;
import com.android.camera.ui.PreviewListPreference;
import com.mi.config.b;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Iterator;
import java.util.List;
import miui.preference.PreferenceActivity;

public abstract class BasePreferenceActivity extends PreferenceActivity implements OnPreferenceChangeListener, OnPreferenceClickListener {
    public static final String FROM_WHERE = "from_where";
    private static final String PREF_KEY_PRIVACY = "pref_privacy";
    private static final String PREF_KEY_RESTORE = "pref_restore";
    public static final String REMOVE_KEYS = "remove_keys";
    private static final String TAG = BasePreferenceActivity.class.getSimpleName();
    private PackageInstallerListener mAppInstalledListener = new PackageInstallerListener() {
        public void onPackageInstalled(String str, boolean z) {
            if (z && TextUtils.equals(str, "com.xiaomi.scanner")) {
                final CheckBoxPreference checkBoxPreference = (CheckBoxPreference) BasePreferenceActivity.this.mPreferenceGroup.findPreference(CameraSettings.KEY_SCAN_QRCODE);
                if (checkBoxPreference != null) {
                    BasePreferenceActivity.this.runOnUiThread(new Runnable() {
                        public void run() {
                            checkBoxPreference.setChecked(true);
                            BasePreferenceActivity.this.onPreferenceChange(checkBoxPreference, Boolean.TRUE);
                        }
                    });
                }
            }
        }
    };
    private int mFromWhere;
    private boolean mGoToActivity;
    private boolean mHasReset;
    protected PreferenceScreen mPreferenceGroup;
    protected CameraSettingPreferences mPreferences;

    protected abstract int getPreferenceXml();

    protected abstract void onSettingChanged(int i);

    public void onCreate(Bundle bundle) {
        super.onCreate(bundle);
        Util.updateCountryIso(this);
        this.mFromWhere = getIntent().getIntExtra(FROM_WHERE, 0);
        this.mPreferences = CameraSettingPreferences.instance();
        CameraSettings.upgradeGlobalPreferences();
        Storage.initStorage(this);
        initializeActivity();
        if (getIntent().getBooleanExtra("StartActivityWhenLocked", false)) {
            getWindow().addFlags(524288);
        }
    }

    protected void onResume() {
        super.onResume();
        updateQRCodeEntry();
        if (Util.isLabOptionsVisible()) {
            Toast.makeText(this, R.string.camera_facedetection_sub_option_hint, 1).show();
        }
    }

    private void initializeActivity() {
        this.mPreferenceGroup = getPreferenceScreen();
        if (this.mPreferenceGroup != null) {
            this.mPreferenceGroup.removeAll();
        }
        addPreferencesFromResource(getPreferenceXml());
        this.mPreferenceGroup = getPreferenceScreen();
        if (this.mPreferenceGroup == null) {
            Log.e(TAG, "fail to init PreferenceGroup");
            finish();
        }
        registerListener();
        filterByCloud();
        filterByPreference();
        filterByFrom();
        filterByDeviceID();
        filterByDeviceCapability();
        filterByIntent();
        filterByConfig();
        filterGroup();
        updateEntries();
        updatePreferences(this.mPreferenceGroup, this.mPreferences);
        updateConflictPreference(null);
    }

    private void filterByConfig() {
        Log.d(TAG, "filterByConfig:");
        Preference findPreference = this.mPreferenceGroup.findPreference(CameraSettings.KEY_CATEGORY_DEVICE_SETTING);
        Preference findPreference2 = this.mPreferenceGroup.findPreference(CameraSettings.KEY_CATEGORY_CAPTURE_SETTING);
        if (this.mFromWhere == 161 || this.mFromWhere == 174 || this.mFromWhere == 169 || this.mFromWhere == 168 || this.mFromWhere == 172 || this.mFromWhere == 170) {
            removeFromGroup(findPreference, CameraSettings.KEY_FRONT_MIRROR);
            removeFromGroup(findPreference2, CameraSettings.KEY_FRONT_MIRROR);
            return;
        }
        boolean fr = DataRepository.dataItemFeature().fr();
        String str = TAG;
        StringBuilder stringBuilder = new StringBuilder();
        stringBuilder.append("filterByConfig: isSupportVideoFrontMirror = ");
        stringBuilder.append(fr);
        Log.d(str, stringBuilder.toString());
        if (fr) {
            removeFromGroup(findPreference2, CameraSettings.KEY_FRONT_MIRROR);
        } else {
            removeFromGroup(findPreference, CameraSettings.KEY_FRONT_MIRROR);
        }
    }

    private void removeFromGroup(Preference preference, String str) {
        if (preference != null && (preference instanceof PreferenceGroup)) {
            PreferenceGroup preferenceGroup = (PreferenceGroup) preference;
            if (preferenceGroup.getPreferenceCount() > 0) {
                removePreference(preferenceGroup, str);
            }
        }
    }

    private void filterByPreference() {
        PreviewListPreference previewListPreference = (PreviewListPreference) this.mPreferenceGroup.findPreference(CameraSettings.KEY_VIDEO_QUALITY);
        if (previewListPreference != null) {
            List supportedVideoQuality = CameraSettings.getSupportedVideoQuality(this.mFromWhere);
            filterUnsupportedOptions(this.mPreferenceGroup, previewListPreference, supportedVideoQuality);
            previewListPreference = (PreviewListPreference) this.mPreferenceGroup.findPreference(CameraSettings.KEY_VIDEO_QUALITY_EXTRA);
            if (previewListPreference == null || this.mFromWhere != 162 || (!CameraSettings.isVideoBokehOn() && TextUtils.equals(CameraSettings.getFaceBeautifyValue(), BeautyConstant.LEVEL_CLOSE))) {
                removePreference(this.mPreferenceGroup, CameraSettings.KEY_VIDEO_QUALITY_EXTRA);
            } else {
                supportedVideoQuality.clear();
                supportedVideoQuality.add(String.valueOf(5));
                removePreference(this.mPreferenceGroup, CameraSettings.KEY_VIDEO_QUALITY);
                previewListPreference.filterUnsupported(supportedVideoQuality);
                resetIfInvalid(previewListPreference);
                previewListPreference.setEnabled(false);
            }
        }
        previewListPreference = (PreviewListPreference) this.mPreferenceGroup.findPreference(CameraSettings.KEY_VIDEO_HIGH_FRAME_RATE);
        if (previewListPreference != null) {
            filterUnsupportedOptions(this.mPreferenceGroup, previewListPreference, CameraSettings.getSupportedHfrSettings(CameraSettings.getCameraId(this.mFromWhere)));
        }
        String videoSpeed = DataRepository.dataItemRunning().getVideoSpeed();
        if ((b.qj && !"normal".equals(videoSpeed)) || b.hS()) {
            removePreference(this.mPreferenceGroup, CameraSettings.KEY_MOVIE_SOLID);
        }
        if (!Util.isLabOptionsVisible()) {
            removePreference(this.mPreferenceGroup, CameraSettings.KEY_FACE_DETECTION);
            removePreference(this.mPreferenceGroup, CameraSettings.KEY_CAMERA_PORTRAIT_WITH_FACEBEAUTY);
            removePreference(this.mPreferenceGroup, CameraSettings.KEY_CAMERA_FACE_DETECTION_AUTO_HIDDEN);
            removePreference(this.mPreferenceGroup, CameraSettings.KEY_CAMERA_DUAL_ENABLE);
            removePreference(this.mPreferenceGroup, CameraSettings.KEY_CAMERA_DUAL_SAT_ENABLE);
            removePreference(this.mPreferenceGroup, CameraSettings.KEY_CAMERA_MFNR_SAT_ENABLE);
            removePreference(this.mPreferenceGroup, CameraSettings.KEY_CAMERA_SR_ENABLE);
            removePreference(this.mPreferenceGroup, CameraSettings.KEY_CAMERA_PARALLEL_PROCESS_ENABLE);
            removePreference(this.mPreferenceGroup, CameraSettings.KEY_LIVE_STICKER_INTERNAL);
        }
        if (!DataRepository.dataItemFeature().fE()) {
            removeFromGroup(this.mPreferenceGroup, "user_define_watermark");
        }
    }

    private void filterByDeviceCapability() {
        if (this.mFromWhere == 172) {
            boolean isSlowMotionFps960 = DataRepository.dataItemConfig().getComponentConfigSlowMotion().isSlowMotionFps960();
            boolean isSlowMotionFps120 = DataRepository.dataItemConfig().getComponentConfigSlowMotion().isSlowMotionFps120();
            PreviewListPreference previewListPreference = (PreviewListPreference) this.mPreferenceGroup.findPreference(CameraSettings.KEY_VIDEO_NEW_SLOW_MOTION);
            if (CameraSettings.getSupportedHfrSettings(0).contains(CameraSettings.SIZE_FPS_1080_240) || isSlowMotionFps120) {
                filterUnsupportedOptions(this.mPreferenceGroup, previewListPreference, Arrays.asList(getResources().getStringArray(R.array.pref_video_new_slow_motion_entryvalues)));
                previewListPreference.setEnabled(true);
            } else {
                int i;
                previewListPreference.filterUnsupported(Arrays.asList(new String[]{String.valueOf(5)}));
                resetIfInvalid(previewListPreference);
                if (isSlowMotionFps960) {
                    i = R.string.pref_new_slow_motion_video_quality_960_720only;
                } else {
                    i = R.string.pref_new_slow_motion_video_quality_240_720only;
                }
                previewListPreference.setSummary(i);
                previewListPreference.setEnabled(false);
            }
        }
        if (DataRepository.dataItemFeature().fs()) {
            removePreference(this.mPreferenceGroup, CameraSettings.KEY_VIDEO_HIGH_FRAME_RATE);
        } else {
            removePreference(this.mPreferenceGroup, CameraSettings.KEY_VIDEO_NEW_SLOW_MOTION);
        }
    }

    private void filterByCloud() {
        for (String removePreference : DataRepository.dataCloudMgr().DataCloudFeature().getAllDisabledFeatures()) {
            removePreference(this.mPreferenceGroup, removePreference);
        }
    }

    private void registerListener() {
        registerListener(this.mPreferenceGroup, this);
        Preference findPreference = this.mPreferenceGroup.findPreference(PREF_KEY_RESTORE);
        if (findPreference != null) {
            findPreference.setOnPreferenceClickListener(this);
        }
        findPreference = this.mPreferenceGroup.findPreference(PREF_KEY_PRIVACY);
        if (findPreference != null) {
            findPreference.setOnPreferenceClickListener(this);
        }
        findPreference = this.mPreferenceGroup.findPreference(CameraSettings.KEY_PRIORITY_STORAGE);
        if (findPreference != null) {
            findPreference.setOnPreferenceClickListener(this);
        }
        findPreference = this.mPreferenceGroup.findPreference(CameraSettings.KEY_FACE_DETECTION);
        if (findPreference != null) {
            findPreference.setOnPreferenceClickListener(this);
        }
        findPreference = this.mPreferenceGroup.findPreference(CameraSettings.KEY_SCAN_QRCODE);
        if (findPreference != null) {
            findPreference.setOnPreferenceClickListener(this);
        }
        findPreference = this.mPreferenceGroup.findPreference("user_define_watermark");
        if (findPreference != null) {
            findPreference.setOnPreferenceClickListener(this);
        }
    }

    private void filterByFrom() {
        if (this.mFromWhere == 163 || this.mFromWhere == 165 || this.mFromWhere == 166 || this.mFromWhere == 167 || this.mFromWhere == 173 || this.mFromWhere == 171) {
            removePreference(this.mPreferenceGroup, CameraSettings.KEY_VOLUME_VIDEO_FUNCTION);
            removePreference(this.mPreferenceGroup, CameraSettings.KEY_VOLUME_LIVE_FUNCTION);
            removePreference(this.mPreferenceGroup, CameraSettings.KEY_CATEGORY_CAMCORDER_SETTING);
            removePreference(this.mPreferenceGroup, CameraSettings.KEY_VIDEO_AUTOEXPOSURE);
        } else if (this.mFromWhere == 161 || this.mFromWhere == 174 || this.mFromWhere == 162 || this.mFromWhere == 169 || this.mFromWhere == 168 || this.mFromWhere == 172 || this.mFromWhere == 170) {
            if (this.mFromWhere == 174) {
                removePreference(this.mPreferenceGroup, CameraSettings.KEY_VOLUME_VIDEO_FUNCTION);
            } else {
                removePreference(this.mPreferenceGroup, CameraSettings.KEY_VOLUME_LIVE_FUNCTION);
            }
            removePreference(this.mPreferenceGroup, CameraSettings.KEY_VOLUME_CAMERA_FUNCTION);
            removeNonVideoPreference();
            removeIncompatibleVideoPreference();
            removePreference(this.mPreferenceGroup, CameraSettings.KEY_AUTOEXPOSURE);
        }
        if (this.mFromWhere == 161 || this.mFromWhere == 174 || this.mFromWhere == 162 || this.mFromWhere == 169 || this.mFromWhere == 168 || this.mFromWhere == 170 || this.mFromWhere == 172 || this.mFromWhere == 166) {
            removeIncompatibleAdvancePreference();
        }
    }

    private void removeNonVideoPreference() {
        removePreference(this.mPreferenceGroup, CameraSettings.KEY_CATEGORY_CAPTURE_SETTING);
    }

    private void removeIncompatibleVideoPreference() {
        if (this.mFromWhere == 172) {
            removePreference(this.mPreferenceGroup, CameraSettings.KEY_VIDEO_QUALITY);
        } else if (this.mFromWhere == 161 || this.mFromWhere == 174) {
            removePreference(this.mPreferenceGroup, CameraSettings.KEY_VIDEO_QUALITY);
            removePreference(this.mPreferenceGroup, CameraSettings.KEY_VIDEO_NEW_SLOW_MOTION);
        } else {
            removePreference(this.mPreferenceGroup, CameraSettings.KEY_VIDEO_NEW_SLOW_MOTION);
        }
    }

    private void removeIncompatibleAdvancePreference() {
        removePreference(this.mPreferenceGroup, CameraSettings.KEY_QC_CONTRAST);
        removePreference(this.mPreferenceGroup, CameraSettings.KEY_QC_SATURATION);
        removePreference(this.mPreferenceGroup, CameraSettings.KEY_QC_SHARPNESS);
    }

    private void filterByDeviceID() {
        DataRepository.dataItemFeature();
        if (!b.gq()) {
            removePreference(this.mPreferenceGroup, CameraSettings.KEY_VIDEO_HIGH_FRAME_RATE);
        }
        removePreference(this.mPreferenceGroup, CameraSettings.KEY_LONG_PRESS_SHUTTER);
        if (!b.fS()) {
            removePreference(this.mPreferenceGroup, CameraSettings.KEY_MOVIE_SOLID);
        }
        if (!b.ge()) {
            removePreference(this.mPreferenceGroup, "pref_watermark_key");
        }
        if (!CameraSettings.isSupportedDualCameraWaterMark()) {
            removePreference(this.mPreferenceGroup, "pref_dualcamera_watermark");
        }
        if (!b.fW()) {
            removePreference(this.mPreferenceGroup, CameraSettings.KEY_CAMERA_SOUND);
        }
        if (!b.gb()) {
            removePreference(this.mPreferenceGroup, CameraSettings.KEY_RECORD_LOCATION);
        }
        if (b.isPad() || (b.pN && CameraSettings.isFrontCamera())) {
            removePreference(this.mPreferenceGroup, "pref_camera_picturesize_key");
        }
        if (!Storage.hasSecondaryStorage()) {
            removePreference(this.mPreferenceGroup, CameraSettings.KEY_PRIORITY_STORAGE);
        }
        if (!b.gr()) {
            removePreference(this.mPreferenceGroup, CameraSettings.KEY_AUTO_CHROMA_FLASH);
        }
        if (!b.fY()) {
            removePreference(this.mPreferenceGroup, CameraSettings.KEY_LONG_PRESS_SHUTTER_FEATURE);
        }
        if (!b.gs()) {
            removePreference(this.mPreferenceGroup, CameraSettings.KEY_CAPTURE_WHEN_STABLE);
        }
        if (!b.gC()) {
            removePreference(this.mPreferenceGroup, CameraSettings.KEY_CAMERA_ASD_NIGHT);
        }
        if (!b.ha()) {
            removePreference(this.mPreferenceGroup, CameraSettings.KEY_CAMERA_SNAP);
        }
        if (!b.hs()) {
            removePreference(this.mPreferenceGroup, CameraSettings.KEY_CAMERA_GROUPSHOT_PRIMITIVE);
        }
        if (!CameraSettings.isSupportedPortrait()) {
            removePreference(this.mPreferenceGroup, CameraSettings.KEY_CAMERA_PORTRAIT_WITH_FACEBEAUTY);
        }
        if (!(b.isSupportedOpticalZoom() || b.isSupportedPortrait())) {
            removePreference(this.mPreferenceGroup, CameraSettings.KEY_CAMERA_DUAL_ENABLE);
        }
        if (!b.isSupportedOpticalZoom()) {
            removePreference(this.mPreferenceGroup, CameraSettings.KEY_CAMERA_DUAL_SAT_ENABLE);
        }
        if (!b.isSupportSuperResolution()) {
            removePreference(this.mPreferenceGroup, "pref_camera_super_resolution_key");
        }
        if (!CameraSettings.isSupportParallelProcess()) {
            removePreference(this.mPreferenceGroup, CameraSettings.KEY_CAMERA_PARALLEL_PROCESS_ENABLE);
        }
        if (b.gL()) {
            removePreference(this.mPreferenceGroup, CameraSettings.KEY_FACE_DETECTION);
            removePreference(this.mPreferenceGroup, CameraSettings.KEY_CAMERA_FACE_DETECTION_AUTO_HIDDEN);
            removePreference(this.mPreferenceGroup, CameraSettings.KEY_CAMERA_PARALLEL_PROCESS_ENABLE);
            removePreference(this.mPreferenceGroup, CameraSettings.KEY_CAMERA_DUAL_ENABLE);
            removePreference(this.mPreferenceGroup, CameraSettings.KEY_CAMERA_DUAL_SAT_ENABLE);
            removePreference(this.mPreferenceGroup, CameraSettings.KEY_FRONT_MIRROR);
            removePreference(this.mPreferenceGroup, CameraSettings.KEY_QC_SHARPNESS);
            removePreference(this.mPreferenceGroup, CameraSettings.KEY_QC_CONTRAST);
            removePreference(this.mPreferenceGroup, CameraSettings.KEY_QC_SATURATION);
            removePreference(this.mPreferenceGroup, CameraSettings.KEY_AUTOEXPOSURE);
        }
        if (!ProximitySensorLock.supported()) {
            removePreference(this.mPreferenceGroup, CameraSettings.KEY_CAMERA_PROXIMITY_LOCK);
        }
        if (!b.hE()) {
            removePreference(this.mPreferenceGroup, CameraSettings.KEY_FINGERPRINT_CAPTURE);
        }
        if (!CameraSettings.shouldNormalWideLDCBeVisibleInMode(this.mFromWhere) || CameraSettings.isUltraWideConfigOpen(this.mFromWhere) || CameraSettings.isRearMenuUltraPixelPhotographyOn() || CameraSettings.isUltraPixelPhotographyOn()) {
            removePreference(this.mPreferenceGroup, CameraSettings.KEY_NORMAL_WIDE_LDC);
        }
        if (!(CameraSettings.shouldUltraWideLDCBeVisibleInMode(this.mFromWhere) && CameraSettings.isUltraWideConfigOpen(this.mFromWhere))) {
            removePreference(this.mPreferenceGroup, CameraSettings.KEY_ULTRA_WIDE_LDC);
        }
        if (!CameraSettings.shouldUltraWideVideoLDCBeVisibleInMode(this.mFromWhere) || !CameraSettings.isUltraWideConfigOpen(this.mFromWhere)) {
            removePreference(this.mPreferenceGroup, CameraSettings.KEY_ULTRA_WIDE_VIDEO_LDC);
        }
    }

    public void filterUnsupportedOptions(PreferenceGroup preferenceGroup, PreviewListPreference previewListPreference, List<String> list) {
        if (list == null || list.size() <= 1) {
            removePreference(preferenceGroup, previewListPreference.getKey());
            return;
        }
        previewListPreference.filterUnsupported(list);
        if (previewListPreference.getEntries().length <= 1) {
            removePreference(preferenceGroup, previewListPreference.getKey());
        } else {
            resetIfInvalid(previewListPreference);
        }
    }

    private void resetIfInvalid(ListPreference listPreference) {
        if (listPreference.findIndexOfValue(listPreference.getValue()) == -1) {
            listPreference.setValueIndex(0);
        }
    }

    private void registerListener(PreferenceGroup preferenceGroup, OnPreferenceChangeListener onPreferenceChangeListener) {
        int preferenceCount = preferenceGroup.getPreferenceCount();
        for (int i = 0; i < preferenceCount; i++) {
            Preference preference = preferenceGroup.getPreference(i);
            if (preference instanceof PreferenceGroup) {
                registerListener((PreferenceGroup) preference, onPreferenceChangeListener);
            } else {
                preference.setOnPreferenceChangeListener(onPreferenceChangeListener);
            }
        }
    }

    public boolean onPreferenceClick(Preference preference) {
        if (preference.getKey().equals(PREF_KEY_RESTORE)) {
            RotateDialogController.showSystemAlertDialog(this, getString(R.string.confirm_restore_title), getString(R.string.confirm_restore_message), getString(17039370), new Runnable() {
                public void run() {
                    BasePreferenceActivity.this.restorePreferences();
                }
            }, getString(17039360), null);
            return true;
        } else if (preference.getKey().equals(PREF_KEY_PRIVACY)) {
            ActivityLauncher.launchPrivacyPolicyWebpage(this);
            return true;
        } else if (preference.getKey().equals("user_define_watermark")) {
            Intent intent = new Intent(this, UserDefineWatermarkActivity.class);
            if (getIntent().getBooleanExtra("StartActivityWhenLocked", false)) {
                intent.putExtra("StartActivityWhenLocked", true);
            }
            this.mGoToActivity = true;
            startActivity(intent);
            return true;
        } else {
            if (CameraSettings.KEY_PRIORITY_STORAGE.equals(preference.getKey())) {
                PriorityStorageBroadcastReceiver.setPriorityStorage(((CheckBoxPreference) preference).isChecked());
            } else if (CameraSettings.KEY_SCAN_QRCODE.equals(preference.getKey()) && !CameraSettings.isQRCodeReceiverAvailable(this)) {
                RotateDialogController.showSystemAlertDialog(this, getString(R.string.confirm_install_scanner_title), getString(R.string.confirm_install_scanner_message), getString(R.string.install_confirmed), new Runnable() {
                    public void run() {
                        BasePreferenceActivity.this.installQRCodeReceiver();
                    }
                }, getString(17039360), null);
                return true;
            }
            return false;
        }
    }

    private void installQRCodeReceiver() {
        new AsyncTask<Void, Void, Void>() {
            protected Void doInBackground(Void... voidArr) {
                Log.v(BasePreferenceActivity.TAG, "install...");
                Util.installPackage(BasePreferenceActivity.this, "com.xiaomi.scanner", BasePreferenceActivity.this.mAppInstalledListener, false, true);
                return null;
            }
        }.execute(new Void[0]);
    }

    private void restorePreferences() {
        resetPreferences();
        resetSnapSetting();
        initializeActivity();
        PriorityStorageBroadcastReceiver.setPriorityStorage(getResources().getBoolean(R.bool.priority_storage));
        onSettingChanged(3);
    }

    private void resetPreferences() {
        this.mHasReset = true;
        DataItemGlobal dataItemGlobal = DataRepository.dataItemGlobal();
        int intentType = dataItemGlobal.getIntentType();
        dataItemGlobal.resetAll();
        ((DataItemConfig) DataRepository.provider().dataConfig(0, intentType)).resetAll();
        ((DataItemConfig) DataRepository.provider().dataConfig(1, intentType)).resetAll();
        DataRepository.dataItemRunning().clearArrayMap();
        DataRepository.getInstance().backUp().clearBackUp();
        Util.generateCustomWatermark2File();
    }

    private void resetSnapSetting() {
        String string = Secure.getString(getContentResolver(), Key.LONG_PRESS_VOLUME_DOWN);
        if (Key.LONG_PRESS_VOLUME_DOWN_STREET_SNAP_PICTURE.equals(string) || Key.LONG_PRESS_VOLUME_DOWN_STREET_SNAP_MOVIE.equals(string)) {
            Secure.putString(getContentResolver(), Key.LONG_PRESS_VOLUME_DOWN, "none");
        }
    }

    public boolean onPreferenceChange(Preference preference, Object obj) {
        onSettingChanged(1);
        Editor edit = this.mPreferences.edit();
        String key = preference.getKey();
        if (obj instanceof String) {
            edit.putString(key, (String) obj);
        } else if (obj instanceof Boolean) {
            edit.putBoolean(key, ((Boolean) obj).booleanValue());
        } else if (obj instanceof Integer) {
            edit.putInt(key, ((Integer) obj).intValue());
        } else if (obj instanceof Long) {
            edit.putLong(key, ((Long) obj).longValue());
        } else if (obj instanceof Float) {
            edit.putFloat(key, ((Float) obj).floatValue());
        } else {
            StringBuilder stringBuilder = new StringBuilder();
            stringBuilder.append("unhandled new value with type=");
            stringBuilder.append(obj.getClass().getName());
            throw new IllegalStateException(stringBuilder.toString());
        }
        edit.apply();
        CameraStatUtil.trackPreferenceChange(preference.getKey(), obj);
        updateConflictPreference(preference);
        return true;
    }

    protected boolean removePreference(PreferenceGroup preferenceGroup, String str) {
        Preference findPreference = preferenceGroup.findPreference(str);
        if (findPreference != null && preferenceGroup.removePreference(findPreference)) {
            return true;
        }
        int preferenceCount = preferenceGroup.getPreferenceCount();
        for (int i = 0; i < preferenceCount; i++) {
            Preference preference = preferenceGroup.getPreference(i);
            if ((preference instanceof PreferenceGroup) && removePreference((PreferenceGroup) preference, str)) {
                return true;
            }
        }
        return false;
    }

    protected boolean addPreference(String str, Preference preference) {
        Preference findPreference = this.mPreferenceGroup.findPreference(str);
        if (!(findPreference instanceof PreferenceGroup)) {
            return false;
        }
        ((PreferenceGroup) findPreference).addPreference(preference);
        return true;
    }

    private void updateEntries() {
        String string;
        PreviewListPreference previewListPreference = (PreviewListPreference) this.mPreferenceGroup.findPreference("pref_camera_picturesize_key");
        PreviewListPreference previewListPreference2 = (PreviewListPreference) this.mPreferenceGroup.findPreference(CameraSettings.KEY_ANTIBANDING);
        CheckBoxPreference checkBoxPreference = (CheckBoxPreference) this.mPreferenceGroup.findPreference(CameraSettings.KEY_AUTO_CHROMA_FLASH);
        PreviewListPreference previewListPreference3 = (PreviewListPreference) this.mPreferenceGroup.findPreference(CameraSettings.KEY_VIDEO_QUALITY);
        PreviewListPreference previewListPreference4 = (PreviewListPreference) this.mPreferenceGroup.findPreference(CameraSettings.KEY_CAMERA_SNAP);
        if (previewListPreference != null) {
            previewListPreference.setEntries(PictureSizeManager.getEntries());
            previewListPreference.setEntryValues(PictureSizeManager.getEntryValues());
            previewListPreference.setDefaultValue(PictureSizeManager.getDefaultValue());
            previewListPreference.setValue(PictureSizeManager.getDefaultValue());
        }
        if (previewListPreference2 != null && Util.isAntibanding60()) {
            string = getString(R.string.pref_camera_antibanding_entryvalue_60hz);
            previewListPreference2.setValue(string);
            previewListPreference2.setDefaultValue(string);
        }
        if (checkBoxPreference != null) {
            checkBoxPreference.setChecked(getResources().getBoolean(CameraSettings.getDefaultPreferenceId(R.bool.pref_camera_auto_chroma_flash_default)));
        }
        if (previewListPreference3 != null) {
            string = getString(CameraSettings.getDefaultPreferenceId(R.string.pref_video_quality_default));
            previewListPreference3.setDefaultValue(string);
            previewListPreference3.setValue(string);
        }
        if (previewListPreference4 != null && b.ha()) {
            string = getString(R.string.pref_camera_snap_default);
            previewListPreference4.setDefaultValue(string);
            previewListPreference4.setValue(string);
            string = Secure.getString(getContentResolver(), Key.LONG_PRESS_VOLUME_DOWN);
            if (System.getInt(getContentResolver(), MiuiSettings.System.VOLUMEKEY_WAKE_SCREEN, 0) == 1 || Key.LONG_PRESS_VOLUME_DOWN_PAY.equals(string) || "none".equals(string)) {
                previewListPreference4.setValue(getString(R.string.pref_camera_snap_value_off));
                return;
            }
            String string2 = DataRepository.dataItemGlobal().getString(CameraSettings.KEY_CAMERA_SNAP, null);
            if (string2 != null) {
                Secure.putString(getContentResolver(), Key.LONG_PRESS_VOLUME_DOWN, CameraSettings.getMiuiSettingsKeyForStreetSnap(string2));
                DataRepository.dataItemGlobal().editor().remove(CameraSettings.KEY_CAMERA_SNAP).apply();
                previewListPreference4.setValue(string2);
            } else if (Key.LONG_PRESS_VOLUME_DOWN_STREET_SNAP_PICTURE.equals(string)) {
                previewListPreference4.setValue(getString(R.string.pref_camera_snap_value_take_picture));
            } else if (Key.LONG_PRESS_VOLUME_DOWN_STREET_SNAP_MOVIE.equals(string)) {
                previewListPreference4.setValue(getString(R.string.pref_camera_snap_value_take_movie));
            }
        }
    }

    private void updateQRCodeEntry() {
        CheckBoxPreference checkBoxPreference = (CheckBoxPreference) this.mPreferenceGroup.findPreference(CameraSettings.KEY_SCAN_QRCODE);
        if (checkBoxPreference != null && this.mPreferences.getBoolean(CameraSettings.KEY_SCAN_QRCODE, checkBoxPreference.isChecked()) && !CameraSettings.isQRCodeReceiverAvailable(this)) {
            Log.v(TAG, "disable QRCodeScan");
            Editor edit = this.mPreferences.edit();
            edit.putBoolean(CameraSettings.KEY_SCAN_QRCODE, false);
            edit.apply();
            checkBoxPreference.setChecked(false);
        }
    }

    private void updatePreferences(PreferenceGroup preferenceGroup, SharedPreferences sharedPreferences) {
        if (preferenceGroup != null) {
            int preferenceCount = preferenceGroup.getPreferenceCount();
            for (int i = 0; i < preferenceCount; i++) {
                Preference preference = preferenceGroup.getPreference(i);
                if (preference instanceof PreviewListPreference) {
                    PreviewListPreference previewListPreference = (PreviewListPreference) preference;
                    if ("pref_camera_picturesize_key".equals(previewListPreference.getKey())) {
                        previewListPreference.setValue(PictureSizeManager.getPictureSizeRatioString());
                    } else {
                        previewListPreference.setValue(getFilterValue(previewListPreference, sharedPreferences));
                    }
                    preference.setPersistent(false);
                } else if (preference instanceof CheckBoxPreference) {
                    CheckBoxPreference checkBoxPreference = (CheckBoxPreference) preference;
                    checkBoxPreference.setChecked(sharedPreferences.getBoolean(checkBoxPreference.getKey(), checkBoxPreference.isChecked()));
                    preference.setPersistent(false);
                } else if (preference instanceof PreferenceGroup) {
                    updatePreferences((PreferenceGroup) preference, sharedPreferences);
                } else {
                    String str = TAG;
                    StringBuilder stringBuilder = new StringBuilder();
                    stringBuilder.append("no need update preference for ");
                    stringBuilder.append(preference.getKey());
                    Log.v(str, stringBuilder.toString());
                }
            }
        }
    }

    private String getFilterValue(PreviewListPreference previewListPreference, SharedPreferences sharedPreferences) {
        String value = previewListPreference.getValue();
        if (sharedPreferences == null) {
            return value;
        }
        String string = sharedPreferences.getString(previewListPreference.getKey(), value);
        if (Util.isStringValueContained((Object) string, previewListPreference.getEntryValues())) {
            value = string;
        } else {
            Editor edit = sharedPreferences.edit();
            edit.putString(previewListPreference.getKey(), value);
            edit.apply();
        }
        return value;
    }

    public boolean onOptionsItemSelected(MenuItem menuItem) {
        if (menuItem.getItemId() != 16908332) {
            return super.onOptionsItemSelected(menuItem);
        }
        resetTimeOutFlag();
        finish();
        return true;
    }

    protected void filterByIntent() {
        ArrayList stringArrayListExtra = getIntent().getStringArrayListExtra(REMOVE_KEYS);
        if (stringArrayListExtra != null) {
            Iterator it = stringArrayListExtra.iterator();
            while (it.hasNext()) {
                removePreference(this.mPreferenceGroup, (String) it.next());
            }
        }
    }

    private void filterGroup() {
        filterGroupIfEmpty(CameraSettings.KEY_CATEGORY_DEVICE_SETTING);
        filterGroupIfEmpty(CameraSettings.KEY_CATEGORY_CAMCORDER_SETTING);
        filterGroupIfEmpty(CameraSettings.KEY_CATEGORY_CAPTURE_SETTING);
        filterGroupIfEmpty(CameraSettings.KEY_CATEGORY_ADVANCE_SETTING);
    }

    private void filterGroupIfEmpty(String str) {
        Preference findPreference = this.mPreferenceGroup.findPreference(str);
        if (findPreference != null && (findPreference instanceof PreferenceGroup) && ((PreferenceGroup) findPreference).getPreferenceCount() == 0) {
            removePreference(this.mPreferenceGroup, str);
        }
    }

    protected void onRestart() {
        super.onRestart();
        if (this.mGoToActivity) {
            this.mGoToActivity = false;
        } else {
            finish();
        }
    }

    private void updateConflictPreference(Preference preference) {
        if (b.qj && CameraSettings.isFrontCamera() && CameraSettings.isMovieSolidOn() && 6 <= CameraSettings.getPreferVideoQuality(this.mFromWhere)) {
            CheckBoxPreference checkBoxPreference = (CheckBoxPreference) this.mPreferenceGroup.findPreference(CameraSettings.KEY_MOVIE_SOLID);
            PreviewListPreference previewListPreference = (PreviewListPreference) this.mPreferenceGroup.findPreference(CameraSettings.KEY_VIDEO_QUALITY);
            if (preference == null || !CameraSettings.KEY_MOVIE_SOLID.equals(preference.getKey())) {
                Editor edit = this.mPreferences.edit();
                edit.putBoolean(CameraSettings.KEY_MOVIE_SOLID, false);
                edit.apply();
                checkBoxPreference.setChecked(false);
                return;
            }
            String string = getString(CameraSettings.getDefaultPreferenceId(R.string.pref_video_quality_default));
            Editor edit2 = this.mPreferences.edit();
            edit2.putString(CameraSettings.KEY_VIDEO_QUALITY, string);
            edit2.apply();
            previewListPreference.setValue(string);
        }
    }

    public void onBackPressed() {
        resetTimeOutFlag();
        super.onBackPressed();
    }

    private void resetTimeOutFlag() {
        if (!this.mHasReset) {
            DataRepository.dataItemGlobal().resetTimeOut();
        }
    }
}
