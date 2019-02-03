package com.ss.android.vesdk.runtime.hardware;

import android.text.TextUtils;
import com.ss.android.ttve.utils.ReflectUtil;
import java.util.ArrayList;
import java.util.Collections;
import java.util.List;

public class MTKKit {
    private static List<String> sNoZsdPlatforms = new ArrayList();
    private static String sPlatform = ((String) ReflectUtil.invokeStatic("android.os.SystemProperties", "get", new String[]{"ro.mediatek.platform"}));
    private static boolean sZsdModeSupport;

    static {
        Collections.addAll(sNoZsdPlatforms, new String[]{"MT6571", "MT6595", "MT6795", "MT6572", "MT6752", "MT6582", "MT6735", "MT6592", "MT6753", "MT6589", "MT6755", "MT6735m", "MT6737T", "MT6580", "MT6750", "MT6750S", "MT6737", "MT6739", "MT6570", "MT6761"});
    }

    public static boolean isMTKPlatform() {
        return TextUtils.isEmpty(sPlatform) ^ 1;
    }

    public static boolean isSupportZsdMode() {
        if (!sZsdModeSupport) {
            sZsdModeSupport = Collections.unmodifiableList(sNoZsdPlatforms).indexOf(sPlatform) < 0;
        }
        return sZsdModeSupport;
    }
}
