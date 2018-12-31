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
    final i X;
    private final List<a> callbacks;
    private com.bumptech.glide.load.i<Bitmap> gn;
    private final Handler handler;
    private final d i;
    private boolean isRunning;
    private final com.bumptech.glide.b.a lJ;
    private boolean lK;
    private boolean lL;
    private h<Bitmap> lM;
    private DelayTarget lN;
    private boolean lO;
    private DelayTarget lP;
    private Bitmap lQ;
    private DelayTarget lR;
    @Nullable
    private OnEveryFrameListener lS;

    @VisibleForTesting
    static class DelayTarget extends l<Bitmap> {
        private final Handler handler;
        final int index;
        private final long lT;
        private Bitmap lU;

        DelayTarget(Handler handler, int i, long j) {
            this.handler = handler;
            this.index = i;
            this.lT = j;
        }

        Bitmap cO() {
            return this.lU;
        }

        public void a(@NonNull Bitmap bitmap, @Nullable f<? super Bitmap> fVar) {
            this.lU = bitmap;
            this.handler.sendMessageAtTime(this.handler.obtainMessage(1, this), this.lT);
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
        static final int lV = 1;
        static final int lW = 2;

        b() {
        }

        public boolean handleMessage(Message message) {
            if (message.what == 1) {
                GifFrameLoader.this.onFrameReady((DelayTarget) message.obj);
                return true;
            }
            if (message.what == 2) {
                GifFrameLoader.this.X.d((DelayTarget) message.obj);
            }
            return false;
        }
    }

    GifFrameLoader(c cVar, com.bumptech.glide.b.a aVar, int i, int i2, com.bumptech.glide.load.i<Bitmap> iVar, Bitmap bitmap) {
        this(cVar.e(), c.f(cVar.getContext()), aVar, null, a(c.f(cVar.getContext()), i, i2), iVar, bitmap);
    }

    GifFrameLoader(d dVar, i iVar, com.bumptech.glide.b.a aVar, Handler handler, h<Bitmap> hVar, com.bumptech.glide.load.i<Bitmap> iVar2, Bitmap bitmap) {
        this.callbacks = new ArrayList();
        this.X = iVar;
        if (handler == null) {
            handler = new Handler(Looper.getMainLooper(), new b());
        }
        this.i = dVar;
        this.handler = handler;
        this.lM = hVar;
        this.lJ = aVar;
        a(iVar2, bitmap);
    }

    void a(com.bumptech.glide.load.i<Bitmap> iVar, Bitmap bitmap) {
        this.gn = (com.bumptech.glide.load.i) com.bumptech.glide.util.i.checkNotNull(iVar);
        this.lQ = (Bitmap) com.bumptech.glide.util.i.checkNotNull(bitmap);
        this.lM = this.lM.b(new com.bumptech.glide.request.f().b((com.bumptech.glide.load.i) iVar));
    }

    com.bumptech.glide.load.i<Bitmap> cB() {
        return this.gn;
    }

    Bitmap cA() {
        return this.lQ;
    }

    void a(a aVar) {
        if (this.lO) {
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
        return this.lJ.T() + getFrameSize();
    }

    int getCurrentIndex() {
        return this.lN != null ? this.lN.index : -1;
    }

    private int getFrameSize() {
        return k.i(cJ().getWidth(), cJ().getHeight(), cJ().getConfig());
    }

    ByteBuffer getBuffer() {
        return this.lJ.getData().asReadOnlyBuffer();
    }

    int getFrameCount() {
        return this.lJ.getFrameCount();
    }

    int getLoopCount() {
        return this.lJ.S();
    }

    private void start() {
        if (!this.isRunning) {
            this.isRunning = true;
            this.lO = false;
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
        if (this.lN != null) {
            this.X.d(this.lN);
            this.lN = null;
        }
        if (this.lP != null) {
            this.X.d(this.lP);
            this.lP = null;
        }
        if (this.lR != null) {
            this.X.d(this.lR);
            this.lR = null;
        }
        this.lJ.clear();
        this.lO = true;
    }

    Bitmap cJ() {
        return this.lN != null ? this.lN.cO() : this.lQ;
    }

    private void cK() {
        if (this.isRunning && !this.lK) {
            if (this.lL) {
                com.bumptech.glide.util.i.a(this.lR == null, "Pending target must be null when starting from the first frame");
                this.lJ.Q();
                this.lL = false;
            }
            if (this.lR != null) {
                DelayTarget delayTarget = this.lR;
                this.lR = null;
                onFrameReady(delayTarget);
                return;
            }
            this.lK = true;
            long uptimeMillis = SystemClock.uptimeMillis() + ((long) this.lJ.O());
            this.lJ.advance();
            this.lP = new DelayTarget(this.handler, this.lJ.P(), uptimeMillis);
            this.lM.b(com.bumptech.glide.request.f.j(cN())).load(this.lJ).b(this.lP);
        }
    }

    private void cL() {
        if (this.lQ != null) {
            this.i.d(this.lQ);
            this.lQ = null;
        }
    }

    void cM() {
        com.bumptech.glide.util.i.a(this.isRunning ^ true, "Can't restart a running animation");
        this.lL = true;
        if (this.lR != null) {
            this.X.d(this.lR);
            this.lR = null;
        }
    }

    @VisibleForTesting
    void setOnEveryFrameReadyListener(@Nullable OnEveryFrameListener onEveryFrameListener) {
        this.lS = onEveryFrameListener;
    }

    @VisibleForTesting
    void onFrameReady(DelayTarget delayTarget) {
        if (this.lS != null) {
            this.lS.cI();
        }
        this.lK = false;
        if (this.lO) {
            this.handler.obtainMessage(2, delayTarget).sendToTarget();
        } else if (this.isRunning) {
            if (delayTarget.cO() != null) {
                cL();
                DelayTarget delayTarget2 = this.lN;
                this.lN = delayTarget;
                for (int size = this.callbacks.size() - 1; size >= 0; size--) {
                    ((a) this.callbacks.get(size)).cI();
                }
                if (delayTarget2 != null) {
                    this.handler.obtainMessage(2, delayTarget2).sendToTarget();
                }
            }
            cK();
        } else {
            this.lR = delayTarget;
        }
    }

    private static h<Bitmap> a(i iVar, int i, int i2) {
        return iVar.B().b(com.bumptech.glide.request.f.a(g.fl).i(true).k(true).l(i, i2));
    }

    private static com.bumptech.glide.load.c cN() {
        return new com.bumptech.glide.e.d(Double.valueOf(Math.random()));
    }
}
