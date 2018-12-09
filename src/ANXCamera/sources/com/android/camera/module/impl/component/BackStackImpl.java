package com.android.camera.module.impl.component;

import com.android.camera.ActivityBase;
import com.android.camera.protocol.ModeCoordinatorImpl;
import com.android.camera.protocol.ModeProtocol.BackStack;
import com.android.camera.protocol.ModeProtocol.HandleBackTrace;
import java.util.Iterator;
import java.util.Stack;

public class BackStackImpl implements BackStack {
    private ActivityBase mActivity;
    private Stack<HandleBackTrace> mStacks = new Stack();

    public static BackStackImpl create(ActivityBase activityBase) {
        return new BackStackImpl(activityBase);
    }

    public BackStackImpl(ActivityBase activityBase) {
        this.mActivity = activityBase;
    }

    public void registerProtocol() {
        ModeCoordinatorImpl.getInstance().attachProtocol(171, this);
    }

    public void unRegisterProtocol() {
        this.mStacks.clear();
        this.mActivity = null;
        ModeCoordinatorImpl.getInstance().detachProtocol(171, this);
    }

    public <P extends HandleBackTrace> void addInBackStack(P p) {
        this.mStacks.add(p);
    }

    public <P extends HandleBackTrace> void removeBackStack(P p) {
        this.mStacks.remove(p);
    }

    private final boolean handleBackStack(int i) {
        if (this.mStacks.isEmpty()) {
            return false;
        }
        Iterator it = this.mStacks.iterator();
        while (it.hasNext()) {
            HandleBackTrace handleBackTrace = (HandleBackTrace) it.next();
            if (handleBackTrace.canProvide()) {
                if (handleBackTrace.onBackEvent(i)) {
                    return true;
                }
            }
        }
        return false;
    }

    public boolean handleBackStackFromShutter() {
        return handleBackStack(3);
    }

    public boolean handleBackStackFromKeyBack() {
        return handleBackStack(1);
    }

    public boolean handleBackStackFromTapDown(int i, int i2) {
        if (this.mActivity.getCameraScreenNail().getRenderRect().contains(i, i2)) {
            return handleBackStack(2);
        }
        return false;
    }
}
