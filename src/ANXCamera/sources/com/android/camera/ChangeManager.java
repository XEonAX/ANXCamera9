package com.android.camera;

public class ChangeManager {
    public static final int TYPE_CHANGE_LAYOUT_MODE = 7;
    public static final int TYPE_NONE = 0;
    public static final int TYPE_NORMAL = 1;
    public static final int TYPE_RESTORED = 3;
    private int mStatus = 0;

    public void request(int i) {
        this.mStatus = i | this.mStatus;
    }

    public boolean check(int i) {
        return (this.mStatus & i) == i;
    }

    public void clear(int i) {
        this.mStatus = (~i) & this.mStatus;
    }

    public void clearAll() {
        this.mStatus = 0;
    }
}
