package com.android.camera.fragment.dialog;

import android.app.Dialog;
import android.content.DialogInterface;
import android.os.Bundle;
import android.support.annotation.Nullable;
import android.view.KeyEvent;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.view.ViewGroup.MarginLayoutParams;
import com.android.camera.Camera;
import com.android.camera.R;
import com.android.camera.Util;
import com.android.camera.data.DataRepository;
import com.android.camera.log.Log;
import com.android.camera.module.BaseModule;
import com.android.camera.module.loader.FunctionDataSetup;
import com.android.camera.module.loader.FunctionUISetup;
import com.android.camera.module.loader.NullHolder;
import com.android.camera.module.loader.camera2.Camera2OpenManager;
import com.android.camera.protocol.ModeCoordinatorImpl;
import com.android.camera.protocol.ModeProtocol.BackStack;
import com.android.camera.statistic.ScenarioTrackUtil;

public class PortraitNewbieDialogFragment extends BaseDialogFragment {
    public static final String TAG = "PortraitHint";

    @Nullable
    public View onCreateView(LayoutInflater layoutInflater, @Nullable ViewGroup viewGroup, @Nullable Bundle bundle) {
        View inflate;
        if (DataRepository.dataItemFeature().eZ()) {
            inflate = layoutInflater.inflate(R.layout.fragment_dialog_portait_lighting_hint, viewGroup, false);
        } else {
            inflate = layoutInflater.inflate(R.layout.fragment_dialog_portait_hint, viewGroup, false);
        }
        initViewOnTouchListener(inflate);
        adjustViewHeight(inflate.findViewById(R.id.portrait_use_hint_layout));
        return inflate;
    }

    public Dialog onCreateDialog(Bundle bundle) {
        Dialog onCreateDialog = super.onCreateDialog(bundle);
        onCreateDialog.getWindow().setGravity(48);
        return onCreateDialog;
    }

    public final boolean canProvide() {
        return isAdded();
    }

    private void adjustViewHeight(View view) {
        int i = (int) (((float) getResources().getDisplayMetrics().widthPixels) / 0.75f);
        int dialogTopMargin = Util.getDialogTopMargin((Util.sWindowHeight - i) - Util.getBottomHeight(getContext().getResources()));
        MarginLayoutParams marginLayoutParams = (MarginLayoutParams) view.getLayoutParams();
        if (marginLayoutParams.height != i) {
            marginLayoutParams.height = i;
            marginLayoutParams.topMargin = dialogTopMargin;
        }
    }

    public void onResume() {
        super.onResume();
        getDialog().setOnKeyListener(this);
    }

    public void onViewCreated(View view, @Nullable Bundle bundle) {
        super.onViewCreated(view, bundle);
        BackStack backStack = (BackStack) ModeCoordinatorImpl.getInstance().getAttachProtocol(171);
        if (backStack != null) {
            backStack.addInBackStack(this);
        }
    }

    public void onDestroyView() {
        BackStack backStack = (BackStack) ModeCoordinatorImpl.getInstance().getAttachProtocol(171);
        if (backStack != null) {
            backStack.removeBackStack(this);
        }
        super.onDestroyView();
    }

    public void onCancel(DialogInterface dialogInterface) {
        super.onCancel(dialogInterface);
        resumeMode();
    }

    private void resumeMode() {
        ((BackStack) ModeCoordinatorImpl.getInstance().getAttachProtocol(171)).removeBackStack(this);
        if (isAdded()) {
            Camera camera = (Camera) getActivity();
            if (!camera.isActivityPaused() && !camera.isSwitchingModule()) {
                ScenarioTrackUtil.trackScenarioAbort(ScenarioTrackUtil.sSwitchModeTimeScenario);
                BaseModule baseModule = (BaseModule) ((Camera) getActivity()).getCurrentModule();
                baseModule.setCameraDevice(Camera2OpenManager.getInstance().getCurrentCamera2Device());
                baseModule.onCreate(DataRepository.dataItemGlobal().getCurrentMode(), DataRepository.dataItemGlobal().getCurrentCameraId());
                baseModule.onResume();
                baseModule.registerProtocol();
                FunctionDataSetup functionDataSetup = new FunctionDataSetup(171);
                FunctionUISetup functionUISetup = new FunctionUISetup(171, true);
                try {
                    functionDataSetup.apply(NullHolder.ofNullable(baseModule));
                    functionUISetup.apply(NullHolder.ofNullable(baseModule));
                } catch (Exception e) {
                    Log.e(TAG, e.getMessage());
                }
            }
        }
    }

    public boolean onBackEvent(int i) {
        dismissAllowingStateLoss();
        resumeMode();
        switch (i) {
            case 1:
            case 2:
                return true;
            default:
                return false;
        }
    }

    public boolean onKey(DialogInterface dialogInterface, int i, KeyEvent keyEvent) {
        if (i == 4 && keyEvent.getAction() == 1) {
            onBackEvent(5);
            return true;
        } else if (i == 25 || i == 24) {
            return true;
        } else {
            return false;
        }
    }
}
