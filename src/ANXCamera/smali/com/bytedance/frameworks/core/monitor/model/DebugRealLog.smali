.class public Lcom/bytedance/frameworks/core/monitor/model/DebugRealLog;
.super Ljava/lang/Object;
.source "DebugRealLog.java"


# instance fields
.field public traceCode:Ljava/lang/String;

.field public value:Ljava/lang/String;


# direct methods
.method public constructor <init>(Ljava/lang/String;Ljava/lang/String;)V
    .locals 0

    .line 10
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 11
    iput-object p1, p0, Lcom/bytedance/frameworks/core/monitor/model/DebugRealLog;->value:Ljava/lang/String;

    .line 12
    iput-object p2, p0, Lcom/bytedance/frameworks/core/monitor/model/DebugRealLog;->traceCode:Ljava/lang/String;

    .line 13
    return-void
.end method
