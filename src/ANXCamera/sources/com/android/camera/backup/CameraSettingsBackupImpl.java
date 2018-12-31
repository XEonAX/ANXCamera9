package com.android.camera.backup;

import android.content.Context;
import android.content.SharedPreferences;
import com.android.camera.data.data.config.DataItemConfig;
import com.android.camera.log.Log;
import com.android.camera.module.BaseModule;
import com.xiaomi.settingsdk.backup.ICloudBackup;
import com.xiaomi.settingsdk.backup.data.DataPackage;
import com.xiaomi.settingsdk.backup.data.PrefsBackupHelper;
import com.xiaomi.settingsdk.backup.data.PrefsBackupHelper.PrefEntry;
import java.util.ArrayList;
import java.util.List;

public class CameraSettingsBackupImpl implements ICloudBackup {
    private static final int FRONT_CLOUD_CAMERA_ID = 1;
    private static final PrefEntry[] PREF_ENTRIES = CameraBackupSettings.PREF_ENTRIES;
    private static final int REAR_CLOUD_CAMERA_ID = 0;
    private static final String TAG = "CameraSettingsBackup";

    interface BackupRestoreHandler {
        void handle(SharedPreferences sharedPreferences, DataPackage dataPackage, PrefEntry[] prefEntryArr);
    }

    private static String getCloudPrefixByCameraIdAndMode(int i, int i2) {
        if (checkCameraId(i)) {
            if (i == 0) {
                i = 0;
            } else if (i == 1) {
                i = 1;
            }
        }
        StringBuilder stringBuilder = new StringBuilder();
        stringBuilder.append("camera_settings_simple_mode_local_");
        stringBuilder.append(BaseModule.getPreferencesLocalId(i, i2));
        return stringBuilder.toString();
    }

    private static String getSharedPreferencesName(int i, int i2) {
        StringBuilder stringBuilder = new StringBuilder();
        stringBuilder.append("camera_settings_simple_mode_local_");
        stringBuilder.append(DataItemConfig.provideLocalId(i, i2));
        return stringBuilder.toString();
    }

    private static String getCloudPrefix(int i, int i2) {
        if (checkCameraId(i)) {
            if (i == 0) {
                i = 0;
            } else if (i == 1) {
                i = 1;
            }
        }
        StringBuilder stringBuilder = new StringBuilder();
        stringBuilder.append("camera_settings_simple_mode_local_");
        stringBuilder.append(DataItemConfig.provideLocalId(i, i2));
        return stringBuilder.toString();
    }

    private static boolean checkCameraId(int i) {
        if (i < 0) {
            return false;
        }
        if (i < 2) {
            return true;
        }
        StringBuilder stringBuilder = new StringBuilder();
        stringBuilder.append("cameraId is invalid: ");
        stringBuilder.append(i);
        throw new IllegalArgumentException(stringBuilder.toString());
    }

    public void onBackupSettings(Context context, DataPackage dataPackage) {
        String str = TAG;
        StringBuilder stringBuilder = new StringBuilder();
        stringBuilder.append("backup version ");
        stringBuilder.append(getCurrentVersion(context));
        Log.d(str, stringBuilder.toString());
        handleBackupOrRestore(context, dataPackage, new BackupRestoreHandler() {
            public void handle(SharedPreferences sharedPreferences, DataPackage dataPackage, PrefEntry[] prefEntryArr) {
                PrefsBackupHelper.backup(sharedPreferences, dataPackage, prefEntryArr);
            }
        });
    }

    public void onRestoreSettings(Context context, DataPackage dataPackage, int i) {
        int currentVersion = getCurrentVersion(context);
        if (i > currentVersion) {
            String str = TAG;
            StringBuilder stringBuilder = new StringBuilder();
            stringBuilder.append("skip restore due to cloud version ");
            stringBuilder.append(i);
            stringBuilder.append(" is higher than local version ");
            stringBuilder.append(currentVersion);
            Log.w(str, stringBuilder.toString());
            return;
        }
        String str2 = TAG;
        StringBuilder stringBuilder2 = new StringBuilder();
        stringBuilder2.append("restore version ");
        stringBuilder2.append(i);
        Log.d(str2, stringBuilder2.toString());
        if (4 <= i) {
            handleBackupOrRestore(context, dataPackage, new BackupRestoreHandler() {
                public void handle(SharedPreferences sharedPreferences, DataPackage dataPackage, PrefEntry[] prefEntryArr) {
                    PrefsBackupHelper.restore(sharedPreferences, dataPackage, prefEntryArr);
                }
            });
        } else if (3 == i) {
            restoreFromVersion3(context, dataPackage);
        } else if (1 == i) {
            restoreFromVersion1(context, dataPackage);
        }
    }

    private void restoreFromVersion1(Context context, DataPackage dataPackage) {
        Context context2 = context;
        DataPackage dataPackage2 = dataPackage;
        SharedPreferences sharedPreferences = context2.getSharedPreferences("camera_settings_global", 0);
        int[] iArr = new int[]{0, 1};
        List<Integer> availableCameraIds = getAvailableCameraIds();
        for (int i : iArr) {
            for (Integer intValue : availableCameraIds) {
                int intValue2 = intValue.intValue();
                SharedPreferences sharedPreferences2 = context2.getSharedPreferences(getSharedPreferencesName(intValue2, i), 0);
                if (sharedPreferences2 != null) {
                    PrefEntry[] addPrefixToEntries = addPrefixToEntries(PREF_ENTRIES, getCloudPrefixByCameraIdAndMode(intValue2, i == 0 ? 0 : 2));
                    CameraBackupHelper.restoreSettings(sharedPreferences2, dataPackage2, addPrefixToEntries, false);
                    if (i == 0 && intValue2 == 0) {
                        CameraBackupHelper.restoreSettings(sharedPreferences, dataPackage2, addPrefixToEntries, true);
                    }
                }
            }
        }
        CameraBackupHelper.restoreSettings(sharedPreferences, dataPackage2, addPrefixToEntries(PREF_ENTRIES, "camera_settings_global"), true);
    }

    private void restoreFromVersion3(Context context, DataPackage dataPackage) {
        int[] iArr = new int[]{0, 1};
        List<Integer> availableCameraIds = getAvailableCameraIds();
        for (int i : iArr) {
            for (Integer intValue : availableCameraIds) {
                int intValue2 = intValue.intValue();
                SharedPreferences sharedPreferences = context.getSharedPreferences(getSharedPreferencesName(intValue2, i), 0);
                if (sharedPreferences != null) {
                    CameraBackupHelper.restoreSettings(sharedPreferences, dataPackage, addPrefixToEntries(PREF_ENTRIES, getCloudPrefix(intValue2, i)), false);
                }
            }
        }
        CameraBackupHelper.restoreSettings(context.getSharedPreferences("camera_settings_global", 0), dataPackage, addPrefixToEntries(PREF_ENTRIES, "camera_settings_global"), true);
    }

    private void handleBackupOrRestore(Context context, DataPackage dataPackage, BackupRestoreHandler backupRestoreHandler) {
        int[] iArr = new int[]{0, 1};
        List<Integer> availableCameraIds = getAvailableCameraIds();
        for (int i : iArr) {
            for (Integer intValue : availableCameraIds) {
                int intValue2 = intValue.intValue();
                SharedPreferences sharedPreferences = context.getSharedPreferences(getSharedPreferencesName(intValue2, i), 0);
                if (sharedPreferences != null) {
                    backupRestoreHandler.handle(sharedPreferences, dataPackage, addPrefixToEntries(PREF_ENTRIES, getCloudPrefix(intValue2, i)));
                }
            }
        }
        backupRestoreHandler.handle(context.getSharedPreferences("camera_settings_global", 0), dataPackage, addPrefixToEntries(PREF_ENTRIES, "camera_settings_global"));
    }

    private static List<Integer> getAvailableCameraIds() {
        List<Integer> arrayList = new ArrayList();
        if (checkCameraId(0)) {
            arrayList.add(Integer.valueOf(0));
        }
        if (checkCameraId(1)) {
            arrayList.add(Integer.valueOf(1));
        }
        return arrayList;
    }

    private static PrefEntry[] addPrefixToEntries(PrefEntry[] prefEntryArr, String str) {
        PrefEntry[] prefEntryArr2 = new PrefEntry[prefEntryArr.length];
        for (int i = 0; i < prefEntryArr.length; i++) {
            PrefEntry prefEntry = prefEntryArr[i];
            Class valueClass = prefEntry.getValueClass();
            StringBuilder stringBuilder = new StringBuilder();
            stringBuilder.append(str);
            stringBuilder.append("::");
            stringBuilder.append(prefEntry.getCloudKey());
            String stringBuilder2 = stringBuilder.toString();
            String localKey = prefEntry.getLocalKey();
            Object defaultValue = prefEntry.getDefaultValue();
            PrefEntry prefEntry2 = null;
            if (valueClass.equals(Integer.class)) {
                if (defaultValue == null) {
                    prefEntry2 = PrefEntry.createIntEntry(stringBuilder2, localKey);
                } else {
                    prefEntry2 = PrefEntry.createIntEntry(stringBuilder2, localKey, ((Integer) defaultValue).intValue());
                }
            } else if (valueClass.equals(Boolean.class)) {
                if (defaultValue == null) {
                    prefEntry2 = PrefEntry.createBoolEntry(stringBuilder2, localKey);
                } else {
                    prefEntry2 = PrefEntry.createBoolEntry(stringBuilder2, localKey, ((Boolean) defaultValue).booleanValue());
                }
            } else if (valueClass.equals(String.class)) {
                if (defaultValue == null) {
                    prefEntry2 = PrefEntry.createStringEntry(stringBuilder2, localKey);
                } else {
                    prefEntry2 = PrefEntry.createStringEntry(stringBuilder2, localKey, (String) defaultValue);
                }
            } else if (valueClass.equals(Long.class)) {
                if (defaultValue == null) {
                    prefEntry2 = PrefEntry.createLongEntry(stringBuilder2, localKey);
                } else {
                    prefEntry2 = PrefEntry.createLongEntry(stringBuilder2, localKey, ((Long) defaultValue).longValue());
                }
            }
            prefEntryArr2[i] = prefEntry2;
        }
        return prefEntryArr2;
    }

    public int getCurrentVersion(Context context) {
        return 4;
    }
}
