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
    public static final boolean IS_HONGMI = d.getBoolean(d.su, false);
    public static final boolean IS_MI2A = Build.IS_MI2A;
    public static final boolean IS_XIAOMI = d.getBoolean(d.st, false);
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
        return d.getInteger(d.sF, 100);
    }

    public static boolean fY() {
        if (hY()) {
            return false;
        }
        return d.getBoolean(d.sG, false);
    }

    public static boolean fZ() {
        return d.getBoolean(d.ty, false) ^ 1;
    }

    public static boolean ga() {
        return qe || d.getBoolean(d.tH, false);
    }

    public static boolean gb() {
        return d.getBoolean(d.sC, false);
    }

    public static boolean gd() {
        return ge() ^ 1;
    }

    public static boolean ge() {
        if (!Build.IS_INTERNATIONAL_BUILD) {
            return false;
        }
        CharSequence charSequence = SystemProperties.get("ro.miui.region");
        if (TextUtils.isEmpty(charSequence)) {
            return TextUtils.equals(Locale.getDefault().getCountry(), "KR");
        }
        return TextUtils.equals(charSequence, "KR");
    }

    public static boolean gf() {
        return d.getBoolean(d.sD, false);
    }

    public static boolean gg() {
        return d.getBoolean(d.sH, false);
    }

    public static boolean gh() {
        return !Build.IS_INTERNATIONAL_BUILD && d.getBoolean(d.sI, false);
    }

    public static boolean gi() {
        return d.getBoolean(d.sJ, false);
    }

    public static boolean gj() {
        return d.getBoolean(d.tI, false);
    }

    public static boolean gk() {
        return d.getBoolean(d.sK, false);
    }

    public static boolean gl() {
        return d.getBoolean(d.sL, false);
    }

    public static boolean gm() {
        return d.getBoolean(d.tw, false);
    }

    public static boolean gn() {
        return d.getBoolean(d.sM, false);
    }

    public static boolean go() {
        return !qZ && d.getBoolean(d.sN, false);
    }

    public static boolean gp() {
        return d.getBoolean(d.sO, false);
    }

    public static boolean gq() {
        return pF.equals(d.getString(d.sw));
    }

    public static boolean gr() {
        return pI.equals(d.getString(d.sw));
    }

    public static boolean gs() {
        return pH.equals(d.getString(d.sw));
    }

    public static boolean isMTKPlatform() {
        return pG.equals(d.getString(d.sw));
    }

    public static boolean gt() {
        return d.getBoolean(d.sx, false);
    }

    public static boolean gu() {
        return false;
    }

    public static boolean gv() {
        return d.getBoolean(d.sP, false);
    }

    public static boolean gw() {
        return d.getBoolean(d.sQ, false);
    }

    public static boolean gx() {
        return d.getBoolean(d.sR, false);
    }

    public static boolean gy() {
        return d.getBoolean(d.sS, false);
    }

    public static boolean gz() {
        return d.getBoolean(d.sT, false);
    }

    public static boolean gA() {
        return d.getBoolean(d.sU, false);
    }

    public static boolean gB() {
        if ((d.getInteger(d.rf, 0) & 1) != 0) {
            return true;
        }
        return false;
    }

    public static boolean gC() {
        if ((d.getInteger(d.rf, 0) & 15) != 0) {
            return true;
        }
        return false;
    }

    public static boolean gD() {
        if ((d.getInteger(d.rf, 0) & 2) != 0) {
            return true;
        }
        return false;
    }

    public static boolean gE() {
        return !gF() && IS_HONGMI;
    }

    public static boolean gF() {
        return d.getBoolean(d.sW, true);
    }

    public static boolean gG() {
        if ((d.getInteger(d.rf, 0) & 4) != 0) {
            return true;
        }
        return false;
    }

    public static boolean gH() {
        if (d.getBoolean(d.tK, false) && gI()) {
            return true;
        }
        return false;
    }

    public static boolean gI() {
        return false;
    }

    public static boolean gJ() {
        return d.getBoolean(d.tc, false);
    }

    public static boolean gK() {
        return d.getBoolean(d.sZ, false);
    }

    public static boolean gL() {
        if (pU || qe || Build.IS_HONGMI_TWOX || pO || pV || pQ || pR || pT || pM || IS_MI2A || pP || !d.getBoolean(d.tL, true)) {
            return false;
        }
        return true;
    }

    public static boolean gM() {
        return false;
    }

    public static boolean gN() {
        return d.getBoolean(d.te, false);
    }

    public static boolean gO() {
        return gq() && 21 <= VERSION.SDK_INT;
    }

    public static boolean gP() {
        return d.getBoolean(d.tf, false);
    }

    public static boolean gQ() {
        return d.getBoolean(d.tg, false);
    }

    public static boolean gR() {
        return (IS_XIAOMI || IS_HONGMI) ? false : true;
    }

    public static boolean gS() {
        return d.getBoolean(d.tM, false);
    }

    public static boolean gT() {
        return d.getBoolean(d.th, false);
    }

    public static boolean gU() {
        return d.getBoolean(d.ti, false);
    }

    public static boolean gV() {
        if (pU || qe || Build.IS_HONGMI_TWOX || pO || pV || pQ || pR || pT || pM || IS_MI2A || pP || qf || !d.getBoolean(d.tN, true)) {
            return false;
        }
        return true;
    }

    public static boolean gW() {
        return d.getBoolean(d.tO, false);
    }

    public static boolean gX() {
        return pM && !IS_MI2A;
    }

    public static boolean gY() {
        return d.getBoolean(d.tj, false);
    }

    public static int gZ() {
        return d.getInteger(d.ua, AutoLockManager.HIBERNATION_TIMEOUT);
    }

    public static boolean ha() {
        return d.getBoolean(d.tk, false);
    }

    public static boolean hb() {
        return d.getBoolean(d.tl, false);
    }

    public static boolean hc() {
        return false;
    }

    public static boolean hd() {
        return d.getBoolean(d.tp, false);
    }

    public static boolean he() {
        return d.getBoolean(d.sy, false);
    }

    public static boolean hf() {
        return d.getBoolean(d.tq, false);
    }

    public static boolean hg() {
        return !Build.IS_INTERNATIONAL_BUILD && d.getBoolean(d.ts, false);
    }

    public static boolean isPad() {
        return d.getBoolean(d.sv, false);
    }

    public static String hh() {
        return d.getString(d.sz);
    }

    public static String hi() {
        return d.getString(d.sA);
    }

    public static boolean hj() {
        return d.getBoolean(d.tP, false);
    }

    public static boolean hk() {
        if (Build.IS_INTERNATIONAL_BUILD || !d.getBoolean(d.tr, false)) {
            return false;
        }
        return true;
    }

    public static boolean hl() {
        return (qa && Build.IS_INTERNATIONAL_BUILD) || qu;
    }

    public static boolean hm() {
        return true;
    }

    public static boolean hn() {
        return d.getBoolean(d.tx, false);
    }

    public static boolean ho() {
        if (pO || qf || Build.IS_HONGMI_TWOX || pU || !d.getBoolean(d.tQ, true)) {
            return false;
        }
        return true;
    }

    public static boolean hp() {
        return d.getBoolean(d.tC, false) ^ 1;
    }

    public static boolean hq() {
        if (d.getBoolean(d.tR, false) || isMTKPlatform()) {
            return false;
        }
        return true;
    }

    public static boolean hr() {
        return d.getBoolean(d.tD, true);
    }

    public static boolean hs() {
        return d.getBoolean(d.tS, false);
    }

    public static boolean isSupportedOpticalZoom() {
        return d.getBoolean(d.tT, false);
    }

    public static boolean isSupportedPortrait() {
        return d.getBoolean(d.tU, false);
    }

    public static boolean ht() {
        return d.getBoolean(d.tV, false);
    }

    public static boolean hu() {
        return false;
    }

    public static ArrayList<String> hv() {
        if (re == null) {
            re = new ArrayList();
            String[] stringArray = d.getStringArray(d.sB);
            if (stringArray != null) {
                Collections.addAll(re, stringArray);
            }
        }
        return re;
    }

    public static boolean hw() {
        return d.getBoolean(d.tv, false);
    }

    public static boolean hx() {
        return d.getBoolean(d.sE, false);
    }

    public static boolean hy() {
        return d.getBoolean(d.tu, false);
    }

    public static boolean hz() {
        return d.getBoolean(d.tB, true);
    }

    public static boolean hA() {
        return d.getBoolean(d.tW, false);
    }

    public static boolean hB() {
        if (!qN) {
            return d.getBoolean(d.tE, false);
        }
        return "India".equals(SystemProperties.get("ro.boot.hwc"));
    }

    public static boolean hC() {
        return qq || qK || qT;
    }

    public static boolean hD() {
        return d.getBoolean(d.ue, true);
    }

    public static boolean hE() {
        return d.getBoolean(d.tX, true);
    }

    public static boolean hF() {
        return d.getBoolean(d.tz, false);
    }

    public static boolean hG() {
        return d.getBoolean(d.tY, true);
    }

    public static boolean hH() {
        return hF() && d.getBoolean(d.tA, true);
    }

    private static boolean hI() {
        return SystemProperties.getBoolean("ro.hardware.fp.fod", false);
    }

    private static boolean hJ() {
        if (d.getBoolean(d.tF, false) || hI()) {
            return true;
        }
        return false;
    }

    public static boolean hK() {
        if (hJ() || hv() == null || hv().isEmpty()) {
            return false;
        }
        return true;
    }

    public static boolean hL() {
        return d.getBoolean(d.uc, false);
    }

    public static boolean hM() {
        return d.getBoolean(d.ul, false);
    }

    public static boolean hN() {
        return d.getBoolean(d.uf, false);
    }

    public static boolean hO() {
        return d.getBoolean(d.ug, false);
    }

    public static boolean hP() {
        return d.getBoolean(d.uh, false);
    }

    public static boolean hQ() {
        return d.getBoolean(d.ui, false);
    }

    public static boolean hR() {
        return hP() || hQ();
    }

    public static boolean hS() {
        return d.getBoolean(d.tZ, false);
    }

    public static boolean hT() {
        return d.getBoolean(d.uk, false);
    }

    public static boolean isSupportSuperResolution() {
        return d.getBoolean(d.um, false);
    }

    public static boolean hU() {
        return d.getBoolean(d.un, true);
    }

    public static boolean hV() {
        return d.getBoolean(d.uo, false);
    }

    public static boolean hW() {
        return qV || qT;
    }

    public static boolean hX() {
        return d.getBoolean(d.up, false);
    }

    public static boolean fx() {
        return DataRepository.dataItemFeature().fx();
    }

    public static boolean fR() {
        return DataRepository.dataItemFeature().fR();
    }

    public static boolean hY() {
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

    public static String getGivenName() {
        boolean z = DataRepository.dataItemFeature().getBoolean(c.sn, false);
        if (android.os.Build.MODEL.contains("Explorer") && z) {
            return "_a";
        }
        return "";
    }
}
