package com.mi.config;

import android.os.Build.VERSION;
import android.os.SystemProperties;
import android.support.v4.util.SimpleArrayMap;
import com.android.camera.Util;
import com.android.camera.data.data.DataItemBase;
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
    public void eO() {
        /*
        r6 = this;
        r0 = com.android.camera.CameraAppImpl.getAndroidContext();
        r1 = r0.getResources();
        r2 = new java.lang.StringBuilder;
        r2.<init>();
        r3 = "feature_";
        r2.append(r3);
        r3 = com.mi.config.b.pF;
        r2.append(r3);
        r2 = r2.toString();
        r3 = "raw";
        r4 = "com.android.camera";
        r1 = r1.getIdentifier(r2, r3, r4);
        if (r1 > 0) goto L_0x002d;
    L_0x0025:
        r0 = "DataFeature";
        r1 = "feature list default";
        com.android.camera.log.Log.e(r0, r1);
        return;
    L_0x002d:
        r2 = 0;
        r3 = new java.lang.StringBuilder;
        r3.<init>();
        r4 = new java.io.BufferedReader;	 Catch:{ IOException -> 0x0070, JSONException -> 0x0066 }
        r5 = new java.io.InputStreamReader;	 Catch:{ IOException -> 0x0070, JSONException -> 0x0066 }
        r0 = r0.getResources();	 Catch:{ IOException -> 0x0070, JSONException -> 0x0066 }
        r0 = r0.openRawResource(r1);	 Catch:{ IOException -> 0x0070, JSONException -> 0x0066 }
        r5.<init>(r0);	 Catch:{ IOException -> 0x0070, JSONException -> 0x0066 }
        r4.<init>(r5);	 Catch:{ IOException -> 0x0070, JSONException -> 0x0066 }
    L_0x0045:
        r0 = r4.readLine();	 Catch:{ IOException -> 0x0061, JSONException -> 0x005e, all -> 0x005b }
        if (r0 == 0) goto L_0x004f;
    L_0x004b:
        r3.append(r0);	 Catch:{ IOException -> 0x0061, JSONException -> 0x005e, all -> 0x005b }
        goto L_0x0045;
    L_0x004f:
        r0 = r3.toString();	 Catch:{ IOException -> 0x0061, JSONException -> 0x005e, all -> 0x005b }
        r6.A(r0);	 Catch:{ IOException -> 0x0061, JSONException -> 0x005e, all -> 0x005b }
        r4.close();	 Catch:{ IOException -> 0x007a }
        goto L_0x0079;
    L_0x005b:
        r0 = move-exception;
        r2 = r4;
        goto L_0x0080;
    L_0x005e:
        r0 = move-exception;
        r2 = r4;
        goto L_0x0067;
    L_0x0061:
        r0 = move-exception;
        r2 = r4;
        goto L_0x0071;
    L_0x0064:
        r0 = move-exception;
        goto L_0x0080;
    L_0x0066:
        r0 = move-exception;
    L_0x0067:
        r0.printStackTrace();	 Catch:{ all -> 0x0064 }
        if (r2 == 0) goto L_0x007f;
    L_0x006c:
        r2.close();	 Catch:{ IOException -> 0x007a }
        goto L_0x0079;
    L_0x0070:
        r0 = move-exception;
    L_0x0071:
        r0.printStackTrace();	 Catch:{ all -> 0x0064 }
        if (r2 == 0) goto L_0x007f;
    L_0x0076:
        r2.close();	 Catch:{ IOException -> 0x007a }
    L_0x0079:
        goto L_0x007f;
    L_0x007a:
        r0 = move-exception;
        r0.printStackTrace();
        goto L_0x0079;
    L_0x007f:
        return;
    L_0x0080:
        if (r2 == 0) goto L_0x008a;
    L_0x0082:
        r2.close();	 Catch:{ IOException -> 0x0086 }
        goto L_0x008a;
    L_0x0086:
        r1 = move-exception;
        r1.printStackTrace();
    L_0x008a:
        throw r0;
        */
        throw new UnsupportedOperationException("Method not decompiled: com.mi.config.a.eO():void");
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
