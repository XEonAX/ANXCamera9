package com.android.camera.statistic;

import android.content.Context;
import android.os.SystemClock;
import android.os.statistics.E2EScenario;
import android.os.statistics.E2EScenarioPayload;
import android.os.statistics.E2EScenarioPerfTracer;
import android.os.statistics.E2EScenarioSettings;
import android.provider.MiuiSettings.System;
import android.support.annotation.NonNull;
import android.support.annotation.Nullable;
import com.android.camera.log.Log;
import java.util.Iterator;
import java.util.Map;
import org.json.JSONObject;

public class ScenarioTrackUtil {
    private static final String TAG = ScenarioTrackUtil.class.getSimpleName();
    public static final CameraEventScenario sCaptureTimeScenario = new CameraEventScenario("CaptureTime");
    public static final CameraEventScenario sLaunchTimeScenario = new CameraEventScenario("CameraLaunchTime");
    public static final CameraEventScenario sStartVideoRecordTimeScenario = new CameraEventScenario("StartVideoRecordTime");
    public static final CameraEventScenario sStopVideoRecordTimeScenario = new CameraEventScenario("StopVideoRecordTime");
    private static final CameraEventScenario sSwitchCameraTimeScenario = new CameraEventScenario("SwitchCameraTime");
    public static final CameraEventScenario sSwitchModeTimeScenario = new CameraEventScenario("SwitchModeTime");
    private static final E2EScenarioSettings scenarioSettings = new E2EScenarioSettings();

    public static class CameraEventScenario {
        private static final String CAMERA_PACKAGE = "com.android.camera";
        private static final String CATEGORY_PERFORMANCE = "Performance";
        E2EScenario e2eScenario;
        public volatile boolean isTrackStarted = false;
        String mEventName;

        CameraEventScenario(String str) {
            this.e2eScenario = initE2EScenario(str);
            this.mEventName = str;
        }

        private E2EScenario initE2EScenario(String str) {
            try {
                return new E2EScenario(CAMERA_PACKAGE, CATEGORY_PERFORMANCE, str);
            } catch (Exception e) {
                String access$000 = ScenarioTrackUtil.TAG;
                StringBuilder stringBuilder = new StringBuilder();
                stringBuilder.append(str);
                stringBuilder.append(" initializer failed: ");
                stringBuilder.append(e.getMessage());
                Log.w(access$000, stringBuilder.toString());
                return null;
            }
        }

        public String toString() {
            return this.mEventName;
        }
    }

    static {
        scenarioSettings.setStatisticsMode(7);
        scenarioSettings.setHistoryLimitPerDay(200);
    }

    public static void trackAppLunchTimeStart(@NonNull boolean z) {
        E2EScenarioPayload e2EScenarioPayload = new E2EScenarioPayload();
        e2EScenarioPayload.put("LaunchMode", z ? "COLD" : "HOT");
        beginScenario(sLaunchTimeScenario, e2EScenarioPayload);
    }

    /* JADX WARNING: Removed duplicated region for block: B:15:0x0045  */
    /* JADX WARNING: Removed duplicated region for block: B:15:0x0045  */
    /* Code decompiled incorrectly, please refer to instructions dump. */
    public static void trackAppLunchTimeEnd(@Nullable Map map, Context context) {
        Throwable e;
        String string = System.getString(context.getContentResolver(), "camera_boost");
        E2EScenarioPayload e2EScenarioPayload = new E2EScenarioPayload();
        if (string != null) {
            JSONObject jSONObject;
            Object obj = null;
            try {
                jSONObject = new JSONObject(string);
                try {
                    if (SystemClock.uptimeMillis() - Long.parseLong(jSONObject.optString("time")) < 1000) {
                        obj = 1;
                    }
                    jSONObject.remove("time");
                } catch (Exception e2) {
                    e = e2;
                    Log.w(TAG, "Exception", e);
                    if (obj != null) {
                    }
                    e2EScenarioPayload.putAll(map);
                    finishScenario(sLaunchTimeScenario, e2EScenarioPayload);
                }
            } catch (Exception e3) {
                e = e3;
                jSONObject = null;
                Log.w(TAG, "Exception", e);
                if (obj != null) {
                }
                e2EScenarioPayload.putAll(map);
                finishScenario(sLaunchTimeScenario, e2EScenarioPayload);
            }
            if (obj != null) {
                Iterator keys = jSONObject.keys();
                while (keys.hasNext()) {
                    String str = (String) keys.next();
                    e2EScenarioPayload.put(str, jSONObject.opt(str));
                }
            }
        }
        e2EScenarioPayload.putAll(map);
        finishScenario(sLaunchTimeScenario, e2EScenarioPayload);
    }

    public static void trackCaptureTimeStart(@NonNull boolean z, @NonNull int i) {
        E2EScenarioPayload e2EScenarioPayload = new E2EScenarioPayload();
        e2EScenarioPayload.putValues(new Object[]{"CameraID", CameraStatUtil.cameraIdToName(z), "Module", CameraStatUtil.modeIdToName(i)});
        beginScenario(sCaptureTimeScenario, e2EScenarioPayload);
    }

    public static void trackCaptureTimeEnd() {
        finishScenario(sCaptureTimeScenario, null);
    }

    public static void trackSwitchCameraStart(@NonNull boolean z, @NonNull boolean z2, @NonNull int i) {
        E2EScenarioPayload e2EScenarioPayload = new E2EScenarioPayload();
        e2EScenarioPayload.putValues(new Object[]{"from", CameraStatUtil.cameraIdToName(z), "to", CameraStatUtil.cameraIdToName(z2), "inMode", CameraStatUtil.modeIdToName(i)});
        beginScenario(sSwitchCameraTimeScenario, e2EScenarioPayload);
    }

    public static void trackSwitchCameraEnd() {
        finishScenario(sSwitchCameraTimeScenario, null);
    }

    public static void trackSwitchModeStart(@NonNull int i, @NonNull int i2, @NonNull boolean z) {
        E2EScenarioPayload e2EScenarioPayload = new E2EScenarioPayload();
        e2EScenarioPayload.putValues(new Object[]{"from", CameraStatUtil.modeIdToName(i), "to", CameraStatUtil.modeIdToName(i2), "cameraId", CameraStatUtil.cameraIdToName(z)});
        beginScenario(sSwitchModeTimeScenario, e2EScenarioPayload);
    }

    public static void trackSwitchModeEnd() {
        finishScenario(sSwitchModeTimeScenario, null);
    }

    public static void trackStartVideoRecordStart(@NonNull String str, @NonNull boolean z) {
        E2EScenarioPayload e2EScenarioPayload = new E2EScenarioPayload();
        e2EScenarioPayload.putValues(new Object[]{"mode", str, "cameraId", CameraStatUtil.cameraIdToName(z)});
        beginScenario(sStartVideoRecordTimeScenario, e2EScenarioPayload);
    }

    public static void trackStartVideoRecordEnd() {
        finishScenario(sStartVideoRecordTimeScenario, null);
    }

    public static void trackStopVideoRecordStart(@NonNull String str, @NonNull boolean z) {
        E2EScenarioPayload e2EScenarioPayload = new E2EScenarioPayload();
        e2EScenarioPayload.putValues(new Object[]{"mode", str, "cameraId", CameraStatUtil.cameraIdToName(z)});
        beginScenario(sStopVideoRecordTimeScenario, e2EScenarioPayload);
    }

    public static void trackStopVideoRecordEnd() {
        finishScenario(sStopVideoRecordTimeScenario, null);
    }

    public static void trackScenarioAbort(@NonNull CameraEventScenario cameraEventScenario) {
        abortScenario(cameraEventScenario);
    }

    private static void beginScenario(@NonNull CameraEventScenario cameraEventScenario) {
        beginScenario(cameraEventScenario, null);
    }

    private static void beginScenario(@NonNull CameraEventScenario cameraEventScenario, @Nullable E2EScenarioPayload e2EScenarioPayload) {
        if (cameraEventScenario.e2eScenario == null) {
            String str = TAG;
            StringBuilder stringBuilder = new StringBuilder();
            stringBuilder.append("track ");
            stringBuilder.append(cameraEventScenario.toString());
            stringBuilder.append(" event start cancel due to scenario is null!");
            Log.w(str, stringBuilder.toString());
            return;
        }
        if (cameraEventScenario.isTrackStarted) {
            E2EScenarioPerfTracer.abortScenario(cameraEventScenario.e2eScenario);
        }
        try {
            E2EScenarioPerfTracer.asyncBeginScenario(cameraEventScenario.e2eScenario, scenarioSettings, e2EScenarioPayload);
            cameraEventScenario.isTrackStarted = true;
        } catch (Exception e) {
            String str2 = TAG;
            StringBuilder stringBuilder2 = new StringBuilder();
            stringBuilder2.append("track ");
            stringBuilder2.append(cameraEventScenario.toString());
            stringBuilder2.append(" event start failed: ");
            stringBuilder2.append(e.getMessage());
            Log.w(str2, stringBuilder2.toString());
        }
    }

    private static void finishScenario(@NonNull CameraEventScenario cameraEventScenario, @Nullable E2EScenarioPayload e2EScenarioPayload) {
        String str;
        StringBuilder stringBuilder;
        if (cameraEventScenario.e2eScenario == null) {
            str = TAG;
            stringBuilder = new StringBuilder();
            stringBuilder.append("track ");
            stringBuilder.append(cameraEventScenario.toString());
            stringBuilder.append(" event end cancel, due to scenario is null!");
            Log.w(str, stringBuilder.toString());
        } else if (cameraEventScenario.isTrackStarted) {
            if (e2EScenarioPayload != null) {
                try {
                    E2EScenarioPerfTracer.finishScenario(cameraEventScenario.e2eScenario, e2EScenarioPayload);
                } catch (Exception e) {
                    String str2 = TAG;
                    StringBuilder stringBuilder2 = new StringBuilder();
                    stringBuilder2.append("track ");
                    stringBuilder2.append(cameraEventScenario.toString());
                    stringBuilder2.append(" event end failed: ");
                    stringBuilder2.append(e.getMessage());
                    Log.w(str2, stringBuilder2.toString());
                }
            } else {
                E2EScenarioPerfTracer.finishScenario(cameraEventScenario.e2eScenario);
            }
            cameraEventScenario.isTrackStarted = false;
        } else {
            str = TAG;
            stringBuilder = new StringBuilder();
            stringBuilder.append("track ");
            stringBuilder.append(cameraEventScenario.toString());
            stringBuilder.append(" event end cancel, due to scenario has not started!");
            Log.w(str, stringBuilder.toString());
        }
    }

    private static void abortScenario(@NonNull CameraEventScenario cameraEventScenario) {
        if (cameraEventScenario.e2eScenario == null) {
            String str = TAG;
            StringBuilder stringBuilder = new StringBuilder();
            stringBuilder.append("track ");
            stringBuilder.append(cameraEventScenario.toString());
            stringBuilder.append(" event start cancel due to scenario is null!");
            Log.w(str, stringBuilder.toString());
            return;
        }
        if (cameraEventScenario.isTrackStarted) {
            E2EScenarioPerfTracer.abortScenario(cameraEventScenario.e2eScenario);
        }
    }
}
