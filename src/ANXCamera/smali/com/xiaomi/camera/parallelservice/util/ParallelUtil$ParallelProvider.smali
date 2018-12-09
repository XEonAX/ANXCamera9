.class public Lcom/xiaomi/camera/parallelservice/util/ParallelUtil$ParallelProvider;
.super Ljava/lang/Object;
.source "ParallelUtil.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/xiaomi/camera/parallelservice/util/ParallelUtil;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "ParallelProvider"
.end annotation


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 49
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static deleteInProvider(Landroid/content/Context;J)V
    .locals 0

    .line 59
    invoke-static {p1, p2}, Lcom/xiaomi/camera/parallelservice/util/ParallelUtil;->getResultUri(J)Landroid/net/Uri;

    move-result-object p1

    invoke-static {p0, p1}, Lcom/xiaomi/camera/parallelservice/util/ParallelUtil$ParallelProvider;->deleteInProvider(Landroid/content/Context;Landroid/net/Uri;)V

    .line 60
    return-void
.end method

.method public static deleteInProvider(Landroid/content/Context;Landroid/net/Uri;)V
    .locals 3

    .line 51
    if-eqz p0, :cond_0

    const/4 v0, 0x1

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    :goto_0
    invoke-static {v0}, Lcom/xiaomi/camera/parallelservice/util/ParallelUtil$DEBUG;->doAssert(Z)V

    .line 52
    if-eqz p0, :cond_1

    .line 53
    invoke-static {}, Lcom/xiaomi/camera/parallelservice/util/ParallelUtil;->access$000()Ljava/lang/String;

    move-result-object v0

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "deleteInProvider resultUri:"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Landroid/util/Log;->v(Ljava/lang/String;Ljava/lang/String;)I

    .line 54
    invoke-virtual {p0}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object p0

    const/4 v0, 0x0

    invoke-virtual {p0, p1, v0, v0}, Landroid/content/ContentResolver;->delete(Landroid/net/Uri;Ljava/lang/String;[Ljava/lang/String;)I

    .line 56
    :cond_1
    return-void
.end method
