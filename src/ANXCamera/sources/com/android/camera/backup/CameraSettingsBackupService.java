package com.android.camera.backup;

import com.xiaomi.settingsdk.backup.CloudBackupServiceBase;
import com.xiaomi.settingsdk.backup.ICloudBackup;

public class CameraSettingsBackupService extends CloudBackupServiceBase {
    protected ICloudBackup getBackupImpl() {
        return new CameraSettingsBackupImpl();
    }
}
