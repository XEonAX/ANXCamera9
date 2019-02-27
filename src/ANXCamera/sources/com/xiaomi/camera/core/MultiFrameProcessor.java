package com.xiaomi.camera.core;

import android.media.Image;
import android.os.Handler;
import android.os.HandlerThread;
import android.os.Looper;
import android.os.Message;
import com.android.camera.log.Log;
import com.xiaomi.camera.core.CaptureData.CaptureDataBean;
import com.xiaomi.camera.imagecodec.JpegEncoder;
import com.xiaomi.camera.imagecodec.ReprocessData;
import com.xiaomi.camera.imagecodec.ReprocessData.OnDataAvailableListener;
import com.xiaomi.camera.processor.ClearShotProcessor;
import com.xiaomi.camera.processor.GroupShotProcessor;
import com.xiaomi.camera.processor.ProcessResultListener;
import java.io.File;
import miui.os.Build;

public class MultiFrameProcessor {
    private static final int REPROCESS_TIMEOUT_MS = 8000;
    private static final String TAG = MultiFrameProcessor.class.getSimpleName();
    private final int MSG_PROCESS_DATA;
    private Handler mHandler;
    private final Object mObjLock;
    private ProcessResultListener mProcessResultListener;
    private long mReprocessStartTime;
    private boolean mReprocessing;
    private HandlerThread mWorkThread;

    static class MultiFrameProcessorHolder {
        static MultiFrameProcessor INSTANCE = new MultiFrameProcessor();

        MultiFrameProcessorHolder() {
        }
    }

    private class WorkerHandler extends Handler {
        public WorkerHandler(Looper looper) {
            super(looper);
        }

        public void handleMessage(Message message) {
            if (message.what != 1) {
                String access$100 = MultiFrameProcessor.TAG;
                StringBuilder stringBuilder = new StringBuilder();
                stringBuilder.append("unexpected message ");
                stringBuilder.append(message.what);
                Log.w(access$100, stringBuilder.toString());
                return;
            }
            MultiFrameProcessor.this.doProcess((CaptureData) message.obj);
        }
    }

    /* synthetic */ MultiFrameProcessor(AnonymousClass1 anonymousClass1) {
        this();
    }

    private MultiFrameProcessor() {
        this.mObjLock = new Object();
        this.mProcessResultListener = new ProcessResultListener() {
            public void onProcessFinished(CaptureData captureData, boolean z) {
                String access$100 = MultiFrameProcessor.TAG;
                StringBuilder stringBuilder = new StringBuilder();
                stringBuilder.append("onProcessFinished: doReprocess = ");
                stringBuilder.append(z);
                Log.d(access$100, stringBuilder.toString());
                CaptureDataListener captureDataListener = captureData.getCaptureDataListener();
                if (captureDataListener == null) {
                    Log.w(MultiFrameProcessor.TAG, "onProcessFinished: null CaptureDataListener!");
                    CaptureDataBean multiFrameProcessResult = captureData.getMultiFrameProcessResult();
                    if (multiFrameProcessResult != null) {
                        multiFrameProcessResult.close();
                    }
                    for (CaptureDataBean multiFrameProcessResult2 : captureData.getCaptureDataBeanList()) {
                        if (multiFrameProcessResult2 != null) {
                            multiFrameProcessResult2.close();
                        }
                    }
                    return;
                }
                if (z) {
                    MultiFrameProcessor.this.reprocessImage(captureData.getMultiFrameProcessResult());
                }
                Log.d(MultiFrameProcessor.TAG, "onProcessFinished: dispatch image to algorithm engine");
                captureDataListener.onCaptureDataAvailable(captureData);
            }
        };
        this.MSG_PROCESS_DATA = 1;
        this.mWorkThread = new HandlerThread("MultiFrameProcessorThread");
        this.mWorkThread.start();
        this.mHandler = new WorkerHandler(this.mWorkThread.getLooper());
    }

    public static MultiFrameProcessor getInstance() {
        return MultiFrameProcessorHolder.INSTANCE;
    }

    public void processData(CaptureData captureData) {
        StringBuilder stringBuilder;
        if (captureData.getBurstNum() != captureData.getCaptureDataBeanList().size()) {
            stringBuilder = new StringBuilder();
            stringBuilder.append("Loss some capture data, burstNum is: ");
            stringBuilder.append(captureData.getBurstNum());
            stringBuilder.append("; but data bean list size is: ");
            stringBuilder.append(captureData.getCaptureDataBeanList().size());
            throw new RuntimeException(stringBuilder.toString());
        } else if (!this.mWorkThread.isAlive() || this.mHandler == null) {
            Log.w(TAG, "processData: sync mode");
            doProcess(captureData);
        } else {
            String str = TAG;
            stringBuilder = new StringBuilder();
            stringBuilder.append("processData: queue task: ");
            stringBuilder.append(captureData.getCaptureTimestamp());
            Log.v(str, stringBuilder.toString());
            this.mHandler.obtainMessage(1, captureData).sendToTarget();
        }
    }

    private void doProcess(CaptureData captureData) {
        String str = TAG;
        StringBuilder stringBuilder = new StringBuilder();
        stringBuilder.append("doProcess: start process task: ");
        stringBuilder.append(captureData.getCaptureTimestamp());
        Log.d(str, stringBuilder.toString());
        int algoType = captureData.getAlgoType();
        if (algoType == 2) {
            new ClearShotProcessor().doProcess(captureData, this.mProcessResultListener);
        } else if (algoType == 5) {
            new GroupShotProcessor().doProcess(captureData, this.mProcessResultListener);
        } else {
            stringBuilder = new StringBuilder();
            stringBuilder.append("unknown multi-frame process algorithm type: ");
            stringBuilder.append(algoType);
            throw new RuntimeException(stringBuilder.toString());
        }
    }

    /* JADX WARNING: Removed duplicated region for block: B:9:0x0079 A:{ExcHandler: java.lang.InterruptedException (r14_4 'e' java.lang.Throwable), Splitter: B:4:0x006c} */
    /* JADX WARNING: Missing block: B:9:0x0079, code:
            r14 = move-exception;
     */
    /* JADX WARNING: Missing block: B:11:?, code:
            r13.mReprocessing = false;
            com.android.camera.log.Log.e(TAG, r14.getMessage(), r14);
     */
    /* Code decompiled incorrectly, please refer to instructions dump. */
    private void reprocessImage(final CaptureDataBean captureDataBean) {
        OnDataAvailableListener anonymousClass2 = new OnDataAvailableListener() {
            public void onJpegAvailable(byte[] bArr, String str) {
            }

            public void onYuvAvailable(Image image, String str) {
                synchronized (MultiFrameProcessor.this.mObjLock) {
                    String access$100 = MultiFrameProcessor.TAG;
                    StringBuilder stringBuilder = new StringBuilder();
                    stringBuilder.append("onYuvAvailable>>tag=");
                    stringBuilder.append(str);
                    Log.v(access$100, stringBuilder.toString());
                    MultiFrameProcessor.this.mReprocessing = false;
                    captureDataBean.setMainImage(image);
                    MultiFrameProcessor.this.mObjLock.notify();
                    String access$1002 = MultiFrameProcessor.TAG;
                    StringBuilder stringBuilder2 = new StringBuilder();
                    stringBuilder2.append("onYuvAvailable<<cost=");
                    stringBuilder2.append(System.currentTimeMillis() - MultiFrameProcessor.this.mReprocessStartTime);
                    Log.v(access$1002, stringBuilder2.toString());
                }
            }

            public void onError(String str, String str2) {
                synchronized (MultiFrameProcessor.this.mObjLock) {
                    String access$100 = MultiFrameProcessor.TAG;
                    StringBuilder stringBuilder = new StringBuilder();
                    stringBuilder.append("onError>>tag=");
                    stringBuilder.append(str2);
                    stringBuilder.append(" reason=");
                    stringBuilder.append(str);
                    Log.v(access$100, stringBuilder.toString());
                    if (Build.IS_DEBUGGABLE) {
                        stringBuilder = new StringBuilder();
                        stringBuilder.append("reprocessImage failed image = ");
                        stringBuilder.append(str2);
                        stringBuilder.append(" reason = ");
                        stringBuilder.append(str);
                        throw new RuntimeException(stringBuilder.toString());
                    }
                    MultiFrameProcessor.this.mReprocessing = false;
                    MultiFrameProcessor.this.mObjLock.notify();
                    str = MultiFrameProcessor.TAG;
                    StringBuilder stringBuilder2 = new StringBuilder();
                    stringBuilder2.append("onError<<cost=");
                    stringBuilder2.append(System.currentTimeMillis() - MultiFrameProcessor.this.mReprocessStartTime);
                    Log.v(str, stringBuilder2.toString());
                }
            }
        };
        Image mainImage = captureDataBean.getMainImage();
        StringBuilder stringBuilder = new StringBuilder();
        stringBuilder.append(captureDataBean.getResult().getTimeStamp());
        stringBuilder.append(File.separator);
        stringBuilder.append(0);
        String stringBuilder2 = stringBuilder.toString();
        int width = mainImage.getWidth();
        int height = mainImage.getHeight();
        String str = TAG;
        StringBuilder stringBuilder3 = new StringBuilder();
        stringBuilder3.append("reprocessImage: timestamp = ");
        stringBuilder3.append(mainImage.getTimestamp());
        Log.d(str, stringBuilder3.toString());
        synchronized (this.mObjLock) {
            this.mReprocessStartTime = System.currentTimeMillis();
            this.mReprocessing = true;
            ReprocessData reprocessData = new ReprocessData(mainImage, stringBuilder2, captureDataBean.getResult(), true, width, height, 35, anonymousClass2);
            reprocessData.setImageFromPool(true);
            JpegEncoder.instance().doReprocess(reprocessData);
            while (this.mReprocessing) {
                try {
                    this.mObjLock.wait(8000);
                } catch (Throwable e) {
                }
            }
        }
    }
}
