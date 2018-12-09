.class public Lcom/miui/extravideo/common/MediaUtils;
.super Ljava/lang/Object;
.source "MediaUtils.java"


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 3
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static computePresentationTime(II)J
    .locals 1

    .line 5
    const v0, 0xf4240

    mul-int/2addr p0, v0

    div-int/2addr p0, p1

    const/16 p1, 0x84

    add-int/2addr p1, p0

    int-to-long p0, p1

    return-wide p0
.end method
