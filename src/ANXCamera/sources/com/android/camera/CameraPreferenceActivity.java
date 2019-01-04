package com.android.camera;

import android.app.AlertDialog;
import android.app.AlertDialog.Builder;
import android.content.DialogInterface;
import android.content.DialogInterface.OnClickListener;
import android.os.Bundle;
import android.preference.Preference;
import android.provider.MiuiSettings;
import android.provider.MiuiSettings.Key;
import android.provider.Settings.Secure;
import android.provider.Settings.System;
import android.widget.Toast;
import com.android.camera.statistic.CameraStatUtil;
import com.android.camera.ui.PreviewListPreference;
import com.android.camera2.DetachableClickListener;
import com.mi.config.b;

public class CameraPreferenceActivity extends BasePreferenceActivity {
    public static final String IS_IMAGE_CAPTURE_INTENT = "IsCaptureIntent";
    private AlertDialog mDoubleConfirmActionChooseDialog = null;

    protected int getPreferenceXml() {
        return R.xml.camera_other_preferences;
    }

    protected void onSettingChanged(int i) {
        CameraSettings.sCameraChangeManager.request(i);
    }

    public boolean onPreferenceChange(Preference preference, Object obj) {
        if (!preference.getKey().equals(CameraSettings.KEY_CAMERA_SNAP) || obj == null) {
            return super.onPreferenceChange(preference, obj);
        }
        if (System.getInt(getContentResolver(), MiuiSettings.System.VOLUMEKEY_WAKE_SCREEN, 0) == 1) {
            Toast.makeText(this, R.string.pref_camera_snap_toast_when_volume_can_wake_screen, 0).show();
            return false;
        } else if ((obj.equals(getString(R.string.pref_camera_snap_value_take_picture)) || obj.equals(getString(R.string.pref_camera_snap_value_take_movie))) && Key.LONG_PRESS_VOLUME_DOWN_PAY.equals(Secure.getString(getContentResolver(), Key.LONG_PRESS_VOLUME_DOWN))) {
            bringUpDoubleConfirmDlg((PreviewListPreference) preference, (String) obj);
            return false;
        } else {
            Secure.putString(getContentResolver(), Key.LONG_PRESS_VOLUME_DOWN, CameraSettings.getMiuiSettingsKeyForStreetSnap((String) obj));
            CameraStatUtil.trackPreferenceChange(CameraSettings.KEY_CAMERA_SNAP, obj);
            return true;
        }
    }

    public void onCreate(Bundle bundle) {
        super.onCreate(bundle);
        changeRequestOrientation();
    }

    public void changeRequestOrientation() {
        if (b.hn()) {
            if (CameraSettings.isFrontCamera()) {
                setRequestedOrientation(7);
            } else {
                setRequestedOrientation(1);
            }
        }
    }

    private void bringUpDoubleConfirmDlg(final PreviewListPreference previewListPreference, final String str) {
        if (this.mDoubleConfirmActionChooseDialog == null) {
            Object wrap = DetachableClickListener.wrap(new OnClickListener() {
                public void onClick(DialogInterface dialogInterface, int i) {
                    if (i == -1) {
                        CameraPreferenceActivity.this.mDoubleConfirmActionChooseDialog = null;
                        CameraStatUtil.trackPreferenceChange(CameraSettings.KEY_CAMERA_SNAP, str);
                        previewListPreference.setValue(str);
                        Secure.putString(CameraPreferenceActivity.this.getContentResolver(), Key.LONG_PRESS_VOLUME_DOWN, CameraSettings.getMiuiSettingsKeyForStreetSnap(str));
                    } else if (i == -2) {
                        CameraPreferenceActivity.this.mDoubleConfirmActionChooseDialog.dismiss();
                        CameraPreferenceActivity.this.mDoubleConfirmActionChooseDialog = null;
                    }
                }
            });
            this.mDoubleConfirmActionChooseDialog = new Builder(this).setTitle(R.string.title_snap_double_confirm).setMessage(R.string.message_snap_double_confirm).setPositiveButton(R.string.snap_confirmed, wrap).setNegativeButton(R.string.snap_cancel, wrap).setCancelable(false).create();
            wrap.clearOnDetach(this.mDoubleConfirmActionChooseDialog);
            this.mDoubleConfirmActionChooseDialog.show();
        }
    }
}
