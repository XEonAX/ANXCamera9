.class public Lcom/ss/android/ttve/nativePort/TEEffectUtils;
.super Ljava/lang/Object;
.source "TEEffectUtils.java"


# direct methods
.method static constructor <clinit>()V
    .locals 0

    .line 9
    invoke-static {}, Lcom/ss/android/ttve/nativePort/TENativeLibsLoader;->loadLibrary()V

    .line 10
    return-void
.end method

.method public constructor <init>()V
    .locals 0

    .line 7
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static native getEffectVersion()Ljava/lang/String;
.end method
