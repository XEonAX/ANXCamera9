.class Lbytedance/framwork/core/sdkmonitor/SDKMonitor$1;
.super Ljava/lang/Object;
.source "SDKMonitor.java"

# interfaces
.implements Lbytedance/framwork/core/sdkmonitor/SDKMonitor$IGetCommonParams;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lbytedance/framwork/core/sdkmonitor/SDKMonitor;->initMonitor(Landroid/content/Context;Lorg/json/JSONObject;Lbytedance/framwork/core/sdkmonitor/SDKMonitor$IGetCommonParams;)V
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

    .line 188
    iput-object p1, p0, Lbytedance/framwork/core/sdkmonitor/SDKMonitor$1;->this$0:Lbytedance/framwork/core/sdkmonitor/SDKMonitor;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public getSessionId()Ljava/lang/String;
    .locals 1

    .line 191
    const/4 v0, 0x0

    return-object v0
.end method
