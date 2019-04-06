package com.arcsoft.avatar.c;

import android.graphics.Bitmap;
import android.graphics.Bitmap.CompressFormat;
import android.graphics.Bitmap.Config;
import android.media.MediaCodec;
import android.media.MediaFormat;
import android.opengl.EGL14;
import android.opengl.EGLContext;
import android.opengl.GLES20;
import android.opengl.GLES30;
import android.view.Surface;
import com.android.camera.storage.Storage;
import com.arcsoft.avatar.a.b;
import com.arcsoft.avatar.a.d;
import com.arcsoft.avatar.a.e;
import com.arcsoft.avatar.d.f;
import com.arcsoft.avatar.d.j;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.OutputStream;
import java.nio.Buffer;
import java.nio.ByteBuffer;
import java.nio.ByteOrder;
import java.util.concurrent.locks.ReentrantLock;

/* compiled from: VideoEncoder */
public class h extends b {
    public static final String NAME = "ARC_V";
    private static final String dz = "Arc_VideoEncoder";
    private static final long eD = 1000000000;
    private static String eE = "video/avc";
    public static final String eI = "Arc_Video_Encoder";
    private static final int w = 10000000;
    private static final int x = 30;
    private static final int y = 10;
    private int B;
    private boolean D;
    private int E;
    private int cf;
    private MediaFormat eF;
    private Surface eG;
    private Thread eH;
    protected long eJ;
    private b eK;
    private EGLContext eL = EGL14.EGL_NO_CONTEXT;
    private e eM;
    private int eN;

    /* compiled from: VideoEncoder */
    public class a extends Thread {
        private ByteBuffer ex;

        public a(ByteBuffer byteBuffer) {
            this.ex = byteBuffer;
        }

        public void run() {
            super.run();
            Bitmap createBitmap = Bitmap.createBitmap(h.this.B, h.this.cf, Config.ARGB_8888);
            createBitmap.copyPixelsFromBuffer(this.ex);
            StringBuilder stringBuilder = new StringBuilder();
            stringBuilder.append("/sdcard/Pictures/_");
            stringBuilder.append(System.currentTimeMillis());
            stringBuilder.append(Storage.JPEG_SUFFIX);
            try {
                OutputStream fileOutputStream = new FileOutputStream(stringBuilder.toString());
                createBitmap.compress(CompressFormat.JPEG, 100, fileOutputStream);
                fileOutputStream.close();
                createBitmap.recycle();
            } catch (FileNotFoundException e) {
                e.printStackTrace();
            } catch (IOException e2) {
                e2.printStackTrace();
            }
        }
    }

    public h(f fVar, int i, int i2, Object obj, g gVar, EGLContext eGLContext, int i3) {
        super(fVar, obj, gVar);
        this.B = i;
        this.cf = i2;
        this.eH = null;
        this.eN = i3;
        this.eL = eGLContext;
        f(true);
        b();
        this.dY = new ReentrantLock();
        this.dZ = this.dY.newCondition();
        String str = dz;
        StringBuilder stringBuilder = new StringBuilder();
        stringBuilder.append("VideoEncoder constructor mCustomerBitRate = ");
        stringBuilder.append(this.eN);
        f.d(str, stringBuilder.toString());
        str = dz;
        stringBuilder = new StringBuilder();
        stringBuilder.append("VideoEncoder constructor mWidth = ");
        stringBuilder.append(i);
        stringBuilder.append(" ,mHeight = ");
        stringBuilder.append(i2);
        f.d(str, stringBuilder.toString());
    }

    private void a(boolean z) {
        f.d(dz, "initVideoEncoder()->in");
        this.eF = MediaFormat.createVideoFormat(eE, this.B, this.cf);
        this.eF.setInteger("color-format", 2130708361);
        this.eF.setInteger("bitrate", this.eN);
        this.eF.setInteger("frame-rate", 30);
        this.eF.setInteger("i-frame-interval", 10);
        try {
            this.dR = MediaCodec.createEncoderByType(eE);
            String str = dz;
            StringBuilder stringBuilder = new StringBuilder();
            stringBuilder.append("initVideoEncoder(): selected_codec_name = ");
            stringBuilder.append(this.dR.getName());
            f.i(str, stringBuilder.toString());
        } catch (IOException e) {
            f.e(dz, "initVideoEncoder()->createEncoderByType failed.");
            e.printStackTrace();
            if (this.dV != null) {
                this.dV.onRecordingListener(j.fU, Integer.valueOf(0));
            }
        }
        try {
            this.dR.configure(this.eF, null, null, 1);
        } catch (Exception e2) {
            f.e(dz, "initVideoEncoder()->configure failed.");
            e2.printStackTrace();
            if (this.dV != null) {
                this.dV.onRecordingListener(j.fV, Integer.valueOf(0));
            }
        }
        if (z) {
            try {
                this.eG = this.dR.createInputSurface();
            } catch (Exception e3) {
                f.e(dz, "initVideoEncoder()->createInputSurface failed.");
                e3.printStackTrace();
                if (this.dV != null) {
                    this.dV.onRecordingListener(j.fV, Integer.valueOf(0));
                }
            }
        } else {
            this.eG = null;
        }
        f.d(dz, "initVideoEncoder()->out");
    }

    private void b() {
        this.eK = new b(getInputSurface(), this.eL);
    }

    private void c() {
        this.eM = new e(this.B, this.cf, this.E, true);
        this.eM.e(false);
        String str = dz;
        StringBuilder stringBuilder = new StringBuilder();
        stringBuilder.append("VideoEncoder initGL glError = ");
        stringBuilder.append(GLES20.glGetError());
        f.d(str, stringBuilder.toString());
    }

    private void d() {
        this.eM.n();
        this.eM = null;
    }

    private void g() {
        Buffer allocateDirect = ByteBuffer.allocateDirect((this.B * this.cf) * 4);
        allocateDirect.order(ByteOrder.nativeOrder());
        GLES20.glReadPixels(0, 0, this.B, this.cf, 6408, 5121, allocateDirect);
        new a(allocateDirect).start();
    }

    public void f(boolean z) {
        a(z);
        if (this.dR == null) {
            throw new RuntimeException("Init video encoder is failed.");
        }
    }

    public Surface getInputSurface() {
        return this.dR != null ? this.eG : super.getInputSurface();
    }

    public void pauseRecording() {
        if (!this.e) {
            this.e = true;
            this.eJ = System.nanoTime();
        }
    }

    public void release(boolean z) {
        StringBuilder stringBuilder;
        String str = eI;
        try {
            this.dY.lock();
        } catch (Exception e) {
            String str2 = dz;
            stringBuilder = new StringBuilder();
            stringBuilder.append("release()-> meet error when get lock : ");
            stringBuilder.append(e.getMessage());
            f.e(str2, stringBuilder.toString());
        } catch (Throwable th) {
            w();
            this.dY.unlock();
        }
        w();
        this.dY.unlock();
        if (this.eH != null) {
            try {
                this.eH.join();
            } catch (InterruptedException e2) {
                f.d(dz, "Encoder Thread has been Interrupted, errors may be occurred.");
                e2.printStackTrace();
            } catch (Throwable th2) {
                this.eH = null;
            }
            this.eH = null;
        }
        if (this.eK != null) {
            this.eK.release();
            this.eK = null;
        }
        this.eL = EGL14.EGL_NO_CONTEXT;
        String str3 = dz;
        stringBuilder = new StringBuilder();
        stringBuilder.append("VideoEncoder release() encoder thread exit. threadName =");
        stringBuilder.append(str);
        f.d(str3, stringBuilder.toString());
        this.eG = null;
        this.dY = null;
        this.dZ = null;
        this.ea = null;
        super.release(z);
    }

    public void resumeRecording() {
        if (this.e) {
            this.e = false;
            this.dP += System.nanoTime() - this.eJ;
            this.dU.add(Long.valueOf(this.dP));
        }
    }

    public void startRecording() {
        if (this.eH == null) {
            super.startRecording();
            this.eH = new Thread(eI) {
                public void run() {
                    String str;
                    StringBuilder stringBuilder;
                    super.run();
                    setName(h.NAME);
                    int i = 0;
                    try {
                        h.this.dR.start();
                        h.this.eK.makeCurrent();
                        h.this.c();
                        while (!h.this.dN) {
                            c z;
                            c cVar = null;
                            try {
                                h.this.lock();
                                while (h.this.ea.queueSize() == 0 && !h.this.dN) {
                                    try {
                                        f.d(h.dz, "VideoEncoder frame_item_wait");
                                        h.this.dZ.await();
                                    } catch (InterruptedException e) {
                                        e.printStackTrace();
                                    }
                                }
                                z = h.this.ea.z();
                            } catch (Exception e2) {
                                e2.printStackTrace();
                                str = h.dz;
                                stringBuilder = new StringBuilder();
                                stringBuilder.append("VideoEncoder meet exception when get item : ");
                                stringBuilder.append(e2.getMessage());
                                f.e(str, stringBuilder.toString());
                            } finally {
                                cVar = h.this;
                                cVar.v();
                            }
                            cVar = z;
                            if (cVar != null) {
                                d dVar = cVar.ee;
                                h.this.drain();
                                str = h.dz;
                                stringBuilder = new StringBuilder();
                                stringBuilder.append("VideoEncoder frame_item_index = ");
                                stringBuilder.append(cVar.eg);
                                f.d(str, stringBuilder.toString());
                                if (0 != cVar.a) {
                                    str = h.dz;
                                    stringBuilder = new StringBuilder();
                                    stringBuilder.append("VideoEncoder wait gpu by sync = ");
                                    stringBuilder.append(cVar.a);
                                    f.d(str, stringBuilder.toString());
                                    GLES30.glWaitSync(cVar.a, i, -1);
                                }
                                h.this.eM.f(dVar.getTextureId());
                                try {
                                    h.this.lock();
                                    h.this.ea.B();
                                } catch (Exception e3) {
                                    e3.printStackTrace();
                                    String str2 = h.dz;
                                    StringBuilder stringBuilder2 = new StringBuilder();
                                    stringBuilder2.append("VideoEncoder meet exception when add item : ");
                                    stringBuilder2.append(e3.getMessage());
                                    f.e(str2, stringBuilder2.toString());
                                } catch (Throwable th) {
                                    h.this.v();
                                }
                                h.this.v();
                                h.this.eK.swapBuffers();
                            }
                        }
                        h.this.a = true;
                        h.this.dR.signalEndOfInputStream();
                        h.this.drain();
                        h.this.d();
                        h.this.eK.i();
                    } catch (Exception e32) {
                        e32.printStackTrace();
                        if (h.this.dV != null) {
                            h.this.dV.onRecordingListener(j.fW, Integer.valueOf(0));
                        }
                    }
                }
            };
            this.eH.start();
            f.d(dz, "VideoEncoder is started.");
            return;
        }
        f.e(dz, "startRecording()-> Video encoder thread has been started already, can not start twice.");
        throw new RuntimeException("Video encoder thread has been started already, can not start twice.");
    }

    public void stopRecording() {
        super.stopRecording();
        try {
            this.dY.lock();
        } catch (Exception e) {
            String str = dz;
            StringBuilder stringBuilder = new StringBuilder();
            stringBuilder.append("stopRecording()-> meet error when get lock : ");
            stringBuilder.append(e.getMessage());
            f.e(str, stringBuilder.toString());
        } catch (Throwable th) {
            w();
            this.dY.unlock();
        }
        w();
        this.dY.unlock();
    }

    public void t() {
    }
}
