package com.bumptech.glide.load.resource.gif;

import android.graphics.Bitmap;
import android.os.Handler;
import android.os.Handler.Callback;
import android.os.Looper;
import android.os.Message;
import android.os.SystemClock;
import android.support.annotation.NonNull;
import android.support.annotation.Nullable;
import android.support.annotation.VisibleForTesting;
import com.bumptech.glide.c;
import com.bumptech.glide.h;
import com.bumptech.glide.i;
import com.bumptech.glide.load.engine.bitmap_recycle.d;
import com.bumptech.glide.load.engine.g;
import com.bumptech.glide.request.a.f;
import com.bumptech.glide.request.target.l;
import com.bumptech.glide.util.k;
import java.nio.ByteBuffer;
import java.util.ArrayList;
import java.util.List;

class GifFrameLoader {
    final i Z;
    private final List<a> callbacks;
    private com.bumptech.glide.load.i<Bitmap> gn;
    private final Handler handler;
    private final d i;
    private boolean isRunning;
    private final com.bumptech.glide.b.a lI;
    private boolean lJ;
    private boolean lK;
    private h<Bitmap> lL;
    private DelayTarget lM;
    private boolean lN;
    private DelayTarget lO;
    private Bitmap lP;
    private DelayTarget lQ;
    @Nullable
    private OnEveryFrameListener lR;

    @VisibleForTesting
    static class DelayTarget extends l<Bitmap> {
        private final Handler handler;
        final int index;
        private final long lS;
        private Bitmap lT;

        DelayTarget(Handler handler, int i, long j) {
            this.handler = handler;
            this.index = i;
            this.lS = j;
        }

        Bitmap cO() {
            return this.lT;
        }

        public void a(@NonNull Bitmap bitmap, @Nullable f<? super Bitmap> fVar) {
            this.lT = bitmap;
            this.handler.sendMessageAtTime(this.handler.obtainMessage(1, this), this.lS);
        }
    }

    @VisibleForTesting
    interface OnEveryFrameListener {
        void cI();
    }

    public interface a {
        void cI();
    }

    private class b implements Callback {
        static final int lU = 1;
        static final int lV = 2;

        b() {
        }

        public boolean handleMessage(Message message) {
            if (message.what == 1) {
                GifFrameLoader.this.onFrameReady((DelayTarget) message.obj);
                return true;
            }
            if (message.what == 2) {
                GifFrameLoader.this.Z.d((DelayTarget) message.obj);
            }
            return false;
        }
    }

    GifFrameLoader(c cVar, com.bumptech.glide.b.a aVar, int i, int i2, com.bumptech.glide.load.i<Bitmap> iVar, Bitmap bitmap) {
        this(cVar.e(), c.f(cVar.getContext()), aVar, null, a(c.f(cVar.getContext()), i, i2), iVar, bitmap);
    }

    GifFrameLoader(d dVar, i iVar, com.bumptech.glide.b.a aVar, Handler handler, h<Bitmap> hVar, com.bumptech.glide.load.i<Bitmap> iVar2, Bitmap bitmap) {
        this.callbacks = new ArrayList();
        this.Z = iVar;
        if (handler == null) {
            handler = new Handler(Looper.getMainLooper(), new b());
        }
        this.i = dVar;
        this.handler = handler;
        this.lL = hVar;
        this.lI = aVar;
        a(iVar2, bitmap);
    }

    void a(com.bumptech.glide.load.i<Bitmap> iVar, Bitmap bitmap) {
        this.gn = (com.bumptech.glide.load.i) com.bumptech.glide.util.i.checkNotNull(iVar);
        this.lP = (Bitmap) com.bumptech.glide.util.i.checkNotNull(bitmap);
        this.lL = this.lL.b(new com.bumptech.glide.request.f().b((com.bumptech.glide.load.i) iVar));
    }

    com.bumptech.glide.load.i<Bitmap> cB() {
        return this.gn;
    }

    Bitmap cA() {
        return this.lP;
    }

    void a(a aVar) {
        if (this.lN) {
            throw new IllegalStateException("Cannot subscribe to a cleared frame loader");
        } else if (this.callbacks.contains(aVar)) {
            throw new IllegalStateException("Cannot subscribe twice in a row");
        } else {
            boolean isEmpty = this.callbacks.isEmpty();
            this.callbacks.add(aVar);
            if (isEmpty) {
                start();
            }
        }
    }

    void b(a aVar) {
        this.callbacks.remove(aVar);
        if (this.callbacks.isEmpty()) {
            stop();
        }
    }

    int getWidth() {
        return cJ().getWidth();
    }

    int getHeight() {
        return cJ().getHeight();
    }

    int getSize() {
        return this.lI.T() + getFrameSize();
    }

    int getCurrentIndex() {
        return this.lM != null ? this.lM.index : -1;
    }

    private int getFrameSize() {
        return k.i(cJ().getWidth(), cJ().getHeight(), cJ().getConfig());
    }

    ByteBuffer getBuffer() {
        return this.lI.getData().asReadOnlyBuffer();
    }

    int getFrameCount() {
        return this.lI.getFrameCount();
    }

    int getLoopCount() {
        return this.lI.S();
    }

    private void start() {
        if (!this.isRunning) {
            this.isRunning = true;
            this.lN = false;
            cK();
        }
    }

    private void stop() {
        this.isRunning = false;
    }

    void clear() {
        this.callbacks.clear();
        cL();
        stop();
        if (this.lM != null) {
            this.Z.d(this.lM);
            this.lM = null;
        }
        if (this.lO != null) {
            this.Z.d(this.lO);
            this.lO = null;
        }
        if (this.lQ != null) {
            this.Z.d(this.lQ);
            this.lQ = null;
        }
        this.lI.clear();
        this.lN = true;
    }

    Bitmap cJ() {
        return this.lM != null ? this.lM.cO() : this.lP;
    }

    private void cK() {
        if (this.isRunning && !this.lJ) {
            if (this.lK) {
                com.bumptech.glide.util.i.a(this.lQ == null, "Pending target must be null when starting from the first frame");
                this.lI.Q();
                this.lK = false;
            }
            if (this.lQ != null) {
                DelayTarget delayTarget = this.lQ;
                this.lQ = null;
                onFrameReady(delayTarget);
                return;
            }
            this.lJ = true;
            long uptimeMillis = SystemClock.uptimeMillis() + ((long) this.lI.O());
            this.lI.advance();
            this.lO = new DelayTarget(this.handler, this.lI.P(), uptimeMillis);
            this.lL.b(com.bumptech.glide.request.f.j(cN())).load(this.lI).b(this.lO);
        }
    }

    private void cL() {
        if (this.lP != null) {
            this.i.d(this.lP);
            this.lP = null;
        }
    }

    void cM() {
        com.bumptech.glide.util.i.a(this.isRunning ^ true, "Can't restart a running animation");
        this.lK = true;
        if (this.lQ != null) {
            this.Z.d(this.lQ);
            this.lQ = null;
        }
    }

    @VisibleForTesting
    void setOnEveryFrameReadyListener(@Nullable OnEveryFrameListener onEveryFrameListener) {
        this.lR = onEveryFrameListener;
    }

    @VisibleForTesting
    void onFrameReady(DelayTarget delayTarget) {
        if (this.lR != null) {
            this.lR.cI();
        }
        this.lJ = false;
        if (this.lN) {
            this.handler.obtainMessage(2, delayTarget).sendToTarget();
        } else if (this.isRunning) {
            if (delayTarget.cO() != null) {
                cL();
                DelayTarget delayTarget2 = this.lM;
                this.lM = delayTarget;
                for (int size = this.callbacks.size() - 1; size >= 0; size--) {
                    ((a) this.callbacks.get(size)).cI();
                }
                if (delayTarget2 != null) {
                    this.handler.obtainMessage(2, delayTarget2).sendToTarget();
                }
            }
            cK();
        } else {
            this.lQ = delayTarget;
        }
    }

    private static h<Bitmap> a(i iVar, int i, int i2) {
        return iVar.B().b(com.bumptech.glide.request.f.a(g.fl).i(true).k(true).l(i, i2));
    }

    private static com.bumptech.glide.load.c cN() {
        return new com.bumptech.glide.e.d(Double.valueOf(Math.random()));
    }
}
