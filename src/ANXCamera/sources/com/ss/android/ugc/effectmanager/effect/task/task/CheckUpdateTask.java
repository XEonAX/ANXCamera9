package com.ss.android.ugc.effectmanager.effect.task.task;

import android.os.Handler;
import android.text.TextUtils;
import com.ss.android.ugc.effectmanager.EffectConfiguration;
import com.ss.android.ugc.effectmanager.common.EffectConstants;
import com.ss.android.ugc.effectmanager.common.EffectRequest;
import com.ss.android.ugc.effectmanager.common.ErrorConstants;
import com.ss.android.ugc.effectmanager.common.listener.ICache;
import com.ss.android.ugc.effectmanager.common.task.ExceptionResult;
import com.ss.android.ugc.effectmanager.common.task.NormalTask;
import com.ss.android.ugc.effectmanager.common.utils.NetworkUtils;
import com.ss.android.ugc.effectmanager.context.EffectContext;
import com.ss.android.ugc.effectmanager.effect.model.EffectChannelModel;
import com.ss.android.ugc.effectmanager.effect.model.net.EffectCheckUpdateResponse;
import com.ss.android.ugc.effectmanager.effect.task.result.EffectCheckUpdateResult;
import java.io.InputStream;
import java.util.HashMap;
import java.util.Map;

public class CheckUpdateTask extends NormalTask {
    private EffectChannelModel mCachedChannelModel;
    private EffectConfiguration mConfiguration = this.mEffectContext.getEffectConfiguration();
    private int mCurCnt;
    private EffectContext mEffectContext;
    private String mPanel;

    public CheckUpdateTask(EffectContext effectContext, String str, Handler handler, String str2) {
        super(handler, str, EffectConstants.NETWORK);
        this.mEffectContext = effectContext;
        this.mPanel = str2;
        this.mCurCnt = this.mConfiguration.getRetryCount() + 1;
    }

    public void execute() {
        if (checkedChannelCache()) {
            EffectRequest buildRequest = buildRequest();
            while (true) {
                int i = this.mCurCnt;
                this.mCurCnt = i - 1;
                if (i == 0) {
                    return;
                }
                if (isCanceled()) {
                    sendMessage(13, new EffectCheckUpdateResult(this.mPanel, false, new ExceptionResult((int) ErrorConstants.CODE_CANCEL_DOWNLOAD)));
                    return;
                }
                try {
                    EffectCheckUpdateResponse effectCheckUpdateResponse = (EffectCheckUpdateResponse) this.mConfiguration.getEffectNetWorker().execute(buildRequest, this.mConfiguration.getJsonConverter(), EffectCheckUpdateResponse.class);
                    if (effectCheckUpdateResponse != null) {
                        sendMessage(13, new EffectCheckUpdateResult(this.mPanel, effectCheckUpdateResponse.isUpdated(), null));
                        return;
                    } else if (this.mCurCnt == 0) {
                        sendMessage(13, new EffectCheckUpdateResult(this.mPanel, false, new ExceptionResult((int) ErrorConstants.CODE_DOWNLOAD_ERROR)));
                    }
                } catch (Exception e) {
                    if (this.mCurCnt == 0) {
                        e.printStackTrace();
                        sendMessage(13, new EffectCheckUpdateResult(this.mPanel, false, new ExceptionResult(e)));
                    }
                }
            }
        } else {
            sendMessage(13, new EffectCheckUpdateResult(this.mPanel, true, null));
        }
    }

    private boolean checkedChannelCache() {
        ICache cache = this.mConfiguration.getCache();
        StringBuilder stringBuilder = new StringBuilder();
        stringBuilder.append(EffectConstants.KEY_EFFECT_CHANNEL);
        stringBuilder.append(this.mPanel);
        InputStream queryToStream = cache.queryToStream(stringBuilder.toString());
        if (queryToStream == null) {
            return false;
        }
        this.mCachedChannelModel = (EffectChannelModel) this.mConfiguration.getJsonConverter().convertJsonToObj(queryToStream, EffectChannelModel.class);
        return true;
    }

    private EffectRequest buildRequest() {
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
        if (!TextUtils.isEmpty(this.mPanel)) {
            hashMap.put(EffectConfiguration.KEY_PANEL, this.mPanel);
        }
        if (this.mCachedChannelModel != null) {
            hashMap.put("version", this.mCachedChannelModel.getVersion());
        }
        StringBuilder stringBuilder = new StringBuilder();
        stringBuilder.append(this.mEffectContext.getLinkSelector().getBestHostUrl());
        stringBuilder.append(this.mConfiguration.getApiAdress());
        stringBuilder.append(EffectConstants.ROUTE_CHECK_UPDATE);
        return new EffectRequest("GET", NetworkUtils.buildRequestUrl(hashMap, stringBuilder.toString()));
    }
}
