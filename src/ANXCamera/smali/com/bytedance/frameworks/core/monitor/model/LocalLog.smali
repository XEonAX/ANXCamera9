.class public Lcom/bytedance/frameworks/core/monitor/model/LocalLog;
.super Ljava/lang/Object;
.source "LocalLog.java"


# instance fields
.field public createTime:J

.field public data:Ljava/lang/String;

.field public id:J

.field public isSampled:Z

.field public type:Ljava/lang/String;

.field public type2:Ljava/lang/String;

.field public versionId:J


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 20
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 21
    return-void
.end method

.method public constructor <init>(JLjava/lang/String;JLjava/lang/String;)V
    .locals 0

    .line 23
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 24
    iput-wide p1, p0, Lcom/bytedance/frameworks/core/monitor/model/LocalLog;->id:J

    .line 25
    iput-object p3, p0, Lcom/bytedance/frameworks/core/monitor/model/LocalLog;->type:Ljava/lang/String;

    .line 26
    iput-object p6, p0, Lcom/bytedance/frameworks/core/monitor/model/LocalLog;->data:Ljava/lang/String;

    .line 27
    iput-wide p4, p0, Lcom/bytedance/frameworks/core/monitor/model/LocalLog;->versionId:J

    .line 28
    return-void
.end method


# virtual methods
.method public setData(Ljava/lang/String;)Lcom/bytedance/frameworks/core/monitor/model/LocalLog;
    .locals 0

    .line 46
    iput-object p1, p0, Lcom/bytedance/frameworks/core/monitor/model/LocalLog;->data:Ljava/lang/String;

    .line 47
    return-object p0
.end method

.method public setId(J)Lcom/bytedance/frameworks/core/monitor/model/LocalLog;
    .locals 0

    .line 31
    iput-wide p1, p0, Lcom/bytedance/frameworks/core/monitor/model/LocalLog;->id:J

    .line 32
    return-object p0
.end method

.method public setIsSampled(Z)Lcom/bytedance/frameworks/core/monitor/model/LocalLog;
    .locals 0

    .line 50
    iput-boolean p1, p0, Lcom/bytedance/frameworks/core/monitor/model/LocalLog;->isSampled:Z

    .line 51
    return-object p0
.end method

.method public setTimestamp(J)Lcom/bytedance/frameworks/core/monitor/model/LocalLog;
    .locals 0

    .line 59
    iput-wide p1, p0, Lcom/bytedance/frameworks/core/monitor/model/LocalLog;->createTime:J

    .line 60
    return-object p0
.end method

.method public setType(Ljava/lang/String;)Lcom/bytedance/frameworks/core/monitor/model/LocalLog;
    .locals 0

    .line 36
    iput-object p1, p0, Lcom/bytedance/frameworks/core/monitor/model/LocalLog;->type:Ljava/lang/String;

    .line 37
    return-object p0
.end method

.method public setType2(Ljava/lang/String;)Lcom/bytedance/frameworks/core/monitor/model/LocalLog;
    .locals 0

    .line 41
    iput-object p1, p0, Lcom/bytedance/frameworks/core/monitor/model/LocalLog;->type2:Ljava/lang/String;

    .line 42
    return-object p0
.end method

.method public setVersionId(J)Lcom/bytedance/frameworks/core/monitor/model/LocalLog;
    .locals 0

    .line 54
    iput-wide p1, p0, Lcom/bytedance/frameworks/core/monitor/model/LocalLog;->versionId:J

    .line 55
    return-object p0
.end method
