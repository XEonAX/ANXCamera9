.class final Lcom/ss/android/ttve/monitor/TEMonitor$1;
.super Ljava/lang/Object;
.source "TEMonitor.java"

# interfaces
.implements Lcom/ss/android/medialib/log/IMonitor;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/ss/android/ttve/monitor/TEMonitor;->init()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x8
    name = null
.end annotation


# direct methods
.method constructor <init>()V
    .locals 0

    .line 44
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public monitorLog(Ljava/lang/String;Lorg/json/JSONObject;)V
    .locals 0

    .line 47
    invoke-static {p2}, Lcom/ss/android/ttve/monitor/TEMonitor;->access$000(Lorg/json/JSONObject;)V

    .line 48
    return-void
.end method
