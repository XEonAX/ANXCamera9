package com.mi.config;

import android.content.Context;
import android.content.res.Resources;
import android.os.Build.VERSION;
import android.os.SystemProperties;
import android.support.v4.util.SimpleArrayMap;
import com.android.camera.CameraAppImpl;
import com.android.camera.CameraSettings;
import com.android.camera.Util;
import com.android.camera.constant.BeautyConstant;
import com.android.camera.data.data.DataItemBase;
import com.android.camera.log.Log;
import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.util.Iterator;
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
        if (this.pD == null) {
            this.pD = SystemProperties.get("ro.boot.hwc");
        }
        return "cn".equalsIgnoreCase(this.pD);
    }

    public boolean eT() {
        return getBoolean(c.rh, false) && eR();
    }

    public boolean eU() {
        return getBoolean(c.rZ, false) && eR();
    }

    public boolean eV() {
        return getBoolean(c.ri, false);
    }

    public boolean eW() {
        return getBoolean(c.rj, false);
    }

    public boolean eX() {
        return getBoolean(c.rk, false);
    }

    public boolean eY() {
        return getBoolean(c.rJ, false);
    }

    public boolean eZ() {
        return getBoolean(c.rl, false);
    }

    public boolean fa() {
        return getBoolean(c.rm, false);
    }

    public boolean fb() {
        return getBoolean(c.rn, false);
    }

    public boolean fc() {
        return getBoolean(c.ro, false);
    }

    public boolean fd() {
        return getBoolean(c.rp, false);
    }

    public boolean fe() {
        return getBoolean(c.rq, false);
    }

    public boolean ff() {
        return getBoolean(c.rr, false);
    }

    public boolean fg() {
        return getBoolean(c.rs, false);
    }

    public boolean fh() {
        return getBoolean(c.rt, false);
    }

    public boolean fi() {
        if (VERSION.SDK_INT == 28 && getBoolean(c.rz, false)) {
            return true;
        }
        return false;
    }

    public boolean fj() {
        return getBoolean(c.rA, false);
    }

    public boolean fk() {
        return getBoolean(c.rG, true);
    }

    public boolean fl() {
        return getBoolean(c.rH, false);
    }

    public boolean fm() {
        return getBoolean(c.rB, false);
    }

    public boolean fn() {
        return getBoolean(c.ru, false);
    }

    public int fo() {
        return getInt(c.rY, 180);
    }

    public boolean fp() {
        return getBoolean(c.rv, false);
    }

    public boolean fq() {
        return getBoolean(c.ry, false);
    }

    public boolean fr() {
        return getBoolean(c.rx, false);
    }

    public boolean fs() {
        return getBoolean(c.rw, false);
    }

    public boolean ft() {
        return getBoolean(c.rC, false);
    }

    public String fu() {
        return getString(c.rD, "");
    }

    public int fv() {
        return getInt(c.rE, 350);
    }

    public int fw() {
        return getInt(c.rF, 300);
    }

    public boolean fx() {
        return getBoolean(c.rI, false);
    }

    public boolean fy() {
        return getBoolean(c.rL, true);
    }

    public boolean isSupportBeautyBody() {
        return getBoolean(c.rK, false);
    }

    public boolean fz() {
        return getBoolean(c.rR, false);
    }

    public boolean fA() {
        if (getBoolean(c.sm, false) || miui.os.SystemProperties.getBoolean(CameraSettings.PROP_AUTO_ZOOM, false)) {
            return true;
        }
        return false;
    }

    public boolean fB() {
        return getBoolean(c.so, true);
    }

    public boolean fC() {
        if (Util.isGlobalVersion()) {
            return false;
        }
        return getBoolean(c.rN, false);
    }

    public int fD() {
        return getInt(c.rO, 280);
    }

    public float fE() {
        return (float) getDoubleFromValues(c.rP, 0.8766000270843506d);
    }

    public boolean fF() {
        if (Util.isGlobalVersion()) {
            return false;
        }
        return getBoolean(c.rQ, false);
    }

    public boolean fG() {
        return getBoolean(c.rM, false);
    }

    public boolean isSupportNormalWideLDC() {
        return getBoolean(c.rS, false);
    }

    public boolean isSupportUltraWideLDC() {
        return getBoolean(c.rT, false);
    }

    public boolean isSupport4KUHDEIS() {
        return getBoolean(c.rU, false);
    }

    public boolean fH() {
        return getBoolean(c.rV, false);
    }

    public boolean fI() {
        return getBoolean(c.rW, false);
    }

    public boolean fJ() {
        return getBoolean(c.rX, false);
    }

    public boolean fK() {
        return getBoolean(c.sf, true);
    }

    public boolean fL() {
        return getBoolean(c.sg, false);
    }

    public int fM() {
        return getInt(c.si, 0);
    }

    protected boolean isMutable() {
        return false;
    }

    public boolean fN() {
        return getBoolean(c.sc, false);
    }

    public boolean fO() {
        return fP() <= 0 || getBoolean(c.se, false);
    }

    public int fP() {
        return getInt(c.sb, 0);
    }

    public int fQ() {
        return getInt(c.sh, 0);
    }

    public boolean fR() {
        return getBoolean(c.sj, false);
    }

    public String fS() {
        return getString(c.sk, BeautyConstant.LEVEL_CLOSE);
    }

    public boolean fT() {
        return getBoolean(c.sl, false);
    }

    public boolean fU() {
        if (b.hY()) {
            return false;
        }
        return true;
    }

    public boolean fV() {
        return getBoolean(c.sp, true);
    }

    public boolean fW() {
        return getBoolean(c.sq, false);
    }

    public boolean isSupportBokehAdjust() {
        return getBoolean(c.sr, false);
    }

    public boolean fX() {
        if (VERSION.SDK_INT < 28) {
            return false;
        }
        return getBoolean(c.ss, false);
    }
}
