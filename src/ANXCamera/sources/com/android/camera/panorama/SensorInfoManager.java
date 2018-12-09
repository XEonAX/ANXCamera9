package com.android.camera.panorama;

import com.android.camera.panorama.MorphoSensorFusion.SensorData;
import java.util.ArrayList;

public class SensorInfoManager {
    public int a_ix = -1;
    public long exposureTime = 0;
    public int g_ix = -1;
    public long imageTimeStamp = 0;
    public long img_ix = -1;
    public int r_ix = -1;
    public long rollingShutterSkew = 0;
    public int sensitivity = 0;
    public ArrayList<SensorData>[] sensorData;
    public long sensorTimeStamp = 0;
    public long timeMillis = 0;

    public SensorInfoManager(int i) {
        this.sensorData = new ArrayList[i];
    }
}
