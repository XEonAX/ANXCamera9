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
    public static final boolean IS_HONGMI = d.getBoolean(d.sc, false);
    public static final boolean IS_MI2A = Build.IS_MI2A;
    public static final boolean IS_XIAOMI = d.getBoolean(d.sb, false);
    public static final String pF = Build.DEVICE;
    public static final String pG = "qcom";
    public static final String pH = "mediatek";
    public static final String pI = "leadcore";
    public static final String pJ = "nvidia";
    public static final String pK = "intel";
    private static final int pL = 100;
    public static final String pM = Build.MODEL;
    public static final boolean pN = Build.IS_MITWO;
    public static final boolean pO = "pisces".equals(pF);
    public static final boolean pP;
    public static final boolean pQ;
    public static final boolean pR;
    public static final boolean pS = Build.IS_HONGMI_TWO_S;
    public static final boolean pT;
    public static final boolean pU = Build.IS_HONGMI_TWOS_LTE_MTK;
    public static final boolean pV = Build.IS_HONGMI_TWO_A;
    public static final boolean pW = Build.IS_HONGMI_THREE;
    public static final boolean pX = "gucci".equals(pF);
    public static final boolean pY = "hermes".equals(pF);
    public static final boolean pZ = "hennessy".equals(pF);
    public static final boolean qA = pF.startsWith("mark");
    public static final boolean qB = pF.startsWith("prada");
    public static final boolean qC = pF.startsWith("mido");
    public static final boolean qD = "rolex".equals(pF);
    public static final boolean qE = "sagit".equals(pF);
    public static final boolean qF = "centaur".equals(pF);
    public static final boolean qG = "achilles".equals(pF);
    public static final boolean qH = "jason".equals(pF);
    public static final boolean qI = "tiffany".equals(pF);
    public static final boolean qJ = "ulysse".equals(pF);
    public static final boolean qK = "oxygen".equals(pF);
    public static final boolean qL = "chiron".equals(pF);
    public static final boolean qM = "ugg".equals(pF);
    public static final boolean qN = "vince".equals(pF);
    public static final boolean qO = "whyred".equals(pF);
    public static final boolean qP = "beryllium".equals(pF);
    public static final boolean qQ = "pisces".equals(pF);
    public static final boolean qR = "hammerhead".equals(pF);
    public static final boolean qS = "santoni".equals(pF);
    public static final boolean qT = "polaris".equals(pF);
    public static final boolean qU = "sirius".equals(pF);
    public static final boolean qV = "dipper".equals(pF);
    public static final boolean qW = "ursa".equals(pF);
    public static final boolean qX = "equuleus".equals(pF);
    public static final boolean qY = Build.IS_STABLE_VERSION;
    public static final boolean qZ = Build.IS_CM_CUSTOMIZATION_TEST;
    public static final boolean qa = "dior".equals(pF);
    public static final boolean qb = "kenzo".equals(pF);
    public static final boolean qc = "kate".equals(pF);
    public static final boolean qe;
    public static final boolean qf = Build.IS_HONGMI_TWOX_LC;
    public static final boolean qg = Build.IS_MIFOUR;
    public static final boolean qh = Build.IS_MIPAD;
    public static final boolean qi = Build.IS_MIFIVE;
    public static final boolean qj = "leo".equals(pF);
    public static final boolean qk = "ferrari".equals(pF);
    public static final boolean ql = "ido".equals(pF);
    public static final boolean qm = "aqua".equals(pF);
    public static final boolean qn = "gemini".equals(pF);
    public static final boolean qo = "gold".equals(pF);
    public static final boolean qp = "capricorn".equals(pF);
    public static final boolean qq = "natrium".equals(pF);
    public static final boolean qr = "lithium".equals(pF);
    public static final boolean qt = "scorpio".equals(pF);
    public static final boolean qu = "libra".equals(pF);
    public static final boolean qv = "land".equals(pF);
    public static final boolean qw = "hydrogen".equals(pF);
    public static final boolean qx = "helium".equals(pF);
    public static final boolean qy = "omega".equals(pF);
    public static final boolean qz = pF.startsWith("nike");
    private static final int ra = 1;
    private static final int rb = 2;
    private static final int rc = 4;
    private static final int rd = 8;
    private static ArrayList<String> re;

    static {
        boolean z = true;
        boolean z2 = "cancro".equals(pF) && Build.MODEL.startsWith("MI 3");
        pP = z2;
        z2 = pP || pO;
        pQ = z2;
        z2 = (!Build.IS_HONGMI_TWO || Build.IS_HONGMI_TWO_A || Build.IS_HONGMI_TWO_S) ? false : true;
        pR = z2;
        z2 = pR || pS;
        pT = z2;
        if (!(Build.IS_HONGMI_TWOX || "HM2014816".equals(pF))) {
            z = false;
        }
        qe = z;
    }

    public static int getBurstShootCount() {
        return d.getInteger(d.so, 100);
    }

    public static boolean fI() {
        return d.getBoolean(d.sp, false);
    }

    public static boolean fJ() {
        return d.getBoolean(d.th, false) ^ 1;
    }

    public static boolean fK() {
        return qf || d.getBoolean(d.tq, false);
    }

    public static boolean fL() {
        return d.getBoolean(d.sl, false);
    }

    public static boolean fM() {
        return fN() ^ 1;
    }

    public static boolean fN() {
        if (!Build.IS_INTERNATIONAL_BUILD) {
            return false;
        }
        CharSequence charSequence = SystemProperties.get("ro.miui.region");
        if (TextUtils.isEmpty(charSequence)) {
            return TextUtils.equals(Locale.getDefault().getCountry(), "KR");
        }
        return TextUtils.equals(charSequence, "KR");
    }

    public static boolean fO() {
        return d.getBoolean(d.sm, false);
    }

    public static boolean fP() {
        return d.getBoolean(d.sq, false);
    }

    public static boolean fQ() {
        return !Build.IS_INTERNATIONAL_BUILD && d.getBoolean(d.sr, false);
    }

    public static boolean fR() {
        return d.getBoolean(d.ss, false);
    }

    public static boolean fS() {
        return d.getBoolean(d.tr, false);
    }

    public static boolean fT() {
        return d.getBoolean(d.st, false);
    }

    public static boolean fU() {
        return d.getBoolean(d.su, false);
    }

    public static boolean fV() {
        return d.getBoolean(d.tf, false);
    }

    public static boolean fW() {
        return d.getBoolean(d.sv, false);
    }

    public static boolean fX() {
        return !qZ && d.getBoolean(d.sw, false);
    }

    public static boolean fY() {
        return d.getBoolean(d.sx, false);
    }

    public static boolean fZ() {
        return pG.equals(d.getString(d.sf));
    }

    public static boolean ga() {
        return pJ.equals(d.getString(d.sf));
    }

    public static boolean gb() {
        return pI.equals(d.getString(d.sf));
    }

    public static boolean gd() {
        return pH.equals(d.getString(d.sf));
    }

    public static boolean ge() {
        return d.getBoolean(d.sg, false);
    }

    public static boolean gf() {
        return false;
    }

    public static boolean gg() {
        return d.getBoolean(d.sy, false);
    }

    public static boolean gh() {
        return d.getBoolean(d.sz, false);
    }

    public static boolean gi() {
        return d.getBoolean(d.sA, false);
    }

    public static boolean gj() {
        return d.getBoolean(d.sB, false);
    }

    public static boolean gk() {
        return d.getBoolean(d.sC, false);
    }

    public static boolean gl() {
        return d.getBoolean(d.sD, false);
    }

    public static boolean gm() {
        if ((d.getInteger(d.rf, 0) & 1) != 0) {
            return true;
        }
        return false;
    }

    public static boolean gn() {
        if ((d.getInteger(d.rf, 0) & 15) != 0) {
            return true;
        }
        return false;
    }

    public static boolean go() {
        if ((d.getInteger(d.rf, 0) & 2) != 0) {
            return true;
        }
        return false;
    }

    public static boolean gp() {
        return !gq() && IS_HONGMI;
    }

    public static boolean gq() {
        return d.getBoolean(d.sF, true);
    }

    public static boolean gr() {
        if ((d.getInteger(d.rf, 0) & 4) != 0) {
            return true;
        }
        return false;
    }

    public static boolean gs() {
        if (d.getBoolean(d.tt, false) && gt()) {
            return true;
        }
        return false;
    }

    public static boolean gt() {
        return false;
    }

    public static boolean gu() {
        return d.getBoolean(d.sJ, false);
    }

    public static boolean gv() {
        return d.getBoolean(d.sG, false);
    }

    public static boolean gw() {
        if (pV || qf || Build.IS_HONGMI_TWOX || pP || pW || pR || pS || pU || pN || IS_MI2A || pQ || !d.getBoolean(d.tu, true)) {
            return false;
        }
        return true;
    }

    public static boolean gx() {
        return false;
    }

    public static boolean gy() {
        return d.getBoolean(d.sL, false);
    }

    public static boolean gz() {
        return fZ() && 21 <= VERSION.SDK_INT;
    }

    public static boolean gA() {
        return d.getBoolean(d.sM, false);
    }

    public static boolean gB() {
        return d.getBoolean(d.sN, false);
    }

    public static boolean gC() {
        return (IS_XIAOMI || IS_HONGMI) ? false : true;
    }

    public static boolean gD() {
        return d.getBoolean(d.tv, false);
    }

    public static boolean gE() {
        return d.getBoolean(d.sO, false);
    }

    public static boolean gF() {
        return d.getBoolean(d.sP, false);
    }

    public static boolean gG() {
        if (pV || qf || Build.IS_HONGMI_TWOX || pP || pW || pR || pS || pU || pN || IS_MI2A || pQ || qg || !d.getBoolean(d.tw, true)) {
            return false;
        }
        return true;
    }

    public static boolean gH() {
        return d.getBoolean(d.tx, false);
    }

    public static boolean gI() {
        return pN && !IS_MI2A;
    }

    public static boolean gJ() {
        return d.getBoolean(d.sQ, false);
    }

    public static int gK() {
        return d.getInteger(d.tJ, AutoLockManager.HIBERNATION_TIMEOUT);
    }

    public static boolean gL() {
        return d.getBoolean(d.sR, false);
    }

    public static boolean gM() {
        return d.getBoolean(d.sS, false);
    }

    public static boolean gN() {
        return false;
    }

    public static boolean gO() {
        return d.getBoolean(d.sW, false);
    }

    public static boolean gP() {
        return d.getBoolean(d.sh, false);
    }

    public static boolean gQ() {
        return d.getBoolean(d.sZ, false);
    }

    public static boolean gR() {
        return !Build.IS_INTERNATIONAL_BUILD && d.getBoolean(d.tb, false);
    }

    public static boolean isPad() {
        return d.getBoolean(d.se, false);
    }

    public static String gS() {
        return d.getString(d.si);
    }

    public static String gT() {
        return d.getString(d.sj);
    }

    public static boolean gU() {
        return d.getBoolean(d.ty, false);
    }

    public static boolean gV() {
        if (Build.IS_INTERNATIONAL_BUILD || !d.getBoolean(d.ta, false)) {
            return false;
        }
        return true;
    }

    public static boolean gW() {
        return (qb && Build.IS_INTERNATIONAL_BUILD) || qv;
    }

    public static boolean gX() {
        return true;
    }

    public static boolean gY() {
        return d.getBoolean(d.tg, false);
    }

    public static boolean gZ() {
        if (pP || qg || Build.IS_HONGMI_TWOX || pV || !d.getBoolean(d.tz, true)) {
            return false;
        }
        return true;
    }

    public static boolean ha() {
        return d.getBoolean(d.tl, false) ^ 1;
    }

    public static boolean hb() {
        if (d.getBoolean(d.tA, false) || gd()) {
            return false;
        }
        return true;
    }

    public static boolean hc() {
        return d.getBoolean(d.tm, true);
    }

    public static boolean hd() {
        return d.getBoolean(d.tB, false);
    }

    public static boolean isSupportedOpticalZoom() {
        return d.getBoolean(d.tC, false);
    }

    public static boolean isSupportedPortrait() {
        return d.getBoolean(d.tD, false);
    }

    public static boolean he() {
        return d.getBoolean(d.tE, false);
    }

    public static boolean hf() {
        return false;
    }

    public static ArrayList<String> hg() {
        if (re == null) {
            re = new ArrayList();
            String[] stringArray = d.getStringArray(d.sk);
            if (stringArray != null) {
                Collections.addAll(re, stringArray);
            }
        }
        return re;
    }

    public static boolean hh() {
        return d.getBoolean(d.te, false);
    }

    public static boolean hi() {
        return d.getBoolean(d.sn, false);
    }

    public static boolean hj() {
        return d.getBoolean(d.td, false);
    }

    public static boolean hk() {
        return d.getBoolean(d.tk, true);
    }

    public static boolean hl() {
        return d.getBoolean(d.tF, false);
    }

    public static boolean hm() {
        if (!qO) {
            return d.getBoolean(d.tn, false);
        }
        return "India".equals(SystemProperties.get("ro.boot.hwc"));
    }

    public static boolean hn() {
        return qr || qL || qT;
    }

    public static boolean ho() {
        return d.getBoolean(d.tN, true);
    }

    public static boolean hp() {
        return d.getBoolean(d.tG, true);
    }

    public static boolean hq() {
        return d.getBoolean(d.ti, false);
    }

    public static boolean hr() {
        return d.getBoolean(d.tH, true);
    }

    public static boolean hs() {
        return hq() && d.getBoolean(d.tj, true);
    }

    private static boolean ht() {
        return SystemProperties.getBoolean("ro.hardware.fp.fod", false);
    }

    private static boolean hu() {
        if (d.getBoolean(d.to, false) || ht()) {
            return true;
        }
        return false;
    }

    public static boolean hv() {
        if (hu() || hg() == null || hg().isEmpty()) {
            return false;
        }
        return true;
    }

    public static boolean hw() {
        return d.getBoolean(d.tL, false);
    }

    public static boolean hx() {
        return d.getBoolean(d.tU, false);
    }

    public static boolean hy() {
        return d.getBoolean(d.tO, false);
    }

    public static boolean hz() {
        return d.getBoolean(d.tP, false);
    }

    public static boolean hA() {
        return d.getBoolean(d.tQ, false);
    }

    public static boolean hB() {
        return d.getBoolean(d.tR, false);
    }

    public static boolean hC() {
        return hA() || hB();
    }

    public static boolean hD() {
        return d.getBoolean(d.tI, false);
    }

    public static boolean hE() {
        return d.getBoolean(d.tT, false);
    }

    public static boolean isSupportSuperResolution() {
        return d.getBoolean(d.tV, false);
    }

    public static boolean hF() {
        return d.getBoolean(d.tW, true);
    }

    public static boolean hG() {
        return d.getBoolean(d.tX, false);
    }

    public static boolean hH() {
        return qV || qT;
    }

    public static boolean hI() {
        return d.getBoolean(d.tY, false);
    }

    public static boolean fw() {
        return DataRepository.dataItemFeature().fw();
    }
}
