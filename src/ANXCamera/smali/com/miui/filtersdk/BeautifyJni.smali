.class public Lcom/miui/filtersdk/BeautifyJni;
.super Ljava/lang/Object;
.source "BeautifyJni.java"


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 7
    const-string v0, "beauty_jni"

    invoke-static {v0}, Ljava/lang/System;->loadLibrary(Ljava/lang/String;)V

    .line 8
    return-void
.end method

.method public constructor <init>()V
    .locals 0

    .line 3
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static native Cleanbeautify()I
.end method

.method public static native Initbeautify()I
.end method

.method public static native beautifyFaceSetScreenSize(II)I
.end method

.method public static native beautifyFaceUpdateIntensity([I)I
.end method

.method public static native beautifyFaceYUVEditPicture([B[BIII)I
.end method

.method public static native beautifyFaceYUVPreviewGPU([BIII[I)I
.end method
