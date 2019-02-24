package com.bumptech.glide.request;

import android.content.res.Resources.Theme;
import android.graphics.Bitmap;
import android.graphics.Bitmap.CompressFormat;
import android.graphics.drawable.BitmapDrawable;
import android.graphics.drawable.Drawable;
import android.support.annotation.CheckResult;
import android.support.annotation.DrawableRes;
import android.support.annotation.FloatRange;
import android.support.annotation.IntRange;
import android.support.annotation.NonNull;
import android.support.annotation.Nullable;
import com.bumptech.glide.Priority;
import com.bumptech.glide.e.b;
import com.bumptech.glide.load.DecodeFormat;
import com.bumptech.glide.load.c;
import com.bumptech.glide.load.d;
import com.bumptech.glide.load.e;
import com.bumptech.glide.load.engine.g;
import com.bumptech.glide.load.i;
import com.bumptech.glide.load.resource.bitmap.DownsampleStrategy;
import com.bumptech.glide.load.resource.bitmap.VideoDecoder;
import com.bumptech.glide.load.resource.bitmap.j;
import com.bumptech.glide.load.resource.bitmap.k;
import com.bumptech.glide.load.resource.bitmap.l;
import com.bumptech.glide.load.resource.bitmap.n;
import com.bumptech.glide.load.resource.bitmap.p;
import com.bumptech.glide.load.resource.bitmap.q;
import com.bumptech.glide.util.CachedHashCodeArrayMap;
import java.util.Map;

/* compiled from: RequestOptions */
public class f implements Cloneable {
    private static final int PRIORITY = 8;
    private static final int UNSET = -1;
    @Nullable
    private static f nA = null;
    @Nullable
    private static f nB = null;
    @Nullable
    private static f nC = null;
    @Nullable
    private static f nD = null;
    @Nullable
    private static f nE = null;
    @Nullable
    private static f nF = null;
    private static final int nf = 2;
    private static final int ng = 4;
    private static final int nh = 16;
    private static final int ni = 32;
    private static final int nj = 64;
    private static final int nk = 128;
    private static final int nl = 256;
    private static final int nm = 512;
    private static final int nn = 1024;
    private static final int no = 2048;
    private static final int np = 4096;
    private static final int nq = 8192;
    private static final int nr = 16384;
    private static final int ns = 32768;
    private static final int nt = 65536;
    private static final int nu = 131072;
    private static final int nv = 262144;
    private static final int nw = 524288;
    private static final int nx = 1048576;
    @Nullable
    private static f ny;
    @Nullable
    private static f nz;
    private boolean dU = true;
    private boolean eD;
    @NonNull
    private c ef = b.eB();
    @NonNull
    private com.bumptech.glide.load.f eh = new com.bumptech.glide.load.f();
    @NonNull
    private Class<?> ej = Object.class;
    @NonNull
    private Map<Class<?>, i<?>> el = new CachedHashCodeArrayMap();
    @NonNull
    private Priority eo = Priority.NORMAL;
    @NonNull
    private g ep = g.fo;
    private boolean eq;
    private boolean er = true;
    private boolean fQ;
    private boolean isLocked;
    private int nG;
    private float nH = 1.0f;
    @Nullable
    private Drawable nI;
    private int nJ;
    @Nullable
    private Drawable nK;
    private int nL;
    private int nM = -1;
    private int nN = -1;
    private boolean nO = true;
    @Nullable
    private Drawable nP;
    private int nQ;
    @Nullable
    private Theme nR;
    private boolean nS;
    private boolean nT;

    @CheckResult
    @NonNull
    public static f g(@FloatRange(from = 0.0d, to = 1.0d) float f) {
        return new f().h(f);
    }

    @CheckResult
    @NonNull
    public static f a(@NonNull g gVar) {
        return new f().b(gVar);
    }

    @CheckResult
    @NonNull
    public static f b(@NonNull Priority priority) {
        return new f().c(priority);
    }

    @CheckResult
    @NonNull
    public static f g(@Nullable Drawable drawable) {
        return new f().i(drawable);
    }

    @CheckResult
    @NonNull
    public static f E(@DrawableRes int i) {
        return new f().J(i);
    }

    @CheckResult
    @NonNull
    public static f h(@Nullable Drawable drawable) {
        return new f().k(drawable);
    }

    @CheckResult
    @NonNull
    public static f F(@DrawableRes int i) {
        return new f().L(i);
    }

    @CheckResult
    @NonNull
    public static f g(boolean z) {
        if (z) {
            if (ny == null) {
                ny = new f().k(true).dG();
            }
            return ny;
        }
        if (nz == null) {
            nz = new f().k(false).dG();
        }
        return nz;
    }

    @CheckResult
    @NonNull
    public static f j(@IntRange(from = 0) int i, @IntRange(from = 0) int i2) {
        return new f().l(i, i2);
    }

    @CheckResult
    @NonNull
    public static f G(@IntRange(from = 0) int i) {
        return j(i, i);
    }

    @CheckResult
    @NonNull
    public static f j(@NonNull c cVar) {
        return new f().k(cVar);
    }

    @CheckResult
    @NonNull
    public static f dl() {
        if (nA == null) {
            nA = new f().dy().dG();
        }
        return nA;
    }

    @CheckResult
    @NonNull
    public static f dm() {
        if (nB == null) {
            nB = new f().dA().dG();
        }
        return nB;
    }

    @CheckResult
    @NonNull
    public static f dn() {
        if (nC == null) {
            nC = new f().dw().dG();
        }
        return nC;
    }

    @CheckResult
    @NonNull
    /* renamed from: do */
    public static f m1do() {
        if (nD == null) {
            nD = new f().dC().dG();
        }
        return nD;
    }

    @CheckResult
    @NonNull
    public static f a(@NonNull i<Bitmap> iVar) {
        return new f().b((i) iVar);
    }

    @CheckResult
    @NonNull
    public static f dp() {
        if (nE == null) {
            nE = new f().dD().dG();
        }
        return nE;
    }

    @CheckResult
    @NonNull
    public static <T> f b(@NonNull e<T> eVar, @NonNull T t) {
        return new f().c((e) eVar, (Object) t);
    }

    @CheckResult
    @NonNull
    public static f o(@NonNull Class<?> cls) {
        return new f().p(cls);
    }

    @CheckResult
    @NonNull
    public static f a(@NonNull DecodeFormat decodeFormat) {
        return new f().b(decodeFormat);
    }

    @CheckResult
    @NonNull
    public static f c(@IntRange(from = 0) long j) {
        return new f().d(j);
    }

    @CheckResult
    @NonNull
    public static f a(@NonNull DownsampleStrategy downsampleStrategy) {
        return new f().b(downsampleStrategy);
    }

    @CheckResult
    @NonNull
    public static f H(@IntRange(from = 0) int i) {
        return new f().O(i);
    }

    @CheckResult
    @NonNull
    public static f I(@IntRange(from = 0, to = 100) int i) {
        return new f().N(i);
    }

    @CheckResult
    @NonNull
    public static f a(@NonNull CompressFormat compressFormat) {
        return new f().b(compressFormat);
    }

    @CheckResult
    @NonNull
    public static f dq() {
        if (nF == null) {
            nF = new f().dE().dG();
        }
        return nF;
    }

    private static boolean k(int i, int i2) {
        return (i & i2) != 0;
    }

    @CheckResult
    @NonNull
    public f h(@FloatRange(from = 0.0d, to = 1.0d) float f) {
        if (this.nS) {
            return clone().h(f);
        }
        if (f < 0.0f || f > 1.0f) {
            throw new IllegalArgumentException("sizeMultiplier must be between 0 and 1");
        }
        this.nH = f;
        this.nG |= 2;
        return dH();
    }

    @CheckResult
    @NonNull
    public f h(boolean z) {
        if (this.nS) {
            return clone().h(z);
        }
        this.nT = z;
        this.nG |= 262144;
        return dH();
    }

    @CheckResult
    @NonNull
    public f i(boolean z) {
        if (this.nS) {
            return clone().i(z);
        }
        this.fQ = z;
        this.nG |= 1048576;
        return dH();
    }

    @CheckResult
    @NonNull
    public f j(boolean z) {
        if (this.nS) {
            return clone().j(z);
        }
        this.eD = z;
        this.nG |= 524288;
        return dH();
    }

    @CheckResult
    @NonNull
    public f b(@NonNull g gVar) {
        if (this.nS) {
            return clone().b(gVar);
        }
        this.ep = (g) com.bumptech.glide.util.i.checkNotNull(gVar);
        this.nG |= 4;
        return dH();
    }

    @CheckResult
    @NonNull
    public f c(@NonNull Priority priority) {
        if (this.nS) {
            return clone().c(priority);
        }
        this.eo = (Priority) com.bumptech.glide.util.i.checkNotNull(priority);
        this.nG |= 8;
        return dH();
    }

    @CheckResult
    @NonNull
    public f i(@Nullable Drawable drawable) {
        if (this.nS) {
            return clone().i(drawable);
        }
        this.nK = drawable;
        this.nG |= 64;
        return dH();
    }

    @CheckResult
    @NonNull
    public f J(@DrawableRes int i) {
        if (this.nS) {
            return clone().J(i);
        }
        this.nL = i;
        this.nG |= 128;
        return dH();
    }

    @CheckResult
    @NonNull
    public f j(@Nullable Drawable drawable) {
        if (this.nS) {
            return clone().j(drawable);
        }
        this.nP = drawable;
        this.nG |= 8192;
        return dH();
    }

    @CheckResult
    @NonNull
    public f K(@DrawableRes int i) {
        if (this.nS) {
            return clone().K(i);
        }
        this.nQ = i;
        this.nG |= 16384;
        return dH();
    }

    @CheckResult
    @NonNull
    public f k(@Nullable Drawable drawable) {
        if (this.nS) {
            return clone().k(drawable);
        }
        this.nI = drawable;
        this.nG |= 16;
        return dH();
    }

    @CheckResult
    @NonNull
    public f L(@DrawableRes int i) {
        if (this.nS) {
            return clone().L(i);
        }
        this.nJ = i;
        this.nG |= 32;
        return dH();
    }

    @CheckResult
    @NonNull
    public f a(@Nullable Theme theme) {
        if (this.nS) {
            return clone().a(theme);
        }
        this.nR = theme;
        this.nG |= 32768;
        return dH();
    }

    @CheckResult
    @NonNull
    public f k(boolean z) {
        if (this.nS) {
            return clone().k(true);
        }
        this.dU = z ^ true;
        this.nG |= 256;
        return dH();
    }

    @CheckResult
    @NonNull
    public f l(int i, int i2) {
        if (this.nS) {
            return clone().l(i, i2);
        }
        this.nN = i;
        this.nM = i2;
        this.nG |= 512;
        return dH();
    }

    @CheckResult
    @NonNull
    public f M(int i) {
        return l(i, i);
    }

    @CheckResult
    @NonNull
    public f k(@NonNull c cVar) {
        if (this.nS) {
            return clone().k(cVar);
        }
        this.ef = (c) com.bumptech.glide.util.i.checkNotNull(cVar);
        this.nG |= 1024;
        return dH();
    }

    @CheckResult
    /* renamed from: dr */
    public f clone() {
        try {
            f fVar = (f) super.clone();
            fVar.eh = new com.bumptech.glide.load.f();
            fVar.eh.a(this.eh);
            fVar.el = new CachedHashCodeArrayMap();
            fVar.el.putAll(this.el);
            fVar.isLocked = false;
            fVar.nS = false;
            return fVar;
        } catch (Throwable e) {
            throw new RuntimeException(e);
        }
    }

    @CheckResult
    @NonNull
    public <T> f c(@NonNull e<T> eVar, @NonNull T t) {
        if (this.nS) {
            return clone().c((e) eVar, (Object) t);
        }
        com.bumptech.glide.util.i.checkNotNull(eVar);
        com.bumptech.glide.util.i.checkNotNull(t);
        this.eh.a(eVar, t);
        return dH();
    }

    @CheckResult
    @NonNull
    public f p(@NonNull Class<?> cls) {
        if (this.nS) {
            return clone().p(cls);
        }
        this.ej = (Class) com.bumptech.glide.util.i.checkNotNull(cls);
        this.nG |= 4096;
        return dH();
    }

    public final boolean ds() {
        return this.nO;
    }

    public final boolean dt() {
        return isSet(2048);
    }

    public final boolean isLocked() {
        return this.isLocked;
    }

    @CheckResult
    @NonNull
    public f b(@NonNull CompressFormat compressFormat) {
        return c(com.bumptech.glide.load.resource.bitmap.e.jU, com.bumptech.glide.util.i.checkNotNull(compressFormat));
    }

    @CheckResult
    @NonNull
    public f N(@IntRange(from = 0, to = 100) int i) {
        return c(com.bumptech.glide.load.resource.bitmap.e.jT, Integer.valueOf(i));
    }

    @CheckResult
    @NonNull
    public f d(@IntRange(from = 0) long j) {
        return c(VideoDecoder.lk, Long.valueOf(j));
    }

    @CheckResult
    @NonNull
    public f b(@NonNull DecodeFormat decodeFormat) {
        com.bumptech.glide.util.i.checkNotNull(decodeFormat);
        return c(n.kE, (Object) decodeFormat).c(com.bumptech.glide.load.resource.gif.g.kE, (Object) decodeFormat);
    }

    @CheckResult
    @NonNull
    public f du() {
        return c(n.kH, Boolean.valueOf(false));
    }

    @CheckResult
    @NonNull
    public f b(@NonNull DownsampleStrategy downsampleStrategy) {
        return c(DownsampleStrategy.kA, com.bumptech.glide.util.i.checkNotNull(downsampleStrategy));
    }

    @CheckResult
    @NonNull
    public f O(@IntRange(from = 0) int i) {
        return c(com.bumptech.glide.load.model.a.b.jO, Integer.valueOf(i));
    }

    @CheckResult
    @NonNull
    public f dv() {
        return a(DownsampleStrategy.ku, new j());
    }

    @CheckResult
    @NonNull
    public f dw() {
        return b(DownsampleStrategy.ku, new j());
    }

    @CheckResult
    @NonNull
    public f dx() {
        return d(DownsampleStrategy.kt, new q());
    }

    @CheckResult
    @NonNull
    public f dy() {
        return c(DownsampleStrategy.kt, new q());
    }

    @CheckResult
    @NonNull
    public f dz() {
        return d(DownsampleStrategy.kx, new k());
    }

    @CheckResult
    @NonNull
    public f dA() {
        return c(DownsampleStrategy.kx, new k());
    }

    @CheckResult
    @NonNull
    public f dB() {
        return a(DownsampleStrategy.ku, new l());
    }

    @CheckResult
    @NonNull
    public f dC() {
        return b(DownsampleStrategy.kx, new l());
    }

    @NonNull
    final f a(@NonNull DownsampleStrategy downsampleStrategy, @NonNull i<Bitmap> iVar) {
        if (this.nS) {
            return clone().a(downsampleStrategy, (i) iVar);
        }
        b(downsampleStrategy);
        return a((i) iVar, false);
    }

    @CheckResult
    @NonNull
    final f b(@NonNull DownsampleStrategy downsampleStrategy, @NonNull i<Bitmap> iVar) {
        if (this.nS) {
            return clone().b(downsampleStrategy, (i) iVar);
        }
        b(downsampleStrategy);
        return b((i) iVar);
    }

    @NonNull
    private f c(@NonNull DownsampleStrategy downsampleStrategy, @NonNull i<Bitmap> iVar) {
        return a(downsampleStrategy, (i) iVar, true);
    }

    @NonNull
    private f d(@NonNull DownsampleStrategy downsampleStrategy, @NonNull i<Bitmap> iVar) {
        return a(downsampleStrategy, (i) iVar, false);
    }

    @NonNull
    private f a(@NonNull DownsampleStrategy downsampleStrategy, @NonNull i<Bitmap> iVar, boolean z) {
        f b = z ? b(downsampleStrategy, (i) iVar) : a(downsampleStrategy, (i) iVar);
        b.er = true;
        return b;
    }

    @CheckResult
    @NonNull
    public f b(@NonNull i<Bitmap> iVar) {
        return a((i) iVar, true);
    }

    @CheckResult
    @NonNull
    public f a(@NonNull i<Bitmap>... iVarArr) {
        return a(new d((i[]) iVarArr), true);
    }

    @CheckResult
    @NonNull
    public f c(@NonNull i<Bitmap> iVar) {
        return a((i) iVar, false);
    }

    @NonNull
    private f a(@NonNull i<Bitmap> iVar, boolean z) {
        if (this.nS) {
            return clone().a((i) iVar, z);
        }
        i pVar = new p(iVar, z);
        a(Bitmap.class, (i) iVar, z);
        a(Drawable.class, pVar, z);
        a(BitmapDrawable.class, pVar.co(), z);
        a(com.bumptech.glide.load.resource.gif.b.class, new com.bumptech.glide.load.resource.gif.e(iVar), z);
        return dH();
    }

    @CheckResult
    @NonNull
    public <T> f a(@NonNull Class<T> cls, @NonNull i<T> iVar) {
        return a((Class) cls, (i) iVar, false);
    }

    @NonNull
    private <T> f a(@NonNull Class<T> cls, @NonNull i<T> iVar, boolean z) {
        if (this.nS) {
            return clone().a((Class) cls, (i) iVar, z);
        }
        com.bumptech.glide.util.i.checkNotNull(cls);
        com.bumptech.glide.util.i.checkNotNull(iVar);
        this.el.put(cls, iVar);
        this.nG |= 2048;
        this.nO = true;
        this.nG |= 65536;
        this.er = false;
        if (z) {
            this.nG |= 131072;
            this.eq = true;
        }
        return dH();
    }

    @CheckResult
    @NonNull
    public <T> f b(@NonNull Class<T> cls, @NonNull i<T> iVar) {
        return a((Class) cls, (i) iVar, true);
    }

    @CheckResult
    @NonNull
    public f dD() {
        if (this.nS) {
            return clone().dD();
        }
        this.el.clear();
        this.nG &= -2049;
        this.eq = false;
        this.nG &= -131073;
        this.nO = false;
        this.nG |= 65536;
        this.er = true;
        return dH();
    }

    @CheckResult
    @NonNull
    public f dE() {
        return c(com.bumptech.glide.load.resource.gif.g.lX, Boolean.valueOf(true));
    }

    @CheckResult
    @NonNull
    public f g(@NonNull f fVar) {
        if (this.nS) {
            return clone().g(fVar);
        }
        if (k(fVar.nG, 2)) {
            this.nH = fVar.nH;
        }
        if (k(fVar.nG, 262144)) {
            this.nT = fVar.nT;
        }
        if (k(fVar.nG, 1048576)) {
            this.fQ = fVar.fQ;
        }
        if (k(fVar.nG, 4)) {
            this.ep = fVar.ep;
        }
        if (k(fVar.nG, 8)) {
            this.eo = fVar.eo;
        }
        if (k(fVar.nG, 16)) {
            this.nI = fVar.nI;
        }
        if (k(fVar.nG, 32)) {
            this.nJ = fVar.nJ;
        }
        if (k(fVar.nG, 64)) {
            this.nK = fVar.nK;
        }
        if (k(fVar.nG, 128)) {
            this.nL = fVar.nL;
        }
        if (k(fVar.nG, 256)) {
            this.dU = fVar.dU;
        }
        if (k(fVar.nG, 512)) {
            this.nN = fVar.nN;
            this.nM = fVar.nM;
        }
        if (k(fVar.nG, 1024)) {
            this.ef = fVar.ef;
        }
        if (k(fVar.nG, 4096)) {
            this.ej = fVar.ej;
        }
        if (k(fVar.nG, 8192)) {
            this.nP = fVar.nP;
        }
        if (k(fVar.nG, 16384)) {
            this.nQ = fVar.nQ;
        }
        if (k(fVar.nG, 32768)) {
            this.nR = fVar.nR;
        }
        if (k(fVar.nG, 65536)) {
            this.nO = fVar.nO;
        }
        if (k(fVar.nG, 131072)) {
            this.eq = fVar.eq;
        }
        if (k(fVar.nG, 2048)) {
            this.el.putAll(fVar.el);
            this.er = fVar.er;
        }
        if (k(fVar.nG, 524288)) {
            this.eD = fVar.eD;
        }
        if (!this.nO) {
            this.el.clear();
            this.nG &= -2049;
            this.eq = false;
            this.nG &= -131073;
            this.er = true;
        }
        this.nG |= fVar.nG;
        this.eh.a(fVar.eh);
        return dH();
    }

    public boolean equals(Object obj) {
        boolean z = false;
        if (!(obj instanceof f)) {
            return false;
        }
        f fVar = (f) obj;
        if (Float.compare(fVar.nH, this.nH) == 0 && this.nJ == fVar.nJ && com.bumptech.glide.util.k.b(this.nI, fVar.nI) && this.nL == fVar.nL && com.bumptech.glide.util.k.b(this.nK, fVar.nK) && this.nQ == fVar.nQ && com.bumptech.glide.util.k.b(this.nP, fVar.nP) && this.dU == fVar.dU && this.nM == fVar.nM && this.nN == fVar.nN && this.eq == fVar.eq && this.nO == fVar.nO && this.nT == fVar.nT && this.eD == fVar.eD && this.ep.equals(fVar.ep) && this.eo == fVar.eo && this.eh.equals(fVar.eh) && this.el.equals(fVar.el) && this.ej.equals(fVar.ej) && com.bumptech.glide.util.k.b(this.ef, fVar.ef) && com.bumptech.glide.util.k.b(this.nR, fVar.nR)) {
            z = true;
        }
        return z;
    }

    public int hashCode() {
        return com.bumptech.glide.util.k.a(this.nR, com.bumptech.glide.util.k.a(this.ef, com.bumptech.glide.util.k.a(this.ej, com.bumptech.glide.util.k.a(this.el, com.bumptech.glide.util.k.a(this.eh, com.bumptech.glide.util.k.a(this.eo, com.bumptech.glide.util.k.a(this.ep, com.bumptech.glide.util.k.a(this.eD, com.bumptech.glide.util.k.a(this.nT, com.bumptech.glide.util.k.a(this.nO, com.bumptech.glide.util.k.a(this.eq, com.bumptech.glide.util.k.q(this.nN, com.bumptech.glide.util.k.q(this.nM, com.bumptech.glide.util.k.a(this.dU, com.bumptech.glide.util.k.a(this.nP, com.bumptech.glide.util.k.q(this.nQ, com.bumptech.glide.util.k.a(this.nK, com.bumptech.glide.util.k.q(this.nL, com.bumptech.glide.util.k.a(this.nI, com.bumptech.glide.util.k.q(this.nJ, com.bumptech.glide.util.k.hashCode(this.nH)))))))))))))))))))));
    }

    @NonNull
    public f dF() {
        this.isLocked = true;
        return this;
    }

    @NonNull
    public f dG() {
        if (!this.isLocked || this.nS) {
            this.nS = true;
            return dF();
        }
        throw new IllegalStateException("You cannot auto lock an already locked options object, try clone() first");
    }

    @NonNull
    private f dH() {
        if (!this.isLocked) {
            return this;
        }
        throw new IllegalStateException("You cannot modify locked RequestOptions, consider clone()");
    }

    protected boolean dI() {
        return this.nS;
    }

    public final boolean dJ() {
        return isSet(4);
    }

    public final boolean dK() {
        return isSet(256);
    }

    @NonNull
    public final Map<Class<?>, i<?>> dL() {
        return this.el;
    }

    public final boolean dM() {
        return this.eq;
    }

    @NonNull
    public final com.bumptech.glide.load.f at() {
        return this.eh;
    }

    @NonNull
    public final Class<?> aZ() {
        return this.ej;
    }

    @NonNull
    public final g ar() {
        return this.ep;
    }

    @Nullable
    public final Drawable dN() {
        return this.nI;
    }

    public final int dO() {
        return this.nJ;
    }

    public final int dP() {
        return this.nL;
    }

    @Nullable
    public final Drawable dQ() {
        return this.nK;
    }

    public final int dR() {
        return this.nQ;
    }

    @Nullable
    public final Drawable dS() {
        return this.nP;
    }

    @Nullable
    public final Theme getTheme() {
        return this.nR;
    }

    public final boolean dT() {
        return this.dU;
    }

    @NonNull
    public final c au() {
        return this.ef;
    }

    public final boolean dU() {
        return isSet(8);
    }

    @NonNull
    public final Priority as() {
        return this.eo;
    }

    public final int dV() {
        return this.nN;
    }

    public final boolean dW() {
        return com.bumptech.glide.util.k.p(this.nN, this.nM);
    }

    public final int dX() {
        return this.nM;
    }

    public final float dY() {
        return this.nH;
    }

    boolean ay() {
        return this.er;
    }

    private boolean isSet(int i) {
        return k(this.nG, i);
    }

    public final boolean dZ() {
        return this.nT;
    }

    public final boolean ea() {
        return this.fQ;
    }

    public final boolean eb() {
        return this.eD;
    }
}
