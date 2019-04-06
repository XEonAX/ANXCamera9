package com.arcsoft.avatar.c;

import android.graphics.Bitmap;
import android.graphics.Bitmap.CompressFormat;
import android.graphics.Bitmap.Config;
import android.opengl.EGL14;
import android.opengl.EGLContext;
import android.opengl.EGLDisplay;
import android.opengl.EGLSurface;
import android.opengl.GLES20;
import android.opengl.GLES30;
import android.support.annotation.NonNull;
import com.arcsoft.avatar.d.f;
import com.arcsoft.avatar.d.j;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.OutputStream;
import java.nio.Buffer;
import java.nio.ByteBuffer;
import java.nio.ByteOrder;

/* compiled from: MediaManager */
public class e implements g {
    private static final String a = "Arc_VideoEncoder";
    public static final int em = 1;
    public static final int en = 1;
    public static final int eo = 2;
    private static final int s = 2;
    private int b;
    private boolean bP;
    private int bW;
    private int bX;
    private int c;
    private int cY;
    private int d;
    private boolean e;
    private boolean el;
    private String ep;
    private b eq;
    private b er;
    private f es;
    private com.arcsoft.avatar.a.e et;
    private Object eu;
    private g ev;
    private d ew;
    private String g;
    private int n;

    /* compiled from: MediaManager */
    public class a extends Thread {
        private ByteBuffer ex;

        public a(ByteBuffer byteBuffer) {
            this.ex = byteBuffer;
        }

        public void run() {
            super.run();
            Bitmap createBitmap = Bitmap.createBitmap(e.this.b, e.this.c, Config.ARGB_8888);
            createBitmap.copyPixelsFromBuffer(this.ex);
            StringBuilder stringBuilder = new StringBuilder();
            stringBuilder.append("/sdcard/Pictures/_");
            stringBuilder.append(System.currentTimeMillis());
            stringBuilder.append(".png");
            try {
                OutputStream fileOutputStream = new FileOutputStream(stringBuilder.toString());
                createBitmap.compress(CompressFormat.PNG, 100, fileOutputStream);
                fileOutputStream.close();
                createBitmap.recycle();
            } catch (FileNotFoundException e) {
                e.printStackTrace();
            } catch (IOException e2) {
                e2.printStackTrace();
            }
        }
    }

    public e(@NonNull String str, int i, int i2, int i3, boolean z, int i4, g gVar) {
        this.ev = gVar;
        this.b = i;
        this.c = i2;
        if (90 == i3 || 270 == i3) {
            this.b ^= this.c;
            this.c = this.b ^ this.c;
            this.b ^= this.c;
        }
        this.d = i3;
        this.e = z;
        this.g = str;
        this.n = 0;
        this.cY = 0;
        this.es = new f(this.g, i4, this);
        EGLDisplay eglGetCurrentDisplay = EGL14.eglGetCurrentDisplay();
        EGLSurface eglGetCurrentSurface = EGL14.eglGetCurrentSurface(12378);
        int[] iArr = new int[1];
        int[] iArr2 = new int[1];
        EGL14.eglQuerySurface(eglGetCurrentDisplay, eglGetCurrentSurface, 12375, iArr, 0);
        EGL14.eglQuerySurface(eglGetCurrentDisplay, eglGetCurrentSurface, 12374, iArr2, 0);
        this.bW = iArr[0];
        this.bX = iArr2[0];
        this.eu = new Object();
        str = a;
        StringBuilder stringBuilder = new StringBuilder();
        stringBuilder.append("MediaManager constructor mFrameWidth = ");
        stringBuilder.append(i);
        stringBuilder.append(" ,mFrameHeight = ");
        stringBuilder.append(i2);
        f.d(str, stringBuilder.toString());
    }

    private void a() {
        if (this.n == this.cY) {
            this.el = true;
        } else if (this.cY >= 3) {
            StringBuilder stringBuilder = new StringBuilder();
            stringBuilder.append("Init encoder count great than need. need=");
            stringBuilder.append(this.n);
            stringBuilder.append(" ,but got=");
            stringBuilder.append(this.cY);
            throw new RuntimeException(stringBuilder.toString());
        }
    }

    private void b() {
        Buffer allocateDirect = ByteBuffer.allocateDirect((this.b * this.c) * 4);
        allocateDirect.order(ByteOrder.nativeOrder());
        GLES20.glReadPixels(0, 0, this.b, this.c, 6408, 5121, allocateDirect);
        String str = a;
        StringBuilder stringBuilder = new StringBuilder();
        stringBuilder.append("glReadPixels() glError = ");
        stringBuilder.append(GLES20.glGetError());
        f.d(str, stringBuilder.toString());
        new a(allocateDirect).start();
    }

    public void D() {
        f.e(a, "MediaManager initVideoEncoder in");
        this.eq = new h(this.es, this.b, this.c, this.eu, this, EGL14.EGL_NO_CONTEXT, 10000000);
        this.eq.f(false);
        this.el = true;
        this.cY++;
        a();
        String str = a;
        StringBuilder stringBuilder = new StringBuilder();
        stringBuilder.append("MediaManager initVideoEncoder out mInitedEncoderCount = ");
        stringBuilder.append(this.cY);
        f.e(str, stringBuilder.toString());
    }

    public void E() {
        this.er = new a(this.es, this.eu, this);
        this.er.f(false);
        this.cY++;
        a();
    }

    public int F() {
        if (this.er != null) {
            this.er.pauseRecording();
        }
        if (this.eq != null) {
            this.eq.pauseRecording();
        }
        return 0;
    }

    public int G() {
        synchronized (this.eu) {
            if (this.er != null) {
                this.er.resumeRecording();
            }
            if (this.eq != null) {
                this.eq.resumeRecording();
            }
            this.eu.notifyAll();
        }
        return 0;
    }

    public long H() {
        return this.es == null ? 0 : this.es.L();
    }

    public long I() {
        return this.es == null ? 0 : this.es.M();
    }

    public void a(EGLContext eGLContext, int i, boolean z) {
        f.d(a, "MediaManager initVideoEncoderWithSharedContext in");
        this.eq = new h(this.es, this.b, this.c, this.eu, this, eGLContext, i);
        String str = a;
        StringBuilder stringBuilder = new StringBuilder();
        stringBuilder.append("MediaManager initVideoEncoderWithSharedContext encoder type = ");
        stringBuilder.append(this.eq.u());
        f.d(str, stringBuilder.toString());
        this.bP = true;
        if (this.bP) {
            if (this.eq.getInputSurface() != null) {
                this.et = new com.arcsoft.avatar.a.e(this.b, this.c, this.d, this.e);
                this.et.e(z);
            } else {
                f.e(a, "initVideoEncoder()->getInputSurface null.");
                if (this.ev != null) {
                    this.ev.onRecordingListener(j.fV, Integer.valueOf(0));
                }
            }
        }
        this.ew = new d();
        this.ew.a(2, this.b, this.c, false);
        this.eq.a(this.ew);
        this.cY++;
        a();
        str = a;
        stringBuilder = new StringBuilder();
        stringBuilder.append("MediaManager initVideoEncoderWithSharedContext out mInitedEncoderCount = ");
        stringBuilder.append(this.cY);
        f.e(str, stringBuilder.toString());
    }

    public void i(int i) {
        if (this.es != null) {
            this.es.i(i);
        }
        this.n = i;
    }

    /* JADX WARNING: Removed duplicated region for block: B:30:0x007b  */
    /* JADX WARNING: Removed duplicated region for block: B:29:0x007a A:{RETURN} */
    /* JADX WARNING: Removed duplicated region for block: B:29:0x007a A:{RETURN} */
    /* JADX WARNING: Removed duplicated region for block: B:30:0x007b  */
    /* Code decompiled incorrectly, please refer to instructions dump. */
    public void j(int i) {
        Exception e;
        String str;
        StringBuilder stringBuilder;
        StringBuilder stringBuilder2;
        if (!this.el) {
            f.e(a, "drawSurfaceWithTextureId()-> MediaManager has not been initialized.");
        } else if (i <= 0) {
            stringBuilder2 = new StringBuilder();
            stringBuilder2.append("textureId must >0 , your textureId=");
            stringBuilder2.append(i);
            throw new IllegalArgumentException(stringBuilder2.toString());
        } else if (this.et != null) {
            f.d(a, "drawSurfaceWithTextureId()->A-");
            c cVar = null;
            boolean z = true;
            try {
                this.eq.lock();
                if (this.ew.C()) {
                    c y = this.ew.y();
                    if (y != null) {
                        try {
                            if (y.mIsInited) {
                                cVar = y;
                            }
                        } catch (Exception e2) {
                            e = e2;
                            cVar = y;
                            try {
                                str = a;
                                stringBuilder = new StringBuilder();
                                stringBuilder.append("drawSurfaceWithTextureId meet error when get lock : ");
                                stringBuilder.append(e.getMessage());
                                f.d(str, stringBuilder.toString());
                                z = false;
                                if (!z) {
                                }
                            } finally {
                                cVar = this.eq;
                                cVar.v();
                            }
                        }
                    }
                    f.d(a, "drawSurfaceWithTextureId()-> get a null frame item.");
                    this.eq.v();
                    return;
                }
                z = false;
                this.eq.v();
            } catch (Exception e3) {
                e = e3;
                str = a;
                stringBuilder = new StringBuilder();
                stringBuilder.append("drawSurfaceWithTextureId meet error when get lock : ");
                stringBuilder.append(e.getMessage());
                f.d(str, stringBuilder.toString());
                z = false;
                if (!z) {
                }
            }
            if (!z) {
                this.ew.a(cVar);
                cVar.ee.b(false, false);
                GLES20.glViewport(0, 0, this.b, this.c);
                this.et.f(i);
                cVar.a = GLES30.glFenceSync(37143, 0);
                cVar.ee.c(false, false);
                cVar.ef = false;
                GLES20.glViewport(0, 0, this.bW, this.bX);
                String str2 = a;
                stringBuilder2 = new StringBuilder();
                stringBuilder2.append("drawSurfaceWithTextureId()-> A glError = ");
                stringBuilder2.append(GLES20.glGetError());
                stringBuilder2.append(", fbo = ");
                stringBuilder2.append(cVar);
                stringBuilder2.append(" ,textureId = ");
                stringBuilder2.append(cVar.ee.getTextureId());
                f.d(str2, stringBuilder2.toString());
                try {
                    this.eq.lock();
                    this.ew.A();
                } catch (Exception e4) {
                    String str3 = a;
                    stringBuilder2 = new StringBuilder();
                    stringBuilder2.append("drawSurfaceWithTextureId meet error when get lock : ");
                    stringBuilder2.append(e4.getMessage());
                    f.d(str3, stringBuilder2.toString());
                } catch (Throwable th) {
                    this.eq.w();
                    this.eq.v();
                }
                this.eq.w();
                this.eq.v();
                f.d(a, "drawSurfaceWithTextureId()->C");
            }
        } else {
            throw new RuntimeException("Could not call drawSurfaceWithTextureId() in with a null GLRender.");
        }
    }

    public void onRecordingListener(int i, Object obj) {
        String str = a;
        StringBuilder stringBuilder = new StringBuilder();
        stringBuilder.append("onRecordingListener()->in msg = ");
        stringBuilder.append(i);
        stringBuilder.append(" ,value = ");
        stringBuilder.append((Integer) obj);
        f.d(str, stringBuilder.toString());
        int i2 = j.fN;
        switch (i) {
            case j.fP /*545*/:
            case j.fQ /*546*/:
            case j.fR /*547*/:
            case j.fS /*548*/:
            case j.fT /*549*/:
                i2 = j.fL;
                break;
            default:
                switch (i) {
                    case j.fU /*561*/:
                    case j.fV /*562*/:
                    case j.fW /*563*/:
                    case j.fX /*564*/:
                    case j.fY /*565*/:
                        i2 = j.fM;
                        break;
                    default:
                        switch (i) {
                            case j.fZ /*609*/:
                            case j.ga /*610*/:
                            case j.gb /*611*/:
                            case j.gc /*612*/:
                            case j.gd /*613*/:
                            case j.ge /*614*/:
                                break;
                            default:
                                switch (i) {
                                    case j.gf /*625*/:
                                    case j.gg /*626*/:
                                    case j.gh /*627*/:
                                        i2 = j.fO;
                                        break;
                                    default:
                                        i2 = i;
                                        break;
                                }
                        }
                }
        }
        if (this.ev != null) {
            this.ev.onRecordingListener(i2, obj);
        }
        f.d(a, "onRecordingListener()->out");
    }

    public void startRecording() {
        if (!this.el || this.es == null) {
            throw new RuntimeException("Unit Encoder or Muxer is null.");
        }
        String str;
        StringBuilder stringBuilder;
        if (this.eq != null) {
            this.eq.startRecording();
        } else {
            str = a;
            stringBuilder = new StringBuilder();
            stringBuilder.append("startRecording()-> VideoEncoder is null. maxEncoderCount=");
            stringBuilder.append(this.n);
            f.i(str, stringBuilder.toString());
        }
        if (this.er != null) {
            this.er.startRecording();
            return;
        }
        str = a;
        stringBuilder = new StringBuilder();
        stringBuilder.append("startRecording()-> AudioEncoder is null. maxEncoderCount=");
        stringBuilder.append(this.n);
        f.i(str, stringBuilder.toString());
    }

    public void stopRecording() {
        synchronized (this.eu) {
            this.eu.notifyAll();
        }
        if (this.eq != null) {
            this.eq.stopRecording();
            this.eq.release(true);
            this.eq = null;
        }
        if (this.er != null) {
            this.er.stopRecording();
            this.er.release(false);
            this.er = null;
        }
        if (this.et != null) {
            this.et.n();
            this.et = null;
        }
        if (this.ew != null) {
            this.ew.unInit();
            this.ew = null;
        }
        this.es = null;
        this.eu = null;
    }
}
