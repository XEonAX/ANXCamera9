package com.android.camera.network.net;

import com.android.camera.fragment.CtaNoticeFragment.CTA;
import com.android.camera.log.Log;
import com.android.camera.network.net.base.ErrorCode;
import com.android.camera.network.net.base.RequestError;
import com.android.camera.network.net.json.BaseJsonRequest;
import com.android.camera.network.util.NetworkUtils;
import org.json.JSONObject;

public class BaseGalleryRequest extends BaseJsonRequest<GalleryResponse> {
    private static final String RESPONSE_CODE_TAG = "code";
    private static final String RESPONSE_DATA_TAG = "data";
    private static final String RESPONSE_DESCRIPTION_TAG = "description";
    private static final String RESPONSE_LAST_PAGE_TAG = "lastPage";
    private static final String RESPONSE_SYNC_TAG = "syncTag";
    private static final String RESPONSE_SYNC_TOKEN_TAG = "syncToken";
    private static final String TAG = "BaseGalleryRequest";

    public BaseGalleryRequest(int i) {
        this(i, null);
    }

    public BaseGalleryRequest(int i, String str) {
        super(i, str);
    }

    protected final void handleResponse(JSONObject jSONObject) {
        if (jSONObject != null) {
            try {
                if (jSONObject.has(RESPONSE_CODE_TAG)) {
                    if (jSONObject.getInt(RESPONSE_CODE_TAG) != ErrorCode.SUCCESS.CODE) {
                        handleError(ErrorCode.SERVER_ERROR, jSONObject.optString(RESPONSE_DESCRIPTION_TAG), jSONObject);
                        return;
                    } else if (jSONObject.isNull("data")) {
                        handleError(ErrorCode.BODY_EMPTY, "response empty data", jSONObject);
                        return;
                    } else {
                        GalleryResponse galleryResponse = new GalleryResponse();
                        galleryResponse.data = jSONObject.optJSONObject("data");
                        galleryResponse.syncTag = jSONObject.optString(RESPONSE_SYNC_TAG, null);
                        galleryResponse.syncToken = jSONObject.optString("syncToken", null);
                        galleryResponse.isLastPage = jSONObject.optBoolean("lastPage", true);
                        onRequestSuccess(galleryResponse);
                        return;
                    }
                }
            } catch (Exception e) {
                handleError(ErrorCode.HANDLE_ERROR, e.getMessage(), e);
                return;
            }
        }
        handleError(ErrorCode.PARSE_ERROR, "response has no code", null);
    }

    protected void onRequestSuccess(GalleryResponse galleryResponse) throws Exception {
        onRequestSuccess(galleryResponse.data);
    }

    protected void onRequestSuccess(JSONObject jSONObject) throws Exception {
        deliverResponse(jSONObject);
    }

    public final void execute() {
        if (checkExecuteCondition()) {
            super.execute();
        }
    }

    public final Object[] executeSync() throws RequestError {
        if (checkExecuteCondition()) {
            return super.executeSync();
        }
        throw this.mRequestError;
    }

    private boolean checkExecuteCondition() {
        if (!CTA.canConnectNetwork()) {
            handleError(ErrorCode.NETWORK_NOT_CONNECTED, "CTA not confirmed.", null);
            return false;
        } else if (isUseCache() || NetworkUtils.isNetworkConnected()) {
            return true;
        } else {
            handleError(ErrorCode.NETWORK_NOT_CONNECTED, "Network not connected.", null);
            return false;
        }
    }

    public void onRequestError(ErrorCode errorCode, String str, Object obj) {
        deliverError(errorCode, str, obj);
        Log.w(TAG, String.format("%s onRequestError:%s | %s ", new Object[]{getClass().getSimpleName(), errorCode, str}));
        if (obj instanceof Throwable) {
            Log.w(TAG, (Throwable) obj);
        } else if (obj != null) {
            Log.d(TAG, obj.toString());
        }
    }
}
