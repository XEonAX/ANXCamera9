package com.ss.android.vesdk.runtime;

import android.content.Context;
import android.support.annotation.NonNull;
import android.text.TextUtils;
import com.bef.effectsdk.EffectSDKUtils;
import com.ss.android.vesdk.runtime.persistence.VESP;
import java.io.File;

public class VEEnv {
    private static final String MODELS_DIR_SP_KEY = "vesdk_models_dir_sp_key";
    private String mDetectModelsDir;
    private String mWorkspace;

    @NonNull
    public String getWorkspace() {
        return this.mWorkspace;
    }

    public void setWorkspace(@NonNull String str) {
        this.mWorkspace = str;
    }

    @NonNull
    public String getDetectModelsDir() {
        if (TextUtils.isEmpty(this.mDetectModelsDir)) {
            this.mDetectModelsDir = (String) VESP.getInstance().get(MODELS_DIR_SP_KEY, "");
        }
        return this.mDetectModelsDir;
    }

    @NonNull
    public void setDetectModelsDir(String str) {
        this.mDetectModelsDir = str;
        VESP.getInstance().put(MODELS_DIR_SP_KEY, this.mDetectModelsDir);
    }

    @Deprecated
    public void prepareModels(@NonNull Context context) throws Throwable {
        if (this.mWorkspace != null) {
            File file = new File(this.mWorkspace, "models");
            if (!file.exists()) {
                file.mkdirs();
            }
            this.mDetectModelsDir = file.getAbsolutePath();
            EffectSDKUtils.flushAlgorithmModelFiles(context, this.mDetectModelsDir);
        }
    }
}
