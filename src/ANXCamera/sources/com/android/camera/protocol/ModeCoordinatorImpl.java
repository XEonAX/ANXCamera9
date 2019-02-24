package com.android.camera.protocol;

import android.support.annotation.Nullable;
import com.android.camera.protocol.ModeProtocol.BaseProtocol;
import com.android.camera.protocol.ModeProtocol.ModeCoordinator;
import java.util.concurrent.ConcurrentHashMap;

public class ModeCoordinatorImpl implements ModeCoordinator {
    private static ModeCoordinatorImpl sInstance;
    private int mHolderKey;
    private ConcurrentHashMap<Integer, BaseProtocol> protocolMap = new ConcurrentHashMap();

    public static void create(int i) {
        getInstance();
        sInstance.mHolderKey = i;
    }

    public static ModeCoordinatorImpl getInstance() {
        if (sInstance == null) {
            synchronized (ModeCoordinatorImpl.class) {
                if (sInstance == null) {
                    sInstance = new ModeCoordinatorImpl();
                }
            }
        }
        return sInstance;
    }

    public <P extends BaseProtocol> void attachProtocol(int i, @Nullable P p) {
        this.protocolMap.put(Integer.valueOf(i), p);
    }

    public <P extends BaseProtocol> P getAttachProtocol(int i) {
        return (BaseProtocol) this.protocolMap.get(Integer.valueOf(i));
    }

    public <P extends BaseProtocol> void detachProtocol(int i, P p) {
        if (getAttachProtocol(i) == p) {
            this.protocolMap.remove(Integer.valueOf(i));
        }
    }

    private <P extends BaseProtocol> P nullCatcher(Class<P> cls) {
        try {
            return (BaseProtocol) cls.newInstance();
        } catch (InstantiationException e) {
            e.printStackTrace();
        } catch (IllegalAccessException e2) {
            e2.printStackTrace();
        }
        return null;
    }

    private void destroyWorkspace() {
        this.protocolMap.clear();
    }

    public static void forceDestroy() {
        if (sInstance != null) {
            sInstance.destroyWorkspace();
            sInstance = null;
        }
    }

    public static void destroyAll(int i) {
        if (sInstance != null && sInstance.mHolderKey == i) {
            sInstance.destroyWorkspace();
            sInstance = null;
        }
    }

    public static boolean isAlive(int i) {
        return sInstance != null && sInstance.mHolderKey == i;
    }
}
