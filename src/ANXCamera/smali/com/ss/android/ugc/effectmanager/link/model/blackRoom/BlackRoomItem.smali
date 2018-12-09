.class public abstract Lcom/ss/android/ugc/effectmanager/link/model/blackRoom/BlackRoomItem;
.super Ljava/lang/Object;
.source "BlackRoomItem.java"


# instance fields
.field protected inBlackRoom:Z

.field protected lockedCount:I

.field protected startLockTime:J


# direct methods
.method public constructor <init>()V
    .locals 1

    .line 9
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 11
    const/4 v0, 0x0

    iput v0, p0, Lcom/ss/android/ugc/effectmanager/link/model/blackRoom/BlackRoomItem;->lockedCount:I

    return-void
.end method


# virtual methods
.method public abstract getItemName()Ljava/lang/String;
.end method

.method public getLockedCount()I
    .locals 1

    .line 38
    iget v0, p0, Lcom/ss/android/ugc/effectmanager/link/model/blackRoom/BlackRoomItem;->lockedCount:I

    return v0
.end method

.method public isInBlackRoom()Z
    .locals 1

    .line 15
    iget-boolean v0, p0, Lcom/ss/android/ugc/effectmanager/link/model/blackRoom/BlackRoomItem;->inBlackRoom:Z

    return v0
.end method

.method public lockToBlackRoom()Z
    .locals 3

    .line 20
    invoke-virtual {p0}, Lcom/ss/android/ugc/effectmanager/link/model/blackRoom/BlackRoomItem;->isInBlackRoom()Z

    move-result v0

    if-nez v0, :cond_0

    .line 21
    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/ss/android/ugc/effectmanager/link/model/blackRoom/BlackRoomItem;->inBlackRoom:Z

    .line 22
    iget v1, p0, Lcom/ss/android/ugc/effectmanager/link/model/blackRoom/BlackRoomItem;->lockedCount:I

    add-int/2addr v1, v0

    iput v1, p0, Lcom/ss/android/ugc/effectmanager/link/model/blackRoom/BlackRoomItem;->lockedCount:I

    .line 23
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v1

    iput-wide v1, p0, Lcom/ss/android/ugc/effectmanager/link/model/blackRoom/BlackRoomItem;->startLockTime:J

    .line 24
    return v0

    .line 26
    :cond_0
    const/4 v0, 0x0

    return v0
.end method

.method public resetStatus()V
    .locals 1

    .line 42
    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/ss/android/ugc/effectmanager/link/model/blackRoom/BlackRoomItem;->inBlackRoom:Z

    .line 43
    iput v0, p0, Lcom/ss/android/ugc/effectmanager/link/model/blackRoom/BlackRoomItem;->lockedCount:I

    .line 44
    return-void
.end method

.method public startLockTime()J
    .locals 2

    .line 34
    iget-wide v0, p0, Lcom/ss/android/ugc/effectmanager/link/model/blackRoom/BlackRoomItem;->startLockTime:J

    return-wide v0
.end method

.method public toString()Ljava/lang/String;
    .locals 2

    .line 50
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "BlackRoomItem{name="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 51
    invoke-virtual {p0}, Lcom/ss/android/ugc/effectmanager/link/model/blackRoom/BlackRoomItem;->getItemName()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v1, "lockedCount="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget v1, p0, Lcom/ss/android/ugc/effectmanager/link/model/blackRoom/BlackRoomItem;->lockedCount:I

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v1, ", inBlackRoom="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-boolean v1, p0, Lcom/ss/android/ugc/effectmanager/link/model/blackRoom/BlackRoomItem;->inBlackRoom:Z

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    const/16 v1, 0x7d

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    .line 50
    return-object v0
.end method

.method public unlockFromBlackRoom()V
    .locals 1

    .line 30
    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/ss/android/ugc/effectmanager/link/model/blackRoom/BlackRoomItem;->inBlackRoom:Z

    .line 31
    return-void
.end method
