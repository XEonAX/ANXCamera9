package com.xiaomi.camera.core;

import android.media.Image;
import com.android.camera.log.Log;
import com.xiaomi.camera.core.CaptureData.CaptureDataBean;
import com.xiaomi.camera.imagecodec.JpegEncoder;
import com.xiaomi.camera.imagecodec.ReprocessData;
import com.xiaomi.camera.imagecodec.ReprocessData.OnDataAvailableListener;
import com.xiaomi.camera.processor.ClearShotProcessor;
import com.xiaomi.camera.processor.GroupShotProcessor;
import com.xiaomi.camera.processor.ProcessResultListener;
import java.io.File;

public class MultiFrameProcessor {
    private static final int REPROCESS_TIMEOUT_MS = 8000;
    private static final String TAG = MultiFrameProcessor.class.getSimpleName();
    private final Object mObjLock;
    private ProcessResultListener mProcessResultListener;
    private long mReprocessStartTime;
    private boolean mReprocessing;

    static class MultiFrameProcessorHolder {
        static MultiFrameProcessor INSTANCE = new MultiFrameProcessor();

        MultiFrameProcessorHolder() {
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
                stringBuilder.append("onProcessFinished: start reprocess Image, doReprocess = ");
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
    }

    public static MultiFrameProcessor getInstance() {
        return MultiFrameProcessorHolder.INSTANCE;
    }

    public void processData(CaptureData captureData) {
        StringBuilder stringBuilder;
        if (captureData.getBurstNum() == captureData.getCaptureDataBeanList().size()) {
            String str = TAG;
            stringBuilder = new StringBuilder();
            stringBuilder.append("processData: start process task with: ");
            stringBuilder.append(captureData);
            Log.d(str, stringBuilder.toString());
            int algoType = captureData.getAlgoType();
            if (algoType == 2) {
                new ClearShotProcessor().doProcess(captureData, this.mProcessResultListener);
                return;
            } else if (algoType == 5) {
                new GroupShotProcessor().doProcess(captureData, this.mProcessResultListener);
                return;
            } else {
                stringBuilder = new StringBuilder();
                stringBuilder.append("unknown multi-frame process algorithm type:");
                stringBuilder.append(algoType);
                throw new RuntimeException(stringBuilder.toString());
            }
        }
        stringBuilder = new StringBuilder();
        stringBuilder.append("Loss some capture data, burstNum is: ");
        stringBuilder.append(captureData.getBurstNum());
        stringBuilder.append("; but data bean list size is: ");
        stringBuilder.append(captureData.getCaptureDataBeanList().size());
        throw new RuntimeException(stringBuilder.toString());
    }

    /* JADX WARNING: Removed duplicated region for block: B:9:0x0076 A:{Splitter: B:4:0x0069, ExcHandler: java.lang.InterruptedException (r13_4 'e' java.lang.Throwable)} */
    /* JADX WARNING: Missing block: B:9:0x0076, code:
            r13 = move-exception;
     */
    /* JADX WARNING: Missing block: B:11:?, code:
            r12.mReprocessing = false;
            com.android.camera.log.Log.e(TAG, r13.getMessage(), r13);
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
        stringBuilder3.append("reprocessImage: timeStamp = ");
        stringBuilder3.append(mainImage.getTimestamp());
        Log.d(str, stringBuilder3.toString());
        synchronized (this.mObjLock) {
            this.mReprocessStartTime = System.currentTimeMillis();
            this.mReprocessing = true;
            JpegEncoder.instance().doReprocess(new ReprocessData(mainImage, stringBuilder2, captureDataBean.getResult(), true, width, height, 35, anonymousClass2));
            while (this.mReprocessing) {
                try {
                    this.mObjLock.wait(8000);
                } catch (Throwable e) {
                }
            }
        }
    }
}
