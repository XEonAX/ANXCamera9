package android.provider;

import android.content.ContentResolver;
import android.content.Context;
import android.database.Cursor;
import android.database.MatrixCursor;
import com.mi.config.d;
import com.miui.system.internal.R;
import java.util.Iterator;
import miui.os.Build;
import miui.os.SystemProperties;
import miui.text.ChinesePinyinConverter;
import miui.text.ChinesePinyinConverter.Token;
import miui.util.FeatureParser;
import miui.util.Utf8TextUtils;

public class SystemSettings {
    private static final String TAG = "SystemSettings";
    private static final String UTF8 = "UTF-8";

    public static class Secure {
        public static final String PRIVACY_MODE_ENABLED = "privacy_mode_enabled";
        public static final String SCREEN_BUTTONS_STATE = "screen_buttons_state";

        public static boolean isCtaSupported(ContentResolver cr) {
            return Build.IS_CTA_BUILD;
        }

        public static Cursor checkPrivacyAndReturnCursor(Context context) {
            boolean z = true;
            if (1 != android.provider.Settings.Secure.getInt(context.getContentResolver(), PRIVACY_MODE_ENABLED, 0)) {
                z = false;
            }
            if (z) {
                return new MatrixCursor(new String[]{"_id"});
            }
            return null;
        }
    }

    public static class System {
        private static final String E10_DEVICE = "beryllium";
        private static final String INDIA = "INDIA";
        public static final String LOCK_WALLPAPER_PROVIDER_AUTHORITY = "lock_wallpaper_provider_authority";
        public static final String PERSIST_SYS_DEVICE_NAME = "persist.sys.device_name";
        public static final String STATUS_BAR_WINDOW_LOADED = "status_bar_window_loaded";

        public static String getDeviceName(Context context) {
            int deviceNameRes;
            String defaultName = "";
            if (FeatureParser.getBoolean(d.su, false)) {
                if (FeatureParser.getBoolean("is_redmi", false)) {
                    deviceNameRes = R.string.device_redmi;
                } else {
                    deviceNameRes = R.string.device_hongmi;
                }
            } else if (FeatureParser.getBoolean(d.st, false)) {
                if (!E10_DEVICE.equals(SystemProperties.get("ro.product.device"))) {
                    deviceNameRes = R.string.device_xiaomi;
                } else if (SystemProperties.get("ro.boot.hwc", "").contains(INDIA)) {
                    deviceNameRes = R.string.device_poco_india;
                } else {
                    deviceNameRes = R.string.device_poco_global;
                }
            } else if (FeatureParser.getBoolean(d.sv, false)) {
                deviceNameRes = R.string.device_pad;
            } else {
                deviceNameRes = R.string.miui_device_name;
            }
            return SystemProperties.get(PERSIST_SYS_DEVICE_NAME, context.getString(deviceNameRes));
        }

        public static void setDeviceName(Context context, String deviceName) {
            SystemProperties.set(PERSIST_SYS_DEVICE_NAME, deviceName);
            setNetHostName(context);
        }

        public static void setNetHostName(Context context) {
            String NET_HOSTNAME_PROPERTY = "net.hostname";
            String netHostName = SystemProperties.get("net.hostname");
            StringBuilder nameBuilder = new StringBuilder();
            nameBuilder.append(Build.MODEL);
            nameBuilder.append("-");
            Iterator it = ChinesePinyinConverter.getInstance().get(getDeviceName(context)).iterator();
            while (it.hasNext()) {
                nameBuilder.append(((Token) it.next()).target);
            }
            String newNetHostName = nameBuilder.toString().replace(" ", "");
            if (!newNetHostName.equals(netHostName)) {
                String hostName = Utf8TextUtils.truncateByte(newNetHostName, 20);
                if (hostName != null) {
                    SystemProperties.set("net.hostname", hostName);
                }
            }
        }

        public static boolean getBoolean(ContentResolver resolver, String name, boolean defValue) {
            return android.provider.Settings.System.getInt(resolver, name, defValue) != 0;
        }
    }
}
