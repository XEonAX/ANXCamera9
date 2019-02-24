package com.android.camera.fragment.lifeCircle;

import java.util.List;

public interface BaseLifecycleListener {
    void onLifeAlive();

    void onLifeDestroy(String str);

    void onLifeStart(String str);

    void onLifeStop(String str);

    @Deprecated
    void setBlockingLifeCycles(List<String> list);
}
