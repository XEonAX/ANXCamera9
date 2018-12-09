package com.android.camera.fragment.dialog;

import android.app.Dialog;
import android.content.DialogInterface;
import android.graphics.drawable.AnimationDrawable;
import android.os.Bundle;
import android.support.annotation.Nullable;
import android.support.v4.view.ViewCompat;
import android.view.KeyEvent;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import com.android.camera.R;
import com.android.camera.protocol.ModeCoordinatorImpl;
import com.android.camera.protocol.ModeProtocol.BackStack;
import miui.view.animation.CubicEaseInOutInterpolator;

public class FrontRotateNewbieDialogFragment extends BaseDialogFragment {
    public static final String TAG = "RotateHint";
    private AnimationDrawable mAnimationDrawable;

    @Nullable
    public View onCreateView(LayoutInflater layoutInflater, @Nullable ViewGroup viewGroup, @Nullable Bundle bundle) {
        View inflate = layoutInflater.inflate(R.layout.front_camera_hint_popup, viewGroup, false);
        initViewOnTouchListener(inflate);
        this.mAnimationDrawable = (AnimationDrawable) inflate.findViewById(R.id.front_camera_hint_animation).getBackground();
        if (this.mAnimationDrawable != null) {
            this.mAnimationDrawable.start();
        }
        ViewCompat.setAlpha(inflate, 0.0f);
        ViewCompat.animate(inflate).alpha(1.0f).setInterpolator(new CubicEaseInOutInterpolator()).start();
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
        animateOut(400);
    }

    public boolean onBackEvent(int i) {
        animateOut(400);
        return true;
    }

    public boolean onKey(DialogInterface dialogInterface, int i, KeyEvent keyEvent) {
        if (i != 4 || keyEvent.getAction() != 1) {
            return false;
        }
        onBackEvent(5);
        return true;
    }

    public void animateOut(int i) {
        if (this.mAnimationDrawable != null) {
            this.mAnimationDrawable.stop();
        }
        dismissAllowingStateLoss();
    }
}
