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
    public static android.os.Bundle beginScenario(android.os.statistics.E2EScenario r11, android.os.statistics.E2EScenarioSettings r12, java.lang.String r13, android.os.statistics.E2EScenarioPayload r14) {
        /*
        r0 = 0;
        if (r11 == 0) goto L_0x002e;
    L_0x0003:
        r1 = r11.isValid();
        if (r1 != 0) goto L_0x000a;
    L_0x0009:
        goto L_0x002e;
    L_0x000a:
        if (r12 == 0) goto L_0x002d;
    L_0x000c:
        r1 = r12.isValid();
        if (r1 != 0) goto L_0x0013;
    L_0x0012:
        goto L_0x002d;
    L_0x0013:
        r1 = com.miui.daemon.performance.PerfShielderManager.getService();
        if (r1 != 0) goto L_0x001a;
    L_0x0019:
        return r0;
    L_0x001a:
        r7 = android.os.Process.myTid();	 Catch:{ RemoteException -> 0x002b }
        r8 = 0;
        r10 = 1;
        r2 = r1;
        r3 = r11;
        r4 = r12;
        r5 = r13;
        r6 = r14;
        r2 = r2.beginScenario(r3, r4, r5, r6, r7, r8, r10);	 Catch:{ RemoteException -> 0x002b }
        return r2;
    L_0x002b:
        r2 = move-exception;
        return r0;
    L_0x002d:
        return r0;
    L_0x002e:
        return r0;
        */
        throw new UnsupportedOperationException("Method not decompiled: android.os.statistics.E2EScenarioPerfTracer.beginScenario(android.os.statistics.E2EScenario, android.os.statistics.E2EScenarioSettings, java.lang.String, android.os.statistics.E2EScenarioPayload):android.os.Bundle");
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
    public static void asyncBeginScenario(android.os.statistics.E2EScenario r16, android.os.statistics.E2EScenarioSettings r17, java.lang.String r18, android.os.statistics.E2EScenarioPayload r19) {
        /*
        if (r16 == 0) goto L_0x003a;
    L_0x0002:
        r0 = r16.isValid();
        if (r0 != 0) goto L_0x0009;
    L_0x0008:
        goto L_0x003a;
    L_0x0009:
        if (r17 == 0) goto L_0x0039;
    L_0x000b:
        r0 = r17.isValid();
        if (r0 != 0) goto L_0x0012;
    L_0x0011:
        goto L_0x0039;
    L_0x0012:
        r10 = com.miui.daemon.performance.PerfShielderManager.getService();
        if (r10 != 0) goto L_0x0019;
    L_0x0018:
        return;
    L_0x0019:
        r11 = android.os.Process.myTid();
        r12 = android.os.SystemClock.uptimeMillis();
        r14 = executor;
        r7 = new android.os.statistics.E2EScenarioPerfTracer$1;
        r0 = r7;
        r1 = r10;
        r2 = r16;
        r3 = r17;
        r4 = r18;
        r5 = r19;
        r6 = r11;
        r9 = r7;
        r7 = r12;
        r0.<init>(r1, r2, r3, r4, r5, r6, r7);
        r14.execute(r9);
        return;
    L_0x0039:
        return;
    L_0x003a:
        return;
        */
        throw new UnsupportedOperationException("Method not decompiled: android.os.statistics.E2EScenarioPerfTracer.asyncBeginScenario(android.os.statistics.E2EScenario, android.os.statistics.E2EScenarioSettings, java.lang.String, android.os.statistics.E2EScenarioPayload):void");
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
