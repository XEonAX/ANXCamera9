.class public Lcom/ss/android/medialib/FFMpegInvoker;
.super Ljava/lang/Object;
.source "FFMpegInvoker.java"


# annotations
.annotation build Landroid/support/annotation/Keep;
.end annotation


# direct methods
.method static constructor <clinit>()V
    .locals 0

    .line 18
    invoke-static {}, Lcom/ss/android/medialib/NativePort/NativeLibsLoader;->loadLibrary()V

    .line 19
    return-void
.end method

.method public constructor <init>()V
    .locals 0

    .line 13
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 15
    return-void
.end method

.method private native nativeAddFastReverseVideo(Ljava/lang/String;Ljava/lang/String;)I
.end method

.method private native nativeStopReverseVideo()I
.end method


# virtual methods
.method public native MusicLength(Ljava/lang/String;)J
.end method

.method public addFastReverseVideo(Ljava/lang/String;Ljava/lang/String;)I
    .locals 0

    .line 22
    invoke-direct {p0, p1, p2}, Lcom/ss/android/medialib/FFMpegInvoker;->nativeAddFastReverseVideo(Ljava/lang/String;Ljava/lang/String;)I

    move-result p1

    return p1
.end method

.method public native resampleAudioToWav(Ljava/lang/String;Ljava/lang/String;JJ)I
.end method

.method public native resampleAudioToWav2(Ljava/lang/String;Ljava/lang/String;J)I
.end method

.method public native resampleCycleAudioToWav(Ljava/lang/String;Ljava/lang/String;JJ)I
.end method

.method public stopReverseVideo()I
    .locals 1

    .line 26
    invoke-direct {p0}, Lcom/ss/android/medialib/FFMpegInvoker;->nativeStopReverseVideo()I

    move-result v0

    return v0
.end method
