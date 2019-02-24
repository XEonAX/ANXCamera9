package com.bumptech.glide.load.resource.bitmap;

import android.support.annotation.NonNull;
import android.util.Log;
import com.bumptech.glide.load.ImageHeaderParser;
import com.bumptech.glide.load.ImageHeaderParser.ImageType;
import com.bumptech.glide.util.i;
import java.io.IOException;
import java.io.InputStream;
import java.nio.ByteBuffer;
import java.nio.ByteOrder;
import java.nio.charset.Charset;

/* compiled from: DefaultImageHeaderParser */
public final class m implements ImageHeaderParser {
    private static final String TAG = "DfltImageHeaderParser";
    private static final int jX = 4671814;
    private static final int jY = -1991225785;
    static final int jZ = 65496;
    private static final int ka = 19789;
    private static final int kb = 18761;
    private static final String kc = "Exif\u0000\u0000";
    static final byte[] kd = kc.getBytes(Charset.forName("UTF-8"));
    private static final int ke = 218;
    private static final int kf = 217;
    static final int kg = 255;
    static final int kh = 225;
    private static final int ki = 274;
    private static final int[] kj = new int[]{0, 1, 1, 2, 4, 8, 1, 1, 2, 4, 8, 4, 8};
    private static final int kk = 1380533830;
    private static final int kl = 1464156752;
    private static final int km = 1448097792;
    private static final int kn = -256;
    private static final int ko = 255;
    private static final int kp = 88;
    private static final int kq = 76;
    private static final int kr = 16;
    private static final int ks = 8;

    /* compiled from: DefaultImageHeaderParser */
    private interface c {
        int ck() throws IOException;

        short cl() throws IOException;

        int getByte() throws IOException;

        int read(byte[] bArr, int i) throws IOException;

        long skip(long j) throws IOException;
    }

    /* compiled from: DefaultImageHeaderParser */
    private static final class a implements c {
        private final ByteBuffer byteBuffer;

        a(ByteBuffer byteBuffer) {
            this.byteBuffer = byteBuffer;
            byteBuffer.order(ByteOrder.BIG_ENDIAN);
        }

        public int ck() {
            return ((getByte() << 8) & 65280) | (getByte() & 255);
        }

        public short cl() {
            return (short) (getByte() & 255);
        }

        public long skip(long j) {
            int min = (int) Math.min((long) this.byteBuffer.remaining(), j);
            this.byteBuffer.position(this.byteBuffer.position() + min);
            return (long) min;
        }

        public int read(byte[] bArr, int i) {
            i = Math.min(i, this.byteBuffer.remaining());
            if (i == 0) {
                return -1;
            }
            this.byteBuffer.get(bArr, 0, i);
            return i;
        }

        public int getByte() {
            if (this.byteBuffer.remaining() < 1) {
                return -1;
            }
            return this.byteBuffer.get();
        }
    }

    /* compiled from: DefaultImageHeaderParser */
    private static final class b {
        private final ByteBuffer data;

        b(byte[] bArr, int i) {
            this.data = (ByteBuffer) ByteBuffer.wrap(bArr).order(ByteOrder.BIG_ENDIAN).limit(i);
        }

        void a(ByteOrder byteOrder) {
            this.data.order(byteOrder);
        }

        int length() {
            return this.data.remaining();
        }

        int y(int i) {
            return i(i, 4) ? this.data.getInt(i) : -1;
        }

        short z(int i) {
            return i(i, 2) ? this.data.getShort(i) : (short) -1;
        }

        private boolean i(int i, int i2) {
            return this.data.remaining() - i >= i2;
        }
    }

    /* compiled from: DefaultImageHeaderParser */
    private static final class d implements c {
        private final InputStream is;

        d(InputStream inputStream) {
            this.is = inputStream;
        }

        public int ck() throws IOException {
            return ((this.is.read() << 8) & 65280) | (this.is.read() & 255);
        }

        public short cl() throws IOException {
            return (short) (this.is.read() & 255);
        }

        public long skip(long j) throws IOException {
            if (j < 0) {
                return 0;
            }
            long j2 = j;
            while (j2 > 0) {
                long skip = this.is.skip(j2);
                if (skip <= 0) {
                    if (this.is.read() == -1) {
                        break;
                    }
                    skip = 1;
                }
                j2 -= skip;
            }
            return j - j2;
        }

        public int read(byte[] bArr, int i) throws IOException {
            int i2 = i;
            while (i2 > 0) {
                int read = this.is.read(bArr, i - i2, i2);
                if (read == -1) {
                    break;
                }
                i2 -= read;
            }
            return i - i2;
        }

        public int getByte() throws IOException {
            return this.is.read();
        }
    }

    @NonNull
    public ImageType b(@NonNull InputStream inputStream) throws IOException {
        return a(new d((InputStream) i.checkNotNull(inputStream)));
    }

    @NonNull
    public ImageType b(@NonNull ByteBuffer byteBuffer) throws IOException {
        return a(new a((ByteBuffer) i.checkNotNull(byteBuffer)));
    }

    public int a(@NonNull InputStream inputStream, @NonNull com.bumptech.glide.load.engine.bitmap_recycle.b bVar) throws IOException {
        return a(new d((InputStream) i.checkNotNull(inputStream)), (com.bumptech.glide.load.engine.bitmap_recycle.b) i.checkNotNull(bVar));
    }

    public int a(@NonNull ByteBuffer byteBuffer, @NonNull com.bumptech.glide.load.engine.bitmap_recycle.b bVar) throws IOException {
        return a(new a((ByteBuffer) i.checkNotNull(byteBuffer)), (com.bumptech.glide.load.engine.bitmap_recycle.b) i.checkNotNull(bVar));
    }

    @NonNull
    private ImageType a(c cVar) throws IOException {
        int ck = cVar.ck();
        if (ck == jZ) {
            return ImageType.JPEG;
        }
        ck = ((ck << 16) & -65536) | (cVar.ck() & 65535);
        if (ck == jY) {
            cVar.skip(21);
            return cVar.getByte() >= 3 ? ImageType.PNG_A : ImageType.PNG;
        } else if ((ck >> 8) == jX) {
            return ImageType.GIF;
        } else {
            if (ck != kk) {
                return ImageType.UNKNOWN;
            }
            cVar.skip(4);
            if ((((cVar.ck() << 16) & -65536) | (cVar.ck() & 65535)) != kl) {
                return ImageType.UNKNOWN;
            }
            ck = ((cVar.ck() << 16) & -65536) | (cVar.ck() & 65535);
            if ((ck & kn) != km) {
                return ImageType.UNKNOWN;
            }
            ck &= 255;
            if (ck == 88) {
                cVar.skip(4);
                return (cVar.getByte() & 16) != 0 ? ImageType.WEBP_A : ImageType.WEBP;
            } else if (ck != 76) {
                return ImageType.WEBP;
            } else {
                cVar.skip(4);
                return (cVar.getByte() & 8) != 0 ? ImageType.WEBP_A : ImageType.WEBP;
            }
        }
    }

    private int a(c cVar, com.bumptech.glide.load.engine.bitmap_recycle.b bVar) throws IOException {
        int ck = cVar.ck();
        if (x(ck)) {
            ck = b(cVar);
            if (ck == -1) {
                if (Log.isLoggable(TAG, 3)) {
                    Log.d(TAG, "Failed to parse exif segment length, or exif segment not found");
                }
                return -1;
            }
            byte[] bArr = (byte[]) bVar.a(ck, byte[].class);
            try {
                int a = a(cVar, bArr, ck);
                return a;
            } finally {
                bVar.put(bArr);
            }
        } else {
            if (Log.isLoggable(TAG, 3)) {
                String str = TAG;
                StringBuilder stringBuilder = new StringBuilder();
                stringBuilder.append("Parser doesn't handle magic number: ");
                stringBuilder.append(ck);
                Log.d(str, stringBuilder.toString());
            }
            return -1;
        }
    }

    private int a(c cVar, byte[] bArr, int i) throws IOException {
        int read = cVar.read(bArr, i);
        if (read != i) {
            if (Log.isLoggable(TAG, 3)) {
                String str = TAG;
                StringBuilder stringBuilder = new StringBuilder();
                stringBuilder.append("Unable to read exif segment data, length: ");
                stringBuilder.append(i);
                stringBuilder.append(", actually read: ");
                stringBuilder.append(read);
                Log.d(str, stringBuilder.toString());
            }
            return -1;
        } else if (a(bArr, i)) {
            return a(new b(bArr, i));
        } else {
            if (Log.isLoggable(TAG, 3)) {
                Log.d(TAG, "Missing jpeg exif preamble");
            }
            return -1;
        }
    }

    private boolean a(byte[] bArr, int i) {
        boolean z = bArr != null && i > kd.length;
        if (!z) {
            return z;
        }
        for (int i2 = 0; i2 < kd.length; i2++) {
            if (bArr[i2] != kd[i2]) {
                return false;
            }
        }
        return z;
    }

    private int b(c cVar) throws IOException {
        while (true) {
            short cl = cVar.cl();
            String str;
            if (cl != (short) 255) {
                if (Log.isLoggable(TAG, 3)) {
                    str = TAG;
                    StringBuilder stringBuilder = new StringBuilder();
                    stringBuilder.append("Unknown segmentId=");
                    stringBuilder.append(cl);
                    Log.d(str, stringBuilder.toString());
                }
                return -1;
            }
            cl = cVar.cl();
            if (cl == (short) 218) {
                return -1;
            }
            if (cl == (short) 217) {
                if (Log.isLoggable(TAG, 3)) {
                    Log.d(TAG, "Found MARKER_EOI in exif segment");
                }
                return -1;
            }
            int ck = cVar.ck() - 2;
            if (cl == (short) 225) {
                return ck;
            }
            long j = (long) ck;
            long skip = cVar.skip(j);
            if (skip != j) {
                if (Log.isLoggable(TAG, 3)) {
                    str = TAG;
                    StringBuilder stringBuilder2 = new StringBuilder();
                    stringBuilder2.append("Unable to skip enough data, type: ");
                    stringBuilder2.append(cl);
                    stringBuilder2.append(", wanted to skip: ");
                    stringBuilder2.append(ck);
                    stringBuilder2.append(", but actually skipped: ");
                    stringBuilder2.append(skip);
                    Log.d(str, stringBuilder2.toString());
                }
                return -1;
            }
        }
    }

    private static int a(b bVar) {
        ByteOrder byteOrder;
        int length = kc.length();
        short z = bVar.z(length);
        if (z == (short) 18761) {
            byteOrder = ByteOrder.LITTLE_ENDIAN;
        } else if (z != (short) 19789) {
            if (Log.isLoggable(TAG, 3)) {
                String str = TAG;
                StringBuilder stringBuilder = new StringBuilder();
                stringBuilder.append("Unknown endianness = ");
                stringBuilder.append(z);
                Log.d(str, stringBuilder.toString());
            }
            byteOrder = ByteOrder.BIG_ENDIAN;
        } else {
            byteOrder = ByteOrder.BIG_ENDIAN;
        }
        bVar.a(byteOrder);
        int y = bVar.y(length + 4) + length;
        short z2 = bVar.z(y);
        for (short s = (short) 0; s < z2; s++) {
            int h = h(y, s);
            short z3 = bVar.z(h);
            if (z3 == (short) 274) {
                short z4 = bVar.z(h + 2);
                String str2;
                StringBuilder stringBuilder2;
                if (z4 >= (short) 1 && z4 <= (short) 12) {
                    int y2 = bVar.y(h + 4);
                    if (y2 >= 0) {
                        if (Log.isLoggable(TAG, 3)) {
                            String str3 = TAG;
                            StringBuilder stringBuilder3 = new StringBuilder();
                            stringBuilder3.append("Got tagIndex=");
                            stringBuilder3.append(s);
                            stringBuilder3.append(" tagType=");
                            stringBuilder3.append(z3);
                            stringBuilder3.append(" formatCode=");
                            stringBuilder3.append(z4);
                            stringBuilder3.append(" componentCount=");
                            stringBuilder3.append(y2);
                            Log.d(str3, stringBuilder3.toString());
                        }
                        y2 += kj[z4];
                        if (y2 <= 4) {
                            h += 8;
                            if (h < 0 || h > bVar.length()) {
                                if (Log.isLoggable(TAG, 3)) {
                                    String str4 = TAG;
                                    StringBuilder stringBuilder4 = new StringBuilder();
                                    stringBuilder4.append("Illegal tagValueOffset=");
                                    stringBuilder4.append(h);
                                    stringBuilder4.append(" tagType=");
                                    stringBuilder4.append(z3);
                                    Log.d(str4, stringBuilder4.toString());
                                }
                            } else if (y2 >= 0 && y2 + h <= bVar.length()) {
                                return bVar.z(h);
                            } else {
                                if (Log.isLoggable(TAG, 3)) {
                                    str2 = TAG;
                                    StringBuilder stringBuilder5 = new StringBuilder();
                                    stringBuilder5.append("Illegal number of bytes for TI tag data tagType=");
                                    stringBuilder5.append(z3);
                                    Log.d(str2, stringBuilder5.toString());
                                }
                            }
                        } else if (Log.isLoggable(TAG, 3)) {
                            str2 = TAG;
                            stringBuilder2 = new StringBuilder();
                            stringBuilder2.append("Got byte count > 4, not orientation, continuing, formatCode=");
                            stringBuilder2.append(z4);
                            Log.d(str2, stringBuilder2.toString());
                        }
                    } else if (Log.isLoggable(TAG, 3)) {
                        Log.d(TAG, "Negative tiff component count");
                    }
                } else if (Log.isLoggable(TAG, 3)) {
                    str2 = TAG;
                    stringBuilder2 = new StringBuilder();
                    stringBuilder2.append("Got invalid format code = ");
                    stringBuilder2.append(z4);
                    Log.d(str2, stringBuilder2.toString());
                }
            }
        }
        return -1;
    }

    private static int h(int i, int i2) {
        return (i + 2) + (12 * i2);
    }

    private static boolean x(int i) {
        return (i & jZ) == jZ || i == ka || i == kb;
    }
}
