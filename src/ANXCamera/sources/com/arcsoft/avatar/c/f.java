package com.arcsoft.avatar.c;

import android.media.MediaCodec.BufferInfo;
import android.media.MediaFormat;
import android.media.MediaMuxer;
import android.support.annotation.NonNull;
import android.support.annotation.Nullable;
import com.arcsoft.avatar.d.j;
import java.io.File;
import java.io.IOException;
import java.nio.ByteBuffer;

/* compiled from: MuxerWrapper */
public class f {
    private static final String a = "Arc_MuxerWrapper";
    private static final String ep = ".mp4";
    private static final String g = "video";
    private int b;
    private volatile int c;
    private volatile boolean dN;
    private long eA;
    private long eB;
    private g eC;
    private MediaMuxer ez;
    private String f;

    public f(@Nullable String str, int i, int i2, g gVar) {
        this(str, i2, gVar);
    }

    public f(@Nullable String str, int i, g gVar) {
        this.eA = 0;
        this.eB = 0;
        this.eC = null;
        this.eC = gVar;
        this.f = str;
        this.b = 0;
        this.c = 0;
        this.dN = false;
        a();
        String str2 = a;
        StringBuilder stringBuilder = new StringBuilder();
        stringBuilder.append("MuxerWrapper()-> video name=");
        stringBuilder.append(this.f);
        com.arcsoft.avatar.d.f.d(str2, stringBuilder.toString());
        try {
            this.ez = new MediaMuxer(this.f, 0);
            this.ez.setOrientationHint(i);
            str2 = a;
            stringBuilder = new StringBuilder();
            stringBuilder.append("MuxerWrapper()-> screenOrientation=");
            stringBuilder.append(i);
            com.arcsoft.avatar.d.f.d(str2, stringBuilder.toString());
        } catch (IOException e) {
            com.arcsoft.avatar.d.f.e(a, "MuxerWrapper()-> create MediaMuxer failed.");
            e.printStackTrace();
            this.ez = null;
            if (this.eC != null) {
                this.eC.onRecordingListener(j.fZ, Integer.valueOf(0));
            }
        }
    }

    private void a() {
        File file = new File(this.f);
        if (file.exists()) {
            file.delete();
            return;
        }
        File file2 = new File(file.getParent());
        if (!file2.exists()) {
            file2.mkdirs();
        }
    }

    /* JADX WARNING: Missing block: B:20:0x004f, code:
            return;
     */
    /* Code decompiled incorrectly, please refer to instructions dump. */
    public synchronized void J() {
        if (this.ez == null) {
            com.arcsoft.avatar.d.f.e(a, "startMuxer()-> mMuxer must be created , but it's null until now");
            return;
        }
        this.c++;
        if (this.c == this.b) {
            try {
                com.arcsoft.avatar.d.f.d(a, "startMuxer()-> Muxerstart");
                this.ez.start();
            } catch (Exception e) {
                com.arcsoft.avatar.d.f.e(a, "startMuxer()-> Muxer start failed");
                if (this.eC != null) {
                    this.eC.onRecordingListener(j.gb, Integer.valueOf(0));
                }
                e.printStackTrace();
            }
            this.dN = true;
            notifyAll();
            com.arcsoft.avatar.d.f.d(a, "startMuxer()-> mMuxer is started");
        }
    }

    /* JADX WARNING: Missing block: B:33:0x00e0, code:
            return;
     */
    /* Code decompiled incorrectly, please refer to instructions dump. */
    public synchronized void K() {
        String str;
        StringBuilder stringBuilder;
        if (this.ez != null) {
            this.c--;
            String str2 = a;
            StringBuilder stringBuilder2 = new StringBuilder();
            stringBuilder2.append("stopMuxer()-> mEncoderCount=");
            stringBuilder2.append(this.c);
            stringBuilder2.append(" ,maxCount=");
            stringBuilder2.append(this.b);
            com.arcsoft.avatar.d.f.d(str2, stringBuilder2.toString());
            if (this.c == 0) {
                try {
                    this.ez.stop();
                } catch (Exception e) {
                    str = a;
                    stringBuilder = new StringBuilder();
                    stringBuilder.append("stopMuxer()-> muxer.stop() error=");
                    stringBuilder.append(e.getMessage());
                    com.arcsoft.avatar.d.f.e(str, stringBuilder.toString());
                    if (this.eC != null) {
                        this.eC.onRecordingListener(j.gd, Integer.valueOf(0));
                    }
                }
                try {
                    this.ez.release();
                } catch (Exception e2) {
                    str = a;
                    stringBuilder = new StringBuilder();
                    stringBuilder.append("stopMuxer()-> muxer.release() error=");
                    stringBuilder.append(e2.getMessage());
                    com.arcsoft.avatar.d.f.e(str, stringBuilder.toString());
                    if (this.eC != null) {
                        this.eC.onRecordingListener(j.ge, Integer.valueOf(0));
                    }
                }
                this.ez = null;
                File file = new File(this.f);
                if (file.exists()) {
                    String str3 = a;
                    StringBuilder stringBuilder3 = new StringBuilder();
                    stringBuilder3.append("stopMuxer()->  video size = ");
                    stringBuilder3.append(file.length());
                    com.arcsoft.avatar.d.f.d(str3, stringBuilder3.toString());
                    if (0 == file.length() && file.isFile()) {
                        file.delete();
                        com.arcsoft.avatar.d.f.d(a, "stopMuxer()->  video size = 0 delete.");
                    }
                }
                com.arcsoft.avatar.d.f.d(a, "stopMuxer()-> Muxer is released.");
            }
        }
    }

    public long L() {
        return this.eB - this.eA;
    }

    public long M() {
        File file = new File(this.f);
        return (file.exists() && file.isFile()) ? file.length() : 0;
    }

    public synchronized int addTrack(@NonNull MediaFormat mediaFormat) {
        int addTrack;
        if (this.ez == null) {
            com.arcsoft.avatar.d.f.e(a, "writeSampleData()-> mMuxer must be created , but it's null until now.");
            return -1;
        }
        try {
            addTrack = this.ez.addTrack(mediaFormat);
        } catch (Exception e) {
            if (this.eC != null) {
                this.eC.onRecordingListener(j.ga, Integer.valueOf(0));
            }
            e.printStackTrace();
            addTrack = 0;
        }
        return addTrack;
    }

    public void b(long j) {
        this.eB = j;
    }

    public void i(int i) {
        if (i <= 0 || i > 2) {
            throw new RuntimeException("The encoder count must between 1 and 2.");
        }
        this.b = i;
    }

    public boolean isStarted() {
        return this.dN;
    }

    public void setStartTime(long j) {
        this.eA = j;
    }

    /* JADX WARNING: Missing block: B:15:0x0037, code:
            return;
     */
    /* Code decompiled incorrectly, please refer to instructions dump. */
    public synchronized void writeSampleData(int i, @NonNull ByteBuffer byteBuffer, @NonNull BufferInfo bufferInfo) {
        if (this.ez == null) {
            com.arcsoft.avatar.d.f.e(a, "writeSampleData()-> mMuxer must be created , but it's null until now.");
            return;
        }
        try {
            this.ez.writeSampleData(i, byteBuffer, bufferInfo);
            com.arcsoft.avatar.d.f.d(a, "writeSampleData()-> writeSampleData done");
        } catch (Exception e) {
            com.arcsoft.avatar.d.f.e(a, "writeSampleData()-> writeSampleData failed");
            e.printStackTrace();
            if (this.eC != null) {
                this.eC.onRecordingListener(j.gc, Integer.valueOf(0));
            }
        }
    }
}
