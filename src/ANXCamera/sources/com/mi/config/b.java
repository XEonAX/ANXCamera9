package com.mi.config;

import android.os.Build.VERSION;
import android.os.SystemProperties;
import android.text.TextUtils;
import com.android.camera.AutoLockManager;
import com.android.camera.data.DataRepository;
import java.util.ArrayList;
import java.util.Collections;
import java.util.Locale;
import miui.os.Build;

/* compiled from: Device */
public class b {
    public static final boolean IS_HONGMI = d.getBoolean(d.sn, false);
    public static final boolean IS_MI2A = Build.IS_MI2A;
    public static final boolean IS_XIAOMI = d.getBoolean(d.sm, false);
    public static final String pE = Build.DEVICE;
    public static final String pF = "qcom";
    public static final String pG = "mediatek";
    public static final String pH = "leadcore";
    public static final String pI = "nvidia";
    public static final String pJ = "intel";
    private static final int pK = 100;
    public static final String pL = Build.MODEL;
    public static final boolean pM = Build.IS_MITWO;
    public static final boolean pN = "pisces".equals(pE);
    public static final boolean pO;
    public static final boolean pP;
    public static final boolean pQ;
    public static final boolean pR = Build.IS_HONGMI_TWO_S;
    public static final boolean pS;
    public static final boolean pT = Build.IS_HONGMI_TWOS_LTE_MTK;
    public static final boolean pU = Build.IS_HONGMI_TWO_A;
    public static final boolean pV = Build.IS_HONGMI_THREE;
    public static final boolean pW = "gucci".equals(pE);
    public static final boolean pX = "hermes".equals(pE);
    public static final boolean pY = "hennessy".equals(pE);
    public static final boolean pZ = "dior".equals(pE);
    public static final boolean qA = pE.startsWith("prada");
    public static final boolean qB = pE.startsWith("mido");
    public static final boolean qC = "rolex".equals(pE);
    public static final boolean qD = "sagit".equals(pE);
    public static final boolean qE = "centaur".equals(pE);
    public static final boolean qF = "achilles".equals(pE);
    public static final boolean qG = "jason".equals(pE);
    public static final boolean qH = "tiffany".equals(pE);
    public static final boolean qI = "ulysse".equals(pE);
    public static final boolean qJ = "oxygen".equals(pE);
    public static final boolean qK = "chiron".equals(pE);
    public static final boolean qL = "ugg".equals(pE);
    public static final boolean qM = "vince".equals(pE);
    public static final boolean qN = "whyred".equals(pE);
    public static final boolean qO = "beryllium".equals(pE);
    public static final boolean qP = "violet".equals(pE);
    public static final boolean qQ = "pisces".equals(pE);
    public static final boolean qR = "hammerhead".equals(pE);
    public static final boolean qS = "santoni".equals(pE);
    public static final boolean qT = "polaris".equals(pE);
    public static final boolean qU = "sirius".equals(pE);
    public static final boolean qV = "dipper".equals(pE);
    public static final boolean qW = "ursa".equals(pE);
    public static final boolean qX = "equuleus".equals(pE);
    public static final boolean qY = Build.IS_STABLE_VERSION;
    public static final boolean qZ = Build.IS_CM_CUSTOMIZATION_TEST;
    public static final boolean qa = "kenzo".equals(pE);
    public static final boolean qb = "kate".equals(pE);
    public static final boolean qc;
    public static final boolean qe = Build.IS_HONGMI_TWOX_LC;
    public static final boolean qf = Build.IS_MIFOUR;
    public static final boolean qg = Build.IS_MIPAD;
    public static final boolean qh = Build.IS_MIFIVE;
    public static final boolean qi = "leo".equals(pE);
    public static final boolean qj = "ferrari".equals(pE);
    public static final boolean qk = "ido".equals(pE);
    public static final boolean ql = "aqua".equals(pE);
    public static final boolean qm = "gemini".equals(pE);
    public static final boolean qn = "gold".equals(pE);
    public static final boolean qo = "capricorn".equals(pE);
    public static final boolean qp = "natrium".equals(pE);
    public static final boolean qq = "lithium".equals(pE);
    public static final boolean qr = "scorpio".equals(pE);
    public static final boolean qt = "libra".equals(pE);
    public static final boolean qu = "land".equals(pE);
    public static final boolean qv = "hydrogen".equals(pE);
    public static final boolean qw = "helium".equals(pE);
    public static final boolean qx = "omega".equals(pE);
    public static final boolean qy = pE.startsWith("nike");
    public static final boolean qz = pE.startsWith("mark");
    private static final int ra = 1;
    private static final int rb = 2;
    private static final int rc = 4;
    private static final int rd = 8;
    private static ArrayList<String> re;

    static {
        boolean z = true;
        boolean z2 = "cancro".equals(pE) && Build.MODEL.startsWith("MI 3");
        pO = z2;
        z2 = pO || pN;
        pP = z2;
        z2 = (!Build.IS_HONGMI_TWO || Build.IS_HONGMI_TWO_A || Build.IS_HONGMI_TWO_S) ? false : true;
        pQ = z2;
        z2 = pQ || pR;
        pS = z2;
        if (!(Build.IS_HONGMI_TWOX || "HM2014816".equals(pE))) {
            z = false;
        }
        qc = z;
    }

    public static int getBurstShootCount() {
        return d.getInteger(d.sy, 100);
    }

    public static boolean fS() {
        return d.getBoolean(d.sz, false);
    }

    public static boolean fT() {
        return d.getBoolean(d.tr, false) ^ 1;
    }

    public static boolean fU() {
        return qe || d.getBoolean(d.tA, false);
    }

    public static boolean fV() {
        return d.getBoolean(d.sv, false);
    }

    public static boolean fW() {
        return fX() ^ 1;
    }

    public static boolean fX() {
        if (!Build.IS_INTERNATIONAL_BUILD) {
            return false;
        }
        CharSequence charSequence = SystemProperties.get("ro.miui.region");
        if (TextUtils.isEmpty(charSequence)) {
            return TextUtils.equals(Locale.getDefault().getCountry(), "KR");
        }
        return TextUtils.equals(charSequence, "KR");
    }

    public static boolean fY() {
        return d.getBoolean(d.sw, false);
    }

    public static boolean fZ() {
        return d.getBoolean(d.sA, false);
    }

    public static boolean ga() {
        return !Build.IS_INTERNATIONAL_BUILD && d.getBoolean(d.sB, false);
    }

    public static boolean gb() {
        return d.getBoolean(d.sC, false);
    }

    public static boolean gd() {
        return d.getBoolean(d.tB, false);
    }

    public static boolean ge() {
        return d.getBoolean(d.sD, false);
    }

    public static boolean gf() {
        return d.getBoolean(d.sE, false);
    }

    public static boolean gg() {
        return d.getBoolean(d.tp, false);
    }

    public static boolean gh() {
        return d.getBoolean(d.sF, false);
    }

    public static boolean gi() {
        return !qZ && d.getBoolean(d.sG, false);
    }

    public static boolean gj() {
        return d.getBoolean(d.sH, false);
    }

    public static boolean gk() {
        return pF.equals(d.getString(d.sp));
    }

    public static boolean gl() {
        return pI.equals(d.getString(d.sp));
    }

    public static boolean gm() {
        return pH.equals(d.getString(d.sp));
    }

    public static boolean isMTKPlatform() {
        return pG.equals(d.getString(d.sp));
    }

    public static boolean gn() {
        return d.getBoolean(d.sq, false);
    }

    public static boolean go() {
        return false;
    }

    public static boolean gp() {
        return d.getBoolean(d.sI, false);
    }

    public static boolean gq() {
        return d.getBoolean(d.sJ, false);
    }

    public static boolean gr() {
        return d.getBoolean(d.sK, false);
    }

    public static boolean gs() {
        return d.getBoolean(d.sL, false);
    }

    public static boolean gt() {
        return d.getBoolean(d.sM, false);
    }

    public static boolean gu() {
        return d.getBoolean(d.sN, false);
    }

    public static boolean gv() {
        if ((d.getInteger(d.rf, 0) & 1) != 0) {
            return true;
        }
        return false;
    }

    public static boolean gw() {
        if ((d.getInteger(d.rf, 0) & 15) != 0) {
            return true;
        }
        return false;
    }

    public static boolean gx() {
        if ((d.getInteger(d.rf, 0) & 2) != 0) {
            return true;
        }
        return false;
    }

    public static boolean gy() {
        return !gz() && IS_HONGMI;
    }

    public static boolean gz() {
        return d.getBoolean(d.sP, true);
    }

    public static boolean gA() {
        if ((d.getInteger(d.rf, 0) & 4) != 0) {
            return true;
        }
        return false;
    }

    public static boolean gB() {
        if (d.getBoolean(d.tD, false) && gC()) {
            return true;
        }
        return false;
    }

    public static boolean gC() {
        return false;
    }

    public static boolean gD() {
        return d.getBoolean(d.sT, false);
    }

    public static boolean gE() {
        return d.getBoolean(d.sQ, false);
    }

    public static boolean gF() {
        if (pU || qe || Build.IS_HONGMI_TWOX || pO || pV || pQ || pR || pT || pM || IS_MI2A || pP || !d.getBoolean(d.tE, true)) {
            return false;
        }
        return true;
    }

    public static boolean gG() {
        return false;
    }

    public static boolean gH() {
        return d.getBoolean(d.sV, false);
    }

    public static boolean gI() {
        return gk() && 21 <= VERSION.SDK_INT;
    }

    public static boolean gJ() {
        return d.getBoolean(d.sW, false);
    }

    public static boolean gK() {
        return d.getBoolean(d.sZ, false);
    }

    public static boolean gL() {
        return (IS_XIAOMI || IS_HONGMI) ? false : true;
    }

    public static boolean gM() {
        return d.getBoolean(d.tF, false);
    }

    public static boolean gN() {
        return d.getBoolean(d.ta, false);
    }

    public static boolean gO() {
        return d.getBoolean(d.tb, false);
    }

    public static boolean gP() {
        if (pU || qe || Build.IS_HONGMI_TWOX || pO || pV || pQ || pR || pT || pM || IS_MI2A || pP || qf || !d.getBoolean(d.tG, true)) {
            return false;
        }
        return true;
    }

    public static boolean gQ() {
        return d.getBoolean(d.tH, false);
    }

    public static boolean gR() {
        return pM && !IS_MI2A;
    }

    public static boolean gS() {
        return d.getBoolean(d.tc, false);
    }

    public static int gT() {
        return d.getInteger(d.tT, AutoLockManager.HIBERNATION_TIMEOUT);
    }

    public static boolean gU() {
        return d.getBoolean(d.td, false);
    }

    public static boolean gV() {
        return d.getBoolean(d.te, false);
    }

    public static boolean gW() {
        return false;
    }

    public static boolean gX() {
        return d.getBoolean(d.ti, false);
    }

    public static boolean gY() {
        return d.getBoolean(d.sr, false);
    }

    public static boolean gZ() {
        return d.getBoolean(d.tj, false);
    }

    public static boolean ha() {
        return !Build.IS_INTERNATIONAL_BUILD && d.getBoolean(d.tl, false);
    }

    public static boolean isPad() {
        return d.getBoolean(d.so, false);
    }

    public static String hb() {
        return d.getString(d.ss);
    }

    public static String hc() {
        return d.getString(d.st);
    }

    public static boolean hd() {
        return d.getBoolean(d.tI, false);
    }

    public static boolean he() {
        if (Build.IS_INTERNATIONAL_BUILD || !d.getBoolean(d.tk, false)) {
            return false;
        }
        return true;
    }

    public static boolean hf() {
        return (qa && Build.IS_INTERNATIONAL_BUILD) || qu;
    }

    public static boolean hg() {
        return true;
    }

    public static boolean hh() {
        return d.getBoolean(d.tq, false);
    }

    public static boolean hi() {
        if (pO || qf || Build.IS_HONGMI_TWOX || pU || !d.getBoolean(d.tJ, true)) {
            return false;
        }
        return true;
    }

    public static boolean hj() {
        return d.getBoolean(d.tv, false) ^ 1;
    }

    public static boolean hk() {
        if (d.getBoolean(d.tK, false) || isMTKPlatform()) {
            return false;
        }
        return true;
    }

    public static boolean hl() {
        return d.getBoolean(d.tw, true);
    }

    public static boolean hm() {
        return d.getBoolean(d.tL, false);
    }

    public static boolean isSupportedOpticalZoom() {
        return d.getBoolean(d.tM, false);
    }

    public static boolean isSupportedPortrait() {
        return d.getBoolean(d.tN, false);
    }

    public static boolean hn() {
        return d.getBoolean(d.tO, false);
    }

    public static boolean ho() {
        return false;
    }

    public static ArrayList<String> hp() {
        if (re == null) {
            re = new ArrayList();
            String[] stringArray = d.getStringArray(d.su);
            if (stringArray != null) {
                Collections.addAll(re, stringArray);
            }
        }
        return re;
    }

    public static boolean hq() {
        return d.getBoolean(d.to, false);
    }

    public static boolean hr() {
        return d.getBoolean(d.sx, false);
    }

    public static boolean hs() {
        return d.getBoolean(d.tn, false);
    }

    public static boolean ht() {
        return d.getBoolean(d.tu, true);
    }

    public static boolean hu() {
        return d.getBoolean(d.tP, false);
    }

    public static boolean hv() {
        if (!qN) {
            return d.getBoolean(d.tx, false);
        }
        return "India".equals(SystemProperties.get("ro.boot.hwc"));
    }

    public static boolean hw() {
        return qq || qK || qT;
    }

    public static boolean hx() {
        return d.getBoolean(d.tX, true);
    }

    public static boolean hy() {
        return d.getBoolean(d.tQ, true);
    }

    public static boolean hz() {
        return d.getBoolean(d.ts, false);
    }

    public static boolean hA() {
        return d.getBoolean(d.tR, true);
    }

    public static boolean hB() {
        return hz() && d.getBoolean(d.tt, true);
    }

    private static boolean hC() {
        return SystemProperties.getBoolean("ro.hardware.fp.fod", false);
    }

    private static boolean hD() {
        if (d.getBoolean(d.ty, false) || hC()) {
            return true;
        }
        return false;
    }

    public static boolean hE() {
        if (hD() || hp() == null || hp().isEmpty()) {
            return false;
        }
        return true;
    }

    public static boolean hF() {
        return d.getBoolean(d.tV, false);
    }

    public static boolean hG() {
        return d.getBoolean(d.ue, false);
    }

    public static boolean hH() {
        return d.getBoolean(d.tY, false);
    }

    public static boolean hI() {
        return d.getBoolean(d.tZ, false);
    }

    public static boolean hJ() {
        return d.getBoolean(d.ua, false);
    }

    public static boolean hK() {
        return d.getBoolean(d.ub, false);
    }

    public static boolean hL() {
        return hJ() || hK();
    }

    public static boolean hM() {
        return d.getBoolean(d.tS, false);
    }

    public static boolean hN() {
        return d.getBoolean(d.ud, false);
    }

    public static boolean isSupportSuperResolution() {
        return d.getBoolean(d.uf, false);
    }

    public static boolean hO() {
        return d.getBoolean(d.ug, true);
    }

    public static boolean hP() {
        return d.getBoolean(d.uh, false);
    }

    public static boolean hQ() {
        return qV || qT;
    }

    public static boolean hR() {
        return d.getBoolean(d.ui, false);
    }

    public static boolean fx() {
        return DataRepository.dataItemFeature().fx();
    }

    public static boolean fP() {
        return DataRepository.dataItemFeature().fP();
    }

    public static boolean hS() {
        boolean z = false;
        if ("onc".equals(pE)) {
            Object obj = SystemProperties.get("ro.boot.hwversion");
            if (!TextUtils.isEmpty(obj)) {
                if ('2' == obj.charAt(0)) {
                    z = true;
                }
                return z;
            }
        }
        return false;
    }
}
