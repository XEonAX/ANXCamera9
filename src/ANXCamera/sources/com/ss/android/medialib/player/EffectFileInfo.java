package com.ss.android.medialib.player;

import android.support.annotation.Keep;

@Keep
public class EffectFileInfo {
    String path;
    int type;

    public interface Type {
        public static final int EFFECT_4 = 4;
        public static final int EFFECT_5 = 5;
        public static final int EFFECT_6 = 6;
        public static final int EFFECT_7 = 7;
        public static final int EFFECT_8 = 8;
        public static final int EFFECT_9 = 9;
    }

    public EffectFileInfo(int i, String str) {
        this.type = i;
        this.path = str;
    }

    public int getType() {
        return this.type;
    }

    public String getPath() {
        return this.path;
    }
}
