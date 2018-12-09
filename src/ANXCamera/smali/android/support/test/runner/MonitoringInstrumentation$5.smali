.class Landroid/support/test/runner/MonitoringInstrumentation$5;
.super Ljava/lang/Object;
.source "MonitoringInstrumentation.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Landroid/support/test/runner/MonitoringInstrumentation;->tryLoadingJsBridge(Ljava/lang/String;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Landroid/support/test/runner/MonitoringInstrumentation;

.field final synthetic val$className:Ljava/lang/String;


# direct methods
.method constructor <init>(Landroid/support/test/runner/MonitoringInstrumentation;Ljava/lang/String;)V
    .locals 0

    .line 789
    iput-object p1, p0, Landroid/support/test/runner/MonitoringInstrumentation$5;->this$0:Landroid/support/test/runner/MonitoringInstrumentation;

    iput-object p2, p0, Landroid/support/test/runner/MonitoringInstrumentation$5;->val$className:Ljava/lang/String;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 4

    .line 793
    :try_start_0
    iget-object v0, p0, Landroid/support/test/runner/MonitoringInstrumentation$5;->val$className:Ljava/lang/String;

    invoke-static {v0}, Ljava/lang/Class;->forName(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v0

    .line 794
    const-string v1, "installBridge"

    const/4 v2, 0x0

    new-array v3, v2, [Ljava/lang/Class;

    invoke-virtual {v0, v1, v3}, Ljava/lang/Class;->getDeclaredMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    move-result-object v0

    .line 795
    const/4 v1, 0x0

    new-array v2, v2, [Ljava/lang/Object;

    invoke-virtual {v0, v1, v2}, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;

    .line 796
    iget-object v0, p0, Landroid/support/test/runner/MonitoringInstrumentation$5;->this$0:Landroid/support/test/runner/MonitoringInstrumentation;

    invoke-static {v0}, Landroid/support/test/runner/MonitoringInstrumentation;->access$200(Landroid/support/test/runner/MonitoringInstrumentation;)Ljava/util/concurrent/atomic/AtomicBoolean;

    move-result-object v0

    const/4 v1, 0x1

    invoke-virtual {v0, v1}, Ljava/util/concurrent/atomic/AtomicBoolean;->set(Z)V
    :try_end_0
    .catch Ljava/lang/ClassNotFoundException; {:try_start_0 .. :try_end_0} :catch_1
    .catch Ljava/lang/NoSuchMethodException; {:try_start_0 .. :try_end_0} :catch_1
    .catch Ljava/lang/reflect/InvocationTargetException; {:try_start_0 .. :try_end_0} :catch_0
    .catch Ljava/lang/IllegalAccessException; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    .line 799
    :catch_0
    move-exception v0

    .line 800
    new-instance v1, Ljava/lang/RuntimeException;

    const-string v2, "JSbridge is available at runtime, but calling it failed."

    invoke-direct {v1, v2, v0}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    throw v1

    .line 797
    :catch_1
    move-exception v0

    .line 798
    const-string v0, "MonitoringInstr"

    const-string v1, "No JSBridge."

    invoke-static {v0, v1}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 802
    :goto_0
    nop

    .line 803
    return-void
.end method
