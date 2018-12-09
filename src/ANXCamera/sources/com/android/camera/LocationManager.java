package com.android.camera;

import android.location.Location;
import android.os.Bundle;
import com.android.camera.log.Log;
import com.android.camera.permission.PermissionManager;
import com.ss.android.ttve.common.TEDefine;
import java.util.Timer;
import java.util.TimerTask;

public class LocationManager {
    private static final int GPS_REQUEST_LOCATION_TIME_OUT = 60000;
    private static final long LOCATION_TIME_THRESHOLD = 3600000;
    private static final String TAG = "LocationManager";
    private static final long VALID_LAST_KNOWN_LOCATION_AGE = 180000;
    private static LocationManager sLocationManager;
    private Location mCacheLocation;
    private Location mLastKnownLocation;
    private Listener mListener;
    LocationListener[] mLocationListeners = new LocationListener[]{new LocationListener("gps"), new LocationListener("network")};
    private android.location.LocationManager mLocationManager;
    private boolean mRecordLocation;
    private Timer mTimer;

    public interface Listener {
        void hideGpsOnScreenIndicator();

        void showGpsOnScreenIndicator(boolean z);
    }

    private class LocationListener implements android.location.LocationListener {
        Location mLastLocation;
        String mProvider;
        boolean mValid = false;

        public LocationListener(String str) {
            this.mProvider = str;
            this.mLastLocation = new Location(this.mProvider);
        }

        public void onLocationChanged(Location location) {
            if (location.getLatitude() != 0.0d || location.getLongitude() != 0.0d) {
                if (LocationManager.this.mRecordLocation && "gps".equals(this.mProvider)) {
                    LocationManager.this.cancelTimer();
                    if (LocationManager.this.mListener != null) {
                        LocationManager.this.mListener.showGpsOnScreenIndicator(true);
                    }
                }
                String str;
                StringBuilder stringBuilder;
                if (this.mValid) {
                    str = LocationManager.TAG;
                    stringBuilder = new StringBuilder();
                    stringBuilder.append("update location, it is from ");
                    stringBuilder.append(this.mProvider);
                    Log.v(str, stringBuilder.toString());
                } else {
                    str = LocationManager.TAG;
                    stringBuilder = new StringBuilder();
                    stringBuilder.append("Got first location, it is from ");
                    stringBuilder.append(this.mProvider);
                    Log.d(str, stringBuilder.toString());
                }
                this.mLastLocation.set(location);
                LocationManager.this.updateCacheLocation(this.mLastLocation);
                this.mValid = true;
            }
        }

        public void onProviderEnabled(String str) {
        }

        public void onProviderDisabled(String str) {
            this.mValid = false;
        }

        public void onStatusChanged(String str, int i, Bundle bundle) {
            switch (i) {
                case 0:
                case 1:
                    this.mValid = false;
                    if (LocationManager.this.mListener != null && LocationManager.this.mRecordLocation && "gps".equals(str)) {
                        LocationManager.this.mListener.showGpsOnScreenIndicator(false);
                        return;
                    }
                    return;
                default:
                    return;
            }
        }

        public Location current() {
            return this.mValid ? this.mLastLocation : null;
        }
    }

    private LocationManager() {
    }

    public static LocationManager instance() {
        if (sLocationManager == null) {
            sLocationManager = new LocationManager();
        }
        return sLocationManager;
    }

    public void setListener(Listener listener) {
        this.mListener = listener;
    }

    public void unsetListener(Listener listener) {
        if (this.mListener == listener) {
            this.mListener = null;
        }
    }

    public Location getCurrentLocation() {
        if (!this.mRecordLocation) {
            return null;
        }
        for (int i = 0; i < this.mLocationListeners.length; i++) {
            Location current = this.mLocationListeners[i].current();
            if (current != null) {
                String str = TAG;
                StringBuilder stringBuilder = new StringBuilder();
                stringBuilder.append("get current location, it is from ");
                stringBuilder.append(this.mLocationListeners[i].mProvider);
                Log.v(str, stringBuilder.toString());
                return validateLocation(current);
            }
        }
        String str2 = TAG;
        StringBuilder stringBuilder2 = new StringBuilder();
        stringBuilder2.append("No location received yet. cache location is ");
        stringBuilder2.append(this.mCacheLocation != null ? "not null" : TEDefine.FACE_BEAUTY_NULL);
        Log.d(str2, stringBuilder2.toString());
        return this.mCacheLocation;
    }

    private static Location validateLocation(Location location) {
        long currentTimeMillis = System.currentTimeMillis();
        if (Math.abs(location.getTime() - currentTimeMillis) > LOCATION_TIME_THRESHOLD) {
            location.setTime(currentTimeMillis);
        }
        return location;
    }

    public void recordLocation(boolean z) {
        if (this.mRecordLocation != z) {
            this.mRecordLocation = z;
            if (z && PermissionManager.checkCameraLocationPermissions()) {
                startReceivingLocationUpdates();
            } else {
                stopReceivingLocationUpdates();
            }
        }
    }

    private void cancelTimer() {
        if (this.mTimer != null) {
            this.mTimer.cancel();
            this.mTimer = null;
        }
    }

    private void startReceivingLocationUpdates() {
        if (this.mLocationManager == null) {
            this.mLocationManager = (android.location.LocationManager) CameraAppImpl.getAndroidContext().getSystemService("location");
        }
        if (this.mLocationManager != null) {
            try {
                this.mLocationManager.requestLocationUpdates("network", 1000, 0.0f, this.mLocationListeners[1]);
            } catch (Throwable e) {
                Log.i(TAG, "fail to request location update, ignore", e);
            } catch (IllegalArgumentException e2) {
                String str = TAG;
                StringBuilder stringBuilder = new StringBuilder();
                stringBuilder.append("provider does not exist ");
                stringBuilder.append(e2.getMessage());
                Log.d(str, stringBuilder.toString());
            }
            try {
                this.mLocationManager.requestLocationUpdates("gps", 1000, 0.0f, this.mLocationListeners[0]);
                cancelTimer();
                this.mTimer = new Timer(true);
                this.mTimer.schedule(new TimerTask() {
                    public void run() {
                        LocationManager.this.stopReceivingGPSLocationUpdates();
                        LocationManager.this.mTimer = null;
                    }
                }, 60000);
                if (this.mListener != null) {
                    this.mListener.showGpsOnScreenIndicator(false);
                }
            } catch (Throwable e3) {
                Log.i(TAG, "fail to request location update, ignore", e3);
            } catch (IllegalArgumentException e4) {
                String str2 = TAG;
                StringBuilder stringBuilder2 = new StringBuilder();
                stringBuilder2.append("provider does not exist ");
                stringBuilder2.append(e4.getMessage());
                Log.d(str2, stringBuilder2.toString());
            }
            Log.d(TAG, "startReceivingLocationUpdates");
            getLastLocation();
        }
    }

    private void stopReceivingLocationUpdates() {
        cancelTimer();
        if (this.mLocationManager != null) {
            for (int i = 0; i < this.mLocationListeners.length; i++) {
                try {
                    this.mLocationManager.removeUpdates(this.mLocationListeners[i]);
                } catch (Throwable e) {
                    Log.i(TAG, "fail to remove location listeners, ignore", e);
                }
                this.mLocationListeners[i].mValid = false;
            }
            Log.d(TAG, "stopReceivingLocationUpdates");
        }
        if (this.mListener != null) {
            this.mListener.hideGpsOnScreenIndicator();
        }
    }

    private void getLastLocation() {
        Location betterLocation;
        try {
            this.mLastKnownLocation = getBetterLocation(this.mLocationManager.getLastKnownLocation("gps"), this.mLocationManager.getLastKnownLocation("network"));
            betterLocation = getBetterLocation(this.mCacheLocation, this.mLastKnownLocation);
        } catch (Throwable e) {
            Log.e(TAG, "fail to request last location update, ignore", e);
            betterLocation = this.mCacheLocation;
        }
        if (isValidLastKnownLocation(betterLocation)) {
            this.mCacheLocation = betterLocation;
        } else {
            this.mCacheLocation = null;
        }
        String str = TAG;
        StringBuilder stringBuilder = new StringBuilder();
        stringBuilder.append("last cache location is ");
        stringBuilder.append(this.mCacheLocation != null ? "not null" : TEDefine.FACE_BEAUTY_NULL);
        Log.d(str, stringBuilder.toString());
    }

    private Location getBetterLocation(Location location, Location location2) {
        if (location2 == null) {
            return location;
        }
        if (location == null || location.getTime() < location2.getTime() || (location.getTime() == location2.getTime() && "gps".equals(location2.getProvider()))) {
            location = location2;
        }
        return location;
    }

    private void updateCacheLocation(Location location) {
        location = getBetterLocation(this.mCacheLocation, location);
        if (this.mCacheLocation != null) {
            this.mCacheLocation.set(location);
        } else {
            this.mCacheLocation = new Location(location);
        }
    }

    private boolean isValidLastKnownLocation(Location location) {
        if (location == null || Math.abs(System.currentTimeMillis() - location.getTime()) >= VALID_LAST_KNOWN_LOCATION_AGE) {
            return false;
        }
        return true;
    }

    private void stopReceivingGPSLocationUpdates() {
        if (this.mLocationManager != null) {
            try {
                this.mLocationManager.removeUpdates(this.mLocationListeners[0]);
            } catch (Throwable e) {
                Log.i(TAG, "fail to remove location listeners, ignore", e);
            }
            this.mLocationListeners[0].mValid = false;
            Log.d(TAG, "stopReceivingGPSLocationUpdates");
        }
        if (this.mListener != null) {
            this.mListener.hideGpsOnScreenIndicator();
        }
    }

    public Location getLastKnownLocation() {
        if (this.mRecordLocation) {
            return this.mLastKnownLocation;
        }
        return null;
    }
}
