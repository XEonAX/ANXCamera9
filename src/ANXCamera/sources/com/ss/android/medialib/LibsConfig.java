package com.ss.android.medialib;

import com.ss.android.ugc.effectmanager.effect.model.ComposerHelper;
import java.util.ArrayList;
import java.util.List;

public class LibsConfig {
    public static List<String> LIBS = new ArrayList();

    static {
        LIBS.add("ttffmpeg");
        LIBS.add("yuv");
        LIBS.add(ComposerHelper.CONFIG_EFFECT);
        LIBS.add("ttffmpeg-invoker");
    }
}
