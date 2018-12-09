package com.android.camera.network.resource;

import com.android.camera.network.net.BaseGalleryRequest;
import com.android.camera.network.net.HttpManager;
import com.android.camera.network.net.base.ErrorCode;
import com.android.camera.network.resource.RequestContracts.Info;
import com.android.camera.sticker.StickerInfo;
import com.google.gson.JsonParseException;
import java.util.ArrayList;
import java.util.List;
import org.json.JSONArray;
import org.json.JSONObject;

public class StickerResourceRequest extends BaseGalleryRequest {
    private static final long EXPIRE_TIME = 147122892800L;
    private static final long SOFT_EXPIRE_TIME = 86400000;
    private static final String STICKER_LIST_DEFAULT = "sticker_list_default";
    private static final long STICKER_PARENT_ID = 7326868816920608L;

    public StickerResourceRequest() {
        super(0, Info.URL);
        addParam("id", Long.toString(STICKER_PARENT_ID));
        setUseCache(true);
        setCacheExpires(System.currentTimeMillis() + EXPIRE_TIME);
        setCacheSoftTtl(System.currentTimeMillis() + SOFT_EXPIRE_TIME);
        HttpManager.getInstance().putDefaultCache(getCacheKey(), STICKER_LIST_DEFAULT);
    }

    protected void onRequestSuccess(JSONObject jSONObject) throws Exception {
        try {
            List arrayList = new ArrayList();
            JSONArray jSONArray = jSONObject.getJSONArray(Info.JSON_KEY_ITEMS);
            long optLong = jSONObject.optLong(Info.EXPIRE_AT);
            if (optLong != 0) {
                setCacheSoftTtl(optLong);
            }
            if (jSONArray != null) {
                for (int i = 0; i < jSONArray.length(); i++) {
                    JSONObject jSONObject2 = jSONArray.getJSONObject(i);
                    StickerInfo stickerInfo = new StickerInfo();
                    stickerInfo.id = jSONObject2.optLong("id");
                    stickerInfo.icon = jSONObject2.optString(Info.JSON_KEY_ICON);
                    stickerInfo.extra = jSONObject2.optString(Info.JSON_KEY_EXTRA);
                    arrayList.add(stickerInfo);
                }
            }
            deliverResponse(arrayList);
        } catch (JsonParseException e) {
            e.printStackTrace();
            deliverError(ErrorCode.PARSE_ERROR, e.getMessage(), jSONObject);
        } catch (Exception e2) {
            e2.printStackTrace();
            deliverError(ErrorCode.HANDLE_ERROR, e2.getMessage(), jSONObject);
        }
    }
}
