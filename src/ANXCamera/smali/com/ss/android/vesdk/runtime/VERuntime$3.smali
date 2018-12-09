.class Lcom/ss/android/vesdk/runtime/VERuntime$3;
.super Ljava/lang/Thread;
.source "VERuntime.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/ss/android/vesdk/runtime/VERuntime;->init(Landroid/content/Context;Ljava/lang/String;)V
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

    .line 147
    iput-object p1, p0, Lcom/ss/android/vesdk/runtime/VERuntime$3;->this$0:Lcom/ss/android/vesdk/runtime/VERuntime;

    invoke-direct {p0}, Ljava/lang/Thread;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 3

    .line 151
    :try_start_0
    iget-object v0, p0, Lcom/ss/android/vesdk/runtime/VERuntime$3;->this$0:Lcom/ss/android/vesdk/runtime/VERuntime;

    iget-object v0, v0, Lcom/ss/android/vesdk/runtime/VERuntime;->mContext:Landroid/content/Context;

    invoke-static {v0}, Lcom/ss/android/vesdk/runtime/cloudconfig/DeviceInfoDetector;->init(Landroid/content/Context;)V

    .line 152
    const-string v0, "on"

    const-string v1, "off"

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 153
    invoke-static {}, Lcom/ss/android/vesdk/runtime/cloudconfig/PerformanceConfig;->restoreFromCache()V

    .line 154
    invoke-static {}, Lcom/ss/android/vesdk/runtime/cloudconfig/PerformanceConfig;->fetch()V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 158
    :cond_0
    goto :goto_0

    .line 156
    :catch_0
    move-exception v0

    .line 157
    const-string v1, "VERuntime"

    const-string v2, "PerformanceConfig failed"

    invoke-static {v1, v2, v0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    .line 159
    :goto_0
    return-void
.end method
