.class public Lcom/ss/android/ttve/audio/TEDubWriter;
.super Ljava/lang/Object;
.source "TEDubWriter.java"

# interfaces
.implements Lcom/ss/android/ttve/audio/TEAudioWriterInterface;


# instance fields
.field mHandle:J


# direct methods
.method public constructor <init>()V
    .locals 2

    .line 13
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 14
    invoke-virtual {p0}, Lcom/ss/android/ttve/audio/TEDubWriter;->nativeCreate()J

    move-result-wide v0

    iput-wide v0, p0, Lcom/ss/android/ttve/audio/TEDubWriter;->mHandle:J

    .line 15
    return-void
.end method


# virtual methods
.method public addPCMData([BI)I
    .locals 4

    .line 27
    iget-wide v0, p0, Lcom/ss/android/ttve/audio/TEDubWriter;->mHandle:J

    const-wide/16 v2, 0x0

    cmp-long v0, v0, v2

    if-nez v0, :cond_0

    .line 28
    const/16 p1, -0x70

    return p1

    .line 30
    :cond_0
    iget-wide v0, p0, Lcom/ss/android/ttve/audio/TEDubWriter;->mHandle:J

    invoke-virtual {p0, v0, v1, p1, p2}, Lcom/ss/android/ttve/audio/TEDubWriter;->nativeAddPCMData(J[BI)I

    move-result p1

    return p1
.end method

.method public closeWavFile()I
    .locals 4

    .line 35
    iget-wide v0, p0, Lcom/ss/android/ttve/audio/TEDubWriter;->mHandle:J

    const-wide/16 v2, 0x0

    cmp-long v0, v0, v2

    if-nez v0, :cond_0

    .line 36
    const/16 v0, -0x70

    return v0

    .line 38
    :cond_0
    iget-wide v0, p0, Lcom/ss/android/ttve/audio/TEDubWriter;->mHandle:J

    invoke-virtual {p0, v0, v1}, Lcom/ss/android/ttve/audio/TEDubWriter;->nativeCloseWavFile(J)I

    move-result v0

    return v0
.end method

.method public destroy()V
    .locals 4

    .line 43
    iget-wide v0, p0, Lcom/ss/android/ttve/audio/TEDubWriter;->mHandle:J

    const-wide/16 v2, 0x0

    cmp-long v0, v0, v2

    if-eqz v0, :cond_0

    .line 44
    iget-wide v0, p0, Lcom/ss/android/ttve/audio/TEDubWriter;->mHandle:J

    invoke-virtual {p0, v0, v1}, Lcom/ss/android/ttve/audio/TEDubWriter;->nativeDestroy(J)V

    .line 46
    :cond_0
    return-void
.end method

.method public initWavFile(Ljava/lang/String;IIDII)I
    .locals 10

    move-object v0, p0

    .line 19
    iget-wide v1, v0, Lcom/ss/android/ttve/audio/TEDubWriter;->mHandle:J

    const-wide/16 v3, 0x0

    cmp-long v1, v1, v3

    if-nez v1, :cond_0

    .line 20
    const/16 v0, -0x70

    return v0

    .line 22
    :cond_0
    iget-wide v1, v0, Lcom/ss/android/ttve/audio/TEDubWriter;->mHandle:J

    move-object v3, p1

    move v4, p2

    move v5, p3

    move-wide v6, p4

    move/from16 v8, p6

    move/from16 v9, p7

    invoke-virtual/range {v0 .. v9}, Lcom/ss/android/ttve/audio/TEDubWriter;->nativeInitWavFile(JLjava/lang/String;IIDII)I

    move-result v0

    return v0
.end method

.method public native nativeAddPCMData(J[BI)I
.end method

.method public native nativeCloseWavFile(J)I
.end method

.method public native nativeCreate()J
.end method

.method public native nativeDestroy(J)V
.end method

.method public native nativeInitWavFile(JLjava/lang/String;IIDII)I
.end method
