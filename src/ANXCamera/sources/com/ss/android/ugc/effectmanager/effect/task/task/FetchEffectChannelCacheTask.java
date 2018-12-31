package com.ss.android.ugc.effectmanager.effect.task.task;

import android.os.Handler;
import android.text.TextUtils;
import com.ss.android.ugc.effectmanager.common.EffectConstants;
import com.ss.android.ugc.effectmanager.common.ErrorConstants;
import com.ss.android.ugc.effectmanager.common.listener.ICache;
import com.ss.android.ugc.effectmanager.common.listener.IJsonConverter;
import com.ss.android.ugc.effectmanager.common.task.ExceptionResult;
import com.ss.android.ugc.effectmanager.common.task.NormalTask;
import com.ss.android.ugc.effectmanager.common.utils.EffectUtils;
import com.ss.android.ugc.effectmanager.context.EffectContext;
import com.ss.android.ugc.effectmanager.effect.model.BuildEffectChannelResponse;
import com.ss.android.ugc.effectmanager.effect.model.Effect;
import com.ss.android.ugc.effectmanager.effect.model.EffectCategoryModel;
import com.ss.android.ugc.effectmanager.effect.model.EffectCategoryResponse;
import com.ss.android.ugc.effectmanager.effect.model.EffectChannelModel;
import com.ss.android.ugc.effectmanager.effect.model.EffectChannelResponse;
import com.ss.android.ugc.effectmanager.effect.task.result.EffectChannelTaskResult;
import java.io.InputStream;
import java.util.ArrayList;
import java.util.List;

public class FetchEffectChannelCacheTask extends NormalTask {
    private ICache mCache = this.mEffectContext.getEffectConfiguration().getCache();
    private EffectContext mEffectContext;
    private IJsonConverter mJsonConverter = this.mEffectContext.getEffectConfiguration().getJsonConverter();
    private String panel;
    private boolean whileDownload;

    public FetchEffectChannelCacheTask(EffectContext effectContext, String str, String str2, Handler handler, boolean z) {
        super(handler, str2, EffectConstants.NETWORK);
        this.panel = str;
        this.whileDownload = z;
        this.mEffectContext = effectContext;
    }

    public void execute() {
        ICache iCache = this.mCache;
        StringBuilder stringBuilder = new StringBuilder();
        stringBuilder.append(EffectConstants.KEY_EFFECT_CHANNEL);
        stringBuilder.append(this.panel);
        InputStream queryToStream = iCache.queryToStream(stringBuilder.toString());
        if (queryToStream == null) {
            sendMessage(14, new EffectChannelTaskResult(new EffectChannelResponse(this.panel), new ExceptionResult((int) ErrorConstants.CODE_INVALID_EFFECT_CACHE)));
            return;
        }
        EffectChannelModel effectChannelModel = (EffectChannelModel) this.mJsonConverter.convertJsonToObj(queryToStream, EffectChannelModel.class);
        if (effectChannelModel == null) {
            sendMessage(14, new EffectChannelTaskResult(new EffectChannelResponse(this.panel), new ExceptionResult((int) ErrorConstants.CODE_INVALID_EFFECT_CACHE)));
        } else if (effectChannelModel.checkValued()) {
            sendMessage(14, new EffectChannelTaskResult(new BuildEffectChannelResponse(this.panel, this.mEffectContext.getEffectConfiguration().getEffectDir().getAbsolutePath(), true).buildChannelResponse(effectChannelModel), null));
        } else {
            sendMessage(14, new EffectChannelTaskResult(new EffectChannelResponse(this.panel), new ExceptionResult((int) ErrorConstants.CODE_INVALID_EFFECT_CACHE)));
        }
    }

    private EffectChannelResponse buildChannelResponse(EffectChannelModel effectChannelModel) {
        EffectChannelResponse effectChannelResponse = new EffectChannelResponse();
        effectChannelResponse.setVersion(effectChannelModel.getVersion());
        effectChannelResponse.setAllCategoryEffects(effectChannelModel.getEffects());
        List arrayList = new ArrayList();
        effectChannelResponse.setCollections(effectChannelModel.getCollection());
        for (EffectCategoryModel effectCategoryModel : effectChannelModel.getCategory()) {
            EffectCategoryResponse effectCategoryResponse = new EffectCategoryResponse();
            effectCategoryModel.checkValued();
            effectCategoryResponse.setName(effectCategoryModel.getName());
            effectCategoryResponse.setId(effectCategoryModel.getId());
            if (!effectCategoryModel.getIcon().getUrl_list().isEmpty()) {
                effectCategoryResponse.setIcon_normal_url((String) effectCategoryModel.getIcon().getUrl_list().get(0));
            }
            if (!effectCategoryModel.getIcon_selected().getUrl_list().isEmpty()) {
                effectCategoryResponse.setIcon_selected_url((String) effectCategoryModel.getIcon_selected().getUrl_list().get(0));
            }
            effectCategoryResponse.setTotalEffects(getCategoryAllEffects(effectCategoryModel, effectChannelModel));
            effectCategoryResponse.setTagsUpdateTime(effectCategoryModel.getTagsUpdated());
            effectCategoryResponse.setTags(effectCategoryModel.getTags());
            effectCategoryResponse.setKey(effectCategoryModel.getKey());
            arrayList.add(effectCategoryResponse);
        }
        effectChannelResponse.setCategoryResponseList(arrayList);
        effectChannelResponse.setPanel(this.panel);
        effectChannelResponse.setPanelModel(effectChannelModel.getPanel());
        if (this.whileDownload) {
            downloadEffect(effectChannelModel.getEffects());
        }
        return effectChannelResponse;
    }

    private List<Effect> getCategoryAllEffects(EffectCategoryModel effectCategoryModel, EffectChannelModel effectChannelModel) {
        List<Effect> arrayList = new ArrayList();
        for (String str : effectCategoryModel.getEffects()) {
            for (Effect effect : effectChannelModel.getEffects()) {
                if (TextUtils.equals(str, effect.getEffectId())) {
                    arrayList.add(effect);
                }
            }
        }
        return arrayList;
    }

    private void downloadEffect(List<Effect> list) {
        for (Effect effect : list) {
            if (!this.mCache.has(effect.getId())) {
                try {
                    EffectUtils.downloadEffect(this.mEffectContext.getEffectConfiguration(), effect);
                } catch (Exception e) {
                    e.printStackTrace();
                }
            }
        }
    }
}
