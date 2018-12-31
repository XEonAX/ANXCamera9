.class public Landroid/support/test/internal/runner/InstrumentationConnection;
.super Ljava/lang/Object;
.source "InstrumentationConnection.java"


# annotations
.annotation build Landroid/support/test/annotation/Beta;
.end annotation

.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Landroid/support/test/internal/runner/InstrumentationConnection$IncomingHandler;,
        Landroid/support/test/internal/runner/InstrumentationConnection$MessengerReceiver;
    }
.end annotation


# static fields
.field public static final BROADCAST_FILTER:Ljava/lang/String; = "android.support.test.runner.InstrumentationConnection.event"

.field static final BUNDLE_BR_NEW_BINDER:Ljava/lang/String; = "new_instrumentation_binder"
    .annotation build Landroid/support/annotation/VisibleForTesting;
    .end annotation
.end field

.field private static final BUNDLE_KEY_CLIENTS:Ljava/lang/String; = "instr_clients"

.field private static final BUNDLE_KEY_CLIENT_MESSENGER:Ljava/lang/String; = "instr_client_msgr"

.field private static final BUNDLE_KEY_CLIENT_TYPE:Ljava/lang/String; = "instr_client_type"

.field private static final BUNDLE_KEY_UUID:Ljava/lang/String; = "instr_uuid"

.field private static final DEFAULT_INSTANCE:Landroid/support/test/internal/runner/InstrumentationConnection;

.field static final MSG_ADD_CLIENTS_IN_BUNDLE:I = 0x6
    .annotation build Landroid/support/annotation/VisibleForTesting;
    .end annotation
.end field

.field static final MSG_ADD_INSTRUMENTATION:I = 0x4
    .annotation build Landroid/support/annotation/VisibleForTesting;
    .end annotation
.end field

.field private static final MSG_HANDLE_INSTRUMENTATION_FROM_BROADCAST:I = 0x3

.field private static final MSG_PERFORM_CLEANUP:I = 0xb

.field private static final MSG_PERFORM_CLEANUP_FINISHED:I = 0xc

.field private static final MSG_REG_CLIENT:I = 0x8

.field private static final MSG_REMOTE_ADD_CLIENT:I = 0x0

.field static final MSG_REMOTE_CLEANUP_REQUEST:I = 0xa
    .annotation build Landroid/support/annotation/VisibleForTesting;
    .end annotation
.end field

.field private static final MSG_REMOTE_REMOVE_CLIENT:I = 0x1

.field private static final MSG_REMOVE_CLIENTS_IN_BUNDLE:I = 0x7

.field private static final MSG_REMOVE_INSTRUMENTATION:I = 0x5

.field private static final MSG_TERMINATE:I = 0x2

.field private static final MSG_UN_REG_CLIENT:I = 0x9

.field private static final TAG:Ljava/lang/String; = "InstrConnection"

.field private static mActivityFinisher:Landroid/support/test/runner/MonitoringInstrumentation$ActivityFinisher;

.field private static mInstrumentation:Landroid/app/Instrumentation;


# instance fields
.field mIncomingHandler:Landroid/support/test/internal/runner/InstrumentationConnection$IncomingHandler;

.field final mMessengerReceiver:Landroid/content/BroadcastReceiver;
    .annotation build Landroid/support/annotation/VisibleForTesting;
    .end annotation
.end field

.field private mTargetContext:Landroid/content/Context;


# direct methods
.method static constructor <clinit>()V
    .locals 2

    .line 80
    new-instance v0, Landroid/support/test/internal/runner/InstrumentationConnection;

    .line 81
    invoke-static {}, Landroid/support/test/InstrumentationRegistry;->getTargetContext()Landroid/content/Context;

    move-result-object v1

    invoke-direct {v0, v1}, Landroid/support/test/internal/runner/InstrumentationConnection;-><init>(Landroid/content/Context;)V

    sput-object v0, Landroid/support/test/internal/runner/InstrumentationConnection;->DEFAULT_INSTANCE:Landroid/support/test/internal/runner/InstrumentationConnection;

    .line 80
    return-void
.end method

.method constructor <init>(Landroid/content/Context;)V
    .locals 1
    .param p1    # Landroid/content/Context;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
    .annotation build Landroid/support/annotation/VisibleForTesting;
    .end annotation

    .line 122
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 119
    new-instance v0, Landroid/support/test/internal/runner/InstrumentationConnection$MessengerReceiver;

    invoke-direct {v0, p0}, Landroid/support/test/internal/runner/InstrumentationConnection$MessengerReceiver;-><init>(Landroid/support/test/internal/runner/InstrumentationConnection;)V

    iput-object v0, p0, Landroid/support/test/internal/runner/InstrumentationConnection;->mMessengerReceiver:Landroid/content/BroadcastReceiver;

    .line 123
    const-string v0, "Context can\'t be null"

    invoke-static {p1, v0}, Landroid/support/test/internal/util/Checks;->checkNotNull(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Landroid/content/Context;

    iput-object p1, p0, Landroid/support/test/internal/runner/InstrumentationConnection;->mTargetContext:Landroid/content/Context;

    .line 124
    return-void
.end method

.method static synthetic access$500()Landroid/support/test/runner/MonitoringInstrumentation$ActivityFinisher;
    .locals 1

    .line 77
    sget-object v0, Landroid/support/test/internal/runner/InstrumentationConnection;->mActivityFinisher:Landroid/support/test/runner/MonitoringInstrumentation$ActivityFinisher;

    return-object v0
.end method

.method static synthetic access$502(Landroid/support/test/runner/MonitoringInstrumentation$ActivityFinisher;)Landroid/support/test/runner/MonitoringInstrumentation$ActivityFinisher;
    .locals 0

    .line 77
    sput-object p0, Landroid/support/test/internal/runner/InstrumentationConnection;->mActivityFinisher:Landroid/support/test/runner/MonitoringInstrumentation$ActivityFinisher;

    return-object p0
.end method

.method static synthetic access$600()Landroid/app/Instrumentation;
    .locals 1

    .line 77
    sget-object v0, Landroid/support/test/internal/runner/InstrumentationConnection;->mInstrumentation:Landroid/app/Instrumentation;

    return-object v0
.end method

.method static synthetic access$602(Landroid/app/Instrumentation;)Landroid/app/Instrumentation;
    .locals 0

    .line 77
    sput-object p0, Landroid/support/test/internal/runner/InstrumentationConnection;->mInstrumentation:Landroid/app/Instrumentation;

    return-object p0
.end method

.method public static getInstance()Landroid/support/test/internal/runner/InstrumentationConnection;
    .locals 1

    .line 132
    sget-object v0, Landroid/support/test/internal/runner/InstrumentationConnection;->DEFAULT_INSTANCE:Landroid/support/test/internal/runner/InstrumentationConnection;

    return-object v0
.end method


# virtual methods
.method public declared-synchronized getClientsForType(Ljava/lang/String;)Ljava/util/Set;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            ")",
            "Ljava/util/Set<",
            "Landroid/os/Messenger;",
            ">;"
        }
    .end annotation

    monitor-enter p0

    .line 256
    :try_start_0
    iget-object v0, p0, Landroid/support/test/internal/runner/InstrumentationConnection;->mIncomingHandler:Landroid/support/test/internal/runner/InstrumentationConnection$IncomingHandler;

    invoke-static {v0, p1}, Landroid/support/test/internal/runner/InstrumentationConnection$IncomingHandler;->access$400(Landroid/support/test/internal/runner/InstrumentationConnection$IncomingHandler;Ljava/lang/String;)Ljava/util/Set;

    move-result-object p1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    monitor-exit p0

    return-object p1

    :catchall_0
    move-exception p1

    monitor-exit p0

    throw p1
.end method

.method public declared-synchronized init(Landroid/app/Instrumentation;Landroid/support/test/runner/MonitoringInstrumentation$ActivityFinisher;)V
    .locals 3

    monitor-enter p0

    .line 153
    :try_start_0
    const-string v0, "InstrConnection"

    const-string v1, "init"

    const/4 v2, 0x0

    new-array v2, v2, [Ljava/lang/Object;

    invoke-static {v0, v1, v2}, Landroid/support/test/internal/util/LogUtil;->logDebugWithProcess(Ljava/lang/String;Ljava/lang/String;[Ljava/lang/Object;)V

    .line 155
    iget-object v0, p0, Landroid/support/test/internal/runner/InstrumentationConnection;->mIncomingHandler:Landroid/support/test/internal/runner/InstrumentationConnection$IncomingHandler;

    if-nez v0, :cond_0

    .line 156
    sput-object p1, Landroid/support/test/internal/runner/InstrumentationConnection;->mInstrumentation:Landroid/app/Instrumentation;

    .line 157
    sput-object p2, Landroid/support/test/internal/runner/InstrumentationConnection;->mActivityFinisher:Landroid/support/test/runner/MonitoringInstrumentation$ActivityFinisher;

    .line 158
    new-instance p1, Landroid/os/HandlerThread;

    const-string p2, "InstrumentationConnectionThread"

    invoke-direct {p1, p2}, Landroid/os/HandlerThread;-><init>(Ljava/lang/String;)V

    .line 159
    invoke-virtual {p1}, Landroid/os/HandlerThread;->start()V

    .line 160
    new-instance p2, Landroid/support/test/internal/runner/InstrumentationConnection$IncomingHandler;

    invoke-virtual {p1}, Landroid/os/HandlerThread;->getLooper()Landroid/os/Looper;

    move-result-object p1

    invoke-direct {p2, p1}, Landroid/support/test/internal/runner/InstrumentationConnection$IncomingHandler;-><init>(Landroid/os/Looper;)V

    iput-object p2, p0, Landroid/support/test/internal/runner/InstrumentationConnection;->mIncomingHandler:Landroid/support/test/internal/runner/InstrumentationConnection$IncomingHandler;

    .line 163
    new-instance p1, Landroid/content/Intent;

    const-string p2, "android.support.test.runner.InstrumentationConnection.event"

    invoke-direct {p1, p2}, Landroid/content/Intent;-><init>(Ljava/lang/String;)V

    .line 164
    new-instance p2, Landroid/os/Bundle;

    invoke-direct {p2}, Landroid/os/Bundle;-><init>()V

    .line 165
    const-string v0, "new_instrumentation_binder"

    new-instance v1, Landroid/support/test/internal/util/ParcelableIBinder;

    iget-object v2, p0, Landroid/support/test/internal/runner/InstrumentationConnection;->mIncomingHandler:Landroid/support/test/internal/runner/InstrumentationConnection$IncomingHandler;

    iget-object v2, v2, Landroid/support/test/internal/runner/InstrumentationConnection$IncomingHandler;->mMessengerHandler:Landroid/os/Messenger;

    .line 167
    invoke-virtual {v2}, Landroid/os/Messenger;->getBinder()Landroid/os/IBinder;

    move-result-object v2

    invoke-direct {v1, v2}, Landroid/support/test/internal/util/ParcelableIBinder;-><init>(Landroid/os/IBinder;)V

    .line 165
    invoke-virtual {p2, v0, v1}, Landroid/os/Bundle;->putParcelable(Ljava/lang/String;Landroid/os/Parcelable;)V

    .line 168
    const-string v0, "new_instrumentation_binder"

    invoke-virtual {p1, v0, p2}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Landroid/os/Bundle;)Landroid/content/Intent;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 170
    :try_start_1
    iget-object p2, p0, Landroid/support/test/internal/runner/InstrumentationConnection;->mTargetContext:Landroid/content/Context;

    invoke-virtual {p2, p1}, Landroid/content/Context;->sendBroadcast(Landroid/content/Intent;)V

    .line 172
    iget-object p1, p0, Landroid/support/test/internal/runner/InstrumentationConnection;->mTargetContext:Landroid/content/Context;

    iget-object p2, p0, Landroid/support/test/internal/runner/InstrumentationConnection;->mMessengerReceiver:Landroid/content/BroadcastReceiver;

    new-instance v0, Landroid/content/IntentFilter;

    const-string v1, "android.support.test.runner.InstrumentationConnection.event"

    invoke-direct {v0, v1}, Landroid/content/IntentFilter;-><init>(Ljava/lang/String;)V

    invoke-virtual {p1, p2, v0}, Landroid/content/Context;->registerReceiver(Landroid/content/BroadcastReceiver;Landroid/content/IntentFilter;)Landroid/content/Intent;
    :try_end_1
    .catch Ljava/lang/SecurityException; {:try_start_1 .. :try_end_1} :catch_0
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 175
    goto :goto_0

    .line 173
    :catch_0
    move-exception p1

    .line 174
    :try_start_2
    const-string p1, "InstrConnection"

    const-string p2, "Could not send broadcast or register receiver (isolatedProcess?)"

    invoke-static {p1, p2}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    .line 177
    :cond_0
    :goto_0
    monitor-exit p0

    return-void

    .line 152
    :catchall_0
    move-exception p1

    monitor-exit p0

    throw p1
.end method

.method public declared-synchronized registerClient(Ljava/lang/String;Landroid/os/Messenger;)V
    .locals 4

    monitor-enter p0

    .line 238
    :try_start_0
    iget-object v0, p0, Landroid/support/test/internal/runner/InstrumentationConnection;->mIncomingHandler:Landroid/support/test/internal/runner/InstrumentationConnection$IncomingHandler;

    if-eqz v0, :cond_0

    const/4 v0, 0x1

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    :goto_0
    const-string v1, "Instrumentation Connection in not yet initialized"

    invoke-static {v0, v1}, Landroid/support/test/internal/util/Checks;->checkState(ZLjava/lang/Object;)V

    .line 239
    const-string v0, "InstrConnection"

    const-string v1, "Register client of type: "

    invoke-static {p1}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/String;->length()I

    move-result v3

    if-eqz v3, :cond_1

    invoke-virtual {v1, v2}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    goto :goto_1

    :cond_1
    new-instance v2, Ljava/lang/String;

    invoke-direct {v2, v1}, Ljava/lang/String;-><init>(Ljava/lang/String;)V

    move-object v1, v2

    :goto_1
    invoke-static {v0, v1}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 240
    new-instance v0, Landroid/os/Bundle;

    invoke-direct {v0}, Landroid/os/Bundle;-><init>()V

    .line 241
    const-string v1, "instr_client_type"

    invoke-virtual {v0, v1, p1}, Landroid/os/Bundle;->putString(Ljava/lang/String;Ljava/lang/String;)V

    .line 242
    const-string p1, "instr_client_msgr"

    invoke-virtual {v0, p1, p2}, Landroid/os/Bundle;->putParcelable(Ljava/lang/String;Landroid/os/Parcelable;)V

    .line 243
    iget-object p1, p0, Landroid/support/test/internal/runner/InstrumentationConnection;->mIncomingHandler:Landroid/support/test/internal/runner/InstrumentationConnection$IncomingHandler;

    const/16 p2, 0x8

    invoke-virtual {p1, p2}, Landroid/support/test/internal/runner/InstrumentationConnection$IncomingHandler;->obtainMessage(I)Landroid/os/Message;

    move-result-object p1

    .line 244
    invoke-virtual {p1, v0}, Landroid/os/Message;->setData(Landroid/os/Bundle;)V

    .line 245
    iget-object p2, p0, Landroid/support/test/internal/runner/InstrumentationConnection;->mIncomingHandler:Landroid/support/test/internal/runner/InstrumentationConnection$IncomingHandler;

    invoke-virtual {p2, p1}, Landroid/support/test/internal/runner/InstrumentationConnection$IncomingHandler;->sendMessage(Landroid/os/Message;)Z
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 246
    monitor-exit p0

    return-void

    .line 237
    :catchall_0
    move-exception p1

    monitor-exit p0

    throw p1
.end method

.method public declared-synchronized requestRemoteInstancesActivityCleanup()V
    .locals 6

    monitor-enter p0

    .line 206
    :try_start_0
    iget-object v0, p0, Landroid/support/test/internal/runner/InstrumentationConnection;->mIncomingHandler:Landroid/support/test/internal/runner/InstrumentationConnection$IncomingHandler;

    const/4 v1, 0x1

    if-eqz v0, :cond_0

    move v0, v1

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    :goto_0
    const-string v2, "Instrumentation Connection in not yet initialized"

    invoke-static {v0, v2}, Landroid/support/test/internal/util/Checks;->checkState(ZLjava/lang/Object;)V

    .line 208
    invoke-static {}, Ljava/util/UUID;->randomUUID()Ljava/util/UUID;

    move-result-object v0

    .line 209
    new-instance v2, Ljava/util/concurrent/CountDownLatch;

    invoke-direct {v2, v1}, Ljava/util/concurrent/CountDownLatch;-><init>(I)V

    .line 210
    iget-object v1, p0, Landroid/support/test/internal/runner/InstrumentationConnection;->mIncomingHandler:Landroid/support/test/internal/runner/InstrumentationConnection$IncomingHandler;

    invoke-static {v1, v0, v2}, Landroid/support/test/internal/runner/InstrumentationConnection$IncomingHandler;->access$200(Landroid/support/test/internal/runner/InstrumentationConnection$IncomingHandler;Ljava/util/UUID;Ljava/util/concurrent/CountDownLatch;)V

    .line 212
    iget-object v1, p0, Landroid/support/test/internal/runner/InstrumentationConnection;->mIncomingHandler:Landroid/support/test/internal/runner/InstrumentationConnection$IncomingHandler;

    const/16 v3, 0xa

    invoke-virtual {v1, v3}, Landroid/support/test/internal/runner/InstrumentationConnection$IncomingHandler;->obtainMessage(I)Landroid/os/Message;

    move-result-object v1

    .line 213
    iget-object v3, p0, Landroid/support/test/internal/runner/InstrumentationConnection;->mIncomingHandler:Landroid/support/test/internal/runner/InstrumentationConnection$IncomingHandler;

    iget-object v3, v3, Landroid/support/test/internal/runner/InstrumentationConnection$IncomingHandler;->mMessengerHandler:Landroid/os/Messenger;

    iput-object v3, v1, Landroid/os/Message;->replyTo:Landroid/os/Messenger;

    .line 214
    invoke-virtual {v1}, Landroid/os/Message;->getData()Landroid/os/Bundle;

    move-result-object v3

    .line 215
    const-string v4, "instr_uuid"

    invoke-virtual {v3, v4, v0}, Landroid/os/Bundle;->putSerializable(Ljava/lang/String;Ljava/io/Serializable;)V

    .line 216
    invoke-virtual {v1, v3}, Landroid/os/Message;->setData(Landroid/os/Bundle;)V

    .line 217
    iget-object v3, p0, Landroid/support/test/internal/runner/InstrumentationConnection;->mIncomingHandler:Landroid/support/test/internal/runner/InstrumentationConnection$IncomingHandler;

    invoke-virtual {v3, v1}, Landroid/support/test/internal/runner/InstrumentationConnection$IncomingHandler;->sendMessage(Landroid/os/Message;)Z
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_1

    .line 221
    const-wide/16 v3, 0x2

    :try_start_1
    sget-object v1, Ljava/util/concurrent/TimeUnit;->SECONDS:Ljava/util/concurrent/TimeUnit;

    invoke-virtual {v2, v3, v4, v1}, Ljava/util/concurrent/CountDownLatch;->await(JLjava/util/concurrent/TimeUnit;)Z

    move-result v1

    if-nez v1, :cond_1

    .line 222
    const-string v1, "InstrConnection"

    invoke-static {v0}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v2

    const/16 v3, 0x3c

    invoke-static {v2}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/String;->length()I

    move-result v4

    add-int/2addr v3, v4

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4, v3}, Ljava/lang/StringBuilder;-><init>(I)V

    const-string v3, "Timed out while attempting to perform activity clean up for "

    invoke-virtual {v4, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v4, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v1, v2}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I
    :try_end_1
    .catch Ljava/lang/InterruptedException; {:try_start_1 .. :try_end_1} :catch_0
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 227
    :cond_1
    :try_start_2
    iget-object v1, p0, Landroid/support/test/internal/runner/InstrumentationConnection;->mIncomingHandler:Landroid/support/test/internal/runner/InstrumentationConnection$IncomingHandler;

    :goto_1
    invoke-static {v1, v0}, Landroid/support/test/internal/runner/InstrumentationConnection$IncomingHandler;->access$300(Landroid/support/test/internal/runner/InstrumentationConnection$IncomingHandler;Ljava/util/UUID;)V
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_1

    .line 228
    goto :goto_2

    .line 227
    :catchall_0
    move-exception v1

    goto :goto_3

    .line 224
    :catch_0
    move-exception v1

    .line 225
    :try_start_3
    const-string v2, "InstrConnection"

    invoke-static {v0}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v3

    const/16 v4, 0x3d

    invoke-static {v3}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/String;->length()I

    move-result v5

    add-int/2addr v4, v5

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5, v4}, Ljava/lang/StringBuilder;-><init>(I)V

    const-string v4, "Interrupted while waiting for response from message with id: "

    invoke-virtual {v5, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v5, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-static {v2, v3, v1}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_0

    .line 227
    :try_start_4
    iget-object v1, p0, Landroid/support/test/internal/runner/InstrumentationConnection;->mIncomingHandler:Landroid/support/test/internal/runner/InstrumentationConnection$IncomingHandler;
    :try_end_4
    .catchall {:try_start_4 .. :try_end_4} :catchall_1

    goto :goto_1

    .line 229
    :goto_2
    monitor-exit p0

    return-void

    .line 227
    :goto_3
    :try_start_5
    iget-object v2, p0, Landroid/support/test/internal/runner/InstrumentationConnection;->mIncomingHandler:Landroid/support/test/internal/runner/InstrumentationConnection$IncomingHandler;

    invoke-static {v2, v0}, Landroid/support/test/internal/runner/InstrumentationConnection$IncomingHandler;->access$300(Landroid/support/test/internal/runner/InstrumentationConnection$IncomingHandler;Ljava/util/UUID;)V

    throw v1
    :try_end_5
    .catchall {:try_start_5 .. :try_end_5} :catchall_1

    .line 205
    :catchall_1
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method public declared-synchronized terminate()V
    .locals 3

    monitor-enter p0

    .line 185
    :try_start_0
    const-string v0, "InstrConnection"

    const-string v1, "Terminate is called"

    const/4 v2, 0x0

    new-array v2, v2, [Ljava/lang/Object;

    invoke-static {v0, v1, v2}, Landroid/support/test/internal/util/LogUtil;->logDebugWithProcess(Ljava/lang/String;Ljava/lang/String;[Ljava/lang/Object;)V

    .line 186
    iget-object v0, p0, Landroid/support/test/internal/runner/InstrumentationConnection;->mIncomingHandler:Landroid/support/test/internal/runner/InstrumentationConnection$IncomingHandler;

    if-eqz v0, :cond_0

    .line 188
    iget-object v0, p0, Landroid/support/test/internal/runner/InstrumentationConnection;->mIncomingHandler:Landroid/support/test/internal/runner/InstrumentationConnection$IncomingHandler;

    new-instance v1, Landroid/support/test/internal/runner/InstrumentationConnection$1;

    invoke-direct {v1, p0}, Landroid/support/test/internal/runner/InstrumentationConnection$1;-><init>(Landroid/support/test/internal/runner/InstrumentationConnection;)V

    invoke-static {v0, v1}, Landroid/support/test/internal/runner/InstrumentationConnection$IncomingHandler;->access$100(Landroid/support/test/internal/runner/InstrumentationConnection$IncomingHandler;Ljava/util/concurrent/Callable;)Ljava/lang/Object;

    .line 196
    iget-object v0, p0, Landroid/support/test/internal/runner/InstrumentationConnection;->mTargetContext:Landroid/content/Context;

    iget-object v1, p0, Landroid/support/test/internal/runner/InstrumentationConnection;->mMessengerReceiver:Landroid/content/BroadcastReceiver;

    invoke-virtual {v0, v1}, Landroid/content/Context;->unregisterReceiver(Landroid/content/BroadcastReceiver;)V

    .line 197
    const/4 v0, 0x0

    iput-object v0, p0, Landroid/support/test/internal/runner/InstrumentationConnection;->mIncomingHandler:Landroid/support/test/internal/runner/InstrumentationConnection$IncomingHandler;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 199
    :cond_0
    monitor-exit p0

    return-void

    .line 184
    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method public declared-synchronized unregisterClient(Ljava/lang/String;Landroid/os/Messenger;)V
    .locals 4

    monitor-enter p0

    .line 266
    :try_start_0
    iget-object v0, p0, Landroid/support/test/internal/runner/InstrumentationConnection;->mIncomingHandler:Landroid/support/test/internal/runner/InstrumentationConnection$IncomingHandler;

    if-eqz v0, :cond_0

    const/4 v0, 0x1

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    :goto_0
    const-string v1, "Instrumentation Connection in not yet initialized"

    invoke-static {v0, v1}, Landroid/support/test/internal/util/Checks;->checkState(ZLjava/lang/Object;)V

    .line 267
    const-string v0, "InstrConnection"

    const-string v1, "Unregister client of type: "

    invoke-static {p1}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/String;->length()I

    move-result v3

    if-eqz v3, :cond_1

    invoke-virtual {v1, v2}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    goto :goto_1

    :cond_1
    new-instance v2, Ljava/lang/String;

    invoke-direct {v2, v1}, Ljava/lang/String;-><init>(Ljava/lang/String;)V

    move-object v1, v2

    :goto_1
    invoke-static {v0, v1}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 268
    new-instance v0, Landroid/os/Bundle;

    invoke-direct {v0}, Landroid/os/Bundle;-><init>()V

    .line 269
    const-string v1, "instr_client_type"

    invoke-virtual {v0, v1, p1}, Landroid/os/Bundle;->putString(Ljava/lang/String;Ljava/lang/String;)V

    .line 270
    const-string p1, "instr_client_msgr"

    invoke-virtual {v0, p1, p2}, Landroid/os/Bundle;->putParcelable(Ljava/lang/String;Landroid/os/Parcelable;)V

    .line 271
    iget-object p1, p0, Landroid/support/test/internal/runner/InstrumentationConnection;->mIncomingHandler:Landroid/support/test/internal/runner/InstrumentationConnection$IncomingHandler;

    const/16 p2, 0x9

    invoke-virtual {p1, p2}, Landroid/support/test/internal/runner/InstrumentationConnection$IncomingHandler;->obtainMessage(I)Landroid/os/Message;

    move-result-object p1

    .line 272
    invoke-virtual {p1, v0}, Landroid/os/Message;->setData(Landroid/os/Bundle;)V

    .line 273
    iget-object p2, p0, Landroid/support/test/internal/runner/InstrumentationConnection;->mIncomingHandler:Landroid/support/test/internal/runner/InstrumentationConnection$IncomingHandler;

    invoke-virtual {p2, p1}, Landroid/support/test/internal/runner/InstrumentationConnection$IncomingHandler;->sendMessage(Landroid/os/Message;)Z
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 274
    monitor-exit p0

    return-void

    .line 265
    :catchall_0
    move-exception p1

    monitor-exit p0

    throw p1
.end method
