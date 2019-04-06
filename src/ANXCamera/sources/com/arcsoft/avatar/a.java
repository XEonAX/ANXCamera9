package com.arcsoft.avatar;

import android.content.Context;
import android.media.Image;
import android.opengl.EGL14;
import android.opengl.EGLContext;
import android.opengl.EGLDisplay;
import android.opengl.EGLSurface;
import android.opengl.GLES20;
import android.support.annotation.NonNull;
import android.util.Log;
import com.arcsoft.avatar.a.d;
import com.arcsoft.avatar.a.f;
import com.arcsoft.avatar.a.h;
import com.arcsoft.avatar.c.e;
import com.arcsoft.avatar.c.g;
import java.util.LinkedList;
import java.util.Queue;
import java.util.concurrent.locks.Lock;
import java.util.concurrent.locks.ReentrantLock;

/* compiled from: RecordModule */
public class a {
    private static final String b = "RecordModule";
    private static final int c = 2;
    private static final int d = 512000;
    private final int E = 1000000;
    private Context bI;
    private Lock bJ = new ReentrantLock();
    private Lock bK = new ReentrantLock();
    private volatile boolean bL = false;
    private volatile boolean bM = false;
    private volatile boolean bN = false;
    private volatile boolean bO = false;
    private boolean bP;
    private EGLDisplay bQ;
    private EGLContext bR;
    private EGLSurface bS;
    private int bT;
    private int bU;
    private int bV;
    private int bW;
    private int bX;
    private Queue<com.arcsoft.avatar.d.a> bY;
    private f bZ;
    private f ca;
    private d cb;
    private h cc;
    private boolean cd;
    private boolean ce;
    private int cf = 270;
    private long cg = 0;
    private long ci = 0;
    private long cj = 0;
    private AvatarEngine ck;
    private e cl;
    private volatile boolean cm;
    private volatile boolean cn;
    private boolean cp;
    private g cq = null;
    AvatarConfig.g cr = null;
    private int s;

    public a(Context context) {
        this.bI = context;
    }

    private int a(boolean z, boolean z2) {
        if (z) {
            GLES20.glClear(16640);
        }
        this.bK.lock();
        com.arcsoft.avatar.d.a aVar = (com.arcsoft.avatar.d.a) this.bY.poll();
        this.bK.unlock();
        if (!this.bP) {
            this.bZ.a(aVar.Q());
            this.bZ.a(this.ce, this.cf);
            this.bP = true;
        }
        this.cb.b(false, true);
        a(false);
        this.bZ.b(aVar);
        this.cb.c(false, false);
        int textureId = this.cb.getTextureId();
        this.ca.a(0.0f);
        if (!z2) {
            this.ca.g(1);
            a(true);
            this.ca.f(textureId);
            a(false);
        }
        return textureId;
    }

    private long a(long j) {
        if (j <= 0) {
            return 0;
        }
        j -= 512000;
        if (j <= 0) {
            j = 1;
        }
        return j;
    }

    private void a() {
        this.bQ = EGL14.eglGetCurrentDisplay();
        this.bS = EGL14.eglGetCurrentSurface(12377);
        this.bR = EGL14.eglGetCurrentContext();
    }

    private void a(com.arcsoft.avatar.d.a aVar) {
        if (this.bY.size() >= 2) {
            this.bY.poll();
        }
        try {
            this.bY.offer(aVar);
        } catch (ClassCastException e) {
            e.printStackTrace();
        } catch (NullPointerException e2) {
            e2.printStackTrace();
        } catch (IllegalArgumentException e3) {
            e3.printStackTrace();
        }
    }

    private void a(boolean z) {
        int i = 0;
        int i2 = z ? this.bW : 0;
        if (z) {
            i = this.bX;
        }
        GLES20.glViewport(i2, i, this.bV, this.s);
    }

    private void b() {
        if (this.ca == null) {
            this.ca = new f(773);
            this.ca.q();
            this.ca.r();
        }
        c();
        if (this.cc == null) {
            this.cc = new h();
            this.cc.s();
        }
    }

    private int c(int i) {
        int a = a(true, true);
        if (a <= 0) {
            com.arcsoft.avatar.d.g.d(b, "loadBackground fail...");
        }
        this.cb.b(true, false);
        if (a > 0) {
            this.ca.a(1.0f);
        }
        this.ck.a(i, this.bV, this.s, 0, false, null);
        this.cb.c(false, true);
        i = this.cb.getTextureId();
        if (i > 0) {
            this.ca.a(0.0f);
            this.ca.g(1);
            a(true);
            this.ca.f(i);
            a(false);
        }
        return i;
    }

    private void c() {
        if (this.cb == null || this.bV != this.cb.getWidth() || this.s != this.cb.getHeight()) {
            if (this.cb != null) {
                this.cb.unInit();
            }
            String str = b;
            StringBuilder stringBuilder = new StringBuilder();
            stringBuilder.append("initFramebuffer init FBO first time. size :[");
            stringBuilder.append(this.bV);
            stringBuilder.append(",");
            stringBuilder.append(this.s);
            stringBuilder.append("]");
            com.arcsoft.avatar.d.g.d(str, stringBuilder.toString());
            this.cb = new d();
            this.cb.a(this.bV, this.s, true);
        }
    }

    private void d() {
        if (this.bZ == null) {
            this.bZ = new f(this.bT, this.bU, 2050);
            this.bZ.p();
            this.bZ.r();
        }
    }

    /* JADX WARNING: Missing block: B:11:0x002f, code:
            return;
     */
    /* Code decompiled incorrectly, please refer to instructions dump. */
    private void d(int i) {
        if (i <= 0) {
            String str = b;
            StringBuilder stringBuilder = new StringBuilder();
            stringBuilder.append("recordingIfNeed textureId = ");
            stringBuilder.append(i);
            com.arcsoft.avatar.d.g.d(str, stringBuilder.toString());
            return;
        }
        if (!(this.cm || this.cl == null || !this.cp)) {
            this.cl.j(i);
            g();
        }
    }

    private void g() {
        long H = this.cl.H();
        long I = this.cl.I();
        long a = a(this.cg);
        long j = H / 1000000;
        if (j > this.ci) {
            this.ci = j;
            if (this.cq != null) {
                this.cq.onRecordingListener(258, Long.valueOf(H));
                this.cq.onRecordingListener(260, Long.valueOf(I));
            }
        }
        if (this.cj > 0 && H > this.cj) {
            stopRecording();
            if (this.cq != null) {
                this.cq.onRecordingListener(257, Long.valueOf(H));
            }
        }
        if (a > 0 && I > a) {
            stopRecording();
            if (this.cq != null) {
                this.cq.onRecordingListener(259, Long.valueOf(I));
            }
        }
    }

    public void a(int i, int i2, int i3, int i4) {
        this.bW = i;
        this.bX = i2;
        this.bV = i3;
        this.s = i4;
    }

    public void a(int i, int i2, int i3, AvatarEngine avatarEngine, boolean z) {
        this.bL = false;
        this.bM = false;
        this.bN = false;
        this.bO = false;
        this.cd = false;
        this.cp = false;
        this.cm = false;
        this.bT = i2;
        this.bU = i3;
        this.ck = avatarEngine;
        this.bY = new LinkedList();
        this.bY.clear();
        this.ce = z;
        this.cf = i;
        this.bP = false;
        this.bQ = EGL14.EGL_NO_DISPLAY;
        this.bR = EGL14.EGL_NO_CONTEXT;
        this.bS = EGL14.EGL_NO_SURFACE;
        this.cr = new AvatarConfig.g();
        this.bL = true;
    }

    public void a(int i, boolean z) {
        try {
            this.bJ.lock();
            if (this.bL && this.bM) {
                try {
                    this.bO = true;
                    a();
                    b();
                    if (this.bZ == null) {
                        d();
                    }
                    if (z && (this.cr == null || this.cr.faceCount > 0)) {
                        i = c(i);
                    } else if (this.bY == null || this.bY.isEmpty()) {
                        this.bO = false;
                        return;
                    } else {
                        i = a(true, false);
                    }
                    d(i);
                } catch (Exception e) {
                    String str = b;
                    StringBuilder stringBuilder = new StringBuilder();
                    stringBuilder.append("startRender meet error = ");
                    stringBuilder.append(e.getMessage());
                    com.arcsoft.avatar.d.g.d(str, stringBuilder.toString());
                } catch (Throwable th) {
                    this.bO = false;
                }
                this.bO = false;
                return;
            }
            com.arcsoft.avatar.d.g.d(b, "startRender() failed, engine is not inited or startRender process not ready! ");
            this.bJ.unlock();
        } finally {
            z = this.bJ;
            z.unlock();
        }
    }

    public void a(@NonNull Image image, int i, boolean z) {
        try {
            this.bJ.lock();
            if (this.bL) {
                this.bJ.unlock();
                com.arcsoft.avatar.d.a b = com.arcsoft.avatar.d.d.b(image);
                if (z) {
                    this.ck.a(b, null, 90, this.ce, i);
                }
                try {
                    this.bN = true;
                    if (this.bY != null) {
                        Lock lock;
                        try {
                            this.bK.lock();
                            a(b);
                            lock = this.bK;
                        } catch (Exception e) {
                            String str = b;
                            StringBuilder stringBuilder = new StringBuilder();
                            stringBuilder.append("startProcess_1 putPreviewInQueue_ error = ");
                            stringBuilder.append(e.getMessage());
                            com.arcsoft.avatar.d.g.d(str, stringBuilder.toString());
                            lock = this.bK;
                        }
                        lock.unlock();
                        this.bM = true;
                    }
                } catch (Exception e2) {
                    try {
                        e2.printStackTrace();
                    } catch (Throwable th) {
                        this.bN = false;
                    }
                } catch (Throwable th2) {
                    this.bK.unlock();
                }
                this.bN = false;
                return;
            }
            com.arcsoft.avatar.d.g.d(b, "startProcess_1() failed, engine is not inited. ");
        } finally {
            this.bJ.unlock();
        }
    }

    public void a(@NonNull String str, g gVar, int i, @NonNull int i2, @NonNull int i3, int i4) {
        int i5 = i;
        String str2 = b;
        StringBuilder stringBuilder = new StringBuilder();
        stringBuilder.append("save video path = ");
        String str3 = str;
        stringBuilder.append(str3);
        Log.d(str2, stringBuilder.toString());
        try {
            this.bJ.lock();
            if (this.bL) {
                this.bJ.unlock();
                if (i2 != 0 && i3 != 0 && str3.length() != 0) {
                    if (this.cl != null) {
                        throw new RuntimeException("Recording has been started already.");
                    } else if (i5 == 0 || 90 == i5 || 180 == i5 || 270 == i5) {
                        g gVar2 = gVar;
                        this.cq = gVar2;
                        if (EGL14.EGL_NO_CONTEXT == this.bR) {
                            a();
                        }
                        this.cl = new e(str3, i2, i3, this.cf, this.ce, i5, gVar2);
                        this.cl.i(2);
                        this.cl.a(this.bR, i4, false);
                        this.cl.E();
                        this.cl.startRecording();
                        this.cp = true;
                        this.cm = false;
                        return;
                    } else {
                        StringBuilder stringBuilder2 = new StringBuilder();
                        stringBuilder2.append("StickerApi-> startRecording(...) screenOrientation = ");
                        stringBuilder2.append(i5);
                        stringBuilder2.append(" is invalid");
                        throw new RuntimeException(stringBuilder2.toString());
                    }
                }
                return;
            }
            com.arcsoft.avatar.d.g.d(b, "startRecording-> StickerApi is not init.");
        } finally {
            this.bJ.unlock();
        }
    }

    public void a(@NonNull byte[] bArr, int i, int i2, int i3, boolean z) {
        try {
            this.bJ.lock();
            if (this.bL) {
                this.bJ.unlock();
                try {
                    this.bN = true;
                    if (this.bY != null) {
                        Lock lock;
                        try {
                            this.bK.lock();
                            a(new com.arcsoft.avatar.d.a(bArr, i2, i2, i3, true));
                            lock = this.bK;
                        } catch (Exception e) {
                            String str = b;
                            StringBuilder stringBuilder = new StringBuilder();
                            stringBuilder.append("startProcess_1 putPreviewInQueue_ error = ");
                            stringBuilder.append(e.getMessage());
                            com.arcsoft.avatar.d.g.d(str, stringBuilder.toString());
                            lock = this.bK;
                        }
                        lock.unlock();
                        this.bM = true;
                    }
                    if (z) {
                        this.ck.b(bArr, i2, i3, i2, 90, this.ce, i, this.cr);
                        String str2 = b;
                        StringBuilder stringBuilder2 = new StringBuilder();
                        stringBuilder2.append("avatarProcessWithInfo -> face count = ");
                        stringBuilder2.append(this.cr.faceCount);
                        com.arcsoft.avatar.d.g.d(str2, stringBuilder2.toString());
                        this.bN = false;
                        return;
                    }
                    this.bN = false;
                    return;
                } catch (Exception e2) {
                    try {
                        e2.printStackTrace();
                    } catch (Throwable th) {
                        this.bN = false;
                    }
                } catch (Throwable th2) {
                    this.bK.unlock();
                }
            }
            com.arcsoft.avatar.d.g.d(b, "startProcess_1() failed, engine is not inited. ");
        } finally {
            this.bJ.unlock();
        }
    }

    public void b(int i) {
        this.cf = i;
    }

    public void pauseRecording() {
        try {
            this.bJ.lock();
            if (this.bL) {
                this.bJ.unlock();
                if (this.cl != null && this.cp) {
                    this.cm = true;
                    this.cl.F();
                }
            }
        } finally {
            this.bJ.unlock();
        }
    }

    public void resumeRecording() {
        try {
            this.bJ.lock();
            if (this.bL) {
                this.bJ.unlock();
                if (this.cl != null && this.cp && this.cm) {
                    this.cl.G();
                    this.cm = false;
                }
            }
        } finally {
            this.bJ.unlock();
        }
    }

    public void setMirror(boolean z) {
        this.ce = z;
    }

    public void setPreviewSize(int i, int i2) {
        this.bT = i;
        this.bU = i2;
    }

    public void stopRecording() {
        try {
            this.bJ.lock();
            if (!this.bL) {
                this.bJ.unlock();
                return;
            }
        } catch (Exception e) {
        } catch (Throwable th) {
            this.bJ.unlock();
        }
        this.bJ.unlock();
        if (this.cp) {
            if (this.cl != null) {
                resumeRecording();
                this.cl.stopRecording();
                this.cl = null;
            }
            this.cp = false;
            this.cm = false;
            this.cj = 0;
            this.ci = 0;
            this.cg = 0;
        }
    }

    public void unInit() {
        stopRecording();
        try {
            this.bJ.lock();
            if (this.bL) {
                this.bL = false;
                int i = 100;
                while (true) {
                    if (!this.bN && !this.bO) {
                        break;
                    }
                    i--;
                    if (i <= 0) {
                        break;
                    }
                    Thread.sleep(1);
                }
                this.bP = false;
                this.cn = false;
                this.bY.clear();
                this.bY = null;
                if (this.cc != null) {
                    this.cc.deleteTexture();
                    this.cc = null;
                }
                if (this.cb != null) {
                    this.cb.unInit();
                    this.cb = null;
                }
                if (this.bZ != null) {
                    this.bZ.unInit();
                    this.bZ = null;
                }
                if (this.ca != null) {
                    this.ca.unInit();
                    this.ca = null;
                }
                this.bR = EGL14.EGL_NO_CONTEXT;
                this.bS = EGL14.EGL_NO_SURFACE;
                this.bQ = EGL14.EGL_NO_DISPLAY;
                this.bV = 0;
                this.s = 0;
                this.bN = false;
                this.bO = false;
                this.bM = false;
                this.bJ.unlock();
                return;
            }
            com.arcsoft.avatar.d.g.d(b, "uninit () failed, engine is not inited. ");
            this.bJ.unlock();
        } catch (InterruptedException e) {
            e.printStackTrace();
        } catch (Throwable th) {
            this.bJ.unlock();
        }
    }
}
