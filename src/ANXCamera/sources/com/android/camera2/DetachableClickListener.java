package com.android.camera2;

import android.app.Dialog;
import android.content.DialogInterface;
import android.content.DialogInterface.OnClickListener;
import android.view.ViewTreeObserver.OnWindowAttachListener;
import com.android.camera.log.Log;

public final class DetachableClickListener implements OnClickListener {
    private static final String TAG = DetachableClickListener.class.getSimpleName();
    private OnClickListener delegateOrNull;

    public static DetachableClickListener wrap(OnClickListener onClickListener) {
        return new DetachableClickListener(onClickListener);
    }

    private DetachableClickListener(OnClickListener onClickListener) {
        this.delegateOrNull = onClickListener;
    }

    public void onClick(DialogInterface dialogInterface, int i) {
        if (this.delegateOrNull != null) {
            this.delegateOrNull.onClick(dialogInterface, i);
        }
    }

    public void clearOnDetach(Dialog dialog) {
        dialog.getWindow().getDecorView().getViewTreeObserver().addOnWindowAttachListener(new OnWindowAttachListener() {
            public void onWindowAttached() {
                Log.v(DetachableClickListener.TAG, "dialog attach to window");
            }

            public void onWindowDetached() {
                DetachableClickListener.this.delegateOrNull = null;
            }
        });
    }
}
