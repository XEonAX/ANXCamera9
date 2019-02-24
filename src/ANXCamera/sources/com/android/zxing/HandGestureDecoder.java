package com.android.zxing;

import android.annotation.SuppressLint;
import android.graphics.Rect;
import android.graphics.YuvImage;
import android.media.Image;
import android.provider.MiuiSettings.ScreenEffect;
import com.android.camera.CameraSettings;
import com.android.camera.R;
import com.android.camera.data.DataRepository;
import com.android.camera.handgesture.HandGesture;
import com.android.camera.log.Log;
import com.android.camera.protocol.ModeCoordinatorImpl;
import com.android.camera.protocol.ModeProtocol.CameraAction;
import com.android.camera.protocol.ModeProtocol.TopAlert;
import com.android.camera.storage.Storage;
import io.reactivex.BackpressureStrategy;
import io.reactivex.Flowable;
import io.reactivex.FlowableEmitter;
import io.reactivex.FlowableOnSubscribe;
import io.reactivex.android.schedulers.AndroidSchedulers;
import io.reactivex.functions.Consumer;
import io.reactivex.functions.Function;
import io.reactivex.schedulers.Schedulers;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.OutputStream;
import java.util.concurrent.atomic.AtomicInteger;
import miui.os.Environment;

public class HandGestureDecoder extends Decoder {
    private static boolean DEBUG = false;
    private static int DETECTION_FRAMES_PER_SECOND = 16;
    public static final String TAG = "HandGestureDecoder";
    private int mCameraId;
    private AtomicInteger mContinuousInterval = new AtomicInteger(0);
    private HandGesture mHandGesture = new HandGesture();
    private boolean mTargetDetected = false;
    int mTipShowInterval = DETECTION_FRAMES_PER_SECOND;
    private boolean mTipVisible = true;
    private boolean mTriggeringPhoto = false;

    @SuppressLint({"CheckResult"})
    HandGestureDecoder() {
        DECODE_MAX_COUNT = 5000;
        DECODE_AUTO_INTERVAL = (long) (1000 / DETECTION_FRAMES_PER_SECOND);
        this.mEnable = true;
        Flowable.create(new FlowableOnSubscribe<PreviewImage>() {
            public void subscribe(FlowableEmitter<PreviewImage> flowableEmitter) throws Exception {
                HandGestureDecoder.this.mDecodeFlowableEmitter = flowableEmitter;
            }
        }, BackpressureStrategy.LATEST).observeOn(Schedulers.single()).map(new Function<PreviewImage, Integer>() {
            public Integer apply(PreviewImage previewImage) {
                switch (previewImage.getPreviewStatus()) {
                    case 1:
                        HandGestureDecoder.this.mHandGesture.init(previewImage.getCameraId());
                        break;
                    case 2:
                        if (HandGestureDecoder.DEBUG) {
                            HandGestureDecoder.this.dumpPreviewImage(previewImage);
                        }
                        return Integer.valueOf(HandGestureDecoder.this.decode(previewImage));
                    case 3:
                        HandGestureDecoder.this.mHandGesture.unInit();
                        break;
                }
                return Integer.valueOf(-1);
            }
        }).observeOn(AndroidSchedulers.mainThread()).subscribe(new Consumer<Integer>() {
            public void accept(Integer num) throws Exception {
                String str = HandGestureDecoder.TAG;
                StringBuilder stringBuilder = new StringBuilder();
                stringBuilder.append("Detected rect left = ");
                stringBuilder.append(num);
                stringBuilder.append(" ");
                stringBuilder.append(HandGestureDecoder.this.mTipShowInterval);
                Log.d(str, stringBuilder.toString());
                if (num.intValue() >= 0) {
                    HandGestureDecoder.this.mTargetDetected = true;
                } else {
                    HandGestureDecoder.this.mTargetDetected = false;
                    HandGestureDecoder.this.mContinuousInterval.set(0);
                }
                if (!HandGestureDecoder.this.mTriggeringPhoto) {
                    String str2 = HandGestureDecoder.TAG;
                    StringBuilder stringBuilder2 = new StringBuilder();
                    stringBuilder2.append("Continuous interval: ");
                    stringBuilder2.append(HandGestureDecoder.this.mContinuousInterval.get());
                    Log.d(str2, stringBuilder2.toString());
                    if (HandGestureDecoder.this.mContinuousInterval.get() > 0) {
                        HandGestureDecoder.this.mContinuousInterval.getAndDecrement();
                    } else if (HandGestureDecoder.this.mTargetDetected) {
                        Log.d(HandGestureDecoder.TAG, "Triggering countdown...");
                        CameraAction cameraAction = (CameraAction) ModeCoordinatorImpl.getInstance().getAttachProtocol(161);
                        if (!(cameraAction == null || cameraAction.isDoingAction())) {
                            cameraAction.onShutterButtonClick(100);
                            HandGestureDecoder.this.mTriggeringPhoto = true;
                            HandGestureDecoder.this.mContinuousInterval.set(3 * HandGestureDecoder.DETECTION_FRAMES_PER_SECOND);
                            DataRepository.dataItemRunning().setHandGestureRunning(HandGestureDecoder.this.mTriggeringPhoto ^ true);
                            HandGestureDecoder.this.mTipVisible = false;
                            HandGestureDecoder.this.mTipShowInterval = HandGestureDecoder.DETECTION_FRAMES_PER_SECOND;
                        }
                    }
                    if (!HandGestureDecoder.this.mTipVisible && HandGestureDecoder.this.mTipShowInterval <= 0) {
                        DataRepository.dataItemRunning().setHandGestureRunning(true);
                        TopAlert topAlert = (TopAlert) ModeCoordinatorImpl.getInstance().getAttachProtocol(172);
                        if (topAlert != null) {
                            topAlert.alertTopHint(0, (int) R.string.hand_gesture_tip);
                        }
                        HandGestureDecoder.this.mTipVisible = true;
                    }
                    if (HandGestureDecoder.this.mTipShowInterval > 0) {
                        HandGestureDecoder handGestureDecoder = HandGestureDecoder.this;
                        handGestureDecoder.mTipShowInterval--;
                    }
                }
            }
        }, new Consumer<Throwable>() {
            public void accept(Throwable th) throws Exception {
                Log.d(HandGestureDecoder.TAG, "onError: ", th);
            }
        });
    }

    public boolean needPreviewFrame() {
        return super.needPreviewFrame() && CameraSettings.isHandGestureOpen();
    }

    public void init(int i) {
        reset();
        this.mCameraId = i;
        this.mDecodeFlowableEmitter.onNext(new PreviewImage(1, i));
        DataRepository.dataItemRunning().setHandGestureRunning(true);
    }

    public void startDecode() {
        this.mDecoding = true;
        this.mDecodingCount.set(0);
    }

    protected int decode(PreviewImage previewImage) {
        int orientation = previewImage.getOrientation();
        if (orientation == -1) {
            orientation = 0;
        }
        if (this.mCameraId == 1) {
            orientation = 270 - orientation;
        } else {
            orientation = (90 + orientation) % ScreenEffect.SCREEN_PAPER_MODE_TWILIGHT_START_DEAULT;
        }
        return this.mHandGesture.detectGesture(previewImage.getData(), previewImage.getWidth(), previewImage.getHeight(), orientation);
    }

    public void reset() {
        Log.d(TAG, "Reset");
        this.mDecodingCount.set(0);
        this.mTriggeringPhoto = false;
    }

    public void quit() {
        super.quit();
        this.mDecodeFlowableEmitter.onNext(new PreviewImage(3, this.mCameraId));
        this.mDecodeFlowableEmitter.onComplete();
    }

    public void onPreviewFrame(Image image, int i, int i2, int i3) {
        if (needPreviewFrame() && this.mDecodeFlowableEmitter != null) {
            this.mDecodeFlowableEmitter.onNext(new PreviewImage(image, i3));
        }
    }

    /* JADX WARNING: Removed duplicated region for block: B:21:0x0092 A:{SYNTHETIC, Splitter: B:21:0x0092} */
    /* Code decompiled incorrectly, please refer to instructions dump. */
    private void dumpPreviewImage(PreviewImage previewImage) {
        Throwable e;
        FileOutputStream fileOutputStream = null;
        try {
            long timestamp = previewImage.getTimestamp();
            int width = previewImage.getWidth();
            int height = previewImage.getHeight();
            StringBuilder stringBuilder = new StringBuilder();
            stringBuilder.append(Environment.getExternalStorageDirectory());
            stringBuilder.append("/DCIM/Camera/hand_");
            stringBuilder.append(String.valueOf(timestamp));
            stringBuilder.append(Storage.JPEG_SUFFIX);
            OutputStream fileOutputStream2 = new FileOutputStream(stringBuilder.toString());
            try {
                String str = TAG;
                stringBuilder = new StringBuilder();
                stringBuilder.append("PreviewImage timestamp: [");
                stringBuilder.append(timestamp);
                stringBuilder.append("]");
                Log.d(str, stringBuilder.toString());
                new YuvImage(previewImage.getData(), 17, width, height, null).compressToJpeg(new Rect(0, 0, width, height), 100, fileOutputStream2);
            } catch (IOException e2) {
                e = e2;
                fileOutputStream = fileOutputStream2;
            } catch (Throwable th) {
                e = th;
                fileOutputStream = fileOutputStream2;
                if (fileOutputStream != null) {
                }
                throw e;
            }
            try {
                fileOutputStream2.close();
            } catch (Throwable e3) {
                Log.e(TAG, "Close stream failed!", e3);
            }
        } catch (IOException e4) {
            e3 = e4;
            try {
                Log.e(TAG, "Dump preview Image failed!", e3);
                if (fileOutputStream != null) {
                    fileOutputStream.close();
                }
            } catch (Throwable th2) {
                e3 = th2;
                if (fileOutputStream != null) {
                    try {
                        fileOutputStream.close();
                    } catch (Throwable e5) {
                        Log.e(TAG, "Close stream failed!", e5);
                    }
                }
                throw e3;
            }
        }
    }
}
