package org.a.a;

import android.media.AudioRecord;
import android.os.Build;
import android.util.Log;
import com.android.camera.constant.DurationConstant;
import com.android.camera.module.BaseModule;

/* compiled from: BufferedAudioRecorder */
public class d {
    private static final String TAG = "BufferedAudioRecorder";
    protected static int channelConfigOffset = -1;
    protected static int[] channelConfigSuggested = new int[]{12, 16, 1};
    protected static int sampleRateOffset = -1;
    protected static int[] sampleRateSuggested = new int[]{48000, 44100, BaseModule.LENS_DIRTY_DETECT_HINT_DURATION, 11025, DurationConstant.DURATION_LIVE_RECORD, 22050};
    AudioRecord audio;
    int audioFormat = 2;
    int bufferSizeInBytes = 0;
    int channelConfig = -1;
    boolean isRecording = false;
    int sampleRateInHz = -1;
    c up;

    public int W(int i) {
        if (16 == i) {
            return 1;
        }
        return 2;
    }

    public d(c cVar) {
        this.up = cVar;
        if ("SM919".equals(Build.MODEL)) {
            channelConfigSuggested = new int[]{16, 12, 1};
        }
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

    public void init(int i) {
        if (this.audio != null) {
            Log.d(TAG, "second time audio init(), skip");
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
            Log.d(str2, stringBuilder.toString());
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
                        Log.d(str, stringBuilder2.toString());
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
                        Log.d(str3, stringBuilder2.toString());
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
            Log.d(str, stringBuilder3.toString());
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
        Log.d(str, stringBuilder3.toString());
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
    }

    /* JADX WARNING: Missing block: B:10:0x0027, code:
            if (r4.up.initWavFile(r4.sampleRateInHz, W(channelConfigSuggested[channelConfigOffset]), r5) == 0) goto L_0x0031;
     */
    /* JADX WARNING: Missing block: B:11:0x0029, code:
            android.util.Log.d(TAG, "init wav file failed");
     */
    /* JADX WARNING: Missing block: B:12:0x0030, code:
            return;
     */
    /* JADX WARNING: Missing block: B:13:0x0031, code:
            new java.lang.Thread(new org.a.a.d.AnonymousClass1(r4)).start();
     */
    /* JADX WARNING: Missing block: B:14:0x003e, code:
            return;
     */
    /* Code decompiled incorrectly, please refer to instructions dump. */
    public void d(double d) {
        Log.d(TAG, "audio startRecording");
        synchronized (this) {
            if (this.isRecording || this.audio == null) {
                return;
            }
            this.isRecording = true;
        }
    }

    /* JADX WARNING: Missing block: B:9:0x0014, code:
            if (r3.audio.getState() == 0) goto L_0x001b;
     */
    /* JADX WARNING: Missing block: B:10:0x0016, code:
            r3.audio.stop();
     */
    /* JADX WARNING: Missing block: B:11:0x001b, code:
            r3.up.closeWavFile();
     */
    /* JADX WARNING: Missing block: B:12:0x0021, code:
            return true;
     */
    /* JADX WARNING: Missing block: B:18:0x0033, code:
            return false;
     */
    /* Code decompiled incorrectly, please refer to instructions dump. */
    public boolean stopRecording() {
        synchronized (this) {
            if (!this.isRecording || this.audio == null) {
                Log.d(TAG, "未启动音频模块但调用stopRecording");
                if (this.audio != null) {
                    this.audio.release();
                }
            } else {
                this.isRecording = false;
            }
        }
    }
}
