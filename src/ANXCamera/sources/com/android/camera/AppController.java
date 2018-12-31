package com.android.camera;

import com.android.camera.module.Module;
import com.android.camera.module.loader.StartControl;
import com.android.camera.storage.ImageSaver;

public interface AppController {
    Module getCurrentModule();

    int getCurrentModuleIndex();

    ImageSaver getImageSaver();

    void onModeSelected(StartControl startControl);
}
