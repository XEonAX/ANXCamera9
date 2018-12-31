package com.android.camera.module.loader;

import com.android.camera.Camera;
import com.android.camera.constant.GlobalConstant;
import com.android.camera.data.DataRepository;
import com.android.camera.data.data.global.DataItemGlobal;
import com.android.camera.data.data.runing.DataItemRunning;
import com.android.camera.effect.EffectController;
import com.android.camera.log.Log;
import com.android.camera.module.BaseModule;
import com.android.camera.module.loader.camera2.Camera2OpenManager;
import com.mi.config.b;
import io.reactivex.Scheduler;
import io.reactivex.annotations.NonNull;

public class FunctionModuleSetup extends Func1Base<BaseModule, BaseModule> {
    private static final String TAG = FunctionModuleSetup.class.getSimpleName();

    public FunctionModuleSetup(int i) {
        super(i);
    }

    public Scheduler getWorkThread() {
        return GlobalConstant.sCameraSetupScheduler;
    }

    public NullHolder<BaseModule> apply(@NonNull NullHolder<BaseModule> nullHolder) throws Exception {
        String str = TAG;
        StringBuilder stringBuilder = new StringBuilder();
        stringBuilder.append("apply: module isPresent = ");
        stringBuilder.append(nullHolder.isPresent());
        Log.d(str, stringBuilder.toString());
        if (!nullHolder.isPresent()) {
            return nullHolder;
        }
        BaseModule baseModule = (BaseModule) nullHolder.get();
        if (baseModule.isDeparted()) {
            return NullHolder.ofNullable(baseModule, 225);
        }
        EffectController.getInstance().reset();
        Camera activity = baseModule.getActivity();
        DataItemGlobal dataItemGlobal = DataRepository.dataItemGlobal();
        DataItemRunning dataItemRunning = DataRepository.dataItemRunning();
        switch (this.mTargetMode) {
            case 162:
                dataItemRunning.switchOff("pref_video_speed_fast_key");
                dataItemRunning.switchOff("pref_video_speed_slow_key");
                dataItemRunning.switchOff("pref_video_speed_hfr_key");
                break;
            case 163:
                if (DataRepository.dataItemFeature().fw()) {
                    if (baseModule.getActivity().isNewBieAlive(4)) {
                        return nullHolder;
                    }
                    if (dataItemGlobal.getBoolean("pref_camera_first_ultra_wide_use_hint_shown_key", true)) {
                        baseModule.getActivity().showNewBie(4);
                        return nullHolder;
                    }
                } else if (baseModule.getActivity().isNewBieAlive(3)) {
                    return nullHolder;
                } else {
                    if (dataItemGlobal.getBoolean("pref_camera_first_ai_scene_use_hint_shown_key", true) && b.gq()) {
                        baseModule.getActivity().showNewBie(3);
                        return nullHolder;
                    }
                }
                break;
            case 165:
                dataItemRunning.switchOn("pref_camera_square_mode_key");
                break;
            case 167:
                dataItemRunning.switchOn("pref_camera_manual_mode_key");
                break;
            case 168:
                dataItemRunning.switchOff("pref_video_speed_fast_key");
                dataItemRunning.switchOn("pref_video_speed_slow_key");
                dataItemRunning.switchOff("pref_video_speed_hfr_key");
                break;
            case 169:
                dataItemRunning.switchOn("pref_video_speed_fast_key");
                dataItemRunning.switchOff("pref_video_speed_slow_key");
                dataItemRunning.switchOff("pref_video_speed_hfr_key");
                break;
            case 170:
                dataItemRunning.switchOff("pref_video_speed_fast_key");
                dataItemRunning.switchOff("pref_video_speed_slow_key");
                dataItemRunning.switchOn("pref_video_speed_hfr_key");
                break;
            case 171:
                if (dataItemGlobal.getCurrentCameraId() == 0) {
                    dataItemRunning.switchOn("pref_camera_portrait_mode_key");
                } else {
                    dataItemRunning.switchOff("pref_camera_portrait_mode_key");
                }
                if (baseModule.getActivity().isNewBieAlive(1)) {
                    return nullHolder;
                }
                if (dataItemGlobal.isNormalIntent() && dataItemGlobal.getBoolean("pref_camera_first_portrait_use_hint_shown_key", true)) {
                    baseModule.getActivity().showNewBie(1);
                    dataItemGlobal.editor().putBoolean("pref_camera_first_portrait_use_hint_shown_key", false).apply();
                    return nullHolder;
                }
        }
        baseModule.getActivity().removeNewBie();
        if (baseModule.isDeparted() || activity.isActivityPaused()) {
            return NullHolder.ofNullable(baseModule, 225);
        }
        try {
            baseModule.setCameraDevice(Camera2OpenManager.getInstance().getCurrentCamera2Device());
            baseModule.onCreate(this.mTargetMode, dataItemGlobal.getCurrentCameraId());
            if (baseModule.isCreated()) {
                baseModule.onResume();
                baseModule.registerProtocol();
            }
            return nullHolder;
        } catch (IllegalArgumentException e) {
            e.printStackTrace();
            baseModule.setDeparted();
            return NullHolder.ofNullable(null, 237);
        }
    }
}
