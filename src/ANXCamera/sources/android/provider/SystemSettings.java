package android.provider;

import android.content.ContentResolver;
import android.content.Context;
import android.database.Cursor;
import android.database.MatrixCursor;
import android.util.Log;
import com.mi.config.d;
import com.miui.system.internal.R;
import java.io.UnsupportedEncodingException;
import java.util.Iterator;
import miui.os.Build;
import miui.os.SystemProperties;
import miui.text.ChinesePinyinConverter;
import miui.text.ChinesePinyinConverter.Token;
import miui.util.FeatureParser;

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
            if (FeatureParser.getBoolean(d.rZ, false)) {
                deviceNameRes = R.string.device_hongmi;
            } else if (FeatureParser.getBoolean(d.rY, false)) {
                if (!E10_DEVICE.equals(SystemProperties.get("ro.product.device"))) {
                    deviceNameRes = R.string.device_xiaomi;
                } else if (SystemProperties.get("ro.boot.hwc", "").contains(INDIA)) {
                    deviceNameRes = R.string.device_poco_india;
                } else {
                    deviceNameRes = R.string.device_poco_global;
                }
            } else if (FeatureParser.getBoolean(d.sb, false)) {
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
                String hostName = getNameInMaxLength(newNetHostName);
                if (hostName != null) {
                    SystemProperties.set("net.hostname", hostName);
                }
            }
        }

        public static boolean getBoolean(ContentResolver resolver, String name, boolean defValue) {
            return android.provider.Settings.System.getInt(resolver, name, defValue) != 0;
        }

        private static String getNameInMaxLength(String newHostName) {
            int MAX_HOSTNAME_LENGTH = 20;
            StringBuilder stringBuilder;
            try {
                byte[] bytes = newHostName.getBytes("UTF-8");
                if (isValidUtf8Str(bytes)) {
                    int length = bytes.length;
                    while (length > 20) {
                        int curIndex = length - 1;
                        int count = getByteCount(bytes[curIndex]);
                        if (count == 0) {
                            length--;
                        } else {
                            int count2 = count;
                            count = 1;
                            while (count2 == 1) {
                                count2 = getByteCount(bytes[curIndex - count]);
                                count++;
                            }
                            length -= count;
                        }
                    }
                    if (length >= bytes.length) {
                        return newHostName;
                    }
                    byte[] newBytes = new byte[length];
                    System.arraycopy(bytes, 0, newBytes, 0, length);
                    return new String(newBytes, "UTF-8");
                }
                String str = SystemSettings.TAG;
                stringBuilder = new StringBuilder();
                stringBuilder.append("invalid string, encoding error, ");
                stringBuilder.append(newHostName);
                Log.w(str, stringBuilder.toString());
                return null;
            } catch (UnsupportedEncodingException e) {
                String str2 = SystemSettings.TAG;
                stringBuilder = new StringBuilder();
                stringBuilder.append("failed to get bytes of UTF-8 from ");
                stringBuilder.append(newHostName);
                stringBuilder.append(", ");
                stringBuilder.append(e);
                Log.w(str2, stringBuilder.toString());
                return null;
            }
        }

        private static boolean isValidUtf8Str(byte[] bytes) {
            int count = 0;
            boolean z = false;
            int byteCount = 0;
            for (int prefixCount : bytes) {
                int prefixCount2 = getByteCount(prefixCount2);
                if (prefixCount2 > 1) {
                    if (byteCount != 0 && count != byteCount) {
                        return false;
                    }
                    byteCount = prefixCount2;
                    count = 1;
                } else if (prefixCount2 == 1) {
                    if (byteCount == 0 || count == byteCount) {
                        return false;
                    }
                    count++;
                } else if (count < byteCount) {
                    return false;
                }
            }
            if (count == byteCount) {
                z = true;
            }
            return z;
        }

        private static int getByteCount(byte b) {
            int count = 0;
            int i = 7;
            while (i >= 4 && (((byte) (b >> i)) & 1) != 0) {
                count++;
                i--;
            }
            return count;
        }
    }
}
