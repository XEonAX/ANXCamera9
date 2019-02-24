.class public Lcom/xiaomi/camera/parallelservice/util/ParallelUtil$DEBUG;
.super Ljava/lang/Object;
.source "ParallelUtil.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/xiaomi/camera/parallelservice/util/ParallelUtil;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "DEBUG"
.end annotation


# static fields
.field public static final ENABLE:Z = false


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 129
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static crash()V
    .locals 1

    .line 144
    const/4 v0, 0x0

    invoke-static {v0}, Lcom/xiaomi/camera/parallelservice/util/ParallelUtil$DEBUG;->doAssert(Z)V

    .line 145
    return-void
.end method

.method public static doAssert(Z)V
    .locals 1

    .line 134
    const/4 v0, 0x0

    invoke-static {p0, v0}, Lcom/xiaomi/camera/parallelservice/util/ParallelUtil$DEBUG;->doAssert(ZLjava/lang/String;)V

    .line 135
    return-void
.end method

.method public static doAssert(ZLjava/lang/String;)V
    .locals 0

    .line 141
    return-void
.end method
