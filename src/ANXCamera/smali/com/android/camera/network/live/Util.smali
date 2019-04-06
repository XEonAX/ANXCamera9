.class public Lcom/android/camera/network/live/Util;
.super Ljava/lang/Object;
.source "Util.java"


# static fields
.field private static TAG:Ljava/lang/String;


# direct methods
.method static constructor <clinit>()V
    .locals 3

    const-string v0, "LiveUtil"

    sput-object v0, Lcom/android/camera/network/live/Util;->TAG:Ljava/lang/String;

    :try_start_0
    const-string v0, "tt_jni"

    invoke-static {v0}, Ljava/lang/System;->loadLibrary(Ljava/lang/String;)V
    :try_end_0
    .catch Ljava/lang/Throwable; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    :catch_0
    move-exception v0

    sget-object v1, Lcom/android/camera/network/live/Util;->TAG:Ljava/lang/String;

    const-string v2, "load tt_jni.so failed."

    invoke-static {v1, v2, v0}, Lcom/android/camera/log/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    :goto_0
    return-void
.end method

.method public constructor <init>()V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method private static native genAccessKey()[B
.end method

.method private static native generate(JJ)[B
.end method

.method public static getAccessKey()Ljava/lang/String;
    .locals 2

    invoke-static {}, Lcom/android/camera/network/live/Util;->genAccessKey()[B

    move-result-object v0

    new-instance v1, Ljava/lang/String;

    invoke-direct {v1, v0}, Ljava/lang/String;-><init>([B)V

    return-object v1
.end method

.method public static md5(JJ)Ljava/lang/String;
    .locals 1

    invoke-static {p0, p1, p2, p3}, Lcom/android/camera/network/live/Util;->generate(JJ)[B

    move-result-object p0

    const-string p1, ""

    const/4 p2, 0x0

    :goto_0
    array-length p3, p0

    if-ge p2, p3, :cond_0

    new-instance p3, Ljava/lang/StringBuilder;

    invoke-direct {p3}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {p3, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const/16 p1, 0xff

    aget-byte v0, p0, p2

    and-int/2addr p1, v0

    or-int/lit16 p1, p1, -0x100

    invoke-static {p1}, Ljava/lang/Integer;->toHexString(I)Ljava/lang/String;

    move-result-object p1

    const/4 v0, 0x6

    invoke-virtual {p1, v0}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object p1

    invoke-virtual {p3, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    add-int/lit8 p2, p2, 0x1

    goto :goto_0

    :cond_0
    return-object p1
.end method
