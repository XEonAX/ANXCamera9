package com.google.android.apps.lens.library.base;

import android.content.ComponentName;
import android.content.Context;
import android.content.Intent;
import android.content.ServiceConnection;
import android.os.IBinder;
import android.os.Looper;
import android.support.annotation.NonNull;
import android.support.annotation.Nullable;
import android.util.Log;
import com.google.android.apps.gsa.publicsearch.IPublicSearchService;
import com.google.android.apps.gsa.publicsearch.IPublicSearchServiceSession;
import com.google.android.apps.gsa.publicsearch.IPublicSearchServiceSessionCallback.Stub;
import com.google.android.apps.gsa.publicsearch.SystemParcelableWrapper;
import com.google.android.apps.gsa.search.shared.service.proto.nano.LensServiceEvent;
import com.google.android.apps.gsa.search.shared.service.proto.nano.LensServiceEventData;
import com.google.android.apps.gsa.search.shared.service.proto.nano.ServiceEventProto;

public class LensServiceBridge extends Stub implements ServiceConnection {
    private static final String BIND_INTENT_ACTION = "com.google.android.apps.gsa.publicsearch.IPublicSearchService";
    private static final boolean DEBUG = false;
    private static final String LENS_CLIENT_SESSION_TYPE = "LENS_SERVICE_SESSION";
    private static final String TAG = "LensServiceBridge";
    private static final int TARGET_SERVICE_API_VERSION = 1;
    @NonNull
    private final Context context;
    @Nullable
    private IPublicSearchService lensService;
    @Nullable
    private volatile IPublicSearchServiceSession lensServiceSession;
    private int serviceApiVersion;

    public LensServiceBridge(@NonNull Context context) {
        this.context = context;
    }

    public boolean bindService() {
        ensureOnMainThread();
        Intent intent = new Intent(BIND_INTENT_ACTION);
        intent.setPackage("com.google.android.googlequicksearchbox");
        try {
            if (this.context.bindService(intent, this, 65)) {
                return true;
            }
            Log.e(TAG, "Unable to bind Lens service.");
            return false;
        } catch (SecurityException e) {
            Log.i(TAG, "Unable to bind Lens service due to security exception. Maybe the service is not available yet.");
            return false;
        }
    }

    public void unbindService() {
        ensureOnMainThread();
        endLensSession();
        this.context.unbindService(this);
        this.lensService = null;
        this.lensServiceSession = null;
        this.serviceApiVersion = 0;
    }

    public void onServiceConnected(ComponentName componentName, IBinder iBinder) {
        ensureOnMainThread();
        Log.i(TAG, "Lens service connected.");
        this.lensService = IPublicSearchService.Stub.asInterface(iBinder);
        beginLensSession();
    }

    public void onServiceDisconnected(ComponentName componentName) {
        ensureOnMainThread();
        Log.w(TAG, "Lens service disconnected.");
    }

    public void onServiceEvent(byte[] bArr, SystemParcelableWrapper systemParcelableWrapper) {
        try {
            ServiceEventProto parseFrom = ServiceEventProto.parseFrom(bArr);
            if (parseFrom.getEventId() == 240 && parseFrom.hasExtension(LensServiceEvent.lensServiceEventData)) {
                this.serviceApiVersion = ((LensServiceEventData) parseFrom.getExtension(LensServiceEvent.lensServiceEventData)).getServiceApiVersion();
            }
        } catch (Throwable e) {
            Log.e(TAG, "Unable to parse the protobuf.", e);
        }
    }

    /* JADX WARNING: Removed duplicated region for block: B:9:0x0029 A:{ExcHandler: android.os.RemoteException (r0_6 'e' java.lang.Throwable), Splitter: B:5:0x001d} */
    /* JADX WARNING: Missing block: B:9:0x0029, code:
            r0 = move-exception;
     */
    /* JADX WARNING: Missing block: B:10:0x002a, code:
            android.util.Log.e(TAG, "Unable to send prewarm signal.", r0);
     */
    /* JADX WARNING: Missing block: B:11:0x0031, code:
            return false;
     */
    public boolean prewarmLensActivity() {
        /*
        r4 = this;
        r4.ensureOnMainThread();
        r0 = r4.isLensSessionReady();
        r1 = 0;
        if (r0 != 0) goto L_0x0012;
    L_0x000a:
        r0 = "LensServiceBridge";
        r2 = "Lens session is not ready for prewarm.";
        android.util.Log.i(r0, r2);
        return r1;
    L_0x0012:
        r0 = new com.google.android.apps.gsa.search.shared.service.proto.nano.ClientEventProto;
        r0.<init>();
        r2 = 347; // 0x15b float:4.86E-43 double:1.714E-321;
        r0 = r0.setEventId(r2);
        r2 = r4.lensServiceSession;	 Catch:{ RemoteException -> 0x0029, RemoteException -> 0x0029 }
        r0 = com.google.protobuf.nano.MessageNano.toByteArray(r0);	 Catch:{ RemoteException -> 0x0029, RemoteException -> 0x0029 }
        r2.onGenericClientEvent(r0);	 Catch:{ RemoteException -> 0x0029, RemoteException -> 0x0029 }
        r0 = 1;
        return r0;
    L_0x0029:
        r0 = move-exception;
        r2 = "LensServiceBridge";
        r3 = "Unable to send prewarm signal.";
        android.util.Log.e(r2, r3, r0);
        return r1;
        */
        throw new UnsupportedOperationException("Method not decompiled: com.google.android.apps.lens.library.base.LensServiceBridge.prewarmLensActivity():boolean");
    }

    private boolean isLensSessionReady() {
        return (this.lensService == null || this.lensServiceSession == null || this.serviceApiVersion <= 0) ? false : true;
    }

    /* JADX WARNING: Removed duplicated region for block: B:6:0x002e A:{ExcHandler: android.os.RemoteException (r0_5 'e' java.lang.Throwable), Splitter: B:4:0x001f} */
    /* JADX WARNING: Missing block: B:6:0x002e, code:
            r0 = move-exception;
     */
    /* JADX WARNING: Missing block: B:7:0x002f, code:
            android.util.Log.e(TAG, "Unable to begin Lens service session.", r0);
     */
    private void beginLensSession() {
        /*
        r4 = this;
        r0 = r4.lensService;
        if (r0 != 0) goto L_0x0005;
    L_0x0004:
        return;
    L_0x0005:
        r0 = new com.google.android.apps.gsa.search.shared.service.proto.nano.ClientEventProto;
        r0.<init>();
        r1 = 348; // 0x15c float:4.88E-43 double:1.72E-321;
        r0 = r0.setEventId(r1);
        r1 = com.google.android.apps.gsa.search.shared.service.proto.nano.LensServiceClientEvent.lensServiceClientEventData;
        r2 = new com.google.android.apps.gsa.search.shared.service.proto.nano.LensServiceClientEventData;
        r2.<init>();
        r3 = 1;
        r2 = r2.setTargetServiceApiVersion(r3);
        r0.setExtension(r1, r2);
        r1 = r4.lensService;	 Catch:{ RemoteException -> 0x002e, RemoteException -> 0x002e }
        r2 = "LENS_SERVICE_SESSION";
        r0 = com.google.protobuf.nano.MessageNano.toByteArray(r0);	 Catch:{ RemoteException -> 0x002e, RemoteException -> 0x002e }
        r0 = r1.beginSession(r2, r4, r0);	 Catch:{ RemoteException -> 0x002e, RemoteException -> 0x002e }
        r4.lensServiceSession = r0;	 Catch:{ RemoteException -> 0x002e, RemoteException -> 0x002e }
        goto L_0x0036;
    L_0x002e:
        r0 = move-exception;
        r1 = "LensServiceBridge";
        r2 = "Unable to begin Lens service session.";
        android.util.Log.e(r1, r2, r0);
    L_0x0036:
        return;
        */
        throw new UnsupportedOperationException("Method not decompiled: com.google.android.apps.lens.library.base.LensServiceBridge.beginLensSession():void");
    }

    /* JADX WARNING: Removed duplicated region for block: B:7:0x001e A:{ExcHandler: android.os.RemoteException (r0_5 'e' java.lang.Throwable), Splitter: B:5:0x0014} */
    /* JADX WARNING: Missing block: B:7:0x001e, code:
            r0 = move-exception;
     */
    /* JADX WARNING: Missing block: B:8:0x001f, code:
            android.util.Log.e(TAG, "Unable to end Lens service session.", r0);
     */
    private void endLensSession() {
        /*
        r3 = this;
        r0 = r3.lensService;
        if (r0 == 0) goto L_0x0027;
    L_0x0004:
        r0 = r3.lensServiceSession;
        if (r0 != 0) goto L_0x0009;
    L_0x0008:
        goto L_0x0027;
    L_0x0009:
        r0 = new com.google.android.apps.gsa.search.shared.service.proto.nano.ClientEventProto;
        r0.<init>();
        r1 = 345; // 0x159 float:4.83E-43 double:1.705E-321;
        r0 = r0.setEventId(r1);
        r1 = r3.lensServiceSession;	 Catch:{ RemoteException -> 0x001e, RemoteException -> 0x001e }
        r0 = com.google.protobuf.nano.MessageNano.toByteArray(r0);	 Catch:{ RemoteException -> 0x001e, RemoteException -> 0x001e }
        r1.onGenericClientEvent(r0);	 Catch:{ RemoteException -> 0x001e, RemoteException -> 0x001e }
        goto L_0x0026;
    L_0x001e:
        r0 = move-exception;
        r1 = "LensServiceBridge";
        r2 = "Unable to end Lens service session.";
        android.util.Log.e(r1, r2, r0);
    L_0x0026:
        return;
    L_0x0027:
        return;
        */
        throw new UnsupportedOperationException("Method not decompiled: com.google.android.apps.lens.library.base.LensServiceBridge.endLensSession():void");
    }

    private void ensureOnMainThread() {
        if (Looper.myLooper() != Looper.getMainLooper()) {
            throw new IllegalStateException("This should be running on the main thread.");
        }
    }
}
