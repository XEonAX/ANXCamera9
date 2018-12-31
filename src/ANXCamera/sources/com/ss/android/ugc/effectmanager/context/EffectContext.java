package com.ss.android.ugc.effectmanager.context;

import com.ss.android.ugc.effectmanager.EffectConfiguration;
import com.ss.android.ugc.effectmanager.link.LinkSelector;
import org.jetbrains.annotations.NotNull;

public class EffectContext {
    private EffectConfiguration mEffectConfiguration;
    private LinkSelector mLinkSelector = new LinkSelector(this);

    public EffectContext(@NotNull EffectConfiguration effectConfiguration) {
        this.mEffectConfiguration = effectConfiguration;
        this.mLinkSelector.linkSelectorConfigure(effectConfiguration.getLinkSelectorConfiguration());
    }

    public EffectConfiguration getEffectConfiguration() {
        return this.mEffectConfiguration;
    }

    public LinkSelector getLinkSelector() {
        return this.mLinkSelector;
    }
}
