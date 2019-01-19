package com.android.zxing;

import android.provider.MiuiSettings.ScreenEffect;
import com.android.camera.CameraSettings;
import com.android.camera.handgesture.HandGesture;
import com.android.camera.log.Log;
import com.android.camera.protocol.ModeCoordinatorImpl;
import com.android.camera.protocol.ModeProtocol.CameraAction;
import io.reactivex.BackpressureStrategy;
import io.reactivex.Flowable;
import io.reactivex.FlowableEmitter;
import io.reactivex.FlowableOnSubscribe;
import io.reactivex.android.schedulers.AndroidSchedulers;
import io.reactivex.functions.Consumer;
import io.reactivex.functions.Function;

public class HandGestureDecoder extends Decoder {
    public static final String TAG = "HandGestureDecoder";
    int mCameraId;
    HandGesture mHandGesture = new HandGesture();
    boolean mTriggeringPhoto = false;

    HandGestureDecoder() {
        DECODE_MAX_COUNT = 300;
        this.mEnable = true;
    }

    public boolean needPreviewFrame() {
        return super.needPreviewFrame() && CameraSettings.isHangGestureOpen();
    }

    public void reConfig(int i) {
        this.mHandGesture.unInit();
        this.mHandGesture.init(i);
        this.mCameraId = i;
    }

    public void startDecode() {
        this.mDecodeDisposable = Flowable.create(new FlowableOnSubscribe<PreviewImage>() {
            public void subscribe(FlowableEmitter<PreviewImage> flowableEmitter) throws Exception {
                HandGestureDecoder.this.mDecodeFlowableEmitter = flowableEmitter;
            }
        }, BackpressureStrategy.DROP).map(new Function<PreviewImage, Boolean>() {
            public Boolean apply(PreviewImage previewImage) {
                Object data = previewImage.getData();
                String str = HandGestureDecoder.TAG;
                StringBuilder stringBuilder = new StringBuilder();
                stringBuilder.append("decode: bytes = ");
                stringBuilder.append(data);
                stringBuilder.append(" timeStamp: ");
                stringBuilder.append(previewImage.getTimestamp());
                Log.d(str, stringBuilder.toString());
                return HandGestureDecoder.this.decode(data, previewImage.getWidth(), previewImage.getHeight(), previewImage.getOrientation());
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
        this.mDecoding = true;
        this.mDecodingCount.set(0);
    }

    protected Boolean decode(byte[] bArr, int i, int i2, int i3) {
        boolean z = true;
        if (this.mCameraId == 1) {
            i3 = 270 - i3;
        } else {
            i3 = (90 + i3) % ScreenEffect.SCREEN_PAPER_MODE_TWILIGHT_START_DEAULT;
        }
        if (this.mHandGesture.detectGesture(bArr, i, i2, i3) <= 0) {
            z = false;
        }
        return Boolean.valueOf(z);
    }

    public void reset() {
        this.mTriggeringPhoto = false;
        this.mDecodingCount.set(0);
    }
}
