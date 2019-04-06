package com.arcsoft.avatar.c;

import android.media.MediaCodec;
import android.media.MediaCodec.BufferInfo;
import android.os.Bundle;
import android.view.Surface;
import com.arcsoft.avatar.d.f;
import com.arcsoft.avatar.d.j;
import java.nio.ByteBuffer;
import java.util.LinkedList;
import java.util.Queue;
import java.util.concurrent.locks.Condition;
import java.util.concurrent.locks.Lock;

/* compiled from: BaseEncoder */
public abstract class b {
    private static final int bX = 1000000;
    private static final int dW = 1000000;
    private static final String dy = "Arc_BaseEncoder";
    private static final int w = 50564;
    private static final long x = 20000;
    protected boolean a;
    protected boolean b;
    protected boolean bP;
    private long cg = 0;
    protected boolean dM;
    protected boolean dN;
    protected Object dO;
    protected volatile long dP;
    protected f dQ;
    protected MediaCodec dR;
    protected int dS;
    protected long dT;
    protected Queue<Long> dU;
    protected g dV;
    protected long dX = 500;
    protected Lock dY;
    protected Condition dZ;
    protected volatile boolean e;
    protected d ea;
    private long eb = 0;
    private long ec = 0;
    private long ed = 0;
    protected int j;
    private long y = 0;
    private long z = 0;

    public b(f fVar, Object obj, g gVar) {
        this.dV = gVar;
        this.dQ = fVar;
        this.dM = false;
        this.b = false;
        this.a = true;
        this.e = false;
        this.dN = false;
        this.dS = -1;
        this.j = -1;
        this.dO = obj;
        this.dP = 0;
        this.bP = false;
        this.dT = 0;
        this.dU = new LinkedList();
        f.d(dy, "BaseEncoder constructor out");
    }

    protected long a() {
        long nanoTime = System.nanoTime();
        long j = this.dP;
        if (this.dU.size() != 0) {
            j = ((Long) this.dU.poll()).longValue();
        }
        j = (nanoTime - j) / 1000;
        String str = dy;
        StringBuilder stringBuilder = new StringBuilder();
        stringBuilder.append("getPTSUs TotalPauseTime=");
        stringBuilder.append(this.dP / 1000);
        f.d(str, stringBuilder.toString());
        str = dy;
        stringBuilder = new StringBuilder();
        stringBuilder.append("getPTSUs preTime=");
        stringBuilder.append(this.z);
        stringBuilder.append(" ,currentTime=");
        stringBuilder.append(nanoTime / 1000);
        stringBuilder.append(" , result=");
        stringBuilder.append(j);
        f.d(str, stringBuilder.toString());
        if (j < this.z) {
            nanoTime = this.z - j;
            return nanoTime < x ? (this.z + x) - nanoTime : this.z + x;
        } else if (0 == this.z) {
            return j;
        } else {
            nanoTime = j - this.z;
            return nanoTime < x ? (j + x) - nanoTime : j;
        }
    }

    public void a(d dVar) {
        this.ea = dVar;
    }

    public void a(ByteBuffer byteBuffer, long j) {
        if (this.dR == null) {
            f.e(dy, "encode()->Encoder is not ready.");
            return;
        }
        String str = dy;
        StringBuilder stringBuilder = new StringBuilder();
        stringBuilder.append("encode()->Encoder one frame. threadName in=");
        stringBuilder.append(Thread.currentThread().getName());
        f.d(str, stringBuilder.toString());
        int i = 0;
        if (this.b) {
            while (this.b && !this.a) {
                int dequeueInputBuffer = this.dR.dequeueInputBuffer(500);
                if (-1 == dequeueInputBuffer) {
                    if (i >= 3) {
                        f.d(dy, "encode()->Encoder is busy, wait time out.");
                        break;
                    }
                    i++;
                    String str2 = dy;
                    StringBuilder stringBuilder2 = new StringBuilder();
                    stringBuilder2.append("encode()->Encoder is busy, wait ... waitCount = ");
                    stringBuilder2.append(i);
                    f.d(str2, stringBuilder2.toString());
                } else if (dequeueInputBuffer >= 0) {
                    ByteBuffer inputBuffer = this.dR.getInputBuffer(dequeueInputBuffer);
                    if (byteBuffer == null) {
                        this.a = true;
                        this.dR.queueInputBuffer(dequeueInputBuffer, 0, 0, j, 4);
                        f.d(dy, "encode()->Encoder meets end of stream.");
                    } else {
                        inputBuffer.clear();
                        inputBuffer.put(byteBuffer);
                        inputBuffer.flip();
                        this.dR.queueInputBuffer(dequeueInputBuffer, 0, inputBuffer.remaining(), j, 0);
                        f.d(dy, "encode()->Encoder is fed a new frame.");
                    }
                }
            }
        }
    }

    public void drain() {
        String str;
        if (this.dR == null) {
            f.e(dy, "drain()->Encoder is not ready.");
            return;
        }
        String name = Thread.currentThread().getName();
        String str2 = dy;
        StringBuilder stringBuilder = new StringBuilder();
        stringBuilder.append("drain()->Encoder one frame. threadName in=");
        stringBuilder.append(Thread.currentThread().getName());
        f.d(str2, stringBuilder.toString());
        if (this.dQ == null) {
            f.e(dy, "drain()->Muxer is not ready.");
            return;
        }
        BufferInfo bufferInfo = new BufferInfo();
        int i = 0;
        while (this.b) {
            int dequeueOutputBuffer = this.dR.dequeueOutputBuffer(bufferInfo, this.dX);
            String str3;
            StringBuilder stringBuilder2;
            StringBuilder stringBuilder3;
            String str4;
            StringBuilder stringBuilder4;
            if (-1 == dequeueOutputBuffer) {
                if (i >= 2) {
                    f.d(dy, "drain()->Encoded frame is preparing, wait time out.");
                    break;
                }
                i++;
                str3 = dy;
                stringBuilder2 = new StringBuilder();
                stringBuilder2.append("drain()->Encoded frame is preparing, wait ... waitCount = ");
                stringBuilder2.append(i);
                f.d(str3, stringBuilder2.toString());
            } else if (-2 == dequeueOutputBuffer) {
                if (this.dM) {
                    f.e(dy, "drain()->Encoder format change twice.");
                    throw new RuntimeException("Format only allow change once, but Encoder meet twice!");
                }
                this.j = this.dQ.addTrack(this.dR.getOutputFormat());
                this.dM = true;
                if (this.dQ.isStarted()) {
                    continue;
                } else {
                    this.dQ.J();
                    str3 = dy;
                    stringBuilder2 = new StringBuilder();
                    stringBuilder2.append("Muxer started: threadName =");
                    stringBuilder2.append(Thread.currentThread().getName());
                    f.d(str3, stringBuilder2.toString());
                    synchronized (this.dQ) {
                        while (!this.dQ.isStarted() && !this.dN) {
                            try {
                                this.dQ.wait(100);
                            } catch (InterruptedException e) {
                                str = dy;
                                StringBuilder stringBuilder5 = new StringBuilder();
                                stringBuilder5.append("drain()->Wait for muxer started, but be interrupted : ");
                                stringBuilder5.append(e.getMessage());
                                f.e(str, stringBuilder5.toString());
                                this.dM = false;
                            }
                        }
                        long a = a();
                        this.cg = a;
                        this.dQ.setStartTime(a);
                        String str5 = dy;
                        stringBuilder3 = new StringBuilder();
                        stringBuilder3.append("Muxer start time =");
                        stringBuilder3.append(a);
                        f.i(str5, stringBuilder3.toString());
                    }
                }
            } else if (dequeueOutputBuffer < 0) {
                str4 = dy;
                stringBuilder4 = new StringBuilder();
                stringBuilder4.append("drain()->Encoder meet bufferStatus =");
                stringBuilder4.append(dequeueOutputBuffer);
                f.i(str4, stringBuilder4.toString());
            } else {
                ByteBuffer outputBuffer = this.dR.getOutputBuffer(dequeueOutputBuffer);
                if ((2 & bufferInfo.flags) != 0) {
                    bufferInfo.size = 0;
                    f.i(dy, "drain()->Encoder meet bufferStatus : BUFFER_FLAG_CODEC_CONFIG ");
                }
                if (!this.dM) {
                    f.e(dy, "drain()->Encoder muxer has not started ");
                }
                if (bufferInfo.size != 0) {
                    outputBuffer.position(bufferInfo.offset);
                    outputBuffer.limit(bufferInfo.offset + bufferInfo.size);
                    str = dy;
                    stringBuilder3 = new StringBuilder();
                    stringBuilder3.append("drain()->Encoder one frame. threadName=");
                    stringBuilder3.append(Thread.currentThread().getName());
                    stringBuilder3.append(" timestamp original buffer info =");
                    stringBuilder3.append(bufferInfo.presentationTimeUs);
                    f.d(str, stringBuilder3.toString());
                    bufferInfo.presentationTimeUs = a();
                    str = dy;
                    stringBuilder3 = new StringBuilder();
                    stringBuilder3.append("time_diff _");
                    stringBuilder3.append(name);
                    stringBuilder3.append("= ");
                    stringBuilder3.append(bufferInfo.presentationTimeUs - this.y);
                    f.d(str, stringBuilder3.toString());
                    this.y = bufferInfo.presentationTimeUs;
                    if (bufferInfo.presentationTimeUs - this.eb >= 1000000) {
                        this.eb = bufferInfo.presentationTimeUs;
                        Bundle bundle = new Bundle();
                        bundle.putInt("request-sync", 1);
                        this.dR.setParameters(bundle);
                    }
                    this.dQ.writeSampleData(this.j, outputBuffer, bufferInfo);
                    this.z = bufferInfo.presentationTimeUs;
                    this.dQ.b(bufferInfo.presentationTimeUs);
                    str4 = dy;
                    stringBuilder4 = new StringBuilder();
                    stringBuilder4.append("drain()->Encoder one frame. threadName=");
                    stringBuilder4.append(Thread.currentThread().getName());
                    stringBuilder4.append(" timestamp=");
                    stringBuilder4.append(bufferInfo.presentationTimeUs);
                    f.d(str4, stringBuilder4.toString());
                }
                this.dR.releaseOutputBuffer(dequeueOutputBuffer, false);
                if ((4 & bufferInfo.flags) != 0) {
                    if (this.a) {
                        f.d(dy, "drain()->Encoder meet end of stream.");
                    } else {
                        f.e(dy, "drain()->Encoder meet unexpected end of stream.");
                    }
                    this.b = false;
                }
            }
        }
        name = dy;
        StringBuilder stringBuilder6 = new StringBuilder();
        stringBuilder6.append("drain()->Encoder one frame. threadName out=");
        stringBuilder6.append(Thread.currentThread().getName());
        f.d(name, stringBuilder6.toString());
    }

    public abstract void f(boolean z);

    public Surface getInputSurface() {
        return null;
    }

    public void lock() {
        if (this.dY != null) {
            this.dY.lock();
        }
    }

    public void pauseRecording() {
        this.e = true;
        String str = dy;
        StringBuilder stringBuilder = new StringBuilder();
        stringBuilder.append("Log_mIsRequestPause_Vaule_pauseRecording ->mIsRequestPause=");
        stringBuilder.append(this.e);
        f.d(str, stringBuilder.toString());
    }

    public void release(boolean z) {
        if (this.dR != null) {
            try {
                this.dR.stop();
            } catch (Exception e) {
                e.printStackTrace();
                if (z) {
                    if (this.dV != null) {
                        this.dV.onRecordingListener(j.fX, Integer.valueOf(0));
                    }
                } else if (this.dV != null) {
                    this.dV.onRecordingListener(j.fS, Integer.valueOf(0));
                }
            }
            try {
                this.dR.release();
            } catch (Exception e2) {
                e2.printStackTrace();
                if (z) {
                    if (this.dV != null) {
                        this.dV.onRecordingListener(j.fY, Integer.valueOf(0));
                    }
                } else if (this.dV != null) {
                    this.dV.onRecordingListener(j.fT, Integer.valueOf(0));
                }
            }
            this.dR = null;
        }
        if (this.dQ != null) {
            this.dQ.K();
            this.dQ = null;
        }
        this.b = false;
        this.e = false;
        this.dN = false;
        this.a = true;
        this.dO = null;
        this.dY = null;
        this.dZ = null;
    }

    public void resumeRecording() {
        this.e = false;
        String str = dy;
        StringBuilder stringBuilder = new StringBuilder();
        stringBuilder.append("Log_mIsRequestPause_Vaule_resumeRecording ->mIsRequestPause=");
        stringBuilder.append(this.e);
        f.d(str, stringBuilder.toString());
    }

    public void startRecording() {
        if (this.b) {
            f.i(dy, "startRecording()-> encoder is started, you can not start it again");
            return;
        }
        this.b = true;
        this.dN = false;
        this.a = false;
        f.d(dy, "startRecording()-> encoder is started.");
    }

    public void stopRecording() {
        if (this.dN) {
            f.i(dy, "stopRecording()-> stop encoder request command is received,you can not send stop command again.");
        } else {
            this.dN = true;
        }
    }

    public abstract void t();

    public String u() {
        return this.dR != null ? this.dR.getName().toLowerCase().contains("google") ? "Software Encoder" : "Hardware Encoder" : "No Encoder";
    }

    public void v() {
        if (this.dY != null) {
            this.dY.unlock();
        }
    }

    public void w() {
        if (this.dZ != null) {
            this.dZ.signalAll();
        }
    }

    public d x() {
        return null;
    }
}
