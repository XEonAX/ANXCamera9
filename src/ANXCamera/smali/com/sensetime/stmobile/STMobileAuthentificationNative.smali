.class public Lcom/sensetime/stmobile/STMobileAuthentificationNative;
.super Ljava/lang/Object;
.source "STMobileAuthentificationNative.java"


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 11
    const-string v0, "st_mobile"

    invoke-static {v0}, Ljava/lang/System;->loadLibrary(Ljava/lang/String;)V

    .line 12
    const-string v0, "stmobile_jni"

    invoke-static {v0}, Ljava/lang/System;->loadLibrary(Ljava/lang/String;)V

    .line 13
    return-void
.end method

.method public constructor <init>()V
    .locals 0

    .line 7
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static native checkActiveCode(Ljava/lang/String;Ljava/lang/String;)I
.end method

.method public static native checkActiveCodeFromBuffer(Ljava/lang/String;ILjava/lang/String;)I
.end method

.method public static native generateActiveCode(Ljava/lang/String;)Ljava/lang/String;
.end method

.method public static native generateActiveCodeFromBuffer(Ljava/lang/String;I)Ljava/lang/String;
.end method
