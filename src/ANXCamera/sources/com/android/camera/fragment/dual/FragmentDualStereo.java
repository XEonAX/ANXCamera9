package com.android.camera.fragment.dual;

import android.view.View;
import android.view.View.OnClickListener;
import android.view.View.OnLongClickListener;
import com.android.camera.data.data.ComponentData;
import com.android.camera.fragment.BaseFragment;
import com.android.camera.fragment.manually.ManuallyListener;
import com.android.camera.protocol.ModeProtocol.DualController;
import com.android.camera.protocol.ModeProtocol.HandleBackTrace;

public class FragmentDualStereo extends BaseFragment implements OnClickListener, OnLongClickListener, ManuallyListener, DualController, HandleBackTrace {
    public static final int FRAGMENT_INFO = 4085;

    public void onManuallyDataChanged(ComponentData componentData, String str, String str2, boolean z) {
    }

    protected void initView(View view) {
    }

    protected int getLayoutResourceId() {
        return 0;
    }

    public int getFragmentInto() {
        return 4085;
    }

    public boolean onBackEvent(int i) {
        return false;
    }

    public void updateZoomValue() {
    }

    public boolean isZoomVisible() {
        return false;
    }

    public int visibleHeight() {
        return 0;
    }

    public void onClick(View view) {
    }

    public boolean onLongClick(View view) {
        return false;
    }

    public void hideZoomButton() {
    }

    public void showZoomButton() {
    }
}
