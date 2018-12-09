.class public Lcom/ss/android/medialib/FFMpegManager;
.super Ljava/lang/Object;
.source "FFMpegManager.java"


# static fields
.field private static final TAG:Ljava/lang/String; = "FFMpegManager"

.field private static volatile mpegManager:Lcom/ss/android/medialib/FFMpegManager;


# instance fields
.field private mFFMpegInvoker:Lcom/ss/android/medialib/FFMpegInvoker;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 8
    const/4 v0, 0x0

    sput-object v0, Lcom/ss/android/medialib/FFMpegManager;->mpegManager:Lcom/ss/android/medialib/FFMpegManager;

    return-void
.end method

.method public constructor <init>()V
    .locals 1

    .line 24
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 25
    new-instance v0, Lcom/ss/android/medialib/FFMpegInvoker;

    invoke-direct {v0}, Lcom/ss/android/medialib/FFMpegInvoker;-><init>()V

    iput-object v0, p0, Lcom/ss/android/medialib/FFMpegManager;->mFFMpegInvoker:Lcom/ss/android/medialib/FFMpegInvoker;

    .line 26
    return-void
.end method

.method public static getInstance()Lcom/ss/android/medialib/FFMpegManager;
    .locals 3

    .line 12
    const-class v0, Lcom/ss/android/medialib/FFMpegManager;

    monitor-enter v0

    .line 13
    :try_start_0
    sget-object v1, Lcom/ss/android/medialib/FFMpegManager;->mpegManager:Lcom/ss/android/medialib/FFMpegManager;

    if-nez v1, :cond_1

    .line 14
    const-class v1, Lcom/ss/android/medialib/FFMpegManager;

    monitor-enter v1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_1

    .line 15
    :try_start_1
    sget-object v2, Lcom/ss/android/medialib/FFMpegManager;->mpegManager:Lcom/ss/android/medialib/FFMpegManager;

    if-nez v2, :cond_0

    .line 16
    new-instance v2, Lcom/ss/android/medialib/FFMpegManager;

    invoke-direct {v2}, Lcom/ss/android/medialib/FFMpegManager;-><init>()V

    sput-object v2, Lcom/ss/android/medialib/FFMpegManager;->mpegManager:Lcom/ss/android/medialib/FFMpegManager;

    .line 17
    :cond_0
    monitor-exit v1

    goto :goto_0

    :catchall_0
    move-exception v2

    monitor-exit v1
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    :try_start_2
    throw v2

    .line 19
    :cond_1
    :goto_0
    monitor-exit v0
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_1

    .line 20
    sget-object v0, Lcom/ss/android/medialib/FFMpegManager;->mpegManager:Lcom/ss/android/medialib/FFMpegManager;

    return-object v0

    .line 19
    :catchall_1
    move-exception v1

    :try_start_3
    monitor-exit v0
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_1

    throw v1
.end method


# virtual methods
.method public MusicLength(Ljava/lang/String;)J
    .locals 2

    .line 72
    iget-object v0, p0, Lcom/ss/android/medialib/FFMpegManager;->mFFMpegInvoker:Lcom/ss/android/medialib/FFMpegInvoker;

    invoke-virtual {v0, p1}, Lcom/ss/android/medialib/FFMpegInvoker;->MusicLength(Ljava/lang/String;)J

    move-result-wide v0

    return-wide v0
.end method

.method public resampleAudioToWav(Ljava/lang/String;Ljava/lang/String;JJ)I
    .locals 7

    .line 52
    iget-object v0, p0, Lcom/ss/android/medialib/FFMpegManager;->mFFMpegInvoker:Lcom/ss/android/medialib/FFMpegInvoker;

    move-object v1, p1

    move-object v2, p2

    move-wide v3, p3

    move-wide v5, p5

    invoke-virtual/range {v0 .. v6}, Lcom/ss/android/medialib/FFMpegInvoker;->resampleAudioToWav(Ljava/lang/String;Ljava/lang/String;JJ)I

    move-result p1

    return p1
.end method

.method public resampleAudioToWav2(Ljava/lang/String;Ljava/lang/String;J)I
    .locals 1

    .line 64
    iget-object v0, p0, Lcom/ss/android/medialib/FFMpegManager;->mFFMpegInvoker:Lcom/ss/android/medialib/FFMpegInvoker;

    invoke-virtual {v0, p1, p2, p3, p4}, Lcom/ss/android/medialib/FFMpegInvoker;->resampleAudioToWav2(Ljava/lang/String;Ljava/lang/String;J)I

    move-result p1

    return p1
.end method

.method public resampleCycleAudioToWav(Ljava/lang/String;Ljava/lang/String;JJ)I
    .locals 7

    .line 39
    iget-object v0, p0, Lcom/ss/android/medialib/FFMpegManager;->mFFMpegInvoker:Lcom/ss/android/medialib/FFMpegInvoker;

    move-object v1, p1

    move-object v2, p2

    move-wide v3, p3

    move-wide v5, p5

    invoke-virtual/range {v0 .. v6}, Lcom/ss/android/medialib/FFMpegInvoker;->resampleCycleAudioToWav(Ljava/lang/String;Ljava/lang/String;JJ)I

    move-result p1

    return p1
.end method
