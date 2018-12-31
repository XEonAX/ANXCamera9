package com.android.camera;

import com.android.camera.effect.EffectController;
import com.android.camera.effect.EffectController.EffectChangedListener;
import java.util.HashMap;
import java.util.Map;

public class EffectChangedListenerController {
    private static Map<Integer, EffectChangedListener> mEffectChangedListenerMap = new HashMap();
    private static int mHoldKey;

    public static void setHoldKey(int i) {
        mHoldKey = i;
    }

    public static void addEffectChangedListener(EffectChangedListener effectChangedListener) {
        mEffectChangedListenerMap.put(Integer.valueOf(mHoldKey), effectChangedListener);
    }

    public static void removeEffectChangedListenerMap(int i) {
        EffectController.getInstance().removeChangeListener((EffectChangedListener) mEffectChangedListenerMap.remove(Integer.valueOf(i)));
        EffectController.releaseInstance();
    }
}
