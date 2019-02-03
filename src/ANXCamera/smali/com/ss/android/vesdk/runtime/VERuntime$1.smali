.class Lcom/ss/android/vesdk/runtime/VERuntime$1;
.super Ljava/lang/Object;
.source "VERuntime.java"

# interfaces
.implements Lcom/ss/android/ttve/monitor/IMonitor;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/ss/android/vesdk/runtime/VERuntime;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/ss/android/vesdk/runtime/VERuntime;


# direct methods
.method constructor <init>(Lcom/ss/android/vesdk/runtime/VERuntime;)V
    .locals 0

    .line 83
    iput-object p1, p0, Lcom/ss/android/vesdk/runtime/VERuntime$1;->this$0:Lcom/ss/android/vesdk/runtime/VERuntime;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public monitorLog(Ljava/lang/String;Lorg/json/JSONObject;)V
    .locals 1

    .line 86
    iget-object v0, p0, Lcom/ss/android/vesdk/runtime/VERuntime$1;->this$0:Lcom/ss/android/vesdk/runtime/VERuntime;

    invoke-static {v0}, Lcom/ss/android/vesdk/runtime/VERuntime;->access$100(Lcom/ss/android/vesdk/runtime/VERuntime;)Ljava/lang/ref/WeakReference;

    move-result-object v0

    if-eqz v0, :cond_0

    .line 87
    iget-object v0, p0, Lcom/ss/android/vesdk/runtime/VERuntime$1;->this$0:Lcom/ss/android/vesdk/runtime/VERuntime;

    invoke-static {v0}, Lcom/ss/android/vesdk/runtime/VERuntime;->access$100(Lcom/ss/android/vesdk/runtime/VERuntime;)Ljava/lang/ref/WeakReference;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/ref/WeakReference;->get()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/ss/android/vesdk/VEListener$VEMonitorListener;

    .line 88
    if-eqz v0, :cond_0

    .line 89
    invoke-interface {v0, p1, p2}, Lcom/ss/android/vesdk/VEListener$VEMonitorListener;->monitorLog(Ljava/lang/String;Lorg/json/JSONObject;)V

    .line 92
    :cond_0
    return-void
.end method
