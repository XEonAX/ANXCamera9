.class Landroid/support/test/runner/MonitoringInstrumentation$1;
.super Ljava/lang/Object;
.source "MonitoringInstrumentation.java"

# interfaces
.implements Landroid/os/MessageQueue$IdleHandler;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Landroid/support/test/runner/MonitoringInstrumentation;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Landroid/support/test/runner/MonitoringInstrumentation;


# direct methods
.method constructor <init>(Landroid/support/test/runner/MonitoringInstrumentation;)V
    .locals 0

    .line 119
    iput-object p1, p0, Landroid/support/test/runner/MonitoringInstrumentation$1;->this$0:Landroid/support/test/runner/MonitoringInstrumentation;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public queueIdle()Z
    .locals 3

    .line 122
    iget-object v0, p0, Landroid/support/test/runner/MonitoringInstrumentation$1;->this$0:Landroid/support/test/runner/MonitoringInstrumentation;

    invoke-static {v0}, Landroid/support/test/runner/MonitoringInstrumentation;->access$000(Landroid/support/test/runner/MonitoringInstrumentation;)Ljava/util/concurrent/atomic/AtomicLong;

    move-result-object v0

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v1

    invoke-virtual {v0, v1, v2}, Ljava/util/concurrent/atomic/AtomicLong;->set(J)V

    .line 123
    const/4 v0, 0x1

    return v0
.end method
