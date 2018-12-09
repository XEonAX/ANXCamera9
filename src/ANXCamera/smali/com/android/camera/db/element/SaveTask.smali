.class public Lcom/android/camera/db/element/SaveTask;
.super Ljava/lang/Object;
.source "SaveTask.java"


# instance fields
.field private id:Ljava/lang/Long;

.field private jpegRotation:I

.field private mediaStoreId:Ljava/lang/Long;

.field private path:Ljava/lang/String;

.field private percentage:I

.field private startTime:Ljava/lang/Long;

.field private status:I


# direct methods
.method public constructor <init>()V
    .locals 1

    .line 65
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 31
    const/4 v0, 0x1

    iput v0, p0, Lcom/android/camera/db/element/SaveTask;->status:I

    .line 66
    return-void
.end method

.method public constructor <init>(Ljava/lang/Long;Ljava/lang/Long;Ljava/lang/Long;Ljava/lang/String;III)V
    .locals 1

    .line 53
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 31
    const/4 v0, 0x1

    iput v0, p0, Lcom/android/camera/db/element/SaveTask;->status:I

    .line 54
    iput-object p1, p0, Lcom/android/camera/db/element/SaveTask;->id:Ljava/lang/Long;

    .line 55
    iput-object p2, p0, Lcom/android/camera/db/element/SaveTask;->startTime:Ljava/lang/Long;

    .line 56
    iput-object p3, p0, Lcom/android/camera/db/element/SaveTask;->mediaStoreId:Ljava/lang/Long;

    .line 57
    iput-object p4, p0, Lcom/android/camera/db/element/SaveTask;->path:Ljava/lang/String;

    .line 58
    iput p5, p0, Lcom/android/camera/db/element/SaveTask;->status:I

    .line 59
    iput p6, p0, Lcom/android/camera/db/element/SaveTask;->percentage:I

    .line 60
    iput p7, p0, Lcom/android/camera/db/element/SaveTask;->jpegRotation:I

    .line 61
    return-void
.end method

.method public constructor <init>(Ljava/lang/Long;Ljava/lang/String;)V
    .locals 1

    .line 45
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 31
    const/4 v0, 0x1

    iput v0, p0, Lcom/android/camera/db/element/SaveTask;->status:I

    .line 46
    iput-object p1, p0, Lcom/android/camera/db/element/SaveTask;->mediaStoreId:Ljava/lang/Long;

    .line 47
    iput-object p2, p0, Lcom/android/camera/db/element/SaveTask;->path:Ljava/lang/String;

    .line 48
    return-void
.end method


# virtual methods
.method public getId()Ljava/lang/Long;
    .locals 1

    .line 79
    iget-object v0, p0, Lcom/android/camera/db/element/SaveTask;->id:Ljava/lang/Long;

    return-object v0
.end method

.method public getJpegRotation()I
    .locals 1

    .line 141
    iget v0, p0, Lcom/android/camera/db/element/SaveTask;->jpegRotation:I

    return v0
.end method

.method public getMediaStoreId()Ljava/lang/Long;
    .locals 1

    .line 101
    iget-object v0, p0, Lcom/android/camera/db/element/SaveTask;->mediaStoreId:Ljava/lang/Long;

    return-object v0
.end method

.method public getPath()Ljava/lang/String;
    .locals 1

    .line 111
    iget-object v0, p0, Lcom/android/camera/db/element/SaveTask;->path:Ljava/lang/String;

    return-object v0
.end method

.method public getPercentage()I
    .locals 1

    .line 131
    iget v0, p0, Lcom/android/camera/db/element/SaveTask;->percentage:I

    return v0
.end method

.method public getStartTime()Ljava/lang/Long;
    .locals 1

    .line 89
    iget-object v0, p0, Lcom/android/camera/db/element/SaveTask;->startTime:Ljava/lang/Long;

    return-object v0
.end method

.method public getStatus()I
    .locals 1

    .line 121
    iget v0, p0, Lcom/android/camera/db/element/SaveTask;->status:I

    return v0
.end method

.method public isDeparted(J)Z
    .locals 2

    .line 70
    invoke-virtual {p0}, Lcom/android/camera/db/element/SaveTask;->getStartTime()Ljava/lang/Long;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/Long;->longValue()J

    move-result-wide v0

    sub-long/2addr p1, v0

    const-wide/32 v0, 0x9c40

    cmp-long p1, p1, v0

    if-lez p1, :cond_0

    const/4 p1, 0x1

    goto :goto_0

    :cond_0
    const/4 p1, 0x0

    :goto_0
    return p1
.end method

.method public isValid()Z
    .locals 1

    .line 75
    invoke-virtual {p0}, Lcom/android/camera/db/element/SaveTask;->getMediaStoreId()Ljava/lang/Long;

    move-result-object v0

    if-eqz v0, :cond_0

    const/4 v0, 0x1

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    :goto_0
    return v0
.end method

.method public setId(Ljava/lang/Long;)V
    .locals 0

    .line 84
    iput-object p1, p0, Lcom/android/camera/db/element/SaveTask;->id:Ljava/lang/Long;

    .line 85
    return-void
.end method

.method public setJpegRotation(I)V
    .locals 0

    .line 146
    iput p1, p0, Lcom/android/camera/db/element/SaveTask;->jpegRotation:I

    .line 147
    return-void
.end method

.method public setMediaStoreId(Ljava/lang/Long;)V
    .locals 0

    .line 106
    iput-object p1, p0, Lcom/android/camera/db/element/SaveTask;->mediaStoreId:Ljava/lang/Long;

    .line 107
    return-void
.end method

.method public setPath(Ljava/lang/String;)V
    .locals 0

    .line 116
    iput-object p1, p0, Lcom/android/camera/db/element/SaveTask;->path:Ljava/lang/String;

    .line 117
    return-void
.end method

.method public setPercentage(I)V
    .locals 0

    .line 136
    iput p1, p0, Lcom/android/camera/db/element/SaveTask;->percentage:I

    .line 137
    return-void
.end method

.method public setStartTime(Ljava/lang/Long;)V
    .locals 3

    .line 94
    const-string v0, "algo setTime:"

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    const-string v2, ""

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Lcom/android/camera/log/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 96
    iput-object p1, p0, Lcom/android/camera/db/element/SaveTask;->startTime:Ljava/lang/Long;

    .line 97
    return-void
.end method

.method public setStatus(I)V
    .locals 0

    .line 126
    iput p1, p0, Lcom/android/camera/db/element/SaveTask;->status:I

    .line 127
    return-void
.end method
