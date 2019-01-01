package android.os.statistics;

import android.os.Bundle;
import android.os.Process;
import android.os.RemoteException;
import android.os.SystemClock;
import com.android.internal.app.IPerfShielder;
import com.miui.daemon.performance.PerfShielderManager;
import java.util.concurrent.LinkedBlockingQueue;
import java.util.concurrent.ThreadPoolExecutor;
import java.util.concurrent.TimeUnit;

public final class E2EScenarioPerfTracer {
    private static final int VERSION = 1;
    private static final ThreadPoolExecutor executor = new ThreadPoolExecutor(1, 1, 0, TimeUnit.MILLISECONDS, new LinkedBlockingQueue());

    private E2EScenarioPerfTracer() {
    }

    public static int getVersion() {
        return 1;
    }

    public static Bundle beginScenario(E2EScenario scenario, E2EScenarioSettings settings) {
        return beginScenario(scenario, settings, "", null);
    }

    public static Bundle beginScenario(E2EScenario scenario, E2EScenarioSettings settings, String tag) {
        return beginScenario(scenario, settings, tag, null);
    }

    public static Bundle beginScenario(E2EScenario scenario, E2EScenarioSettings settings, E2EScenarioPayload payload) {
        return beginScenario(scenario, settings, "", payload);
    }

    /* JADX WARNING: Missing block: B:16:0x002e, code:
            return null;
     */
    /* Code decompiled incorrectly, please refer to instructions dump. */
    public static Bundle beginScenario(E2EScenario scenario, E2EScenarioSettings settings, String tag, E2EScenarioPayload payload) {
        if (scenario == null || !scenario.isValid() || settings == null || !settings.isValid()) {
            return null;
        }
        IPerfShielder perfShielder = PerfShielderManager.getService();
        if (perfShielder == null) {
            return null;
        }
        try {
            return perfShielder.beginScenario(scenario, settings, tag, payload, Process.myTid(), 0, true);
        } catch (RemoteException e) {
            return null;
        }
    }

    public static void asyncBeginScenario(E2EScenario scenario, E2EScenarioSettings settings) {
        asyncBeginScenario(scenario, settings, "", null);
    }

    public static void asyncBeginScenario(E2EScenario scenario, E2EScenarioSettings settings, String tag) {
        asyncBeginScenario(scenario, settings, tag, null);
    }

    public static void asyncBeginScenario(E2EScenario scenario, E2EScenarioSettings settings, E2EScenarioPayload payload) {
        asyncBeginScenario(scenario, settings, "", payload);
    }

    /* JADX WARNING: Missing block: B:12:0x003a, code:
            return;
     */
    /* Code decompiled incorrectly, please refer to instructions dump. */
    public static void asyncBeginScenario(E2EScenario scenario, E2EScenarioSettings settings, String tag, E2EScenarioPayload payload) {
        if (scenario != null && scenario.isValid() && settings != null && settings.isValid()) {
            IPerfShielder perfShielder = PerfShielderManager.getService();
            if (perfShielder != null) {
                int tid = Process.myTid();
                long uptimeMs = SystemClock.uptimeMillis();
                ThreadPoolExecutor threadPoolExecutor = executor;
                final IPerfShielder iPerfShielder = perfShielder;
                final E2EScenario e2EScenario = scenario;
                final E2EScenarioSettings e2EScenarioSettings = settings;
                final String str = tag;
                final E2EScenarioPayload e2EScenarioPayload = payload;
                final int i = tid;
                AnonymousClass1 anonymousClass1 = r0;
                final long j = uptimeMs;
                AnonymousClass1 anonymousClass12 = new Runnable() {
                    public void run() {
                        try {
                            iPerfShielder.beginScenario(e2EScenario, e2EScenarioSettings, str, e2EScenarioPayload, i, j, false);
                        } catch (RemoteException e) {
                        }
                    }
                };
                threadPoolExecutor.execute(anonymousClass1);
            }
        }
    }

    public static void abortScenario(E2EScenario scenario) {
        abortScenario(scenario, "");
    }

    public static void abortScenario(E2EScenario scenario, String tag) {
        if (scenario != null && scenario.isValid()) {
            IPerfShielder perfShielder = PerfShielderManager.getService();
            if (perfShielder != null) {
                int tid = Process.myTid();
                final IPerfShielder iPerfShielder = perfShielder;
                final E2EScenario e2EScenario = scenario;
                final String str = tag;
                final int i = tid;
                final long uptimeMillis = SystemClock.uptimeMillis();
                executor.execute(new Runnable() {
                    public void run() {
                        try {
                            iPerfShielder.abortMatchingScenario(e2EScenario, str, i, uptimeMillis);
                        } catch (RemoteException e) {
                        }
                    }
                });
            }
        }
    }

    public static void abortScenario(Bundle scenarioBundle) {
        if (scenarioBundle != null) {
            IPerfShielder perfShielder = PerfShielderManager.getService();
            if (perfShielder != null) {
                int tid = Process.myTid();
                final IPerfShielder iPerfShielder = perfShielder;
                final Bundle bundle = scenarioBundle;
                final int i = tid;
                final long uptimeMillis = SystemClock.uptimeMillis();
                executor.execute(new Runnable() {
                    public void run() {
                        try {
                            iPerfShielder.abortSpecificScenario(bundle, i, uptimeMillis);
                        } catch (RemoteException e) {
                        }
                    }
                });
            }
        }
    }

    public static void finishScenario(E2EScenario scenario) {
        finishScenario(scenario, "", null);
    }

    public static void finishScenario(E2EScenario scenario, E2EScenarioPayload payload) {
        finishScenario(scenario, "", payload);
    }

    public static void finishScenario(E2EScenario scenario, String tag) {
        finishScenario(scenario, tag, null);
    }

    public static void finishScenario(E2EScenario scenario, String tag, E2EScenarioPayload payload) {
        if (scenario != null && scenario.isValid()) {
            IPerfShielder perfShielder = PerfShielderManager.getService();
            if (perfShielder != null) {
                int tid = Process.myTid();
                final IPerfShielder iPerfShielder = perfShielder;
                final E2EScenario e2EScenario = scenario;
                final String str = tag;
                final E2EScenarioPayload e2EScenarioPayload = payload;
                final int i = tid;
                final long uptimeMillis = SystemClock.uptimeMillis();
                executor.execute(new Runnable() {
                    public void run() {
                        try {
                            iPerfShielder.finishMatchingScenario(e2EScenario, str, e2EScenarioPayload, i, uptimeMillis);
                        } catch (RemoteException e) {
                        }
                    }
                });
            }
        }
    }

    public static void finishScenario(Bundle scenarioBundle) {
        finishScenario(scenarioBundle, null);
    }

    public static void finishScenario(Bundle scenarioBundle, E2EScenarioPayload payload) {
        if (scenarioBundle != null) {
            IPerfShielder perfShielder = PerfShielderManager.getService();
            if (perfShielder != null) {
                int tid = Process.myTid();
                final IPerfShielder iPerfShielder = perfShielder;
                final Bundle bundle = scenarioBundle;
                final E2EScenarioPayload e2EScenarioPayload = payload;
                final int i = tid;
                final long uptimeMillis = SystemClock.uptimeMillis();
                executor.execute(new Runnable() {
                    public void run() {
                        try {
                            iPerfShielder.finishSpecificScenario(bundle, e2EScenarioPayload, i, uptimeMillis);
                        } catch (RemoteException e) {
                        }
                    }
                });
            }
        }
    }
}
