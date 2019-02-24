.class public Lcom/miui/extravideo/interpolation/EncodeBufferHolder;
.super Ljava/lang/Object;
.source "EncodeBufferHolder.java"


# instance fields
.field public data:[B

.field public flag:I

.field public presentationTimeUs:J

.field public representativeIndex:I


# direct methods
.method public constructor <init>()V
    .locals 1

    .line 3
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 4
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/miui/extravideo/interpolation/EncodeBufferHolder;->data:[B

    return-void
.end method
