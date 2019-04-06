package com.arcsoft.avatar.c;

import android.media.AudioRecord;
import android.media.MediaCodec;
import android.media.MediaFormat;
import com.arcsoft.avatar.d.j;
import java.io.IOException;
import java.nio.ByteBuffer;

/* compiled from: AudioEncoder */
public class a extends b {
    private static final String dy = "Arc_BaseEncoder";
    private static final String dz = "Arc_Audio_Encoder";
    private final int A;
    private int E;
    public final String NAME;
    private final int cf;
    private AudioRecord dA;
    private Thread dB;
    private final String dC;
    private int dD;
    private int dE;
    private int dF;
    private int dG;
    private int dH;
    private Object dI;
    private long dJ;
    private boolean dK;
    private int dh;
    private final int x;
    private final int y;
    private final int z;

    public a(f fVar, Object obj, g gVar) {
        super(fVar, obj, gVar);
        this.NAME = "ARC_S";
        this.x = 44100;
        this.y = 16;
        this.z = 2;
        this.A = 6;
        this.dC = "audio/mp4a-latm";
        this.cf = 2000000;
        this.dh = 44100;
        this.E = 16;
        this.dD = 2;
        this.dE = 6;
        this.dF = 2000000;
        this.dI = new Object();
        this.dM = false;
        this.dJ = 0;
    }

    private boolean b() {
        this.dG = AudioRecord.getMinBufferSize(this.dh, this.E, this.dD);
        try {
            this.dA = new AudioRecord(this.dE, this.dh, this.E, this.dD, this.dG);
        } catch (Exception e) {
            if (this.dV != null) {
                this.dV.onRecordingListener(j.gf, Integer.valueOf(0));
            }
            e.printStackTrace();
        }
        if (this.dA == null || 1 != this.dA.getState()) {
            this.dA = null;
            return false;
        }
        this.dH = this.dG;
        return true;
    }

    private boolean c() {
        MediaFormat createAudioFormat = MediaFormat.createAudioFormat("audio/mp4a-latm", this.dh, this.E);
        createAudioFormat.setInteger("aac-profile", 2);
        createAudioFormat.setInteger("channel-count", d());
        createAudioFormat.setInteger("bitrate", this.dF);
        try {
            this.dR = MediaCodec.createEncoderByType("audio/mp4a-latm");
        } catch (IOException e) {
            this.dR = null;
            if (this.dV != null) {
                this.dV.onRecordingListener(j.fP, Integer.valueOf(0));
            }
            e.printStackTrace();
        }
        if (this.dR == null) {
            return false;
        }
        try {
            this.dR.configure(createAudioFormat, null, null, 1);
        } catch (Exception e2) {
            e2.printStackTrace();
            if (this.dV != null) {
                this.dV.onRecordingListener(j.fQ, Integer.valueOf(0));
            }
        }
        return true;
    }

    private int d() {
        return 12 == this.dD ? 2 : 1;
    }

    public void f(boolean z) {
        if (b() && c()) {
            this.dK = true;
        }
    }

    public void release(boolean z) {
        if (this.dB != null) {
            try {
                this.dB.join();
            } catch (InterruptedException e) {
                e.printStackTrace();
            } catch (Throwable th) {
                this.dB = null;
            }
            this.dB = null;
        }
        this.dA.release();
        this.dK = false;
        super.release(z);
    }

    public void startRecording() {
        if (!this.dK) {
            return;
        }
        if (this.dB == null) {
            super.startRecording();
            this.dB = new Thread(dz) {
                public void run() {
                    super.run();
                    setName("ARC_S");
                    try {
                        a.this.dA.startRecording();
                    } catch (Exception e) {
                        e.printStackTrace();
                        if (a.this.dV != null) {
                            a.this.dV.onRecordingListener(j.gg, Integer.valueOf(0));
                        }
                    }
                    try {
                        a.this.dR.start();
                    } catch (Exception e2) {
                        if (a.this.dV != null) {
                            a.this.dV.onRecordingListener(j.fR, Integer.valueOf(0));
                        }
                    }
                    long nanoTime = System.nanoTime();
                    ByteBuffer allocateDirect = ByteBuffer.allocateDirect(a.this.dH);
                    while (!a.this.dN) {
                        if (a.this.e) {
                            long nanoTime2 = System.nanoTime();
                            synchronized (a.this.dO) {
                                if (a.this.e) {
                                    try {
                                        a.this.dA.stop();
                                    } catch (Exception e3) {
                                        e3.printStackTrace();
                                        if (a.this.dV != null) {
                                            a.this.dV.onRecordingListener(j.gh, Integer.valueOf(0));
                                        }
                                    }
                                    try {
                                        a.this.dO.wait();
                                        try {
                                            a.this.dA.startRecording();
                                        } catch (Exception e4) {
                                            e4.printStackTrace();
                                            if (a.this.dV != null) {
                                                a.this.dV.onRecordingListener(j.gg, Integer.valueOf(0));
                                            }
                                        }
                                        a aVar = a.this;
                                        aVar.dP += System.nanoTime() - nanoTime2;
                                        a.this.dU.add(Long.valueOf(a.this.dP));
                                    } catch (InterruptedException e5) {
                                        e5.printStackTrace();
                                    }
                                }
                            }
                        }
                        allocateDirect.clear();
                        if (a.this.dA.read(allocateDirect, a.this.dH) > 0) {
                            a.this.a(allocateDirect, ((System.nanoTime() - nanoTime) - a.this.dP) / 1000);
                            a.this.drain();
                        }
                    }
                    try {
                        a.this.dA.stop();
                    } catch (Exception e6) {
                        e6.printStackTrace();
                        if (a.this.dV != null) {
                            a.this.dV.onRecordingListener(j.gh, Integer.valueOf(0));
                        }
                    }
                    a.this.a(null, 0);
                    a.this.drain();
                }
            };
            this.dB.start();
            return;
        }
        throw new RuntimeException("Audio encoder thread has been started already, can not start twice.");
    }

    public void t() {
    }
}
