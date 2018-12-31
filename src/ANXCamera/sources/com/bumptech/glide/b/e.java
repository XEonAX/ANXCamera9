package com.bumptech.glide.b;

import android.graphics.Bitmap;
import android.graphics.Bitmap.Config;
import android.support.annotation.ColorInt;
import android.support.annotation.NonNull;
import android.support.annotation.Nullable;
import android.util.Log;
import com.bumptech.glide.b.a.a;
import com.sensetime.stmobile.STMobileHumanActionNative;
import java.io.ByteArrayOutputStream;
import java.io.InputStream;
import java.nio.ByteBuffer;
import java.nio.ByteOrder;
import java.util.Arrays;

/* compiled from: StandardGifDecoder */
public class e implements a {
    private static final int MAX_STACK_SIZE = 4096;
    private static final String TAG = e.class.getSimpleName();
    private static final int bE = 255;
    private static final int bZ = -1;
    private static final int ca = -1;
    private static final int cb = 4;
    @ColorInt
    private static final int cc = 0;
    @ColorInt
    private int[] act;
    private ByteBuffer bX;
    private c bY;
    private byte[] block;
    @ColorInt
    private final int[] cd;
    private final a ce;
    private d cf;
    private byte[] cg;
    @ColorInt
    private int[] ci;
    private int cj;
    private Bitmap ck;
    private boolean cl;
    private int cm;
    private int cn;
    @Nullable
    private Boolean cp;
    @NonNull
    private Config cq;
    private byte[] pixelStack;
    private short[] prefix;
    private int sampleSize;
    private int status;
    private byte[] suffix;

    public e(@NonNull a aVar, c cVar, ByteBuffer byteBuffer) {
        this(aVar, cVar, byteBuffer, 1);
    }

    public e(@NonNull a aVar, c cVar, ByteBuffer byteBuffer, int i) {
        this(aVar);
        a(cVar, byteBuffer, i);
    }

    public e(@NonNull a aVar) {
        this.cd = new int[256];
        this.cq = Config.ARGB_8888;
        this.ce = aVar;
        this.bY = new c();
    }

    public int getWidth() {
        return this.bY.width;
    }

    public int getHeight() {
        return this.bY.height;
    }

    @NonNull
    public ByteBuffer getData() {
        return this.bX;
    }

    public int getStatus() {
        return this.status;
    }

    public void advance() {
        this.cj = (this.cj + 1) % this.bY.bB;
    }

    public int getDelay(int i) {
        if (i < 0 || i >= this.bY.bB) {
            return -1;
        }
        return ((b) this.bY.bD.get(i)).delay;
    }

    public int O() {
        if (this.bY.bB <= 0 || this.cj < 0) {
            return 0;
        }
        return getDelay(this.cj);
    }

    public int getFrameCount() {
        return this.bY.bB;
    }

    public int P() {
        return this.cj;
    }

    public void Q() {
        this.cj = -1;
    }

    @Deprecated
    public int getLoopCount() {
        if (this.bY.loopCount == -1) {
            return 1;
        }
        return this.bY.loopCount;
    }

    public int R() {
        return this.bY.loopCount;
    }

    public int S() {
        if (this.bY.loopCount == -1) {
            return 1;
        }
        if (this.bY.loopCount == 0) {
            return 0;
        }
        return this.bY.loopCount + 1;
    }

    public int T() {
        return (this.bX.limit() + this.cg.length) + (this.ci.length * 4);
    }

    /* JADX WARNING: Missing block: B:45:0x00ea, code:
            return null;
     */
    /* Code decompiled incorrectly, please refer to instructions dump. */
    @Nullable
    public synchronized Bitmap U() {
        String str;
        if (this.bY.bB <= 0 || this.cj < 0) {
            if (Log.isLoggable(TAG, 3)) {
                str = TAG;
                StringBuilder stringBuilder = new StringBuilder();
                stringBuilder.append("Unable to decode frame, frameCount=");
                stringBuilder.append(this.bY.bB);
                stringBuilder.append(", framePointer=");
                stringBuilder.append(this.cj);
                Log.d(str, stringBuilder.toString());
            }
            this.status = 1;
        }
        StringBuilder stringBuilder2;
        if (this.status != 1 && this.status != 2) {
            b bVar;
            this.status = 0;
            if (this.block == null) {
                this.block = this.ce.i(255);
            }
            b bVar2 = (b) this.bY.bD.get(this.cj);
            int i = this.cj - 1;
            if (i >= 0) {
                bVar = (b) this.bY.bD.get(i);
            } else {
                bVar = null;
            }
            this.act = bVar2.lct != null ? bVar2.lct : this.bY.gct;
            if (this.act == null) {
                if (Log.isLoggable(TAG, 3)) {
                    str = TAG;
                    stringBuilder2 = new StringBuilder();
                    stringBuilder2.append("No valid color table found for frame #");
                    stringBuilder2.append(this.cj);
                    Log.d(str, stringBuilder2.toString());
                }
                this.status = 1;
                return null;
            }
            if (bVar2.transparency) {
                System.arraycopy(this.act, 0, this.cd, 0, this.act.length);
                this.act = this.cd;
                this.act[bVar2.transIndex] = 0;
            }
            return a(bVar2, bVar);
        } else if (Log.isLoggable(TAG, 3)) {
            str = TAG;
            stringBuilder2 = new StringBuilder();
            stringBuilder2.append("Unable to decode frame, status=");
            stringBuilder2.append(this.status);
            Log.d(str, stringBuilder2.toString());
        }
    }

    public int a(@Nullable InputStream inputStream, int i) {
        if (inputStream != null) {
            try {
                ByteArrayOutputStream byteArrayOutputStream = new ByteArrayOutputStream(i > 0 ? i + 4096 : STMobileHumanActionNative.ST_MOBILE_HAND_LOVE);
                byte[] bArr = new byte[STMobileHumanActionNative.ST_MOBILE_HAND_LOVE];
                while (true) {
                    int read = inputStream.read(bArr, 0, bArr.length);
                    if (read == -1) {
                        break;
                    }
                    byteArrayOutputStream.write(bArr, 0, read);
                }
                byteArrayOutputStream.flush();
                read(byteArrayOutputStream.toByteArray());
            } catch (Throwable e) {
                Log.w(TAG, "Error reading data from stream", e);
            }
        } else {
            this.status = 2;
        }
        if (inputStream != null) {
            try {
                inputStream.close();
            } catch (Throwable e2) {
                Log.w(TAG, "Error closing stream", e2);
            }
        }
        return this.status;
    }

    public void clear() {
        this.bY = null;
        if (this.cg != null) {
            this.ce.c(this.cg);
        }
        if (this.ci != null) {
            this.ce.a(this.ci);
        }
        if (this.ck != null) {
            this.ce.c(this.ck);
        }
        this.ck = null;
        this.bX = null;
        this.cp = null;
        if (this.block != null) {
            this.ce.c(this.block);
        }
    }

    public synchronized void a(@NonNull c cVar, @NonNull byte[] bArr) {
        a(cVar, ByteBuffer.wrap(bArr));
    }

    public synchronized void a(@NonNull c cVar, @NonNull ByteBuffer byteBuffer) {
        a(cVar, byteBuffer, 1);
    }

    public synchronized void a(@NonNull c cVar, @NonNull ByteBuffer byteBuffer, int i) {
        if (i > 0) {
            i = Integer.highestOneBit(i);
            this.status = 0;
            this.bY = cVar;
            this.cj = -1;
            this.bX = byteBuffer.asReadOnlyBuffer();
            this.bX.position(0);
            this.bX.order(ByteOrder.LITTLE_ENDIAN);
            this.cl = false;
            for (b bVar : cVar.bD) {
                if (bVar.dispose == 3) {
                    this.cl = true;
                    break;
                }
            }
            this.sampleSize = i;
            this.cn = cVar.width / i;
            this.cm = cVar.height / i;
            this.cg = this.ce.i(cVar.width * cVar.height);
            this.ci = this.ce.j(this.cn * this.cm);
        } else {
            StringBuilder stringBuilder = new StringBuilder();
            stringBuilder.append("Sample size must be >=0, not: ");
            stringBuilder.append(i);
            throw new IllegalArgumentException(stringBuilder.toString());
        }
    }

    @NonNull
    private d Z() {
        if (this.cf == null) {
            this.cf = new d();
        }
        return this.cf;
    }

    public synchronized int read(@Nullable byte[] bArr) {
        this.bY = Z().d(bArr).W();
        if (bArr != null) {
            a(this.bY, bArr);
        }
        return this.status;
    }

    public void a(@NonNull Config config) {
        if (config == Config.ARGB_8888 || config == Config.RGB_565) {
            this.cq = config;
            return;
        }
        StringBuilder stringBuilder = new StringBuilder();
        stringBuilder.append("Unsupported format: ");
        stringBuilder.append(config);
        stringBuilder.append(", must be one of ");
        stringBuilder.append(Config.ARGB_8888);
        stringBuilder.append(" or ");
        stringBuilder.append(Config.RGB_565);
        throw new IllegalArgumentException(stringBuilder.toString());
    }

    private Bitmap a(b bVar, b bVar2) {
        int[] iArr = this.ci;
        int i = 0;
        if (bVar2 == null) {
            if (this.ck != null) {
                this.ce.c(this.ck);
            }
            this.ck = null;
            Arrays.fill(iArr, 0);
        }
        if (bVar2 != null && bVar2.dispose == 3 && this.ck == null) {
            Arrays.fill(iArr, 0);
        }
        if (bVar2 != null && bVar2.dispose > 0) {
            if (bVar2.dispose == 2) {
                int i2;
                if (!bVar.transparency) {
                    i2 = this.bY.bgColor;
                    if (bVar.lct == null || this.bY.bgIndex != bVar.transIndex) {
                        i = i2;
                    }
                } else if (this.cj == 0) {
                    this.cp = Boolean.valueOf(true);
                }
                i2 = bVar2.ih / this.sampleSize;
                int i3 = bVar2.iy / this.sampleSize;
                int i4 = bVar2.iw / this.sampleSize;
                i3 = (i3 * this.cn) + (bVar2.ix / this.sampleSize);
                i2 = (i2 * this.cn) + i3;
                while (i3 < i2) {
                    int i5 = i3 + i4;
                    for (int i6 = i3; i6 < i5; i6++) {
                        iArr[i6] = i;
                    }
                    i3 += this.cn;
                }
            } else if (bVar2.dispose == 3 && this.ck != null) {
                this.ck.getPixels(iArr, 0, this.cn, 0, 0, this.cn, this.cm);
            }
        }
        c(bVar);
        if (bVar.interlace || this.sampleSize != 1) {
            b(bVar);
        } else {
            a(bVar);
        }
        if (this.cl && (bVar.dispose == 0 || bVar.dispose == 1)) {
            if (this.ck == null) {
                this.ck = aa();
            }
            this.ck.setPixels(iArr, 0, this.cn, 0, 0, this.cn, this.cm);
        }
        Bitmap aa = aa();
        aa.setPixels(iArr, 0, this.cn, 0, 0, this.cn, this.cm);
        return aa;
    }

    private void a(b bVar) {
        b bVar2 = bVar;
        int[] iArr = this.ci;
        int i = bVar2.ih;
        int i2 = bVar2.iy;
        int i3 = bVar2.iw;
        int i4 = bVar2.ix;
        Object obj = this.cj == 0 ? 1 : null;
        int i5 = this.cn;
        byte[] bArr = this.cg;
        int[] iArr2 = this.act;
        int i6 = 0;
        int i7 = -1;
        while (i6 < i) {
            int i8;
            int i9 = (i6 + i2) * i5;
            int i10 = i9 + i4;
            int i11 = i10 + i3;
            int i12 = i9 + i5;
            if (i12 < i11) {
                i11 = i12;
            }
            int i13 = i7;
            i7 = bVar2.iw * i6;
            i12 = i10;
            while (i12 < i11) {
                byte b = bArr[i7];
                i8 = i;
                i = b & 255;
                if (i != i13) {
                    i = iArr2[i];
                    if (i != 0) {
                        iArr[i12] = i;
                    } else {
                        i13 = b;
                    }
                }
                i7++;
                i12++;
                i = i8;
                bVar2 = bVar;
            }
            i8 = i;
            i6++;
            i7 = i13;
            bVar2 = bVar;
        }
        boolean z = (this.cp != null || obj == null || i7 == -1) ? false : true;
        this.cp = Boolean.valueOf(z);
    }

    private void b(b bVar) {
        b bVar2 = bVar;
        int[] iArr = this.ci;
        int i = bVar2.ih / this.sampleSize;
        int i2 = bVar2.iy / this.sampleSize;
        int i3 = bVar2.iw / this.sampleSize;
        int i4 = bVar2.ix / this.sampleSize;
        Object obj = this.cj == 0 ? 1 : null;
        int i5 = this.sampleSize;
        int i6 = this.cn;
        int i7 = this.cm;
        byte[] bArr = this.cg;
        int[] iArr2 = this.act;
        Boolean bool = this.cp;
        int i8 = 8;
        int i9 = 0;
        int i10 = 0;
        int i11 = 1;
        while (i10 < i) {
            int i12;
            int i13;
            int i14;
            if (bVar2.interlace) {
                if (i9 >= i) {
                    i11++;
                    switch (i11) {
                        case 2:
                            i9 = 4;
                            break;
                        case 3:
                            i8 = 4;
                            i9 = 2;
                            break;
                        case 4:
                            i8 = 2;
                            i9 = 1;
                            break;
                    }
                }
                i12 = i9 + i8;
            } else {
                i12 = i9;
                i9 = i10;
            }
            i9 += i2;
            int i15 = i;
            Object obj2 = i5 == 1 ? 1 : null;
            if (i9 < i7) {
                i9 *= i6;
                int i16 = i9 + i4;
                i13 = i2;
                i2 = i16 + i3;
                i9 += i6;
                if (i9 < i2) {
                    i2 = i9;
                }
                i14 = i3;
                i9 = (i10 * i5) * bVar2.iw;
                if (obj2 != null) {
                    for (i = i16; i < i2; i++) {
                        i3 = iArr2[bArr[i9] & 255];
                        if (i3 != 0) {
                            iArr[i] = i3;
                        } else if (obj != null && bool == null) {
                            bool = Boolean.valueOf(true);
                        }
                        i9 += i5;
                    }
                } else {
                    i = ((i2 - i16) * i5) + i9;
                    i3 = i16;
                    while (i3 < i2) {
                        int i17 = i2;
                        i2 = a(i9, i, bVar2.iw);
                        if (i2 != 0) {
                            iArr[i3] = i2;
                        } else if (obj != null && bool == null) {
                            bool = Boolean.valueOf(true);
                            i9 += i5;
                            i3++;
                            i2 = i17;
                        }
                        i9 += i5;
                        i3++;
                        i2 = i17;
                    }
                }
            } else {
                i13 = i2;
                i14 = i3;
            }
            i10++;
            i9 = i12;
            i = i15;
            i2 = i13;
            i3 = i14;
        }
        if (this.cp == null) {
            boolean z;
            Boolean bool2 = bool;
            if (bool2 == null) {
                z = false;
            } else {
                z = bool2.booleanValue();
            }
            this.cp = Boolean.valueOf(z);
        }
    }

    @ColorInt
    private int a(int i, int i2, int i3) {
        int i4 = i;
        int i5 = 0;
        int i6 = i5;
        int i7 = i6;
        int i8 = i7;
        int i9 = i8;
        while (i4 < this.sampleSize + i && i4 < this.cg.length && i4 < i2) {
            int i10 = this.act[this.cg[i4] & 255];
            if (i10 != 0) {
                i5 += (i10 >> 24) & 255;
                i6 += (i10 >> 16) & 255;
                i7 += (i10 >> 8) & 255;
                i8 += i10 & 255;
                i9++;
            }
            i4++;
        }
        i += i3;
        i3 = i;
        while (i3 < this.sampleSize + i && i3 < this.cg.length && i3 < i2) {
            i4 = this.act[this.cg[i3] & 255];
            if (i4 != 0) {
                i5 += (i4 >> 24) & 255;
                i6 += (i4 >> 16) & 255;
                i7 += (i4 >> 8) & 255;
                i8 += i4 & 255;
                i9++;
            }
            i3++;
        }
        if (i9 == 0) {
            return 0;
        }
        return ((((i5 / i9) << 24) | ((i6 / i9) << 16)) | ((i7 / i9) << 8)) | (i8 / i9);
    }

    private void c(b bVar) {
        short s;
        e eVar = this;
        b bVar2 = bVar;
        if (bVar2 != null) {
            eVar.bX.position(bVar2.by);
        }
        if (bVar2 == null) {
            s = eVar.bY.width * eVar.bY.height;
        } else {
            s = bVar2.ih * bVar2.iw;
        }
        if (eVar.cg == null || eVar.cg.length < s) {
            eVar.cg = eVar.ce.i(s);
        }
        byte[] bArr = eVar.cg;
        if (eVar.prefix == null) {
            eVar.prefix = new short[4096];
        }
        short[] sArr = eVar.prefix;
        if (eVar.suffix == null) {
            eVar.suffix = new byte[4096];
        }
        byte[] bArr2 = eVar.suffix;
        if (eVar.pixelStack == null) {
            eVar.pixelStack = new byte[4097];
        }
        byte[] bArr3 = eVar.pixelStack;
        int readByte = readByte();
        int i = 1 << readByte;
        int i2 = i + 1;
        int i3 = i + 2;
        readByte++;
        int i4 = (1 << readByte) - 1;
        short s2 = (short) 0;
        for (int i5 = 0; i5 < i; i5++) {
            sArr[i5] = (short) 0;
            bArr2[i5] = (byte) i5;
        }
        byte[] bArr4 = eVar.block;
        int i6 = readByte;
        int i7 = i3;
        int i8 = i4;
        int i9 = 0;
        int i10 = i9;
        int i11 = i10;
        int i12 = i11;
        int i13 = i12;
        int i14 = i13;
        int i15 = i14;
        int i16 = -1;
        while (s2 < s) {
            if (i9 == 0) {
                i9 = readBlock();
                if (i9 <= 0) {
                    eVar.status = 3;
                    break;
                }
                i13 = 0;
            }
            i12 += (bArr4[i13] & 255) << i11;
            i13++;
            i9--;
            int i17 = i11 + 8;
            int i18 = i16;
            int i19 = i14;
            int i20 = i7;
            i11 = i10;
            short s3 = s2;
            int i21 = i6;
            while (i17 >= i21) {
                int i22 = i12 & i8;
                i12 >>= i21;
                i17 -= i21;
                if (i22 == i) {
                    i21 = readByte;
                    i20 = i3;
                    i8 = i4;
                    i18 = -1;
                } else if (i22 == i2) {
                    i16 = i18;
                    i6 = i21;
                    s2 = s3;
                    i10 = i11;
                    i7 = i20;
                    i14 = i19;
                    i11 = i17;
                    break;
                } else if (i18 == -1) {
                    bArr[i11] = bArr2[i22];
                    i11++;
                    s3++;
                    i18 = i22;
                    i19 = i18;
                    i22 = -1;
                    eVar = this;
                } else {
                    int i23;
                    int i24 = i20;
                    if (i22 >= i24) {
                        i23 = i17;
                        bArr3[i15] = (byte) i19;
                        i15++;
                        i17 = i18;
                    } else {
                        i23 = i17;
                        i17 = i22;
                    }
                    while (i17 >= i) {
                        bArr3[i15] = bArr2[i17];
                        i15++;
                        i17 = sArr[i17];
                    }
                    i17 = bArr2[i17] & 255;
                    int i25 = readByte;
                    byte b = (byte) i17;
                    bArr[i11] = b;
                    i11++;
                    s3++;
                    while (i15 > 0) {
                        i15--;
                        bArr[i11] = bArr3[i15];
                        i11++;
                        s3++;
                    }
                    int i26 = i17;
                    if (i24 < 4096) {
                        sArr[i24] = (short) i18;
                        bArr2[i24] = b;
                        i24++;
                        if ((i24 & i8) == 0) {
                            if (i24 < 4096) {
                                i21++;
                                i8 += i24;
                            }
                        }
                    } else {
                        readByte = 4096;
                    }
                    i20 = i24;
                    i18 = i22;
                    i17 = i23;
                    readByte = i25;
                    i19 = i26;
                    eVar = this;
                }
            }
            i7 = i20;
            i14 = i19;
            i16 = i18;
            i6 = i21;
            s2 = s3;
            i10 = i11;
            i11 = i17;
            eVar = this;
        }
        Arrays.fill(bArr, i10, s, (byte) 0);
    }

    private int readByte() {
        return this.bX.get() & 255;
    }

    private int readBlock() {
        int readByte = readByte();
        if (readByte <= 0) {
            return readByte;
        }
        this.bX.get(this.block, 0, Math.min(readByte, this.bX.remaining()));
        return readByte;
    }

    private Bitmap aa() {
        Config config = (this.cp == null || this.cp.booleanValue()) ? Config.ARGB_8888 : this.cq;
        Bitmap a = this.ce.a(this.cn, this.cm, config);
        a.setHasAlpha(true);
        return a;
    }
}
