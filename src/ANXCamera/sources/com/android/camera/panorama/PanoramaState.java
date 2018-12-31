package com.android.camera.panorama;

public class PanoramaState {
    public IPanoramaStateEventListener listener;

    public interface IPanoramaStateEventListener {
        void requestEnd(PanoramaState panoramaState, int i);
    }

    public void clearListener() {
        this.listener = new IPanoramaStateEventListener() {
            public void requestEnd(PanoramaState panoramaState, int i) {
            }
        };
    }

    public void setPanoramaStateEventListener(IPanoramaStateEventListener iPanoramaStateEventListener) {
        this.listener = iPanoramaStateEventListener;
    }

    public PanoramaState() {
        clearListener();
    }

    public boolean onSaveImage(CaptureImage captureImage) {
        captureImage.close();
        return true;
    }
}
