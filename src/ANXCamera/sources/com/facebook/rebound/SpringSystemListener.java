package com.facebook.rebound;

public interface SpringSystemListener {
    void onAfterIntegrate(BaseSpringSystem baseSpringSystem);

    void onBeforeIntegrate(BaseSpringSystem baseSpringSystem);
}
