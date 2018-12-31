package com.android.camera;

import android.content.ContentResolver;
import android.net.Uri;
import android.os.AsyncTask;
import com.android.camera.data.DataRepository;
import com.android.camera.log.Log;
import com.android.camera.module.Module;
import com.android.camera.protocol.ModeCoordinatorImpl;
import com.android.camera.protocol.ModeProtocol.ActionProcessing;
import java.io.File;

public class ThumbnailUpdater {
    private static final String TAG = "ThumbnailUpdater";
    private ActivityBase mActivityBase;
    private ContentResolver mContentResolver = this.mActivityBase.getContentResolver();
    private AsyncTask<Void, Void, Thumbnail> mLoadThumbnailTask;
    private Thumbnail mThumbnail;

    private class LoadThumbnailTask extends AsyncTask<Void, Void, Thumbnail> {
        private boolean mLookAtCache;

        public LoadThumbnailTask(boolean z) {
            this.mLookAtCache = z;
        }

        protected Thumbnail doInBackground(Void... voidArr) {
            String str = ThumbnailUpdater.TAG;
            StringBuilder stringBuilder = new StringBuilder();
            stringBuilder.append("LoadThumbnailTask execute, lookatcache=");
            stringBuilder.append(this.mLookAtCache);
            Log.d(str, stringBuilder.toString());
            if (isCancelled()) {
                return null;
            }
            Thumbnail thumbnail;
            if (ThumbnailUpdater.this.mThumbnail != null) {
                Uri uri = ThumbnailUpdater.this.mThumbnail.getUri();
                if (Util.isUriValid(uri, ThumbnailUpdater.this.mContentResolver) && uri.equals(Thumbnail.getLastThumbnailUri(ThumbnailUpdater.this.mContentResolver))) {
                    return ThumbnailUpdater.this.mThumbnail;
                }
                Module currentModule = ThumbnailUpdater.this.mActivityBase.getCurrentModule();
                if (currentModule != null && currentModule.shouldReleaseLater()) {
                    return ThumbnailUpdater.this.mThumbnail;
                }
            }
            if (((ThumbnailUpdater.this.mActivityBase.startFromSecureKeyguard() || ThumbnailUpdater.this.mActivityBase.isGalleryLocked()) && (ThumbnailUpdater.this.mActivityBase.getSecureUriList() == null || ThumbnailUpdater.this.mActivityBase.getSecureUriList().size() <= 0)) || !this.mLookAtCache) {
                thumbnail = null;
            } else {
                thumbnail = Thumbnail.getLastThumbnailFromFile(ThumbnailUpdater.this.mActivityBase.getFilesDir(), ThumbnailUpdater.this.mContentResolver);
            }
            if (isCancelled()) {
                return null;
            }
            Uri uri2;
            int lastThumbnailFromUriList;
            if (thumbnail != null) {
                uri2 = thumbnail.getUri();
            } else {
                uri2 = null;
            }
            Thumbnail[] thumbnailArr = new Thumbnail[1];
            String str2;
            StringBuilder stringBuilder2;
            if (ThumbnailUpdater.this.mActivityBase.startFromSecureKeyguard() || ThumbnailUpdater.this.mActivityBase.isGalleryLocked()) {
                lastThumbnailFromUriList = Thumbnail.getLastThumbnailFromUriList(ThumbnailUpdater.this.mContentResolver, thumbnailArr, ThumbnailUpdater.this.mActivityBase.getSecureUriList(), uri2);
                str2 = ThumbnailUpdater.TAG;
                stringBuilder2 = new StringBuilder();
                stringBuilder2.append("get last thumbnail from uri list, code is ");
                stringBuilder2.append(lastThumbnailFromUriList);
                Log.d(str2, stringBuilder2.toString());
            } else {
                lastThumbnailFromUriList = Thumbnail.getLastThumbnailFromContentResolver(ThumbnailUpdater.this.mContentResolver, thumbnailArr, uri2);
                str2 = ThumbnailUpdater.TAG;
                stringBuilder2 = new StringBuilder();
                stringBuilder2.append("get last thumbnail from provider, code is ");
                stringBuilder2.append(lastThumbnailFromUriList);
                Log.d(str2, stringBuilder2.toString());
            }
            switch (lastThumbnailFromUriList) {
                case -1:
                    return thumbnail;
                case 0:
                    return null;
                case 1:
                    return thumbnailArr[0];
                case 2:
                    cancel(true);
                    return null;
                default:
                    return null;
            }
        }

        protected void onPostExecute(Thumbnail thumbnail) {
            String str = ThumbnailUpdater.TAG;
            StringBuilder stringBuilder = new StringBuilder();
            stringBuilder.append("LoadThumbnailTask onPostExecute, thumbnai is ");
            stringBuilder.append(thumbnail);
            stringBuilder.append(isCancelled() ? ", canceled" : ", not canceled");
            Log.d(str, stringBuilder.toString());
            if (!isCancelled()) {
                ThumbnailUpdater.this.setThumbnail(thumbnail, true, false);
            }
        }
    }

    private class SaveThumbnailTask extends AsyncTask<Thumbnail, Void, Void> {
        private SaveThumbnailTask() {
        }

        /* synthetic */ SaveThumbnailTask(ThumbnailUpdater thumbnailUpdater, AnonymousClass1 anonymousClass1) {
            this();
        }

        protected Void doInBackground(Thumbnail... thumbnailArr) {
            File filesDir = ThumbnailUpdater.this.mActivityBase.getFilesDir();
            for (Thumbnail saveLastThumbnailToFile : thumbnailArr) {
                saveLastThumbnailToFile.saveLastThumbnailToFile(filesDir);
            }
            return null;
        }
    }

    public ThumbnailUpdater(ActivityBase activityBase) {
        this.mActivityBase = activityBase;
    }

    public Thumbnail getThumbnail() {
        return this.mThumbnail;
    }

    public void setThumbnail(Thumbnail thumbnail, boolean z, boolean z2) {
        this.mThumbnail = thumbnail;
        if (z) {
            updateThumbnailView(z2);
        }
    }

    public void updatePreviewThumbnailUri(Uri uri) {
        if (this.mThumbnail != null) {
            this.mThumbnail.setUri(uri);
        }
    }

    public void updateThumbnailView(final boolean z) {
        this.mActivityBase.runOnUiThread(new Runnable() {
            public void run() {
                if (!DataRepository.dataItemGlobal().getStartFromKeyguard() || ThumbnailUpdater.this.mActivityBase.startFromSecureKeyguard()) {
                    ActionProcessing actionProcessing = (ActionProcessing) ModeCoordinatorImpl.getInstance().getAttachProtocol(162);
                    if (actionProcessing == null) {
                        Log.e(ThumbnailUpdater.TAG, "won't update thumbnail", new RuntimeException());
                    } else {
                        actionProcessing.updateThumbnail(ThumbnailUpdater.this.mThumbnail, z);
                    }
                }
            }
        });
    }

    public void cancelTask() {
        if (this.mLoadThumbnailTask != null) {
            this.mLoadThumbnailTask.cancel(true);
            this.mLoadThumbnailTask = null;
        }
    }

    public void getLastThumbnail() {
        String str = TAG;
        StringBuilder stringBuilder = new StringBuilder();
        stringBuilder.append("getLastThumbnail, current thumbnailtask is ");
        stringBuilder.append(this.mLoadThumbnailTask);
        Log.d(str, stringBuilder.toString());
        if (this.mLoadThumbnailTask != null) {
            this.mLoadThumbnailTask.cancel(true);
        }
        this.mLoadThumbnailTask = new LoadThumbnailTask(true).execute(new Void[0]);
    }

    public void getLastThumbnailUncached() {
        if (this.mLoadThumbnailTask != null) {
            this.mLoadThumbnailTask.cancel(true);
        }
        this.mLoadThumbnailTask = new LoadThumbnailTask(false).execute(new Void[0]);
    }

    public void saveThumbnailToFile() {
        if (this.mThumbnail != null && !this.mThumbnail.fromFile()) {
            new SaveThumbnailTask(this, null).execute(new Thumbnail[]{this.mThumbnail});
        }
    }
}
