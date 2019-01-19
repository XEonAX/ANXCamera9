package com.ss.android.ugc.effectmanager.network;

import android.accounts.NetworkErrorException;
import com.ss.android.ugc.effectmanager.common.EffectRequest;
import com.ss.android.ugc.effectmanager.common.ErrorConstants;
import com.ss.android.ugc.effectmanager.common.listener.IEffectNetWorker;
import com.ss.android.ugc.effectmanager.common.listener.IJsonConverter;
import com.ss.android.ugc.effectmanager.common.model.BaseNetResponse;
import com.ss.android.ugc.effectmanager.common.model.NetException;
import com.ss.android.ugc.effectmanager.link.LinkSelector;
import java.io.InputStream;
import org.json.JSONException;

public class EffectNetWorkerWrapper {
    private IEffectNetWorker mIEffectNetWorker;
    private LinkSelector mLinkSelector;

    public EffectNetWorkerWrapper(IEffectNetWorker iEffectNetWorker) {
        this.mIEffectNetWorker = iEffectNetWorker;
    }

    public void setIEffectNetWorker(IEffectNetWorker iEffectNetWorker) {
        this.mIEffectNetWorker = iEffectNetWorker;
    }

    public void setLinkSelector(LinkSelector linkSelector) {
        this.mLinkSelector = linkSelector;
    }

    public InputStream execute(EffectRequest effectRequest) throws Exception {
        InputStream execute = this.mIEffectNetWorker.execute(effectRequest);
        if (execute == null) {
            this.mLinkSelector.onApiError(effectRequest.getUrl());
            if (!this.mLinkSelector.isNetworkAvailable()) {
                throw new Exception(ErrorConstants.EXCEPTION_NO_NETWORK);
            }
        }
        return execute;
    }

    public <T extends BaseNetResponse> BaseNetResponse execute(EffectRequest effectRequest, IJsonConverter iJsonConverter, Class<T> cls) throws Exception {
        InputStream execute = this.mIEffectNetWorker.execute(effectRequest);
        if (execute == null) {
            this.mLinkSelector.onApiError(effectRequest.getUrl());
            if (this.mLinkSelector.isNetworkAvailable()) {
                throw new Exception(ErrorConstants.EXCEPTION_NO_NETWORK);
            }
            throw new NetworkErrorException(ErrorConstants.EXCEPTION_DOWNLOAD_ERROR);
        }
        BaseNetResponse baseNetResponse = (BaseNetResponse) iJsonConverter.convertJsonToObj(execute, cls);
        if (baseNetResponse != null) {
            int status_code = baseNetResponse.getStatus_code();
            if (status_code == 0) {
                return baseNetResponse;
            }
            this.mLinkSelector.onApiError(effectRequest.getUrl());
            throw new NetException(Integer.valueOf(status_code), baseNetResponse.getMessage());
        }
        this.mLinkSelector.onApiError(effectRequest.getUrl());
        throw new JSONException(ErrorConstants.EXCEPTION_JSON_CONVERT);
    }
}
