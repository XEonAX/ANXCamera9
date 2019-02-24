.class public Lcom/ss/android/ttve/nativePort/TEGPUInfoReader;
.super Ljava/lang/Object;
.source "TEGPUInfoReader.java"


# annotations
.annotation build Landroid/support/annotation/Keep;
.end annotation


# direct methods
.method static constructor <clinit>()V
    .locals 0

    .line 13
    invoke-static {}, Lcom/ss/android/ttve/nativePort/TENativeLibsLoader;->loadLibrary()V

    .line 14
    return-void
.end method

.method public constructor <init>()V
    .locals 0

    .line 10
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static native nativeGetGLVersion()Ljava/lang/String;
.end method

.method public static native nativeGetGPURenderer()Ljava/lang/String;
.end method
