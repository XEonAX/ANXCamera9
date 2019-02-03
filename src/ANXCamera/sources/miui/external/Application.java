package miui.external;

import android.content.Context;
import android.content.res.Configuration;
import android.util.Log;
import java.lang.reflect.InvocationTargetException;
import java.util.HashMap;
import java.util.Map;
import miui.external.SdkConstants.SdkError;

public class Application extends android.app.Application implements SdkConstants {
    private static final String PACKAGE_NAME = "com.miui.core";
    private ApplicationDelegate mApplicationDelegate;
    private boolean mInitialized;
    private boolean mStarted;

    public Application() {
        if (loadSdk() && initializeSdk()) {
            this.mInitialized = true;
        }
    }

    private boolean loadSdk() {
        try {
            if (SdkHelper.isMiuiSystem() || SdkLoader.load(SdkHelper.getApkPath(null, PACKAGE_NAME, "miui"), null, SdkHelper.getLibPath(null, PACKAGE_NAME), Application.class.getClassLoader())) {
                return true;
            }
            SdkErrorInstrumentation.handleSdkError(SdkError.NO_SDK);
            return false;
        } catch (Throwable th) {
            handleGenericError(th);
            return false;
        }
    }

    private boolean initializeSdk() {
        try {
            HashMap hashMap = new HashMap();
            int intValue = ((Integer) SdkEntranceHelper.getSdkEntrance().getMethod("initialize", new Class[]{android.app.Application.class, Map.class}).invoke(null, new Object[]{this, hashMap})).intValue();
            if (intValue == 0) {
                return true;
            }
            handleUnknownError("initialize", intValue);
            return false;
        } catch (Throwable th) {
            handleGenericError(th);
            return false;
        }
    }

    private boolean startSdk() {
        try {
            HashMap hashMap = new HashMap();
            int intValue = ((Integer) SdkEntranceHelper.getSdkEntrance().getMethod("start", new Class[]{Map.class}).invoke(null, new Object[]{hashMap})).intValue();
            if (intValue == 1) {
                SdkErrorInstrumentation.handleSdkError(SdkError.LOW_SDK_VERSION);
                return false;
            } else if (intValue == 0) {
                return true;
            } else {
                handleUnknownError("start", intValue);
                return false;
            }
        } catch (Throwable th) {
            handleGenericError(th);
            return false;
        }
    }

    private void handleGenericError(Throwable th) {
        while (th != null && th.getCause() != null) {
            if (!(th instanceof InvocationTargetException)) {
                if (!(th instanceof ExceptionInInitializerError)) {
                    break;
                }
                th = th.getCause();
            } else {
                th = th.getCause();
            }
        }
        Log.e(SdkConstants.LOG_TAG, "MIUI SDK encounter errors, please contact miuisdk@xiaomi.com for support.", th);
        SdkErrorInstrumentation.handleSdkError(SdkError.GENERIC);
    }

    private void handleUnknownError(String str, int i) {
        String str2 = SdkConstants.LOG_TAG;
        StringBuilder stringBuilder = new StringBuilder();
        stringBuilder.append("MIUI SDK encounter errors, please contact miuisdk@xiaomi.com for support. phase: ");
        stringBuilder.append(str);
        stringBuilder.append(" code: ");
        stringBuilder.append(i);
        Log.e(str2, stringBuilder.toString());
        SdkErrorInstrumentation.handleSdkError(SdkError.GENERIC);
    }

    public ApplicationDelegate onCreateApplicationDelegate() {
        return null;
    }

    public final ApplicationDelegate getApplicationDelegate() {
        return this.mApplicationDelegate;
    }

    protected void attachBaseContext(Context context) {
        super.attachBaseContext(context);
        if (this.mInitialized && startSdk()) {
            this.mApplicationDelegate = onCreateApplicationDelegate();
            if (this.mApplicationDelegate != null) {
                this.mApplicationDelegate.attach(this);
            }
            this.mStarted = true;
        }
    }

    public final void onCreate() {
        if (this.mStarted) {
            if (this.mApplicationDelegate != null) {
                this.mApplicationDelegate.onCreate();
            } else {
                superOnCreate();
            }
        }
    }

    final void superOnCreate() {
        super.onCreate();
    }

    public final void onTerminate() {
        if (this.mApplicationDelegate != null) {
            this.mApplicationDelegate.onTerminate();
        } else {
            superOnTerminate();
        }
    }

    final void superOnTerminate() {
        super.onTerminate();
    }

    public final void onLowMemory() {
        if (this.mApplicationDelegate != null) {
            this.mApplicationDelegate.onLowMemory();
        } else {
            superOnLowMemory();
        }
    }

    final void superOnLowMemory() {
        super.onLowMemory();
    }

    public final void onTrimMemory(int i) {
        if (this.mApplicationDelegate != null) {
            this.mApplicationDelegate.onTrimMemory(i);
        } else {
            superOnTrimMemory(i);
        }
    }

    final void superOnTrimMemory(int i) {
        super.onTrimMemory(i);
    }

    public final void onConfigurationChanged(Configuration configuration) {
        if (this.mApplicationDelegate != null) {
            this.mApplicationDelegate.onConfigurationChanged(configuration);
        } else {
            superOnConfigurationChanged(configuration);
        }
    }

    final void superOnConfigurationChanged(Configuration configuration) {
        super.onConfigurationChanged(configuration);
    }
}
