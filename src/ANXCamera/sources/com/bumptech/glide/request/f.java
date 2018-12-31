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
import com.android.camera.ui.drawable.PanoramaArrowAnimateDrawable;
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
    @Nullable
    private static f nG = null;
    private static final int ng = 2;
    private static final int nh = 4;
    private static final int ni = 16;
    private static final int nj = 32;
    private static final int nk = 64;
    private static final int nl = 128;
    private static final int nm = 256;
    private static final int nn = 512;
    private static final int no = 1024;
    private static final int np = 2048;
    private static final int nq = 4096;
    private static final int nr = 8192;
    private static final int ns = 16384;
    private static final int nt = 32768;
    private static final int nu = 65536;
    private static final int nv = 131072;
    private static final int nw = 262144;
    private static final int nx = 524288;
    private static final int ny = 1048576;
    @Nullable
    private static f nz;
    private boolean dT = true;
    private boolean eC;
    @NonNull
    private c ee = b.eB();
    @NonNull
    private com.bumptech.glide.load.f eg = new com.bumptech.glide.load.f();
    @NonNull
    private Class<?> ei = Object.class;
    @NonNull
    private Map<Class<?>, i<?>> ek = new CachedHashCodeArrayMap();
    @NonNull
    private Priority en = Priority.NORMAL;
    @NonNull
    private g eo = g.fo;
    private boolean ep;
    private boolean eq = true;
    private boolean fQ;
    private boolean isLocked;
    private int nH;
    private float nI = 1.0f;
    @Nullable
    private Drawable nJ;
    private int nK;
    @Nullable
    private Drawable nL;
    private int nM;
    private int nN = -1;
    private int nO = -1;
    private boolean nP = true;
    @Nullable
    private Drawable nQ;
    private int nR;
    @Nullable
    private Theme nS;
    private boolean nT;
    private boolean nU;

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
            if (nz == null) {
                nz = new f().k(true).dG();
            }
            return nz;
        }
        if (nA == null) {
            nA = new f().k(false).dG();
        }
        return nA;
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
        if (nB == null) {
            nB = new f().dy().dG();
        }
        return nB;
    }

    @CheckResult
    @NonNull
    public static f dm() {
        if (nC == null) {
            nC = new f().dA().dG();
        }
        return nC;
    }

    @CheckResult
    @NonNull
    public static f dn() {
        if (nD == null) {
            nD = new f().dw().dG();
        }
        return nD;
    }

    @CheckResult
    @NonNull
    /* renamed from: do */
    public static f m0do() {
        if (nE == null) {
            nE = new f().dC().dG();
        }
        return nE;
    }

    @CheckResult
    @NonNull
    public static f a(@NonNull i<Bitmap> iVar) {
        return new f().b((i) iVar);
    }

    @CheckResult
    @NonNull
    public static f dp() {
        if (nF == null) {
            nF = new f().dD().dG();
        }
        return nF;
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
        if (nG == null) {
            nG = new f().dE().dG();
        }
        return nG;
    }

    private static boolean k(int i, int i2) {
        return (i & i2) != 0;
    }

    @CheckResult
    @NonNull
    public f h(@FloatRange(from = 0.0d, to = 1.0d) float f) {
        if (this.nT) {
            return clone().h(f);
        }
        if (f < PanoramaArrowAnimateDrawable.LEFT_ARROW_RATIO || f > 1.0f) {
            throw new IllegalArgumentException("sizeMultiplier must be between 0 and 1");
        }
        this.nI = f;
        this.nH |= 2;
        return dH();
    }

    @CheckResult
    @NonNull
    public f h(boolean z) {
        if (this.nT) {
            return clone().h(z);
        }
        this.nU = z;
        this.nH |= 262144;
        return dH();
    }

    @CheckResult
    @NonNull
    public f i(boolean z) {
        if (this.nT) {
            return clone().i(z);
        }
        this.fQ = z;
        this.nH |= ny;
        return dH();
    }

    @CheckResult
    @NonNull
    public f j(boolean z) {
        if (this.nT) {
            return clone().j(z);
        }
        this.eC = z;
        this.nH |= nx;
        return dH();
    }

    @CheckResult
    @NonNull
    public f b(@NonNull g gVar) {
        if (this.nT) {
            return clone().b(gVar);
        }
        this.eo = (g) com.bumptech.glide.util.i.checkNotNull(gVar);
        this.nH |= 4;
        return dH();
    }

    @CheckResult
    @NonNull
    public f c(@NonNull Priority priority) {
        if (this.nT) {
            return clone().c(priority);
        }
        this.en = (Priority) com.bumptech.glide.util.i.checkNotNull(priority);
        this.nH |= 8;
        return dH();
    }

    @CheckResult
    @NonNull
    public f i(@Nullable Drawable drawable) {
        if (this.nT) {
            return clone().i(drawable);
        }
        this.nL = drawable;
        this.nH |= 64;
        return dH();
    }

    @CheckResult
    @NonNull
    public f J(@DrawableRes int i) {
        if (this.nT) {
            return clone().J(i);
        }
        this.nM = i;
        this.nH |= 128;
        return dH();
    }

    @CheckResult
    @NonNull
    public f j(@Nullable Drawable drawable) {
        if (this.nT) {
            return clone().j(drawable);
        }
        this.nQ = drawable;
        this.nH |= nr;
        return dH();
    }

    @CheckResult
    @NonNull
    public f K(@DrawableRes int i) {
        if (this.nT) {
            return clone().K(i);
        }
        this.nR = i;
        this.nH |= 16384;
        return dH();
    }

    @CheckResult
    @NonNull
    public f k(@Nullable Drawable drawable) {
        if (this.nT) {
            return clone().k(drawable);
        }
        this.nJ = drawable;
        this.nH |= 16;
        return dH();
    }

    @CheckResult
    @NonNull
    public f L(@DrawableRes int i) {
        if (this.nT) {
            return clone().L(i);
        }
        this.nK = i;
        this.nH |= 32;
        return dH();
    }

    @CheckResult
    @NonNull
    public f a(@Nullable Theme theme) {
        if (this.nT) {
            return clone().a(theme);
        }
        this.nS = theme;
        this.nH |= 32768;
        return dH();
    }

    @CheckResult
    @NonNull
    public f k(boolean z) {
        if (this.nT) {
            return clone().k(true);
        }
        this.dT = z ^ true;
        this.nH |= 256;
        return dH();
    }

    @CheckResult
    @NonNull
    public f l(int i, int i2) {
        if (this.nT) {
            return clone().l(i, i2);
        }
        this.nO = i;
        this.nN = i2;
        this.nH |= 512;
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
        if (this.nT) {
            return clone().k(cVar);
        }
        this.ee = (c) com.bumptech.glide.util.i.checkNotNull(cVar);
        this.nH |= 1024;
        return dH();
    }

    @CheckResult
    /* renamed from: dr */
    public f clone() {
        try {
            f fVar = (f) super.clone();
            fVar.eg = new com.bumptech.glide.load.f();
            fVar.eg.a(this.eg);
            fVar.ek = new CachedHashCodeArrayMap();
            fVar.ek.putAll(this.ek);
            fVar.isLocked = false;
            fVar.nT = false;
            return fVar;
        } catch (Throwable e) {
            throw new RuntimeException(e);
        }
    }

    @CheckResult
    @NonNull
    public <T> f c(@NonNull e<T> eVar, @NonNull T t) {
        if (this.nT) {
            return clone().c((e) eVar, (Object) t);
        }
        com.bumptech.glide.util.i.checkNotNull(eVar);
        com.bumptech.glide.util.i.checkNotNull(t);
        this.eg.a(eVar, t);
        return dH();
    }

    @CheckResult
    @NonNull
    public f p(@NonNull Class<?> cls) {
        if (this.nT) {
            return clone().p(cls);
        }
        this.ei = (Class) com.bumptech.glide.util.i.checkNotNull(cls);
        this.nH |= 4096;
        return dH();
    }

    public final boolean ds() {
        return this.nP;
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
        if (this.nT) {
            return clone().a(downsampleStrategy, (i) iVar);
        }
        b(downsampleStrategy);
        return a((i) iVar, false);
    }

    @CheckResult
    @NonNull
    final f b(@NonNull DownsampleStrategy downsampleStrategy, @NonNull i<Bitmap> iVar) {
        if (this.nT) {
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
        b.eq = true;
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
        if (this.nT) {
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
        if (this.nT) {
            return clone().a((Class) cls, (i) iVar, z);
        }
        com.bumptech.glide.util.i.checkNotNull(cls);
        com.bumptech.glide.util.i.checkNotNull(iVar);
        this.ek.put(cls, iVar);
        this.nH |= 2048;
        this.nP = true;
        this.nH |= 65536;
        this.eq = false;
        if (z) {
            this.nH |= 131072;
            this.ep = true;
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
        if (this.nT) {
            return clone().dD();
        }
        this.ek.clear();
        this.nH &= -2049;
        this.ep = false;
        this.nH &= -131073;
        this.nP = false;
        this.nH |= 65536;
        this.eq = true;
        return dH();
    }

    @CheckResult
    @NonNull
    public f dE() {
        return c(com.bumptech.glide.load.resource.gif.g.lY, Boolean.valueOf(true));
    }

    @CheckResult
    @NonNull
    public f g(@NonNull f fVar) {
        if (this.nT) {
            return clone().g(fVar);
        }
        if (k(fVar.nH, 2)) {
            this.nI = fVar.nI;
        }
        if (k(fVar.nH, 262144)) {
            this.nU = fVar.nU;
        }
        if (k(fVar.nH, ny)) {
            this.fQ = fVar.fQ;
        }
        if (k(fVar.nH, 4)) {
            this.eo = fVar.eo;
        }
        if (k(fVar.nH, 8)) {
            this.en = fVar.en;
        }
        if (k(fVar.nH, 16)) {
            this.nJ = fVar.nJ;
        }
        if (k(fVar.nH, 32)) {
            this.nK = fVar.nK;
        }
        if (k(fVar.nH, 64)) {
            this.nL = fVar.nL;
        }
        if (k(fVar.nH, 128)) {
            this.nM = fVar.nM;
        }
        if (k(fVar.nH, 256)) {
            this.dT = fVar.dT;
        }
        if (k(fVar.nH, 512)) {
            this.nO = fVar.nO;
            this.nN = fVar.nN;
        }
        if (k(fVar.nH, 1024)) {
            this.ee = fVar.ee;
        }
        if (k(fVar.nH, 4096)) {
            this.ei = fVar.ei;
        }
        if (k(fVar.nH, nr)) {
            this.nQ = fVar.nQ;
        }
        if (k(fVar.nH, 16384)) {
            this.nR = fVar.nR;
        }
        if (k(fVar.nH, 32768)) {
            this.nS = fVar.nS;
        }
        if (k(fVar.nH, 65536)) {
            this.nP = fVar.nP;
        }
        if (k(fVar.nH, 131072)) {
            this.ep = fVar.ep;
        }
        if (k(fVar.nH, 2048)) {
            this.ek.putAll(fVar.ek);
            this.eq = fVar.eq;
        }
        if (k(fVar.nH, nx)) {
            this.eC = fVar.eC;
        }
        if (!this.nP) {
            this.ek.clear();
            this.nH &= -2049;
            this.ep = false;
            this.nH &= -131073;
            this.eq = true;
        }
        this.nH |= fVar.nH;
        this.eg.a(fVar.eg);
        return dH();
    }

    public boolean equals(Object obj) {
        boolean z = false;
        if (!(obj instanceof f)) {
            return false;
        }
        f fVar = (f) obj;
        if (Float.compare(fVar.nI, this.nI) == 0 && this.nK == fVar.nK && com.bumptech.glide.util.k.b(this.nJ, fVar.nJ) && this.nM == fVar.nM && com.bumptech.glide.util.k.b(this.nL, fVar.nL) && this.nR == fVar.nR && com.bumptech.glide.util.k.b(this.nQ, fVar.nQ) && this.dT == fVar.dT && this.nN == fVar.nN && this.nO == fVar.nO && this.ep == fVar.ep && this.nP == fVar.nP && this.nU == fVar.nU && this.eC == fVar.eC && this.eo.equals(fVar.eo) && this.en == fVar.en && this.eg.equals(fVar.eg) && this.ek.equals(fVar.ek) && this.ei.equals(fVar.ei) && com.bumptech.glide.util.k.b(this.ee, fVar.ee) && com.bumptech.glide.util.k.b(this.nS, fVar.nS)) {
            z = true;
        }
        return z;
    }

    public int hashCode() {
        return com.bumptech.glide.util.k.a(this.nS, com.bumptech.glide.util.k.a(this.ee, com.bumptech.glide.util.k.a(this.ei, com.bumptech.glide.util.k.a(this.ek, com.bumptech.glide.util.k.a(this.eg, com.bumptech.glide.util.k.a(this.en, com.bumptech.glide.util.k.a(this.eo, com.bumptech.glide.util.k.a(this.eC, com.bumptech.glide.util.k.a(this.nU, com.bumptech.glide.util.k.a(this.nP, com.bumptech.glide.util.k.a(this.ep, com.bumptech.glide.util.k.q(this.nO, com.bumptech.glide.util.k.q(this.nN, com.bumptech.glide.util.k.a(this.dT, com.bumptech.glide.util.k.a(this.nQ, com.bumptech.glide.util.k.q(this.nR, com.bumptech.glide.util.k.a(this.nL, com.bumptech.glide.util.k.q(this.nM, com.bumptech.glide.util.k.a(this.nJ, com.bumptech.glide.util.k.q(this.nK, com.bumptech.glide.util.k.hashCode(this.nI)))))))))))))))))))));
    }

    @NonNull
    public f dF() {
        this.isLocked = true;
        return this;
    }

    @NonNull
    public f dG() {
        if (!this.isLocked || this.nT) {
            this.nT = true;
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
        return this.nT;
    }

    public final boolean dJ() {
        return isSet(4);
    }

    public final boolean dK() {
        return isSet(256);
    }

    @NonNull
    public final Map<Class<?>, i<?>> dL() {
        return this.ek;
    }

    public final boolean dM() {
        return this.ep;
    }

    @NonNull
    public final com.bumptech.glide.load.f at() {
        return this.eg;
    }

    @NonNull
    public final Class<?> aZ() {
        return this.ei;
    }

    @NonNull
    public final g ar() {
        return this.eo;
    }

    @Nullable
    public final Drawable dN() {
        return this.nJ;
    }

    public final int dO() {
        return this.nK;
    }

    public final int dP() {
        return this.nM;
    }

    @Nullable
    public final Drawable dQ() {
        return this.nL;
    }

    public final int dR() {
        return this.nR;
    }

    @Nullable
    public final Drawable dS() {
        return this.nQ;
    }

    @Nullable
    public final Theme getTheme() {
        return this.nS;
    }

    public final boolean dT() {
        return this.dT;
    }

    @NonNull
    public final c au() {
        return this.ee;
    }

    public final boolean dU() {
        return isSet(8);
    }

    @NonNull
    public final Priority as() {
        return this.en;
    }

    public final int dV() {
        return this.nO;
    }

    public final boolean dW() {
        return com.bumptech.glide.util.k.p(this.nO, this.nN);
    }

    public final int dX() {
        return this.nN;
    }

    public final float dY() {
        return this.nI;
    }

    boolean ay() {
        return this.eq;
    }

    private boolean isSet(int i) {
        return k(this.nH, i);
    }

    public final boolean dZ() {
        return this.nU;
    }

    public final boolean ea() {
        return this.fQ;
    }

    public final boolean eb() {
        return this.eC;
    }
}
