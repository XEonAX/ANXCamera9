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
            LocalParallelService.this.mServiceStatusListener.onImagePostProcessStart(parallelTaskData);
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
        private boolean isSetsEquals(java.util.List<com.xiaomi.protocol.IImageReaderParameterSets> r7, java.util.List<com.xiaomi.protocol.IImageReaderParameterSets> r8) {
            /*
            r6 = this;
            r0 = 0;
            if (r7 == 0) goto L_0x0047;
        L_0x0003:
            if (r8 != 0) goto L_0x0006;
        L_0x0005:
            goto L_0x0047;
        L_0x0006:
            r1 = r7.size();
            r2 = r8.size();
            if (r1 == r2) goto L_0x0011;
        L_0x0010:
            return r0;
            r1 = r7.iterator();
            r2 = r0;
        L_0x0017:
            r3 = r1.hasNext();
            if (r3 == 0) goto L_0x003e;
        L_0x001d:
            r3 = r1.next();
            r3 = (com.xiaomi.protocol.IImageReaderParameterSets) r3;
            r4 = r8.iterator();
        L_0x0027:
            r5 = r4.hasNext();
            if (r5 == 0) goto L_0x003d;
        L_0x002d:
            r5 = r4.next();
            r5 = (com.xiaomi.protocol.IImageReaderParameterSets) r5;
            r5 = r3.equals(r5);
            if (r5 == 0) goto L_0x003c;
        L_0x0039:
            r2 = r2 + 1;
            goto L_0x003d;
        L_0x003c:
            goto L_0x0027;
        L_0x003d:
            goto L_0x0017;
        L_0x003e:
            r7 = r7.size();
            if (r7 != r2) goto L_0x0046;
        L_0x0044:
            r0 = 1;
        L_0x0046:
            return r0;
        L_0x0047:
            return r0;
            */
            throw new UnsupportedOperationException("Method not decompiled: com.android.camera.LocalParallelService.LocalBinder.isSetsEquals(java.util.List, java.util.List):boolean");
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

        public void onCaptureStart(ParallelTaskData parallelTaskData) {
            this.mCurrentPostProcessor.onCaptureStarted(parallelTaskData);
        }

        public void onCaptureCompleted(List<ICustomCaptureResult> list) {
            this.mCurrentPostProcessor.onCaptureCompleted(list);
        }

        public void onCaptureFailed(String str, int i) {
            this.mCurrentPostProcessor.onCaptureFailed(str, i);
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
