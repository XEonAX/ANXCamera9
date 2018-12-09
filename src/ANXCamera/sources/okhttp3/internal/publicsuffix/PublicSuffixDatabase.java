package okhttp3.internal.publicsuffix;

import java.io.Closeable;
import java.io.IOException;
import java.io.InputStream;
import java.io.InterruptedIOException;
import java.net.IDN;
import java.util.concurrent.CountDownLatch;
import java.util.concurrent.atomic.AtomicBoolean;
import okhttp3.internal.Util;
import okhttp3.internal.platform.Platform;
import okio.GzipSource;
import okio.Okio;

public final class PublicSuffixDatabase {
    private static final String[] EMPTY_RULE = new String[0];
    private static final byte EXCEPTION_MARKER = (byte) 33;
    private static final String[] PREVAILING_RULE = new String[]{"*"};
    public static final String PUBLIC_SUFFIX_RESOURCE = "publicsuffixes.gz";
    private static final byte[] WILDCARD_LABEL = new byte[]{(byte) 42};
    private static final PublicSuffixDatabase instance = new PublicSuffixDatabase();
    private final AtomicBoolean listRead = new AtomicBoolean(false);
    private byte[] publicSuffixExceptionListBytes;
    private byte[] publicSuffixListBytes;
    private final CountDownLatch readCompleteLatch = new CountDownLatch(1);

    public static PublicSuffixDatabase get() {
        return instance;
    }

    public String getEffectiveTldPlusOne(String str) {
        if (str != null) {
            String[] split = IDN.toUnicode(str).split("\\.");
            String[] findMatchingRule = findMatchingRule(split);
            if (split.length == findMatchingRule.length && findMatchingRule[0].charAt(0) != '!') {
                return null;
            }
            int length;
            if (findMatchingRule[0].charAt(0) == '!') {
                length = split.length - findMatchingRule.length;
            } else {
                length = split.length - (findMatchingRule.length + 1);
            }
            StringBuilder stringBuilder = new StringBuilder();
            String[] split2 = str.split("\\.");
            for (length = 
/*
Method generation error in method: okhttp3.internal.publicsuffix.PublicSuffixDatabase.getEffectiveTldPlusOne(java.lang.String):java.lang.String, dex: classes.dex
jadx.core.utils.exceptions.CodegenException: Error generate insn: PHI: (r0_6 'length' int) = (r0_3 'length' int), (r0_5 'length' int) binds: {(r0_3 'length' int)=B:9:0x0029, (r0_5 'length' int)=B:10:0x002d} in method: okhttp3.internal.publicsuffix.PublicSuffixDatabase.getEffectiveTldPlusOne(java.lang.String):java.lang.String, dex: classes.dex
	at jadx.core.codegen.InsnGen.makeInsn(InsnGen.java:228)
	at jadx.core.codegen.RegionGen.makeLoop(RegionGen.java:183)
	at jadx.core.codegen.RegionGen.makeRegion(RegionGen.java:61)
	at jadx.core.codegen.RegionGen.makeSimpleRegion(RegionGen.java:87)
	at jadx.core.codegen.RegionGen.makeRegion(RegionGen.java:53)
	at jadx.core.codegen.RegionGen.makeSimpleRegion(RegionGen.java:87)
	at jadx.core.codegen.RegionGen.makeRegion(RegionGen.java:53)
	at jadx.core.codegen.RegionGen.makeSimpleRegion(RegionGen.java:87)
	at jadx.core.codegen.RegionGen.makeRegion(RegionGen.java:53)
	at jadx.core.codegen.RegionGen.makeRegionIndent(RegionGen.java:93)
	at jadx.core.codegen.RegionGen.makeIf(RegionGen.java:118)
	at jadx.core.codegen.RegionGen.makeRegion(RegionGen.java:57)
	at jadx.core.codegen.RegionGen.makeSimpleRegion(RegionGen.java:87)
	at jadx.core.codegen.RegionGen.makeRegion(RegionGen.java:53)
	at jadx.core.codegen.RegionGen.makeSimpleRegion(RegionGen.java:87)
	at jadx.core.codegen.RegionGen.makeRegion(RegionGen.java:53)
	at jadx.core.codegen.MethodGen.addInstructions(MethodGen.java:173)
	at jadx.core.codegen.ClassGen.addMethod(ClassGen.java:321)
	at jadx.core.codegen.ClassGen.addMethods(ClassGen.java:259)
	at jadx.core.codegen.ClassGen.addClassBody(ClassGen.java:221)
	at jadx.core.codegen.ClassGen.addClassCode(ClassGen.java:111)
	at jadx.core.codegen.ClassGen.makeClass(ClassGen.java:77)
	at jadx.core.codegen.CodeGen.visit(CodeGen.java:10)
	at jadx.core.ProcessClass.process(ProcessClass.java:38)
	at jadx.api.JadxDecompiler.processClass(JadxDecompiler.java:292)
	at jadx.api.JavaClass.decompile(JavaClass.java:62)
	at jadx.api.JadxDecompiler.lambda$appendSourcesSave$0(JadxDecompiler.java:200)
Caused by: jadx.core.utils.exceptions.CodegenException: PHI can be used only in fallback mode
	at jadx.core.codegen.InsnGen.fallbackOnlyInsn(InsnGen.java:539)
	at jadx.core.codegen.InsnGen.makeInsnBody(InsnGen.java:511)
	at jadx.core.codegen.InsnGen.makeInsn(InsnGen.java:222)
	... 26 more

*/

    private String[] findMatchingRule(String[] strArr) {
        String binarySearchBytes;
        String binarySearchBytes2;
        String binarySearchBytes3;
        int i = 0;
        if (this.listRead.get() || !this.listRead.compareAndSet(false, true)) {
            try {
                this.readCompleteLatch.await();
            } catch (InterruptedException e) {
            }
        } else {
            readTheListUninterruptibly();
        }
        synchronized (this) {
            if (this.publicSuffixListBytes != null) {
            } else {
                throw new IllegalStateException("Unable to load publicsuffixes.gz resource from the classpath.");
            }
        }
        Object obj = new byte[strArr.length][];
        for (int i2 = 0; i2 < strArr.length; i2++) {
            obj[i2] = strArr[i2].getBytes(Util.UTF_8);
        }
        for (int i3 = 0; i3 < obj.length; i3++) {
            binarySearchBytes = binarySearchBytes(this.publicSuffixListBytes, obj, i3);
            if (binarySearchBytes != null) {
                break;
            }
        }
        binarySearchBytes = null;
        if (obj.length > 1) {
            byte[][] bArr = (byte[][]) obj.clone();
            for (int i4 = 0; i4 < bArr.length - 1; i4++) {
                bArr[i4] = WILDCARD_LABEL;
                binarySearchBytes2 = binarySearchBytes(this.publicSuffixListBytes, bArr, i4);
                if (binarySearchBytes2 != null) {
                    break;
                }
            }
        }
        binarySearchBytes2 = null;
        if (binarySearchBytes2 != null) {
            while (i < obj.length - 1) {
                binarySearchBytes3 = binarySearchBytes(this.publicSuffixExceptionListBytes, obj, i);
                if (binarySearchBytes3 != null) {
                    break;
                }
                i++;
            }
        }
        binarySearchBytes3 = null;
        if (binarySearchBytes3 != null) {
            StringBuilder stringBuilder = new StringBuilder();
            stringBuilder.append("!");
            stringBuilder.append(binarySearchBytes3);
            return stringBuilder.toString().split("\\.");
        } else if (binarySearchBytes == null && binarySearchBytes2 == null) {
            return PREVAILING_RULE;
        } else {
            String[] split;
            if (binarySearchBytes != null) {
                strArr = binarySearchBytes.split("\\.");
            } else {
                strArr = EMPTY_RULE;
            }
            if (binarySearchBytes2 != null) {
                split = binarySearchBytes2.split("\\.");
            } else {
                split = EMPTY_RULE;
            }
            if (strArr.length <= split.length) {
                strArr = split;
            }
            return strArr;
        }
    }

    private static String binarySearchBytes(byte[] bArr, byte[][] bArr2, int i) {
        byte[] bArr3 = bArr;
        byte[][] bArr4 = bArr2;
        int length = bArr3.length;
        int i2 = 0;
        while (i2 < length) {
            int i3;
            int i4;
            int i5 = (i2 + length) / 2;
            while (i5 > -1 && bArr3[i5] != (byte) 10) {
                i5--;
            }
            i5++;
            int i6 = 1;
            while (true) {
                i3 = i5 + i6;
                if (bArr3[i3] == (byte) 10) {
                    break;
                }
                i6++;
            }
            int i7 = i3 - i5;
            int i8 = i;
            i6 = 0;
            int i9 = i6;
            int i10 = i9;
            while (true) {
                if (i6 != 0) {
                    i4 = 46;
                    i6 = 0;
                } else {
                    i4 = bArr4[i8][i9] & 255;
                }
                i4 -= bArr3[i5 + i10] & 255;
                if (i4 == 0) {
                    i10++;
                    i9++;
                    if (i10 == i7) {
                        break;
                    } else if (bArr4[i8].length == i9) {
                        if (i8 == bArr4.length - 1) {
                            break;
                        }
                        i8++;
                        i9 = -1;
                        i6 = 1;
                    }
                } else {
                    break;
                }
            }
            if (i4 < 0) {
                i5--;
            } else {
                if (i4 > 0) {
                    i3++;
                } else {
                    int i11 = i7 - i10;
                    int length2 = bArr4[i8].length - i9;
                    while (true) {
                        i8++;
                        if (i8 >= bArr4.length) {
                            break;
                        }
                        length2 += bArr4[i8].length;
                    }
                    if (length2 < i11) {
                        i5--;
                    } else if (length2 <= i11) {
                        return new String(bArr3, i5, i7, Util.UTF_8);
                    } else {
                        i3++;
                    }
                }
                i2 = i3;
            }
            length = i5;
        }
        return null;
    }

    private void readTheListUninterruptibly() {
        Object obj = null;
        while (true) {
            try {
                readTheList();
                if (obj != null) {
                    Thread.currentThread().interrupt();
                }
                return;
            } catch (InterruptedIOException e) {
                obj = 1;
            } catch (Throwable e2) {
                Platform.get().log(5, "Failed to read public suffix list", e2);
                if (obj != null) {
                    Thread.currentThread().interrupt();
                }
                return;
            } catch (Throwable th) {
                if (obj != null) {
                    Thread.currentThread().interrupt();
                }
            }
        }
    }

    private void readTheList() throws IOException {
        InputStream resourceAsStream = PublicSuffixDatabase.class.getResourceAsStream(PUBLIC_SUFFIX_RESOURCE);
        if (resourceAsStream != null) {
            Closeable buffer = Okio.buffer(new GzipSource(Okio.source(resourceAsStream)));
            try {
                byte[] bArr = new byte[buffer.readInt()];
                buffer.readFully(bArr);
                byte[] bArr2 = new byte[buffer.readInt()];
                buffer.readFully(bArr2);
                synchronized (this) {
                    this.publicSuffixListBytes = bArr;
                    this.publicSuffixExceptionListBytes = bArr2;
                }
                this.readCompleteLatch.countDown();
            } finally {
                Util.closeQuietly(buffer);
            }
        }
    }

    void setListBytes(byte[] bArr, byte[] bArr2) {
        this.publicSuffixListBytes = bArr;
        this.publicSuffixExceptionListBytes = bArr2;
        this.listRead.set(true);
        this.readCompleteLatch.countDown();
    }
}
