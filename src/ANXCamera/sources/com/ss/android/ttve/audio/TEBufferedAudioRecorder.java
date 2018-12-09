package com.ss.android.ttve.audio;

import android.media.AudioRecord;
import android.util.Log;
import com.android.camera.module.BaseModule;

public class TEBufferedAudioRecorder {
    private static final String TAG = "TEBufferedAudioRecorder";
    protected static int channelConfigOffset = -1;
    protected static int[] channelConfigSuggested = new int[]{12, 16, 1};
    protected static int sampleRateOffset = -1;
    protected static int[] sampleRateSuggested = new int[]{44100, BaseModule.LENS_DIRTY_DETECT_HINT_DURATION, 11025, 16000, 22050};
    AudioRecord audio;
    TEAudioWriterInterface audioCaller;
    int audioFormat = 2;
    int bufferSizeInBytes = 0;
    int channelConfig = -1;
    boolean isRecording = false;
    int sampleRateInHz = -1;

    public TEBufferedAudioRecorder(TEAudioWriterInterface tEAudioWriterInterface) {
        this.audioCaller = tEAudioWriterInterface;
    }

    protected void finalize() throws Throwable {
        if (this.audio != null) {
            try {
                if (this.audio.getState() != 0) {
                    this.audio.stop();
                }
                this.audio.release();
            } catch (Exception e) {
            }
            this.audio = null;
        }
        super.finalize();
    }

    public int getSampleRateInHz() {
        return this.sampleRateInHz;
    }

    public void init(int i) {
        if (this.audio != null) {
            Log.e(TAG, "second time audio init(), skip");
            return;
        }
        String str;
        int i2 = -1;
        try {
            if (!(channelConfigOffset == -1 || sampleRateOffset == -1)) {
                this.channelConfig = channelConfigSuggested[channelConfigOffset];
                this.sampleRateInHz = sampleRateSuggested[sampleRateOffset];
                this.bufferSizeInBytes = AudioRecord.getMinBufferSize(this.sampleRateInHz, this.channelConfig, this.audioFormat);
                this.audio = new AudioRecord(i, this.sampleRateInHz, this.channelConfig, this.audioFormat, this.bufferSizeInBytes);
            }
        } catch (Exception e) {
            String str2 = TAG;
            StringBuilder stringBuilder = new StringBuilder();
            stringBuilder.append("使用预设配置");
            stringBuilder.append(channelConfigOffset);
            stringBuilder.append(",");
            stringBuilder.append(sampleRateOffset);
            stringBuilder.append("实例化audio recorder失败，重新测试配置。");
            stringBuilder.append(e);
            Log.e(str2, stringBuilder.toString());
        }
        if (this.audio == null) {
            channelConfigOffset = -1;
            int[] iArr = channelConfigSuggested;
            int length = iArr.length;
            int i3 = 0;
            int i4 = i3;
            while (i3 < length) {
                this.channelConfig = iArr[i3];
                channelConfigOffset++;
                sampleRateOffset = i2;
                int[] iArr2 = sampleRateSuggested;
                int length2 = iArr2.length;
                int i5 = 0;
                while (i5 < length2) {
                    int i6 = iArr2[i5];
                    sampleRateOffset++;
                    StringBuilder stringBuilder2;
                    try {
                        this.bufferSizeInBytes = AudioRecord.getMinBufferSize(i6, this.channelConfig, this.audioFormat);
                        str = TAG;
                        stringBuilder2 = new StringBuilder();
                        stringBuilder2.append("试用hz ");
                        stringBuilder2.append(i6);
                        stringBuilder2.append(" ");
                        stringBuilder2.append(this.channelConfig);
                        stringBuilder2.append(" ");
                        stringBuilder2.append(this.audioFormat);
                        Log.i(str, stringBuilder2.toString());
                        if (this.bufferSizeInBytes > 0) {
                            this.sampleRateInHz = i6;
                            int i7 = this.sampleRateInHz;
                            int i8 = this.channelConfig;
                            int i9 = i8;
                            i8 = i;
                            this.audio = new AudioRecord(i8, i7, i9, this.audioFormat, this.bufferSizeInBytes);
                            i4 = 1;
                            break;
                        }
                        sampleRateOffset++;
                        i5++;
                    } catch (Exception e2) {
                        this.sampleRateInHz = 0;
                        this.audio = null;
                        String str3 = TAG;
                        stringBuilder2 = new StringBuilder();
                        stringBuilder2.append("apply audio record sample rate ");
                        stringBuilder2.append(i6);
                        stringBuilder2.append(" failed: ");
                        stringBuilder2.append(e2.getMessage());
                        Log.e(str3, stringBuilder2.toString());
                        sampleRateOffset++;
                    }
                }
                if (i4 != 0) {
                    break;
                }
                i3++;
                i2 = -1;
            }
        }
        StringBuilder stringBuilder3;
        if (this.sampleRateInHz <= 0) {
            str = TAG;
            stringBuilder3 = new StringBuilder();
            stringBuilder3.append("!Init audio recorder failed, hz ");
            stringBuilder3.append(this.sampleRateInHz);
            Log.e(str, stringBuilder3.toString());
            return;
        }
        str = TAG;
        stringBuilder3 = new StringBuilder();
        stringBuilder3.append("Init audio recorder succeed, apply audio record sample rate ");
        stringBuilder3.append(this.sampleRateInHz);
        stringBuilder3.append(" buffer ");
        stringBuilder3.append(this.bufferSizeInBytes);
        stringBuilder3.append(" state ");
        stringBuilder3.append(this.audio.getState());
        Log.i(str, stringBuilder3.toString());
    }

    public void unInit() {
        if (this.audio != null) {
            try {
                if (this.audio.getState() != 0) {
                    this.audio.stop();
                }
                this.audio.release();
            } catch (Exception e) {
            }
            this.audio = null;
        }
        if (this.audioCaller != null) {
            this.audioCaller.destroy();
        }
    }

    /* JADX WARNING: Missing block: B:9:0x0015, code:
            r10 = r9.audioCaller.initWavFile(r10, r9.sampleRateInHz, 2, r11, r13, r14);
     */
    /* JADX WARNING: Missing block: B:10:0x0022, code:
            if (r10 == 0) goto L_0x003b;
     */
    /* JADX WARNING: Missing block: B:11:0x0024, code:
            r11 = TAG;
            r12 = new java.lang.StringBuilder();
            r12.append("init wav file failed, ret = ");
            r12.append(r10);
            android.util.Log.e(r11, r12.toString());
     */
    /* JADX WARNING: Missing block: B:12:0x003a, code:
            return;
     */
    /* JADX WARNING: Missing block: B:13:0x003b, code:
            new java.lang.Thread(new com.ss.android.ttve.audio.TEBufferedAudioRecorder.AnonymousClass1(r9)).start();
     */
    /* JADX WARNING: Missing block: B:14:0x0048, code:
            return;
     */
    public void startRecording(java.lang.String r10, double r11, int r13, int r14) {
        /*
        r9 = this;
        r0 = "TEBufferedAudioRecorder";
        r1 = "audio startRecording";
        android.util.Log.e(r0, r1);
        monitor-enter(r9);
        r0 = r9.isRecording;	 Catch:{ all -> 0x004b }
        if (r0 != 0) goto L_0x0049;
    L_0x000c:
        r0 = r9.audio;	 Catch:{ all -> 0x004b }
        if (r0 != 0) goto L_0x0011;
    L_0x0010:
        goto L_0x0049;
    L_0x0011:
        r0 = 1;
        r9.isRecording = r0;	 Catch:{ all -> 0x004b }
        monitor-exit(r9);	 Catch:{ all -> 0x004b }
        r1 = r9.audioCaller;
        r3 = r9.sampleRateInHz;
        r4 = 2;
        r2 = r10;
        r5 = r11;
        r7 = r13;
        r8 = r14;
        r10 = r1.initWavFile(r2, r3, r4, r5, r7, r8);
        if (r10 == 0) goto L_0x003b;
    L_0x0024:
        r11 = "TEBufferedAudioRecorder";
        r12 = new java.lang.StringBuilder;
        r12.<init>();
        r13 = "init wav file failed, ret = ";
        r12.append(r13);
        r12.append(r10);
        r10 = r12.toString();
        android.util.Log.e(r11, r10);
        return;
    L_0x003b:
        r10 = new java.lang.Thread;
        r11 = new com.ss.android.ttve.audio.TEBufferedAudioRecorder$1;
        r11.<init>();
        r10.<init>(r11);
        r10.start();
        return;
    L_0x0049:
        monitor-exit(r9);	 Catch:{ all -> 0x004b }
        return;
    L_0x004b:
        r10 = move-exception;
        monitor-exit(r9);	 Catch:{ all -> 0x004b }
        throw r10;
        */
        throw new UnsupportedOperationException("Method not decompiled: com.ss.android.ttve.audio.TEBufferedAudioRecorder.startRecording(java.lang.String, double, int, int):void");
    }

    /* JADX WARNING: Missing block: B:9:0x0014, code:
            if (r3.audio.getState() == 0) goto L_0x001b;
     */
    /* JADX WARNING: Missing block: B:10:0x0016, code:
            r3.audio.stop();
     */
    /* JADX WARNING: Missing block: B:11:0x001b, code:
            r3.audioCaller.closeWavFile();
     */
    /* JADX WARNING: Missing block: B:12:0x0021, code:
            return true;
     */
    /* JADX WARNING: Missing block: B:18:0x0033, code:
            return false;
     */
    public boolean stopRecording() {
        /*
        r3 = this;
        monitor-enter(r3);
        r0 = r3.isRecording;	 Catch:{ all -> 0x0034 }
        r1 = 0;
        if (r0 == 0) goto L_0x0022;
    L_0x0006:
        r0 = r3.audio;	 Catch:{ all -> 0x0034 }
        if (r0 != 0) goto L_0x000b;
    L_0x000a:
        goto L_0x0022;
    L_0x000b:
        r3.isRecording = r1;	 Catch:{ all -> 0x0034 }
        monitor-exit(r3);	 Catch:{ all -> 0x0034 }
        r0 = r3.audio;
        r0 = r0.getState();
        if (r0 == 0) goto L_0x001b;
    L_0x0016:
        r0 = r3.audio;
        r0.stop();
    L_0x001b:
        r0 = r3.audioCaller;
        r0.closeWavFile();
        r0 = 1;
        return r0;
    L_0x0022:
        r0 = "TEBufferedAudioRecorder";
        r2 = "未启动音频模块但调用stopRecording";
        android.util.Log.e(r0, r2);	 Catch:{ all -> 0x0034 }
        r0 = r3.audio;	 Catch:{ all -> 0x0034 }
        if (r0 == 0) goto L_0x0032;
    L_0x002d:
        r0 = r3.audio;	 Catch:{ all -> 0x0034 }
        r0.release();	 Catch:{ all -> 0x0034 }
    L_0x0032:
        monitor-exit(r3);	 Catch:{ all -> 0x0034 }
        return r1;
    L_0x0034:
        r0 = move-exception;
        monitor-exit(r3);	 Catch:{ all -> 0x0034 }
        throw r0;
        */
        throw new UnsupportedOperationException("Method not decompiled: com.ss.android.ttve.audio.TEBufferedAudioRecorder.stopRecording():boolean");
    }
}
