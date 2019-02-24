package com.ss.android.ugc.effectmanager.common.listener;

import com.ss.android.ugc.effectmanager.common.EffectRequest;
import java.io.InputStream;

public interface IEffectNetWorker {
    InputStream execute(EffectRequest effectRequest);
}
