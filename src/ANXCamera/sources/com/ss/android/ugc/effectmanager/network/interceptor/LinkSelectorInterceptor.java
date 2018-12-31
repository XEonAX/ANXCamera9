package com.ss.android.ugc.effectmanager.network.interceptor;

import com.ss.android.ugc.effectmanager.common.EffectConstants;
import com.ss.android.ugc.effectmanager.common.task.BaseTask;
import com.ss.android.ugc.effectmanager.common.task.NormalTask;
import com.ss.android.ugc.effectmanager.link.LinkSelector;

public class LinkSelectorInterceptor extends BaseInterceptor {
    private LinkSelector mLinkSelector;

    public LinkSelectorInterceptor(LinkSelector linkSelector) {
        this.mLinkSelector = linkSelector;
    }

    public boolean intercept(BaseTask baseTask) {
        if ((baseTask instanceof NormalTask) && ((NormalTask) baseTask).getType().equals(EffectConstants.NETWORK)) {
            this.mLinkSelector.updateBestHost();
        }
        return false;
    }
}
