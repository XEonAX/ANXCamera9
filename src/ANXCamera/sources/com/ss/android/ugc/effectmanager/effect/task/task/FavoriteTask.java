package com.ss.android.ugc.effectmanager.effect.task.task;

import android.os.Handler;
import android.text.TextUtils;
import com.ss.android.ugc.effectmanager.EffectConfiguration;
import com.ss.android.ugc.effectmanager.common.EffectConstants;
import com.ss.android.ugc.effectmanager.common.EffectRequest;
import com.ss.android.ugc.effectmanager.common.listener.IJsonConverter;
import com.ss.android.ugc.effectmanager.common.model.BaseNetResponse;
import com.ss.android.ugc.effectmanager.common.task.ExceptionResult;
import com.ss.android.ugc.effectmanager.common.task.NormalTask;
import com.ss.android.ugc.effectmanager.context.EffectContext;
import com.ss.android.ugc.effectmanager.effect.task.result.FavoriteTaskResult;
import com.ss.android.vesdk.runtime.cloudconfig.HttpRequest;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

public class FavoriteTask extends NormalTask {
    private EffectConfiguration mConfiguration;
    private int mCurCnt;
    private EffectContext mEffectContext;
    private List<String> mEffectIds = new ArrayList();
    private boolean mIsFavorite;
    private IJsonConverter mJsonConverter;
    private String mPanel;

    public FavoriteTask(EffectContext effectContext, String str, String str2, Handler handler, List<String> list, boolean z) {
        super(handler, str2, EffectConstants.NETWORK);
        this.mEffectContext = effectContext;
        this.mConfiguration = this.mEffectContext.getEffectConfiguration();
        this.mJsonConverter = this.mEffectContext.getEffectConfiguration().getJsonConverter();
        this.mEffectIds.clear();
        this.mEffectIds.addAll(list);
        this.mIsFavorite = z;
        this.mPanel = str;
        this.mCurCnt = this.mConfiguration.getRetryCount() + 1;
    }

    public FavoriteTask(EffectContext effectContext, String str, String str2, Handler handler, String str3, boolean z) {
        super(handler, str2, EffectConstants.NETWORK);
        this.mEffectContext = effectContext;
        this.mConfiguration = this.mEffectContext.getEffectConfiguration();
        this.mJsonConverter = this.mEffectContext.getEffectConfiguration().getJsonConverter();
        this.mEffectIds.clear();
        this.mEffectIds.add(str3);
        this.mIsFavorite = z;
        this.mPanel = str;
        this.mCurCnt = this.mConfiguration.getRetryCount() + 1;
    }

    public void execute() {
        int i = 0;
        while (i < this.mCurCnt) {
            try {
                this.mConfiguration.getEffectNetWorker().execute(buildRequest(this.mEffectIds, this.mIsFavorite), this.mJsonConverter, BaseNetResponse.class);
                sendMessage(40, new FavoriteTaskResult(true, this.mEffectIds, null));
                return;
            } catch (Exception e) {
                e.printStackTrace();
                if (i == this.mCurCnt - 1) {
                    sendMessage(40, new FavoriteTaskResult(false, this.mEffectIds, new ExceptionResult(e)));
                }
                i++;
            }
        }
    }

    private EffectRequest buildRequest(List<String> list, boolean z) {
        Map hashMap = new HashMap();
        if (!TextUtils.isEmpty(this.mConfiguration.getAccessKey())) {
            hashMap.put(EffectConfiguration.KEY_ACCESS_KEY, this.mConfiguration.getAccessKey());
        }
        if (!TextUtils.isEmpty(this.mConfiguration.getDeviceId())) {
            hashMap.put("device_id", this.mConfiguration.getDeviceId());
        }
        if (!TextUtils.isEmpty(this.mConfiguration.getDeviceType())) {
            hashMap.put(EffectConfiguration.KEY_DEVICE_TYPE, this.mConfiguration.getDeviceType());
        }
        if (!TextUtils.isEmpty(this.mConfiguration.getPlatform())) {
            hashMap.put(EffectConfiguration.KEY_DEVICE_PLATFORM, this.mConfiguration.getPlatform());
        }
        if (!TextUtils.isEmpty(this.mConfiguration.getRegion())) {
            hashMap.put(EffectConfiguration.KEY_REGION, this.mConfiguration.getRegion());
        }
        if (!TextUtils.isEmpty(this.mConfiguration.getSdkVersion())) {
            hashMap.put(EffectConfiguration.KEY_SDK_VERSION, this.mConfiguration.getSdkVersion());
        }
        if (!TextUtils.isEmpty(this.mConfiguration.getAppVersion())) {
            hashMap.put("app_version", this.mConfiguration.getAppVersion());
        }
        if (!TextUtils.isEmpty(this.mConfiguration.getChannel())) {
            hashMap.put("channel", this.mConfiguration.getChannel());
        }
        if (!TextUtils.isEmpty(this.mPanel)) {
            hashMap.put(EffectConfiguration.KEY_PANEL, this.mPanel);
        }
        hashMap.put(EffectConfiguration.KEY_EFFECT_IDS, list);
        hashMap.put("type", Integer.valueOf(z));
        StringBuilder stringBuilder = new StringBuilder();
        stringBuilder.append(this.mEffectContext.getLinkSelector().getBestHostUrl());
        stringBuilder.append(this.mConfiguration.getApiAdress());
        stringBuilder.append(EffectConstants.ROUTE_FAVORITE);
        EffectRequest effectRequest = new EffectRequest("POST", stringBuilder.toString());
        effectRequest.setBodyParams(hashMap);
        effectRequest.setContentType(HttpRequest.CONTENT_TYPE_JSON);
        return effectRequest;
    }
}
