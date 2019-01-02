package com.ss.android.ugc.effectmanager;

import android.os.statistics.E2EScenario;
import android.text.TextUtils;
import android.util.Log;
import com.android.camera.module.impl.component.FileUtils;
import com.ss.android.ugc.effectmanager.common.EffectConstants;
import com.ss.android.ugc.effectmanager.common.ErrorConstants;
import com.ss.android.ugc.effectmanager.common.SimpleThreadFactory;
import com.ss.android.ugc.effectmanager.common.TaskManager;
import com.ss.android.ugc.effectmanager.common.TaskManager.TaskManagerConfig;
import com.ss.android.ugc.effectmanager.common.cache.FileCache;
import com.ss.android.ugc.effectmanager.common.listener.ICache;
import com.ss.android.ugc.effectmanager.common.task.ExceptionResult;
import com.ss.android.ugc.effectmanager.common.utils.EffectUtils;
import com.ss.android.ugc.effectmanager.context.EffectContext;
import com.ss.android.ugc.effectmanager.effect.listener.ICheckChannelListener;
import com.ss.android.ugc.effectmanager.effect.listener.IFetchEffectChannelListener;
import com.ss.android.ugc.effectmanager.effect.listener.IFetchEffectListListener;
import com.ss.android.ugc.effectmanager.effect.listener.IFetchEffectListener;
import com.ss.android.ugc.effectmanager.effect.listener.IFetchFavoriteList;
import com.ss.android.ugc.effectmanager.effect.listener.IIsTagNeedUpdatedListener;
import com.ss.android.ugc.effectmanager.effect.listener.IModFavoriteList;
import com.ss.android.ugc.effectmanager.effect.listener.IUpdateTagListener;
import com.ss.android.ugc.effectmanager.effect.model.Effect;
import com.ss.android.ugc.effectmanager.effect.model.EffectCategoryResponse;
import com.ss.android.ugc.effectmanager.effect.model.EffectChannelResponse;
import com.ss.android.ugc.effectmanager.effect.repository.EffectChannelRepository;
import com.ss.android.ugc.effectmanager.effect.repository.EffectChannelRepository.EffectListListener;
import com.ss.android.ugc.effectmanager.effect.repository.EffectRepository;
import com.ss.android.ugc.effectmanager.effect.repository.EffectRepository.EffectListener;
import com.ss.android.ugc.effectmanager.effect.repository.EffectStore;
import com.ss.android.ugc.effectmanager.effect.repository.FavoriteRepository;
import com.ss.android.ugc.effectmanager.effect.repository.UpdateTagRepository;
import com.ss.android.ugc.effectmanager.link.LinkSelector;
import com.ss.android.ugc.effectmanager.link.model.host.Host;
import com.ss.android.ugc.effectmanager.network.interceptor.BaseInterceptor;
import com.ss.android.ugc.effectmanager.network.interceptor.LinkSelectorInterceptor;
import java.util.ArrayList;
import java.util.List;
import java.util.UUID;
import java.util.concurrent.Executors;

public class EffectManager {
    private static final String SDK_TAG = "EffectManager";
    private ICache mCache;
    private EffectChannelRepository mEffectChannelRepository;
    private EffectContext mEffectContext;
    private EffectRepository mEffectRepository;
    private EffectStore mEffectStore;
    private FavoriteRepository mFavoriteRepository;
    private boolean mInited = false;
    private LinkSelector mLinkSelector;
    private UpdateTagRepository mUpdateTagRepository;

    private void initTaskManager() {
        TaskManager taskManager = new TaskManager();
        taskManager.init(new TaskManagerConfig().setExecutor(Executors.newCachedThreadPool(new SimpleThreadFactory(SDK_TAG, true))).setEffectContext(this.mEffectContext));
        BaseInterceptor linkSelectorInterceptor = new LinkSelectorInterceptor(this.mLinkSelector);
        linkSelectorInterceptor.enable(true);
        taskManager.addInterception(EffectConstants.LINK_SELECTOR, linkSelectorInterceptor);
        this.mEffectContext.getEffectConfiguration().setTaskManager(taskManager);
    }

    private void initCache() {
        if (this.mEffectContext.getEffectConfiguration().getCache() == null) {
            this.mCache = new FileCache(this.mEffectContext.getEffectConfiguration());
            this.mEffectContext.getEffectConfiguration().setCache(this.mCache);
            return;
        }
        this.mCache = this.mEffectContext.getEffectConfiguration().getCache();
    }

    public boolean init(EffectConfiguration effectConfiguration) {
        if (!checkConfiguration(effectConfiguration)) {
            return false;
        }
        this.mEffectContext = new EffectContext(effectConfiguration);
        this.mLinkSelector = this.mEffectContext.getLinkSelector();
        initTaskManager();
        initRepository();
        initCache();
        this.mEffectContext.getEffectConfiguration().getEffectNetWorker().setLinkSelector(this.mLinkSelector);
        this.mInited = true;
        if (!this.mLinkSelector.isLazy()) {
            linkSelectorStart();
        }
        return true;
    }

    private boolean checkConfiguration(EffectConfiguration effectConfiguration) {
        if (effectConfiguration == null) {
            Log.e(SDK_TAG, ErrorConstants.LOG_CONFIGURATION_NOT_SET);
        } else if (effectConfiguration.getLinkSelectorConfiguration().getOriginHosts() == null || effectConfiguration.getLinkSelectorConfiguration().getOriginHosts().isEmpty()) {
            Log.e(SDK_TAG, ErrorConstants.LOG_HOST_NOT_SET);
        } else if (effectConfiguration.getLinkSelectorConfiguration().getContext() == null) {
            Log.e(SDK_TAG, ErrorConstants.LOG_CONTEXT_NOT_SET);
        } else if (effectConfiguration.getJsonConverter() == null) {
            Log.e(SDK_TAG, ErrorConstants.LOG_JSON_CONCERT_NOT_SET);
        } else if (effectConfiguration.getEffectNetWorker() == null) {
            Log.e(SDK_TAG, ErrorConstants.LOG_NET_WORKER_NOT_SET);
        } else if (effectConfiguration.getEffectDir() != null && effectConfiguration.getEffectDir().exists()) {
            return true;
        } else {
            Log.e(SDK_TAG, ErrorConstants.LOG_CACHE_DIR_NOT_SET);
        }
        return false;
    }

    private void initRepository() {
        this.mEffectStore = new EffectStore(this.mEffectContext.getEffectConfiguration());
        this.mEffectChannelRepository = new EffectChannelRepository(this.mEffectContext);
        this.mEffectRepository = new EffectRepository(this.mEffectContext);
        this.mFavoriteRepository = new FavoriteRepository(this.mEffectContext);
        this.mEffectChannelRepository.setOnEffectListListener(new EffectListListener() {
            public void updateEffectChannel(String str, EffectChannelResponse effectChannelResponse, int i, ExceptionResult exceptionResult) {
                EffectManager.this.mEffectStore.updateEffectChannel(str, effectChannelResponse, i, exceptionResult);
            }
        });
        this.mEffectRepository.setListener(new EffectListener() {
            public void updateEffectStatus(String str, Effect effect, int i, ExceptionResult exceptionResult) {
                EffectManager.this.mEffectStore.updateEffectDownloadStatus(str, effect, i, exceptionResult);
            }

            public void updateEffectListStatus(String str, List<Effect> list, ExceptionResult exceptionResult) {
                EffectManager.this.mEffectStore.updateEffectListDownloadStatus(str, list, exceptionResult);
            }
        });
        this.mUpdateTagRepository = new UpdateTagRepository(this.mEffectContext);
    }

    public void fetchEffectList(String str, final boolean z, final IFetchEffectChannelListener iFetchEffectChannelListener) {
        if (this.mEffectContext == null || this.mEffectChannelRepository == null) {
            if (iFetchEffectChannelListener != null) {
                iFetchEffectChannelListener.onFail(new ExceptionResult(new IllegalStateException("请先初始化")));
            }
            return;
        }
        IFetchEffectChannelListener anonymousClass3 = new IFetchEffectChannelListener() {
            public void onSuccess(final EffectChannelResponse effectChannelResponse) {
                if (z) {
                    ICache access$100 = EffectManager.this.mCache;
                    StringBuilder stringBuilder = new StringBuilder();
                    stringBuilder.append(EffectConstants.KEY_EFFECT_CHANNEL);
                    stringBuilder.append(effectChannelResponse.getPanel());
                    final String queryToString = access$100.queryToString(stringBuilder.toString());
                    ICache access$1002 = EffectManager.this.mCache;
                    StringBuilder stringBuilder2 = new StringBuilder();
                    stringBuilder2.append(EffectConstants.KEY_EFFECT_CHANNEL);
                    stringBuilder2.append(effectChannelResponse.getPanel());
                    access$1002.remove(stringBuilder2.toString());
                    EffectManager.this.downloadEffectList(EffectManager.this.getNeedDownloadEffectList(effectChannelResponse.getAllCategoryEffects()), new IFetchEffectListListener() {
                        public void onSuccess(List<Effect> list) {
                            EffectChannelResponse access$300 = EffectManager.this.divideEffectList(effectChannelResponse, list);
                            if (iFetchEffectChannelListener != null) {
                                iFetchEffectChannelListener.onSuccess(access$300);
                            }
                            ICache access$100 = EffectManager.this.mCache;
                            StringBuilder stringBuilder = new StringBuilder();
                            stringBuilder.append(EffectConstants.KEY_EFFECT_CHANNEL);
                            stringBuilder.append(effectChannelResponse.getPanel());
                            access$100.save(stringBuilder.toString(), queryToString);
                        }

                        public void onFail(ExceptionResult exceptionResult) {
                            if (iFetchEffectChannelListener != null) {
                                iFetchEffectChannelListener.onFail(exceptionResult);
                            }
                        }
                    });
                } else if (iFetchEffectChannelListener != null) {
                    iFetchEffectChannelListener.onSuccess(effectChannelResponse);
                }
            }

            public void onFail(ExceptionResult exceptionResult) {
                if (iFetchEffectChannelListener != null) {
                    iFetchEffectChannelListener.onFail(exceptionResult);
                }
            }
        };
        String currentTaskID = getCurrentTaskID();
        this.mEffectContext.getEffectConfiguration().getListenerManger().setFetchEffectChannelListener(currentTaskID, anonymousClass3);
        if (TextUtils.isEmpty(str)) {
            this.mEffectChannelRepository.fetchList(E2EScenario.DEFAULT_CATEGORY, currentTaskID, false);
        } else {
            this.mEffectChannelRepository.fetchList(str, currentTaskID, false);
        }
    }

    public void fetchEffectListFromCache(String str, IFetchEffectChannelListener iFetchEffectChannelListener) {
        if (this.mEffectContext == null || this.mEffectChannelRepository == null) {
            if (iFetchEffectChannelListener != null) {
                iFetchEffectChannelListener.onFail(new ExceptionResult(new IllegalStateException("请先初始化")));
            }
            return;
        }
        String currentTaskID = getCurrentTaskID();
        this.mEffectContext.getEffectConfiguration().getListenerManger().setFetchEffectChannelListener(currentTaskID, iFetchEffectChannelListener);
        if (TextUtils.isEmpty(str)) {
            this.mEffectChannelRepository.fetchList(E2EScenario.DEFAULT_CATEGORY, currentTaskID, true);
        } else {
            this.mEffectChannelRepository.fetchList(str, currentTaskID, true);
        }
    }

    public void fetchExistEffectList(String str, IFetchEffectChannelListener iFetchEffectChannelListener) {
        if (this.mEffectContext == null || this.mEffectChannelRepository == null) {
            if (iFetchEffectChannelListener != null) {
                iFetchEffectChannelListener.onFail(new ExceptionResult(new IllegalStateException("请先初始化")));
            }
            return;
        }
        String currentTaskID = getCurrentTaskID();
        this.mEffectContext.getEffectConfiguration().getListenerManger().setFetchEffectChannelListener(currentTaskID, iFetchEffectChannelListener);
        if (TextUtils.isEmpty(str)) {
            this.mEffectChannelRepository.fetchExistEffectList(E2EScenario.DEFAULT_CATEGORY, currentTaskID);
        } else {
            this.mEffectChannelRepository.fetchExistEffectList(str, currentTaskID);
        }
    }

    public void fetchEffect(Effect effect, IFetchEffectListener iFetchEffectListener) {
        if (this.mEffectContext == null || this.mEffectRepository == null) {
            if (iFetchEffectListener != null) {
                iFetchEffectListener.onFail(effect, new ExceptionResult(new IllegalStateException("请先初始化")));
            }
            return;
        }
        String currentTaskID = getCurrentTaskID();
        this.mEffectContext.getEffectConfiguration().getListenerManger().setFetchEffectListener(currentTaskID, iFetchEffectListener);
        if (!isEffectDownloading(effect)) {
            this.mEffectRepository.fetchEffect(effect, currentTaskID);
        }
    }

    public void fetchEffect(String str, final IFetchEffectListener iFetchEffectListener) {
        if (this.mEffectContext == null) {
            if (iFetchEffectListener != null) {
                iFetchEffectListener.onFail(null, new ExceptionResult(new IllegalStateException("请先初始化")));
            }
            return;
        }
        IFetchEffectListListener anonymousClass4 = new IFetchEffectListListener() {
            public void onSuccess(List<Effect> list) {
                if (list.isEmpty()) {
                    iFetchEffectListener.onFail(null, new ExceptionResult(1));
                } else {
                    iFetchEffectListener.onSuccess((Effect) list.get(0));
                }
            }

            public void onFail(ExceptionResult exceptionResult) {
                iFetchEffectListener.onFail(null, exceptionResult);
            }
        };
        List arrayList = new ArrayList();
        arrayList.add(str);
        fetchEffectList(arrayList, anonymousClass4);
    }

    public void fetchEffectList(List<String> list, final IFetchEffectListListener iFetchEffectListListener) {
        if (this.mEffectContext == null || this.mEffectRepository == null) {
            if (iFetchEffectListListener != null) {
                iFetchEffectListListener.onFail(new ExceptionResult(new IllegalStateException("请先初始化")));
            }
            return;
        }
        IFetchEffectListListener anonymousClass5 = new IFetchEffectListListener() {
            public void onSuccess(List<Effect> list) {
                EffectManager.this.downloadEffectList(list, iFetchEffectListListener);
            }

            public void onFail(ExceptionResult exceptionResult) {
                iFetchEffectListListener.onFail(exceptionResult);
            }
        };
        String currentTaskID = getCurrentTaskID();
        this.mEffectContext.getEffectConfiguration().getListenerManger().setFetchEffectListListener(currentTaskID, anonymousClass5);
        this.mEffectRepository.fetchEffectListById(list, currentTaskID);
    }

    public void fetchEffectList(List<String> list, final boolean z, final IFetchEffectListListener iFetchEffectListListener) {
        if (this.mEffectContext == null || this.mEffectRepository == null) {
            if (iFetchEffectListListener != null) {
                iFetchEffectListListener.onFail(new ExceptionResult(new IllegalStateException("请先初始化")));
            }
            return;
        }
        IFetchEffectListListener anonymousClass6 = new IFetchEffectListListener() {
            public void onSuccess(List<Effect> list) {
                if (z) {
                    EffectManager.this.downloadEffectList(list, iFetchEffectListListener);
                } else {
                    iFetchEffectListListener.onSuccess(list);
                }
            }

            public void onFail(ExceptionResult exceptionResult) {
                iFetchEffectListListener.onFail(exceptionResult);
            }
        };
        String currentTaskID = getCurrentTaskID();
        this.mEffectContext.getEffectConfiguration().getListenerManger().setFetchEffectListListener(currentTaskID, anonymousClass6);
        this.mEffectRepository.fetchEffectListById(list, currentTaskID);
    }

    public void fetchEffectList(List<String> list, int i, final IFetchEffectListListener iFetchEffectListListener) {
        if (this.mEffectContext == null || this.mEffectRepository == null) {
            if (iFetchEffectListListener != null) {
                iFetchEffectListListener.onFail(new ExceptionResult(new IllegalStateException("请先初始化")));
            }
            return;
        }
        IFetchEffectListListener anonymousClass7 = new IFetchEffectListListener() {
            public void onSuccess(List<Effect> list) {
                iFetchEffectListListener.onSuccess(list);
            }

            public void onFail(ExceptionResult exceptionResult) {
                iFetchEffectListListener.onFail(exceptionResult);
            }
        };
        String currentTaskID = getCurrentTaskID();
        this.mEffectContext.getEffectConfiguration().getListenerManger().setFetchEffectListListener(currentTaskID, anonymousClass7);
        this.mEffectRepository.fetchEffectListById(list, currentTaskID, i);
    }

    public boolean isEffectDownloaded(Effect effect) {
        return this.mEffectStore != null && EffectUtils.isEffectValid(effect) && this.mEffectStore.isDownloaded(effect);
    }

    public boolean isEffectDownloading(Effect effect) {
        return this.mEffectStore != null && EffectUtils.isEffectValid(effect) && this.mEffectStore.isDownloading(effect);
    }

    public void deleteEffect(Effect effect) {
        if (effect != null) {
            this.mCache.remove(effect.getId());
            ICache iCache = this.mCache;
            StringBuilder stringBuilder = new StringBuilder();
            stringBuilder.append(effect.getId());
            stringBuilder.append(FileUtils.SUFFIX);
            iCache.remove(stringBuilder.toString());
        }
    }

    public void clearEffects() {
        this.mCache.clear();
    }

    public void clearCache(String str) {
        ICache iCache = this.mCache;
        StringBuilder stringBuilder = new StringBuilder();
        stringBuilder.append(EffectConstants.KEY_EFFECT_CHANNEL);
        stringBuilder.append(str);
        iCache.remove(stringBuilder.toString());
    }

    public EffectChannelResponse getCurrentEffectChannel() {
        if (this.mEffectStore == null) {
            return null;
        }
        return this.mEffectStore.getCurrentEffectChannel();
    }

    public void checkedEffectListUpdate(String str, ICheckChannelListener iCheckChannelListener) {
        if (this.mEffectContext == null || this.mEffectChannelRepository == null) {
            if (iCheckChannelListener != null) {
                iCheckChannelListener.checkChannelFailed(new ExceptionResult(new IllegalStateException("请先初始化")));
            }
            return;
        }
        String currentTaskID = getCurrentTaskID();
        this.mEffectContext.getEffectConfiguration().getListenerManger().setCheckChannelListener(currentTaskID, iCheckChannelListener);
        this.mEffectChannelRepository.checkUpdate(str, currentTaskID);
    }

    public void destroy() {
        if (this.mInited && this.mEffectContext != null) {
            this.mEffectContext.getEffectConfiguration().getTaskManager().destroy();
            this.mEffectContext.getEffectConfiguration().getListenerManger().destroy();
            this.mLinkSelector.destory();
            this.mInited = false;
        }
    }

    private void downloadEffectList(List<Effect> list, IFetchEffectListListener iFetchEffectListListener) {
        if (this.mEffectContext == null || this.mEffectRepository == null) {
            if (iFetchEffectListListener != null) {
                iFetchEffectListListener.onFail(new ExceptionResult(new IllegalStateException("请先初始化")));
            }
            return;
        }
        String currentTaskID = getCurrentTaskID();
        this.mEffectContext.getEffectConfiguration().getListenerManger().setFetchEffectListListener(currentTaskID, iFetchEffectListListener);
        this.mEffectRepository.fetchEffectList(list, currentTaskID);
    }

    private List<Effect> getNeedDownloadEffectList(List<Effect> list) {
        List<Effect> arrayList = new ArrayList();
        List currentDownloadingEffectList = this.mEffectStore.getCurrentDownloadingEffectList();
        for (Effect effect : list) {
            if (!currentDownloadingEffectList.contains(effect)) {
                arrayList.add(effect);
            }
        }
        return arrayList;
    }

    private EffectChannelResponse divideEffectList(EffectChannelResponse effectChannelResponse, List<Effect> list) {
        effectChannelResponse.setAllCategoryEffects(list);
        for (EffectCategoryResponse effectCategoryResponse : effectChannelResponse.getCategoryResponseList()) {
            List arrayList = new ArrayList();
            for (Effect effect : effectCategoryResponse.getTotalEffects()) {
                if (list.contains(effect)) {
                    arrayList.add(effect);
                }
            }
            effectCategoryResponse.setTotalEffects(arrayList);
        }
        return effectChannelResponse;
    }

    private String getCurrentTaskID() {
        return UUID.randomUUID().toString();
    }

    public void updateTag(String str, String str2, IUpdateTagListener iUpdateTagListener) {
        if (this.mUpdateTagRepository == null) {
            if (iUpdateTagListener != null) {
                iUpdateTagListener.onFinally();
            }
            return;
        }
        this.mUpdateTagRepository.updateTag(getCurrentTaskID(), str, str2, iUpdateTagListener);
    }

    public void isTagUpdated(String str, String str2, IIsTagNeedUpdatedListener iIsTagNeedUpdatedListener) {
        if (this.mUpdateTagRepository == null) {
            iIsTagNeedUpdatedListener.onTagNeedNotUpdate();
            return;
        }
        this.mUpdateTagRepository.isTagUpdated(getCurrentTaskID(), str, str2, iIsTagNeedUpdatedListener);
    }

    private void linkSelectorStart() {
        this.mLinkSelector.startOptHosts();
    }

    public void updateHosts(List<Host> list, boolean z) {
        if (this.mLinkSelector != null) {
            this.mLinkSelector.updateHosts(list, z);
        }
    }

    public void modifyFavoriteList(String str, List<String> list, Boolean bool, IModFavoriteList iModFavoriteList) {
        if (this.mEffectContext == null || this.mFavoriteRepository == null) {
            if (iModFavoriteList != null) {
                iModFavoriteList.onFail(new ExceptionResult(new IllegalStateException("请先初始化")));
            }
            return;
        }
        String currentTaskID = getCurrentTaskID();
        this.mEffectContext.getEffectConfiguration().getListenerManger().setModFavoriteListener(currentTaskID, iModFavoriteList);
        this.mFavoriteRepository.modFavoriteList(str, (List) list, bool, currentTaskID);
    }

    public void modifyFavoriteList(String str, String str2, Boolean bool, IModFavoriteList iModFavoriteList) {
        if (this.mEffectContext == null || this.mFavoriteRepository == null) {
            if (iModFavoriteList != null) {
                iModFavoriteList.onFail(new ExceptionResult(new IllegalStateException("请先初始化")));
            }
            return;
        }
        String currentTaskID = getCurrentTaskID();
        this.mEffectContext.getEffectConfiguration().getListenerManger().setModFavoriteListener(currentTaskID, iModFavoriteList);
        this.mFavoriteRepository.modFavoriteList(str, str2, bool, currentTaskID);
    }

    public void fetchFavoriteList(String str, IFetchFavoriteList iFetchFavoriteList) {
        if (this.mEffectContext == null || this.mFavoriteRepository == null) {
            if (iFetchFavoriteList != null) {
                iFetchFavoriteList.onFailed(new ExceptionResult(new IllegalStateException("请先初始化")));
            }
            return;
        }
        String currentTaskID = getCurrentTaskID();
        this.mEffectContext.getEffectConfiguration().getListenerManger().setFetchFavoriteListListener(currentTaskID, iFetchFavoriteList);
        this.mFavoriteRepository.fetchFavoriteList(str, currentTaskID);
    }

    public void updateDeviceId(String str) {
        this.mEffectContext.getEffectConfiguration().setDeviceId(str);
    }
}
