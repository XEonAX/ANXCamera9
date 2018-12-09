package com.android.camera;

import android.support.annotation.MainThread;
import com.android.camera.statistic.CameraStat;
import com.mi.config.b;
import java.lang.annotation.Retention;
import java.lang.annotation.RetentionPolicy;

public class MutexModeManager {
    public static final int MUTEX_AOHDR = 2;
    public static final int MUTEX_BURST_SHOOT = 7;
    public static final int MUTEX_GROUP = 9;
    public static final int MUTEX_HAND_NIGHT = 3;
    public static final int MUTEX_MORPHO_HDR = 1;
    public static final int MUTEX_NONE = 0;
    public static final int MUTEX_RAW = 4;
    public static final int MUTEX_SCENE_HDR = 5;
    public static final int MUTEX_STEREO = 8;
    public static final int MUTEX_SUPER_RESOLUTION = 10;
    public static final int MUTEX_UBI_FOCUS = 6;
    private int mCurrentMutexMode = 0;
    private boolean mIsMandatory;
    private MutexCallBack mMutexCallBack;

    public interface MutexCallBack {
        void enterMutexMode(int i);

        void exitMutexMode(int i);
    }

    @Retention(RetentionPolicy.SOURCE)
    public @interface MutexMode {
    }

    public MutexModeManager(MutexCallBack mutexCallBack) {
        this.mMutexCallBack = mutexCallBack;
    }

    public void setMutexModeMandatory(int i) {
        this.mIsMandatory = true;
        switchMutexMode(this.mCurrentMutexMode, i);
    }

    public void clearMandatoryFlag() {
        this.mIsMandatory = false;
    }

    public boolean inMandatoryMode() {
        return this.mIsMandatory;
    }

    @MainThread
    public void setMutexMode(int i) {
        this.mIsMandatory = false;
        switchMutexMode(this.mCurrentMutexMode, i);
    }

    @MainThread
    public void resetMutexMode() {
        this.mIsMandatory = false;
        switchMutexMode(this.mCurrentMutexMode, 0);
    }

    public int getMutexMode() {
        return this.mCurrentMutexMode;
    }

    public boolean isSupportedFlashOn() {
        return this.mCurrentMutexMode == 0 || this.mCurrentMutexMode == 4 || this.mCurrentMutexMode == 3;
    }

    public boolean isSupportedTorch() {
        return b.gv() && (this.mCurrentMutexMode == 0 || this.mCurrentMutexMode == 2 || this.mCurrentMutexMode == 7 || this.mCurrentMutexMode == 9 || this.mCurrentMutexMode == 10);
    }

    public boolean isNormal() {
        return this.mCurrentMutexMode == 0;
    }

    public boolean isAoHdr() {
        return this.mCurrentMutexMode == 2;
    }

    public boolean isMorphoHdr() {
        return this.mCurrentMutexMode == 1;
    }

    public boolean isUbiFocus() {
        return this.mCurrentMutexMode == 6;
    }

    public boolean isHdr() {
        return this.mCurrentMutexMode == 2 || this.mCurrentMutexMode == 1 || this.mCurrentMutexMode == 5;
    }

    public boolean isSceneHdr() {
        return this.mCurrentMutexMode == 5;
    }

    public boolean isRAW() {
        return this.mCurrentMutexMode == 4;
    }

    public boolean isBurstShoot() {
        return this.mCurrentMutexMode == 7;
    }

    public boolean isNeedComposed() {
        return (this.mCurrentMutexMode == 0 || this.mCurrentMutexMode == 2 || this.mCurrentMutexMode == 7) ? false : true;
    }

    public boolean isHandNight() {
        return this.mCurrentMutexMode == 3;
    }

    public boolean isGroupShot() {
        return this.mCurrentMutexMode == 9;
    }

    public boolean isSuperResolution() {
        return this.mCurrentMutexMode == 10;
    }

    public String getAlgorithmName() {
        int i = this.mCurrentMutexMode;
        if (i != 5) {
            switch (i) {
                case 1:
                    break;
                case 2:
                    return "AO_HDR";
                case 3:
                    return CameraStat.PARAM_HHT;
                default:
                    return "";
            }
        }
        return CameraStat.PARAM_HDR;
    }

    public String getSuffix() {
        if (this.mCurrentMutexMode == 4) {
            return "_RAW";
        }
        if (!b.hC() && !Util.isForceNameSuffix()) {
            return "";
        }
        int i = this.mCurrentMutexMode;
        if (i != 5) {
            switch (i) {
                case 1:
                    break;
                case 2:
                    return "_AO_HDR";
                case 3:
                    return "_HHT";
                default:
                    return "";
            }
        }
        return "_HDR";
    }

    private void exit(int i) {
        if (i != 0 && this.mMutexCallBack != null) {
            this.mCurrentMutexMode = 0;
            this.mMutexCallBack.exitMutexMode(i);
        }
    }

    private void enter(int i) {
        if (i != 0 && this.mMutexCallBack != null && this.mCurrentMutexMode != i) {
            this.mCurrentMutexMode = i;
            this.mMutexCallBack.enterMutexMode(i);
        }
    }

    private void switchMutexMode(int i, int i2) {
        if (i != i2) {
            exit(i);
            enter(i2);
        }
    }
}
