package android.support.test.runner;

import android.app.Activity;
import android.app.Application;
import android.app.Fragment;
import android.app.Instrumentation.ActivityResult;
import android.content.ComponentName;
import android.content.Context;
import android.content.Intent;
import android.content.pm.ActivityInfo;
import android.os.Build;
import android.os.Bundle;
import android.os.Handler;
import android.os.IBinder;
import android.os.Looper;
import android.os.MessageQueue.IdleHandler;
import android.os.UserHandle;
import android.support.annotation.Nullable;
import android.support.test.InstrumentationRegistry;
import android.support.test.internal.runner.InstrumentationConnection;
import android.support.test.internal.runner.hidden.ExposedInstrumentationApi;
import android.support.test.internal.runner.intent.IntentMonitorImpl;
import android.support.test.internal.runner.intercepting.DefaultInterceptingActivityFactory;
import android.support.test.internal.runner.lifecycle.ActivityLifecycleMonitorImpl;
import android.support.test.internal.runner.lifecycle.ApplicationLifecycleMonitorImpl;
import android.support.test.internal.util.Checks;
import android.support.test.internal.util.ProcessUtil;
import android.support.test.runner.intent.IntentMonitorRegistry;
import android.support.test.runner.intent.IntentStubberRegistry;
import android.support.test.runner.intercepting.InterceptingActivityFactory;
import android.support.test.runner.lifecycle.ActivityLifecycleMonitorRegistry;
import android.support.test.runner.lifecycle.ApplicationLifecycleMonitorRegistry;
import android.support.test.runner.lifecycle.ApplicationStage;
import android.support.test.runner.lifecycle.Stage;
import android.util.Log;
import java.lang.Thread.UncaughtExceptionHandler;
import java.lang.reflect.InvocationTargetException;
import java.util.ArrayList;
import java.util.EnumSet;
import java.util.Iterator;
import java.util.List;
import java.util.Map.Entry;
import java.util.Set;
import java.util.concurrent.Callable;
import java.util.concurrent.ExecutionException;
import java.util.concurrent.ExecutorService;
import java.util.concurrent.Executors;
import java.util.concurrent.Future;
import java.util.concurrent.FutureTask;
import java.util.concurrent.SynchronousQueue;
import java.util.concurrent.ThreadFactory;
import java.util.concurrent.ThreadPoolExecutor;
import java.util.concurrent.TimeUnit;
import java.util.concurrent.TimeoutException;
import java.util.concurrent.atomic.AtomicBoolean;
import java.util.concurrent.atomic.AtomicInteger;
import java.util.concurrent.atomic.AtomicLong;

public class MonitoringInstrumentation extends ExposedInstrumentationApi {
    private static final long MILLIS_TO_POLL_FOR_ACTIVITY_STOP = (MILLIS_TO_WAIT_FOR_ACTIVITY_TO_STOP / 40);
    private static final long MILLIS_TO_WAIT_FOR_ACTIVITY_TO_STOP = TimeUnit.SECONDS.toMillis(2);
    private static final int START_ACTIVITY_TIMEOUT_SECONDS = 45;
    private static final String TAG = "MonitoringInstr";
    private AtomicBoolean mAnActivityHasBeenLaunched = new AtomicBoolean(false);
    private ApplicationLifecycleMonitorImpl mApplicationMonitor = new ApplicationLifecycleMonitorImpl();
    private ExecutorService mExecutorService;
    private volatile boolean mFinished = false;
    private Handler mHandlerForMainLooper;
    private IdleHandler mIdleHandler = new IdleHandler() {
        public boolean queueIdle() {
            MonitoringInstrumentation.this.mLastIdleTime.set(System.currentTimeMillis());
            return true;
        }
    };
    private IntentMonitorImpl mIntentMonitor = new IntentMonitorImpl();
    private volatile InterceptingActivityFactory mInterceptingActivityFactory;
    private ThreadLocal<Boolean> mIsDexmakerClassLoaderInitialized = new ThreadLocal();
    private AtomicBoolean mIsJsBridgeLoaded = new AtomicBoolean(false);
    private String mJsBridgeClassName;
    private AtomicLong mLastIdleTime = new AtomicLong(0);
    private ActivityLifecycleMonitorImpl mLifecycleMonitor = new ActivityLifecycleMonitorImpl();
    private AtomicInteger mStartedActivityCounter = new AtomicInteger(0);

    public class ActivityFinisher implements Runnable {
        public void run() {
            List<Activity> arrayList = new ArrayList();
            Iterator it = EnumSet.range(Stage.CREATED, Stage.STOPPED).iterator();
            while (it.hasNext()) {
                arrayList.addAll(MonitoringInstrumentation.this.mLifecycleMonitor.getActivitiesInStage((Stage) it.next()));
            }
            String str = MonitoringInstrumentation.TAG;
            int size = arrayList.size();
            StringBuilder stringBuilder = new StringBuilder(60);
            stringBuilder.append("Activities that are still in CREATED to STOPPED: ");
            stringBuilder.append(size);
            Log.i(str, stringBuilder.toString());
            for (Activity activity : arrayList) {
                if (!activity.isFinishing()) {
                    try {
                        String str2 = MonitoringInstrumentation.TAG;
                        String valueOf = String.valueOf(activity);
                        StringBuilder stringBuilder2 = new StringBuilder(20 + String.valueOf(valueOf).length());
                        stringBuilder2.append("Finishing activity: ");
                        stringBuilder2.append(valueOf);
                        Log.i(str2, stringBuilder2.toString());
                        activity.finish();
                    } catch (Throwable e) {
                        Log.e(MonitoringInstrumentation.TAG, "Failed to finish activity.", e);
                    }
                }
            }
        }
    }

    private static class StubResultCallable implements Callable<ActivityResult> {
        private final Intent mIntent;

        StubResultCallable(Intent intent) {
            this.mIntent = intent;
        }

        public ActivityResult call() {
            return IntentStubberRegistry.getInstance().getActivityResultForIntent(this.mIntent);
        }
    }

    public void onCreate(Bundle bundle) {
        String currentProcessName = ProcessUtil.getCurrentProcessName(getTargetContext());
        String str = TAG;
        String str2 = "Instrumentation started on process ";
        currentProcessName = String.valueOf(currentProcessName);
        Log.i(str, currentProcessName.length() != 0 ? str2.concat(currentProcessName) : new String(str2));
        logUncaughtExceptions();
        installMultidex();
        InstrumentationRegistry.registerInstance(this, bundle);
        ActivityLifecycleMonitorRegistry.registerInstance(this.mLifecycleMonitor);
        ApplicationLifecycleMonitorRegistry.registerInstance(this.mApplicationMonitor);
        IntentMonitorRegistry.registerInstance(this.mIntentMonitor);
        this.mHandlerForMainLooper = new Handler(Looper.getMainLooper());
        this.mExecutorService = new ThreadPoolExecutor(0, Integer.MAX_VALUE, 0, TimeUnit.SECONDS, new SynchronousQueue(), new ThreadFactory(this) {
            public Thread newThread(Runnable runnable) {
                Thread newThread = Executors.defaultThreadFactory().newThread(runnable);
                newThread.setName(MonitoringInstrumentation.class.getSimpleName());
                return newThread;
            }
        });
        Looper.myQueue().addIdleHandler(this.mIdleHandler);
        super.onCreate(bundle);
        specifyDexMakerCacheProperty();
        setupDexmakerClassloader();
        useDefaultInterceptingActivityFactory();
    }

    /* JADX WARNING: Removed duplicated region for block: B:17:0x0052 A:{ExcHandler: java.lang.ClassNotFoundException (e java.lang.ClassNotFoundException), Splitter: B:2:0x0006} */
    /* JADX WARNING: Removed duplicated region for block: B:12:0x0040 A:{ExcHandler: java.lang.reflect.InvocationTargetException (r0_4 'e' java.lang.Throwable), Splitter: B:2:0x0006} */
    /* JADX WARNING: Removed duplicated region for block: B:9:0x0037 A:{ExcHandler: java.lang.IllegalAccessException (r0_3 'e' java.lang.Throwable), Splitter: B:2:0x0006} */
    /* JADX WARNING: Failed to process nested try/catch */
    /* JADX WARNING: Missing block: B:9:0x0037, code:
            r0 = move-exception;
     */
    /* JADX WARNING: Missing block: B:11:0x003f, code:
            throw new java.lang.RuntimeException("multidex is available at runtime, but calling it failed.", r0);
     */
    /* JADX WARNING: Missing block: B:12:0x0040, code:
            r0 = move-exception;
     */
    /* JADX WARNING: Missing block: B:14:0x0048, code:
            throw new java.lang.RuntimeException("multidex is available at runtime, but calling it failed.", r0);
     */
    /* JADX WARNING: Missing block: B:15:0x0049, code:
            r0 = move-exception;
     */
    /* JADX WARNING: Missing block: B:16:0x004a, code:
            android.util.Log.i(TAG, "No multidex.", r0);
     */
    /* JADX WARNING: Missing block: B:18:0x0053, code:
            android.util.Log.i(TAG, "No multidex.");
     */
    /* JADX WARNING: Missing block: B:20:?, code:
            return;
     */
    /* JADX WARNING: Missing block: B:21:?, code:
            return;
     */
    protected void installMultidex() {
        /*
        r7 = this;
        r0 = android.os.Build.VERSION.SDK_INT;
        r1 = 21;
        if (r0 >= r1) goto L_0x005b;
    L_0x0006:
        r0 = "android.support.multidex.MultiDex";
        r0 = java.lang.Class.forName(r0);	 Catch:{ ClassNotFoundException -> 0x0052, NoSuchMethodException -> 0x0049, InvocationTargetException -> 0x0040, IllegalAccessException -> 0x0037 }
        r1 = "installInstrumentation";
        r2 = 2;
        r3 = new java.lang.Class[r2];	 Catch:{ NoSuchMethodException -> 0x0032, ClassNotFoundException -> 0x0052, InvocationTargetException -> 0x0040, IllegalAccessException -> 0x0037 }
        r4 = android.content.Context.class;
        r5 = 0;
        r3[r5] = r4;	 Catch:{ NoSuchMethodException -> 0x0032, ClassNotFoundException -> 0x0052, InvocationTargetException -> 0x0040, IllegalAccessException -> 0x0037 }
        r4 = android.content.Context.class;
        r6 = 1;
        r3[r6] = r4;	 Catch:{ NoSuchMethodException -> 0x0032, ClassNotFoundException -> 0x0052, InvocationTargetException -> 0x0040, IllegalAccessException -> 0x0037 }
        r1 = r0.getDeclaredMethod(r1, r3);	 Catch:{ NoSuchMethodException -> 0x0032, ClassNotFoundException -> 0x0052, InvocationTargetException -> 0x0040, IllegalAccessException -> 0x0037 }
        r3 = 0;
        r2 = new java.lang.Object[r2];	 Catch:{ NoSuchMethodException -> 0x0032, ClassNotFoundException -> 0x0052, InvocationTargetException -> 0x0040, IllegalAccessException -> 0x0037 }
        r4 = r7.getContext();	 Catch:{ NoSuchMethodException -> 0x0032, ClassNotFoundException -> 0x0052, InvocationTargetException -> 0x0040, IllegalAccessException -> 0x0037 }
        r2[r5] = r4;	 Catch:{ NoSuchMethodException -> 0x0032, ClassNotFoundException -> 0x0052, InvocationTargetException -> 0x0040, IllegalAccessException -> 0x0037 }
        r4 = r7.getTargetContext();	 Catch:{ NoSuchMethodException -> 0x0032, ClassNotFoundException -> 0x0052, InvocationTargetException -> 0x0040, IllegalAccessException -> 0x0037 }
        r2[r6] = r4;	 Catch:{ NoSuchMethodException -> 0x0032, ClassNotFoundException -> 0x0052, InvocationTargetException -> 0x0040, IllegalAccessException -> 0x0037 }
        r1.invoke(r3, r2);	 Catch:{ NoSuchMethodException -> 0x0032, ClassNotFoundException -> 0x0052, InvocationTargetException -> 0x0040, IllegalAccessException -> 0x0037 }
        goto L_0x005a;
    L_0x0032:
        r1 = move-exception;
        r7.installOldMultiDex(r0);	 Catch:{ ClassNotFoundException -> 0x0052, NoSuchMethodException -> 0x0049, InvocationTargetException -> 0x0040, IllegalAccessException -> 0x0037 }
        goto L_0x005a;
    L_0x0037:
        r0 = move-exception;
        r1 = new java.lang.RuntimeException;
        r2 = "multidex is available at runtime, but calling it failed.";
        r1.<init>(r2, r0);
        throw r1;
    L_0x0040:
        r0 = move-exception;
        r1 = new java.lang.RuntimeException;
        r2 = "multidex is available at runtime, but calling it failed.";
        r1.<init>(r2, r0);
        throw r1;
    L_0x0049:
        r0 = move-exception;
        r1 = "MonitoringInstr";
        r2 = "No multidex.";
        android.util.Log.i(r1, r2, r0);
        goto L_0x005a;
    L_0x0052:
        r0 = move-exception;
        r0 = "MonitoringInstr";
        r1 = "No multidex.";
        android.util.Log.i(r0, r1);
    L_0x005b:
        return;
        */
        throw new UnsupportedOperationException("Method not decompiled: android.support.test.runner.MonitoringInstrumentation.installMultidex():void");
    }

    protected void installOldMultiDex(Class<?> cls) throws NoSuchMethodException, InvocationTargetException, IllegalAccessException {
        cls.getDeclaredMethod("install", new Class[]{Context.class}).invoke(null, new Object[]{getTargetContext()});
    }

    protected void specifyDexMakerCacheProperty() {
        System.getProperties().put("dexmaker.dexcache", getTargetContext().getDir("dxmaker_cache", 0).getAbsolutePath());
    }

    protected final void setJsBridgeClassName(String str) {
        if (str == null) {
            throw new NullPointerException("JsBridge class name cannot be null!");
        } else if (this.mIsJsBridgeLoaded.get()) {
            throw new IllegalStateException("JsBridge is already loaded!");
        } else {
            this.mJsBridgeClassName = str;
        }
    }

    private void setupDexmakerClassloader() {
        if (!Boolean.TRUE.equals(this.mIsDexmakerClassLoaderInitialized.get())) {
            ClassLoader contextClassLoader = Thread.currentThread().getContextClassLoader();
            ClassLoader classLoader = getTargetContext().getClassLoader();
            Log.i(TAG, String.format("Setting context classloader to '%s', Original: '%s'", new Object[]{classLoader.toString(), contextClassLoader.toString()}));
            Thread.currentThread().setContextClassLoader(classLoader);
            this.mIsDexmakerClassLoaderInitialized.set(Boolean.TRUE);
        }
    }

    private void logUncaughtExceptions() {
        final UncaughtExceptionHandler uncaughtExceptionHandler = Thread.currentThread().getUncaughtExceptionHandler();
        Thread.currentThread().setUncaughtExceptionHandler(new UncaughtExceptionHandler() {
            public void uncaughtException(Thread thread, Throwable th) {
                MonitoringInstrumentation.this.onException(thread, th);
                if (uncaughtExceptionHandler != null) {
                    Log.w(MonitoringInstrumentation.TAG, String.format("Invoking uncaught exception handler %s (a %s)", new Object[]{uncaughtExceptionHandler, uncaughtExceptionHandler.getClass()}));
                    uncaughtExceptionHandler.uncaughtException(thread, th);
                } else {
                    String str = MonitoringInstrumentation.TAG;
                    String str2 = "Invoking uncaught exception handler for thread: ";
                    String valueOf = String.valueOf(thread.getName());
                    Log.w(str, valueOf.length() != 0 ? str2.concat(valueOf) : new String(str2));
                    thread.getThreadGroup().uncaughtException(thread, th);
                }
                if (!"robolectric".equals(Build.FINGERPRINT) && Looper.getMainLooper().getThread().equals(thread)) {
                    Log.e(MonitoringInstrumentation.TAG, "The main thread has died and the handlers didn't care, exiting");
                    System.exit(-10);
                }
            }
        });
    }

    public void onStart() {
        super.onStart();
        if (this.mJsBridgeClassName != null) {
            tryLoadingJsBridge(this.mJsBridgeClassName);
        }
        waitForIdleSync();
        setupDexmakerClassloader();
        InstrumentationConnection.getInstance().init(this, new ActivityFinisher());
    }

    public void finish(int i, Bundle bundle) {
        if (this.mFinished) {
            Log.w(TAG, "finish called 2x!");
            return;
        }
        this.mFinished = true;
        this.mHandlerForMainLooper.post(new ActivityFinisher());
        long currentTimeMillis = System.currentTimeMillis();
        waitForActivitiesToComplete();
        long currentTimeMillis2 = System.currentTimeMillis();
        Log.i(TAG, String.format("waitForActivitiesToComplete() took: %sms", new Object[]{Long.valueOf(currentTimeMillis2 - currentTimeMillis)}));
        ActivityLifecycleMonitorRegistry.registerInstance(null);
        super.finish(i, bundle);
    }

    protected void waitForActivitiesToComplete() {
        if (Looper.getMainLooper() != Looper.myLooper()) {
            long currentTimeMillis = System.currentTimeMillis() + MILLIS_TO_WAIT_FOR_ACTIVITY_TO_STOP;
            int i = this.mStartedActivityCounter.get();
            while (i > 0 && System.currentTimeMillis() < currentTimeMillis) {
                try {
                    String str = TAG;
                    StringBuilder stringBuilder = new StringBuilder(37);
                    stringBuilder.append("Unstopped activity count: ");
                    stringBuilder.append(i);
                    Log.i(str, stringBuilder.toString());
                    Thread.sleep(MILLIS_TO_POLL_FOR_ACTIVITY_STOP);
                    i = this.mStartedActivityCounter.get();
                } catch (Throwable e) {
                    Log.i(TAG, "Abandoning activity wait due to interruption.", e);
                }
            }
            if (i > 0) {
                dumpThreadStateToOutputs("ThreadState-unstopped.txt");
                Log.w(TAG, String.format("Still %s activities active after waiting %s ms.", new Object[]{Integer.valueOf(i), Long.valueOf(MILLIS_TO_WAIT_FOR_ACTIVITY_TO_STOP)}));
                return;
            }
            return;
        }
        throw new IllegalStateException("Cannot be called from main thread!");
    }

    public void onDestroy() {
        Log.i(TAG, "Instrumentation Finished!");
        Looper.myQueue().removeIdleHandler(this.mIdleHandler);
        InstrumentationConnection.getInstance().terminate();
        super.onDestroy();
    }

    public void callApplicationOnCreate(Application application) {
        this.mApplicationMonitor.signalLifecycleChange(application, ApplicationStage.PRE_ON_CREATE);
        super.callApplicationOnCreate(application);
        this.mApplicationMonitor.signalLifecycleChange(application, ApplicationStage.CREATED);
    }

    public Activity startActivitySync(final Intent intent) {
        Checks.checkNotMainThread();
        long j = this.mLastIdleTime.get();
        if (this.mAnActivityHasBeenLaunched.compareAndSet(false, true)) {
            intent.addFlags(67108864);
        }
        Future submit = this.mExecutorService.submit(new Callable<Activity>() {
            public Activity call() {
                return super.startActivitySync(intent);
            }
        });
        try {
            return (Activity) submit.get(45, TimeUnit.SECONDS);
        } catch (TimeoutException e) {
            dumpThreadStateToOutputs("ThreadState-startActivityTimeout.txt");
            submit.cancel(true);
            throw new RuntimeException(String.format("Could not launch intent %s within %s seconds. Perhaps the main thread has not gone idle within a reasonable amount of time? There could be an animation or something constantly repainting the screen. Or the activity is doing network calls on creation? See the threaddump logs. For your reference the last time the event queue was idle before your activity launch request was %s and now the last time the queue went idle was: %s. If these numbers are the same your activity might be hogging the event queue.", new Object[]{intent, Integer.valueOf(45), Long.valueOf(j), Long.valueOf(this.mLastIdleTime.get())}));
        } catch (ExecutionException e2) {
            throw new RuntimeException("Could not launch activity", e2.getCause());
        } catch (Throwable e3) {
            Thread.currentThread().interrupt();
            throw new RuntimeException("interrupted", e3);
        }
    }

    public ActivityResult execStartActivity(Context context, IBinder iBinder, IBinder iBinder2, Activity activity, Intent intent, int i) {
        this.mIntentMonitor.signalIntent(intent);
        ActivityResult stubResultFor = stubResultFor(intent);
        if (stubResultFor == null) {
            return super.execStartActivity(context, iBinder, iBinder2, activity, intent, i);
        }
        Log.i(TAG, String.format("Stubbing intent %s", new Object[]{intent}));
        return stubResultFor;
    }

    public ActivityResult execStartActivity(Context context, IBinder iBinder, IBinder iBinder2, Activity activity, Intent intent, int i, Bundle bundle) {
        this.mIntentMonitor.signalIntent(intent);
        ActivityResult stubResultFor = stubResultFor(intent);
        if (stubResultFor == null) {
            return super.execStartActivity(context, iBinder, iBinder2, activity, intent, i, bundle);
        }
        Log.i(TAG, String.format("Stubbing intent %s", new Object[]{intent}));
        return stubResultFor;
    }

    public ActivityResult execStartActivity(Context context, IBinder iBinder, IBinder iBinder2, String str, Intent intent, int i, Bundle bundle) {
        this.mIntentMonitor.signalIntent(intent);
        ActivityResult stubResultFor = stubResultFor(intent);
        if (stubResultFor == null) {
            return super.execStartActivity(context, iBinder, iBinder2, str, intent, i, bundle);
        }
        Log.i(TAG, String.format("Stubbing intent %s", new Object[]{intent}));
        return stubResultFor;
    }

    public ActivityResult execStartActivity(Context context, IBinder iBinder, IBinder iBinder2, Activity activity, Intent intent, int i, Bundle bundle, UserHandle userHandle) {
        return super.execStartActivity(context, iBinder, iBinder2, activity, intent, i, bundle, userHandle);
    }

    public void execStartActivities(Context context, IBinder iBinder, IBinder iBinder2, Activity activity, Intent[] intentArr, Bundle bundle) {
        Intent[] intentArr2 = intentArr;
        Log.d(TAG, "execStartActivities(context, ibinder, ibinder, activity, intent[], bundle)");
        for (Intent execStartActivity : intentArr2) {
            execStartActivity(context, iBinder, iBinder2, activity, execStartActivity, -1, bundle);
        }
    }

    public ActivityResult execStartActivity(Context context, IBinder iBinder, IBinder iBinder2, Fragment fragment, Intent intent, int i, Bundle bundle) {
        Log.d(TAG, "execStartActivity(context, IBinder, IBinder, Fragment, Intent, int, Bundle)");
        this.mIntentMonitor.signalIntent(intent);
        ActivityResult stubResultFor = stubResultFor(intent);
        if (stubResultFor == null) {
            return super.execStartActivity(context, iBinder, iBinder2, fragment, intent, i, bundle);
        }
        Log.i(TAG, String.format("Stubbing intent %s", new Object[]{intent}));
        return stubResultFor;
    }

    private ActivityResult stubResultFor(Intent intent) {
        if (!IntentStubberRegistry.isLoaded()) {
            return null;
        }
        if (Looper.myLooper() == Looper.getMainLooper()) {
            return IntentStubberRegistry.getInstance().getActivityResultForIntent(intent);
        }
        Object futureTask = new FutureTask(new StubResultCallable(intent));
        runOnMainSync(futureTask);
        try {
            return (ActivityResult) futureTask.get();
        } catch (Throwable e) {
            throw new RuntimeException(String.format("Could not retrieve stub result for intent %s", new Object[]{intent}), e);
        } catch (Throwable e2) {
            Thread.currentThread().interrupt();
            throw new RuntimeException(e2);
        }
    }

    public boolean onException(Object obj, Throwable th) {
        Log.e(TAG, String.format("Exception encountered by: %s. Dumping thread state to outputs and pining for the fjords.", new Object[]{obj}), th);
        dumpThreadStateToOutputs("ThreadState-onException.txt");
        Log.e(TAG, "Dying now...");
        return super.onException(obj, th);
    }

    protected void dumpThreadStateToOutputs(String str) {
        Log.e("THREAD_STATE", getThreadState());
    }

    protected String getThreadState() {
        Set<Entry> entrySet = Thread.getAllStackTraces().entrySet();
        StringBuilder stringBuilder = new StringBuilder();
        for (Entry entry : entrySet) {
            StringBuilder stringBuilder2 = new StringBuilder("  ");
            stringBuilder2.append(entry.getKey());
            stringBuilder2.append("\n");
            for (StackTraceElement stackTraceElement : (StackTraceElement[]) entry.getValue()) {
                stringBuilder2.append("    ");
                stringBuilder2.append(stackTraceElement.toString());
                stringBuilder2.append("\n");
            }
            stringBuilder2.append("\n");
            stringBuilder.append(stringBuilder2.toString());
        }
        return stringBuilder.toString();
    }

    public void callActivityOnDestroy(Activity activity) {
        super.callActivityOnDestroy(activity);
        this.mLifecycleMonitor.signalLifecycleChange(Stage.DESTROYED, activity);
    }

    public void callActivityOnRestart(Activity activity) {
        super.callActivityOnRestart(activity);
        this.mLifecycleMonitor.signalLifecycleChange(Stage.RESTARTED, activity);
    }

    public void callActivityOnCreate(Activity activity, Bundle bundle) {
        this.mLifecycleMonitor.signalLifecycleChange(Stage.PRE_ON_CREATE, activity);
        super.callActivityOnCreate(activity, bundle);
        this.mLifecycleMonitor.signalLifecycleChange(Stage.CREATED, activity);
    }

    public void callActivityOnStart(Activity activity) {
        this.mStartedActivityCounter.incrementAndGet();
        try {
            super.callActivityOnStart(activity);
            this.mLifecycleMonitor.signalLifecycleChange(Stage.STARTED, activity);
        } catch (RuntimeException e) {
            this.mStartedActivityCounter.decrementAndGet();
            throw e;
        }
    }

    public void callActivityOnStop(Activity activity) {
        try {
            super.callActivityOnStop(activity);
            this.mLifecycleMonitor.signalLifecycleChange(Stage.STOPPED, activity);
        } finally {
            this.mStartedActivityCounter.decrementAndGet();
        }
    }

    public void callActivityOnResume(Activity activity) {
        super.callActivityOnResume(activity);
        this.mLifecycleMonitor.signalLifecycleChange(Stage.RESUMED, activity);
    }

    public void callActivityOnPause(Activity activity) {
        super.callActivityOnPause(activity);
        this.mLifecycleMonitor.signalLifecycleChange(Stage.PAUSED, activity);
    }

    public Activity newActivity(Class<?> cls, Context context, IBinder iBinder, Application application, Intent intent, ActivityInfo activityInfo, CharSequence charSequence, Activity activity, String str, Object obj) throws InstantiationException, IllegalAccessException {
        String name = cls.getPackage().getName();
        String packageName = context.getPackageName();
        ComponentName component = intent.getComponent();
        if (!packageName.equals(component.getPackageName()) && name.equals(component.getPackageName())) {
            intent.setComponent(new ComponentName(packageName, component.getClassName()));
        }
        return super.newActivity(cls, context, iBinder, application, intent, activityInfo, charSequence, activity, str, obj);
    }

    public Activity newActivity(ClassLoader classLoader, String str, Intent intent) throws InstantiationException, IllegalAccessException, ClassNotFoundException {
        if (this.mInterceptingActivityFactory.shouldIntercept(classLoader, str, intent)) {
            return this.mInterceptingActivityFactory.create(classLoader, str, intent);
        }
        return super.newActivity(classLoader, str, intent);
    }

    public void interceptActivityUsing(InterceptingActivityFactory interceptingActivityFactory) {
        Checks.checkNotNull(interceptingActivityFactory);
        this.mInterceptingActivityFactory = interceptingActivityFactory;
    }

    public void useDefaultInterceptingActivityFactory() {
        this.mInterceptingActivityFactory = new DefaultInterceptingActivityFactory();
    }

    private void tryLoadingJsBridge(final String str) {
        if (str != null) {
            runOnMainSync(new Runnable() {
                /* JADX WARNING: Removed duplicated region for block: B:5:0x0029 A:{ExcHandler: java.lang.ClassNotFoundException (e java.lang.ClassNotFoundException), Splitter: B:0:0x0000} */
                /* JADX WARNING: Removed duplicated region for block: B:2:0x0020 A:{ExcHandler: java.lang.reflect.InvocationTargetException (r0_5 'e' java.lang.Throwable), Splitter: B:0:0x0000} */
                /* JADX WARNING: Missing block: B:2:0x0020, code:
            r0 = move-exception;
     */
                /* JADX WARNING: Missing block: B:4:0x0028, code:
            throw new java.lang.RuntimeException("JSbridge is available at runtime, but calling it failed.", r0);
     */
                /* JADX WARNING: Missing block: B:6:0x002a, code:
            android.util.Log.i(android.support.test.runner.MonitoringInstrumentation.TAG, "No JSBridge.");
     */
                /* JADX WARNING: Missing block: B:7:?, code:
            return;
     */
                public void run() {
                    /*
                    r4 = this;
                    r0 = r2;	 Catch:{ ClassNotFoundException -> 0x0029, ClassNotFoundException -> 0x0029, InvocationTargetException -> 0x0020, InvocationTargetException -> 0x0020 }
                    r0 = java.lang.Class.forName(r0);	 Catch:{ ClassNotFoundException -> 0x0029, ClassNotFoundException -> 0x0029, InvocationTargetException -> 0x0020, InvocationTargetException -> 0x0020 }
                    r1 = "installBridge";
                    r2 = 0;
                    r3 = new java.lang.Class[r2];	 Catch:{ ClassNotFoundException -> 0x0029, ClassNotFoundException -> 0x0029, InvocationTargetException -> 0x0020, InvocationTargetException -> 0x0020 }
                    r0 = r0.getDeclaredMethod(r1, r3);	 Catch:{ ClassNotFoundException -> 0x0029, ClassNotFoundException -> 0x0029, InvocationTargetException -> 0x0020, InvocationTargetException -> 0x0020 }
                    r1 = 0;
                    r2 = new java.lang.Object[r2];	 Catch:{ ClassNotFoundException -> 0x0029, ClassNotFoundException -> 0x0029, InvocationTargetException -> 0x0020, InvocationTargetException -> 0x0020 }
                    r0.invoke(r1, r2);	 Catch:{ ClassNotFoundException -> 0x0029, ClassNotFoundException -> 0x0029, InvocationTargetException -> 0x0020, InvocationTargetException -> 0x0020 }
                    r0 = android.support.test.runner.MonitoringInstrumentation.this;	 Catch:{ ClassNotFoundException -> 0x0029, ClassNotFoundException -> 0x0029, InvocationTargetException -> 0x0020, InvocationTargetException -> 0x0020 }
                    r0 = r0.mIsJsBridgeLoaded;	 Catch:{ ClassNotFoundException -> 0x0029, ClassNotFoundException -> 0x0029, InvocationTargetException -> 0x0020, InvocationTargetException -> 0x0020 }
                    r1 = 1;
                    r0.set(r1);	 Catch:{ ClassNotFoundException -> 0x0029, ClassNotFoundException -> 0x0029, InvocationTargetException -> 0x0020, InvocationTargetException -> 0x0020 }
                    goto L_0x0031;
                L_0x0020:
                    r0 = move-exception;
                    r1 = new java.lang.RuntimeException;
                    r2 = "JSbridge is available at runtime, but calling it failed.";
                    r1.<init>(r2, r0);
                    throw r1;
                L_0x0029:
                    r0 = move-exception;
                    r0 = "MonitoringInstr";
                    r1 = "No JSBridge.";
                    android.util.Log.i(r0, r1);
                    return;
                    */
                    throw new UnsupportedOperationException("Method not decompiled: android.support.test.runner.MonitoringInstrumentation.5.run():void");
                }
            });
            return;
        }
        throw new NullPointerException("JsBridge class name cannot be null!");
    }

    protected boolean isPrimaryInstrProcess(@Nullable String str) {
        String currentProcessName = ProcessUtil.getCurrentProcessName(getTargetContext());
        if (str != null) {
            return str.equals(currentProcessName);
        }
        return currentProcessName.equals(getTargetContext().getApplicationInfo().processName);
    }
}
