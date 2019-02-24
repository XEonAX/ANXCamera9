.class public Lcom/bytedance/frameworks/core/monitor/model/InitialLogInfo;
.super Ljava/lang/Object;
.source "InitialLogInfo.java"


# instance fields
.field public isSampled:Z

.field public key:Ljava/lang/String;

.field public type:Ljava/lang/String;

.field public type2:Ljava/lang/String;

.field public value:F


# direct methods
.method public constructor <init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;FZ)V
    .locals 0

    .line 13
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 14
    iput-object p1, p0, Lcom/bytedance/frameworks/core/monitor/model/InitialLogInfo;->type:Ljava/lang/String;

    .line 15
    iput-object p2, p0, Lcom/bytedance/frameworks/core/monitor/model/InitialLogInfo;->type2:Ljava/lang/String;

    .line 16
    iput-object p3, p0, Lcom/bytedance/frameworks/core/monitor/model/InitialLogInfo;->key:Ljava/lang/String;

    .line 17
    iput p4, p0, Lcom/bytedance/frameworks/core/monitor/model/InitialLogInfo;->value:F

    .line 18
    iput-boolean p5, p0, Lcom/bytedance/frameworks/core/monitor/model/InitialLogInfo;->isSampled:Z

    .line 19
    return-void
.end method
