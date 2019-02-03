package miui.os;

import android.content.res.Resources;
import android.os.Build.VERSION;
import android.os.SystemProperties;
import miui.util.FeatureParser;

public class DeviceFeature {
    public static final int BACKLIGHT_BIT = FeatureParser.getInteger("BACKLIGHT_BIT", 0);
    public static final boolean PERSIST_SCREEN_EFFECT = SystemProperties.getBoolean("sys.persist_screen_effect", false);
    public static final boolean SCREEN_EFFECT_CONFLICT;
    public static final boolean SUPPORT_AUTO_BRIGHTNESS_OPTIMIZE;
    public static final boolean SUPPORT_DISPLAYFEATURE_CALLBACK = FeatureParser.getBoolean("SUPPORT_DISPLAYFEATURE_CALLBACK", true);
    public static final boolean SUPPORT_DISPLAYFEATURE_HIDL = SystemProperties.getBoolean("sys.displayfeature_hidl", false);
    public static final boolean SUPPORT_NIGHT_LIGHT = FeatureParser.getBoolean("SUPPORT_NIGHT_LIGHT", true);
    public static final boolean SUPPORT_NIGHT_LIGHT_ADJ = FeatureParser.getBoolean("SUPPORT_NIGHT_LIGHT_ADJ", true);
    public static final boolean SUPPORT_PAPERMODE_ANIMATION = FeatureParser.getBoolean("support_papermode_animation", false);
    public static final Resources SYSTEM_RESOURCES = Resources.getSystem();

    static {
        boolean z = false;
        boolean z2 = (FeatureParser.getBoolean("support_autobrightness_optimize", false) && VERSION.SDK_INT > 23) || SystemProperties.getBoolean("sys.autobrightness_optimize", false);
        SUPPORT_AUTO_BRIGHTNESS_OPTIMIZE = z2;
        if (SystemProperties.getInt("ro.df.effect.conflict", 0) == 0 || SystemProperties.getInt("ro.vendor.df.effect.conflict", 0) == 0) {
            z = false;
        }
        SCREEN_EFFECT_CONFLICT = z;
    }

    public static final boolean hasMirihiSupport() {
        return "perseus".equals(Build.DEVICE) || "andromeda".equals(Build.DEVICE);
    }
}
