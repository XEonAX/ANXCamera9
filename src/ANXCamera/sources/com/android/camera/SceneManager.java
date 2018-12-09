package com.android.camera;

import java.lang.annotation.Retention;
import java.lang.annotation.RetentionPolicy;

public class SceneManager {
    public static final int SCENE_BURST = 4;
    public static final int SCENE_HDR = 2;
    public static final int SCENE_HHT = 3;
    public static final int SCENE_NORMAL = 1;
    private int[] mSceneStacks = new int[0];

    @Retention(RetentionPolicy.SOURCE)
    public @interface SceneType {
    }

    public void pushStacks(int i) {
        int length = this.mSceneStacks.length;
        if (length >= 1) {
            for (int i2 = 0; i2 < length; i2++) {
                if (this.mSceneStacks[i2] == i) {
                    Object obj = new int[length];
                    System.arraycopy(this.mSceneStacks, 0, obj, 0, i2);
                    System.arraycopy(this.mSceneStacks, i2 + 1, obj, i2, (length - i2) - 1);
                    obj[length - 1] = i;
                    this.mSceneStacks = obj;
                    return;
                }
            }
        }
        Object obj2 = new int[(length + 1)];
        System.arraycopy(this.mSceneStacks, 0, obj2, 0, length);
        obj2[length] = i;
        this.mSceneStacks = obj2;
    }

    public int popStacks() {
        int length = this.mSceneStacks.length;
        if (length <= 1) {
            return 1;
        }
        length -= 2;
        int i = this.mSceneStacks[length];
        Object obj = new int[length];
        System.arraycopy(this.mSceneStacks, 0, obj, 0, length);
        this.mSceneStacks = obj;
        return i;
    }

    public int getCurrentScene() {
        if (this.mSceneStacks.length > 1) {
            return this.mSceneStacks[0];
        }
        return 1;
    }

    public String getSuffix() {
        switch (getCurrentScene()) {
            case 2:
                return "_HDR";
            case 3:
                return "_HHT";
            default:
                return "";
        }
    }
}
