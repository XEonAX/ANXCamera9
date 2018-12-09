package com.xiaomi.camera.core;

import android.content.Context;
import android.media.Image;
import android.media.ImageReader;
import android.media.ImageReader.OnImageAvailableListener;
import android.os.Handler;
import android.os.HandlerThread;
import android.support.annotation.NonNull;
import android.util.Log;
import android.view.Surface;
import com.android.camera.storage.ImageSaver;
import com.xiaomi.camera.base.CommonUtil;
import com.xiaomi.camera.base.PerformanceTracker;
import com.xiaomi.camera.core.ImageProcessor.ImageProcessorStatusCallback;
import com.xiaomi.camera.imagecodec.JpegEncoder;
import com.xiaomi.camera.imagecodec.MiImage;
import com.xiaomi.camera.imagecodec.ReprocessData;
import com.xiaomi.camera.imagecodec.ReprocessData.OnJpegAvailableListener;
import com.xiaomi.engine.BufferFormat;
import com.xiaomi.engine.MiCameraAlgo;
import com.xiaomi.engine.TaskSession;
import com.xiaomi.engine.TaskSession.SessionStatusCallback;
import com.xiaomi.protocol.ICustomCaptureResult;
import com.xiaomi.protocol.IImageReaderParameterSets;
import java.io.File;
import java.lang.ref.WeakReference;
import java.util.ArrayList;
import java.util.List;
import java.util.concurrent.ConcurrentHashMap;

public class PostProcessor {
    private static final String TAG = PostProcessor.class.getSimpleName();
    private FilterProcessor mFilterProcessor;
    private ImageProcessor mImageProcessor;
    private ImageProcessorStatusCallback mImageProcessorStatusCallback = new ImageProcessorStatusCallback() {
        public void onImageProcessed(Image image, int i) {
            String access$000 = PostProcessor.TAG;
            StringBuilder stringBuilder = new StringBuilder();
            stringBuilder.append("onImageProcessed: ON_IMAGE_PROCESSED: ");
            stringBuilder.append(image);
            stringBuilder.append(", target = ");
            stringBuilder.append(i);
            Log.d(access$000, stringBuilder.toString());
            if (i == 3) {
                PerformanceTracker.trackJpegReprocess(i, 0);
                byte[] firstPlane = CommonUtil.getFirstPlane(image);
                stringBuilder = new StringBuilder();
                stringBuilder.append(image.getTimestamp());
                stringBuilder.append(File.separator);
                stringBuilder.append(i);
                PostProcessor.this.mJpegEncoderListener.onJpegAvailable(firstPlane, stringBuilder.toString());
                return;
            }
            long timestamp = image.getTimestamp();
            String access$0002 = PostProcessor.TAG;
            StringBuilder stringBuilder2 = new StringBuilder();
            stringBuilder2.append("onImageProcessed: get parallelTaskData: ");
            stringBuilder2.append(timestamp);
            Log.d(access$0002, stringBuilder2.toString());
            ParallelTaskData parallelTaskData = (ParallelTaskData) PostProcessor.this.mParallelTaskHashMap.get(Long.valueOf(timestamp));
            MiImage miImage = new MiImage(image);
            PostProcessor.this.mFilterProcessor.doFilterSync(parallelTaskData, miImage, i);
            ICustomCaptureResult captureResult = parallelTaskData.getCaptureResult();
            String access$0003 = PostProcessor.TAG;
            stringBuilder2 = new StringBuilder();
            stringBuilder2.append("onImageProcessed: captureResult = ");
            stringBuilder2.append(captureResult.getResults());
            Log.d(access$0003, stringBuilder2.toString());
            StringBuilder stringBuilder3 = new StringBuilder();
            stringBuilder3.append(timestamp);
            stringBuilder3.append(File.separator);
            stringBuilder3.append(i);
            String stringBuilder4 = stringBuilder3.toString();
            access$0003 = PostProcessor.TAG;
            stringBuilder = new StringBuilder();
            stringBuilder.append("onImageProcessed: send jpeg Encoder image target is : ");
            stringBuilder.append(stringBuilder4);
            Log.d(access$0003, stringBuilder.toString());
            ReprocessData reprocessData = new ReprocessData(miImage, stringBuilder4, captureResult, parallelTaskData.isFrontCamera(), parallelTaskData.getOutputWidth(), parallelTaskData.getOutputHeight(), PostProcessor.this.mJpegEncoderListener);
            PerformanceTracker.trackJpegReprocess(i, 0);
            JpegEncoder.instance().doReprocess(reprocessData);
        }

        public void onImageProcessFailed(Image image, String str) {
        }

        public void onOriginalImageClosed(Image image) {
            synchronized (PostProcessor.this.objectLock) {
                PostProcessor.this.mNeedCloseImageNum = PostProcessor.this.mNeedCloseImageNum - 1;
                String access$000 = PostProcessor.TAG;
                StringBuilder stringBuilder = new StringBuilder();
                stringBuilder.append("onOriginalImageClosed: needCloseImageNum=");
                stringBuilder.append(PostProcessor.this.mNeedCloseImageNum);
                Log.d(access$000, stringBuilder.toString());
                PostProcessor.this.objectLock.notify();
            }
            String access$0002 = PostProcessor.TAG;
            StringBuilder stringBuilder2 = new StringBuilder();
            stringBuilder2.append("onOriginalImageClosed: ON_IMAGE_CLOSED: ");
            stringBuilder2.append(image);
            Log.d(access$0002, stringBuilder2.toString());
        }

        public void onImageProcessStart(long j) {
            if (PostProcessor.this.mPostProcessStatusCallback != null) {
                String access$000 = PostProcessor.TAG;
                StringBuilder stringBuilder = new StringBuilder();
                stringBuilder.append("onImageProcessStart: get parallelTaskData: ");
                stringBuilder.append(j);
                Log.d(access$000, stringBuilder.toString());
                PostProcessor.this.mPostProcessStatusCallback.onImagePostProcessStart((ParallelTaskData) PostProcessor.this.mParallelTaskHashMap.get(Long.valueOf(j)));
            }
        }
    };
    private List<ImageReader> mImageReaderList = new ArrayList();
    private ImageSaver mImageSaver;
    private OnJpegAvailableListener mJpegEncoderListener = new OnJpegAvailableListener() {
        public void onJpegAvailable(byte[] bArr, String str) {
            String[] split = str.split(File.separator);
            long parseLong = Long.parseLong(split[0]);
            int parseInt = Integer.parseInt(split[1]);
            String access$000 = PostProcessor.TAG;
            StringBuilder stringBuilder = new StringBuilder();
            stringBuilder.append("onImageProcessed: received jpeg Encoder image target is : ");
            stringBuilder.append(str);
            Log.d(access$000, stringBuilder.toString());
            PerformanceTracker.trackJpegReprocess(parseInt, 1);
            str = PostProcessor.TAG;
            StringBuilder stringBuilder2 = new StringBuilder();
            stringBuilder2.append("onJpegAvailable: get parallelTaskData: ");
            stringBuilder2.append(parseLong);
            Log.d(str, stringBuilder2.toString());
            ParallelTaskData parallelTaskData = (ParallelTaskData) PostProcessor.this.mParallelTaskHashMap.get(Long.valueOf(parseLong));
            parallelTaskData.fillJpegData(bArr, parseInt);
            StringBuilder stringBuilder3 = new StringBuilder();
            stringBuilder3.append(parseLong);
            stringBuilder3.append(" | ");
            stringBuilder3.append(parseInt);
            stringBuilder3.append(" | ");
            stringBuilder3.append(bArr.length);
            Log.e("algo onJpegAvailable: ", stringBuilder3.toString());
            if (parallelTaskData.isJpegDataReady()) {
                Log.d(PostProcessor.TAG, "onJpegAvailable: save image start");
                PostProcessor.this.mImageSaver.onParallelProcessFinish(parallelTaskData);
                parallelTaskData.setDeparted();
                long timeStamp = parallelTaskData.getTimeStamp();
                PostProcessor.this.mParallelTaskHashMap.remove(Long.valueOf(timeStamp));
                String access$0002 = PostProcessor.TAG;
                StringBuilder stringBuilder4 = new StringBuilder();
                stringBuilder4.append("onCaptureCompleted: mParallelTaskHashMap remove ");
                stringBuilder4.append(timeStamp);
                Log.d(access$0002, stringBuilder4.toString());
            }
            PostProcessor.this.tryToCloseSession();
        }
    };
    private int mMaxImageQueueNum = 0;
    private volatile int mNeedCloseImageNum = 0;
    private ConcurrentHashMap<Long, ParallelTaskData> mParallelTaskHashMap = new ConcurrentHashMap();
    private PostProcessStatusCallback mPostProcessStatusCallback;
    private WeakReference<Context> mServiceContext;
    private SessionStatusCallback mSessionStatusCallback = new SessionStatusCallback() {
        public void onSessionCallback(int i, String str, Object obj) {
            String access$000 = PostProcessor.TAG;
            StringBuilder stringBuilder = new StringBuilder();
            stringBuilder.append("onSessionCallback: [");
            stringBuilder.append(i);
            stringBuilder.append("]:{");
            stringBuilder.append(str);
            stringBuilder.append("}");
            Log.d(access$000, stringBuilder.toString());
            String access$0002 = PostProcessor.TAG;
            StringBuilder stringBuilder2 = new StringBuilder();
            stringBuilder2.append("onSessionCallback: result = ");
            stringBuilder2.append(obj);
            Log.d(access$0002, stringBuilder2.toString());
        }
    };
    private boolean mShouldDestroyWhenTasksFinished = false;
    private List<Surface> mSurfaceList = new ArrayList();
    private TaskSession mTaskSession;
    private Handler mWorkerHandler;
    private HandlerThread mWorkerThread = new HandlerThread("CallbackHandleThread");
    private final Object objectLock = new Object();

    public interface PostProcessStatusCallback {
        void onImagePostProcessStart(ParallelTaskData parallelTaskData);

        void onPostProcessorClosed(PostProcessor postProcessor);
    }

    class ImageAvailableListener implements OnImageAvailableListener {
        private int mTargetCameraId;

        ImageAvailableListener(int i) {
            this.mTargetCameraId = i;
        }

        public void onImageAvailable(ImageReader imageReader) {
            if (imageReader == null) {
                Log.e(PostProcessor.TAG, "onImageAvailable: return a null imageReader when capture done");
            } else if (PostProcessor.this.mImageProcessor != null) {
                synchronized (PostProcessor.this.objectLock) {
                    while (PostProcessor.this.needWaitImageClose()) {
                        try {
                            Log.d(PostProcessor.TAG, "onImageAvailable: wait");
                            PostProcessor.this.objectLock.wait();
                        } catch (Throwable e) {
                            Log.w(PostProcessor.TAG, "onImageAvailable: failed!", e);
                        }
                    }
                    Image acquireNextImage = imageReader.acquireNextImage();
                    String access$000 = PostProcessor.TAG;
                    StringBuilder stringBuilder = new StringBuilder();
                    stringBuilder.append("onImageAvailable acquireNextImage: ");
                    stringBuilder.append(acquireNextImage);
                    stringBuilder.append(" targetCameraId=");
                    stringBuilder.append(this.mTargetCameraId);
                    Log.d(access$000, stringBuilder.toString());
                    PostProcessor.this.mNeedCloseImageNum = PostProcessor.this.mNeedCloseImageNum + 1;
                    access$000 = PostProcessor.TAG;
                    stringBuilder = new StringBuilder();
                    stringBuilder.append("onImageAvailable: needCloseImageNum=");
                    stringBuilder.append(PostProcessor.this.mNeedCloseImageNum);
                    Log.d(access$000, stringBuilder.toString());
                    PostProcessor.this.mImageProcessor.dispatchImage(acquireNextImage, this.mTargetCameraId);
                }
            } else {
                throw new RuntimeException("ImageProcessor not allowed null");
            }
        }
    }

    public PostProcessor(Context context, PostProcessStatusCallback postProcessStatusCallback) {
        this.mWorkerThread.start();
        this.mWorkerHandler = new Handler(this.mWorkerThread.getLooper());
        this.mServiceContext = new WeakReference(context);
        this.mPostProcessStatusCallback = postProcessStatusCallback;
        init();
    }

    public void init() {
    }

    public void deInit() {
        if (this.mFilterProcessor != null) {
            this.mFilterProcessor.deInit();
        }
    }

    public List<Surface> configHALOutputSurface(@NonNull List<IImageReaderParameterSets> list) {
        String str = TAG;
        StringBuilder stringBuilder = new StringBuilder();
        stringBuilder.append("configHALOutputSurface: params size is:");
        stringBuilder.append(list.size());
        Log.d(str, stringBuilder.toString());
        if (!this.mImageReaderList.isEmpty()) {
            this.mImageReaderList.clear();
        }
        if (!this.mSurfaceList.isEmpty()) {
            this.mSurfaceList.clear();
        }
        for (IImageReaderParameterSets iImageReaderParameterSets : list) {
            this.mMaxImageQueueNum += iImageReaderParameterSets.maxImages;
            ImageReader newInstance = ImageReader.newInstance(iImageReaderParameterSets.width, iImageReaderParameterSets.height, iImageReaderParameterSets.format, iImageReaderParameterSets.maxImages);
            newInstance.setOnImageAvailableListener(new ImageAvailableListener(iImageReaderParameterSets.targetCamera), this.mWorkerHandler);
            this.mSurfaceList.add(newInstance.getSurface());
            this.mImageReaderList.add(newInstance);
        }
        return this.mSurfaceList;
    }

    public List<Surface> getSurfaceList() {
        return this.mSurfaceList;
    }

    public void configCaptureSession(BufferFormat bufferFormat, int i) {
        Object obj = bufferFormat.getGraphDescriptor().getOperationModeID() == 32770 ? 1 : null;
        if (bufferFormat.getGraphDescriptor().getStreamNumber() != 2 || obj == null) {
            this.mImageProcessor = new SingleCameraProcessor(this.mImageProcessorStatusCallback);
            this.mImageProcessor.startWork();
            this.mTaskSession = MiCameraAlgo.createSessionWithSurfaces(bufferFormat, this.mImageProcessor.configOutputSurfaces(bufferFormat), this.mSessionStatusCallback);
        } else {
            this.mImageProcessor = new PortraitImageProcessor(this.mImageProcessorStatusCallback);
            this.mImageProcessor.startWork();
            this.mTaskSession = MiCameraAlgo.createSessionByOutputConfigurations(bufferFormat, this.mImageProcessor.configOutputConfigurations(bufferFormat), this.mSessionStatusCallback);
        }
        this.mImageProcessor.setTaskSession(this.mTaskSession);
        this.mFilterProcessor = new FilterProcessor();
        this.mFilterProcessor.init(bufferFormat.getBufferWidth(), bufferFormat.getBufferHeight());
    }

    public void onCaptureStarted(ParallelTaskData parallelTaskData) {
        this.mParallelTaskHashMap.put(Long.valueOf(parallelTaskData.getTimeStamp()), parallelTaskData);
    }

    public void onCaptureCompleted(@NonNull List<ICustomCaptureResult> list) {
        String str = TAG;
        StringBuilder stringBuilder = new StringBuilder();
        stringBuilder.append("onCaptureCompleted size:");
        stringBuilder.append(list.size());
        Log.d(str, stringBuilder.toString());
        for (ICustomCaptureResult iCustomCaptureResult : list) {
            long timeStamp = iCustomCaptureResult.getTimeStamp();
            ParallelTaskData parallelTaskData = (ParallelTaskData) this.mParallelTaskHashMap.get(Long.valueOf(timeStamp));
            String str2 = TAG;
            StringBuilder stringBuilder2 = new StringBuilder();
            stringBuilder2.append("onCaptureCompleted:");
            stringBuilder2.append(iCustomCaptureResult.getResults());
            stringBuilder2.append(" | ");
            stringBuilder2.append(timeStamp);
            stringBuilder2.append(" | ");
            stringBuilder2.append(parallelTaskData.getSavePath());
            Log.d(str2, stringBuilder2.toString());
            parallelTaskData.setCaptureResult(iCustomCaptureResult);
            this.mImageProcessor.dispatchCaptureResult(iCustomCaptureResult, 0);
        }
    }

    public void onCaptureFailed(String str, int i) {
        String str2 = TAG;
        StringBuilder stringBuilder = new StringBuilder();
        stringBuilder.append("onProcessError path:");
        stringBuilder.append(str);
        stringBuilder.append(", reason: ");
        stringBuilder.append(i);
        Log.v(str2, stringBuilder.toString());
    }

    public void addCapturePath(String str) {
        String str2 = TAG;
        StringBuilder stringBuilder = new StringBuilder();
        stringBuilder.append("addCapturePath: ");
        stringBuilder.append(str);
        Log.d(str2, stringBuilder.toString());
    }

    public void finish() {
        if (this.mImageProcessor != null) {
            this.mImageProcessor.goOffWork();
        }
        if (this.mWorkerThread != null) {
            this.mWorkerThread.quitSafely();
            try {
                this.mWorkerThread.join();
                this.mWorkerThread = null;
                this.mWorkerHandler = null;
            } catch (Throwable e) {
                Log.w(TAG, "finish: failed!", e);
            }
        }
    }

    public boolean needWaitImageClose() {
        String str = TAG;
        StringBuilder stringBuilder = new StringBuilder();
        stringBuilder.append("needWaitImageClose: needCloseImageNum =");
        stringBuilder.append(this.mNeedCloseImageNum);
        Log.d(str, stringBuilder.toString());
        return this.mNeedCloseImageNum >= this.mMaxImageQueueNum - 1;
    }

    private void tryToCloseSession() {
        if (this.mParallelTaskHashMap.isEmpty() && this.mShouldDestroyWhenTasksFinished) {
            Log.d(TAG, "tryToCloseSession: start");
            if (this.mTaskSession != null) {
                this.mTaskSession.close();
            }
            finish();
            deInit();
            if (this.mPostProcessStatusCallback != null) {
                this.mPostProcessStatusCallback.onPostProcessorClosed(this);
                return;
            }
            return;
        }
        Log.d(TAG, "tryToCloseSession: ignore");
    }

    public boolean isIdle() {
        return this.mParallelTaskHashMap.isEmpty();
    }

    public void setImageSaver(ImageSaver imageSaver) {
        this.mImageSaver = imageSaver;
    }

    public void destroyWhenTasksFinished() {
        this.mShouldDestroyWhenTasksFinished = true;
        tryToCloseSession();
    }
}
