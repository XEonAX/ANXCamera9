package com.ss.android.ugc.effectmanager.effect.task.task;

import android.os.Handler;
import android.text.TextUtils;
import com.ss.android.ugc.effectmanager.EffectConfiguration;
import com.ss.android.ugc.effectmanager.common.EffectConstants;
import com.ss.android.ugc.effectmanager.common.EffectRequest;
import com.ss.android.ugc.effectmanager.common.ErrorConstants;
import com.ss.android.ugc.effectmanager.common.exception.StatusCodeException;
import com.ss.android.ugc.effectmanager.common.task.ExceptionResult;
import com.ss.android.ugc.effectmanager.common.task.NormalTask;
import com.ss.android.ugc.effectmanager.common.utils.NetworkUtils;
import com.ss.android.ugc.effectmanager.context.EffectContext;
import com.ss.android.ugc.effectmanager.effect.model.net.EffectListResponse;
import com.ss.android.ugc.effectmanager.effect.task.result.EffectListTaskResult;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

public class DownloadEffectListByIdsTask extends NormalTask {
    public static final int CODE_CHECK_WHITE_LIST = 1;
    private static final String EXTRA_CHECK_WHITE_LIST = "whitelist_key";
    private EffectConfiguration mConfiguration;
    private EffectContext mContext;
    private int mCurCnt;
    private List<String> mEffectIds;
    private int mExtraParamsCode;

    public DownloadEffectListByIdsTask(EffectContext effectContext, List<String> list, Handler handler, String str) {
        this(effectContext, list, handler, str, 0);
    }

    public DownloadEffectListByIdsTask(EffectContext effectContext, List<String> list, Handler handler, String str, int i) {
        super(handler, str, EffectConstants.NETWORK);
        this.mConfiguration = effectContext.getEffectConfiguration();
        this.mContext = effectContext;
        this.mEffectIds = list;
        this.mCurCnt = effectContext.getEffectConfiguration().getRetryCount();
        this.mExtraParamsCode = i;
    }

    public void execute() {
        while (true) {
            int i = this.mCurCnt;
            this.mCurCnt = i - 1;
            if (i != 0) {
                try {
                    EffectListResponse effectListResponse = (EffectListResponse) this.mConfiguration.getEffectNetWorker().execute(buildRequest(this.mEffectIds), this.mConfiguration.getJsonConverter(), EffectListResponse.class);
                    if (!(effectListResponse == null || effectListResponse.getData() == null)) {
                        if (effectListResponse.getData().size() > 0) {
                            sendMessage(17, new EffectListTaskResult(effectListResponse.getData(), null));
                            return;
                        } else if (this.mCurCnt == 0) {
                            sendMessage(17, new EffectListTaskResult(new ArrayList(), new ExceptionResult((int) ErrorConstants.CODE_INVALID_EFFECT_ID)));
                        }
                    }
                } catch (Exception e) {
                    if (this.mCurCnt == 0 || (e instanceof StatusCodeException)) {
                        sendMessage(17, new EffectListTaskResult(new ArrayList(), new ExceptionResult(e)));
                        e.printStackTrace();
                    }
                }
            } else {
                return;
            }
        }
        sendMessage(17, new EffectListTaskResult(new ArrayList(), new ExceptionResult(e)));
        e.printStackTrace();
    }

    private EffectRequest buildRequest(List<String> list) {
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
        if (!TextUtils.isEmpty(this.mConfiguration.getAppID())) {
            hashMap.put("aid", this.mConfiguration.getAppID());
        }
        if (!TextUtils.isEmpty(this.mConfiguration.getAppLanguage())) {
            hashMap.put(EffectConfiguration.KEY_APP_LANGUAGE, this.mConfiguration.getAppLanguage());
        }
        if (!TextUtils.isEmpty(this.mConfiguration.getSysLanguage())) {
            hashMap.put(EffectConfiguration.KEY_SYS_LANGUAGE, this.mConfiguration.getSysLanguage());
        }
        if ((this.mExtraParamsCode & 1) != 0) {
            hashMap.put(EXTRA_CHECK_WHITE_LIST, "active");
        }
        hashMap.put(EffectConfiguration.KEY_EFFECT_IDS, NetworkUtils.toJson(list));
        StringBuilder stringBuilder = new StringBuilder();
        stringBuilder.append(this.mContext.getLinkSelector().getBestHostUrl());
        stringBuilder.append(this.mConfiguration.getApiAdress());
        stringBuilder.append(EffectConstants.ROUTE_LIST);
        return new EffectRequest("GET", NetworkUtils.buildRequestUrl(hashMap, stringBuilder.toString()));
    }
}
