package com.android.zxing;

import android.graphics.Rect;
import android.media.Image;
import android.text.TextUtils;
import com.android.camera.Util;
import com.android.camera.log.Log;
import com.android.camera.protocol.ModeCoordinatorImpl;
import com.android.camera.protocol.ModeProtocol.BottomPopupTips;
import com.google.zxing.BinaryBitmap;
import com.google.zxing.DecodeHintType;
import com.google.zxing.MultiFormatReader;
import com.google.zxing.ReaderException;
import com.google.zxing.Result;
import com.google.zxing.common.HybridBinarizer;
import io.reactivex.BackpressureStrategy;
import io.reactivex.Flowable;
import io.reactivex.FlowableEmitter;
import io.reactivex.FlowableOnSubscribe;
import io.reactivex.android.schedulers.AndroidSchedulers;
import io.reactivex.functions.Consumer;
import io.reactivex.functions.Function;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

public class QrDecoder extends Decoder {
    public static final String TAG = "QrDecoder";
    private final int mMaxFrameWidth;
    private final MultiFormatReader mMultiFormatReader = new MultiFormatReader();
    private Rect mRectFinderCenter = new Rect(0, 0, 0, 0);
    private String mScanResult = "";

    QrDecoder() {
        Map hashMap = new HashMap(1);
        ArrayList arrayList = new ArrayList();
        arrayList.addAll(DecodeFormats.QR_CODE_FORMATS);
        hashMap.put(DecodeHintType.POSSIBLE_FORMATS, arrayList);
        this.mMultiFormatReader.setHints(hashMap);
        this.mMaxFrameWidth = Math.min(Util.sWindowWidth, Util.sWindowHeight);
        this.mEnable = true;
    }

    public void onPreviewFrame(Image image, int i, int i2, int i3) {
        if (needPreviewFrame() && this.mDecodeFlowableEmitter != null) {
            this.mDecodeFlowableEmitter.onNext(new PreviewImage(image, i, i2, i3));
        }
    }

    public void updatePreviewSize(int i, int i2) {
        int min = Math.min(Math.min(i, i2), this.mMaxFrameWidth);
        int i3 = (i - min) / 2;
        int i4 = (i2 - min) / 2;
        this.mRectFinderCenter.set(i3, i4, i3 + min, min + i4);
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

    protected String decode(byte[] bArr, int i, int i2) {
        int i3 = i * i2;
        byte[] bArr2 = new byte[i3];
        if (bArr.length > i3) {
            System.arraycopy(bArr, 0, bArr2, 0, bArr2.length);
            bArr = bArr2;
        }
        String str = "";
        YUVLuminanceSource buildLuminanceSource = buildLuminanceSource(bArr, i, i2);
        if (buildLuminanceSource == null) {
            return str;
        }
        try {
            Result decodeWithState = this.mMultiFormatReader.decodeWithState(new BinaryBitmap(new HybridBinarizer(buildLuminanceSource)));
            if (decodeWithState != null) {
                str = decodeWithState.getText();
            }
        } catch (ReaderException e) {
            Log.e(TAG, "decode: ReaderException: ", e);
        } catch (Throwable th) {
            this.mMultiFormatReader.reset();
        }
        this.mMultiFormatReader.reset();
        return str;
    }

    public void init(int i) {
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

    public void startDecode() {
        this.mDecodeDisposable = Flowable.create(new FlowableOnSubscribe<PreviewImage>() {
            public void subscribe(FlowableEmitter<PreviewImage> flowableEmitter) throws Exception {
                QrDecoder.this.mDecodeFlowableEmitter = flowableEmitter;
            }
        }, BackpressureStrategy.DROP).map(new Function<PreviewImage, String>() {
            public String apply(PreviewImage previewImage) {
                Object data = previewImage.getData();
                String str = QrDecoder.TAG;
                StringBuilder stringBuilder = new StringBuilder();
                stringBuilder.append("decode: bytes = ");
                stringBuilder.append(data);
                Log.d(str, stringBuilder.toString());
                return QrDecoder.this.decode(data, previewImage.getWidth(), previewImage.getHeight());
            }
        }).observeOn(AndroidSchedulers.mainThread()).subscribe(new Consumer<String>() {
            public void accept(String str) throws Exception {
                int isEmpty;
                String str2 = QrDecoder.TAG;
                StringBuilder stringBuilder = new StringBuilder();
                stringBuilder.append("onSuccess: result = ");
                stringBuilder.append(str);
                Log.d(str2, stringBuilder.toString());
                if (TextUtils.isEmpty(str)) {
                    QrDecoder.this.mDecoding = true;
                    isEmpty = QrDecoder.this.mScanResult.isEmpty();
                } else {
                    QrDecoder.this.mDecoding = false;
                    isEmpty = QrDecoder.this.mScanResult.equals(str);
                }
                if ((isEmpty ^ 1) != 0) {
                    QrDecoder.this.mScanResult = str;
                    BottomPopupTips bottomPopupTips = (BottomPopupTips) ModeCoordinatorImpl.getInstance().getAttachProtocol(175);
                    if (QrDecoder.this.mDecoding) {
                        bottomPopupTips.hideQrCodeTip();
                    } else {
                        bottomPopupTips.showQrCodeTip();
                    }
                }
            }
        }, new Consumer<Throwable>() {
            public void accept(Throwable th) throws Exception {
                Log.d(QrDecoder.TAG, "onError: ", th);
            }
        });
        this.mDecoding = true;
        this.mDecodingCount.set(0);
    }

    public void reset() {
    }

    public String getScanResult() {
        return this.mScanResult;
    }

    public void resetScanResult() {
        this.mDecoding = true;
        this.mScanResult = "";
    }
}
