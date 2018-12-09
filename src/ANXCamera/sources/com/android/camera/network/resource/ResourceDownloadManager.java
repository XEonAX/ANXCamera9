package com.android.camera.network.resource;

import android.net.Uri;
import android.util.LongSparseArray;
import com.android.camera.log.Log;
import com.android.camera.network.download.GalleryDownloadManager;
import com.android.camera.network.download.GalleryDownloadManager.OnCompleteListener;
import com.android.camera.network.download.Request;
import com.android.camera.network.download.Verifier.Sha1;
import com.android.camera.network.net.BaseGalleryRequest;
import com.android.camera.network.net.base.ErrorCode;
import com.android.camera.network.net.base.ResponseListener;
import com.android.camera.network.resource.RequestContracts.Download;
import java.io.File;
import java.util.ArrayList;
import java.util.List;
import org.json.JSONObject;

public class ResourceDownloadManager {
    private static final String TAG = "ResourceDownloadManager";
    private static ResourceDownloadManager mInstance;
    private LongSparseArray<Integer> mDownloadState = new LongSparseArray();
    private List<OnDownloadListener> mListeners = new ArrayList();
    private OnCompleteListener mOnCompleteListener = new OnCompleteListener() {
        public void onRequestComplete(Request request, int i) {
            String str = ResourceDownloadManager.TAG;
            StringBuilder stringBuilder = new StringBuilder();
            stringBuilder.append("download finish ");
            stringBuilder.append(i);
            Log.v(str, stringBuilder.toString());
            long parseLong = Long.parseLong(request.getTag());
            synchronized (ResourceDownloadManager.this.object) {
                ResourceDownloadManager.this.mDownloadState.remove(parseLong);
            }
            if (i == 0) {
                ResourceDownloadManager.this.dispatchListener(parseLong, 3);
            } else {
                ResourceDownloadManager.this.dispatchListener(parseLong, 4);
            }
        }
    };
    private Object object = new Object();

    public static ResourceDownloadManager getInstance() {
        if (mInstance == null) {
            synchronized (ResourceDownloadManager.class) {
                if (mInstance == null) {
                    mInstance = new ResourceDownloadManager();
                }
            }
        }
        return mInstance;
    }

    private ResourceDownloadManager() {
    }

    public void download(Resource resource, DownloadHelper downloadHelper) {
        final long j = resource.id;
        String str = TAG;
        StringBuilder stringBuilder = new StringBuilder();
        stringBuilder.append("downloading ");
        stringBuilder.append(j);
        Log.v(str, stringBuilder.toString());
        final File file = new File(downloadHelper.getDownloadPath(resource));
        if (file.exists()) {
            String str2 = TAG;
            StringBuilder stringBuilder2 = new StringBuilder();
            stringBuilder2.append("file downloaded ");
            stringBuilder2.append(file);
            Log.v(str2, stringBuilder2.toString());
            dispatchListener(j, 1);
        }
        BaseGalleryRequest baseGalleryRequest = new BaseGalleryRequest(0, Download.URL);
        baseGalleryRequest.addParam("id", String.valueOf(j));
        baseGalleryRequest.execute(new ResponseListener() {
            public void onResponse(Object... objArr) {
                try {
                    JSONObject jSONObject = (JSONObject) objArr[0];
                    String string = jSONObject.getString(Download.JSON_KEY_URL);
                    String string2 = jSONObject.getString(Download.JSON_KEY_SHA1);
                    Log.v(ResourceDownloadManager.TAG, String.format("download %s, %s", new Object[]{string, string2}));
                    Request request = new Request(Long.toString(j), Uri.parse(string), file);
                    request.setVerifier(new Sha1(string2));
                    synchronized (this) {
                        ResourceDownloadManager.this.mDownloadState.put(j, Integer.valueOf(2));
                    }
                    GalleryDownloadManager.INSTANCE.enqueue(request, ResourceDownloadManager.this.mOnCompleteListener);
                } catch (Throwable e) {
                    Log.w(ResourceDownloadManager.TAG, e);
                    ResourceDownloadManager.this.dispatchListener(j, 4);
                }
            }

            public void onResponseError(ErrorCode errorCode, String str, Object obj) {
                ResourceDownloadManager.this.dispatchListener(j, 4);
            }
        });
    }

    public void addDownloadListener(OnDownloadListener onDownloadListener) {
        this.mListeners.add(onDownloadListener);
    }

    public void removeDownloadListener(OnDownloadListener onDownloadListener) {
        this.mListeners.remove(onDownloadListener);
    }

    public int getDownloadState(long j) {
        return ((Integer) this.mDownloadState.get(j, Integer.valueOf(0))).intValue();
    }

    private void dispatchListener(long j, int i) {
        for (OnDownloadListener onFinish : this.mListeners) {
            onFinish.onFinish(j, i);
        }
    }
}
