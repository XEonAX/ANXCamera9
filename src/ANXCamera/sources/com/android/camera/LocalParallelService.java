package com.android.camera;

import android.app.Service;
import android.content.Intent;
import android.os.Binder;
import android.os.IBinder;
import android.os.RemoteException;
import android.support.annotation.NonNull;
import android.view.Surface;
import com.android.camera.log.Log;
import com.android.camera.storage.ImageSaver;
import com.xiaomi.camera.core.ParallelTaskData;
import com.xiaomi.camera.core.PostProcessor;
import com.xiaomi.camera.core.PostProcessor.PostProcessStatusCallback;
import com.xiaomi.camera.imagecodec.JpegEncoder;
import com.xiaomi.engine.BufferFormat;
import com.xiaomi.engine.MiCameraAlgo;
import com.xiaomi.protocol.ICustomCaptureResult;
import com.xiaomi.protocol.IImageReaderParameterSets;
import java.util.ArrayList;
import java.util.List;

public class LocalParallelService extends Service {
    private static final String TAG = LocalParallelService.class.getSimpleName();
    private LocalBinder mLocalBinder;
    private PostProcessStatusCallback mPostProcessStatusCallback = new PostProcessStatusCallback() {
        public void onImagePostProcessStart(ParallelTaskData parallelTaskData) {
            if (LocalParallelService.this.mServiceStatusListener != null) {
                LocalParallelService.this.mServiceStatusListener.onImagePostProcessStart(parallelTaskData);
            }
        }

        public void onPostProcessorClosed(PostProcessor postProcessor) {
            if (LocalParallelService.this.mLocalBinder != null) {
                LocalParallelService.this.mLocalBinder.onPostProcessorClosed(postProcessor);
            }
        }
    };
    private ServiceStatusListener mServiceStatusListener;

    public class LocalBinder extends Binder {
        private List<PostProcessor> mAlivePostProcessor = new ArrayList();
        private BufferFormat mCurrentBufferFormat;
        private List<IImageReaderParameterSets> mCurrentParams;
        private PostProcessor mCurrentPostProcessor;

        LocalBinder() {
            JpegEncoder.instance().init(LocalParallelService.this);
            MiCameraAlgo.init(LocalParallelService.this);
        }

        public List<Surface> configCaptureOutputBuffer(@NonNull List<IImageReaderParameterSets> list) throws RemoteException {
            if (list.isEmpty()) {
                throw new RemoteException("List is empty");
            } else if (!isSetsEquals(list, this.mCurrentParams) || this.mCurrentPostProcessor == null || this.mCurrentPostProcessor.getSurfaceList().isEmpty()) {
                if (this.mCurrentPostProcessor != null) {
                    this.mCurrentPostProcessor.destroyWhenTasksFinished();
                }
                this.mCurrentParams = list;
                Log.d(LocalParallelService.TAG, "configCaptureOutputBuffer: create a new PostProcessor");
                this.mCurrentPostProcessor = new PostProcessor(LocalParallelService.this, LocalParallelService.this.mPostProcessStatusCallback);
                this.mAlivePostProcessor.add(this.mCurrentPostProcessor);
                return this.mCurrentPostProcessor.configHALOutputSurface(list);
            } else {
                Log.d(LocalParallelService.TAG, "configCaptureOutputBuffer: sets is not changed, return the old.");
                return this.mCurrentPostProcessor.getSurfaceList();
            }
        }

        /* JADX WARNING: Missing block: B:21:0x0047, code:
            return false;
     */
        /* Code decompiled incorrectly, please refer to instructions dump. */
        private boolean isSetsEquals(List<IImageReaderParameterSets> list, List<IImageReaderParameterSets> list2) {
            boolean z = false;
            if (list == null || list2 == null || list.size() != list2.size()) {
                return false;
            }
            int i = 0;
            for (IImageReaderParameterSets iImageReaderParameterSets : list) {
                for (IImageReaderParameterSets equals : list2) {
                    if (iImageReaderParameterSets.equals(equals)) {
                        i++;
                        break;
                    }
                }
            }
            if (list.size() == i) {
                z = true;
            }
            return z;
        }

        public void configCaptureSession(@NonNull BufferFormat bufferFormat) {
            if (bufferFormat.equals(this.mCurrentBufferFormat)) {
                Log.d(LocalParallelService.TAG, "current BufferFormat is equals last BufferFormat, so need not re-config, returned.");
                return;
            }
            this.mCurrentBufferFormat = bufferFormat;
            long currentTimeMillis = System.currentTimeMillis();
            this.mCurrentPostProcessor.configCaptureSession(this.mCurrentBufferFormat, 0);
            String access$300 = LocalParallelService.TAG;
            StringBuilder stringBuilder = new StringBuilder();
            stringBuilder.append("configCaptureSession: create session cost : ");
            stringBuilder.append(System.currentTimeMillis() - currentTimeMillis);
            Log.d(access$300, stringBuilder.toString());
        }

        public void setJpegOutputSize(int i, int i2) {
            JpegEncoder.instance().setJpegOutputSize(i, i2);
        }

        public void onCaptureStarted(ParallelTaskData parallelTaskData) {
            this.mCurrentPostProcessor.getCaptureStatusListener().onCaptureStarted(parallelTaskData);
        }

        public void onCaptureCompleted(ICustomCaptureResult iCustomCaptureResult, boolean z) {
            this.mCurrentPostProcessor.getCaptureStatusListener().onCaptureCompleted(iCustomCaptureResult, z);
        }

        public void onCaptureFailed(long j, int i) {
            this.mCurrentPostProcessor.getCaptureStatusListener().onCaptureFailed(j, i);
        }

        public void onServiceDestroy() {
            JpegEncoder.instance().deInit();
            MiCameraAlgo.deInit();
        }

        public boolean needWaitProcess() {
            return this.mCurrentPostProcessor.needWaitImageClose();
        }

        public void setOnPictureTakenListener(ServiceStatusListener serviceStatusListener) {
            LocalParallelService.this.mServiceStatusListener = serviceStatusListener;
        }

        public void setImageSaver(ImageSaver imageSaver) {
            this.mCurrentPostProcessor.setImageSaver(imageSaver);
        }

        public boolean isIdle() {
            for (PostProcessor isIdle : this.mAlivePostProcessor) {
                if (!isIdle.isIdle()) {
                    return false;
                }
            }
            return true;
        }

        private void onPostProcessorClosed(PostProcessor postProcessor) {
            this.mAlivePostProcessor.remove(postProcessor);
        }
    }

    public interface ServiceStatusListener {
        void onImagePostProcessStart(ParallelTaskData parallelTaskData);
    }

    public IBinder onBind(Intent intent) {
        Log.d(TAG, "onBind: start");
        return this.mLocalBinder;
    }

    public boolean onUnbind(Intent intent) {
        return super.onUnbind(intent);
    }

    public void onCreate() {
        Log.d(TAG, "onCreate: start");
        this.mLocalBinder = new LocalBinder();
        super.onCreate();
    }

    public int onStartCommand(Intent intent, int i, int i2) {
        Log.d(TAG, "onStartCommand: start");
        return super.onStartCommand(intent, i, i2);
    }

    public void onDestroy() {
        Log.d(TAG, "onDestroy: start");
        this.mLocalBinder.onServiceDestroy();
        this.mLocalBinder = null;
        super.onDestroy();
    }
}
