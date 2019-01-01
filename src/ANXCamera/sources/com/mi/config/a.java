package com.mi.config;

import android.content.Context;
import android.content.res.Resources;
import android.os.Build.VERSION;
import android.os.SystemProperties;
import android.support.v4.util.SimpleArrayMap;
import com.android.camera.CameraAppImpl;
import com.android.camera.Util;
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
    private String pE;

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
        stringBuilder.append(b.pF);
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
        return getBoolean(c.rg, false);
    }

    public int eQ() {
        return getInt(c.rh, 20);
    }

    public boolean eR() {
        if (this.pE == null) {
            this.pE = SystemProperties.get("ro.boot.hwc");
        }
        return "india".equalsIgnoreCase(this.pE);
    }

    public boolean eS() {
        return getBoolean(c.ri, false) && eR();
    }

    public boolean eT() {
        return getBoolean(c.rj, false);
    }

    public boolean eU() {
        return getBoolean(c.rk, false);
    }

    public boolean eV() {
        return getBoolean(c.rl, false);
    }

    public boolean eW() {
        return getBoolean(c.rK, false);
    }

    public boolean eX() {
        return getBoolean(c.rm, false);
    }

    public boolean eY() {
        return getBoolean(c.rn, false);
    }

    public boolean eZ() {
        return getBoolean(c.ro, false);
    }

    public boolean fa() {
        return getBoolean(c.rp, false);
    }

    public boolean fb() {
        return getBoolean(c.rq, false);
    }

    public boolean fc() {
        return getBoolean(c.rr, false);
    }

    public boolean fd() {
        return getBoolean(c.rs, false);
    }

    public boolean fe() {
        return getBoolean(c.rt, false);
    }

    public boolean ff() {
        return getBoolean(c.ru, false);
    }

    public boolean fg() {
        if (VERSION.SDK_INT == 28 && getBoolean(c.rA, false)) {
            return true;
        }
        return false;
    }

    public boolean fh() {
        return getBoolean(c.rB, false);
    }

    public boolean fi() {
        return getBoolean(c.rH, true);
    }

    public boolean fj() {
        return getBoolean(c.rI, false);
    }

    public boolean fk() {
        return getBoolean(c.rC, false);
    }

    public boolean fl() {
        return getBoolean(c.rv, false);
    }

    public boolean fm() {
        return getBoolean(c.rw, false);
    }

    public boolean fn() {
        return getBoolean(c.rz, false);
    }

    public boolean fo() {
        return getBoolean(c.ry, false);
    }

    public boolean fp() {
        return getBoolean(c.rx, false);
    }

    public boolean fq() {
        return getBoolean(c.rD, false);
    }

    public String fr() {
        return getString(c.rE, "");
    }

    public int fs() {
        return getInt(c.rF, 350);
    }

    public int ft() {
        return getInt(c.rG, 300);
    }

    public boolean fu() {
        return getBoolean(c.rJ, false);
    }

    public boolean fv() {
        return getBoolean(c.rM, true);
    }

    public boolean fw() {
        return getBoolean(c.rL, false);
    }

    public boolean fx() {
        return getBoolean(c.rS, false);
    }

    public boolean fy() {
        if (Util.isGlobalVersion() || Util.isInternationalBuild()) {
            return false;
        }
        return getBoolean(c.rO, false);
    }

    public int fz() {
        return getInt(c.rP, 280);
    }

    public float fA() {
        return (float) getDoubleFromValues(c.rQ, 0.8766000270843506d);
    }

    public boolean fB() {
        return getBoolean(c.rR, false);
    }

    public boolean fC() {
        return getBoolean(c.rN, false);
    }

    public boolean isSupportNormalWideLDC() {
        return getBoolean(c.rT, false);
    }

    public boolean isSupportUltraWideLDC() {
        return getBoolean(c.rU, false);
    }

    public boolean isSupport4KUHDEIS() {
        return getBoolean(c.rV, false);
    }

    public boolean fD() {
        return getBoolean(c.rW, false);
    }

    public boolean fE() {
        return getBoolean(c.rX, false);
    }

    protected boolean isMutable() {
        return false;
    }
}
