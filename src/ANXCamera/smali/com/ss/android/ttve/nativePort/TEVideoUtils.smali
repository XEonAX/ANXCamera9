.class public final Lcom/ss/android/ttve/nativePort/TEVideoUtils;
.super Ljava/lang/Object;
.source "TEVideoUtils.java"


# annotations
.annotation build Landroid/support/annotation/Keep;
.end annotation


# direct methods
.method static constructor <clinit>()V
    .locals 0

    .line 17
    invoke-static {}, Lcom/ss/android/ttve/nativePort/TENativeLibsLoader;->loadLibrary()V

    .line 18
    return-void
.end method

.method public constructor <init>()V
    .locals 0

    .line 14
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static clearWavSeg(Ljava/lang/String;II)I
    .locals 0

    .line 58
    invoke-static {p0, p1, p2}, Lcom/ss/android/ttve/nativePort/TEVideoUtils;->nativeClearWavSeg(Ljava/lang/String;II)I

    move-result p0

    return p0
.end method

.method public static concat([Ljava/lang/String;Ljava/lang/String;)I
    .locals 0

    .line 21
    invoke-static {p0, p1}, Lcom/ss/android/ttve/nativePort/TEVideoUtils;->nativeConcat([Ljava/lang/String;Ljava/lang/String;)I

    move-result p0

    return p0
.end method

.method public static generateMuteWav(Ljava/lang/String;III)I
    .locals 0

    .line 54
    invoke-static {p0, p1, p2, p3}, Lcom/ss/android/ttve/nativePort/TEVideoUtils;->nativeGenerateMuteWav(Ljava/lang/String;III)I

    move-result p0

    return p0
.end method

.method public static getVideoFileInfo(Ljava/lang/String;[I)I
    .locals 0

    .line 37
    invoke-static {p0, p1}, Lcom/ss/android/ttve/nativePort/TEVideoUtils;->nativeGetFileInfo(Ljava/lang/String;[I)I

    move-result p0

    return p0
.end method

.method public static getVideoFrames(Ljava/lang/String;[ILcom/ss/android/ttve/nativePort/TEVideoUtilsCallback;)I
    .locals 0

    .line 63
    invoke-static {p0, p1, p2}, Lcom/ss/android/ttve/nativePort/TEVideoUtils;->nativeGetVideoFrame(Ljava/lang/String;[ILcom/ss/android/ttve/nativePort/TEVideoUtilsCallback;)I

    move-result p0

    return p0
.end method

.method public static isCanImport(Ljava/lang/String;)I
    .locals 1

    .line 47
    invoke-static {p0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 48
    const/16 p0, -0x64

    return p0

    .line 50
    :cond_0
    invoke-static {p0}, Lcom/ss/android/ttve/nativePort/TEVideoUtils;->nativeIsCanImport(Ljava/lang/String;)I

    move-result p0

    return p0
.end method

.method public static mux(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)I
    .locals 0

    .line 25
    invoke-static {p0, p1, p2}, Lcom/ss/android/ttve/nativePort/TEVideoUtils;->nativeMux(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)I

    move-result p0

    return p0
.end method

.method private static native nativeClearWavSeg(Ljava/lang/String;II)I
.end method

.method private static native nativeConcat([Ljava/lang/String;Ljava/lang/String;)I
.end method

.method private static native nativeGenerateMuteWav(Ljava/lang/String;III)I
.end method

.method private static native nativeGetFileInfo(Ljava/lang/String;[I)I
.end method

.method private static native nativeGetVideoFrame(Ljava/lang/String;[ILcom/ss/android/ttve/nativePort/TEVideoUtilsCallback;)I
.end method

.method private static native nativeIsCanImport(Ljava/lang/String;)I
.end method

.method private static native nativeMux(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)I
.end method
