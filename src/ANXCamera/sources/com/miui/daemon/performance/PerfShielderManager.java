package com.miui.daemon.performance;

import android.os.Process;
import android.os.RemoteException;
import android.os.ServiceManager;
import com.android.internal.app.IPerfShielder;
import com.android.internal.app.IPerfShielder.Stub;

public class PerfShielderManager {
    public static final String PerfShieldService = "perfshielder";
    private static volatile IPerfShielder sPerfManager;

    public static IPerfShielder getService() {
        if (sPerfManager == null) {
            synchronized (PerfShielderManager.class) {
                if (sPerfManager == null) {
                    IPerfShielder perfShielder = Stub.asInterface(ServiceManager.getService(PerfShieldService));
                    synchronized (PerfShielderManager.class) {
                        sPerfManager = perfShielder;
                    }
                }
            }
        }
        return sPerfManager;
    }

    private static boolean checkService() {
        return getService() != null;
    }

    public static Long getFreeMemory() {
        checkService();
        long totoalMemory = 0;
        if (sPerfManager != null) {
            try {
                totoalMemory = sPerfManager.getFreeMemory();
            } catch (RemoteException e) {
                totoalMemory = Process.getFreeMemory();
                e.printStackTrace();
            }
        }
        return Long.valueOf(totoalMemory);
    }
}
