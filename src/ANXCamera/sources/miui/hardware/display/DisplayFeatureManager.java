package miui.hardware.display;

import android.content.res.Resources;
import android.os.HwBinder;
import android.os.IBinder;
import android.os.IBinder.DeathRecipient;
import android.os.IHwBinder;
import android.os.RemoteException;
import android.os.ServiceManager;
import android.os.SystemProperties;
import android.os.statistics.E2EScenario;
import android.util.Slog;
import miui.os.DeviceFeature;
import miui.util.FeatureParser;

public class DisplayFeatureManager {
    private static final int CONFIG_SERVICENAME_RESOURCEID = Resources.getSystem().getIdentifier("config_displayFeatureHidlServiceName", "string", "android");
    public static final int DEFALUT_GAMUT_MODE = 0;
    public static final int DEFALUT_SCREEN_COLOR = 2;
    private static final String DISPLAY_FEATURE_SERVICE = "DisplayFeatureControl";
    public static final int EXT_COLOR_PROC_STATE = 15;
    private static final String HIDL_SERVICENAME_DEFAULT = "vendor.xiaomi.hardware.displayfeature@1.0::IDisplayFeature";
    public static final String PROPERTY_ASSERTIVE_DISPLAY = "persist.sys.ltm_enable";
    public static final String PROPERTY_GAMUT_MODE = "persist.sys.gamut_mode";
    public static final String PROPERTY_SCREEN_COLOR = "persist.sys.display_prefer";
    public static final String PROPERTY_SCREEN_SATURATION = "persist.sys.display_ce";
    public static final int SCREEN_ADAPT = 0;
    public static final int SCREEN_ENHANCE = 1;
    public static final int SCREEN_EYECARE = 3;
    public static final int SCREEN_HIGHLIGHT = 11;
    public static final int SCREEN_MONOCHROME = 4;
    public static final int SCREEN_NIGHTLIGHT = 9;
    public static final int SCREEN_STANDARD = 2;
    public static final int SCREEN_SUNLIGHT = 8;
    private static final boolean SUPPORT_SET_FEATURE = (FeatureParser.getBoolean("support_screen_effect", false) ^ 1);
    private static String TAG = "DisplayFeatureManager";
    private static volatile DisplayFeatureManager sInstance;
    private DeathRecipient mBinderDeathHandler;
    private IHwBinder.DeathRecipient mHwBinderDeathHandler;
    private Object mLock = new Object();
    private DisplayFeatureServiceProxy mProxy;

    public static DisplayFeatureManager getInstance() {
        if (sInstance == null) {
            synchronized (DisplayFeatureManager.class) {
                if (sInstance == null) {
                    sInstance = new DisplayFeatureManager();
                }
            }
        }
        return sInstance;
    }

    private DisplayFeatureManager() {
        initServiceDeathRecipient();
        synchronized (this.mLock) {
            initProxyLocked();
        }
    }

    public void setScreenEffect(int mode, int value) {
        synchronized (this.mLock) {
            String str = TAG;
            StringBuilder stringBuilder = new StringBuilder();
            stringBuilder.append("setScreenEffect mode=");
            stringBuilder.append(mode);
            stringBuilder.append(" value=");
            stringBuilder.append(value);
            Slog.d(str, stringBuilder.toString());
            if (this.mProxy == null) {
                initProxyLocked();
            }
            if (this.mProxy != null) {
                this.mProxy.setFeature(0, mode, value, 255);
            }
        }
    }

    private void initProxyLocked() {
        try {
            if (DeviceFeature.SUPPORT_DISPLAYFEATURE_HIDL) {
                String hidlServiceName = CONFIG_SERVICENAME_RESOURCEID == 0 ? HIDL_SERVICENAME_DEFAULT : Resources.getSystem().getString(CONFIG_SERVICENAME_RESOURCEID);
                String str = TAG;
                StringBuilder stringBuilder = new StringBuilder();
                stringBuilder.append("initProxyLoced CONFIG_SERVICENAME_RESOURCEID = ");
                stringBuilder.append(CONFIG_SERVICENAME_RESOURCEID);
                stringBuilder.append(" hidlServiceName = ");
                stringBuilder.append(hidlServiceName);
                Slog.d(str, stringBuilder.toString());
                IHwBinder hb = HwBinder.getService(hidlServiceName, E2EScenario.DEFAULT_CATEGORY);
                if (hb != null) {
                    hb.linkToDeath(this.mHwBinderDeathHandler, 10001);
                    this.mProxy = new DisplayFeatureServiceProxy(hb);
                    return;
                }
                return;
            }
            IBinder b = ServiceManager.getService(DISPLAY_FEATURE_SERVICE);
            if (b != null) {
                b.linkToDeath(this.mBinderDeathHandler, 0);
                this.mProxy = new DisplayFeatureServiceProxy(b);
            }
        } catch (RemoteException e) {
        }
    }

    private void initServiceDeathRecipient() {
        if (DeviceFeature.SUPPORT_DISPLAYFEATURE_HIDL) {
            this.mHwBinderDeathHandler = new IHwBinder.DeathRecipient() {
                public void serviceDied(long cookie) {
                    synchronized (DisplayFeatureManager.this.mLock) {
                        Slog.v(DisplayFeatureManager.TAG, "hwbinder service binderDied!");
                        DisplayFeatureManager.this.mProxy = null;
                    }
                }
            };
        } else {
            this.mBinderDeathHandler = new DeathRecipient() {
                public void binderDied() {
                    synchronized (DisplayFeatureManager.this.mLock) {
                        Slog.v(DisplayFeatureManager.TAG, "binder service binderDied!");
                        DisplayFeatureManager.this.mProxy = null;
                    }
                }
            };
        }
    }

    public int getColorPrefer() {
        return SystemProperties.getInt(PROPERTY_SCREEN_COLOR, 2);
    }

    public boolean isAdEnable() {
        return SystemProperties.getBoolean(PROPERTY_ASSERTIVE_DISPLAY, true);
    }

    public int getScreenGamut() {
        return SystemProperties.getInt(PROPERTY_GAMUT_MODE, 0);
    }
}
