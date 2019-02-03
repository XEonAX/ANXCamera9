package com.android.zxing;

import android.annotation.SuppressLint;
import android.graphics.Rect;
import android.graphics.YuvImage;
import android.media.Image;
import android.provider.MiuiSettings.ScreenEffect;
import com.android.camera.CameraSettings;
import com.android.camera.handgesture.HandGesture;
import com.android.camera.log.Log;
import com.android.camera.protocol.ModeCoordinatorImpl;
import com.android.camera.protocol.ModeProtocol.CameraAction;
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
import miui.os.Environment;

public class HandGestureDecoder extends Decoder {
    private static boolean DEBUG = false;
    public static final String TAG = "HandGestureDecoder";
    int mCameraId;
    HandGesture mHandGesture = new HandGesture();
    boolean mTriggeringPhoto = false;

    @SuppressLint({"CheckResult"})
    HandGestureDecoder() {
        DECODE_MAX_COUNT = 600;
        DECODE_AUTO_INTERVAL = 500;
        this.mEnable = true;
        Flowable.create(new FlowableOnSubscribe<PreviewImage>() {
            public void subscribe(FlowableEmitter<PreviewImage> flowableEmitter) throws Exception {
                HandGestureDecoder.this.mDecodeFlowableEmitter = flowableEmitter;
            }
        }, BackpressureStrategy.LATEST).observeOn(Schedulers.single()).map(new Function<PreviewImage, Boolean>() {
            public Boolean apply(PreviewImage previewImage) {
                switch (previewImage.getPreviewStatus()) {
                    case 1:
                        HandGestureDecoder.this.mHandGesture.init(previewImage.getCameraId());
                        break;
                    case 2:
                        if (HandGestureDecoder.DEBUG) {
                            HandGestureDecoder.this.dumpPreviewImage(previewImage);
                        }
                        return HandGestureDecoder.this.decode(previewImage);
                    case 3:
                        HandGestureDecoder.this.mHandGesture.unInit();
                        break;
                }
                return Boolean.valueOf(false);
            }
        }).observeOn(AndroidSchedulers.mainThread()).subscribe(new Consumer<Boolean>() {
            public void accept(Boolean bool) throws Exception {
                String str = HandGestureDecoder.TAG;
                StringBuilder stringBuilder = new StringBuilder();
                stringBuilder.append("onSuccess: result = ");
                stringBuilder.append(bool);
                Log.d(str, stringBuilder.toString());
                if (bool.booleanValue() && !HandGestureDecoder.this.mTriggeringPhoto) {
                    CameraAction cameraAction = (CameraAction) ModeCoordinatorImpl.getInstance().getAttachProtocol(161);
                    if (!(cameraAction == null || cameraAction.isDoingAction())) {
                        cameraAction.onShutterButtonClick(100);
                    }
                    HandGestureDecoder.this.mTriggeringPhoto = true;
                }
            }
        }, new Consumer<Throwable>() {
            public void accept(Throwable th) throws Exception {
                Log.d(HandGestureDecoder.TAG, "onError: ", th);
            }
        });
    }

    public boolean needPreviewFrame() {
        return super.needPreviewFrame() && CameraSettings.isHangGestureOpen();
    }

    public void init(int i) {
        reset();
        this.mCameraId = i;
        this.mDecodeFlowableEmitter.onNext(new PreviewImage(1, i));
    }

    public void startDecode() {
        this.mDecoding = true;
        this.mDecodingCount.set(0);
    }

    protected Boolean decode(PreviewImage previewImage) {
        int orientation = previewImage.getOrientation();
        boolean z = true;
        if (this.mCameraId == 1) {
            orientation = 270 - orientation;
        } else {
            orientation = (90 + orientation) % ScreenEffect.SCREEN_PAPER_MODE_TWILIGHT_START_DEAULT;
        }
        if (this.mHandGesture.detectGesture(previewImage.getData(), previewImage.getWidth(), previewImage.getHeight(), orientation) <= 0) {
            z = false;
        }
        return Boolean.valueOf(z);
    }

    public void reset() {
        this.mTriggeringPhoto = false;
        this.mDecodingCount.set(0);
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
