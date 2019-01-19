package com.xiaomi.camera.core;

import android.content.Context;
import android.media.Image;
import android.media.ImageReader;
import android.media.ImageReader.OnImageAvailableListener;
import android.os.Handler;
import android.os.HandlerThread;
import android.support.annotation.NonNull;
import android.util.Size;
import android.view.Surface;
import com.android.camera.log.Log;
import com.android.camera.storage.ImageSaver;
import com.ss.android.ttve.common.TEDefine;
import com.xiaomi.camera.base.ImageUtil;
import com.xiaomi.camera.base.PerformanceTracker;
import com.xiaomi.camera.core.CaptureData.CaptureDataBean;
import com.xiaomi.camera.core.ImageProcessor.ImageProcessorStatusCallback;
import com.xiaomi.camera.core.ParallelDataZipper.DataListener;
import com.xiaomi.camera.imagecodec.JpegEncoder;
import com.xiaomi.camera.imagecodec.ReprocessData;
import com.xiaomi.camera.imagecodec.ReprocessData.OnDataAvailableListener;
import com.xiaomi.engine.BufferFormat;
import com.xiaomi.engine.MiCameraAlgo;
import com.xiaomi.engine.TaskSession;
import com.xiaomi.engine.TaskSession.SessionStatusCallback;
import com.xiaomi.protocol.ICustomCaptureResult;
import com.xiaomi.protocol.IImageReaderParameterSets;
import java.io.File;
import java.util.ArrayList;
import java.util.List;
import java.util.Locale;
import java.util.concurrent.ConcurrentHashMap;
import miui.os.Build;

public class PostProcessor {
    private static final String TAG = PostProcessor.class.getSimpleName();
    private CaptureDataListener mCaptureDataListener = new CaptureDataListener() {
        public void onCaptureDataAvailable(@NonNull CaptureData captureData) {
            long captureTimeStamp = captureData.getCaptureTimeStamp();
            int algoType = captureData.getAlgoType();
            if (algoType == 2 || algoType == 5) {
                CaptureDataBean multiFrameProcessResult = captureData.getMultiFrameProcessResult();
                if (multiFrameProcessResult != null) {
                    ParallelTaskData parallelTaskData = (ParallelTaskData) PostProcessor.this.mParallelTaskHashMap.get(Long.valueOf(captureTimeStamp));
                    long timeStamp = multiFrameProcessResult.getResult().getTimeStamp();
                    String access$000 = PostProcessor.TAG;
                    StringBuilder stringBuilder = new StringBuilder();
                    stringBuilder.append("[1] onCaptureDataAvailable: timestamp: ");
                    stringBuilder.append(captureTimeStamp);
                    stringBuilder.append(" | ");
                    stringBuilder.append(timeStamp);
                    Log.d(access$000, stringBuilder.toString());
                    if (timeStamp != captureTimeStamp) {
                        parallelTaskData.setTimeStamp(timeStamp);
                        PostProcessor.this.mParallelTaskHashMap.remove(Long.valueOf(captureTimeStamp));
                        PostProcessor.this.mParallelTaskHashMap.put(Long.valueOf(timeStamp), parallelTaskData);
                    }
                    if (algoType == 5 && parallelTaskData.getDataParameter().isSaveGroupshotPrimitive()) {
                        for (int i = 0; i < captureData.getCaptureDataBeanList().size(); i++) {
                            ParallelTaskData cloneTaskData = parallelTaskData.cloneTaskData(i);
                            long timeStamp2 = ((CaptureDataBean) captureData.getCaptureDataBeanList().get(i)).getResult().getTimeStamp();
                            if (timeStamp2 == timeStamp) {
                                timeStamp2++;
                            }
                            cloneTaskData.setTimeStamp(timeStamp2);
                            PostProcessor.this.mParallelTaskHashMap.put(Long.valueOf(timeStamp2), cloneTaskData);
                            access$000 = PostProcessor.TAG;
                            StringBuilder stringBuilder2 = new StringBuilder();
                            stringBuilder2.append("[1] onCaptureDataAvailable: add ");
                            stringBuilder2.append(timeStamp2);
                            Log.d(access$000, stringBuilder2.toString());
                        }
                    }
                    captureData.getCaptureDataBeanList().add(multiFrameProcessResult);
                } else {
                    throw new RuntimeException("No multi-frame process result!");
                }
            }
            ParallelTaskData parallelTaskData2;
            if (algoType == 4) {
                CaptureDataBean captureDataBean = (CaptureDataBean) captureData.getCaptureDataBeanList().get(0);
                ICustomCaptureResult result = captureDataBean.getResult();
                Image mainImage = captureDataBean.getMainImage();
                parallelTaskData2 = (ParallelTaskData) PostProcessor.this.mParallelTaskHashMap.get(Long.valueOf(captureTimeStamp));
                if (parallelTaskData2 != null) {
                    parallelTaskData2.setCaptureResult(result);
                    PostProcessor.this.mImageProcessorStatusCallback.onImageProcessStart(mainImage.getTimestamp());
                    PostProcessor.this.mImageProcessorStatusCallback.onImageProcessed(mainImage, 0);
                } else {
                    String access$0002 = PostProcessor.TAG;
                    StringBuilder stringBuilder3 = new StringBuilder();
                    stringBuilder3.append("[1] onCaptureDataAvailable: no captureResult ");
                    stringBuilder3.append(captureTimeStamp);
                    Log.e(access$0002, stringBuilder3.toString());
                }
                mainImage.close();
                onOriginalImageClosed(mainImage);
            } else {
                List<CaptureDataBean> captureDataBeanList = captureData.getCaptureDataBeanList();
                if (captureDataBeanList != null && !captureDataBeanList.isEmpty()) {
                    for (CaptureDataBean captureDataBean2 : captureDataBeanList) {
                        if (captureDataBean2.isFirstResult()) {
                            long timeStamp3 = captureDataBean2.getResult().getTimeStamp();
                            parallelTaskData2 = (ParallelTaskData) PostProcessor.this.mParallelTaskHashMap.get(Long.valueOf(timeStamp3));
                            if (parallelTaskData2 != null) {
                                parallelTaskData2.setCaptureResult(captureDataBean2.getResult());
                            } else {
                                String access$0003 = PostProcessor.TAG;
                                StringBuilder stringBuilder4 = new StringBuilder();
                                stringBuilder4.append("[1] onCaptureDataAvailable: no captureResult ");
                                stringBuilder4.append(timeStamp3);
                                Log.e(access$0003, stringBuilder4.toString());
                            }
                        }
                        if (PostProcessor.this.mImageProcessor != null) {
                            PostProcessor.this.mImageProcessor.dispatchTask(captureDataBean2);
                        } else {
                            throw new RuntimeException("ImageProcessor is not allowed to be null");
                        }
                    }
                } else if (Build.IS_DEBUGGABLE) {
                    throw new RuntimeException("There are no result to process!");
                } else {
                    Log.e(PostProcessor.TAG, "[1] onCaptureDataAvailable: There are no result to process!");
                }
            }
        }

        public void onOriginalImageClosed(Image image) {
            PostProcessor.this.mImageMemoryManager.releaseAnImage(image);
        }
    };
    private CaptureStatusListener mCaptureStatusListener = new CaptureStatusListener();
    private int mCurrentAlgoType = 0;
    private DataListener mDataListener = new DataListener() {
        public void onParallelDataAvailable(@NonNull CaptureData captureData) {
            String access$000 = PostProcessor.TAG;
            StringBuilder stringBuilder = new StringBuilder();
            stringBuilder.append("onParallelDataAvailable: ");
            stringBuilder.append(captureData);
            Log.d(access$000, stringBuilder.toString());
            if (Build.IS_DEBUGGABLE) {
                for (CaptureDataBean captureDataBean : captureData.getCaptureDataBeanList()) {
                    Log.d(PostProcessor.TAG, "[TIMESTAMP] onParallelDataAvailable: ------------------------");
                    String access$0002 = PostProcessor.TAG;
                    StringBuilder stringBuilder2 = new StringBuilder();
                    stringBuilder2.append("[TIMESTAMP] Result timestamp: ");
                    stringBuilder2.append(captureDataBean.getResult().getTimeStamp());
                    Log.d(access$0002, stringBuilder2.toString());
                }
            }
            int algoType = captureData.getAlgoType();
            if (algoType != 4) {
                PostProcessor.this.mImageProcessorStatusCallback.onImageProcessStart(captureData.getCaptureTimeStamp());
            }
            if (algoType == 2) {
                captureData.setMultiFrameProcessListener(PostProcessor.this.mCaptureDataListener);
                MultiFrameProcessor.getInstance().processData(captureData);
            } else if (algoType == 5) {
                captureData.setMultiFrameProcessListener(PostProcessor.this.mCaptureDataListener);
                ParallelTaskData parallelTaskData = (ParallelTaskData) PostProcessor.this.mParallelTaskHashMap.get(Long.valueOf(captureData.getCaptureTimeStamp()));
                if (parallelTaskData != null && parallelTaskData.getDataParameter().isSaveGroupshotPrimitive()) {
                    captureData.setSaveInputImage(true);
                }
                MultiFrameProcessor.getInstance().processData(captureData);
            } else {
                PostProcessor.this.mCaptureDataListener.onCaptureDataAvailable(captureData);
            }
        }
    };
    private FilterProcessor mFilterProcessor;
    private ImageMemoryManager mImageMemoryManager;
    private ImageProcessor mImageProcessor;
    private ImageProcessorStatusCallback mImageProcessorStatusCallback = new ImageProcessorStatusCallback() {
        public void onImageProcessed(Image image, int i) {
            long timestamp = image.getTimestamp();
            StringBuilder stringBuilder = new StringBuilder();
            stringBuilder.append(timestamp);
            stringBuilder.append(File.separator);
            stringBuilder.append(i);
            String stringBuilder2 = stringBuilder.toString();
            String access$000 = PostProcessor.TAG;
            StringBuilder stringBuilder3 = new StringBuilder();
            stringBuilder3.append("[2][TIMESTAMP] onImageProcessed: ");
            stringBuilder3.append(image);
            stringBuilder3.append(" ： ");
            stringBuilder3.append(stringBuilder2);
            Log.d(access$000, stringBuilder3.toString());
            if (i == 2) {
                PerformanceTracker.trackJpegReprocess(i, 0);
                PostProcessor.this.mJpegEncoderListener.onJpegAvailable(ImageUtil.getFirstPlane(image), stringBuilder2);
                return;
            }
            ParallelTaskData parallelTaskData = (ParallelTaskData) PostProcessor.this.mParallelTaskHashMap.get(Long.valueOf(timestamp));
            if (parallelTaskData != null) {
                if (PostProcessor.this.mCurrentAlgoType != 4) {
                    Size pictureSize = parallelTaskData.getDataParameter().getPictureSize();
                    String access$0002 = PostProcessor.TAG;
                    Object[] objArr = new Object[2];
                    objArr[0] = pictureSize;
                    StringBuilder stringBuilder4 = new StringBuilder();
                    stringBuilder4.append(image.getWidth());
                    stringBuilder4.append("x");
                    stringBuilder4.append(image.getHeight());
                    objArr[1] = stringBuilder4.toString();
                    Log.d(access$0002, String.format(Locale.ENGLISH, "[2] onImageProcessed: pictureSize is: %s, imageSize is: %s", objArr));
                    PostProcessor.this.mFilterProcessor.doFilterSync(parallelTaskData, image, i);
                }
                ICustomCaptureResult captureResult = parallelTaskData.getCaptureResult();
                String access$0003 = PostProcessor.TAG;
                stringBuilder = new StringBuilder();
                stringBuilder.append("[2] onImageProcessed: mCaptureResult = ");
                stringBuilder.append(captureResult.getResults());
                Log.d(access$0003, stringBuilder.toString());
                access$0003 = PostProcessor.TAG;
                stringBuilder = new StringBuilder();
                stringBuilder.append("[2] onImageProcessed: send jpeg Encoder image target is: ");
                stringBuilder.append(stringBuilder2);
                Log.d(access$0003, stringBuilder.toString());
                ParallelTaskDataParameter dataParameter = parallelTaskData.getDataParameter();
                ReprocessData reprocessData = new ReprocessData(image, stringBuilder2, captureResult, dataParameter.isFrontCamera(), dataParameter.getOutputSize().getWidth(), dataParameter.getOutputSize().getHeight(), PostProcessor.this.mJpegEncoderListener);
                PerformanceTracker.trackJpegReprocess(i, 0);
                JpegEncoder.instance().doReprocess(reprocessData);
                return;
            }
            throw new RuntimeException("parallelTaskData is null, maybe timeStamp is not matched");
        }

        public void onImageProcessFailed(Image image, String str) {
            Object image2;
            String access$000 = PostProcessor.TAG;
            StringBuilder stringBuilder = new StringBuilder();
            stringBuilder.append("onImageProcessFailed: image=");
            if (image2 == null) {
                image2 = TEDefine.FACE_BEAUTY_NULL;
            }
            stringBuilder.append(image2);
            stringBuilder.append(" reason=");
            stringBuilder.append(str);
            Log.d(access$000, stringBuilder.toString());
        }

        public void onOriginalImageClosed(Image image) {
            PostProcessor.this.mCaptureDataListener.onOriginalImageClosed(image);
            String access$000 = PostProcessor.TAG;
            StringBuilder stringBuilder = new StringBuilder();
            stringBuilder.append("onOriginalImageClosed: ");
            stringBuilder.append(image);
            Log.d(access$000, stringBuilder.toString());
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
    private OnDataAvailableListener mJpegEncoderListener = new OnDataAvailableListener() {
        public void onJpegAvailable(byte[] bArr, String str) {
            String[] split = str.split(File.separator);
            long parseLong = Long.parseLong(split[0]);
            int parseInt = Integer.parseInt(split[1]);
            PerformanceTracker.trackJpegReprocess(parseInt, 1);
            ParallelTaskData parallelTaskData = (ParallelTaskData) PostProcessor.this.mParallelTaskHashMap.get(Long.valueOf(parseLong));
            parallelTaskData.fillJpegData(bArr, parseInt);
            String access$000 = PostProcessor.TAG;
            StringBuilder stringBuilder = new StringBuilder();
            stringBuilder.append("[3] onJpegAvailable: ");
            stringBuilder.append(parseLong);
            stringBuilder.append(" | ");
            stringBuilder.append(parseInt);
            stringBuilder.append(" | ");
            stringBuilder.append(bArr.length);
            Log.d(access$000, stringBuilder.toString());
            if (parallelTaskData.isJpegDataReady()) {
                Log.d(PostProcessor.TAG, "[3] onJpegAvailable: save image start");
                PostProcessor.this.mImageSaver.onParallelProcessFinish(parallelTaskData);
                parallelTaskData.setDeparted();
                PostProcessor.this.mParallelTaskHashMap.remove(Long.valueOf(parseLong));
                String access$0002 = PostProcessor.TAG;
                StringBuilder stringBuilder2 = new StringBuilder();
                stringBuilder2.append("[3] onJpegAvailable: mParallelTaskHashMap remove ");
                stringBuilder2.append(parseLong);
                Log.d(access$0002, stringBuilder2.toString());
            } else {
                Log.d(PostProcessor.TAG, "[3] onJpegAvailable: jpeg data isn't ready, save action has been ignored.");
            }
            PostProcessor.this.tryToCloseSession();
        }

        public void onYuvAvailable(Image image, String str) {
        }
    };
    private ConcurrentHashMap<Long, ParallelTaskData> mParallelTaskHashMap = new ConcurrentHashMap();
    private PostProcessStatusCallback mPostProcessStatusCallback;
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
        }
    };
    private boolean mShouldDestroyWhenTasksFinished = false;
    private List<Surface> mSurfaceList = new ArrayList();
    private TaskSession mTaskSession;
    private Handler mWorkerHandler;
    private HandlerThread mWorkerThread = new HandlerThread("CallbackHandleThread");

    public interface PostProcessStatusCallback {
        void onImagePostProcessStart(ParallelTaskData parallelTaskData);

        void onPostProcessorClosed(PostProcessor postProcessor);
    }

    public class CaptureStatusListener {
        public void onCaptureStarted(@NonNull ParallelTaskData parallelTaskData) {
            long timeStamp = parallelTaskData.getTimeStamp();
            String access$000 = PostProcessor.TAG;
            StringBuilder stringBuilder = new StringBuilder();
            stringBuilder.append("[0][TIMESTAMP] onCaptureStarted: add parallelTaskData, timestamp = ");
            stringBuilder.append(timeStamp);
            Log.d(access$000, stringBuilder.toString());
            PostProcessor.this.mParallelTaskHashMap.put(Long.valueOf(timeStamp), parallelTaskData);
            int algoType = parallelTaskData.getAlgoType();
            int i = PostProcessor.this.mImageProcessor instanceof DualCameraProcessor ? 2 : 1;
            int burstNum = parallelTaskData.getBurstNum();
            PostProcessor.this.mCurrentAlgoType = algoType;
            ParallelDataZipper.getInstance().prepare(algoType, i, burstNum, PostProcessor.this.mDataListener);
        }

        public void onCaptureCompleted(ICustomCaptureResult iCustomCaptureResult, boolean z) {
            String access$000 = PostProcessor.TAG;
            StringBuilder stringBuilder = new StringBuilder();
            stringBuilder.append("[0][TIMESTAMP] onCaptureCompleted: timeStamp = ");
            stringBuilder.append(iCustomCaptureResult.getTimeStamp());
            Log.d(access$000, stringBuilder.toString());
            ParallelDataZipper.getInstance().join(iCustomCaptureResult, z);
        }

        public void onCaptureFailed(long j, int i) {
            String access$000 = PostProcessor.TAG;
            StringBuilder stringBuilder = new StringBuilder();
            stringBuilder.append("[0] onCaptureFailed: reason=");
            stringBuilder.append(i);
            Log.v(access$000, stringBuilder.toString());
            PostProcessor.this.mParallelTaskHashMap.remove(Long.valueOf(j));
        }
    }

    private class ImageAvailableListener implements OnImageAvailableListener {
        private int mImageFlag;

        ImageAvailableListener(int i) {
            this.mImageFlag = i;
        }

        public void onImageAvailable(ImageReader imageReader) {
            if (imageReader == null) {
                Log.e(PostProcessor.TAG, "[0] onImageAvailable: null imageReader!");
                return;
            }
            PostProcessor.this.mImageMemoryManager.waitImageCloseIfNeeded();
            Image acquireNextImage = imageReader.acquireNextImage();
            String access$000 = PostProcessor.TAG;
            StringBuilder stringBuilder = new StringBuilder();
            stringBuilder.append("[0][TIMESTAMP] onImageAvailable: timestamp = ");
            stringBuilder.append(acquireNextImage.getTimestamp());
            Log.d(access$000, stringBuilder.toString());
            PostProcessor.this.mImageMemoryManager.holdAnImage(acquireNextImage);
            ParallelDataZipper.getInstance().join(acquireNextImage, this.mImageFlag);
        }
    }

    public boolean needWaitImageClose() {
        boolean z = this.mImageMemoryManager != null && this.mImageMemoryManager.needWaitImageClose();
        String str = TAG;
        StringBuilder stringBuilder = new StringBuilder();
        stringBuilder.append("needWaitImageClose: return ");
        stringBuilder.append(z);
        Log.c(str, stringBuilder.toString());
        return z;
    }

    public PostProcessor(Context context, PostProcessStatusCallback postProcessStatusCallback) {
        this.mWorkerThread.start();
        this.mWorkerHandler = new Handler(this.mWorkerThread.getLooper());
        this.mPostProcessStatusCallback = postProcessStatusCallback;
        init();
    }

    public void init() {
    }

    public void deInit() {
        if (this.mFilterProcessor != null) {
            this.mFilterProcessor.deInit();
            this.mFilterProcessor = null;
        }
        if (!this.mImageReaderList.isEmpty()) {
            for (ImageReader close : this.mImageReaderList) {
                close.close();
            }
            this.mImageReaderList.clear();
        }
        if (!this.mSurfaceList.isEmpty()) {
            this.mSurfaceList.clear();
        }
    }

    public List<Surface> configHALOutputSurface(@NonNull List<IImageReaderParameterSets> list) {
        String str = TAG;
        StringBuilder stringBuilder = new StringBuilder();
        stringBuilder.append("configHALOutputSurface: paramsNum=");
        stringBuilder.append(list.size());
        Log.d(str, stringBuilder.toString());
        if (!this.mImageReaderList.isEmpty()) {
            this.mImageReaderList.clear();
        }
        if (!this.mSurfaceList.isEmpty()) {
            this.mSurfaceList.clear();
        }
        int i = 0;
        for (IImageReaderParameterSets iImageReaderParameterSets : list) {
            if (iImageReaderParameterSets.isShouldHoldImages()) {
                i += iImageReaderParameterSets.maxImages;
            }
            ImageReader newInstance = ImageReader.newInstance(iImageReaderParameterSets.width, iImageReaderParameterSets.height, iImageReaderParameterSets.format, iImageReaderParameterSets.maxImages);
            newInstance.setOnImageAvailableListener(new ImageAvailableListener(iImageReaderParameterSets.targetCamera), this.mWorkerHandler);
            this.mSurfaceList.add(newInstance.getSurface());
            this.mImageReaderList.add(newInstance);
        }
        this.mImageMemoryManager = new ImageMemoryManager(i);
        return this.mSurfaceList;
    }

    public List<Surface> getSurfaceList() {
        return this.mSurfaceList;
    }

    public CaptureStatusListener getCaptureStatusListener() {
        return this.mCaptureStatusListener;
    }

    public void configCaptureSession(BufferFormat bufferFormat, int i) {
        Object obj = bufferFormat.getGraphDescriptor().getOperationModeID() == 32770 ? 1 : null;
        if (this.mImageProcessor != null) {
            this.mImageProcessor.goOffWork();
            this.mImageProcessor = null;
        }
        int max = Math.max(15, 28);
        if (bufferFormat.getGraphDescriptor().getStreamNumber() != 2 || obj == null) {
            this.mImageProcessor = new SingleCameraProcessor(this.mImageProcessorStatusCallback);
            this.mImageProcessor.startWork();
            this.mTaskSession = MiCameraAlgo.createSessionByOutputConfigurations(bufferFormat, this.mImageProcessor.configOutputConfigurations(bufferFormat), this.mSessionStatusCallback, max);
        } else {
            this.mImageProcessor = new DualCameraProcessor(this.mImageProcessorStatusCallback);
            this.mImageProcessor.startWork();
            this.mTaskSession = MiCameraAlgo.createSessionByOutputConfigurations(bufferFormat, this.mImageProcessor.configOutputConfigurations(bufferFormat), this.mSessionStatusCallback, 2 * max);
        }
        this.mImageProcessor.setTaskSession(this.mTaskSession);
        if (this.mFilterProcessor != null) {
            this.mFilterProcessor.deInit();
            this.mFilterProcessor = null;
        }
        this.mFilterProcessor = new FilterProcessor();
        this.mFilterProcessor.init(new Size(bufferFormat.getBufferWidth(), bufferFormat.getBufferHeight()));
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
