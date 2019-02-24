.class public Lcom/ss/android/ugc/effectmanager/link/model/blackRoom/BlackRoom;
.super Ljava/lang/Object;
.source "BlackRoom.java"


# static fields
.field private static final TAG:Ljava/lang/String; = "BlackRoom"


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 14
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method private getLockedTime(I)J
    .locals 7

    .line 64
    const/4 v0, 0x5

    if-le p1, v0, :cond_0

    .line 65
    nop

    .line 68
    move p1, v0

    :cond_0
    const-wide/32 v0, 0xea60

    const/4 v2, 0x1

    if-ne p1, v2, :cond_1

    .line 69
    return-wide v0

    .line 72
    :cond_1
    const-wide/high16 v3, 0x4000000000000000L    # 2.0

    sub-int/2addr p1, v2

    int-to-double v5, p1

    invoke-static {v3, v4, v5, v6}, Ljava/lang/Math;->pow(DD)D

    move-result-wide v2

    double-to-long v2, v2

    .line 73
    mul-long/2addr v2, v0

    return-wide v2
.end method


# virtual methods
.method public checkHostAvailable(Lcom/ss/android/ugc/effectmanager/link/model/blackRoom/BlackRoomItem;)Z
    .locals 9

    .line 17
    const/4 v0, 0x0

    if-nez p1, :cond_0

    .line 18
    return v0

    .line 20
    :cond_0
    invoke-virtual {p1}, Lcom/ss/android/ugc/effectmanager/link/model/blackRoom/BlackRoomItem;->isInBlackRoom()Z

    move-result v1

    const/4 v2, 0x1

    if-nez v1, :cond_1

    .line 22
    const-string v0, "BlackRoom"

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {p1}, Lcom/ss/android/ugc/effectmanager/link/model/blackRoom/BlackRoomItem;->getItemName()Ljava/lang/String;

    move-result-object p1

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string p1, " is available"

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-static {v0, p1}, Lcom/ss/android/ugc/effectmanager/common/utils/LogUtils;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 23
    return v2

    .line 26
    :cond_1
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v3

    invoke-virtual {p1}, Lcom/ss/android/ugc/effectmanager/link/model/blackRoom/BlackRoomItem;->startLockTime()J

    move-result-wide v5

    sub-long/2addr v3, v5

    .line 27
    invoke-virtual {p1}, Lcom/ss/android/ugc/effectmanager/link/model/blackRoom/BlackRoomItem;->getLockedCount()I

    move-result v1

    invoke-direct {p0, v1}, Lcom/ss/android/ugc/effectmanager/link/model/blackRoom/BlackRoom;->getLockedTime(I)J

    move-result-wide v5

    cmp-long v1, v3, v5

    const-wide/32 v5, 0xea60

    if-ltz v1, :cond_2

    .line 29
    const-string v0, "BlackRoom"

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v7, "unlock "

    invoke-virtual {v1, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p1}, Lcom/ss/android/ugc/effectmanager/link/model/blackRoom/BlackRoomItem;->getItemName()Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v1, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v7, ", locked count = "

    invoke-virtual {v1, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 30
    invoke-virtual {p1}, Lcom/ss/android/ugc/effectmanager/link/model/blackRoom/BlackRoomItem;->getLockedCount()I

    move-result v7

    invoke-virtual {v1, v7}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v7, ", should lock "

    invoke-virtual {v1, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 31
    invoke-virtual {p1}, Lcom/ss/android/ugc/effectmanager/link/model/blackRoom/BlackRoomItem;->getLockedCount()I

    move-result v7

    invoke-direct {p0, v7}, Lcom/ss/android/ugc/effectmanager/link/model/blackRoom/BlackRoom;->getLockedTime(I)J

    move-result-wide v7

    div-long/2addr v7, v5

    invoke-virtual {v1, v7, v8}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    const-string v7, " min, already locked "

    invoke-virtual {v1, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    div-long/2addr v3, v5

    invoke-virtual {v1, v3, v4}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    const-string v3, " min"

    invoke-virtual {v1, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    .line 29
    invoke-static {v0, v1}, Lcom/ss/android/ugc/effectmanager/common/utils/LogUtils;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 33
    invoke-virtual {p1}, Lcom/ss/android/ugc/effectmanager/link/model/blackRoom/BlackRoomItem;->unlockFromBlackRoom()V

    .line 34
    return v2

    .line 36
    :cond_2
    const-string v1, "BlackRoom"

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {p1}, Lcom/ss/android/ugc/effectmanager/link/model/blackRoom/BlackRoomItem;->getItemName()Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v2, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v7, " is locked, locked count = "

    invoke-virtual {v2, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 37
    invoke-virtual {p1}, Lcom/ss/android/ugc/effectmanager/link/model/blackRoom/BlackRoomItem;->getLockedCount()I

    move-result v7

    invoke-virtual {v2, v7}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v7, ", should lock "

    invoke-virtual {v2, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 38
    invoke-virtual {p1}, Lcom/ss/android/ugc/effectmanager/link/model/blackRoom/BlackRoomItem;->getLockedCount()I

    move-result p1

    invoke-direct {p0, p1}, Lcom/ss/android/ugc/effectmanager/link/model/blackRoom/BlackRoom;->getLockedTime(I)J

    move-result-wide v7

    div-long/2addr v7, v5

    invoke-virtual {v2, v7, v8}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    const-string p1, " min, already locked "

    invoke-virtual {v2, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    div-long/2addr v3, v5

    invoke-virtual {v2, v3, v4}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    const-string p1, " min"

    invoke-virtual {v2, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    .line 36
    invoke-static {v1, p1}, Lcom/ss/android/ugc/effectmanager/common/utils/LogUtils;->e(Ljava/lang/String;Ljava/lang/String;)V

    .line 41
    return v0
.end method

.method public declared-synchronized lock(Lcom/ss/android/ugc/effectmanager/link/model/blackRoom/BlackRoomItem;)V
    .locals 6

    monitor-enter p0

    .line 45
    if-nez p1, :cond_0

    monitor-exit p0

    return-void

    .line 46
    :cond_0
    :try_start_0
    invoke-virtual {p1}, Lcom/ss/android/ugc/effectmanager/link/model/blackRoom/BlackRoomItem;->lockToBlackRoom()Z

    move-result v0

    if-eqz v0, :cond_1

    .line 47
    const-string v0, "BlackRoom"

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "lock "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p1}, Lcom/ss/android/ugc/effectmanager/link/model/blackRoom/BlackRoomItem;->getItemName()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v2, " "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 48
    invoke-virtual {p1}, Lcom/ss/android/ugc/effectmanager/link/model/blackRoom/BlackRoomItem;->getLockedCount()I

    move-result v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v2, " time for "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 49
    invoke-virtual {p1}, Lcom/ss/android/ugc/effectmanager/link/model/blackRoom/BlackRoomItem;->getLockedCount()I

    move-result p1

    invoke-direct {p0, p1}, Lcom/ss/android/ugc/effectmanager/link/model/blackRoom/BlackRoom;->getLockedTime(I)J

    move-result-wide v2

    const-wide/32 v4, 0xea60

    div-long/2addr v2, v4

    invoke-virtual {v1, v2, v3}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    const-string p1, " min"

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    .line 47
    invoke-static {v0, p1}, Lcom/ss/android/ugc/effectmanager/common/utils/LogUtils;->e(Ljava/lang/String;Ljava/lang/String;)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 52
    :cond_1
    monitor-exit p0

    return-void

    .line 44
    :catchall_0
    move-exception p1

    monitor-exit p0

    throw p1
.end method
