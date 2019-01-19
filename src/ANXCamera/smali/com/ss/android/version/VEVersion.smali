.class public Lcom/ss/android/version/VEVersion;
.super Ljava/lang/Object;
.source "VEVersion.java"


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 3
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static getCability()Ljava/lang/String;
    .locals 1

    .line 5
    invoke-static {}, Lcom/ss/android/version/VEVersion;->nativeCability()Ljava/lang/String;

    move-result-object v0

    .line 7
    return-object v0
.end method

.method public static native nativeCability()Ljava/lang/String;
.end method
