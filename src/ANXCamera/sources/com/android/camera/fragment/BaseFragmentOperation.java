package com.android.camera.fragment;

import android.support.annotation.IdRes;
import java.lang.annotation.Retention;
import java.lang.annotation.RetentionPolicy;

public class BaseFragmentOperation {
    public static final int OPERATE_HIDE_CURRENT = 7;
    public static final int OPERATE_POP_AND_CLEAR_OTHERS = 5;
    public static final int OPERATE_PUSH = 4;
    public static final int OPERATE_REMOVE = 2;
    public static final int OPERATE_REMOVE_CURRENT = 3;
    public static final int OPERATE_REPLACE = 1;
    public static final int OPERATE_SHOW = 6;
    public static final int OPERATE_UNKNOWN = -1;
    @IdRes
    public int containerViewId;
    public int operateType = -1;
    public int pendingFragmentInfo;

    @Retention(RetentionPolicy.SOURCE)
    public @interface OperateFragment {
    }

    private BaseFragmentOperation(@IdRes int i) {
        this.containerViewId = i;
    }

    public static BaseFragmentOperation create(@IdRes int i) {
        return new BaseFragmentOperation(i);
    }

    public BaseFragmentOperation replaceWith(int i) {
        checkOperation();
        this.operateType = 1;
        this.pendingFragmentInfo = i;
        return this;
    }

    public BaseFragmentOperation remove(int i) {
        checkOperation();
        this.operateType = 2;
        this.pendingFragmentInfo = i;
        return this;
    }

    public BaseFragmentOperation removeCurrent() {
        checkOperation();
        this.operateType = 3;
        return this;
    }

    public BaseFragmentOperation push(int i) {
        checkOperation();
        this.operateType = 4;
        this.pendingFragmentInfo = i;
        return this;
    }

    public BaseFragmentOperation popAndClearOthers(int i) {
        checkOperation();
        this.operateType = 5;
        this.pendingFragmentInfo = i;
        return this;
    }

    public BaseFragmentOperation show(int i) {
        checkOperation();
        this.operateType = 6;
        this.pendingFragmentInfo = i;
        return this;
    }

    public BaseFragmentOperation hideCurrent() {
        checkOperation();
        this.operateType = 7;
        return this;
    }

    private void checkOperation() {
        if (this.operateType > 0) {
            throw new RuntimeException("already set!");
        }
    }
}
