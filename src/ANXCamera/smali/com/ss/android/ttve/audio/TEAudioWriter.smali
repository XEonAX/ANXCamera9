.class public Lcom/ss/android/ttve/audio/TEAudioWriter;
.super Ljava/lang/Object;
.source "TEAudioWriter.java"

# interfaces
.implements Lcom/ss/android/ttve/audio/TEAudioWriterInterface;


# instance fields
.field mHandle:J


# direct methods
.method public constructor <init>()V
    .locals 2

    .line 14
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 15
    invoke-virtual {p0}, Lcom/ss/android/ttve/audio/TEAudioWriter;->nativeCreate()J

    move-result-wide v0

    iput-wide v0, p0, Lcom/ss/android/ttve/audio/TEAudioWriter;->mHandle:J

    .line 16
    return-void
.end method


# virtual methods
.method public addPCMData([BI)I
    .locals 4

    .line 28
    iget-wide v0, p0, Lcom/ss/android/ttve/audio/TEAudioWriter;->mHandle:J

    const-wide/16 v2, 0x0

    cmp-long v0, v0, v2

    if-nez v0, :cond_0

    .line 29
    const/16 p1, -0x70

    return p1

    .line 31
    :cond_0
    iget-wide v0, p0, Lcom/ss/android/ttve/audio/TEAudioWriter;->mHandle:J

    invoke-virtual {p0, v0, v1, p1, p2}, Lcom/ss/android/ttve/audio/TEAudioWriter;->nativeAddPCMData(J[BI)I

    move-result p1

    return p1
.end method

.method public closeWavFile()I
    .locals 4

    .line 36
    iget-wide v0, p0, Lcom/ss/android/ttve/audio/TEAudioWriter;->mHandle:J

    const-wide/16 v2, 0x0

    cmp-long v0, v0, v2

    if-nez v0, :cond_0

    .line 37
    const/16 v0, -0x70

    return v0

    .line 39
    :cond_0
    iget-wide v0, p0, Lcom/ss/android/ttve/audio/TEAudioWriter;->mHandle:J

    invoke-virtual {p0, v0, v1}, Lcom/ss/android/ttve/audio/TEAudioWriter;->nativeCloseWavFile(J)I

    move-result v0

    return v0
.end method

.method public destroy()V
    .locals 4

    .line 44
    iget-wide v0, p0, Lcom/ss/android/ttve/audio/TEAudioWriter;->mHandle:J

    const-wide/16 v2, 0x0

    cmp-long v0, v0, v2

    if-eqz v0, :cond_0

    .line 45
    iget-wide v0, p0, Lcom/ss/android/ttve/audio/TEAudioWriter;->mHandle:J

    invoke-virtual {p0, v0, v1}, Lcom/ss/android/ttve/audio/TEAudioWriter;->nativeDestroy(J)V

    .line 47
    :cond_0
    return-void
.end method

.method public initWavFile(Ljava/lang/String;IIDII)I
    .locals 8

    .line 20
    iget-wide p6, p0, Lcom/ss/android/ttve/audio/TEAudioWriter;->mHandle:J

    const-wide/16 v0, 0x0

    cmp-long p6, p6, v0

    if-nez p6, :cond_0

    .line 21
    const/16 p1, -0x70

    return p1

    .line 23
    :cond_0
    iget-wide v1, p0, Lcom/ss/android/ttve/audio/TEAudioWriter;->mHandle:J

    move-object v0, p0

    move-object v3, p1

    move v4, p2

    move v5, p3

    move-wide v6, p4

    invoke-virtual/range {v0 .. v7}, Lcom/ss/android/ttve/audio/TEAudioWriter;->nativeInitWavFile(JLjava/lang/String;IID)I

    move-result p1

    return p1
.end method

.method public native nativeAddPCMData(J[BI)I
.end method

.method public native nativeCloseWavFile(J)I
.end method

.method public native nativeCreate()J
.end method

.method public native nativeDestroy(J)V
.end method

.method public native nativeInitWavFile(JLjava/lang/String;IID)I
.end method
