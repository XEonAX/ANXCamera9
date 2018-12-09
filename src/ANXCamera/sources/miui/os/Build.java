package miui.os;

import android.content.Context;
import android.os.Build.VERSION;
import android.os.IPowerManager;
import android.os.IPowerManager.Stub;
import android.os.RemoteException;
import android.os.ServiceManager;
import android.text.TextUtils;
import com.miui.internal.cust.PrivateConfig;
import com.miui.internal.cust.PrivateWaterMarkerConfig;
import miui.util.FeatureParser;

public class Build extends android.os.Build {
    public static final boolean HAS_CUST_PARTITION = SystemProperties.getBoolean("ro.miui.has_cust_partition", false);
    public static final boolean IS_ALPHA_BUILD = SystemProperties.get("ro.product.mod_device", "").endsWith("_alpha");
    public static final boolean IS_CDMA;
    public static final boolean IS_CM_COOPERATION;
    public static final boolean IS_CM_CUSTOMIZATION;
    public static final boolean IS_CM_CUSTOMIZATION_TEST = "cm".equals(SystemProperties.get("ro.cust.test"));
    public static final boolean IS_CTA_BUILD = "1".equals(SystemProperties.get("ro.miui.cta"));
    public static final boolean IS_CTS_BUILD = (SystemProperties.getBoolean("persist.sys.miui_optimization", "1".equals(SystemProperties.get("ro.miui.cts")) ^ true) ^ true);
    public static final boolean IS_CT_CUSTOMIZATION = "ct".equals(SystemProperties.get("ro.carrier.name"));
    public static final boolean IS_CT_CUSTOMIZATION_TEST = "ct".equals(SystemProperties.get("ro.cust.test"));
    public static final boolean IS_CU_CUSTOMIZATION = "cu".equals(SystemProperties.get("ro.carrier.name"));
    public static final boolean IS_CU_CUSTOMIZATION_TEST = "cu".equals(SystemProperties.get("ro.cust.test"));
    public static final boolean IS_DEBUGGABLE = (SystemProperties.getInt("ro.debuggable", 0) == 1);
    public static final boolean IS_DEVELOPMENT_VERSION;
    public static final boolean IS_FUNCTION_LIMITED = "1".equals(SystemProperties.get("persist.sys.func_limit_switch"));
    public static final boolean IS_GLOBAL_BUILD = SystemProperties.get("ro.product.mod_device", "").endsWith("_global");
    public static final boolean IS_HONGMI;
    public static final boolean IS_HONGMI2_TDSCDMA = "HM2013022".equals(DEVICE);
    public static final boolean IS_HONGMI_THREE;
    public static final boolean IS_HONGMI_THREEX = "gucci".equals(DEVICE);
    public static final boolean IS_HONGMI_THREEX_CM;
    public static final boolean IS_HONGMI_THREEX_CT;
    public static final boolean IS_HONGMI_THREEX_CU;
    public static final boolean IS_HONGMI_THREE_LTE = "dior".equals(DEVICE);
    public static final boolean IS_HONGMI_THREE_LTE_CM;
    public static final boolean IS_HONGMI_THREE_LTE_CU;
    public static final boolean IS_HONGMI_TWO;
    public static final boolean IS_HONGMI_TWOS_LTE_MTK = "HM2014501".equals(DEVICE);
    public static final boolean IS_HONGMI_TWOX;
    public static final boolean IS_HONGMI_TWOX_BR = "HM2014819".equals(DEVICE);
    public static final boolean IS_HONGMI_TWOX_CM;
    public static final boolean IS_HONGMI_TWOX_CT;
    public static final boolean IS_HONGMI_TWOX_CU = "HM2014811".equals(DEVICE);
    public static final boolean IS_HONGMI_TWOX_IN = "HM2014818".equals(DEVICE);
    public static final boolean IS_HONGMI_TWOX_LC = "lte26007".equals(DEVICE);
    public static final boolean IS_HONGMI_TWOX_SA = "HM2014817".equals(DEVICE);
    public static final boolean IS_HONGMI_TWO_A = "armani".equals(DEVICE);
    public static final boolean IS_HONGMI_TWO_S;
    public static final boolean IS_INTERNATIONAL_BUILD = SystemProperties.get("ro.product.mod_device", "").contains("_global");
    public static final boolean IS_MI1S;
    public static final boolean IS_MI2A;
    public static final boolean IS_MIFIVE = "virgo".equals(DEVICE);
    public static final boolean IS_MIFOUR;
    public static final boolean IS_MIFOUR_CDMA;
    public static final boolean IS_MIFOUR_LTE_CM;
    public static final boolean IS_MIFOUR_LTE_CT;
    public static final boolean IS_MIFOUR_LTE_CU;
    public static final boolean IS_MIFOUR_LTE_INDIA;
    public static final boolean IS_MIFOUR_LTE_SEASA;
    public static final boolean IS_MIONE;
    public static final boolean IS_MIONE_CDMA;
    public static final boolean IS_MIPAD = "mocha".equals(DEVICE);
    public static final boolean IS_MITHREE;
    public static final boolean IS_MITHREE_CDMA;
    public static final boolean IS_MITHREE_TDSCDMA;
    public static final boolean IS_MITWO;
    public static final boolean IS_MITWO_CDMA;
    public static final boolean IS_MITWO_TDSCDMA;
    public static final boolean IS_MIUI = (SystemProperties.get(PROP_MIUI_VERSION_CODE, "").isEmpty() ^ true);
    public static final boolean IS_N7 = "flo".equals(DEVICE);
    public static final boolean IS_OFFICIAL_VERSION;
    public static final boolean IS_PRIVATE_BUILD = PrivateConfig.IS_PRIVATE_BUILD;
    public static final boolean IS_PRIVATE_WATER_MARKER = PrivateWaterMarkerConfig.IS_PRIVATE_WATER_MARKER;
    public static final boolean IS_PRO_DEVICE = SystemProperties.get("ro.miui.cust_device", "").endsWith("_pro");
    public static final boolean IS_STABLE_VERSION;
    public static final boolean IS_TABLET = isTablet();
    public static final boolean IS_TDS_CDMA;
    public static final boolean IS_XIAOMI;
    private static final String PROP_MIUI_VERSION_CODE = "ro.miui.ui.version.code";
    private static final String REGULAR_EXPRESSION_FOR_DEVELOPMENT = "\\d+.\\d+.\\d+(-internal)?";
    private static final String REGULAR_EXPRESSION_FOR_STABLE = "([A-Z]{3}|[A-Z]{7})\\d+.\\d+";
    public static final String USERDATA_IMAGE_VERSION_CODE = getUserdataImageVersionCode();
    public static final String USER_MODE = "persist.sys.user_mode";
    public static final int USER_MODE_ELDER = 1;
    public static final int USER_MODE_NORMAL = 0;

    protected Build() throws InstantiationException {
        throw new InstantiationException("Cannot instantiate utility class");
    }

    static {
        boolean z = "mione".equals(DEVICE) || "mione_plus".equals(DEVICE);
        IS_MIONE = z;
        z = "MI 1S".equals(MODEL) || "MI 1SC".equals(MODEL);
        IS_MI1S = z;
        z = "aries".equals(DEVICE) || "taurus".equals(DEVICE) || "taurus_td".equals(DEVICE);
        IS_MITWO = z;
        z = "MI 2A".equals(MODEL) || "MI 2A TD".equals(MODEL);
        IS_MI2A = z;
        z = "pisces".equals(DEVICE) || ("cancro".equals(DEVICE) && MODEL.startsWith("MI 3"));
        IS_MITHREE = z;
        z = "cancro".equals(DEVICE) && MODEL.startsWith("MI 4");
        IS_MIFOUR = z;
        z = IS_MIONE || IS_MITWO || IS_MITHREE || IS_MIFOUR || IS_MIFIVE;
        IS_XIAOMI = z;
        z = "HM2014011".equals(DEVICE) || "HM2014012".equals(DEVICE);
        IS_HONGMI_TWO_S = z;
        z = "HM2013022".equals(DEVICE) || "HM2013023".equals(DEVICE) || IS_HONGMI_TWO_A || IS_HONGMI_TWO_S;
        IS_HONGMI_TWO = z;
        z = "lcsh92_wet_jb9".equals(DEVICE) || "lcsh92_wet_tdd".equals(DEVICE);
        IS_HONGMI_THREE = z;
        z = IS_HONGMI_THREE_LTE && "LTETD".equals(SystemProperties.get("ro.boot.modem"));
        IS_HONGMI_THREE_LTE_CM = z;
        z = IS_HONGMI_THREE_LTE && "LTEW".equals(SystemProperties.get("ro.boot.modem"));
        IS_HONGMI_THREE_LTE_CU = z;
        z = "HM2014812".equals(DEVICE) || "HM2014821".equals(DEVICE);
        IS_HONGMI_TWOX_CT = z;
        z = "HM2014813".equals(DEVICE) || "HM2014112".equals(DEVICE);
        IS_HONGMI_TWOX_CM = z;
        z = IS_HONGMI_TWOX_CU || IS_HONGMI_TWOX_CT || IS_HONGMI_TWOX_CM || IS_HONGMI_TWOX_IN || IS_HONGMI_TWOX_SA || IS_HONGMI_TWOX_BR;
        IS_HONGMI_TWOX = z;
        z = IS_HONGMI_THREEX && "cm".equals(SystemProperties.get("persist.sys.modem"));
        IS_HONGMI_THREEX_CM = z;
        z = IS_HONGMI_THREEX && "cu".equals(SystemProperties.get("persist.sys.modem"));
        IS_HONGMI_THREEX_CU = z;
        z = IS_HONGMI_THREEX && "ct".equals(SystemProperties.get("persist.sys.modem"));
        IS_HONGMI_THREEX_CT = z;
        z = IS_HONGMI_TWO || IS_HONGMI_THREE || IS_HONGMI_TWOX || IS_HONGMI_THREE_LTE || IS_HONGMI_TWOX_LC || IS_HONGMI_TWOS_LTE_MTK || IS_HONGMI_THREEX;
        IS_HONGMI = z;
        z = IS_MIONE && hasMsm8660Property();
        IS_MIONE_CDMA = z;
        z = IS_MITWO && "CDMA".equals(SystemProperties.get("persist.radio.modem"));
        IS_MITWO_CDMA = z;
        z = IS_MITHREE && "MI 3C".equals(MODEL);
        IS_MITHREE_CDMA = z;
        z = IS_MIFOUR && "CDMA".equals(SystemProperties.get("persist.radio.modem"));
        IS_MIFOUR_CDMA = z;
        z = IS_MITWO && "TD".equals(SystemProperties.get("persist.radio.modem"));
        IS_MITWO_TDSCDMA = z;
        z = IS_MITHREE && "TD".equals(SystemProperties.get("persist.radio.modem"));
        IS_MITHREE_TDSCDMA = z;
        z = IS_MIFOUR && "LTE-CMCC".equals(SystemProperties.get("persist.radio.modem"));
        IS_MIFOUR_LTE_CM = z;
        z = IS_MIFOUR && "LTE-CU".equals(SystemProperties.get("persist.radio.modem"));
        IS_MIFOUR_LTE_CU = z;
        z = IS_MIFOUR && "LTE-CT".equals(SystemProperties.get("persist.radio.modem"));
        IS_MIFOUR_LTE_CT = z;
        z = IS_MIFOUR && "LTE-India".equals(SystemProperties.get("persist.radio.modem"));
        IS_MIFOUR_LTE_INDIA = z;
        z = IS_MIFOUR && "LTE-SEAsa".equals(SystemProperties.get("persist.radio.modem"));
        IS_MIFOUR_LTE_SEASA = z;
        z = IS_MIONE_CDMA || IS_MITWO_CDMA || IS_MITHREE_CDMA || IS_MIFOUR_CDMA || IS_MIFOUR_LTE_CT;
        IS_CDMA = z;
        z = IS_MITHREE_TDSCDMA || IS_HONGMI2_TDSCDMA || IS_MITWO_TDSCDMA;
        IS_TDS_CDMA = z;
        z = "cm".equals(SystemProperties.get("ro.carrier.name")) && ("cn_chinamobile".equals(SystemProperties.get("ro.miui.cust_variant")) || "cn_cta".equals(SystemProperties.get("ro.miui.cust_variant")));
        IS_CM_CUSTOMIZATION = z;
        z = "cm".equals(SystemProperties.get("ro.carrier.name")) && "cn_cmcooperation".equals(SystemProperties.get("ro.miui.cust_variant"));
        IS_CM_COOPERATION = z;
        z = !TextUtils.isEmpty(VERSION.INCREMENTAL) && VERSION.INCREMENTAL.matches(REGULAR_EXPRESSION_FOR_DEVELOPMENT);
        IS_DEVELOPMENT_VERSION = z;
        z = "user".equals(TYPE) && !IS_DEVELOPMENT_VERSION;
        IS_STABLE_VERSION = z;
        z = IS_DEVELOPMENT_VERSION || IS_STABLE_VERSION;
        IS_OFFICIAL_VERSION = z;
    }

    public static String getRegion() {
        return SystemProperties.get("ro.miui.region", "CN");
    }

    public static boolean checkRegion(String region) {
        return getRegion().equalsIgnoreCase(region);
    }

    private static boolean hasMsm8660Property() {
        String soc = SystemProperties.get("ro.soc.name");
        return "msm8660".equals(soc) || "unkown".equals(soc);
    }

    private static boolean isTablet() {
        return SystemProperties.get("ro.build.characteristics").contains("tablet");
    }

    public static boolean hasCameraFlash(Context context) {
        return FeatureParser.getBoolean("support_torch", true);
    }

    public static int getUserMode() {
        return SystemProperties.getInt(USER_MODE, 0);
    }

    public static void setUserMode(Context context, int mode) {
        SystemProperties.set(USER_MODE, Integer.toString(mode));
        reboot(false, null, false);
    }

    private static void reboot(boolean confim, String reason, boolean wait) {
        try {
            IPowerManager powermanager = Stub.asInterface(ServiceManager.getService("power"));
            if (powermanager != null) {
                powermanager.reboot(confim, reason, wait);
            }
        } catch (RemoteException e) {
        }
    }

    public static String getCustVariant() {
        if (IS_INTERNATIONAL_BUILD) {
            return SystemProperties.get("ro.miui.cust_variant", "hk");
        }
        return SystemProperties.get("ro.miui.cust_variant", "cn");
    }

    private static String getUserdataImageVersionCode() {
        if ("".equals(SystemProperties.get("ro.miui.userdata_version", ""))) {
            return "Unavailable";
        }
        String region;
        if (IS_INTERNATIONAL_BUILD) {
            region = "global";
        } else {
            region = "cn";
        }
        String carrier = SystemProperties.get("ro.carrier.name", "");
        if (!"".equals(carrier)) {
            StringBuilder stringBuilder = new StringBuilder();
            stringBuilder.append("_");
            stringBuilder.append(carrier);
            carrier = stringBuilder.toString();
        }
        return String.format("%s(%s%s)", new Object[]{versionCodeProperty, region, carrier});
    }
}
