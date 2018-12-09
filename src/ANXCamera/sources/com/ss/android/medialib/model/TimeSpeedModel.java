package com.ss.android.medialib.model;

import android.support.annotation.Keep;
import java.util.List;

@Keep
public class TimeSpeedModel {
    long duration;
    double speed;

    public TimeSpeedModel(long j, double d) {
        this.duration = j;
        this.speed = d;
    }

    public long getDuration() {
        return this.duration;
    }

    public void setDuration(long j) {
        this.duration = j;
    }

    public double getSpeed() {
        return this.speed;
    }

    public void setSpeed(float f) {
        this.speed = (double) f;
    }

    public static int calculateRealTime(List<TimeSpeedModel> list) {
        int i = 0;
        if (list == null || list.size() <= 0) {
            return 0;
        }
        for (TimeSpeedModel timeSpeedModel : list) {
            i = (int) (((long) i) + calculateRealTime(timeSpeedModel.duration, timeSpeedModel.speed));
        }
        return i;
    }

    public static long calculateRealTime(long j, double d) {
        return (long) ((1.0d * ((double) j)) / d);
    }
}
