package com.android.camera.module.loader.camera2;

import android.content.Intent;
import android.support.v4.util.Pair;
import com.android.camera.CameraAppImpl;
import com.android.camera.CameraScreenNail;
import com.android.camera.ThermalDetector;
import com.android.camera.data.DataRepository;
import com.android.camera.data.data.global.DataItemGlobal;
import com.android.camera.db.DbRepository;
import com.android.camera.module.Module;
import com.android.camera.module.loader.StartControl;
import com.android.camera.parallel.AlgoConnector;
import io.reactivex.CompletableEmitter;
import io.reactivex.CompletableOnSubscribe;
import io.reactivex.Observer;
import io.reactivex.disposables.Disposable;

public class CompletablePreFixCamera2Setup implements CompletableOnSubscribe, Observer<Camera2Result> {
    private static final String TAG = "prefix";
    private boolean isFromVoiceControl;
    private CameraScreenNail mCameraScreenNail;
    private CompletableEmitter mEmitter;
    private boolean mFromScreenSlide;
    private Intent mIntent;
    private Module mLastMode;
    private boolean mModuleChanged;
    private boolean mNeedBlur;
    private boolean mNeedConfigData;
    private boolean mStartFromKeyguard;

    public CompletablePreFixCamera2Setup(Module module, StartControl startControl, CameraScreenNail cameraScreenNail, Intent intent, boolean z, boolean z2) {
        this.mLastMode = module;
        if (startControl != null) {
            this.mNeedBlur = startControl.mNeedBlurAnimation;
            this.mFromScreenSlide = startControl.mFromScreenSlide;
            this.mNeedConfigData = startControl.mNeedReConfigureData;
            this.mModuleChanged = startControl.mTargetMode != module.getModuleIndex();
        }
        this.mCameraScreenNail = cameraScreenNail;
        this.mIntent = intent;
        this.mStartFromKeyguard = z;
        this.isFromVoiceControl = z2;
    }

    public void subscribe(CompletableEmitter completableEmitter) {
        int intValue;
        int intValue2;
        this.mEmitter = completableEmitter;
        DataItemGlobal dataItemGlobal = DataRepository.dataItemGlobal();
        if (isLastModuleAlive()) {
            if (this.mNeedConfigData) {
                DataRepository.getInstance().backUp().backupRunning(DataRepository.dataItemRunning(), dataItemGlobal.getDataBackUpKey(this.mLastMode.getModuleIndex()), dataItemGlobal.getLastCameraId(), true);
            }
            closeLastModule();
        }
        if (this.mNeedBlur) {
            this.mCameraScreenNail.animateModuleCopyTexture(this.mFromScreenSlide);
        }
        if (this.mIntent != null) {
            Pair parseIntent = dataItemGlobal.parseIntent(this.mIntent, Boolean.valueOf(this.isFromVoiceControl), this.mStartFromKeyguard, true, true);
            intValue = ((Integer) parseIntent.first).intValue();
            intValue2 = ((Integer) parseIntent.second).intValue();
            if (DataRepository.dataItemFeature().fm()) {
                DbRepository.dbItemSaveTask().markAllDepartedTask();
                AlgoConnector.getInstance().startService(CameraAppImpl.getAndroidContext());
            }
            ThermalDetector.getInstance().onCreate(CameraAppImpl.getAndroidContext());
            int i = intValue;
            intValue = intValue2;
            intValue2 = i;
        } else {
            intValue2 = dataItemGlobal.getCurrentCameraId();
            intValue = dataItemGlobal.getCurrentMode();
        }
        Camera2OpenManager.getInstance().openCamera(intValue2, intValue, this, true);
    }

    public void onSubscribe(Disposable disposable) {
    }

    public void onNext(Camera2Result camera2Result) {
        this.mEmitter.onComplete();
    }

    public void onError(Throwable th) {
    }

    public void onComplete() {
    }

    private boolean isLastModuleAlive() {
        return this.mLastMode != null && this.mLastMode.isCreated();
    }

    private void closeLastModule() {
        this.mLastMode.unRegisterProtocol();
        if (this.mModuleChanged) {
            this.mLastMode.unRegisterModulePersistProtocol();
        }
        this.mLastMode.onPause();
        this.mLastMode.onStop();
        this.mLastMode.onDestroy();
    }
}
