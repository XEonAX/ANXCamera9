package com.android.camera.data.backup;

import android.support.v4.util.SimpleArrayMap;
import com.android.camera.data.data.runing.DataItemRunning;
import com.android.camera.data.provider.DataProvider.ProviderEvent;

public interface DataBackUp {
    void backupRunning(DataItemRunning dataItemRunning, int i, int i2, boolean z);

    void clearBackUp();

    String getBackupFilter(int i, int i2);

    SimpleArrayMap getBackupRunning(int i, int i2);

    boolean isLastVideoFastMotion();

    boolean isLastVideoHFRMode();

    boolean isLastVideoSlowMotion();

    void removeOtherVideoMode();

    void revertRunning(DataItemRunning dataItemRunning, int i, int i2);

    <P extends ProviderEvent> void startBackup(P p, int i);
}
