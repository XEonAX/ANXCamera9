package com.ss.android.vesdk;

import android.arch.lifecycle.Lifecycle.Event;
import android.arch.lifecycle.LifecycleObserver;
import android.arch.lifecycle.LifecycleOwner;
import android.arch.lifecycle.OnLifecycleEvent;
import android.support.annotation.NonNull;
import com.ss.android.ttve.audio.TEBufferedAudioRecorder;
import com.ss.android.ttve.audio.TEDubWriter;
import com.ss.android.ttve.monitor.MonitorUtils;
import com.ss.android.ttve.nativePort.TEVideoUtils;
import com.ss.android.vesdk.runtime.VERuntime;

public class VEAudioRecorder implements LifecycleObserver {
    private VEAudioEncodeSettings mAudioEncodeSettings;
    private TEBufferedAudioRecorder mAudioRecorder;
    private long mCurrentTime;
    private VERuntime mRuntime;
    private String mWavFilePath;
    private boolean mbRecording;

    public VEAudioRecorder() {
        this.mRuntime = VERuntime.getInstance();
        this.mAudioRecorder = new TEBufferedAudioRecorder(new TEDubWriter());
    }

    public VEAudioRecorder(@NonNull LifecycleOwner lifecycleOwner) {
        this();
        lifecycleOwner.getLifecycle().addObserver(this);
    }

    public int init(VEAudioEncodeSettings vEAudioEncodeSettings, int i) {
        this.mAudioEncodeSettings = vEAudioEncodeSettings;
        this.mbRecording = false;
        this.mWavFilePath = this.mRuntime.getResManager().genRecordWavPath();
        this.mAudioRecorder.init(5);
        TEVideoUtils.generateMuteWav(this.mWavFilePath, this.mAudioRecorder.getSampleRateInHz(), 2, i);
        return 0;
    }

    public int startRecord(float f, int i, int i2) {
        if (this.mbRecording) {
            return VEResult.TER_INVALID_STAT;
        }
        this.mAudioRecorder.startRecording(this.mWavFilePath, (double) f, i, i2);
        this.mbRecording = true;
        return 0;
    }

    public long stopRecord() {
        if (!this.mbRecording) {
            return -105;
        }
        this.mAudioRecorder.stopRecording();
        this.mbRecording = false;
        MonitorUtils.monitorStatistics("iesve_veaudiorecorder_audio_record", 1, null);
        return this.mCurrentTime;
    }

    public int delete(int i, int i2) {
        if (i >= i2 || i < 0) {
            return -100;
        }
        MonitorUtils.monitorStatistics("iesve_veaudiorecorder_audio_delete", 1, null);
        return TEVideoUtils.clearWavSeg(this.mWavFilePath, i, i2);
    }

    public long getCurrentTime() {
        return this.mCurrentTime;
    }

    public String getWavFilePath() throws VEException {
        if (!this.mbRecording) {
            return this.mWavFilePath;
        }
        throw new VEException(VEResult.TER_INVALID_STAT, "audio is recording");
    }

    public String toAAC() {
        return this.mRuntime.getResManager().genRecordAacPath();
    }

    @OnLifecycleEvent(Event.ON_DESTROY)
    public void destory() {
        this.mAudioRecorder.unInit();
    }
}
