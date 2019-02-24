package com.android.camera.network.live;

import com.android.camera.CameraSettings;
import com.android.camera.Util;
import com.android.camera.fragment.music.LiveMusicInfo;
import com.android.camera.log.Log;
import com.android.camera.network.net.base.ErrorCode;
import java.util.ArrayList;
import java.util.List;
import java.util.Random;
import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;

public class TTLiveMusicResourceRequest extends BaseJsonRequest<List<LiveMusicInfo>> {
    private static final String APP_KEY = "eGlhb21pX3RoaXJkX3BhcnR5";
    private static final String BASE_URL = "https://third-api.amemv.com/aweme/v1/third/hot/music/";

    public TTLiveMusicResourceRequest() {
        super(BASE_URL);
        long currentTimeMillis = System.currentTimeMillis();
        int nextInt = new Random().nextInt(100);
        StringBuilder stringBuilder = new StringBuilder();
        stringBuilder.append(Integer.toString(nextInt));
        stringBuilder.append(Long.toString(currentTimeMillis));
        stringBuilder.append(APP_KEY);
        String md5 = Util.md5(stringBuilder.toString());
        addParam("aid", "2");
        addParam("randnum", Integer.toString(nextInt));
        addParam("time", Long.toString(currentTimeMillis));
        addParam("generate", md5);
    }

    public List<LiveMusicInfo> loadFromCache() throws BaseRequestException {
        String tTLiveMusicJsonCache = CameraSettings.getTTLiveMusicJsonCache();
        StringBuilder stringBuilder = new StringBuilder();
        stringBuilder.append("loadFromCache = ");
        stringBuilder.append(tTLiveMusicJsonCache);
        Log.e("BaseRequest", stringBuilder.toString());
        try {
            return processJson(new JSONObject(tTLiveMusicJsonCache));
        } catch (Throwable e) {
            throw new BaseRequestException(ErrorCode.PARSE_ERROR, e.getMessage(), e);
        }
    }

    public List<LiveMusicInfo> processJson(JSONObject jSONObject) throws BaseRequestException, JSONException {
        if (jSONObject == null || !jSONObject.has("status_code")) {
            throw new BaseRequestException(ErrorCode.PARSE_ERROR, "response has no status_code");
        } else if (jSONObject.getInt("status_code") != 0) {
            throw new BaseRequestException(ErrorCode.SERVER_ERROR, jSONObject.optString("msg"));
        } else if (jSONObject.isNull("music_list")) {
            throw new BaseRequestException(ErrorCode.BODY_EMPTY, "response empty data");
        } else {
            CameraSettings.setTTLiveMusicJsonCache(jSONObject.toString());
            List<LiveMusicInfo> arrayList = new ArrayList();
            JSONArray jSONArray = new JSONArray(jSONObject.optString("music_list"));
            for (int i = 0; i < jSONArray.length(); i++) {
                LiveMusicInfo liveMusicInfo = new LiveMusicInfo();
                JSONObject jSONObject2 = jSONArray.getJSONObject(i);
                liveMusicInfo.mDuration = jSONObject2.getString("duration");
                liveMusicInfo.mPlayUrl = jSONObject2.getJSONObject("play_url").getString("uri");
                liveMusicInfo.mThumbnailUrl = jSONObject2.getJSONObject("cover_thumb").getString("uri");
                liveMusicInfo.mAuthor = jSONObject2.getString("author");
                liveMusicInfo.mTitle = jSONObject2.getString("title");
                arrayList.add(liveMusicInfo);
            }
            return arrayList;
        }
    }
}
