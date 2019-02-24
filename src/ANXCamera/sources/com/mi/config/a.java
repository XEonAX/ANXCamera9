package com.mi.config;

import android.content.Context;
import android.content.res.Resources;
import android.os.Build.VERSION;
import android.os.SystemProperties;
import android.support.v4.util.SimpleArrayMap;
import com.android.camera.CameraAppImpl;
import com.android.camera.Util;
import com.android.camera.constant.BeautyConstant;
import com.android.camera.data.data.DataItemBase;
import com.android.camera.log.Log;
import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.util.Iterator;
import miui.os.Build;
import org.json.JSONException;
import org.json.JSONObject;

/* compiled from: DataItemFeature */
public class a extends DataItemBase implements c {
    private static final String TAG = "DataFeature";
    private String pD;

    public a() {
        eO();
    }

    public String provideKey() {
        return null;
    }

    public boolean isTransient() {
        return true;
    }

    /* JADX WARNING: Removed duplicated region for block: B:31:0x0076 A:{SYNTHETIC, Splitter: B:31:0x0076} */
    /* JADX WARNING: Removed duplicated region for block: B:25:0x006c A:{SYNTHETIC, Splitter: B:25:0x006c} */
    /* JADX WARNING: Removed duplicated region for block: B:37:0x0082 A:{SYNTHETIC, Splitter: B:37:0x0082} */
    /* Code decompiled incorrectly, please refer to instructions dump. */
    public void eO() {
        IOException e;
        JSONException e2;
        Throwable th;
        Context androidContext = CameraAppImpl.getAndroidContext();
        Resources resources = androidContext.getResources();
        StringBuilder stringBuilder = new StringBuilder();
        stringBuilder.append("feature_");
        stringBuilder.append(b.pE);
        int identifier = resources.getIdentifier(stringBuilder.toString(), "raw", "com.android.camera");
        if (identifier <= 0) {
            Log.e(TAG, "feature list default");
            return;
        }
        BufferedReader bufferedReader = null;
        StringBuilder stringBuilder2 = new StringBuilder();
        try {
            BufferedReader bufferedReader2 = new BufferedReader(new InputStreamReader(androidContext.getResources().openRawResource(identifier)));
            while (true) {
                try {
                    String readLine = bufferedReader2.readLine();
                    if (readLine == null) {
                        break;
                    }
                    stringBuilder2.append(readLine);
                } catch (IOException e3) {
                    e = e3;
                    bufferedReader = bufferedReader2;
                    e.printStackTrace();
                    if (bufferedReader != null) {
                    }
                } catch (JSONException e4) {
                    e2 = e4;
                    bufferedReader = bufferedReader2;
                    try {
                        e2.printStackTrace();
                        if (bufferedReader != null) {
                        }
                    } catch (Throwable th2) {
                        th = th2;
                        if (bufferedReader != null) {
                            try {
                                bufferedReader.close();
                            } catch (IOException e5) {
                                e5.printStackTrace();
                            }
                        }
                        throw th;
                    }
                } catch (Throwable th3) {
                    th = th3;
                    bufferedReader = bufferedReader2;
                    if (bufferedReader != null) {
                    }
                    throw th;
                }
            }
            A(stringBuilder2.toString());
            try {
                bufferedReader2.close();
            } catch (IOException e6) {
                e6.printStackTrace();
            }
        } catch (IOException e7) {
            e6 = e7;
            e6.printStackTrace();
            if (bufferedReader != null) {
                bufferedReader.close();
            }
        } catch (JSONException e8) {
            e2 = e8;
            e2.printStackTrace();
            if (bufferedReader != null) {
                bufferedReader.close();
            }
        }
    }

    private void A(String str) throws JSONException {
        JSONObject jSONObject = new JSONObject(str);
        Iterator keys = jSONObject.keys();
        SimpleArrayMap values = getValues();
        while (keys.hasNext()) {
            String str2 = (String) keys.next();
            values.put(str2, jSONObject.opt(str2));
        }
    }

    public boolean B(String str) {
        return getValues().containsKey(str);
    }

    public boolean eP() {
        return getBoolean(c.rf, false);
    }

    public int eQ() {
        return getInt(c.rg, 20);
    }

    public boolean eR() {
        if (this.pD == null) {
            this.pD = SystemProperties.get("ro.boot.hwc");
        }
        return "india".equalsIgnoreCase(this.pD);
    }

    public boolean eS() {
        return Build.getRegion().endsWith("IN");
    }

    public boolean eT() {
        if (this.pD == null) {
            this.pD = SystemProperties.get("ro.boot.hwc");
        }
        return "cn".equalsIgnoreCase(this.pD);
    }

    public boolean eU() {
        return getBoolean(c.rh, false) && eR();
    }

    public boolean eV() {
        return getBoolean(c.sc, false) && eR();
    }

    public boolean eW() {
        return getBoolean(c.ri, false);
    }

    public boolean eX() {
        return getBoolean(c.rj, false);
    }

    public boolean eY() {
        return getBoolean(c.rk, false);
    }

    public boolean eZ() {
        return getBoolean(c.rL, false);
    }

    public boolean fa() {
        return getBoolean(c.rl, false);
    }

    public boolean fb() {
        return getBoolean(c.rm, false);
    }

    public boolean fc() {
        return (eR() || eS()) && getBoolean(c.rn, false);
    }

    public boolean fd() {
        return getBoolean(c.ro, false);
    }

    public boolean fe() {
        return getBoolean(c.rp, false);
    }

    public boolean ff() {
        return getBoolean(c.rq, false);
    }

    public boolean fg() {
        return getBoolean(c.rr, false);
    }

    public boolean fh() {
        return getBoolean(c.rs, false);
    }

    public boolean fi() {
        return getBoolean(c.rt, false);
    }

    public boolean fj() {
        return getBoolean(c.ru, false);
    }

    public boolean fk() {
        if (VERSION.SDK_INT == 28 && getBoolean(c.rB, false)) {
            return true;
        }
        return false;
    }

    public boolean fl() {
        return getBoolean(c.rC, false);
    }

    public boolean fm() {
        return getBoolean(c.rI, true);
    }

    public boolean fn() {
        return getBoolean(c.rJ, false);
    }

    public boolean fo() {
        return getBoolean(c.rD, false);
    }

    public boolean fp() {
        return getBoolean(c.rv, false);
    }

    public int fq() {
        return getInt(c.sb, 180);
    }

    public boolean fr() {
        return getBoolean(c.rw, false);
    }

    public boolean fs() {
        return getBoolean(c.rA, false);
    }

    public boolean ft() {
        return getBoolean(c.rz, false);
    }

    public boolean fu() {
        return getBoolean(c.rx, false);
    }

    public boolean fv() {
        return getBoolean(c.ry, false) || fu();
    }

    public boolean fw() {
        return getBoolean(c.rE, false);
    }

    public String fx() {
        return getString(c.rF, "");
    }

    public int fy() {
        return getInt(c.rG, 350);
    }

    public int fz() {
        return getInt(c.rH, 300);
    }

    public boolean isSupportUltraWide() {
        return getBoolean(c.rK, false);
    }

    public boolean fA() {
        return getBoolean(c.rN, true);
    }

    public boolean isSupportBeautyBody() {
        return getBoolean(c.rM, false);
    }

    public boolean fB() {
        return getBoolean(c.rT, false);
    }

    public boolean fC() {
        return getBoolean(c.so, false);
    }

    public boolean fD() {
        return getBoolean(c.sq, true);
    }

    public boolean fE() {
        if (Util.isGlobalVersion()) {
            return false;
        }
        return getBoolean(c.rP, false);
    }

    public int fF() {
        return getInt(c.rQ, 280);
    }

    public float fG() {
        return (float) getDoubleFromValues(c.rR, 0.8766000270843506d);
    }

    public boolean fH() {
        if (Util.isGlobalVersion()) {
            return false;
        }
        return getBoolean(c.rS, false);
    }

    public boolean fI() {
        return getBoolean(c.rO, false);
    }

    public boolean isSupportNormalWideLDC() {
        return getBoolean(c.rU, false);
    }

    public boolean isSupportUltraWideLDC() {
        return getBoolean(c.rV, false);
    }

    public boolean isSupport4KUHDEIS() {
        return getBoolean(c.rW, false);
    }

    public boolean fJ() {
        return getBoolean(c.rX, false);
    }

    public boolean fK() {
        return getBoolean(c.rY, false);
    }

    public boolean fL() {
        return getBoolean(c.rZ, false);
    }

    public boolean fM() {
        return getBoolean(c.sh, true);
    }

    public boolean fN() {
        return getBoolean(c.si, false);
    }

    public int fO() {
        return getInt(c.sk, 0);
    }

    protected boolean isMutable() {
        return false;
    }

    public boolean fP() {
        return getBoolean(c.sf, false);
    }

    public boolean fQ() {
        return fR() <= 0 || getBoolean(c.sg, false);
    }

    public int fR() {
        return getInt(c.se, 0);
    }

    public int fS() {
        return getInt(c.sj, 0);
    }

    public boolean fT() {
        return getBoolean(c.sl, false);
    }

    public String fU() {
        return getString(c.sm, BeautyConstant.LEVEL_CLOSE);
    }

    public boolean fV() {
        return getBoolean(c.sn, false);
    }

    public boolean fW() {
        if (b.ih()) {
            return false;
        }
        return true;
    }

    public boolean fX() {
        return getBoolean(c.sr, true);
    }

    public boolean fY() {
        return getBoolean(c.ss, false);
    }

    public boolean isSupportBokehAdjust() {
        return getBoolean(c.st, false);
    }

    public boolean fZ() {
        if (VERSION.SDK_INT < 28) {
            return false;
        }
        return getBoolean(c.su, false);
    }

    public boolean ga() {
        return getBoolean(c.sv, false);
    }

    public boolean gb() {
        return getBoolean(c.sw, false);
    }

    public boolean gd() {
        return getBoolean(c.sx, false);
    }

    public boolean ge() {
        return getBoolean(c.sy, false);
    }

    public boolean gf() {
        return getBoolean(c.sz, false);
    }

    public boolean gg() {
        return getBoolean(c.sA, false);
    }

    public boolean gh() {
        return getBoolean(c.sB, false);
    }
}
