package com.ss.android.medialib.player;

import android.support.annotation.Keep;
import android.view.Surface;
import com.ss.android.medialib.NativePort.NativeLibsLoader;
import com.ss.android.medialib.Result.Error;
import com.ss.android.medialib.player.Message.Listener;
import org.a.a.a;
import org.a.a.b;

@Keep
public class SimplePlayer implements b {
    private a mAudioPlayer;
    private long mHandle = nativeCreatePlayer();
    private Listener mListener;
    private boolean mSeekingCover = false;

    public static native int nativeRegister();

    private native void nativeSetEffectConfig(long j, EffectConfig effectConfig);

    public native int nativeConfigSeekCover(long j, long j2, int i, long j3);

    public native long nativeCreatePlayer();

    public native long nativeGetDuration(long j);

    public native int nativeGetHeight(long j);

    public native int nativeGetWidth(long j);

    public native void nativeInitAudioPlayer(long j, long j2);

    public native int nativePause(long j);

    public native byte[] nativePlayAudioSamples(long j);

    public native void nativePlayCover(long j, int i);

    public native int nativePrepare(long j, String str);

    public native int nativePrepare(long j, String str, String str2);

    public native void nativeRelease(long j);

    public native int nativeResume(long j);

    public native void nativeSeekCover(long j, long j2);

    public native void nativeSetFilter(long j, String str);

    public native void nativeSetLoop(long j, boolean z);

    public native int nativeStart(long j, Surface surface, int i, int i2);

    public native void nativeStop(long j);

    public native void nativeStopAudioPlayer(long j);

    static {
        NativeLibsLoader.loadLibrary();
        nativeRegister();
    }

    public void setMessageListener(Listener listener) {
        this.mListener = listener;
    }

    public int prepare(String str, String str2) {
        if (this.mHandle == 0) {
            this.mHandle = nativeCreatePlayer();
        }
        int nativePrepare = nativePrepare(this.mHandle, str, str2);
        if (!this.mSeekingCover) {
            this.mAudioPlayer = new a(this.mHandle);
        }
        if (nativePrepare != 0 || this.mAudioPlayer == null || this.mAudioPlayer.a((b) this)) {
            return nativePrepare;
        }
        return Error.SYN_INIT_FAILED;
    }

    private int prepare(String str) {
        return nativePrepare(this.mHandle, str);
    }

    public int start(Surface surface, int i, int i2) {
        if (this.mAudioPlayer != null) {
            this.mAudioPlayer.ib();
        }
        return nativeStart(this.mHandle, surface, i, i2);
    }

    public int resume() {
        if (this.mAudioPlayer != null) {
            this.mAudioPlayer.resume();
        }
        return nativeResume(this.mHandle);
    }

    public int pause() {
        if (this.mAudioPlayer != null) {
            this.mAudioPlayer.pause();
        }
        return nativePause(this.mHandle);
    }

    public void stop() {
        if (this.mAudioPlayer != null) {
            this.mAudioPlayer.ic();
        }
        nativeStop(this.mHandle);
    }

    public void release() {
        if (this.mAudioPlayer != null) {
            this.mAudioPlayer.ia();
        }
        nativeRelease(this.mHandle);
        this.mHandle = 0;
    }

    public void setLoop(boolean z) {
        nativeSetLoop(this.mHandle, z);
    }

    public void setFilter(String str) {
        nativeSetFilter(this.mHandle, str);
    }

    public void setEffectConfig(EffectConfig effectConfig) {
        nativeSetEffectConfig(this.mHandle, effectConfig);
    }

    public byte[] playAudioSamples(long j) {
        return nativePlayAudioSamples(j);
    }

    public void setAudioMinSize(long j, long j2) {
        nativeInitAudioPlayer(j, j2);
    }

    public void stopAudio(long j) {
        nativeStopAudioPlayer(j);
    }

    public int configSeekCover(long j, int i, long j2) {
        this.mSeekingCover = true;
        return nativeConfigSeekCover(this.mHandle, j, i, j2);
    }

    public void seekCover(long j) {
        nativeSeekCover(this.mHandle, j);
    }

    public void playCover(int i) {
        nativePlayCover(this.mHandle, i);
    }

    public int getWidth() {
        return nativeGetWidth(this.mHandle);
    }

    public int getHeight() {
        return nativeGetHeight(this.mHandle);
    }

    public long getDuration() {
        return nativeGetDuration(this.mHandle);
    }

    public void onInfo(int i, int i2) {
        if (this.mListener != null) {
            this.mListener.onInfo(i, i2);
        }
    }
}
