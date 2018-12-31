.class public Lcom/ss/android/medialib/model/TimeSpeedModel;
.super Ljava/lang/Object;
.source "TimeSpeedModel.java"


# annotations
.annotation build Landroid/support/annotation/Keep;
.end annotation


# instance fields
.field duration:J

.field speed:D


# direct methods
.method public constructor <init>(JD)V
    .locals 0

    .line 19
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 20
    iput-wide p1, p0, Lcom/ss/android/medialib/model/TimeSpeedModel;->duration:J

    .line 21
    iput-wide p3, p0, Lcom/ss/android/medialib/model/TimeSpeedModel;->speed:D

    .line 22
    return-void
.end method

.method public static calculateRealTime(Ljava/util/List;)I
    .locals 6
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Lcom/ss/android/medialib/model/TimeSpeedModel;",
            ">;)I"
        }
    .end annotation

    .line 41
    const/4 v0, 0x0

    if-eqz p0, :cond_2

    invoke-interface {p0}, Ljava/util/List;->size()I

    move-result v1

    if-gtz v1, :cond_0

    goto :goto_1

    .line 42
    :cond_0
    nop

    .line 43
    invoke-interface {p0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object p0

    :goto_0
    invoke-interface {p0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_1

    invoke-interface {p0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/ss/android/medialib/model/TimeSpeedModel;

    .line 44
    int-to-long v2, v0

    iget-wide v4, v1, Lcom/ss/android/medialib/model/TimeSpeedModel;->duration:J

    iget-wide v0, v1, Lcom/ss/android/medialib/model/TimeSpeedModel;->speed:D

    invoke-static {v4, v5, v0, v1}, Lcom/ss/android/medialib/model/TimeSpeedModel;->calculateRealTime(JD)J

    move-result-wide v0

    add-long/2addr v2, v0

    long-to-int v0, v2

    .line 45
    goto :goto_0

    .line 46
    :cond_1
    return v0

    .line 41
    :cond_2
    :goto_1
    return v0
.end method

.method public static calculateRealTime(JD)J
    .locals 2

    .line 50
    long-to-double p0, p0

    const-wide/high16 v0, 0x3ff0000000000000L    # 1.0

    mul-double/2addr v0, p0

    div-double/2addr v0, p2

    double-to-long p0, v0

    return-wide p0
.end method


# virtual methods
.method public getDuration()J
    .locals 2

    .line 25
    iget-wide v0, p0, Lcom/ss/android/medialib/model/TimeSpeedModel;->duration:J

    return-wide v0
.end method

.method public getSpeed()D
    .locals 2

    .line 33
    iget-wide v0, p0, Lcom/ss/android/medialib/model/TimeSpeedModel;->speed:D

    return-wide v0
.end method

.method public setDuration(J)V
    .locals 0

    .line 29
    iput-wide p1, p0, Lcom/ss/android/medialib/model/TimeSpeedModel;->duration:J

    .line 30
    return-void
.end method

.method public setSpeed(F)V
    .locals 2

    .line 37
    float-to-double v0, p1

    iput-wide v0, p0, Lcom/ss/android/medialib/model/TimeSpeedModel;->speed:D

    .line 38
    return-void
.end method
