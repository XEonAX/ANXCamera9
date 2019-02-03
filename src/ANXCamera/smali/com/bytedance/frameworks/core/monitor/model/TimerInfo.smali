.class public Lcom/bytedance/frameworks/core/monitor/model/TimerInfo;
.super Ljava/lang/Object;
.source "TimerInfo.java"


# instance fields
.field public firstTime:J

.field public isSampled:Z

.field public key:Ljava/lang/String;

.field public times:I

.field public type:Ljava/lang/String;

.field public type2:Ljava/lang/String;

.field public value:F


# direct methods
.method public constructor <init>(Ljava/lang/String;Ljava/lang/String;IFJ)V
    .locals 0

    .line 15
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 16
    iput-object p1, p0, Lcom/bytedance/frameworks/core/monitor/model/TimerInfo;->key:Ljava/lang/String;

    .line 17
    iput-object p2, p0, Lcom/bytedance/frameworks/core/monitor/model/TimerInfo;->type:Ljava/lang/String;

    .line 18
    iput p3, p0, Lcom/bytedance/frameworks/core/monitor/model/TimerInfo;->times:I

    .line 19
    iput p4, p0, Lcom/bytedance/frameworks/core/monitor/model/TimerInfo;->value:F

    .line 20
    iput-wide p5, p0, Lcom/bytedance/frameworks/core/monitor/model/TimerInfo;->firstTime:J

    .line 21
    return-void
.end method


# virtual methods
.method public setType2(Ljava/lang/String;)Lcom/bytedance/frameworks/core/monitor/model/TimerInfo;
    .locals 0

    .line 24
    iput-object p1, p0, Lcom/bytedance/frameworks/core/monitor/model/TimerInfo;->type2:Ljava/lang/String;

    .line 25
    return-object p0
.end method
