.class Lbytedance/framwork/core/sdkmonitor/SDKMonitor$3;
.super Ljava/lang/Object;
.source "SDKMonitor.java"

# interfaces
.implements Lcom/bytedance/frameworks/baselib/log/LogLib$ILogDelegate;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lbytedance/framwork/core/sdkmonitor/SDKMonitor;->initLogLib()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lbytedance/framwork/core/sdkmonitor/SDKMonitor;


# direct methods
.method constructor <init>(Lbytedance/framwork/core/sdkmonitor/SDKMonitor;)V
    .locals 0

    .line 622
    iput-object p1, p0, Lbytedance/framwork/core/sdkmonitor/SDKMonitor$3;->this$0:Lbytedance/framwork/core/sdkmonitor/SDKMonitor;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public isNetworkAvailable(Landroid/content/Context;)Z
    .locals 0

    .line 625
    invoke-static {p1}, Lbytedance/framwork/core/sdkmonitor/MonitorNetUtil;->isNetworkAvailable(Landroid/content/Context;)Z

    move-result p1

    return p1
.end method
