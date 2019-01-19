package com.xiaomi.camera.processor;

import android.media.Image;
import android.support.annotation.NonNull;
import com.android.camera.groupshot.GroupShot;
import com.android.camera.log.Log;
import com.xiaomi.camera.core.CaptureData;
import com.xiaomi.camera.core.CaptureData.CaptureDataBean;
import com.xiaomi.camera.core.CaptureDataListener;
import com.xiaomi.camera.imagecodec.ImagePool;
import com.xiaomi.camera.imagecodec.ImagePool.ImageFormat;
import com.xiaomi.protocol.ICustomCaptureResult;
import java.util.List;

public class GroupShotProcessor implements AlgoProcessor {
    private static final int GROUP_SHOT_MAX_FACE_NUM = 10;
    private static final String TAG = GroupShotProcessor.class.getSimpleName();
    private GroupShot mGroupShot;

    public GroupShotProcessor() {
        if (this.mGroupShot == null || this.mGroupShot.isUsed()) {
            this.mGroupShot = new GroupShot();
        }
    }

    private void onImageAvailable(CaptureData captureData, CaptureDataBean captureDataBean, ProcessResultListener processResultListener) {
        captureDataBean.getMainImage().setTimestamp(captureDataBean.getResult().getTimeStamp());
        captureData.setMultiFrameProcessResult(captureDataBean);
        processResultListener.onProcessFinished(captureData, false);
    }

    public void doProcess(@NonNull CaptureData captureData, ProcessResultListener processResultListener) {
        List<CaptureDataBean> captureDataBeanList = captureData.getCaptureDataBeanList();
        if (captureDataBeanList == null || captureDataBeanList.isEmpty()) {
            throw new IllegalArgumentException("taskBeanList is not allow to be empty!");
        }
        int i;
        String str = TAG;
        StringBuilder stringBuilder = new StringBuilder();
        stringBuilder.append("doProcess>>dataNum=");
        stringBuilder.append(captureDataBeanList.size());
        Log.d(str, stringBuilder.toString());
        long currentTimeMillis = System.currentTimeMillis();
        CaptureDataBean captureDataBean = (CaptureDataBean) captureDataBeanList.get(0);
        Image mainImage = captureDataBean.getMainImage();
        prepareGroupShot(captureDataBeanList.size(), mainImage.getWidth(), mainImage.getHeight());
        for (i = 0; i < captureDataBeanList.size(); i++) {
            this.mGroupShot.attach(((CaptureDataBean) captureDataBeanList.get(i)).getMainImage());
        }
        i = this.mGroupShot.attach_end();
        Log.v(TAG, String.format("doProcess: attachEnd=0x%x", new Object[]{Integer.valueOf(i)}));
        i = this.mGroupShot.setBaseImage(0);
        Log.v(TAG, String.format("doProcess: setBaseImage=0x%x", new Object[]{Integer.valueOf(i)}));
        i = this.mGroupShot.setBestFace();
        Log.v(TAG, String.format("doProcess: setBaseFace=0x%x", new Object[]{Integer.valueOf(i)}));
        CaptureDataBean captureDataBean2 = new CaptureDataBean(captureData.getStreamNum());
        ICustomCaptureResult result = ((CaptureDataBean) captureDataBeanList.get(captureDataBeanList.size() - 1)).getResult();
        captureDataBean2.setCaptureResult(result, true);
        long timeStamp = result.getTimeStamp();
        mainImage = ImagePool.getInstance().getAnEmptyImage(new ImageFormat(mainImage.getWidth(), mainImage.getHeight(), mainImage.getFormat()));
        mainImage.setTimestamp(timeStamp);
        this.mGroupShot.getYuvImage(mainImage);
        ImagePool.getInstance().queueImage(mainImage);
        captureDataBean2.setImage(ImagePool.getInstance().getImage(timeStamp), 0);
        CaptureDataListener captureDataListener = captureData.getCaptureDataListener();
        for (CaptureDataBean captureDataBean3 : captureDataBeanList) {
            Image mainImage2 = captureDataBean3.getMainImage();
            if (!captureData.isSaveInputImage() || captureDataBean3 != captureDataBean) {
                mainImage2.close();
                captureDataListener.onOriginalImageClosed(mainImage2);
            }
        }
        captureDataBeanList.clear();
        if (captureData.isSaveInputImage()) {
            mainImage = captureDataBean.getMainImage();
            captureDataListener.onOriginalImageClosed(mainImage);
            timeStamp = mainImage.getTimestamp();
            ImagePool.getInstance().queueImage(mainImage);
            captureDataBean.setMainImage(ImagePool.getInstance().getImage(timeStamp));
            captureDataBeanList.add(captureDataBean);
            result.setSequenceId((int) (((long) result.getSequenceId()) + result.getFrameNumber()));
            ICustomCaptureResult result2 = captureDataBean.getResult();
            result2.setSequenceId((int) (((long) result2.getSequenceId()) + result2.getFrameNumber()));
        }
        onImageAvailable(captureData, captureDataBean2, processResultListener);
        this.mGroupShot.clearImages();
        this.mGroupShot.finish();
        this.mGroupShot = null;
        String str2 = TAG;
        StringBuilder stringBuilder2 = new StringBuilder();
        stringBuilder2.append("doProcess<<cost=");
        stringBuilder2.append(System.currentTimeMillis() - currentTimeMillis);
        Log.d(str2, stringBuilder2.toString());
    }

    private void prepareGroupShot(int i, int i2, int i3) {
        this.mGroupShot.initialize(i, 10, i2, i3, i2, i3);
        this.mGroupShot.attach_start(0);
    }
}
