package com.ss.android.ugc.effectmanager.effect.repository;

import android.text.TextUtils;
import com.ss.android.ugc.effectmanager.EffectConfiguration;
import com.ss.android.ugc.effectmanager.common.task.ExceptionResult;
import com.ss.android.ugc.effectmanager.common.utils.FileUtils;
import com.ss.android.ugc.effectmanager.effect.listener.IFetchEffectChannelListener;
import com.ss.android.ugc.effectmanager.effect.listener.IFetchEffectListListener;
import com.ss.android.ugc.effectmanager.effect.listener.IFetchEffectListener;
import com.ss.android.ugc.effectmanager.effect.model.Effect;
import com.ss.android.ugc.effectmanager.effect.model.EffectChannelResponse;
import java.util.ArrayList;
import java.util.List;

public class EffectStore {
    private EffectConfiguration mConfiguration;
    private List<Effect> mCurDownloadingEffects = new ArrayList();
    private EffectChannelResponse mEffectChannels;

    public EffectStore(EffectConfiguration effectConfiguration) {
        this.mConfiguration = effectConfiguration;
    }

    public EffectChannelResponse getCurrentEffectChannel() {
        return this.mEffectChannels == null ? new EffectChannelResponse() : this.mEffectChannels;
    }

    public boolean isDownloaded(Effect effect) {
        if (isDownloading(effect)) {
            return false;
        }
        return FileUtils.checkFileExists(effect.getUnzipPath());
    }

    public boolean isDownloading(Effect effect) {
        if (effect == null) {
            return false;
        }
        for (Effect id : this.mCurDownloadingEffects) {
            if (TextUtils.equals(id.getId(), effect.getId())) {
                return true;
            }
        }
        return false;
    }

    public List<Effect> getCurrentDownloadingEffectList() {
        return this.mCurDownloadingEffects;
    }

    public void updateEffectChannel(String str, EffectChannelResponse effectChannelResponse, int i, ExceptionResult exceptionResult) {
        IFetchEffectChannelListener fetchEffectChannelListener;
        switch (i) {
            case 23:
                this.mEffectChannels = effectChannelResponse;
                fetchEffectChannelListener = this.mConfiguration.getListenerManger().getFetchEffectChannelListener(str);
                if (fetchEffectChannelListener != null) {
                    fetchEffectChannelListener.onSuccess(effectChannelResponse);
                    return;
                }
                return;
            case 27:
                fetchEffectChannelListener = this.mConfiguration.getListenerManger().getFetchEffectChannelListener(str);
                if (fetchEffectChannelListener != null) {
                    fetchEffectChannelListener.onFail(exceptionResult);
                    return;
                }
                return;
            default:
                return;
        }
    }

    public void updateEffectDownloadStatus(String str, Effect effect, int i, ExceptionResult exceptionResult) {
        IFetchEffectListener fetchEffectListener;
        if (i != 26) {
            switch (i) {
                case 20:
                    this.mCurDownloadingEffects.remove(effect);
                    fetchEffectListener = this.mConfiguration.getListenerManger().getFetchEffectListener(str);
                    if (fetchEffectListener != null) {
                        fetchEffectListener.onSuccess(effect);
                        return;
                    }
                    return;
                case 21:
                    this.mCurDownloadingEffects.add(effect);
                    return;
                case 22:
                    this.mCurDownloadingEffects.remove(effect);
                    return;
                default:
                    return;
            }
        }
        fetchEffectListener = this.mConfiguration.getListenerManger().getFetchEffectListener(str);
        if (fetchEffectListener != null) {
            fetchEffectListener.onFail(effect, exceptionResult);
        }
        this.mCurDownloadingEffects.remove(effect);
    }

    public void updateEffectListDownloadStatus(String str, List<Effect> list, ExceptionResult exceptionResult) {
        this.mCurDownloadingEffects.removeAll(list);
        IFetchEffectListListener fetchEffectLisListener = this.mConfiguration.getListenerManger().getFetchEffectLisListener(str);
        if (fetchEffectLisListener == null) {
            return;
        }
        if (exceptionResult == null) {
            fetchEffectLisListener.onSuccess(list);
        } else {
            fetchEffectLisListener.onFail(exceptionResult);
        }
    }
}
