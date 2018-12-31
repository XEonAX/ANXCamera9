package com.ss.android.ugc.effectmanager.effect.model.net;

import com.ss.android.ugc.effectmanager.common.model.BaseNetResponse;

public class EffectCheckUpdateResponse extends BaseNetResponse {
    private boolean updated;

    public void setUpdated(boolean z) {
        this.updated = z;
    }

    public boolean isUpdated() {
        return this.updated;
    }
}
