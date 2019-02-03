package com.android.camera.data.backup;

import android.support.v4.util.SimpleArrayMap;
import android.util.SparseArray;
import com.android.camera.data.DataRepository;
import com.android.camera.data.data.runing.DataItemRunning;
import com.android.camera.data.provider.DataProvider.ProviderEvent;
import com.android.camera.effect.FilterInfo;

public class DataActionBackUpImpl implements DataBackUp {
    private SparseArray<SparseArray<SimpleArrayMap>> mBackupArrays;

    public void backupRunning(DataItemRunning dataItemRunning, int i, int i2, boolean z) {
        if (this.mBackupArrays == null) {
            this.mBackupArrays = new SparseArray();
        }
        SparseArray sparseArray = (SparseArray) this.mBackupArrays.get(i);
        if (sparseArray == null) {
            sparseArray = new SparseArray();
        }
        sparseArray.put(i2, dataItemRunning.cloneValues());
        this.mBackupArrays.put(i, sparseArray);
        if (z) {
            dataItemRunning.clearArrayMap();
        }
    }

    public void revertRunning(DataItemRunning dataItemRunning, int i, int i2) {
        dataItemRunning.clearArrayMap();
        if (this.mBackupArrays != null) {
            SparseArray sparseArray = (SparseArray) this.mBackupArrays.get(i);
            if (!(sparseArray == null || sparseArray.get(i2) == null)) {
                dataItemRunning.restoreArrayMap((SimpleArrayMap) sparseArray.get(i2));
            }
        }
    }

    public void clearBackUp() {
        if (this.mBackupArrays != null) {
            this.mBackupArrays.clear();
        }
    }

    public <P extends ProviderEvent> void startBackup(P p, int i) {
    }

    public SimpleArrayMap getBackupRunning(int i, int i2) {
        if (this.mBackupArrays == null) {
            return null;
        }
        SparseArray sparseArray = (SparseArray) this.mBackupArrays.get(i);
        if (sparseArray == null) {
            return null;
        }
        return (SimpleArrayMap) sparseArray.get(i2);
    }

    public boolean isLastVideoFastMotion() {
        SimpleArrayMap backupRunning = getBackupRunning(DataRepository.dataItemGlobal().getDataBackUpKey(169), 0);
        if (backupRunning == null) {
            return false;
        }
        Boolean bool = (Boolean) backupRunning.get("pref_video_speed_fast_key");
        if (bool == null) {
            return false;
        }
        return bool.booleanValue();
    }

    public boolean isLastVideoSlowMotion() {
        SimpleArrayMap backupRunning = getBackupRunning(DataRepository.dataItemGlobal().getDataBackUpKey(168), 0);
        if (backupRunning == null) {
            return false;
        }
        Boolean bool = (Boolean) backupRunning.get("pref_video_speed_slow_key");
        if (bool == null) {
            return false;
        }
        return bool.booleanValue();
    }

    public boolean isLastVideoHFRMode() {
        SimpleArrayMap backupRunning = getBackupRunning(DataRepository.dataItemGlobal().getDataBackUpKey(170), 0);
        if (backupRunning == null) {
            return false;
        }
        Boolean bool = (Boolean) backupRunning.get("pref_video_speed_hfr_key");
        if (bool == null) {
            return false;
        }
        return bool.booleanValue();
    }

    public void removeOtherVideoMode() {
        if (this.mBackupArrays != null) {
            int dataBackUpKey = DataRepository.dataItemGlobal().getDataBackUpKey(169);
            int dataBackUpKey2 = DataRepository.dataItemGlobal().getDataBackUpKey(168);
            int dataBackUpKey3 = DataRepository.dataItemGlobal().getDataBackUpKey(170);
            this.mBackupArrays.remove(dataBackUpKey);
            this.mBackupArrays.remove(dataBackUpKey2);
            this.mBackupArrays.remove(dataBackUpKey3);
        }
    }

    public String getBackupFilter(int i, int i2) {
        SimpleArrayMap backupRunning = getBackupRunning(DataRepository.dataItemGlobal().getDataBackUpKey(i), i2);
        if (backupRunning == null) {
            return String.valueOf(FilterInfo.FILTER_ID_NONE);
        }
        String str = (String) backupRunning.get("pref_camera_shader_coloreffect_key");
        if (str == null) {
            str = String.valueOf(FilterInfo.FILTER_ID_NONE);
        }
        return str;
    }

    public boolean getBackupSwitchState(int i, String str, int i2) {
        SimpleArrayMap backupRunning = getBackupRunning(DataRepository.dataItemGlobal().getDataBackUpKey(i), i2);
        if (backupRunning == null) {
            return false;
        }
        Object obj = backupRunning.get(str);
        if (obj == null) {
            return false;
        }
        return ((Boolean) obj).booleanValue();
    }
}
