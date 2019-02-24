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
    public static final boolean IS_HONGMI = d.getBoolean(d.sD, false);
    public static final boolean IS_MI2A = Build.IS_MI2A;
    public static final boolean IS_XIAOMI = d.getBoolean(d.sC, false);
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
        return d.getInteger(d.sO, 100);
    }

    public static boolean gi() {
        if (ih()) {
            return false;
        }
        return d.getBoolean(d.sP, false);
    }

    public static boolean gj() {
        return d.getBoolean(d.tH, false) ^ 1;
    }

    public static boolean gk() {
        return qe || d.getBoolean(d.tQ, false);
    }

    public static boolean gl() {
        return d.getBoolean(d.sL, false);
    }

    public static boolean gm() {
        return gn() ^ 1;
    }

    public static boolean gn() {
        if (!Build.IS_INTERNATIONAL_BUILD) {
            return false;
        }
        CharSequence charSequence = SystemProperties.get("ro.miui.region");
        if (TextUtils.isEmpty(charSequence)) {
            return TextUtils.equals(Locale.getDefault().getCountry(), "KR");
        }
        return TextUtils.equals(charSequence, "KR");
    }

    public static boolean go() {
        return d.getBoolean(d.sM, false);
    }

    public static boolean gp() {
        return d.getBoolean(d.sQ, false);
    }

    public static boolean gq() {
        return !Build.IS_INTERNATIONAL_BUILD && d.getBoolean(d.sR, false);
    }

    public static boolean gr() {
        return d.getBoolean(d.sS, false);
    }

    public static boolean gs() {
        return d.getBoolean(d.tR, false);
    }

    public static boolean gt() {
        return d.getBoolean(d.sT, false);
    }

    public static boolean gu() {
        return d.getBoolean(d.sU, false);
    }

    public static boolean gv() {
        return d.getBoolean(d.tF, false);
    }

    public static boolean gw() {
        return d.getBoolean(d.sV, false);
    }

    public static boolean gx() {
        return !qZ && d.getBoolean(d.sW, false);
    }

    public static boolean gy() {
        return d.getBoolean(d.sZ, false);
    }

    public static boolean gz() {
        return pF.equals(d.getString(d.sF));
    }

    public static boolean gA() {
        return pI.equals(d.getString(d.sF));
    }

    public static boolean gB() {
        return pH.equals(d.getString(d.sF));
    }

    public static boolean isMTKPlatform() {
        return pG.equals(d.getString(d.sF));
    }

    public static boolean gC() {
        return d.getBoolean(d.sG, false);
    }

    public static boolean gD() {
        return false;
    }

    public static boolean gE() {
        return d.getBoolean(d.ta, false);
    }

    public static boolean gF() {
        return d.getBoolean(d.tb, false);
    }

    public static boolean gG() {
        return d.getBoolean(d.tc, false);
    }

    public static boolean gH() {
        return d.getBoolean(d.td, false);
    }

    public static boolean gI() {
        return d.getBoolean(d.te, false);
    }

    public static boolean gJ() {
        return d.getBoolean(d.tf, false);
    }

    public static boolean gK() {
        if ((d.getInteger(d.rf, 0) & 1) != 0) {
            return true;
        }
        return false;
    }

    public static boolean gL() {
        if ((d.getInteger(d.rf, 0) & 15) != 0) {
            return true;
        }
        return false;
    }

    public static boolean gM() {
        if ((d.getInteger(d.rf, 0) & 2) != 0) {
            return true;
        }
        return false;
    }

    public static boolean gN() {
        return !gO() && IS_HONGMI;
    }

    public static boolean gO() {
        return d.getBoolean(d.th, true);
    }

    public static boolean gP() {
        if ((d.getInteger(d.rf, 0) & 4) != 0) {
            return true;
        }
        return false;
    }

    public static boolean gQ() {
        if (d.getBoolean(d.tT, false) && gR()) {
            return true;
        }
        return false;
    }

    public static boolean gR() {
        return false;
    }

    public static boolean gS() {
        return d.getBoolean(d.tl, false);
    }

    public static boolean gT() {
        return d.getBoolean(d.ti, false);
    }

    public static boolean gU() {
        if (pU || qe || Build.IS_HONGMI_TWOX || pO || pV || pQ || pR || pT || pM || IS_MI2A || pP || !d.getBoolean(d.tU, true)) {
            return false;
        }
        return true;
    }

    public static boolean gV() {
        return false;
    }

    public static boolean gW() {
        return d.getBoolean(d.tn, false);
    }

    public static boolean gX() {
        return gz() && 21 <= VERSION.SDK_INT;
    }

    public static boolean gY() {
        return d.getBoolean(d.to, false);
    }

    public static boolean gZ() {
        return d.getBoolean(d.tp, false);
    }

    public static boolean ha() {
        return (IS_XIAOMI || IS_HONGMI) ? false : true;
    }

    public static boolean hb() {
        return d.getBoolean(d.tV, false);
    }

    public static boolean hc() {
        return d.getBoolean(d.tq, false);
    }

    public static boolean hd() {
        return d.getBoolean(d.tr, false);
    }

    public static boolean he() {
        if (pU || qe || Build.IS_HONGMI_TWOX || pO || pV || pQ || pR || pT || pM || IS_MI2A || pP || qf || !d.getBoolean(d.tW, true)) {
            return false;
        }
        return true;
    }

    public static boolean hf() {
        return d.getBoolean(d.tX, false);
    }

    public static boolean hg() {
        return pM && !IS_MI2A;
    }

    public static boolean hh() {
        return d.getBoolean(d.ts, false);
    }

    public static int hi() {
        return d.getInteger(d.uj, AutoLockManager.HIBERNATION_TIMEOUT);
    }

    public static boolean hj() {
        return d.getBoolean(d.tt, false);
    }

    public static boolean hk() {
        return d.getBoolean(d.tu, false);
    }

    public static boolean hl() {
        return false;
    }

    public static boolean hm() {
        return d.getBoolean(d.ty, false);
    }

    public static boolean hn() {
        return d.getBoolean(d.sH, false);
    }

    public static boolean ho() {
        return d.getBoolean(d.tz, false);
    }

    public static boolean hp() {
        return !Build.IS_INTERNATIONAL_BUILD && d.getBoolean(d.tB, false);
    }

    public static boolean isPad() {
        return d.getBoolean(d.sE, false);
    }

    public static String hq() {
        return d.getString(d.sI);
    }

    public static String hr() {
        return d.getString(d.sJ);
    }

    public static boolean hs() {
        return d.getBoolean(d.tY, false);
    }

    public static boolean ht() {
        if (Build.IS_INTERNATIONAL_BUILD || !d.getBoolean(d.tA, false)) {
            return false;
        }
        return true;
    }

    public static boolean hu() {
        return (qa && Build.IS_INTERNATIONAL_BUILD) || qu;
    }

    public static boolean hv() {
        return true;
    }

    public static boolean hw() {
        return d.getBoolean(d.tG, false);
    }

    public static boolean hx() {
        if (pO || qf || Build.IS_HONGMI_TWOX || pU || !d.getBoolean(d.tZ, true)) {
            return false;
        }
        return true;
    }

    public static boolean hy() {
        return d.getBoolean(d.tL, false) ^ 1;
    }

    public static boolean hz() {
        if (d.getBoolean(d.ua, false) || isMTKPlatform()) {
            return false;
        }
        return true;
    }

    public static boolean hA() {
        return d.getBoolean(d.tM, true);
    }

    public static boolean hB() {
        return d.getBoolean(d.ub, false);
    }

    public static boolean isSupportedOpticalZoom() {
        return d.getBoolean(d.uc, false);
    }

    public static boolean isSupportedPortrait() {
        return d.getBoolean(d.ud, false);
    }

    public static boolean hC() {
        return d.getBoolean(d.ue, false);
    }

    public static boolean hD() {
        return false;
    }

    public static ArrayList<String> hE() {
        if (re == null) {
            re = new ArrayList();
            String[] stringArray = d.getStringArray(d.sK);
            if (stringArray != null) {
                Collections.addAll(re, stringArray);
            }
        }
        return re;
    }

    public static boolean hF() {
        return d.getBoolean(d.tE, false);
    }

    public static boolean hG() {
        return d.getBoolean(d.sN, false);
    }

    public static boolean hH() {
        return d.getBoolean(d.tD, false);
    }

    public static boolean hI() {
        return d.getBoolean(d.tK, true);
    }

    public static boolean hJ() {
        return d.getBoolean(d.uf, false);
    }

    public static boolean hK() {
        if (!qN) {
            return d.getBoolean(d.tN, false);
        }
        return "India".equals(SystemProperties.get("ro.boot.hwc"));
    }

    public static boolean hL() {
        return qq || qK || qT;
    }

    public static boolean hM() {
        return d.getBoolean(d.un, true);
    }

    public static boolean hN() {
        return d.getBoolean(d.ug, true);
    }

    public static boolean hO() {
        return d.getBoolean(d.tI, false);
    }

    public static boolean hP() {
        return d.getBoolean(d.uh, true);
    }

    public static boolean hQ() {
        return hO() && d.getBoolean(d.tJ, true);
    }

    private static boolean hR() {
        return SystemProperties.getBoolean("ro.hardware.fp.fod", false);
    }

    private static boolean hS() {
        if (d.getBoolean(d.tO, false) || hR()) {
            return true;
        }
        return false;
    }

    public static boolean hT() {
        if (hS() || hE() == null || hE().isEmpty()) {
            return false;
        }
        return true;
    }

    public static boolean hU() {
        return d.getBoolean(d.ul, false);
    }

    public static boolean hV() {
        return d.getBoolean(d.uu, false);
    }

    public static boolean hW() {
        return d.getBoolean(d.uo, false);
    }

    public static boolean hX() {
        return d.getBoolean(d.up, false);
    }

    public static boolean hY() {
        return d.getBoolean(d.uq, false);
    }

    public static boolean hZ() {
        return d.getBoolean(d.ur, false);
    }

    public static boolean ia() {
        return hY() || hZ();
    }

    public static boolean ib() {
        return d.getBoolean(d.ui, false);
    }

    public static boolean ic() {
        return d.getBoolean(d.ut, false);
    }

    public static boolean isSupportSuperResolution() {
        return d.getBoolean(d.uv, false);
    }

    public static boolean id() {
        return d.getBoolean(d.uw, true);
    }

    public static boolean ie() {
        return d.getBoolean(d.ux, false);
    }

    /* renamed from: if */
    public static boolean m0if() {
        return qV || qT;
    }

    public static boolean ig() {
        return d.getBoolean(d.uy, false);
    }

    public static boolean isSupportUltraWide() {
        return DataRepository.dataItemFeature().isSupportUltraWide();
    }

    public static boolean fT() {
        return DataRepository.dataItemFeature().fT();
    }

    public static boolean ih() {
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
        boolean z = DataRepository.dataItemFeature().getBoolean(c.sp, false);
        if (android.os.Build.MODEL.contains("Explorer") && z) {
            return "_a";
        }
        return "";
    }
}
