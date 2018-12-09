package com.bumptech.glide.b;

import android.support.annotation.NonNull;
import android.support.annotation.Nullable;
import android.util.Log;
import java.nio.BufferUnderflowException;
import java.nio.ByteBuffer;
import java.nio.ByteOrder;
import java.util.Arrays;

/* compiled from: GifHeaderParser */
public class d {
    private static final String TAG = "GifHeaderParser";
    private static final int bE = 255;
    private static final int bF = 44;
    private static final int bG = 33;
    private static final int bH = 59;
    private static final int bI = 249;
    private static final int bJ = 255;
    private static final int bK = 254;
    private static final int bL = 1;
    private static final int bM = 28;
    private static final int bN = 2;
    private static final int bO = 1;
    private static final int bP = 128;
    private static final int bQ = 64;
    private static final int bR = 7;
    private static final int bS = 128;
    private static final int bT = 7;
    static final int bU = 2;
    static final int bV = 10;
    private static final int bW = 256;
    private ByteBuffer bX;
    private c bY;
    private final byte[] block = new byte[256];
    private int blockSize = 0;

    public d a(@NonNull ByteBuffer byteBuffer) {
        reset();
        this.bX = byteBuffer.asReadOnlyBuffer();
        this.bX.position(0);
        this.bX.order(ByteOrder.LITTLE_ENDIAN);
        return this;
    }

    public d d(@Nullable byte[] bArr) {
        if (bArr != null) {
            a(ByteBuffer.wrap(bArr));
        } else {
            this.bX = null;
            this.bY.status = 2;
        }
        return this;
    }

    public void clear() {
        this.bX = null;
        this.bY = null;
    }

    private void reset() {
        this.bX = null;
        Arrays.fill(this.block, (byte) 0);
        this.bY = new c();
        this.blockSize = 0;
    }

    @NonNull
    public c W() {
        if (this.bX == null) {
            throw new IllegalStateException("You must call setData() before parseHeader()");
        } else if (err()) {
            return this.bY;
        } else {
            readHeader();
            if (!err()) {
                readContents();
                if (this.bY.bB < 0) {
                    this.bY.status = 1;
                }
            }
            return this.bY;
        }
    }

    public boolean isAnimated() {
        readHeader();
        if (!err()) {
            k(2);
        }
        return this.bY.bB > 1;
    }

    private void readContents() {
        k(Integer.MAX_VALUE);
    }

    private void k(int i) {
        int i2 = 0;
        while (i2 == 0 && !err() && this.bY.bB <= i) {
            int read = read();
            if (read == 33) {
                read = read();
                if (read == 1) {
                    skip();
                } else if (read != 249) {
                    switch (read) {
                        case 254:
                            skip();
                            break;
                        case 255:
                            Y();
                            StringBuilder stringBuilder = new StringBuilder();
                            for (int i3 = 0; i3 < 11; i3++) {
                                stringBuilder.append((char) this.block[i3]);
                            }
                            if (!stringBuilder.toString().equals("NETSCAPE2.0")) {
                                skip();
                                break;
                            } else {
                                readNetscapeExt();
                                break;
                            }
                        default:
                            skip();
                            break;
                    }
                } else {
                    this.bY.bC = new b();
                    readGraphicControlExt();
                }
            } else if (read == 44) {
                if (this.bY.bC == null) {
                    this.bY.bC = new b();
                }
                readBitmap();
            } else if (read != 59) {
                this.bY.status = 1;
            } else {
                i2 = 1;
            }
        }
    }

    private void readGraphicControlExt() {
        read();
        int read = read();
        this.bY.bC.dispose = (read & 28) >> 2;
        boolean z = true;
        if (this.bY.bC.dispose == 0) {
            this.bY.bC.dispose = 1;
        }
        b bVar = this.bY.bC;
        if ((read & 1) == 0) {
            z = false;
        }
        bVar.transparency = z;
        read = readShort();
        if (read < 2) {
            read = 10;
        }
        this.bY.bC.delay = read * 10;
        this.bY.bC.transIndex = read();
        read();
    }

    private void readBitmap() {
        this.bY.bC.ix = readShort();
        this.bY.bC.iy = readShort();
        this.bY.bC.iw = readShort();
        this.bY.bC.ih = readShort();
        int read = read();
        boolean z = false;
        int i = (read & 128) != 0 ? 1 : false;
        int pow = (int) Math.pow(2.0d, (double) ((read & 7) + 1));
        b bVar = this.bY.bC;
        if ((read & 64) != 0) {
            z = true;
        }
        bVar.interlace = z;
        if (i != 0) {
            this.bY.bC.lct = readColorTable(pow);
        } else {
            this.bY.bC.lct = null;
        }
        this.bY.bC.by = this.bX.position();
        X();
        if (!err()) {
            c cVar = this.bY;
            cVar.bB++;
            this.bY.bD.add(this.bY.bC);
        }
    }

    private void readNetscapeExt() {
        do {
            Y();
            if (this.block[0] == (byte) 1) {
                this.bY.loopCount = (this.block[1] & 255) | ((this.block[2] & 255) << 8);
            }
            if (this.blockSize <= 0) {
                return;
            }
        } while (!err());
    }

    private void readHeader() {
        StringBuilder stringBuilder = new StringBuilder();
        for (int i = 0; i < 6; i++) {
            stringBuilder.append((char) read());
        }
        if (stringBuilder.toString().startsWith("GIF")) {
            readLSD();
            if (this.bY.gctFlag && !err()) {
                this.bY.gct = readColorTable(this.bY.gctSize);
                this.bY.bgColor = this.bY.gct[this.bY.bgIndex];
            }
            return;
        }
        this.bY.status = 1;
    }

    private void readLSD() {
        this.bY.width = readShort();
        this.bY.height = readShort();
        int read = read();
        this.bY.gctFlag = (read & 128) != 0;
        this.bY.gctSize = (int) Math.pow(2.0d, (double) ((read & 7) + 1));
        this.bY.bgIndex = read();
        this.bY.pixelAspect = read();
    }

    @Nullable
    private int[] readColorTable(int i) {
        int[] iArr;
        Throwable e;
        byte[] bArr = new byte[(3 * i)];
        try {
            this.bX.get(bArr);
            iArr = new int[256];
            int i2 = 0;
            int i3 = 0;
            while (i2 < i) {
                int i4 = i3 + 1;
                try {
                    int i5 = i4 + 1;
                    int i6 = i5 + 1;
                    int i7 = i2 + 1;
                    iArr[i2] = ((((bArr[i3] & 255) << 16) | -16777216) | ((bArr[i4] & 255) << 8)) | (bArr[i5] & 255);
                    i3 = i6;
                    i2 = i7;
                } catch (BufferUnderflowException e2) {
                    e = e2;
                }
            }
        } catch (BufferUnderflowException e3) {
            e = e3;
            iArr = null;
            if (Log.isLoggable(TAG, 3)) {
                Log.d(TAG, "Format Error Reading Color Table", e);
            }
            this.bY.status = 1;
            return iArr;
        }
        return iArr;
    }

    private void X() {
        read();
        skip();
    }

    private void skip() {
        int read;
        do {
            read = read();
            this.bX.position(Math.min(this.bX.position() + read, this.bX.limit()));
        } while (read > 0);
    }

    private void Y() {
        this.blockSize = read();
        if (this.blockSize > 0) {
            int i = 0;
            int i2 = 0;
            while (i < this.blockSize) {
                try {
                    i2 = this.blockSize - i;
                    this.bX.get(this.block, i, i2);
                    i += i2;
                } catch (Throwable e) {
                    if (Log.isLoggable(TAG, 3)) {
                        String str = TAG;
                        StringBuilder stringBuilder = new StringBuilder();
                        stringBuilder.append("Error Reading Block n: ");
                        stringBuilder.append(i);
                        stringBuilder.append(" count: ");
                        stringBuilder.append(i2);
                        stringBuilder.append(" blockSize: ");
                        stringBuilder.append(this.blockSize);
                        Log.d(str, stringBuilder.toString(), e);
                    }
                    this.bY.status = 1;
                    return;
                }
            }
        }
    }

    private int read() {
        try {
            return this.bX.get() & 255;
        } catch (Exception e) {
            this.bY.status = 1;
            return 0;
        }
    }

    private int readShort() {
        return this.bX.getShort();
    }

    private boolean err() {
        return this.bY.status != 0;
    }
}
