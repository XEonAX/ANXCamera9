package com.ss.android.ugc.effectmanager.effect.model.net;

import com.ss.android.ugc.effectmanager.common.model.BaseNetResponse;
import com.ss.android.ugc.effectmanager.effect.model.Effect;
import java.util.List;

public class EffectListResponse extends BaseNetResponse {
    private List<Effect> data;

    public void setData(List<Effect> list) {
        this.data = list;
    }

    public List<Effect> getData() {
        return this.data;
    }
}
