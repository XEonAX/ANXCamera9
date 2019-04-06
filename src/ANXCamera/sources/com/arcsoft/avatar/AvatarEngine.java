package com.arcsoft.avatar;

import com.arcsoft.avatar.AvatarConfig.ASAvatarProfileResult;
import com.arcsoft.avatar.AvatarConfig.c;
import com.arcsoft.avatar.AvatarConfig.d;
import com.arcsoft.avatar.AvatarConfig.e;
import com.arcsoft.avatar.AvatarConfig.g;
import com.arcsoft.avatar.AvatarConfig.k;
import com.arcsoft.avatar.AvatarConfig.l;
import com.arcsoft.avatar.AvatarConfig.m;
import com.arcsoft.avatar.d.a;
import com.ss.android.ttve.common.TEDefine;
import java.nio.ByteBuffer;
import java.util.ArrayList;

public class AvatarEngine implements AvatarConfig {
    private static final String a = "AvatarEngine";
    private static final float bD = 0.8f;
    private long bE = 0;

    static {
        System.loadLibrary("Arcsoft_Avatar_Jni");
        System.loadLibrary(a);
    }

    private native int nativeAvatarProcess(long j, int i, int i2, int i3, byte[] bArr, byte[] bArr2, int i4, boolean z, int i5);

    private native int nativeAvatarProcessEx(long j, int i, int i2, int i3, ByteBuffer[] byteBufferArr, byte[] bArr, int i4, boolean z, int i5);

    private native int nativeAvatarProcessEx2(long j, a aVar, byte[] bArr, int i, boolean z, int i2);

    private native int nativeAvatarProfile(long j, String str, int i, int i2, int i3, byte[] bArr, int i4, boolean z, ASAvatarProfileResult aSAvatarProfileResult, m mVar);

    private native int nativeAvatarRender(long j, int i, int i2, int i3, int i4, boolean z, int[] iArr);

    private native long nativeCreate();

    private native int nativeDestroy(long j);

    private native int nativeGetConfig(long j, int i, int i2, k kVar);

    private native int nativeGetConfigValue(long j, e eVar);

    private native int nativeGetSupportConfigType(long j, int i, l lVar);

    private native int nativeInit(long j, String str, String str2);

    private native boolean nativeIsSupportSwitchGender(long j);

    private native int nativeLoadConfig(long j, String str);

    private native int nativeProcessOutlineExpression(long j, byte[] bArr, int i, int i2, int i3, int i4, boolean z, int i5, g gVar);

    private native int nativeProcessWithInfo(long j, byte[] bArr, int i, int i2, int i3, int i4, boolean z, int i5, g gVar);

    private native int nativeReleaseRender(long j);

    private native int nativeRenderThumb(long j, byte[] bArr, int i, int i2, int i3);

    private native int nativeSaveConfig(long j, String str);

    private native int nativeSetConfig(long j, c cVar);

    private native int nativeSetRenderScene(long j, boolean z, float f);

    private native int nativeSetTemplate(long j, String str);

    private native int nativeSwitchGender(long j, boolean z);

    private native int nativeUnInit(long j);

    public synchronized int a(int i, int i2, int i3, byte[] bArr, byte[] bArr2, int i4, boolean z, int i5) {
        int nativeAvatarProcess;
        synchronized (this) {
            nativeAvatarProcess = nativeAvatarProcess(this.bE, i, i2, i3, bArr, bArr2, i4, z, i5);
        }
        return nativeAvatarProcess;
    }

    public synchronized int a(int i, int i2, int i3, ByteBuffer[] byteBufferArr, byte[] bArr, int i4, boolean z, int i5) {
        int nativeAvatarProcessEx;
        synchronized (this) {
            nativeAvatarProcessEx = nativeAvatarProcessEx(this.bE, i, i2, i3, byteBufferArr, bArr, i4, z, i5);
        }
        return nativeAvatarProcessEx;
    }

    public synchronized int a(c cVar) {
        return nativeSetConfig(this.bE, cVar);
    }

    public synchronized int a(g gVar) {
        int i = 0;
        if (gVar == null) {
            com.arcsoft.avatar.d.g.d("CheckOutLine", TEDefine.FACE_BEAUTY_NULL);
            return 0;
        } else if (gVar.bn == null) {
            com.arcsoft.avatar.d.g.d("CheckOutLine", "shelterFlags == null");
            return 0;
        } else {
            StringBuilder stringBuilder = new StringBuilder();
            stringBuilder.append("faceCount = ");
            stringBuilder.append(gVar.faceCount);
            com.arcsoft.avatar.d.g.d("CheckOutLine", stringBuilder.toString());
            if (gVar.faceCount <= 0) {
                return 0;
            }
            float f = 0.0f;
            float f2 = 0.0f;
            while (i <= 36) {
                f2 += gVar.bn[i];
                i++;
            }
            f2 /= 36.0f;
            StringBuilder stringBuilder2 = new StringBuilder();
            stringBuilder2.append("fFaceValue = ");
            stringBuilder2.append(f2);
            com.arcsoft.avatar.d.g.d("CheckOutLine", stringBuilder2.toString());
            if (f2 > bD) {
                return 5;
            }
            int i2;
            int i3;
            float f3 = 0.0f;
            for (int i4 = 69; i4 <= 80; i4++) {
                f3 += gVar.bn[i4];
            }
            f3 /= 12.0f;
            StringBuilder stringBuilder3 = new StringBuilder();
            stringBuilder3.append("fLeftEyeValue = ");
            stringBuilder3.append(f3);
            com.arcsoft.avatar.d.g.d("CheckOutLine", stringBuilder3.toString());
            float f4 = 0.0f;
            for (i2 = 57; i2 <= 68; i2++) {
                f4 += gVar.bn[i2];
            }
            f2 = f4 / 12.0f;
            stringBuilder3 = new StringBuilder();
            stringBuilder3.append("fRightEyeValue = ");
            stringBuilder3.append(f2);
            com.arcsoft.avatar.d.g.d("CheckOutLine", stringBuilder3.toString());
            if (f2 > f3) {
                i3 = 2;
            } else {
                float f5 = f3;
                i3 = 1;
                f2 = f5;
            }
            f4 = 0.0f;
            for (i2 = 93; i2 <= 112; i2++) {
                f4 += gVar.bn[i2];
            }
            float f6 = f4 / 20.0f;
            StringBuilder stringBuilder4 = new StringBuilder();
            stringBuilder4.append("fMouthEyeValue = ");
            stringBuilder4.append(f6);
            com.arcsoft.avatar.d.g.d("CheckOutLine", stringBuilder4.toString());
            if (f6 > f2) {
                i3 = 3;
                f2 = f6;
            }
            for (i2 = 81; i2 <= 119; i2++) {
                f += gVar.bn[i2];
            }
            float f7 = f / 39.0f;
            StringBuilder stringBuilder5 = new StringBuilder();
            stringBuilder5.append("fNOSEEyeValue = ");
            stringBuilder5.append(f7);
            com.arcsoft.avatar.d.g.d("CheckOutLine", stringBuilder5.toString());
            if (f7 > f2) {
                i3 = 4;
            } else {
                f7 = f2;
            }
            stringBuilder = new StringBuilder();
            stringBuilder.append("fMax = ");
            stringBuilder.append(f7);
            stringBuilder.append(" res = ");
            stringBuilder.append(i3);
            com.arcsoft.avatar.d.g.d("CheckOutLine", stringBuilder.toString());
            return f7 > bD ? i3 : 6;
        }
    }

    public synchronized int a(a aVar, byte[] bArr, int i, boolean z, int i2) {
        return nativeAvatarProcessEx2(this.bE, aVar, bArr, i, z, i2);
    }

    public synchronized int a(String str, int i, int i2, int i3, byte[] bArr, int i4, boolean z, ASAvatarProfileResult aSAvatarProfileResult, m mVar) {
        int nativeAvatarProfile;
        synchronized (this) {
            nativeAvatarProfile = nativeAvatarProfile(this.bE, str, i, i2, i3, bArr, i4, z, aSAvatarProfileResult, mVar);
        }
        return nativeAvatarProfile;
    }

    public synchronized int a(byte[] bArr, int i, int i2, int i3) {
        return nativeRenderThumb(this.bE, bArr, i, i2, i3);
    }

    public synchronized int a(byte[] bArr, int i, int i2, int i3, int i4, boolean z, int i5, g gVar) {
        int nativeProcessOutlineExpression;
        synchronized (this) {
            nativeProcessOutlineExpression = nativeProcessOutlineExpression(this.bE, bArr, i, i2, i3, i4, z, i5, gVar);
        }
        return nativeProcessOutlineExpression;
    }

    public synchronized ArrayList<d> a(int i) {
        final ArrayList<d> arrayList;
        arrayList = new ArrayList();
        nativeGetSupportConfigType(this.bE, i, new l() {
            public void a(String str, int i) {
                d dVar = new d();
                dVar.ah = i;
                dVar.ao = str;
                arrayList.add(dVar);
            }
        });
        return arrayList;
    }

    public synchronized ArrayList<c> a(final int i, int i2) {
        final ArrayList<c> arrayList;
        arrayList = new ArrayList();
        nativeGetConfig(this.bE, i, i2, new k() {
            public void a(int i, int i2, int i3, String str, String str2, int i4, boolean z, boolean z2, boolean z3, float f) {
                c cVar = new c();
                cVar.ag = i;
                cVar.ah = i2;
                cVar.gender = i3;
                cVar.name = str;
                cVar.ai = str2;
                cVar.isDefault = z;
                cVar.aj = z2;
                cVar.ak = z3;
                cVar.al = f;
                cVar.am = i4;
                arrayList.add(cVar);
                String str3 = AvatarEngine.a;
                StringBuilder stringBuilder = new StringBuilder();
                stringBuilder.append("type = ");
                stringBuilder.append(i);
                stringBuilder.append(" info = ");
                stringBuilder.append(cVar.toString());
                com.arcsoft.avatar.d.g.d(str3, stringBuilder.toString());
            }
        });
        return arrayList;
    }

    public synchronized void a(int i, int i2, int i3, int i4, boolean z, int[] iArr) {
        nativeAvatarRender(this.bE, i, i2, i3, i4, z, iArr);
    }

    public synchronized void a(e eVar) {
        nativeGetConfigValue(this.bE, eVar);
    }

    public synchronized void a(boolean z, float f) {
        nativeSetRenderScene(this.bE, z, f);
    }

    public synchronized int b(byte[] bArr, int i, int i2, int i3, int i4, boolean z, int i5, g gVar) {
        int nativeProcessWithInfo;
        synchronized (this) {
            nativeProcessWithInfo = nativeProcessWithInfo(this.bE, bArr, i, i2, i3, i4, z, i5, gVar);
        }
        return nativeProcessWithInfo;
    }

    public synchronized void c(boolean z) {
        nativeSwitchGender(this.bE, z);
    }

    public synchronized void destroy() {
        nativeDestroy(this.bE);
        this.bE = 0;
    }

    public synchronized void e() {
        nativeReleaseRender(this.bE);
    }

    public synchronized void f(String str) {
        nativeSetTemplate(this.bE, str);
    }

    public synchronized void f(String str, String str2) {
        this.bE = nativeCreate();
        int nativeInit = nativeInit(this.bE, str, str2);
        str2 = a;
        StringBuilder stringBuilder = new StringBuilder();
        stringBuilder.append("init res = ");
        stringBuilder.append(nativeInit);
        com.arcsoft.avatar.d.g.d(str2, stringBuilder.toString());
    }

    public synchronized boolean f() {
        return nativeIsSupportSwitchGender(this.bE);
    }

    public synchronized int g(String str) {
        return nativeSaveConfig(this.bE, str);
    }

    public synchronized void h(String str) {
        nativeLoadConfig(this.bE, str);
    }

    public synchronized void unInit() {
        int nativeUnInit = nativeUnInit(this.bE);
        String str = a;
        StringBuilder stringBuilder = new StringBuilder();
        stringBuilder.append("uninit res = ");
        stringBuilder.append(nativeUnInit);
        com.arcsoft.avatar.d.g.d(str, stringBuilder.toString());
    }
}
