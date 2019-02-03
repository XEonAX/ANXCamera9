package com.xiaomi.camera.core;

import android.media.Image;
import android.os.Handler;
import android.os.HandlerThread;
import android.support.annotation.NonNull;
import android.util.Log;
import android.util.LongSparseArray;
import android.util.SparseArray;
import com.xiaomi.camera.core.CaptureData.CaptureDataBean;
import com.xiaomi.protocol.ICustomCaptureResult;
import java.util.Locale;

public class ParallelDataZipper {
    private static final String TAG = ParallelDataZipper.class.getSimpleName();
    private int mAlgoType;
    private int mBurstNum;
    private final SparseArray<CaptureData> mCaptureDataArray;
    private LongSparseArray<CaptureDataBean> mCaptureDataBeanArray;
    private DataListener mDataListener;
    private Handler mHandler;
    private int mStreamNum;
    private HandlerThread mWorkThread;

    public interface DataListener {
        void onParallelDataAvailable(CaptureData captureData);
    }

    static class InstanceHolder {
        static ParallelDataZipper INSTANCE = new ParallelDataZipper();

        InstanceHolder() {
        }
    }

    /* synthetic */ ParallelDataZipper(AnonymousClass1 anonymousClass1) {
        this();
    }

    private ParallelDataZipper() {
        this.mAlgoType = 0;
        this.mStreamNum = 1;
        this.mBurstNum = 1;
        this.mCaptureDataBeanArray = new LongSparseArray(4);
        this.mCaptureDataArray = new SparseArray(4);
        this.mWorkThread = new HandlerThread("ParallelDataZipperThread");
        this.mWorkThread.start();
        this.mHandler = new Handler(this.mWorkThread.getLooper());
    }

    public static ParallelDataZipper getInstance() {
        return InstanceHolder.INSTANCE;
    }

    public synchronized void prepare(int i, int i2, int i3, @NonNull DataListener dataListener) {
        this.mAlgoType = i;
        this.mStreamNum = i2;
        this.mBurstNum = i3;
        this.mDataListener = dataListener;
        int size = this.mCaptureDataBeanArray.size();
        Log.d(TAG, String.format(Locale.ENGLISH, "prepare: algo=%d streamNum=%d burstNum=%d arraySize=%d", new Object[]{Integer.valueOf(i), Integer.valueOf(i2), Integer.valueOf(i3), Integer.valueOf(size)}));
    }

    public synchronized void join(@NonNull final ICustomCaptureResult iCustomCaptureResult, final boolean z) {
        if (!this.mWorkThread.isAlive() || this.mHandler == null) {
            throw new RuntimeException("Thread already die!");
        }
        this.mHandler.post(new Runnable() {
            public void run() {
                long timeStamp = iCustomCaptureResult.getTimeStamp();
                CaptureDataBean captureDataBean = (CaptureDataBean) ParallelDataZipper.this.mCaptureDataBeanArray.get(timeStamp);
                if (captureDataBean == null) {
                    captureDataBean = new CaptureDataBean(ParallelDataZipper.this.mStreamNum);
                    ParallelDataZipper.this.mCaptureDataBeanArray.append(timeStamp, captureDataBean);
                } else if (ParallelDataZipper.this.mStreamNum != captureDataBean.getStreamNum()) {
                    captureDataBean.setStreamNum(ParallelDataZipper.this.mStreamNum);
                }
                captureDataBean.setCaptureResult(iCustomCaptureResult, z);
                if (captureDataBean.isDataReady()) {
                    ParallelDataZipper.this.mCaptureDataBeanArray.remove(timeStamp);
                    ParallelDataZipper.this.tryToCallback(captureDataBean);
                }
            }
        });
    }

    public synchronized void join(final Image image, final int i) {
        if (!this.mWorkThread.isAlive() || this.mHandler == null) {
            throw new RuntimeException("Thread already die!");
        }
        this.mHandler.post(new Runnable() {
            public void run() {
                long timestamp = image.getTimestamp();
                CaptureDataBean captureDataBean = (CaptureDataBean) ParallelDataZipper.this.mCaptureDataBeanArray.get(timestamp);
                if (captureDataBean == null) {
                    captureDataBean = new CaptureDataBean(ParallelDataZipper.this.mStreamNum);
                    ParallelDataZipper.this.mCaptureDataBeanArray.append(timestamp, captureDataBean);
                }
                captureDataBean.setImage(image, i);
                if (captureDataBean.isDataReady()) {
                    ParallelDataZipper.this.mCaptureDataBeanArray.remove(timestamp);
                    ParallelDataZipper.this.tryToCallback(captureDataBean);
                }
            }
        });
    }

    private void tryToCallback(CaptureDataBean captureDataBean) {
        Integer valueOf = Integer.valueOf(captureDataBean.getResult().getSequenceId());
        long timeStamp = captureDataBean.getResult().getTimeStamp();
        CaptureData captureData = (CaptureData) this.mCaptureDataArray.get(valueOf.intValue());
        if (captureData == null) {
            if (this.mCaptureDataArray.size() != 0) {
                String str = TAG;
                StringBuilder stringBuilder = new StringBuilder();
                stringBuilder.append("tryToCallback: captureDataNum = ");
                stringBuilder.append(this.mCaptureDataArray.size());
                Log.w(str, stringBuilder.toString());
            }
            CaptureData captureData2 = new CaptureData(this.mAlgoType, this.mStreamNum, this.mBurstNum, timeStamp);
            this.mCaptureDataArray.append(valueOf.intValue(), captureData2);
        }
        captureData.putCaptureDataBean(captureDataBean);
        if (captureData.isDataReady()) {
            this.mDataListener.onParallelDataAvailable(captureData);
            this.mCaptureDataArray.remove(valueOf.intValue());
        }
    }
}
