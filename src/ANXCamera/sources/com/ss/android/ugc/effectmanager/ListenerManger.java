package com.ss.android.ugc.effectmanager;

import com.ss.android.ugc.effectmanager.effect.listener.ICheckChannelListener;
import com.ss.android.ugc.effectmanager.effect.listener.IFetchEffectChannelListener;
import com.ss.android.ugc.effectmanager.effect.listener.IFetchEffectListListener;
import com.ss.android.ugc.effectmanager.effect.listener.IFetchEffectListener;
import com.ss.android.ugc.effectmanager.effect.listener.IFetchFavoriteList;
import com.ss.android.ugc.effectmanager.effect.listener.IModFavoriteList;
import com.ss.android.ugc.effectmanager.effect.listener.IReadUpdateTagListener;
import com.ss.android.ugc.effectmanager.effect.listener.IWriteUpdateTagListener;
import java.util.HashMap;
import java.util.Map;

public class ListenerManger {
    private Map<String, ICheckChannelListener> checkChannelListenerMap = new HashMap();
    private Map<String, IFetchEffectChannelListener> fetchEffectChannelListenerMap = new HashMap();
    private Map<String, IFetchEffectListListener> fetchEffectListListenerMap = new HashMap();
    private Map<String, IFetchEffectListener> fetchEffectListenerMap = new HashMap();
    private Map<String, IFetchFavoriteList> mFetchFavoriteListMap = new HashMap();
    private Map<String, IModFavoriteList> mModFavoriteListMap = new HashMap();
    private Map<String, IReadUpdateTagListener> mReadUpdateTagMap = new HashMap();
    private Map<String, IWriteUpdateTagListener> mWriteUpdateTagMap = new HashMap();

    public void setWriteUpdateTagListener(String str, IWriteUpdateTagListener iWriteUpdateTagListener) {
        if (this.mWriteUpdateTagMap == null) {
            this.mWriteUpdateTagMap = new HashMap();
        }
        this.mWriteUpdateTagMap.put(str, iWriteUpdateTagListener);
    }

    public void setReadUpdateTagListener(String str, IReadUpdateTagListener iReadUpdateTagListener) {
        if (this.mReadUpdateTagMap == null) {
            this.mReadUpdateTagMap = new HashMap();
        }
        this.mReadUpdateTagMap.put(str, iReadUpdateTagListener);
    }

    public void setFetchFavoriteListListener(String str, IFetchFavoriteList iFetchFavoriteList) {
        if (this.mFetchFavoriteListMap == null) {
            this.mFetchFavoriteListMap = new HashMap();
        }
        this.mFetchFavoriteListMap.put(str, iFetchFavoriteList);
    }

    public void setModFavoriteListener(String str, IModFavoriteList iModFavoriteList) {
        if (this.mModFavoriteListMap == null) {
            this.mModFavoriteListMap = new HashMap();
        }
        this.mModFavoriteListMap.put(str, iModFavoriteList);
    }

    public void setFetchEffectChannelListener(String str, IFetchEffectChannelListener iFetchEffectChannelListener) {
        if (this.fetchEffectChannelListenerMap == null) {
            this.fetchEffectChannelListenerMap = new HashMap();
        }
        this.fetchEffectChannelListenerMap.put(str, iFetchEffectChannelListener);
    }

    public void setFetchEffectListListener(String str, IFetchEffectListListener iFetchEffectListListener) {
        if (this.fetchEffectListenerMap == null) {
            this.fetchEffectListenerMap = new HashMap();
        }
        this.fetchEffectListListenerMap.put(str, iFetchEffectListListener);
    }

    public void setCheckChannelListener(String str, ICheckChannelListener iCheckChannelListener) {
        if (this.checkChannelListenerMap == null) {
            this.checkChannelListenerMap = new HashMap();
        }
        this.checkChannelListenerMap.put(str, iCheckChannelListener);
    }

    public void setFetchEffectListener(String str, IFetchEffectListener iFetchEffectListener) {
        if (this.fetchEffectListenerMap == null) {
            this.fetchEffectListenerMap = new HashMap();
        }
        this.fetchEffectListenerMap.put(str, iFetchEffectListener);
    }

    public IFetchEffectListener getFetchEffectListener(String str) {
        if (this.fetchEffectListenerMap == null) {
            this.fetchEffectListenerMap = new HashMap();
        }
        return (IFetchEffectListener) this.fetchEffectListenerMap.get(str);
    }

    public IFetchEffectListListener getFetchEffectLisListener(String str) {
        if (this.fetchEffectListListenerMap == null) {
            this.fetchEffectListListenerMap = new HashMap();
        }
        return (IFetchEffectListListener) this.fetchEffectListListenerMap.get(str);
    }

    public ICheckChannelListener getCheckChannelListener(String str) {
        if (this.checkChannelListenerMap == null) {
            this.checkChannelListenerMap = new HashMap();
        }
        return (ICheckChannelListener) this.checkChannelListenerMap.get(str);
    }

    public IFetchEffectChannelListener getFetchEffectChannelListener(String str) {
        if (this.fetchEffectChannelListenerMap == null) {
            this.fetchEffectChannelListenerMap = new HashMap();
        }
        return (IFetchEffectChannelListener) this.fetchEffectChannelListenerMap.get(str);
    }

    public IModFavoriteList getModFavoriteListListener(String str) {
        if (this.mModFavoriteListMap == null) {
            this.mModFavoriteListMap = new HashMap();
        }
        return (IModFavoriteList) this.mModFavoriteListMap.get(str);
    }

    public IFetchFavoriteList getFetchFavoriteListListener(String str) {
        if (this.mFetchFavoriteListMap == null) {
            this.mFetchFavoriteListMap = new HashMap();
        }
        return (IFetchFavoriteList) this.mFetchFavoriteListMap.get(str);
    }

    public IReadUpdateTagListener getReadUpdateTagListener(String str) {
        if (this.mReadUpdateTagMap == null) {
            this.mReadUpdateTagMap = new HashMap();
        }
        return (IReadUpdateTagListener) this.mReadUpdateTagMap.get(str);
    }

    public IWriteUpdateTagListener getWriteUpdateTagListener(String str) {
        if (this.mWriteUpdateTagMap == null) {
            this.mWriteUpdateTagMap = new HashMap();
        }
        return (IWriteUpdateTagListener) this.mWriteUpdateTagMap.get(str);
    }

    public void destroy() {
        for (String put : this.checkChannelListenerMap.keySet()) {
            this.checkChannelListenerMap.put(put, null);
        }
        for (String put2 : this.fetchEffectChannelListenerMap.keySet()) {
            this.fetchEffectChannelListenerMap.put(put2, null);
        }
        for (String put22 : this.fetchEffectListListenerMap.keySet()) {
            this.fetchEffectListListenerMap.put(put22, null);
        }
        for (String put222 : this.fetchEffectListenerMap.keySet()) {
            this.fetchEffectListenerMap.put(put222, null);
        }
        for (String put2222 : this.mModFavoriteListMap.keySet()) {
            this.mModFavoriteListMap.put(put2222, null);
        }
        for (String put22222 : this.mFetchFavoriteListMap.keySet()) {
            this.mFetchFavoriteListMap.put(put22222, null);
        }
        for (String put222222 : this.mReadUpdateTagMap.keySet()) {
            this.mReadUpdateTagMap.put(put222222, null);
        }
        for (String put2222222 : this.mWriteUpdateTagMap.keySet()) {
            this.mWriteUpdateTagMap.put(put2222222, null);
        }
    }
}
