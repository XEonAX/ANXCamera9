package com.android.camera.ui;

import android.app.Activity;
import android.app.AlertDialog;
import com.android.camera.CameraSettings;
import com.android.camera.LocationManager;
import com.android.camera.OnScreenHint;
import com.android.camera.R;
import com.android.camera.RotateDialogController;
import com.android.camera.data.DataRepository;
import com.android.camera.data.data.global.DataItemGlobal;
import com.android.camera.data.provider.DataProvider.ProviderEditor;
import com.android.camera.permission.PermissionManager;
import com.android.camera.storage.Storage;
import com.mi.config.b;

public class ScreenHint {
    private final Activity mActivity;
    private OnScreenHint mStorageHint;
    private long mStorageSpace;
    private AlertDialog mSystemChoiceDialog;

    public ScreenHint(Activity activity) {
        this.mActivity = activity;
    }

    public void updateHint() {
        CharSequence string;
        Storage.switchStoragePathIfNeeded();
        this.mStorageSpace = Storage.getAvailableSpace();
        if (this.mStorageSpace == -1) {
            string = this.mActivity.getString(R.string.no_storage);
        } else if (this.mStorageSpace == -2) {
            string = this.mActivity.getString(R.string.preparing_sd);
        } else if (this.mStorageSpace == -3) {
            string = this.mActivity.getString(R.string.access_sd_fail);
        } else if (this.mStorageSpace >= Storage.LOW_STORAGE_THRESHOLD) {
            string = null;
        } else if (Storage.isPhoneStoragePriority()) {
            string = this.mActivity.getString(R.string.spaceIsLow_content_primary_storage_priority);
        } else {
            string = this.mActivity.getString(R.string.spaceIsLow_content_external_storage_priority);
        }
        if (string != null) {
            if (this.mStorageHint == null) {
                this.mStorageHint = OnScreenHint.makeText(this.mActivity, string);
            } else {
                this.mStorageHint.setText(string);
            }
            this.mStorageHint.show();
        } else if (this.mStorageHint != null) {
            this.mStorageHint.cancel();
            this.mStorageHint = null;
        }
    }

    public boolean isScreenHintVisible() {
        return this.mStorageHint != null && this.mStorageHint.getHintViewVisibility() == 0;
    }

    public void cancelHint() {
        if (this.mStorageHint != null) {
            this.mStorageHint.cancel();
            this.mStorageHint = null;
        }
    }

    private void recordLocation(boolean z) {
        ProviderEditor editor = DataRepository.dataItemGlobal().editor();
        editor.putBoolean(CameraSettings.KEY_RECORD_LOCATION, z);
        editor.apply();
        LocationManager.instance().recordLocation(z);
    }

    public void showObjectTrackHint() {
        ProviderEditor editor = DataRepository.dataItemGlobal().editor();
        editor.putBoolean(CameraSettings.KEY_CAMERA_OBJECT_TRACK_HINT_SHOWN, false);
        editor.apply();
        RotateTextToast.getInstance(this.mActivity).show(R.string.object_track_enable_toast, 0);
    }

    public void showFirstUseHint() {
        if (this.mSystemChoiceDialog == null || !this.mSystemChoiceDialog.isShowing()) {
            DataItemGlobal dataItemGlobal = DataRepository.dataItemGlobal();
            boolean z = dataItemGlobal.getBoolean(CameraSettings.KEY_CAMERA_FIRST_USE_HINT_SHOWN, true);
            if (!PermissionManager.checkCameraLocationPermissions()) {
                z = false;
            }
            if (z) {
                boolean contains = dataItemGlobal.contains(CameraSettings.KEY_RECORD_LOCATION);
                if (b.gb() && !contains && z) {
                    this.mSystemChoiceDialog = RotateDialogController.showSystemChoiceDialog(this.mActivity, this.mActivity.getString(R.string.confirm_location_title), this.mActivity.getString(R.string.confirm_location_message), this.mActivity.getString(R.string.confirm_location_alert), this.mActivity.getString(R.string.start_capture), new Runnable() {
                        public void run() {
                            ScreenHint.this.recordLocation(true);
                            ScreenHint.this.recordFirstUse(false);
                            ScreenHint.this.dismissSystemChoiceDialog();
                        }
                    }, new Runnable() {
                        public void run() {
                            ScreenHint.this.recordLocation(false);
                            ScreenHint.this.recordFirstUse(false);
                            ScreenHint.this.dismissSystemChoiceDialog();
                        }
                    });
                }
            }
        }
    }

    public void showConfirmMessage(int i, int i2) {
        RotateDialogController.showSystemAlertDialog(this.mActivity, this.mActivity.getString(i), this.mActivity.getString(i2), this.mActivity.getString(17039370), null, null, null);
    }

    public void hideToast() {
        RotateTextToast instance = RotateTextToast.getInstance();
        if (instance != null) {
            instance.show(0, 0);
        }
    }

    public void recordFirstUse(boolean z) {
        ProviderEditor editor = DataRepository.dataItemGlobal().editor();
        editor.putBoolean(CameraSettings.KEY_CAMERA_FIRST_USE_HINT_SHOWN, z);
        editor.putBoolean(CameraSettings.KEY_CAMERA_CONFIRM_LOCATION_SHOWN, z);
        editor.apply();
    }

    public void dismissSystemChoiceDialog() {
        if (this.mSystemChoiceDialog != null) {
            this.mSystemChoiceDialog.dismiss();
            this.mSystemChoiceDialog = null;
        }
    }
}
