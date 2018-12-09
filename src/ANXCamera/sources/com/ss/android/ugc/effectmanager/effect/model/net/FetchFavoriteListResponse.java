package com.ss.android.ugc.effectmanager.effect.model.net;

import com.ss.android.ugc.effectmanager.common.model.BaseNetResponse;
import com.ss.android.ugc.effectmanager.effect.model.Effect;
import java.io.Serializable;
import java.util.ArrayList;
import java.util.List;

public class FetchFavoriteListResponse extends BaseNetResponse {
    private List<Data> data = new ArrayList();

    private class Data implements Serializable {
        private List<Effect> effects = new ArrayList();
        private String type;

        private Data() {
        }
    }

    public String getType() {
        return ((Data) this.data.get(0)).type;
    }

    public List<Effect> getEffects() {
        return ((Data) this.data.get(0)).effects;
    }

    public boolean checkValued() {
        if (this.data == null) {
            this.data = new ArrayList();
        }
        return true;
    }
}
