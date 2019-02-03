package com.xiaomi.camera.processor;

import android.media.Image;
import android.support.annotation.NonNull;
import com.android.camera.log.Log;
import com.xiaomi.camera.base.PerformanceTracker;
import com.xiaomi.camera.core.CaptureData;
import com.xiaomi.camera.core.CaptureData.CaptureDataBean;
import com.xiaomi.camera.core.CaptureDataListener;
import com.xiaomi.camera.imagecodec.ImagePool;
import com.xiaomi.camera.imagecodec.ImagePool.ImageFormat;
import com.xiaomi.engine.FrameData;
import com.xiaomi.engine.MiaNodeJNI;
import com.xiaomi.protocol.ICustomCaptureResult;
import java.util.ArrayList;
import java.util.List;

public class ClearShotProcessor implements AlgoProcessor {
    private static final String TAG = ClearShotProcessor.class.getSimpleName();

    private void onImageAvailable(CaptureData captureData, CaptureDataBean captureDataBean, ProcessResultListener processResultListener) {
        captureData.setMultiFrameProcessResult(captureDataBean);
        processResultListener.onProcessFinished(captureData, true);
    }

    public void doProcess(@NonNull CaptureData captureData, ProcessResultListener processResultListener) {
        Log.d(TAG, "doProcess: start process capture data");
        List<CaptureDataBean> captureDataBeanList = captureData.getCaptureDataBeanList();
        if (captureDataBeanList == null || captureDataBeanList.isEmpty()) {
            throw new IllegalArgumentException("taskBeanList is not allow to be empty!");
        }
        StringBuilder stringBuilder;
        CaptureDataBean captureDataBean = new CaptureDataBean(captureData.getStreamNum());
        String str = TAG;
        StringBuilder stringBuilder2 = new StringBuilder();
        stringBuilder2.append("doProcess: dataNum = ");
        stringBuilder2.append(captureDataBeanList.size());
        Log.d(str, stringBuilder2.toString());
        PerformanceTracker.trackAlgorithmProcess("[CLEARSHOT]", 0);
        List arrayList = new ArrayList();
        for (CaptureDataBean captureDataBean2 : captureDataBeanList) {
            arrayList.add(new FrameData(0, captureDataBean2.getResult().getSequenceId(), captureDataBean2.getResult().getFrameNumber(), captureDataBean2.getResult().getResults(), captureDataBean2.getMainImage()));
        }
        Image mainImage = ((CaptureDataBean) captureDataBeanList.get(0)).getMainImage();
        mainImage = ImagePool.getInstance().getAnEmptyImage(new ImageFormat(mainImage.getWidth(), mainImage.getHeight(), mainImage.getFormat()));
        int process = MiaNodeJNI.getInstance().process(arrayList, mainImage, 2, captureData.getStreamNum() == 2);
        if (process > arrayList.size() || process < 0) {
            str = TAG;
            stringBuilder = new StringBuilder();
            stringBuilder.append("doProcess: returned a error baseIndex: ");
            stringBuilder.append(process);
            Log.w(str, stringBuilder.toString());
            process = 0;
        }
        PerformanceTracker.trackAlgorithmProcess("[CLEARSHOT]", 1);
        str = TAG;
        stringBuilder = new StringBuilder();
        stringBuilder.append("doProcess: clearShot done. baseIndex: ");
        stringBuilder.append(process);
        Log.d(str, stringBuilder.toString());
        CaptureDataBean captureDataBean3 = (CaptureDataBean) captureDataBeanList.get(process);
        ICustomCaptureResult result = captureDataBean3.getResult();
        long timeStamp = result.getTimeStamp();
        mainImage.setTimestamp(timeStamp);
        ImagePool.getInstance().queueImage(mainImage);
        mainImage = ImagePool.getInstance().getImage(timeStamp);
        captureDataBean.setImage(mainImage, 0);
        ImagePool.getInstance().holdImage(mainImage);
        CaptureDataListener captureDataListener = captureData.getCaptureDataListener();
        for (CaptureDataBean captureDataBean4 : captureDataBeanList) {
            if (captureDataBean4 != captureDataBean3) {
                Image mainImage2 = captureDataBean4.getMainImage();
                mainImage2.close();
                captureDataListener.onOriginalImageClosed(mainImage2);
                Image subImage = captureDataBean4.getSubImage();
                if (subImage != null) {
                    subImage.close();
                    captureDataListener.onOriginalImageClosed(subImage);
                }
            }
        }
        captureDataBeanList.clear();
        Image mainImage3 = captureDataBean3.getMainImage();
        Image subImage2 = captureDataBean3.getSubImage();
        mainImage3.close();
        captureDataListener.onOriginalImageClosed(mainImage3);
        captureDataBean.setCaptureResult(result, true);
        if (subImage2 != null) {
            long timestamp = subImage2.getTimestamp();
            ImagePool.getInstance().queueImage(subImage2);
            mainImage3 = ImagePool.getInstance().getImage(timestamp);
            captureDataBean.setImage(mainImage3, 1);
            captureDataListener.onOriginalImageClosed(subImage2);
            if (timestamp != timeStamp) {
                mainImage3.setTimestamp(timeStamp);
            }
            ImagePool.getInstance().holdImage(mainImage3);
        }
        if (captureDataBean.isDataReady()) {
            onImageAvailable(captureData, captureDataBean, processResultListener);
        }
    }
}
