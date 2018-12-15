package com.android.zxing;

import android.graphics.Rect;
import android.media.Image;
import android.os.Handler;
import android.os.HandlerThread;
import android.text.TextUtils;
import android.util.Log;
import com.android.camera.Util;
import com.android.camera.protocol.ModeCoordinatorImpl;
import com.android.camera.protocol.ModeProtocol.BottomPopupTips;
import com.android.camera2.Camera2Proxy;
import com.android.camera2.Camera2Proxy.PreviewCallback;
import com.google.zxing.BinaryBitmap;
import com.google.zxing.DecodeHintType;
import com.google.zxing.LuminanceSource;
import com.google.zxing.MultiFormatReader;
import com.google.zxing.Result;
import com.google.zxing.common.HybridBinarizer;
import io.reactivex.BackpressureStrategy;
import io.reactivex.Flowable;
import io.reactivex.FlowableEmitter;
import io.reactivex.FlowableOnSubscribe;
import io.reactivex.android.schedulers.AndroidSchedulers;
import io.reactivex.disposables.Disposable;
import io.reactivex.functions.Consumer;
import io.reactivex.functions.Function;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;
import java.util.concurrent.atomic.AtomicInteger;

public class QRCodeManager {
    private static final long DECODE_AUTO_INTERVAL = 1000;
    private static final int DECODE_MAX_COUNT = 15;
    private static final String TAG = "QRCodeManager";
    private volatile boolean mDecoding;
    private AtomicInteger mDecodingCount;
    private Handler mHandler;
    private final int mMaxFrameWidth;
    private final MultiFormatReader mMultiFormatReader;
    private PreviewCallback mPreviewCallback;
    private int mPreviewHeight;
    private int mPreviewWidth;
    private Disposable mQrCodeDisposable;
    private FlowableEmitter<PreviewImage> mQrCodeFlowableEmitter;
    private Rect mRectFinderCenter;
    private String mScanResult;

    private static class Singleton {
        public static final QRCodeManager INSTANCE = new QRCodeManager();

        private Singleton() {
        }
    }

    /* synthetic */ QRCodeManager(AnonymousClass1 anonymousClass1) {
        this();
    }

    private QRCodeManager() {
        this.mRectFinderCenter = new Rect(0, 0, 0, 0);
        this.mDecodingCount = new AtomicInteger(0);
        this.mPreviewCallback = new PreviewCallback() {
            private long mLastDecodeTime;

            public void onPreviewFrame(Image image, Camera2Proxy camera2Proxy) {
                if (QRCodeManager.this.mDecoding && QRCodeManager.this.mDecodingCount.get() < 15) {
                    long currentTimeMillis = System.currentTimeMillis();
                    if (currentTimeMillis - this.mLastDecodeTime >= QRCodeManager.DECODE_AUTO_INTERVAL) {
                        this.mLastDecodeTime = currentTimeMillis;
                        QRCodeManager.this.mDecodingCount.getAndIncrement();
                        String str = QRCodeManager.TAG;
                        StringBuilder stringBuilder = new StringBuilder();
                        stringBuilder.append("preview frame buffer received... mDecodingCount = ");
                        stringBuilder.append(QRCodeManager.this.mDecodingCount.get());
                        Log.v(str, stringBuilder.toString());
                        if (QRCodeManager.this.mQrCodeFlowableEmitter != null) {
                            QRCodeManager.this.mQrCodeFlowableEmitter.onNext(new PreviewImage(image, QRCodeManager.this.mPreviewWidth, QRCodeManager.this.mPreviewHeight));
                        }
                    }
                }
            }
        };
        this.mMultiFormatReader = new MultiFormatReader();
        Map hashMap = new HashMap(1);
        ArrayList arrayList = new ArrayList();
        arrayList.addAll(DecodeFormats.QR_CODE_FORMATS);
        hashMap.put(DecodeHintType.POSSIBLE_FORMATS, arrayList);
        this.mMultiFormatReader.setHints(hashMap);
        this.mMaxFrameWidth = Math.min(Util.sWindowWidth, Util.sWindowHeight);
    }

    public static QRCodeManager getInstance() {
        return Singleton.INSTANCE;
    }

    public PreviewCallback getPreviewCallback() {
        return this.mPreviewCallback;
    }

    public void setPreviewSize(int i, int i2) {
        if (!(this.mPreviewWidth == i && this.mPreviewHeight == i2)) {
            this.mPreviewWidth = i;
            this.mPreviewHeight = i2;
            int min = Math.min(Math.min(i, i2), this.mMaxFrameWidth);
            int i3 = (i - min) / 2;
            int i4 = (i2 - min) / 2;
            this.mRectFinderCenter.set(i3, i4, i3 + min, min + i4);
        }
        String str = TAG;
        StringBuilder stringBuilder = new StringBuilder();
        stringBuilder.append("setPreviewSize: ");
        stringBuilder.append(i);
        stringBuilder.append(" x ");
        stringBuilder.append(i2);
        stringBuilder.append("mRectFinderCenter = ");
        stringBuilder.append(this.mRectFinderCenter);
        Log.d(str, stringBuilder.toString());
    }

    public void init() {
        HandlerThread handlerThread = new HandlerThread(TAG);
        handlerThread.start();
        this.mHandler = new Handler(handlerThread.getLooper());
    }

    public Handler getHandler() {
        return this.mHandler;
    }

    public void quit() {
        if (this.mHandler != null) {
            this.mHandler.removeCallbacksAndMessages(null);
            this.mHandler.getLooper().quitSafely();
        }
        this.mHandler = null;
    }

    public void startDecode() {
        this.mQrCodeDisposable = Flowable.create(new FlowableOnSubscribe<PreviewImage>() {
            public void subscribe(FlowableEmitter<PreviewImage> flowableEmitter) throws Exception {
                QRCodeManager.this.mQrCodeFlowableEmitter = flowableEmitter;
            }
        }, BackpressureStrategy.DROP).map(new Function<PreviewImage, String>() {
            public String apply(PreviewImage previewImage) {
                Object data = previewImage.getData();
                String str = QRCodeManager.TAG;
                StringBuilder stringBuilder = new StringBuilder();
                stringBuilder.append("decode: bytes = ");
                stringBuilder.append(data);
                Log.d(str, stringBuilder.toString());
                return QRCodeManager.this.decode(data, QRCodeManager.this.mPreviewWidth, QRCodeManager.this.mPreviewHeight);
            }
        }).observeOn(AndroidSchedulers.mainThread()).subscribe(new Consumer<String>() {
            public void accept(String str) throws Exception {
                String str2 = QRCodeManager.TAG;
                StringBuilder stringBuilder = new StringBuilder();
                stringBuilder.append("onSuccess: result = ");
                stringBuilder.append(str);
                Log.d(str2, stringBuilder.toString());
                QRCodeManager.this.mScanResult = str;
                BottomPopupTips bottomPopupTips = (BottomPopupTips) ModeCoordinatorImpl.getInstance().getAttachProtocol(175);
                if (TextUtils.isEmpty(str)) {
                    QRCodeManager.this.mDecoding = true;
                    bottomPopupTips.hideQrCodeTip();
                    return;
                }
                QRCodeManager.this.mDecoding = false;
                bottomPopupTips.showQrCodeTip();
            }
        }, new Consumer<Throwable>() {
            public void accept(Throwable th) throws Exception {
                Log.d(QRCodeManager.TAG, "onError: ", th);
            }
        });
        this.mDecoding = true;
        this.mDecodingCount.set(0);
    }

    public void stopDecode() {
        if (!(this.mQrCodeDisposable == null || this.mQrCodeDisposable.isDisposed())) {
            this.mQrCodeDisposable.dispose();
        }
        this.mDecoding = false;
    }

    private String decode(byte[] bArr, int i, int i2) {
        int i3 = i * i2;
        byte[] bArr2 = new byte[i3];
        if (bArr.length > i3) {
            System.arraycopy(bArr, 0, bArr2, 0, bArr2.length);
            bArr = bArr2;
        }
        String str = "";
        LuminanceSource buildLuminanceSource = buildLuminanceSource(bArr, i, i2);
        if (buildLuminanceSource == null) {
            return str;
        }
        try {
            Result decodeWithState = this.mMultiFormatReader.decodeWithState(new BinaryBitmap(new HybridBinarizer(buildLuminanceSource)));
            if (decodeWithState != null) {
                str = decodeWithState.getText();
            }
        } catch (Throwable e) {
            Log.e(TAG, "decode: ReaderException: ", e);
        } catch (Throwable th) {
            this.mMultiFormatReader.reset();
        }
        this.mMultiFormatReader.reset();
        return str;
    }

    private YUVLuminanceSource buildLuminanceSource(byte[] bArr, int i, int i2) {
        try {
            if (this.mRectFinderCenter.isEmpty()) {
                return new YUVLuminanceSource(bArr, i, i2, 0, 0, i, i2);
            }
            return new YUVLuminanceSource(bArr, i, i2, this.mRectFinderCenter.left, this.mRectFinderCenter.top, this.mRectFinderCenter.width(), this.mRectFinderCenter.height());
        } catch (IllegalArgumentException e) {
            return null;
        }
    }

    public String getScanResult() {
        return this.mScanResult;
    }
}
