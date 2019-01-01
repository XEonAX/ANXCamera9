package android.support.v4.content;

import android.content.BroadcastReceiver;
import android.content.Context;
import android.content.Intent;
import android.content.IntentFilter;
import android.net.Uri;
import android.os.Handler;
import android.os.Message;
import android.util.Log;
import com.google.android.apps.photos.api.PhotosOemApi;
import com.ss.android.ttve.utils.UIUtils;
import com.ss.android.vesdk.VECameraSettings;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Set;

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
    /* Code decompiled incorrectly, please refer to instructions dump. */
    public boolean sendBroadcast(Intent intent) {
        Intent intent2 = intent;
        synchronized (this.mReceivers) {
            String str;
            StringBuilder stringBuilder;
            String action = intent.getAction();
            String type = intent2.resolveTypeIfNeeded(this.mAppContext.getContentResolver());
            Uri data = intent.getData();
            String scheme = intent.getScheme();
            Set<String> categories = intent.getCategories();
            boolean debug = (intent.getFlags() & 8) != 0;
            if (debug) {
                str = TAG;
                stringBuilder = new StringBuilder();
                stringBuilder.append("Resolving type ");
                stringBuilder.append(type);
                stringBuilder.append(" scheme ");
                stringBuilder.append(scheme);
                stringBuilder.append(" of intent ");
                stringBuilder.append(intent2);
                Log.v(str, stringBuilder.toString());
            }
            ArrayList<ReceiverRecord> entries = (ArrayList) this.mActions.get(intent.getAction());
            if (entries != null) {
                if (debug) {
                    str = TAG;
                    stringBuilder = new StringBuilder();
                    stringBuilder.append("Action list: ");
                    stringBuilder.append(entries);
                    Log.v(str, stringBuilder.toString());
                }
                ArrayList<ReceiverRecord> receivers = null;
                String reason = null;
                int i = 0;
                while (true) {
                    int i2 = i;
                    ArrayList<ReceiverRecord> receivers2;
                    if (i2 < entries.size()) {
                        String type2;
                        int i3;
                        ReceiverRecord receiver = (ReceiverRecord) entries.get(i2);
                        if (debug) {
                            str = TAG;
                            StringBuilder stringBuilder2 = new StringBuilder();
                            stringBuilder2.append("Matching against filter ");
                            stringBuilder2.append(receiver.filter);
                            Log.v(str, stringBuilder2.toString());
                        }
                        if (receiver.broadcasting) {
                            if (debug) {
                                Log.v(TAG, "  Filter's target already added");
                            }
                            type2 = type;
                            i3 = i2;
                            type = receivers;
                        } else {
                            ReceiverRecord receiver2 = receiver;
                            i3 = i2;
                            type2 = type;
                            type = receivers;
                            i = receiver.filter.match(action, type, scheme, data, categories, TAG);
                            String str2;
                            if (i >= 0) {
                                if (debug) {
                                    str2 = TAG;
                                    StringBuilder stringBuilder3 = new StringBuilder();
                                    stringBuilder3.append("  Filter matched!  match=0x");
                                    stringBuilder3.append(Integer.toHexString(i));
                                    Log.v(str2, stringBuilder3.toString());
                                }
                                if (type == null) {
                                    receivers2 = new ArrayList();
                                }
                                receivers2.add(receiver2);
                                receiver2.broadcasting = true;
                                receivers = receivers2;
                            } else if (debug) {
                                switch (i) {
                                    case -4:
                                        str2 = "category";
                                        break;
                                    case UIUtils.LAYOUT_PARAMS_KEEP_OLD /*-3*/:
                                        str2 = VECameraSettings.SCENE_MODE_ACTION;
                                        break;
                                    case -2:
                                        str2 = PhotosOemApi.PATH_SPECIAL_TYPE_DATA;
                                        break;
                                    case -1:
                                        str2 = "type";
                                        break;
                                    default:
                                        str2 = "unknown reason";
                                        break;
                                }
                                String str3 = TAG;
                                StringBuilder stringBuilder4 = new StringBuilder();
                                stringBuilder4.append("  Filter did not match: ");
                                stringBuilder4.append(str2);
                                Log.v(str3, stringBuilder4.toString());
                                receivers = type;
                                reason = str2;
                            }
                            i = i3 + 1;
                            type = type2;
                        }
                        receivers = type;
                        i = i3 + 1;
                        type = type2;
                    } else {
                        receivers2 = receivers;
                        if (receivers2 != null) {
                            for (i = 0; i < receivers2.size(); i++) {
                                ((ReceiverRecord) receivers2.get(i)).broadcasting = false;
                            }
                            this.mPendingBroadcasts.add(new BroadcastRecord(intent2, receivers2));
                            if (!this.mHandler.hasMessages(1)) {
                                this.mHandler.sendEmptyMessage(1);
                            }
                        }
                    }
                }
            }
        }
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
    /* Code decompiled incorrectly, please refer to instructions dump. */
    private void executePendingBroadcasts() {
        while (true) {
            synchronized (this.mReceivers) {
                int N = this.mPendingBroadcasts.size();
                if (N <= 0) {
                    return;
                }
                BroadcastRecord[] brs = new BroadcastRecord[N];
                this.mPendingBroadcasts.toArray(brs);
                this.mPendingBroadcasts.clear();
            }
        }
        while (true) {
        }
    }
}
