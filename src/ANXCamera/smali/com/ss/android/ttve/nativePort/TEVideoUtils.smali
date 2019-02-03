.class public final Lcom/ss/android/ttve/nativePort/TEVideoUtils;
.super Ljava/lang/Object;
.source "TEVideoUtils.java"


# annotations
.annotation build Landroid/support/annotation/Keep;
.end annotation

.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/ss/android/ttve/nativePort/TEVideoUtils$ExecuteCommandListener;
    }
.end annotation


# direct methods
.method static constructor <clinit>()V
    .locals 0

    .line 18
    invoke-static {}, Lcom/ss/android/ttve/nativePort/TENativeLibsLoader;->loadLibrary()V

    .line 19
    return-void
.end method

.method public constructor <init>()V
    .locals 0

    .line 15
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static clearWavSeg(Ljava/lang/String;II)I
    .locals 0

    .line 84
    invoke-static {p0, p1, p2}, Lcom/ss/android/ttve/nativePort/TEVideoUtils;->nativeClearWavSeg(Ljava/lang/String;II)I

    move-result p0

    return p0
.end method

.method public static concat([Ljava/lang/String;Ljava/lang/String;)I
    .locals 0

    .line 26
    invoke-static {p0, p1}, Lcom/ss/android/ttve/nativePort/TEVideoUtils;->nativeConcat([Ljava/lang/String;Ljava/lang/String;)I

    move-result p0

    return p0
.end method

.method public static executeFFmpegCommand(Ljava/lang/String;Lcom/ss/android/ttve/nativePort/TEVideoUtils$ExecuteCommandListener;)I
    .locals 0
    .param p1    # Lcom/ss/android/ttve/nativePort/TEVideoUtils$ExecuteCommandListener;
        .annotation build Landroid/support/annotation/Nullable;
        .end annotation
    .end param

    .line 93
    invoke-static {p0, p1}, Lcom/ss/android/ttve/nativePort/TEVideoUtils;->nativeExecuteFFmpegCommand(Ljava/lang/String;Lcom/ss/android/ttve/nativePort/TEVideoUtils$ExecuteCommandListener;)I

    move-result p0

    return p0
.end method

.method public static generateMuteWav(Ljava/lang/String;III)I
    .locals 0

    .line 80
    invoke-static {p0, p1, p2, p3}, Lcom/ss/android/ttve/nativePort/TEVideoUtils;->nativeGenerateMuteWav(Ljava/lang/String;III)I

    move-result p0

    return p0
.end method

.method public static getAudioFileInfo(Ljava/lang/String;[I)I
    .locals 0

    .line 52
    invoke-static {p0, p1}, Lcom/ss/android/ttve/nativePort/TEVideoUtils;->nativeGetAudioFileInfo(Ljava/lang/String;[I)I

    move-result p0

    return p0
.end method

.method public static getVideoFileInfo(Ljava/lang/String;[I)I
    .locals 0

    .line 42
    invoke-static {p0, p1}, Lcom/ss/android/ttve/nativePort/TEVideoUtils;->nativeGetFileInfo(Ljava/lang/String;[I)I

    move-result p0

    return p0
.end method

.method public static getVideoFrames(Ljava/lang/String;[ILjava/lang/Object;)I
    .locals 0

    .line 89
    invoke-static {p0, p1, p2}, Lcom/ss/android/ttve/nativePort/TEVideoUtils;->nativeGetVideoFrame(Ljava/lang/String;[ILjava/lang/Object;)I

    move-result p0

    return p0
.end method

.method public static isCanImport(Ljava/lang/String;)I
    .locals 1

    .line 63
    invoke-static {p0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 64
    const/16 p0, -0x64

    return p0

    .line 66
    :cond_0
    invoke-static {p0}, Lcom/ss/android/ttve/nativePort/TEVideoUtils;->nativeIsCanImport(Ljava/lang/String;)I

    move-result p0

    return p0
.end method

.method public static mux(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)I
    .locals 0

    .line 30
    invoke-static {p0, p1, p2}, Lcom/ss/android/ttve/nativePort/TEVideoUtils;->nativeMux(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)I

    move-result p0

    return p0
.end method

.method private static native nativeClearWavSeg(Ljava/lang/String;II)I
.end method

.method private static native nativeConcat([Ljava/lang/String;Ljava/lang/String;)I
.end method

.method private static native nativeExecuteFFmpegCommand(Ljava/lang/String;Lcom/ss/android/ttve/nativePort/TEVideoUtils$ExecuteCommandListener;)I
.end method

.method private static native nativeGenerateMuteWav(Ljava/lang/String;III)I
.end method

.method private static native nativeGetAudioFileInfo(Ljava/lang/String;[I)I
.end method

.method private static native nativeGetFileInfo(Ljava/lang/String;[I)I
.end method

.method private static native nativeGetVideoFrame(Ljava/lang/String;[ILjava/lang/Object;)I
.end method

.method private static native nativeIsCanImport(Ljava/lang/String;)I
.end method

.method private static native nativeMux(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)I
.end method

.method private static native nativeTransCodecAudioFile(Ljava/lang/String;Ljava/lang/String;II)I
.end method

.method public static transCodeAudioFile(Ljava/lang/String;Ljava/lang/String;II)I
    .locals 2

    .line 70
    invoke-static {p0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v0

    const/16 v1, -0x64

    if-eqz v0, :cond_0

    .line 71
    return v1

    .line 73
    :cond_0
    invoke-static {p1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v0

    if-eqz v0, :cond_1

    .line 74
    return v1

    .line 76
    :cond_1
    invoke-static {p0, p1, p2, p3}, Lcom/ss/android/ttve/nativePort/TEVideoUtils;->nativeTransCodecAudioFile(Ljava/lang/String;Ljava/lang/String;II)I

    move-result p0

    return p0
.end method
