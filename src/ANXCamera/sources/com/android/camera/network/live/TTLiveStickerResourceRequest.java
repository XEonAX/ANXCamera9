package com.android.camera.network.live;

import com.android.camera.network.net.base.ErrorCode;
import com.android.camera.sticker.LiveStickerInfo;
import com.google.android.apps.photos.api.PhotosOemApi;
import com.ss.android.ugc.effectmanager.EffectConfiguration;
import java.util.ArrayList;
import java.util.List;
import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;

public class TTLiveStickerResourceRequest extends BaseJsonRequest<List<LiveStickerInfo>> {
    private static final String ACCESS_KEY = "f5c61e00bf9a11e79515bdb2ca03e788";
    private static final String APP_VERSION = "7.5.0";
    private static final String BASE_URL = "https://effect.snssdk.com/effect/api/v3/effects";
    private static final String DEVICE_ID = "123456";
    private static final String DEVICE_TYPE = "Xiaomi";
    private static final String PLATFORM = "android";
    private static final String SDK_VERSION = "3.0.1";

    public TTLiveStickerResourceRequest(String str, String str2) {
        super(BASE_URL);
        addParam("app_version", APP_VERSION);
        addParam("device_id", DEVICE_ID);
        addParam(EffectConfiguration.KEY_ACCESS_KEY, ACCESS_KEY);
        addParam(EffectConfiguration.KEY_SDK_VERSION, SDK_VERSION);
        addParam("channel", str);
        addParam(EffectConfiguration.KEY_DEVICE_PLATFORM, PLATFORM);
        addParam(EffectConfiguration.KEY_DEVICE_TYPE, DEVICE_TYPE);
        addParam(EffectConfiguration.KEY_PANEL, str2);
    }

    protected List<LiveStickerInfo> processJson(JSONObject jSONObject) throws BaseRequestException, JSONException {
        if (jSONObject == null || !jSONObject.has("status_code")) {
            throw new BaseRequestException(ErrorCode.PARSE_ERROR, "response has no status_code");
        } else if (jSONObject.getInt("status_code") != 0) {
            throw new BaseRequestException(ErrorCode.SERVER_ERROR, jSONObject.optString("message"));
        } else if (jSONObject.isNull(PhotosOemApi.PATH_SPECIAL_TYPE_DATA)) {
            throw new BaseRequestException(ErrorCode.BODY_EMPTY, "response empty data");
        } else {
            jSONObject = jSONObject.optJSONObject(PhotosOemApi.PATH_SPECIAL_TYPE_DATA);
            List<LiveStickerInfo> arrayList = new ArrayList();
            JSONArray jSONArray = jSONObject.getJSONArray("effects");
            if (jSONArray != null) {
                for (int i = 0; i < jSONArray.length(); i++) {
                    JSONObject jSONObject2 = jSONArray.getJSONObject(i);
                    LiveStickerInfo liveStickerInfo = new LiveStickerInfo();
                    liveStickerInfo.id = jSONObject2.optString("id");
                    liveStickerInfo.name = jSONObject2.optString("name");
                    liveStickerInfo.icon = jSONObject2.getJSONObject("icon_url").getJSONArray("url_list").optString(0);
                    liveStickerInfo.url = jSONObject2.getJSONObject("file_url").getJSONArray("url_list").optString(0);
                    liveStickerInfo.hash = jSONObject2.getJSONObject("file_url").optString("uri");
                    arrayList.add(liveStickerInfo);
                }
            }
            return arrayList;
        }
    }
}
