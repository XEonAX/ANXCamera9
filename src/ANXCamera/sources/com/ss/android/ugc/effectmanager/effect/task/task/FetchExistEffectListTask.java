package com.ss.android.ugc.effectmanager.effect.task.task;

import android.os.Handler;
import android.text.TextUtils;
import com.ss.android.ugc.effectmanager.common.EffectConstants;
import com.ss.android.ugc.effectmanager.common.ErrorConstants;
import com.ss.android.ugc.effectmanager.common.listener.ICache;
import com.ss.android.ugc.effectmanager.common.listener.IJsonConverter;
import com.ss.android.ugc.effectmanager.common.task.ExceptionResult;
import com.ss.android.ugc.effectmanager.common.task.NormalTask;
import com.ss.android.ugc.effectmanager.context.EffectContext;
import com.ss.android.ugc.effectmanager.effect.model.Effect;
import com.ss.android.ugc.effectmanager.effect.model.EffectCategoryModel;
import com.ss.android.ugc.effectmanager.effect.model.EffectCategoryResponse;
import com.ss.android.ugc.effectmanager.effect.model.EffectChannelModel;
import com.ss.android.ugc.effectmanager.effect.model.EffectChannelResponse;
import com.ss.android.ugc.effectmanager.effect.task.result.EffectChannelTaskResult;
import java.io.InputStream;
import java.util.ArrayList;
import java.util.List;

public class FetchExistEffectListTask extends NormalTask {
    private List<Effect> allDownloadedCategoryEffects;
    private ICache mCache = this.mEffectContext.getEffectConfiguration().getCache();
    private EffectContext mEffectContext;
    private IJsonConverter mJsonConverter = this.mEffectContext.getEffectConfiguration().getJsonConverter();
    private String panel;

    public FetchExistEffectListTask(String str, String str2, EffectContext effectContext, Handler handler) {
        super(handler, str2);
        this.panel = str;
        this.mEffectContext = effectContext;
    }

    public void execute() {
        if (TextUtils.isEmpty(this.panel)) {
            sendMessage(14, new EffectChannelTaskResult(new EffectChannelResponse(this.panel), new ExceptionResult((int) ErrorConstants.CODE_PANEL_NULL)));
            return;
        }
        EffectChannelResponse effectChannelResponse = new EffectChannelResponse();
        EffectChannelModel cachedChannelModel = getCachedChannelModel();
        if (cachedChannelModel == null) {
            sendMessage(14, new EffectChannelTaskResult(new EffectChannelResponse(this.panel), new ExceptionResult((int) ErrorConstants.CODE_INVALID_EFFECT_CACHE)));
        } else if (cachedChannelModel.checkValued()) {
            this.allDownloadedCategoryEffects = getDownloadedEffectList(cachedChannelModel.getEffects());
            if (this.allDownloadedCategoryEffects.isEmpty()) {
                sendMessage(14, new EffectChannelTaskResult(new EffectChannelResponse(this.panel), null));
                return;
            }
            effectChannelResponse.setAllCategoryEffects(this.allDownloadedCategoryEffects);
            effectChannelResponse.setCategoryResponseList(getCategoryEffectResponse(cachedChannelModel.getCategory()));
            effectChannelResponse.setPanel(this.panel);
            effectChannelResponse.setPanelModel(cachedChannelModel.getPanel());
            sendMessage(14, new EffectChannelTaskResult(effectChannelResponse, null));
        } else {
            sendMessage(14, new EffectChannelTaskResult(new EffectChannelResponse(this.panel), null));
        }
    }

    private List<Effect> getDownloadedEffectList(List<Effect> list) {
        List<Effect> arrayList = new ArrayList();
        for (Effect effect : list) {
            if (this.mCache.has(effect.getId())) {
                arrayList.add(effect);
            }
        }
        return arrayList;
    }

    private List<EffectCategoryResponse> getCategoryEffectResponse(List<EffectCategoryModel> list) {
        List<EffectCategoryResponse> arrayList = new ArrayList();
        for (EffectCategoryModel effectCategoryModel : list) {
            if (effectCategoryModel.checkValued()) {
                arrayList.add(new EffectCategoryResponse(effectCategoryModel.getId(), effectCategoryModel.getName(), effectCategoryModel.getKey(), getCategoryAllEffects(effectCategoryModel.getEffects()), effectCategoryModel.getTags(), effectCategoryModel.getTagsUpdated()));
            }
        }
        return arrayList;
    }

    private List<Effect> getCategoryAllEffects(List<String> list) {
        List<Effect> arrayList = new ArrayList();
        for (String str : list) {
            for (Effect effect : this.allDownloadedCategoryEffects) {
                if (TextUtils.equals(str, effect.getEffectId())) {
                    arrayList.add(effect);
                }
            }
        }
        return arrayList;
    }

    private EffectChannelModel getCachedChannelModel() {
        ICache iCache = this.mCache;
        StringBuilder stringBuilder = new StringBuilder();
        stringBuilder.append(EffectConstants.KEY_EFFECT_CHANNEL);
        stringBuilder.append(this.panel);
        InputStream queryToStream = iCache.queryToStream(stringBuilder.toString());
        EffectChannelModel effectChannelModel = new EffectChannelModel();
        if (queryToStream != null) {
            return (EffectChannelModel) this.mJsonConverter.convertJsonToObj(queryToStream, EffectChannelModel.class);
        }
        return effectChannelModel;
    }
}
