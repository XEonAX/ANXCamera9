package com.android.camera.network.download;

import android.os.AsyncTask;
import com.android.camera.log.Log;
import com.android.camera.network.net.base.HTTP;
import com.ss.android.vesdk.runtime.cloudconfig.HttpRequest;
import java.io.File;
import java.io.FileOutputStream;
import java.io.OutputStream;
import java.net.HttpURLConnection;
import java.security.MessageDigest;
import java.util.concurrent.Executor;
import java.util.concurrent.TimeUnit;

class DownloadTask {
    private static final int BUFFER_SIZE = 8192;
    private static final int CONNECTION_TIMEOUT = 10000;
    private static final int READ_TIMEOUT = 15000;
    private static final long RETRY_INTERVAL_MILLI = TimeUnit.SECONDS.toMillis(10);
    private static final String TAG = "DownloadTask";
    private CoreTask mCoreTask;
    private OnCompleteListener mOnCompleteListener;
    private OnProgressListener mOnProgressListener;
    private TaskInfo mTaskInfo;

    private class CoreTask extends AsyncTask<Void, Integer, Integer> {
        private Request mRequest;

        CoreTask(Request request) {
            this.mRequest = request;
        }

        protected Integer doInBackground(Void... voidArr) {
            return Integer.valueOf(DownloadTask.this.performRequest(this.mRequest));
        }

        protected void onPostExecute(Integer num) {
            Log.d(DownloadTask.TAG, String.format("process download finish %d", new Object[]{num}));
            if (DownloadTask.this.mOnCompleteListener != null) {
                DownloadTask.this.mOnCompleteListener.onRequestComplete(this.mRequest, num.intValue());
            }
        }

        protected void onProgressUpdate(Integer... numArr) {
            if (DownloadTask.this.mOnProgressListener != null) {
                DownloadTask.this.mOnProgressListener.onProgressUpdate(this.mRequest, numArr[0].intValue());
            }
        }

        protected void onCancelled(Integer num) {
            int intValue = num != null ? num.intValue() : -2;
            Log.d(DownloadTask.TAG, String.format("process download finish %d", new Object[]{Integer.valueOf(intValue)}));
            if (DownloadTask.this.mOnCompleteListener != null) {
                DownloadTask.this.mOnCompleteListener.onRequestComplete(this.mRequest, 5);
            }
        }

        void publishProgress(int i) {
            super.publishProgress(new Integer[]{Integer.valueOf(i)});
        }
    }

    private interface InternalConstants {
        public static final int RESULT_HTTP_TIMEOUT = 12;
        public static final int RESULT_NONE_RESULT = -2;
    }

    interface OnCompleteListener {
        void onRequestComplete(Request request, int i);
    }

    interface OnProgressListener {
        void onProgressUpdate(Request request, int i);
    }

    interface OpenConstants {
        public static final int RESULT_CANCELLED = 5;
        public static final int RESULT_DOWNLOAD_FILE_ERROR = 9;
        public static final int RESULT_HTTP_ERROR = 7;
        public static final int RESULT_HTTP_SERVER_ERROR = 8;
        public static final int RESULT_ILLEGAL_ACTIVE_NETWORK = 3;
        public static final int RESULT_NETWORK_DENIED = 2;
        public static final int RESULT_NO_NETWORK = 1;
        public static final int RESULT_OPEN_FILE_FAILED = 4;
        public static final int RESULT_SUCCESSFUL = 0;
        public static final int RESULT_UNKNOWN = 11;
        public static final int RESULT_VALIDATION_FAILED = 6;
    }

    private static class TaskInfo {
        long mContentLength;
        MessageDigest mDigest;
        long mDownloadSize;

        private TaskInfo() {
        }
    }

    DownloadTask(Request request, OnCompleteListener onCompleteListener) {
        this.mCoreTask = new CoreTask(request);
        this.mOnCompleteListener = onCompleteListener;
    }

    DownloadTask(Request request) {
        this.mCoreTask = new CoreTask(request);
    }

    boolean cancel(boolean z) {
        return this.mCoreTask.cancel(z);
    }

    void execute(Executor executor) {
        this.mCoreTask.executeOnExecutor(executor, new Void[0]);
    }

    int execute() {
        return this.mCoreTask.doInBackground(new Void[0]).intValue();
    }

    void setOnProgressListener(OnProgressListener onProgressListener) {
        this.mOnProgressListener = onProgressListener;
    }

    OnProgressListener getOnProgressListener() {
        return this.mOnProgressListener;
    }

    private int performRequest(Request request) {
        int process;
        Log.d(TAG, String.format("start to download request[%s, %s, %s]", new Object[]{request.getTag(), request.getUri(), request.getDestination()}));
        preRequest();
        int maxRetryTimes = request.getMaxRetryTimes();
        int i = 0;
        do {
            process = process(request);
            if (!isRetryState(process)) {
                break;
            }
            Log.d(TAG, String.format("retry for %d", new Object[]{Integer.valueOf(process)}));
            try {
                Thread.sleep(RETRY_INTERVAL_MILLI, 0);
                i++;
            } catch (InterruptedException e) {
                process = 5;
            }
        } while (i <= maxRetryTimes);
        return postRequest(process);
    }

    /* JADX WARNING: Removed duplicated region for block: B:94:0x014b A:{SYNTHETIC, Splitter: B:94:0x014b} */
    /* JADX WARNING: Removed duplicated region for block: B:99:0x0157 A:{SYNTHETIC, Splitter: B:99:0x0157} */
    /* JADX WARNING: Removed duplicated region for block: B:80:0x012d A:{SYNTHETIC, Splitter: B:80:0x012d} */
    /* JADX WARNING: Removed duplicated region for block: B:85:0x0139 A:{SYNTHETIC, Splitter: B:85:0x0139} */
    /* JADX WARNING: Removed duplicated region for block: B:94:0x014b A:{SYNTHETIC, Splitter: B:94:0x014b} */
    /* JADX WARNING: Removed duplicated region for block: B:99:0x0157 A:{SYNTHETIC, Splitter: B:99:0x0157} */
    /* JADX WARNING: Removed duplicated region for block: B:80:0x012d A:{SYNTHETIC, Splitter: B:80:0x012d} */
    /* JADX WARNING: Removed duplicated region for block: B:85:0x0139 A:{SYNTHETIC, Splitter: B:85:0x0139} */
    /* JADX WARNING: Removed duplicated region for block: B:94:0x014b A:{SYNTHETIC, Splitter: B:94:0x014b} */
    /* JADX WARNING: Removed duplicated region for block: B:99:0x0157 A:{SYNTHETIC, Splitter: B:99:0x0157} */
    private int process(com.android.camera.network.download.Request r8) {
        /*
        r7 = this;
        r0 = r8.getUri();
        r1 = r8.getNetworkType();
        r0 = com.android.camera.network.download.ConnectionHelper.open(r0, r1);
        r1 = r0.value;
        r1 = (java.net.HttpURLConnection) r1;
        r2 = 0;
        if (r1 != 0) goto L_0x0027;
    L_0x0013:
        r8 = "DownloadTask";
        r1 = "open connection failed";
        r2 = new java.lang.Object[r2];
        r1 = java.lang.String.format(r1, r2);
        com.android.camera.log.Log.d(r8, r1);
        r8 = r0.reason;
        r8 = translateErrorCode(r8);
        return r8;
        r0 = 0;
        r7.configure(r1);	 Catch:{ IOException -> 0x011f, all -> 0x011b }
        r1.connect();	 Catch:{ IOException -> 0x011f, all -> 0x011b }
        r3 = r1.getResponseCode();	 Catch:{ IOException -> 0x011f, all -> 0x011b }
        r3 = translateResponseCode(r3);	 Catch:{ IOException -> 0x011f, all -> 0x011b }
        if (r3 == 0) goto L_0x004e;
    L_0x003a:
        r8 = "DownloadTask";
        r4 = "response code not valid";
        r2 = new java.lang.Object[r2];	 Catch:{ IOException -> 0x011f, all -> 0x011b }
        r2 = java.lang.String.format(r4, r2);	 Catch:{ IOException -> 0x011f, all -> 0x011b }
        com.android.camera.log.Log.d(r8, r2);	 Catch:{ IOException -> 0x011f, all -> 0x011b }
        r1.disconnect();
        return r3;
    L_0x004e:
        r7.processHeader(r1);	 Catch:{ IOException -> 0x011f, all -> 0x011b }
        r3 = r1.getInputStream();	 Catch:{ IOException -> 0x011f, all -> 0x011b }
        r4 = r8.getDestination();	 Catch:{ IOException -> 0x0117, all -> 0x0114 }
        r4 = openOutputStream(r4);	 Catch:{ IOException -> 0x0117, all -> 0x0114 }
        if (r4 != 0) goto L_0x008f;
    L_0x005f:
        r8 = "DownloadTask";
        r0 = "open output stream failed";
        r2 = new java.lang.Object[r2];	 Catch:{ IOException -> 0x008c, all -> 0x0089 }
        r0 = java.lang.String.format(r0, r2);	 Catch:{ IOException -> 0x008c, all -> 0x0089 }
        com.android.camera.log.Log.d(r8, r0);	 Catch:{ IOException -> 0x008c, all -> 0x0089 }
        r8 = 4;
        r1.disconnect();
        if (r3 == 0) goto L_0x007c;
    L_0x0072:
        r3.close();	 Catch:{ IOException -> 0x0076 }
        goto L_0x007c;
    L_0x0076:
        r0 = move-exception;
        r1 = "DownloadTask";
        com.android.camera.log.Log.w(r1, r0);
    L_0x007c:
        if (r4 == 0) goto L_0x0088;
    L_0x007e:
        r4.close();	 Catch:{ IOException -> 0x0082 }
        goto L_0x0088;
    L_0x0082:
        r0 = move-exception;
        r1 = "DownloadTask";
        com.android.camera.log.Log.w(r1, r0);
    L_0x0088:
        return r8;
    L_0x0089:
        r8 = move-exception;
        goto L_0x0146;
    L_0x008c:
        r8 = move-exception;
        goto L_0x0119;
    L_0x008f:
        r7.preDownload(r8);	 Catch:{ IOException -> 0x008c, all -> 0x0089 }
        r8 = "DownloadTask";
        r0 = "start to transfer data";
        r5 = new java.lang.Object[r2];	 Catch:{ IOException -> 0x008c, all -> 0x0089 }
        r0 = java.lang.String.format(r0, r5);	 Catch:{ IOException -> 0x008c, all -> 0x0089 }
        com.android.camera.log.Log.d(r8, r0);	 Catch:{ IOException -> 0x008c, all -> 0x0089 }
        r8 = 8192; // 0x2000 float:1.14794E-41 double:4.0474E-320;
        r8 = new byte[r8];	 Catch:{ IOException -> 0x008c, all -> 0x0089 }
        r0 = r2;
    L_0x00a5:
        r5 = r7.mCoreTask;	 Catch:{ IOException -> 0x008c, all -> 0x0089 }
        r5 = r5.isCancelled();	 Catch:{ IOException -> 0x008c, all -> 0x0089 }
        r6 = -1;
        if (r5 != 0) goto L_0x00bb;
    L_0x00ae:
        r0 = r3.read(r8);	 Catch:{ IOException -> 0x008c, all -> 0x0089 }
        if (r0 == r6) goto L_0x00bb;
    L_0x00b4:
        r4.write(r8, r2, r0);	 Catch:{ IOException -> 0x008c, all -> 0x0089 }
        r7.performProgressUpdate(r8, r0);	 Catch:{ IOException -> 0x008c, all -> 0x0089 }
        goto L_0x00a5;
    L_0x00bb:
        if (r0 != r6) goto L_0x00ea;
    L_0x00bd:
        r8 = "DownloadTask";
        r0 = "download success";
        r2 = new java.lang.Object[r2];	 Catch:{ IOException -> 0x008c, all -> 0x0089 }
        r0 = java.lang.String.format(r0, r2);	 Catch:{ IOException -> 0x008c, all -> 0x0089 }
        com.android.camera.log.Log.d(r8, r0);	 Catch:{ IOException -> 0x008c, all -> 0x0089 }
        r8 = r7.postDownload();	 Catch:{ IOException -> 0x008c, all -> 0x0089 }
        r1.disconnect();
        if (r3 == 0) goto L_0x00dd;
    L_0x00d3:
        r3.close();	 Catch:{ IOException -> 0x00d7 }
        goto L_0x00dd;
    L_0x00d7:
        r0 = move-exception;
        r1 = "DownloadTask";
        com.android.camera.log.Log.w(r1, r0);
    L_0x00dd:
        if (r4 == 0) goto L_0x00e9;
    L_0x00df:
        r4.close();	 Catch:{ IOException -> 0x00e3 }
        goto L_0x00e9;
    L_0x00e3:
        r0 = move-exception;
        r1 = "DownloadTask";
        com.android.camera.log.Log.w(r1, r0);
    L_0x00e9:
        return r8;
    L_0x00ea:
        r8 = "DownloadTask";
        r0 = "cancelled, during download";
        r2 = new java.lang.Object[r2];	 Catch:{ IOException -> 0x008c, all -> 0x0089 }
        r0 = java.lang.String.format(r0, r2);	 Catch:{ IOException -> 0x008c, all -> 0x0089 }
        com.android.camera.log.Log.d(r8, r0);	 Catch:{ IOException -> 0x008c, all -> 0x0089 }
        r8 = 5;
        r1.disconnect();
        if (r3 == 0) goto L_0x0107;
    L_0x00fd:
        r3.close();	 Catch:{ IOException -> 0x0101 }
        goto L_0x0107;
    L_0x0101:
        r0 = move-exception;
        r1 = "DownloadTask";
        com.android.camera.log.Log.w(r1, r0);
    L_0x0107:
        if (r4 == 0) goto L_0x0113;
    L_0x0109:
        r4.close();	 Catch:{ IOException -> 0x010d }
        goto L_0x0113;
    L_0x010d:
        r0 = move-exception;
        r1 = "DownloadTask";
        com.android.camera.log.Log.w(r1, r0);
    L_0x0113:
        return r8;
    L_0x0114:
        r8 = move-exception;
        r4 = r0;
        goto L_0x0146;
    L_0x0117:
        r8 = move-exception;
        r4 = r0;
    L_0x0119:
        r0 = r3;
        goto L_0x0121;
    L_0x011b:
        r8 = move-exception;
        r3 = r0;
        r4 = r3;
        goto L_0x0146;
    L_0x011f:
        r8 = move-exception;
        r4 = r0;
    L_0x0121:
        r2 = "DownloadTask";
        com.android.camera.log.Log.w(r2, r8);	 Catch:{ all -> 0x0144 }
        r8 = 11;
        r1.disconnect();
        if (r0 == 0) goto L_0x0137;
    L_0x012d:
        r0.close();	 Catch:{ IOException -> 0x0131 }
        goto L_0x0137;
    L_0x0131:
        r0 = move-exception;
        r1 = "DownloadTask";
        com.android.camera.log.Log.w(r1, r0);
    L_0x0137:
        if (r4 == 0) goto L_0x0143;
    L_0x0139:
        r4.close();	 Catch:{ IOException -> 0x013d }
        goto L_0x0143;
    L_0x013d:
        r0 = move-exception;
        r1 = "DownloadTask";
        com.android.camera.log.Log.w(r1, r0);
    L_0x0143:
        return r8;
    L_0x0144:
        r8 = move-exception;
        r3 = r0;
    L_0x0146:
        r1.disconnect();
        if (r3 == 0) goto L_0x0155;
    L_0x014b:
        r3.close();	 Catch:{ IOException -> 0x014f }
        goto L_0x0155;
    L_0x014f:
        r0 = move-exception;
        r1 = "DownloadTask";
        com.android.camera.log.Log.w(r1, r0);
    L_0x0155:
        if (r4 == 0) goto L_0x0161;
    L_0x0157:
        r4.close();	 Catch:{ IOException -> 0x015b }
        goto L_0x0161;
    L_0x015b:
        r0 = move-exception;
        r1 = "DownloadTask";
        com.android.camera.log.Log.w(r1, r0);
    L_0x0161:
        throw r8;
        */
        throw new UnsupportedOperationException("Method not decompiled: com.android.camera.network.download.DownloadTask.process(com.android.camera.network.download.Request):int");
    }

    private void preRequest() {
        this.mTaskInfo = new TaskInfo();
    }

    private void preDownload(Request request) {
        Verifier verifier = request.getVerifier();
        if (verifier != null) {
            Log.d(TAG, String.format("need verify, try to get MessageDigest", new Object[0]));
            this.mTaskInfo.mDigest = verifier.getInstance();
        }
    }

    private void configure(HttpURLConnection httpURLConnection) {
        httpURLConnection.setConnectTimeout(10000);
        httpURLConnection.setReadTimeout(15000);
        httpURLConnection.setRequestProperty(HttpRequest.HEADER_ACCEPT_ENCODING, HTTP.IDENTITY_CODING);
    }

    private void processHeader(HttpURLConnection httpURLConnection) {
        this.mTaskInfo.mContentLength = (long) httpURLConnection.getContentLength();
        Log.d(TAG, String.format("content length: %d", new Object[]{Long.valueOf(this.mTaskInfo.mContentLength)}));
    }

    private void performProgressUpdate(byte[] bArr, int i) {
        long j = this.mTaskInfo.mDownloadSize;
        TaskInfo taskInfo = this.mTaskInfo;
        taskInfo.mDownloadSize += (long) i;
        if (this.mTaskInfo.mDigest != null) {
            this.mTaskInfo.mDigest.update(bArr, 0, i);
        }
        if (this.mOnProgressListener != null && this.mTaskInfo.mContentLength > 0) {
            int i2 = (int) ((((double) this.mTaskInfo.mDownloadSize) / ((double) this.mTaskInfo.mContentLength)) * 100.0d);
            if (((int) ((((double) j) / ((double) this.mTaskInfo.mContentLength)) * 100.0d)) != i2) {
                this.mCoreTask.publishProgress(i2);
            }
        }
    }

    private int postDownload() {
        if (this.mCoreTask.mRequest.getVerifier() == null || this.mCoreTask.mRequest.getVerifier().verify(this.mTaskInfo.mDigest.digest())) {
            Log.d(TAG, String.format("verify success", new Object[0]));
            return 0;
        }
        Log.d(TAG, String.format("verify fail", new Object[0]));
        return 6;
    }

    private int postRequest(int i) {
        File tempFile;
        if (i != 0) {
            tempFile = getTempFile(this.mCoreTask.mRequest.getDestination());
            if (tempFile.exists() && !tempFile.delete()) {
                Log.d(TAG, String.format("delete tmp file failed %s", new Object[]{tempFile}));
            }
        } else {
            tempFile = this.mCoreTask.mRequest.getDestination();
            File tempFile2 = getTempFile(tempFile);
            if (!tempFile2.exists()) {
                Log.w(TAG, String.format("downloaded file missing", new Object[0]));
                return 9;
            } else if (tempFile2.renameTo(tempFile)) {
                Log.w(TAG, String.format("rename tmp file success", new Object[0]));
            } else {
                Log.w(TAG, String.format("downloaded file rename failed", new Object[0]));
                return 9;
            }
        }
        return i;
    }

    private static File getTempFile(File file) {
        String parent = file.getParent();
        StringBuilder stringBuilder = new StringBuilder();
        stringBuilder.append(file.getName());
        stringBuilder.append(".download");
        return new File(parent, stringBuilder.toString());
    }

    private static int translateResponseCode(int i) {
        if (i != 200) {
            Log.d(TAG, String.format("processing http code %d", new Object[]{Integer.valueOf(i)}));
            int i2 = i / 100;
            if (i2 == 3) {
                return 7;
            }
            if (i2 == 4) {
                if (i == 408) {
                    return 12;
                }
                return 7;
            } else if (i2 != 5) {
                return i2 == 2 ? 7 : 7;
            } else {
                if (i == 504) {
                    return 12;
                }
                return 8;
            }
        }
        Log.d(TAG, String.format("http status is ok", new Object[0]));
        return 0;
    }

    private static boolean isRetryState(int i) {
        return i == 12 || i == 11;
    }

    private static int translateErrorCode(int i) {
        switch (i) {
            case 0:
                return 0;
            case 1:
                return 1;
            case 2:
                return 2;
            case 3:
                return 3;
            default:
                return 11;
        }
    }

    private static OutputStream openOutputStream(File file) {
        File parentFile = file.getParentFile();
        if (parentFile.exists() || parentFile.mkdirs()) {
            if (file.exists()) {
                if (file.isDirectory()) {
                    Log.d(TAG, String.format("output file is a directory", new Object[0]));
                    return null;
                }
                Log.w(TAG, String.format("output file will be overwritten", new Object[0]));
            }
            file = getTempFile(file);
            if (file.exists()) {
                Log.w(TAG, String.format("temp file exists, try delete", new Object[0]));
                if (!file.delete()) {
                    Log.w(TAG, String.format("temp file delete failed, will overwrite", new Object[0]));
                }
            }
            try {
                return new FileOutputStream(file);
            } catch (Throwable e) {
                Log.w(TAG, e);
                return null;
            }
        }
        Log.d(TAG, String.format("create folder failed", new Object[0]));
        return null;
    }
}
