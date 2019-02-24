package com.android.camera.network.resource;

import com.android.camera.log.Log;
import com.android.camera.network.download.GalleryDownloadManager;
import com.android.camera.network.download.GalleryDownloadManager.OnCompleteListener;
import com.android.camera.network.download.Request;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

public class LiveResourceDownloadManager {
    private static final String TAG = "LiveResourceDownloadManager";
    private Map<String, Integer> mDownloadState;
    private List<OnLiveDownloadListener> mListeners;
    private OnCompleteListener mOnCompleteListener;
    private Object object;

    private static class Instance {
        public static LiveResourceDownloadManager mInstance = new LiveResourceDownloadManager();

        private Instance() {
        }
    }

    /* synthetic */ LiveResourceDownloadManager(AnonymousClass1 anonymousClass1) {
        this();
    }

    public static LiveResourceDownloadManager getInstance() {
        return Instance.mInstance;
    }

    private LiveResourceDownloadManager() {
        this.mDownloadState = new HashMap();
        this.object = new Object();
        this.mListeners = new ArrayList();
        this.mOnCompleteListener = new OnCompleteListener() {
            public void onRequestComplete(Request request, int i) {
                String str = LiveResourceDownloadManager.TAG;
                StringBuilder stringBuilder = new StringBuilder();
                stringBuilder.append("download finish ");
                stringBuilder.append(i);
                Log.v(str, stringBuilder.toString());
                String tag = request.getTag();
                synchronized (LiveResourceDownloadManager.this.object) {
                    LiveResourceDownloadManager.this.mDownloadState.remove(tag);
                }
                if (i == 0) {
                    LiveResourceDownloadManager.this.dispatchListener(tag, 3);
                } else {
                    LiveResourceDownloadManager.this.dispatchListener(tag, 4);
                }
            }
        };
    }

    public <T extends LiveResource> void download(T t, LiveDownloadHelper<T> liveDownloadHelper) {
        String str = t.id;
        String str2 = TAG;
        StringBuilder stringBuilder = new StringBuilder();
        stringBuilder.append("downloading ");
        stringBuilder.append(str);
        Log.v(str2, stringBuilder.toString());
        if (liveDownloadHelper.isDownloaded(t)) {
            String str3 = TAG;
            StringBuilder stringBuilder2 = new StringBuilder();
            stringBuilder2.append("file downloaded ");
            stringBuilder2.append(str);
            Log.v(str3, stringBuilder2.toString());
            dispatchListener(str, 1);
            return;
        }
        Request createDownloadRequest = liveDownloadHelper.createDownloadRequest(t);
        createDownloadRequest.setAllowedOverMetered(true);
        GalleryDownloadManager.INSTANCE.enqueue(createDownloadRequest, this.mOnCompleteListener);
    }

    public void addDownloadListener(OnLiveDownloadListener onLiveDownloadListener) {
        this.mListeners.add(onLiveDownloadListener);
    }

    public void removeDownloadListener(OnLiveDownloadListener onLiveDownloadListener) {
        this.mListeners.remove(onLiveDownloadListener);
    }

    public int getDownloadState(String str) {
        if (this.mDownloadState.containsKey(str)) {
            return ((Integer) this.mDownloadState.get(str)).intValue();
        }
        return 0;
    }

    private void dispatchListener(String str, int i) {
        for (OnLiveDownloadListener onFinish : this.mListeners) {
            onFinish.onFinish(str, i);
        }
    }
}
