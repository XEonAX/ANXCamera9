.class public Lcom/ss/android/ttve/mediacodec/TEAvcEncoder$CodecData;
.super Ljava/lang/Object;
.source "TEAvcEncoder.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/ss/android/ttve/mediacodec/TEAvcEncoder;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "CodecData"
.end annotation


# instance fields
.field public data:[B

.field public flag:I

.field public pts:J


# direct methods
.method public constructor <init>()V
    .locals 2

    .line 608
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 609
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/ss/android/ttve/mediacodec/TEAvcEncoder$CodecData;->data:[B

    .line 610
    const-wide/16 v0, 0x0

    iput-wide v0, p0, Lcom/ss/android/ttve/mediacodec/TEAvcEncoder$CodecData;->pts:J

    return-void
.end method
