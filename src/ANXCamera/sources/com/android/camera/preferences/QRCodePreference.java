package com.android.camera.preferences;

import android.content.Context;
import android.preference.CheckBoxPreference;
import android.util.AttributeSet;
import android.view.View;
import com.android.camera.CameraSettings;

public class QRCodePreference extends CheckBoxPreference {
    public QRCodePreference(Context context, AttributeSet attributeSet, int i) {
        super(context, attributeSet, i);
    }

    public QRCodePreference(Context context, AttributeSet attributeSet) {
        super(context, attributeSet);
    }

    public QRCodePreference(Context context) {
        super(context);
    }

    protected void onBindView(View view) {
        super.onBindView(view);
        view = view.findViewById(16908289);
        if (view != null) {
            view.setEnabled(CameraSettings.isQRCodeReceiverAvailable(getContext()));
        }
    }

    protected boolean callChangeListener(Object obj) {
        if (!Boolean.TRUE.equals(obj) || CameraSettings.isQRCodeReceiverAvailable(getContext())) {
            return super.callChangeListener(obj);
        }
        return false;
    }
}
