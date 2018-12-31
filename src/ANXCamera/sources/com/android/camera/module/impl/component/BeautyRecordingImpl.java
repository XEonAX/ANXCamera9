package com.android.camera.module.impl.component;

import com.android.camera.protocol.ModeCoordinatorImpl;
import com.android.camera.protocol.ModeProtocol.BeautyRecording;
import com.android.camera.protocol.ModeProtocol.HandleBeautyRecording;
import java.util.ArrayList;
import java.util.Iterator;

public class BeautyRecordingImpl implements BeautyRecording {
    private ArrayList<HandleBeautyRecording> recordingArrayList = new ArrayList();

    public static BeautyRecordingImpl create() {
        return new BeautyRecordingImpl();
    }

    public void registerProtocol() {
        ModeCoordinatorImpl.getInstance().attachProtocol(173, this);
    }

    public void unRegisterProtocol() {
        this.recordingArrayList.clear();
        ModeCoordinatorImpl.getInstance().detachProtocol(173, this);
    }

    public <P extends HandleBeautyRecording> void addBeautyStack(P p) {
        this.recordingArrayList.add(p);
    }

    public <P extends HandleBeautyRecording> void removeBeautyStack(P p) {
        this.recordingArrayList.remove(p);
    }

    public void handleAngleChang(float f) {
        Iterator it = this.recordingArrayList.iterator();
        while (it.hasNext()) {
            ((HandleBeautyRecording) it.next()).onAngleChanged(f);
        }
    }

    public void handleBeautyRecordingStart() {
        Iterator it = this.recordingArrayList.iterator();
        while (it.hasNext()) {
            ((HandleBeautyRecording) it.next()).onBeautyRecordingStart();
        }
    }

    public void handleBeautyRecordingStop() {
        Iterator it = this.recordingArrayList.iterator();
        while (it.hasNext()) {
            ((HandleBeautyRecording) it.next()).onBeautyRecordingStop();
        }
    }
}
