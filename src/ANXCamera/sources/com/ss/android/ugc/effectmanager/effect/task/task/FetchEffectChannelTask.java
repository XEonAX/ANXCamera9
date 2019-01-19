package com.ss.android.ugc.effectmanager.effect.task.task;

import android.os.Handler;
import android.text.TextUtils;
import com.ss.android.ugc.effectmanager.EffectConfiguration;
import com.ss.android.ugc.effectmanager.common.EffectConstants;
import com.ss.android.ugc.effectmanager.common.EffectRequest;
import com.ss.android.ugc.effectmanager.common.ErrorConstants;
import com.ss.android.ugc.effectmanager.common.listener.ICache;
import com.ss.android.ugc.effectmanager.common.listener.IJsonConverter;
import com.ss.android.ugc.effectmanager.common.task.ExceptionResult;
import com.ss.android.ugc.effectmanager.common.task.NormalTask;
import com.ss.android.ugc.effectmanager.common.utils.EffectUtils;
import com.ss.android.ugc.effectmanager.common.utils.NetworkUtils;
import com.ss.android.ugc.effectmanager.context.EffectContext;
import com.ss.android.ugc.effectmanager.effect.model.Effect;
import com.ss.android.ugc.effectmanager.effect.model.EffectCategoryModel;
import com.ss.android.ugc.effectmanager.effect.model.EffectCategoryResponse;
import com.ss.android.ugc.effectmanager.effect.model.EffectChannelModel;
import com.ss.android.ugc.effectmanager.effect.model.EffectChannelResponse;
import com.ss.android.ugc.effectmanager.effect.model.net.EffectNetListResponse;
import com.ss.android.ugc.effectmanager.effect.task.result.EffectChannelTaskResult;
import java.io.File;
import java.io.InputStream;
import java.net.InetAddress;
import java.net.MalformedURLException;
import java.net.URL;
import java.net.UnknownHostException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

public class FetchEffectChannelTask extends NormalTask {
    private static final String COMPRESSED_FILE_SUFFIX = ".zip";
    private static final String TAG = "SDK_FETCH_LIST";
    private EffectConfiguration mConfiguration = this.mEffectContext.getEffectConfiguration();
    private int mCurCnt = (this.mConfiguration.getRetryCount() + 1);
    private EffectContext mEffectContext;
    private ICache mFileCache = this.mConfiguration.getCache();
    private IJsonConverter mJsonConverter = this.mConfiguration.getJsonConverter();
    private String mRemoteIp;
    private String mRequestedUrl;
    private String mSelectedHost;
    private String panel;

    public FetchEffectChannelTask(EffectContext effectContext, String str, String str2, Handler handler) {
        super(handler, str2, EffectConstants.NETWORK);
        this.panel = str;
        this.mEffectContext = effectContext;
    }

    public void execute() {
        while (true) {
            int i = this.mCurCnt;
            this.mCurCnt = i - 1;
            if (i != 0) {
                EffectRequest buildEffectListRequest = buildEffectListRequest();
                try {
                    ExceptionResult exceptionResult;
                    if (isCanceled()) {
                        exceptionResult = new ExceptionResult((int) ErrorConstants.CODE_CANCEL_DOWNLOAD);
                        exceptionResult.setTrackParams(this.mRequestedUrl, this.mSelectedHost, this.mRemoteIp);
                        sendMessage(14, new EffectChannelTaskResult(new EffectChannelResponse(this.panel), exceptionResult));
                        return;
                    }
                    EffectNetListResponse effectNetListResponse = (EffectNetListResponse) this.mConfiguration.getEffectNetWorker().execute(buildEffectListRequest, this.mJsonConverter, EffectNetListResponse.class);
                    if (effectNetListResponse.checkValued()) {
                        sendMessage(14, new EffectChannelTaskResult(dealResponse(effectNetListResponse.getData()), null));
                        return;
                    } else if (this.mCurCnt == 0) {
                        exceptionResult = new ExceptionResult((int) ErrorConstants.CODE_DOWNLOAD_ERROR);
                        exceptionResult.setTrackParams(this.mRequestedUrl, this.mSelectedHost, this.mRemoteIp);
                        sendMessage(14, new EffectChannelTaskResult(new EffectChannelResponse(this.panel), exceptionResult));
                        return;
                    }
                } catch (Exception e) {
                    if (this.mCurCnt == 0) {
                        sendMessage(14, new EffectChannelTaskResult(new EffectChannelResponse(this.panel), new ExceptionResult(e, this.mRequestedUrl, this.mSelectedHost, this.mRemoteIp)));
                    }
                }
            } else {
                return;
            }
        }
    }

    private EffectChannelResponse dealResponse(EffectChannelModel effectChannelModel) {
        EffectChannelResponse effectChannelResponse = new EffectChannelResponse();
        effectChannelResponse.setPanel(this.panel);
        effectChannelResponse.setVersion(effectChannelModel.getVersion());
        effectChannelResponse.setAllCategoryEffects(effectChannelModel.getEffects());
        effectChannelResponse.setCategoryResponseList(initCategory(effectChannelModel));
        effectChannelResponse.setPanelModel(effectChannelModel.getPanel());
        effectChannelResponse.setFrontEffect(getEffect(effectChannelModel.getFront_effect_id(), effectChannelModel));
        effectChannelResponse.setRearEffect(getEffect(effectChannelModel.getRear_effect_id(), effectChannelModel));
        fillEffectPath(effectChannelModel);
        saveEffectList(effectChannelModel);
        return effectChannelResponse;
    }

    private List<EffectCategoryResponse> initCategory(EffectChannelModel effectChannelModel) {
        EffectChannelModel effectChannelModel2;
        ICache iCache = this.mFileCache;
        StringBuilder stringBuilder = new StringBuilder();
        stringBuilder.append(EffectConstants.KEY_EFFECT_CHANNEL);
        stringBuilder.append(this.panel);
        InputStream queryToStream = iCache.queryToStream(stringBuilder.toString());
        if (queryToStream != null) {
            effectChannelModel2 = (EffectChannelModel) this.mJsonConverter.convertJsonToObj(queryToStream, EffectChannelModel.class);
        } else {
            effectChannelModel2 = null;
        }
        if (effectChannelModel2 == null) {
            effectChannelModel2 = new EffectChannelModel();
        }
        List<EffectCategoryResponse> arrayList = new ArrayList();
        if (!effectChannelModel.getCategory().isEmpty()) {
            for (EffectCategoryModel effectCategoryModel : effectChannelModel.getCategory()) {
                EffectCategoryModel effectCategoryModel2 = new EffectCategoryModel();
                if (!effectChannelModel2.getCategory().isEmpty()) {
                    for (EffectCategoryModel effectCategoryModel3 : effectChannelModel2.getCategory()) {
                        if (effectCategoryModel3.getId().equals(effectCategoryModel.getId())) {
                            effectCategoryModel2 = effectCategoryModel3;
                        }
                    }
                }
                List categoryAllEffects = getCategoryAllEffects(effectCategoryModel2, effectChannelModel2);
                EffectCategoryResponse effectCategoryResponse = new EffectCategoryResponse();
                effectCategoryResponse.setId(effectCategoryModel.getId());
                effectCategoryResponse.setName(effectCategoryModel.getName());
                if (!effectCategoryModel.getIcon().getUrl_list().isEmpty()) {
                    effectCategoryResponse.setIcon_normal_url((String) effectCategoryModel.getIcon().getUrl_list().get(0));
                }
                if (!effectCategoryModel.getIcon_selected().getUrl_list().isEmpty()) {
                    effectCategoryResponse.setIcon_selected_url((String) effectCategoryModel.getIcon_selected().getUrl_list().get(0));
                }
                List categoryAllEffects2 = getCategoryAllEffects(effectCategoryModel, effectChannelModel);
                List categoryAddedEffects = getCategoryAddedEffects(categoryAllEffects, categoryAllEffects2);
                categoryAllEffects = getCategoryDeletedEffects(categoryAllEffects, categoryAllEffects2);
                effectCategoryResponse.setTotalEffects(categoryAllEffects2);
                effectCategoryResponse.setAddedEffects(categoryAddedEffects);
                effectCategoryResponse.setDeletedEffects(categoryAllEffects);
                effectCategoryResponse.setTags(effectCategoryModel.getTags());
                effectCategoryResponse.setTagsUpdateTime(effectCategoryModel.getTagsUpdated());
                arrayList.add(effectCategoryResponse);
            }
        }
        return arrayList;
    }

    private Effect getEffect(String str, EffectChannelModel effectChannelModel) {
        Effect effect = null;
        for (Effect effect2 : effectChannelModel.getEffects()) {
            if (TextUtils.equals(str, effect2.getEffectId())) {
                effect = effect2;
            }
        }
        return effect;
    }

    private List<Effect> getCategoryAllEffects(EffectCategoryModel effectCategoryModel, EffectChannelModel effectChannelModel) {
        List<Effect> arrayList = new ArrayList();
        for (String str : effectCategoryModel.getEffects()) {
            for (Effect effect : effectChannelModel.getEffects()) {
                if (str.equals(effect.getEffectId())) {
                    arrayList.add(effect);
                }
            }
        }
        return arrayList;
    }

    private List<Effect> getCategoryAddedEffects(List<Effect> list, List<Effect> list2) {
        if (list == null || list.isEmpty()) {
            return list2;
        }
        List<Effect> arrayList = new ArrayList();
        Object obj = 1;
        for (Effect effect : list2) {
            for (Effect equals : list) {
                if (effect.equals(equals)) {
                    obj = null;
                }
            }
            if (obj != null) {
                arrayList.add(effect);
                obj = 1;
            }
        }
        return arrayList;
    }

    private List<Effect> getCategoryDeletedEffects(List<Effect> list, List<Effect> list2) {
        List<Effect> arrayList = new ArrayList();
        if (list == null || list.isEmpty()) {
            return arrayList;
        }
        Object obj = 1;
        for (Effect effect : list) {
            for (Effect equals : list2) {
                if (effect.equals(equals)) {
                    obj = null;
                }
            }
            if (obj != null) {
                arrayList.add(effect);
                obj = 1;
            }
        }
        return arrayList;
    }

    private void saveEffectList(EffectChannelModel effectChannelModel) {
        ICache iCache = this.mFileCache;
        StringBuilder stringBuilder = new StringBuilder();
        stringBuilder.append(EffectConstants.KEY_EFFECT_CHANNEL);
        stringBuilder.append(this.panel);
        iCache.save(stringBuilder.toString(), this.mJsonConverter.convertObjToJson(effectChannelModel));
    }

    private void deleteEffect(Effect effect) {
        if (EffectUtils.isEffectValid(effect)) {
            this.mFileCache.remove(effect.getId());
            ICache iCache = this.mFileCache;
            StringBuilder stringBuilder = new StringBuilder();
            stringBuilder.append(effect.getId());
            stringBuilder.append(".zip");
            iCache.remove(stringBuilder.toString());
        }
    }

    private void fillEffectPath(EffectChannelModel effectChannelModel) {
        List<Effect> effects = effectChannelModel.getEffects();
        if (effects != null && !effects.isEmpty()) {
            for (Effect effect : effects) {
                StringBuilder stringBuilder = new StringBuilder();
                stringBuilder.append(this.mConfiguration.getEffectDir());
                stringBuilder.append(File.separator);
                stringBuilder.append(effect.getId());
                stringBuilder.append(".zip");
                effect.setZipPath(stringBuilder.toString());
                stringBuilder = new StringBuilder();
                stringBuilder.append(this.mConfiguration.getEffectDir());
                stringBuilder.append(File.separator);
                stringBuilder.append(effect.getId());
                effect.setUnzipPath(stringBuilder.toString());
            }
        }
    }

    private EffectRequest buildEffectListRequest() {
        Map hashMap = new HashMap();
        if (!TextUtils.isEmpty(this.mConfiguration.getAccessKey())) {
            hashMap.put(EffectConfiguration.KEY_ACCESS_KEY, this.mConfiguration.getAccessKey());
        }
        if (!TextUtils.isEmpty(this.mConfiguration.getAppVersion())) {
            hashMap.put("app_version", this.mConfiguration.getAppVersion());
        }
        if (!TextUtils.isEmpty(this.mConfiguration.getSdkVersion())) {
            hashMap.put(EffectConfiguration.KEY_SDK_VERSION, this.mConfiguration.getSdkVersion());
        }
        if (!TextUtils.isEmpty(this.mConfiguration.getChannel())) {
            hashMap.put("channel", this.mConfiguration.getChannel());
        }
        if (!TextUtils.isEmpty(this.panel)) {
            hashMap.put(EffectConfiguration.KEY_PANEL, this.panel);
        }
        if (!TextUtils.isEmpty(this.mConfiguration.getPlatform())) {
            hashMap.put(EffectConfiguration.KEY_DEVICE_PLATFORM, this.mConfiguration.getPlatform());
        }
        if (!TextUtils.isEmpty(this.mConfiguration.getDeviceId())) {
            hashMap.put("device_id", this.mConfiguration.getDeviceId());
        }
        if (!TextUtils.isEmpty(this.mConfiguration.getRegion())) {
            hashMap.put(EffectConfiguration.KEY_REGION, this.mConfiguration.getRegion());
        }
        if (!TextUtils.isEmpty(this.mConfiguration.getDeviceType())) {
            hashMap.put(EffectConfiguration.KEY_DEVICE_TYPE, this.mConfiguration.getDeviceType());
        }
        this.mSelectedHost = this.mEffectContext.getLinkSelector().getBestHostUrl();
        StringBuilder stringBuilder = new StringBuilder();
        stringBuilder.append(this.mSelectedHost);
        stringBuilder.append(this.mConfiguration.getApiAdress());
        stringBuilder.append(EffectConstants.ROUTE_EFFECT_LIST);
        String buildRequestUrl = NetworkUtils.buildRequestUrl(hashMap, stringBuilder.toString());
        this.mRequestedUrl = buildRequestUrl;
        try {
            this.mRemoteIp = InetAddress.getByName(new URL(buildRequestUrl).getHost()).getHostAddress();
        } catch (UnknownHostException e) {
            e.printStackTrace();
        } catch (MalformedURLException e2) {
            e2.printStackTrace();
        }
        return new EffectRequest("GET", buildRequestUrl);
    }
}
