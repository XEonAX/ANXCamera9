.class Lcom/bytedance/frameworks/baselib/log/LogItem;
.super Ljava/lang/Object;
.source "LogItem.java"


# instance fields
.field public id:J

.field public retry_count:I

.field public retry_time:J

.field public timestamp:J

.field public type:Ljava/lang/String;

.field public value:[B


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 11
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 12
    return-void
.end method

.method public constructor <init>(Ljava/lang/String;[B)V
    .locals 0

    .line 14
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 15
    iput-object p1, p0, Lcom/bytedance/frameworks/baselib/log/LogItem;->type:Ljava/lang/String;

    .line 16
    iput-object p2, p0, Lcom/bytedance/frameworks/baselib/log/LogItem;->value:[B

    .line 17
    return-void
.end method
