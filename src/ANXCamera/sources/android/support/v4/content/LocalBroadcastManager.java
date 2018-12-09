package android.support.v4.content;

import android.content.BroadcastReceiver;
import android.content.Context;
import android.content.Intent;
import android.content.IntentFilter;
import android.os.Handler;
import android.os.Message;
import java.util.ArrayList;
import java.util.HashMap;

public class LocalBroadcastManager {
    private static final boolean DEBUG = false;
    static final int MSG_EXEC_PENDING_BROADCASTS = 1;
    private static final String TAG = "LocalBroadcastManager";
    private static LocalBroadcastManager mInstance;
    private static final Object mLock = new Object();
    private final HashMap<String, ArrayList<ReceiverRecord>> mActions = new HashMap();
    private final Context mAppContext;
    private final Handler mHandler;
    private final ArrayList<BroadcastRecord> mPendingBroadcasts = new ArrayList();
    private final HashMap<BroadcastReceiver, ArrayList<IntentFilter>> mReceivers = new HashMap();

    private static class BroadcastRecord {
        final Intent intent;
        final ArrayList<ReceiverRecord> receivers;

        BroadcastRecord(Intent _intent, ArrayList<ReceiverRecord> _receivers) {
            this.intent = _intent;
            this.receivers = _receivers;
        }
    }

    private static class ReceiverRecord {
        boolean broadcasting;
        final IntentFilter filter;
        final BroadcastReceiver receiver;

        ReceiverRecord(IntentFilter _filter, BroadcastReceiver _receiver) {
            this.filter = _filter;
            this.receiver = _receiver;
        }

        public String toString() {
            StringBuilder builder = new StringBuilder(128);
            builder.append("Receiver{");
            builder.append(this.receiver);
            builder.append(" filter=");
            builder.append(this.filter);
            builder.append("}");
            return builder.toString();
        }
    }

    public static LocalBroadcastManager getInstance(Context context) {
        LocalBroadcastManager localBroadcastManager;
        synchronized (mLock) {
            if (mInstance == null) {
                mInstance = new LocalBroadcastManager(context.getApplicationContext());
            }
            localBroadcastManager = mInstance;
        }
        return localBroadcastManager;
    }

    private LocalBroadcastManager(Context context) {
        this.mAppContext = context;
        this.mHandler = new Handler(context.getMainLooper()) {
            public void handleMessage(Message msg) {
                if (msg.what != 1) {
                    super.handleMessage(msg);
                } else {
                    LocalBroadcastManager.this.executePendingBroadcasts();
                }
            }
        };
    }

    public void registerReceiver(BroadcastReceiver receiver, IntentFilter filter) {
        synchronized (this.mReceivers) {
            ReceiverRecord entry = new ReceiverRecord(filter, receiver);
            ArrayList<IntentFilter> filters = (ArrayList) this.mReceivers.get(receiver);
            if (filters == null) {
                filters = new ArrayList(1);
                this.mReceivers.put(receiver, filters);
            }
            filters.add(filter);
            for (int i = 0; i < filter.countActions(); i++) {
                String action = filter.getAction(i);
                ArrayList<ReceiverRecord> entries = (ArrayList) this.mActions.get(action);
                if (entries == null) {
                    entries = new ArrayList(1);
                    this.mActions.put(action, entries);
                }
                entries.add(entry);
            }
        }
    }

    public void unregisterReceiver(BroadcastReceiver receiver) {
        synchronized (this.mReceivers) {
            ArrayList<IntentFilter> filters = (ArrayList) this.mReceivers.remove(receiver);
            if (filters == null) {
                return;
            }
            for (int i = 0; i < filters.size(); i++) {
                IntentFilter filter = (IntentFilter) filters.get(i);
                for (int j = 0; j < filter.countActions(); j++) {
                    String action = filter.getAction(j);
                    ArrayList<ReceiverRecord> receivers = (ArrayList) this.mActions.get(action);
                    if (receivers != null) {
                        int k = 0;
                        while (k < receivers.size()) {
                            if (((ReceiverRecord) receivers.get(k)).receiver == receiver) {
                                receivers.remove(k);
                                k--;
                            }
                            k++;
                        }
                        if (receivers.size() <= 0) {
                            this.mActions.remove(action);
                        }
                    }
                }
            }
        }
    }

    /* JADX WARNING: Missing block: B:53:0x0167, code:
            return true;
     */
    /* JADX WARNING: Missing block: B:56:0x016a, code:
            return false;
     */
    public boolean sendBroadcast(android.content.Intent r20) {
        /*
        r19 = this;
        r1 = r19;
        r2 = r20;
        r3 = r1.mReceivers;
        monitor-enter(r3);
        r5 = r20.getAction();	 Catch:{ all -> 0x016b }
        r0 = r1.mAppContext;	 Catch:{ all -> 0x016b }
        r0 = r0.getContentResolver();	 Catch:{ all -> 0x016b }
        r0 = r2.resolveTypeIfNeeded(r0);	 Catch:{ all -> 0x016b }
        r8 = r20.getData();	 Catch:{ all -> 0x016b }
        r4 = r20.getScheme();	 Catch:{ all -> 0x016b }
        r11 = r4;
        r9 = r20.getCategories();	 Catch:{ all -> 0x016b }
        r4 = r20.getFlags();	 Catch:{ all -> 0x016b }
        r4 = r4 & 8;
        if (r4 == 0) goto L_0x002c;
    L_0x002a:
        r4 = 1;
        goto L_0x002d;
    L_0x002c:
        r4 = 0;
    L_0x002d:
        r14 = r4;
        if (r14 == 0) goto L_0x0056;
    L_0x0030:
        r4 = "LocalBroadcastManager";
        r6 = new java.lang.StringBuilder;	 Catch:{ all -> 0x016b }
        r6.<init>();	 Catch:{ all -> 0x016b }
        r7 = "Resolving type ";
        r6.append(r7);	 Catch:{ all -> 0x016b }
        r6.append(r0);	 Catch:{ all -> 0x016b }
        r7 = " scheme ";
        r6.append(r7);	 Catch:{ all -> 0x016b }
        r6.append(r11);	 Catch:{ all -> 0x016b }
        r7 = " of intent ";
        r6.append(r7);	 Catch:{ all -> 0x016b }
        r6.append(r2);	 Catch:{ all -> 0x016b }
        r6 = r6.toString();	 Catch:{ all -> 0x016b }
        android.util.Log.v(r4, r6);	 Catch:{ all -> 0x016b }
    L_0x0056:
        r4 = r1.mActions;	 Catch:{ all -> 0x016b }
        r6 = r20.getAction();	 Catch:{ all -> 0x016b }
        r4 = r4.get(r6);	 Catch:{ all -> 0x016b }
        r4 = (java.util.ArrayList) r4;	 Catch:{ all -> 0x016b }
        r15 = r4;
        if (r15 == 0) goto L_0x0168;
    L_0x0065:
        if (r14 == 0) goto L_0x007d;
    L_0x0067:
        r4 = "LocalBroadcastManager";
        r6 = new java.lang.StringBuilder;	 Catch:{ all -> 0x016b }
        r6.<init>();	 Catch:{ all -> 0x016b }
        r7 = "Action list: ";
        r6.append(r7);	 Catch:{ all -> 0x016b }
        r6.append(r15);	 Catch:{ all -> 0x016b }
        r6 = r6.toString();	 Catch:{ all -> 0x016b }
        android.util.Log.v(r4, r6);	 Catch:{ all -> 0x016b }
    L_0x007d:
        r4 = 0;
        r6 = 0;
        r10 = r4;
        r16 = r6;
        r4 = 0;
    L_0x0083:
        r7 = r4;
        r4 = r15.size();	 Catch:{ all -> 0x016b }
        if (r7 >= r4) goto L_0x0135;
    L_0x008a:
        r4 = r15.get(r7);	 Catch:{ all -> 0x016b }
        r4 = (android.support.v4.content.LocalBroadcastManager.ReceiverRecord) r4;	 Catch:{ all -> 0x016b }
        r6 = r4;
        if (r14 == 0) goto L_0x00ab;
    L_0x0093:
        r4 = "LocalBroadcastManager";
        r12 = new java.lang.StringBuilder;	 Catch:{ all -> 0x016b }
        r12.<init>();	 Catch:{ all -> 0x016b }
        r13 = "Matching against filter ";
        r12.append(r13);	 Catch:{ all -> 0x016b }
        r13 = r6.filter;	 Catch:{ all -> 0x016b }
        r12.append(r13);	 Catch:{ all -> 0x016b }
        r12 = r12.toString();	 Catch:{ all -> 0x016b }
        android.util.Log.v(r4, r12);	 Catch:{ all -> 0x016b }
    L_0x00ab:
        r4 = r6.broadcasting;	 Catch:{ all -> 0x016b }
        if (r4 == 0) goto L_0x00bf;
    L_0x00af:
        if (r14 == 0) goto L_0x00b8;
    L_0x00b1:
        r4 = "LocalBroadcastManager";
        r12 = "  Filter's target already added";
        android.util.Log.v(r4, r12);	 Catch:{ all -> 0x016b }
    L_0x00b8:
        r18 = r0;
        r17 = r7;
        r0 = r10;
        goto L_0x012e;
    L_0x00bf:
        r4 = r6.filter;	 Catch:{ all -> 0x016b }
        r12 = "LocalBroadcastManager";
        r13 = r6;
        r6 = r0;
        r17 = r7;
        r7 = r11;
        r18 = r0;
        r0 = r10;
        r10 = r12;
        r4 = r4.match(r5, r6, r7, r8, r9, r10);	 Catch:{ all -> 0x016b }
        if (r4 < 0) goto L_0x00ff;
    L_0x00d2:
        if (r14 == 0) goto L_0x00ee;
    L_0x00d4:
        r6 = "LocalBroadcastManager";
        r7 = new java.lang.StringBuilder;	 Catch:{ all -> 0x016b }
        r7.<init>();	 Catch:{ all -> 0x016b }
        r10 = "  Filter matched!  match=0x";
        r7.append(r10);	 Catch:{ all -> 0x016b }
        r10 = java.lang.Integer.toHexString(r4);	 Catch:{ all -> 0x016b }
        r7.append(r10);	 Catch:{ all -> 0x016b }
        r7 = r7.toString();	 Catch:{ all -> 0x016b }
        android.util.Log.v(r6, r7);	 Catch:{ all -> 0x016b }
    L_0x00ee:
        if (r0 != 0) goto L_0x00f7;
    L_0x00f0:
        r6 = new java.util.ArrayList;	 Catch:{ all -> 0x016b }
        r6.<init>();	 Catch:{ all -> 0x016b }
        r10 = r6;
        r0 = r10;
    L_0x00f7:
        r0.add(r13);	 Catch:{ all -> 0x016b }
        r6 = 1;
        r13.broadcasting = r6;	 Catch:{ all -> 0x016b }
        r10 = r0;
        goto L_0x012f;
    L_0x00ff:
        if (r14 == 0) goto L_0x012e;
    L_0x0101:
        switch(r4) {
            case -4: goto L_0x0110;
            case -3: goto L_0x010d;
            case -2: goto L_0x010a;
            case -1: goto L_0x0107;
            default: goto L_0x0104;
        };	 Catch:{ all -> 0x016b }
    L_0x0104:
        r6 = "unknown reason";
        goto L_0x0113;
    L_0x0107:
        r6 = "type";
        goto L_0x0114;
    L_0x010a:
        r6 = "data";
        goto L_0x0114;
    L_0x010d:
        r6 = "action";
        goto L_0x0114;
    L_0x0110:
        r6 = "category";
        goto L_0x0114;
    L_0x0114:
        r7 = "LocalBroadcastManager";
        r10 = new java.lang.StringBuilder;	 Catch:{ all -> 0x016b }
        r10.<init>();	 Catch:{ all -> 0x016b }
        r12 = "  Filter did not match: ";
        r10.append(r12);	 Catch:{ all -> 0x016b }
        r10.append(r6);	 Catch:{ all -> 0x016b }
        r10 = r10.toString();	 Catch:{ all -> 0x016b }
        android.util.Log.v(r7, r10);	 Catch:{ all -> 0x016b }
        r10 = r0;
        r16 = r6;
        goto L_0x012f;
    L_0x012e:
        r10 = r0;
    L_0x012f:
        r4 = r17 + 1;
        r0 = r18;
        goto L_0x0083;
    L_0x0135:
        r18 = r0;
        r0 = r10;
        if (r0 == 0) goto L_0x0168;
    L_0x013a:
        r4 = 0;
    L_0x013b:
        r6 = r0.size();	 Catch:{ all -> 0x016b }
        if (r4 >= r6) goto L_0x014d;
    L_0x0141:
        r6 = r0.get(r4);	 Catch:{ all -> 0x016b }
        r6 = (android.support.v4.content.LocalBroadcastManager.ReceiverRecord) r6;	 Catch:{ all -> 0x016b }
        r7 = 0;
        r6.broadcasting = r7;	 Catch:{ all -> 0x016b }
        r4 = r4 + 1;
        goto L_0x013b;
    L_0x014d:
        r4 = r1.mPendingBroadcasts;	 Catch:{ all -> 0x016b }
        r6 = new android.support.v4.content.LocalBroadcastManager$BroadcastRecord;	 Catch:{ all -> 0x016b }
        r6.<init>(r2, r0);	 Catch:{ all -> 0x016b }
        r4.add(r6);	 Catch:{ all -> 0x016b }
        r4 = r1.mHandler;	 Catch:{ all -> 0x016b }
        r6 = 1;
        r4 = r4.hasMessages(r6);	 Catch:{ all -> 0x016b }
        if (r4 != 0) goto L_0x0165;
    L_0x0160:
        r4 = r1.mHandler;	 Catch:{ all -> 0x016b }
        r4.sendEmptyMessage(r6);	 Catch:{ all -> 0x016b }
    L_0x0165:
        monitor-exit(r3);	 Catch:{ all -> 0x016b }
        r3 = 1;
        return r3;
    L_0x0168:
        monitor-exit(r3);	 Catch:{ all -> 0x016b }
        r0 = 0;
        return r0;
    L_0x016b:
        r0 = move-exception;
        monitor-exit(r3);	 Catch:{ all -> 0x016b }
        throw r0;
        */
        throw new UnsupportedOperationException("Method not decompiled: android.support.v4.content.LocalBroadcastManager.sendBroadcast(android.content.Intent):boolean");
    }

    public void sendBroadcastSync(Intent intent) {
        if (sendBroadcast(intent)) {
            executePendingBroadcasts();
        }
    }

    /* JADX WARNING: Missing block: B:9:0x001c, code:
            r2 = 0;
     */
    /* JADX WARNING: Missing block: B:11:0x001f, code:
            if (r2 >= r0.length) goto L_0x0043;
     */
    /* JADX WARNING: Missing block: B:12:0x0021, code:
            r3 = r0[r2];
            r4 = 0;
     */
    /* JADX WARNING: Missing block: B:14:0x002a, code:
            if (r4 >= r3.receivers.size()) goto L_0x0040;
     */
    /* JADX WARNING: Missing block: B:15:0x002c, code:
            ((android.support.v4.content.LocalBroadcastManager.ReceiverRecord) r3.receivers.get(r4)).receiver.onReceive(r8.mAppContext, r3.intent);
            r4 = r4 + 1;
     */
    /* JADX WARNING: Missing block: B:16:0x0040, code:
            r2 = r2 + 1;
     */
    private void executePendingBroadcasts() {
        /*
        r8 = this;
    L_0x0000:
        r0 = 0;
        r1 = r8.mReceivers;
        monitor-enter(r1);
        r2 = r8.mPendingBroadcasts;	 Catch:{ all -> 0x0044 }
        r2 = r2.size();	 Catch:{ all -> 0x0044 }
        if (r2 > 0) goto L_0x000e;
    L_0x000c:
        monitor-exit(r1);	 Catch:{ all -> 0x0044 }
        return;
    L_0x000e:
        r3 = new android.support.v4.content.LocalBroadcastManager.BroadcastRecord[r2];	 Catch:{ all -> 0x0044 }
        r0 = r3;
        r3 = r8.mPendingBroadcasts;	 Catch:{ all -> 0x0044 }
        r3.toArray(r0);	 Catch:{ all -> 0x0044 }
        r3 = r8.mPendingBroadcasts;	 Catch:{ all -> 0x0044 }
        r3.clear();	 Catch:{ all -> 0x0044 }
        monitor-exit(r1);	 Catch:{ all -> 0x0044 }
        r1 = 0;
        r2 = r1;
    L_0x001e:
        r3 = r0.length;
        if (r2 >= r3) goto L_0x0043;
    L_0x0021:
        r3 = r0[r2];
        r4 = r1;
    L_0x0024:
        r5 = r3.receivers;
        r5 = r5.size();
        if (r4 >= r5) goto L_0x0040;
    L_0x002c:
        r5 = r3.receivers;
        r5 = r5.get(r4);
        r5 = (android.support.v4.content.LocalBroadcastManager.ReceiverRecord) r5;
        r5 = r5.receiver;
        r6 = r8.mAppContext;
        r7 = r3.intent;
        r5.onReceive(r6, r7);
        r4 = r4 + 1;
        goto L_0x0024;
    L_0x0040:
        r2 = r2 + 1;
        goto L_0x001e;
    L_0x0043:
        goto L_0x0000;
    L_0x0044:
        r2 = move-exception;
        monitor-exit(r1);	 Catch:{ all -> 0x0044 }
        throw r2;
        */
        throw new UnsupportedOperationException("Method not decompiled: android.support.v4.content.LocalBroadcastManager.executePendingBroadcasts():void");
    }
}
