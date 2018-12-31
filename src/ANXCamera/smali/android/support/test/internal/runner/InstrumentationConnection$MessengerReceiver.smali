.class Landroid/support/test/internal/runner/InstrumentationConnection$MessengerReceiver;
.super Landroid/content/BroadcastReceiver;
.source "InstrumentationConnection.java"


# annotations
.annotation build Landroid/support/annotation/VisibleForTesting;
.end annotation

.annotation system Ldalvik/annotation/EnclosingClass;
    value = Landroid/support/test/internal/runner/InstrumentationConnection;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = "MessengerReceiver"
.end annotation


# instance fields
.field final synthetic this$0:Landroid/support/test/internal/runner/InstrumentationConnection;


# direct methods
.method constructor <init>(Landroid/support/test/internal/runner/InstrumentationConnection;)V
    .locals 0

    .line 278
    iput-object p1, p0, Landroid/support/test/internal/runner/InstrumentationConnection$MessengerReceiver;->this$0:Landroid/support/test/internal/runner/InstrumentationConnection;

    invoke-direct {p0}, Landroid/content/BroadcastReceiver;-><init>()V

    return-void
.end method


# virtual methods
.method public onReceive(Landroid/content/Context;Landroid/content/Intent;)V
    .locals 2

    .line 282
    const-string p1, "InstrConnection"

    const-string v0, "Broadcast received"

    const/4 v1, 0x0

    new-array v1, v1, [Ljava/lang/Object;

    invoke-static {p1, v0, v1}, Landroid/support/test/internal/util/LogUtil;->logDebugWithProcess(Ljava/lang/String;Ljava/lang/String;[Ljava/lang/Object;)V

    .line 285
    const-string p1, "new_instrumentation_binder"

    invoke-virtual {p2, p1}, Landroid/content/Intent;->getBundleExtra(Ljava/lang/String;)Landroid/os/Bundle;

    move-result-object p1

    .line 286
    if-nez p1, :cond_0

    .line 287
    const-string p1, "InstrConnection"

    const-string p2, "Broadcast intent doesn\'t contain any extras, ignoring it.."

    invoke-static {p1, p2}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    .line 288
    return-void

    .line 290
    :cond_0
    const-string p2, "new_instrumentation_binder"

    invoke-virtual {p1, p2}, Landroid/os/Bundle;->getParcelable(Ljava/lang/String;)Landroid/os/Parcelable;

    move-result-object p1

    check-cast p1, Landroid/support/test/internal/util/ParcelableIBinder;

    .line 291
    if-eqz p1, :cond_1

    .line 292
    new-instance p2, Landroid/os/Messenger;

    invoke-virtual {p1}, Landroid/support/test/internal/util/ParcelableIBinder;->getIBinder()Landroid/os/IBinder;

    move-result-object p1

    invoke-direct {p2, p1}, Landroid/os/Messenger;-><init>(Landroid/os/IBinder;)V

    .line 293
    iget-object p1, p0, Landroid/support/test/internal/runner/InstrumentationConnection$MessengerReceiver;->this$0:Landroid/support/test/internal/runner/InstrumentationConnection;

    iget-object p1, p1, Landroid/support/test/internal/runner/InstrumentationConnection;->mIncomingHandler:Landroid/support/test/internal/runner/InstrumentationConnection$IncomingHandler;

    const/4 v0, 0x3

    invoke-virtual {p1, v0}, Landroid/support/test/internal/runner/InstrumentationConnection$IncomingHandler;->obtainMessage(I)Landroid/os/Message;

    move-result-object p1

    .line 294
    iput-object p2, p1, Landroid/os/Message;->replyTo:Landroid/os/Messenger;

    .line 295
    iget-object p2, p0, Landroid/support/test/internal/runner/InstrumentationConnection$MessengerReceiver;->this$0:Landroid/support/test/internal/runner/InstrumentationConnection;

    iget-object p2, p2, Landroid/support/test/internal/runner/InstrumentationConnection;->mIncomingHandler:Landroid/support/test/internal/runner/InstrumentationConnection$IncomingHandler;

    invoke-virtual {p2, p1}, Landroid/support/test/internal/runner/InstrumentationConnection$IncomingHandler;->sendMessage(Landroid/os/Message;)Z

    .line 297
    :cond_1
    return-void
.end method
