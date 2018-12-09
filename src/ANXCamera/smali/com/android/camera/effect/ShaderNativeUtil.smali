.class public Lcom/android/camera/effect/ShaderNativeUtil;
.super Ljava/lang/Object;
.source "ShaderNativeUtil.java"


# static fields
.field private static final TAG:Ljava/lang/String; = "ShaderNativeUtil"


# direct methods
.method static constructor <clinit>()V
    .locals 3

    .line 14
    :try_start_0
    const-string v0, "CameraEffectJNI"

    invoke-static {v0}, Ljava/lang/System;->loadLibrary(Ljava/lang/String;)V
    :try_end_0
    .catch Ljava/lang/Throwable; {:try_start_0 .. :try_end_0} :catch_0

    .line 17
    goto :goto_0

    .line 15
    :catch_0
    move-exception v0

    .line 16
    const-string v1, "ShaderNativeUtil"

    const-string v2, "ShaderNativeUtil load CameraEffectJNI.so failed."

    invoke-static {v1, v2, v0}, Lcom/android/camera/log/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    .line 18
    :goto_0
    return-void
.end method

.method public constructor <init>()V
    .locals 0

    .line 5
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method private static native getJpegPicture(IIIII)[B
.end method

.method public static getPicture(III)[B
    .locals 1

    .line 29
    const/4 v0, 0x0

    invoke-static {v0, v0, p0, p1, p2}, Lcom/android/camera/effect/ShaderNativeUtil;->getJpegPicture(IIIII)[B

    move-result-object p0

    return-object p0
.end method

.method public static getPicture(IIIII)[B
    .locals 0

    .line 33
    invoke-static {p0, p1, p2, p3, p4}, Lcom/android/camera/effect/ShaderNativeUtil;->getJpegPicture(IIIII)[B

    move-result-object p0

    return-object p0
.end method

.method private static native initJpegTexture([BII)[I
.end method

.method public static initTexture([BI)[I
    .locals 1

    .line 21
    const/4 v0, 0x1

    invoke-static {p0, p1, v0}, Lcom/android/camera/effect/ShaderNativeUtil;->initJpegTexture([BII)[I

    move-result-object p0

    return-object p0
.end method

.method public static initTexture([BII)[I
    .locals 0

    .line 25
    invoke-static {p0, p1, p2}, Lcom/android/camera/effect/ShaderNativeUtil;->initJpegTexture([BII)[I

    move-result-object p0

    return-object p0
.end method
