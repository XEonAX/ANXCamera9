package android.support.test.internal.runner;

import android.app.Instrumentation;
import android.content.BroadcastReceiver;
import android.content.Context;
import android.content.Intent;
import android.content.IntentFilter;
import android.os.Bundle;
import android.os.Handler;
import android.os.HandlerThread;
import android.os.Looper;
import android.os.Message;
import android.os.Messenger;
import android.os.Parcelable;
import android.support.annotation.NonNull;
import android.support.annotation.VisibleForTesting;
import android.support.test.InstrumentationRegistry;
import android.support.test.annotation.Beta;
import android.support.test.internal.util.Checks;
import android.support.test.internal.util.LogUtil;
import android.support.test.internal.util.ParcelableIBinder;
import android.support.test.runner.MonitoringInstrumentation.ActivityFinisher;
import android.util.Log;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.HashSet;
import java.util.Iterator;
import java.util.Map;
import java.util.Map.Entry;
import java.util.Set;
import java.util.UUID;
import java.util.concurrent.Callable;
import java.util.concurrent.CountDownLatch;
import java.util.concurrent.ExecutionException;
import java.util.concurrent.FutureTask;
import java.util.concurrent.TimeUnit;

@Beta
public class InstrumentationConnection {
    public static final String BROADCAST_FILTER = "android.support.test.runner.InstrumentationConnection.event";
    @VisibleForTesting
    static final String BUNDLE_BR_NEW_BINDER = "new_instrumentation_binder";
    private static final String BUNDLE_KEY_CLIENTS = "instr_clients";
    private static final String BUNDLE_KEY_CLIENT_MESSENGER = "instr_client_msgr";
    private static final String BUNDLE_KEY_CLIENT_TYPE = "instr_client_type";
    private static final String BUNDLE_KEY_UUID = "instr_uuid";
    private static final InstrumentationConnection DEFAULT_INSTANCE = new InstrumentationConnection(InstrumentationRegistry.getTargetContext());
    @VisibleForTesting
    static final int MSG_ADD_CLIENTS_IN_BUNDLE = 6;
    @VisibleForTesting
    static final int MSG_ADD_INSTRUMENTATION = 4;
    private static final int MSG_HANDLE_INSTRUMENTATION_FROM_BROADCAST = 3;
    private static final int MSG_PERFORM_CLEANUP = 11;
    private static final int MSG_PERFORM_CLEANUP_FINISHED = 12;
    private static final int MSG_REG_CLIENT = 8;
    private static final int MSG_REMOTE_ADD_CLIENT = 0;
    @VisibleForTesting
    static final int MSG_REMOTE_CLEANUP_REQUEST = 10;
    private static final int MSG_REMOTE_REMOVE_CLIENT = 1;
    private static final int MSG_REMOVE_CLIENTS_IN_BUNDLE = 7;
    private static final int MSG_REMOVE_INSTRUMENTATION = 5;
    private static final int MSG_TERMINATE = 2;
    private static final int MSG_UN_REG_CLIENT = 9;
    private static final String TAG = "InstrConnection";
    private static ActivityFinisher mActivityFinisher;
    private static Instrumentation mInstrumentation;
    IncomingHandler mIncomingHandler;
    @VisibleForTesting
    final BroadcastReceiver mMessengerReceiver = new MessengerReceiver();
    private Context mTargetContext;

    @VisibleForTesting
    static class IncomingHandler extends Handler {
        private final Map<UUID, CountDownLatch> latches = new HashMap();
        @VisibleForTesting
        Messenger mMessengerHandler = new Messenger(this);
        @VisibleForTesting
        Set<Messenger> mOtherInstrumentations = new HashSet();
        @VisibleForTesting
        Map<String, Set<Messenger>> mTypedClients = new HashMap();

        public IncomingHandler(Looper looper) {
            super(looper);
            if (Looper.getMainLooper() == looper || Looper.myLooper() == looper) {
                throw new IllegalStateException("This handler should not be using the main thread looper nor the instrumentation thread looper.");
            }
        }

        public void handleMessage(Message message) {
            switch (message.what) {
                case 0:
                    LogUtil.logDebugWithProcess(InstrumentationConnection.TAG, "handleMessage(MSG_REMOTE_ADD_CLIENT)", new Object[0]);
                    registerClient(message.getData().getString(InstrumentationConnection.BUNDLE_KEY_CLIENT_TYPE), (Messenger) message.getData().getParcelable(InstrumentationConnection.BUNDLE_KEY_CLIENT_MESSENGER));
                    return;
                case 1:
                    LogUtil.logDebugWithProcess(InstrumentationConnection.TAG, "handleMessage(MSG_REMOTE_REMOVE_CLIENT)", new Object[0]);
                    unregisterClient(message.getData().getString(InstrumentationConnection.BUNDLE_KEY_CLIENT_TYPE), message.replyTo);
                    return;
                case 2:
                    LogUtil.logDebugWithProcess(InstrumentationConnection.TAG, "handleMessage(MSG_TERMINATE)", new Object[0]);
                    doDie();
                    return;
                case 3:
                    LogUtil.logDebugWithProcess(InstrumentationConnection.TAG, "handleMessage(MSG_HANDLE_INSTRUMENTATION_FROM_BROADCAST)", new Object[0]);
                    if (this.mOtherInstrumentations.add(message.replyTo)) {
                        sendMessageWithReply(message.replyTo, 4, null);
                        return;
                    } else {
                        Log.w(InstrumentationConnection.TAG, "Broadcast with existing binder was received, ignoring it..");
                        return;
                    }
                case 4:
                    LogUtil.logDebugWithProcess(InstrumentationConnection.TAG, "handleMessage(MSG_ADD_INSTRUMENTATION)", new Object[0]);
                    if (this.mOtherInstrumentations.add(message.replyTo)) {
                        if (!this.mTypedClients.isEmpty()) {
                            sendMessageWithReply(message.replyTo, 6, null);
                        }
                        clientsRegistrationFromBundle(message.getData(), true);
                        return;
                    }
                    Log.w(InstrumentationConnection.TAG, "Message with existing binder was received, ignoring it..");
                    return;
                case 5:
                    LogUtil.logDebugWithProcess(InstrumentationConnection.TAG, "handleMessage(MSG_REMOVE_INSTRUMENTATION)", new Object[0]);
                    if (!this.mOtherInstrumentations.remove(message.replyTo)) {
                        Log.w(InstrumentationConnection.TAG, "Attempting to remove a non-existent binder!");
                        return;
                    }
                    return;
                case 6:
                    LogUtil.logDebugWithProcess(InstrumentationConnection.TAG, "handleMessage(MSG_ADD_CLIENTS_IN_BUNDLE)", new Object[0]);
                    clientsRegistrationFromBundle(message.getData(), true);
                    return;
                case 7:
                    LogUtil.logDebugWithProcess(InstrumentationConnection.TAG, "handleMessage(MSG_REMOVE_CLIENTS_IN_BUNDLE)", new Object[0]);
                    clientsRegistrationFromBundle(message.getData(), false);
                    return;
                case 8:
                    LogUtil.logDebugWithProcess(InstrumentationConnection.TAG, "handleMessage(MSG_REG_CLIENT)", new Object[0]);
                    registerClient(message.getData().getString(InstrumentationConnection.BUNDLE_KEY_CLIENT_TYPE), (Messenger) message.getData().getParcelable(InstrumentationConnection.BUNDLE_KEY_CLIENT_MESSENGER));
                    sendMessageToOtherInstr(0, message.getData());
                    return;
                case 9:
                    LogUtil.logDebugWithProcess(InstrumentationConnection.TAG, "handleMessage(MSG_UN_REG_CLIENT)", new Object[0]);
                    unregisterClient(message.getData().getString(InstrumentationConnection.BUNDLE_KEY_CLIENT_TYPE), (Messenger) message.getData().getParcelable(InstrumentationConnection.BUNDLE_KEY_CLIENT_MESSENGER));
                    sendMessageToOtherInstr(1, message.getData());
                    return;
                case 10:
                    LogUtil.logDebugWithProcess(InstrumentationConnection.TAG, "handleMessage(MSG_REMOTE_CLEANUP_REQUEST)", new Object[0]);
                    if (this.mOtherInstrumentations.isEmpty()) {
                        Message obtainMessage = obtainMessage(12);
                        obtainMessage.setData(message.getData());
                        sendMessage(obtainMessage);
                        return;
                    }
                    sendMessageToOtherInstr(11, message.getData());
                    return;
                case 11:
                    LogUtil.logDebugWithProcess(InstrumentationConnection.TAG, "handleMessage(MSG_PERFORM_CLEANUP)", new Object[0]);
                    InstrumentationConnection.mInstrumentation.runOnMainSync(InstrumentationConnection.mActivityFinisher);
                    sendMessageWithReply(message.replyTo, 12, message.getData());
                    return;
                case 12:
                    LogUtil.logDebugWithProcess(InstrumentationConnection.TAG, "handleMessage(MSG_PERFORM_CLEANUP_FINISHED)", new Object[0]);
                    notifyLatch((UUID) message.getData().getSerializable(InstrumentationConnection.BUNDLE_KEY_UUID));
                    return;
                default:
                    String str = InstrumentationConnection.TAG;
                    int i = message.what;
                    StringBuilder stringBuilder = new StringBuilder(42);
                    stringBuilder.append("Unknown message code received: ");
                    stringBuilder.append(i);
                    Log.w(str, stringBuilder.toString());
                    super.handleMessage(message);
                    return;
            }
        }

        private void notifyLatch(UUID uuid) {
            if (uuid == null || !this.latches.containsKey(uuid)) {
                String str = InstrumentationConnection.TAG;
                String valueOf = String.valueOf(uuid);
                StringBuilder stringBuilder = new StringBuilder(16 + String.valueOf(valueOf).length());
                stringBuilder.append("Latch not found ");
                stringBuilder.append(valueOf);
                Log.w(str, stringBuilder.toString());
                return;
            }
            ((CountDownLatch) this.latches.get(uuid)).countDown();
        }

        private void associateLatch(final UUID uuid, final CountDownLatch countDownLatch) {
            runSyncTask(new Callable<Void>() {
                public Void call() {
                    IncomingHandler.this.latches.put(uuid, countDownLatch);
                    return null;
                }
            });
        }

        private void disassociateLatch(final UUID uuid) {
            runSyncTask(new Callable<Void>() {
                public Void call() {
                    IncomingHandler.this.latches.remove(uuid);
                    return null;
                }
            });
        }

        private <T> T runSyncTask(Callable<T> callable) {
            Object futureTask = new FutureTask(callable);
            post(futureTask);
            try {
                return futureTask.get();
            } catch (InterruptedException e) {
                throw new IllegalStateException(e.getCause());
            } catch (ExecutionException e2) {
                throw new IllegalStateException(e2.getCause());
            }
        }

        private void doDie() {
            Log.i(InstrumentationConnection.TAG, "terminating process");
            sendMessageToOtherInstr(5, null);
            this.mOtherInstrumentations.clear();
            this.mTypedClients.clear();
            LogUtil.logDebugWithProcess(InstrumentationConnection.TAG, "quitting looper...", new Object[0]);
            getLooper().quit();
            LogUtil.logDebugWithProcess(InstrumentationConnection.TAG, "finishing instrumentation...", new Object[0]);
            InstrumentationConnection.mInstrumentation.finish(0, null);
            InstrumentationConnection.mInstrumentation = null;
            InstrumentationConnection.mActivityFinisher = null;
        }

        private Set<Messenger> getClientsForType(final String str) {
            Object futureTask = new FutureTask(new Callable<Set<Messenger>>() {
                public Set<Messenger> call() {
                    return (Set) IncomingHandler.this.mTypedClients.get(str);
                }
            });
            post(futureTask);
            try {
                return (Set) futureTask.get();
            } catch (Throwable e) {
                throw new IllegalStateException(e);
            } catch (ExecutionException e2) {
                throw new IllegalStateException(e2.getCause());
            }
        }

        private void sendMessageWithReply(Messenger messenger, int i, Bundle bundle) {
            String str = InstrumentationConnection.TAG;
            StringBuilder stringBuilder = new StringBuilder(45);
            stringBuilder.append("sendMessageWithReply type: ");
            stringBuilder.append(i);
            stringBuilder.append(" called");
            LogUtil.logDebugWithProcess(str, stringBuilder.toString(), new Object[0]);
            Message obtainMessage = obtainMessage(i);
            obtainMessage.replyTo = this.mMessengerHandler;
            if (bundle != null) {
                obtainMessage.setData(bundle);
            }
            if (!this.mTypedClients.isEmpty()) {
                bundle = obtainMessage.getData();
                bundle.putStringArrayList(InstrumentationConnection.BUNDLE_KEY_CLIENTS, new ArrayList(this.mTypedClients.keySet()));
                for (Entry entry : this.mTypedClients.entrySet()) {
                    bundle.putParcelableArray(String.valueOf(entry.getKey()), (Messenger[]) ((Set) entry.getValue()).toArray(new Messenger[((Set) entry.getValue()).size()]));
                }
                obtainMessage.setData(bundle);
            }
            try {
                messenger.send(obtainMessage);
            } catch (Throwable e) {
                Log.w(InstrumentationConnection.TAG, "The remote process is terminated unexpectedly", e);
                instrBinderDied(messenger);
            }
        }

        private void sendMessageToOtherInstr(int i, Bundle bundle) {
            LogUtil.logDebugWithProcess(InstrumentationConnection.TAG, "sendMessageToOtherInstr() called with: what = [%s], data = [%s]", Integer.valueOf(i), bundle);
            for (Messenger sendMessageWithReply : this.mOtherInstrumentations) {
                sendMessageWithReply(sendMessageWithReply, i, bundle);
            }
        }

        private void clientsRegistrationFromBundle(Bundle bundle, boolean z) {
            LogUtil.logDebugWithProcess(InstrumentationConnection.TAG, "clientsRegistrationFromBundle called", new Object[0]);
            if (bundle == null) {
                Log.w(InstrumentationConnection.TAG, "The client bundle is null, ignoring...");
                return;
            }
            ArrayList stringArrayList = bundle.getStringArrayList(InstrumentationConnection.BUNDLE_KEY_CLIENTS);
            if (stringArrayList == null) {
                Log.w(InstrumentationConnection.TAG, "No clients found in the given bundle");
                return;
            }
            Iterator it = stringArrayList.iterator();
            while (it.hasNext()) {
                String str = (String) it.next();
                Parcelable[] parcelableArray = bundle.getParcelableArray(String.valueOf(str));
                if (parcelableArray != null) {
                    for (Parcelable parcelable : parcelableArray) {
                        if (z) {
                            registerClient(str, (Messenger) parcelable);
                        } else {
                            unregisterClient(str, (Messenger) parcelable);
                        }
                    }
                }
            }
        }

        private void registerClient(String str, Messenger messenger) {
            LogUtil.logDebugWithProcess(InstrumentationConnection.TAG, "registerClient called with type = [%s] client = [%s]", str, messenger);
            Checks.checkNotNull(str, "type cannot be null!");
            Checks.checkNotNull(messenger, "client cannot be null!");
            Set set = (Set) this.mTypedClients.get(str);
            if (set == null) {
                set = new HashSet();
                set.add(messenger);
                this.mTypedClients.put(str, set);
                return;
            }
            set.add(messenger);
        }

        private void unregisterClient(String str, Messenger messenger) {
            LogUtil.logDebugWithProcess(InstrumentationConnection.TAG, "unregisterClient called with type = [%s] client = [%s]", str, messenger);
            Checks.checkNotNull(str, "type cannot be null!");
            Checks.checkNotNull(messenger, "client cannot be null!");
            String str2;
            if (this.mTypedClients.containsKey(str)) {
                Set set = (Set) this.mTypedClients.get(str);
                if (set.contains(messenger)) {
                    set.remove(messenger);
                    if (set.isEmpty()) {
                        this.mTypedClients.remove(str);
                    }
                    return;
                }
                str2 = InstrumentationConnection.TAG;
                StringBuilder stringBuilder = new StringBuilder(78 + String.valueOf(str).length());
                stringBuilder.append("Could not unregister client for type ");
                stringBuilder.append(str);
                stringBuilder.append(" because it doesn't seem to be registered");
                Log.w(str2, stringBuilder.toString());
                return;
            }
            str2 = InstrumentationConnection.TAG;
            String str3 = "There are no registered clients for type: ";
            str = String.valueOf(str);
            Log.w(str2, str.length() != 0 ? str3.concat(str) : new String(str3));
        }

        private void instrBinderDied(Messenger messenger) {
            Message obtainMessage = obtainMessage(5);
            obtainMessage.replyTo = messenger;
            sendMessage(obtainMessage);
        }
    }

    @VisibleForTesting
    class MessengerReceiver extends BroadcastReceiver {
        MessengerReceiver() {
        }

        public void onReceive(Context context, Intent intent) {
            LogUtil.logDebugWithProcess(InstrumentationConnection.TAG, "Broadcast received", new Object[0]);
            Bundle bundleExtra = intent.getBundleExtra(InstrumentationConnection.BUNDLE_BR_NEW_BINDER);
            if (bundleExtra == null) {
                Log.w(InstrumentationConnection.TAG, "Broadcast intent doesn't contain any extras, ignoring it..");
                return;
            }
            ParcelableIBinder parcelableIBinder = (ParcelableIBinder) bundleExtra.getParcelable(InstrumentationConnection.BUNDLE_BR_NEW_BINDER);
            if (parcelableIBinder != null) {
                Messenger messenger = new Messenger(parcelableIBinder.getIBinder());
                Message obtainMessage = InstrumentationConnection.this.mIncomingHandler.obtainMessage(3);
                obtainMessage.replyTo = messenger;
                InstrumentationConnection.this.mIncomingHandler.sendMessage(obtainMessage);
            }
        }
    }

    @VisibleForTesting
    InstrumentationConnection(@NonNull Context context) {
        this.mTargetContext = (Context) Checks.checkNotNull(context, "Context can't be null");
    }

    public static InstrumentationConnection getInstance() {
        return DEFAULT_INSTANCE;
    }

    public synchronized void init(Instrumentation instrumentation, ActivityFinisher activityFinisher) {
        LogUtil.logDebugWithProcess(TAG, "init", new Object[0]);
        if (this.mIncomingHandler == null) {
            mInstrumentation = instrumentation;
            mActivityFinisher = activityFinisher;
            HandlerThread handlerThread = new HandlerThread("InstrumentationConnectionThread");
            handlerThread.start();
            this.mIncomingHandler = new IncomingHandler(handlerThread.getLooper());
            Intent intent = new Intent(BROADCAST_FILTER);
            Bundle bundle = new Bundle();
            bundle.putParcelable(BUNDLE_BR_NEW_BINDER, new ParcelableIBinder(this.mIncomingHandler.mMessengerHandler.getBinder()));
            intent.putExtra(BUNDLE_BR_NEW_BINDER, bundle);
            try {
                this.mTargetContext.sendBroadcast(intent);
                this.mTargetContext.registerReceiver(this.mMessengerReceiver, new IntentFilter(BROADCAST_FILTER));
            } catch (SecurityException e) {
                Log.i(TAG, "Could not send broadcast or register receiver (isolatedProcess?)");
            }
        }
        return;
    }

    public synchronized void terminate() {
        LogUtil.logDebugWithProcess(TAG, "Terminate is called", new Object[0]);
        if (this.mIncomingHandler != null) {
            this.mIncomingHandler.runSyncTask(new Callable<Void>() {
                public Void call() {
                    InstrumentationConnection.this.mIncomingHandler.doDie();
                    return null;
                }
            });
            this.mTargetContext.unregisterReceiver(this.mMessengerReceiver);
            this.mIncomingHandler = null;
        }
    }

    public synchronized void requestRemoteInstancesActivityCleanup() {
        IncomingHandler incomingHandler;
        Checks.checkState(this.mIncomingHandler != null, "Instrumentation Connection in not yet initialized");
        UUID randomUUID = UUID.randomUUID();
        CountDownLatch countDownLatch = new CountDownLatch(1);
        this.mIncomingHandler.associateLatch(randomUUID, countDownLatch);
        Message obtainMessage = this.mIncomingHandler.obtainMessage(10);
        obtainMessage.replyTo = this.mIncomingHandler.mMessengerHandler;
        Bundle data = obtainMessage.getData();
        data.putSerializable(BUNDLE_KEY_UUID, randomUUID);
        obtainMessage.setData(data);
        this.mIncomingHandler.sendMessage(obtainMessage);
        String valueOf;
        try {
            if (!countDownLatch.await(2, TimeUnit.SECONDS)) {
                String str = TAG;
                valueOf = String.valueOf(randomUUID);
                StringBuilder stringBuilder = new StringBuilder(60 + String.valueOf(valueOf).length());
                stringBuilder.append("Timed out while attempting to perform activity clean up for ");
                stringBuilder.append(valueOf);
                Log.w(str, stringBuilder.toString());
            }
            incomingHandler = this.mIncomingHandler;
        } catch (Throwable e) {
            try {
                valueOf = TAG;
                String valueOf2 = String.valueOf(randomUUID);
                StringBuilder stringBuilder2 = new StringBuilder(61 + String.valueOf(valueOf2).length());
                stringBuilder2.append("Interrupted while waiting for response from message with id: ");
                stringBuilder2.append(valueOf2);
                Log.e(valueOf, stringBuilder2.toString(), e);
                incomingHandler = this.mIncomingHandler;
            } catch (Throwable th) {
                this.mIncomingHandler.disassociateLatch(randomUUID);
            }
        }
        incomingHandler.disassociateLatch(randomUUID);
        return;
    }

    public synchronized void registerClient(String str, Messenger messenger) {
        Checks.checkState(this.mIncomingHandler != null, "Instrumentation Connection in not yet initialized");
        String str2 = TAG;
        String str3 = "Register client of type: ";
        String valueOf = String.valueOf(str);
        Log.i(str2, valueOf.length() != 0 ? str3.concat(valueOf) : new String(str3));
        Bundle bundle = new Bundle();
        bundle.putString(BUNDLE_KEY_CLIENT_TYPE, str);
        bundle.putParcelable(BUNDLE_KEY_CLIENT_MESSENGER, messenger);
        Message obtainMessage = this.mIncomingHandler.obtainMessage(8);
        obtainMessage.setData(bundle);
        this.mIncomingHandler.sendMessage(obtainMessage);
    }

    public synchronized Set<Messenger> getClientsForType(String str) {
        return this.mIncomingHandler.getClientsForType(str);
    }

    public synchronized void unregisterClient(String str, Messenger messenger) {
        Checks.checkState(this.mIncomingHandler != null, "Instrumentation Connection in not yet initialized");
        String str2 = TAG;
        String str3 = "Unregister client of type: ";
        String valueOf = String.valueOf(str);
        Log.i(str2, valueOf.length() != 0 ? str3.concat(valueOf) : new String(str3));
        Bundle bundle = new Bundle();
        bundle.putString(BUNDLE_KEY_CLIENT_TYPE, str);
        bundle.putParcelable(BUNDLE_KEY_CLIENT_MESSENGER, messenger);
        Message obtainMessage = this.mIncomingHandler.obtainMessage(9);
        obtainMessage.setData(bundle);
        this.mIncomingHandler.sendMessage(obtainMessage);
    }
}
