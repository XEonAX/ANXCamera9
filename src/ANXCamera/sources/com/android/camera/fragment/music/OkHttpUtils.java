package com.android.camera.fragment.music;

import com.android.camera.fragment.live.FragmentLiveMusic.Mp3DownloadCallback;
import com.android.camera.log.Log;
import java.io.IOException;
import java.io.PrintStream;
import java.util.Map;
import java.util.Map.Entry;
import okhttp3.Call;
import okhttp3.Callback;
import okhttp3.OkHttpClient;
import okhttp3.Request.Builder;
import okhttp3.Response;

public class OkHttpUtils {
    private static final String TAG = OkHttpUtils.class.getSimpleName();
    private static final OkHttpClient client = new OkHttpClient();

    public static void get(String str, Map<String, String> map, Callback callback) {
        createGetCall(str, map).enqueue(callback);
    }

    private static Call createGetCall(String str, Map<String, String> map) {
        String buildUrlParams = buildUrlParams(map);
        Builder builder = new Builder().get();
        StringBuilder stringBuilder = new StringBuilder();
        stringBuilder.append(str);
        stringBuilder.append('?');
        stringBuilder.append(buildUrlParams);
        return client.newCall(builder.url(stringBuilder.toString()).build());
    }

    private static String buildUrlParams(Map<String, String> map) {
        if (map == null || map.isEmpty()) {
            return null;
        }
        StringBuilder stringBuilder = new StringBuilder();
        for (Entry entry : map.entrySet()) {
            if (stringBuilder.length() > 0) {
                stringBuilder.append("&");
            }
            stringBuilder.append((String) entry.getKey());
            stringBuilder.append("=");
            stringBuilder.append((String) entry.getValue());
        }
        return stringBuilder.toString();
    }

    public static void downloadMp3Async(String str, final String str2, final Mp3DownloadCallback mp3DownloadCallback) {
        new OkHttpClient().newCall(new Builder().url(str).build()).enqueue(new Callback() {
            public void onFailure(Call call, IOException iOException) {
                String access$000 = OkHttpUtils.TAG;
                StringBuilder stringBuilder = new StringBuilder();
                stringBuilder.append("download mp3 async failed with exception ");
                stringBuilder.append(iOException.getMessage());
                Log.e(access$000, stringBuilder.toString());
                mp3DownloadCallback.onFailed();
            }

            public void onResponse(Call call, Response response) throws IOException {
                PrintStream printStream = new PrintStream(str2);
                byte[] bytes = response.body().bytes();
                printStream.write(bytes, 0, bytes.length);
                printStream.close();
                mp3DownloadCallback.onCompleted();
            }
        });
    }
}
