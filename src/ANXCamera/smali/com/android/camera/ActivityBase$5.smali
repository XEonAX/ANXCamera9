.class Lcom/android/camera/ActivityBase$5;
.super Lio/reactivex/Single;
.source "ActivityBase.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/android/camera/ActivityBase;->trackAppLunchTimeStart(Z)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lio/reactivex/Single<",
        "Ljava/util/HashMap;",
        ">;"
    }
.end annotation


# instance fields
.field final synthetic this$0:Lcom/android/camera/ActivityBase;


# direct methods
.method constructor <init>(Lcom/android/camera/ActivityBase;)V
    .locals 0

    .line 389
    iput-object p1, p0, Lcom/android/camera/ActivityBase$5;->this$0:Lcom/android/camera/ActivityBase;

    invoke-direct {p0}, Lio/reactivex/Single;-><init>()V

    return-void
.end method


# virtual methods
.method protected subscribeActual(Lio/reactivex/SingleObserver;)V
    .locals 10
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lio/reactivex/SingleObserver<",
            "-",
            "Ljava/util/HashMap;",
            ">;)V"
        }
    .end annotation

    .line 392
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    .line 394
    const-string v1, "cat /dev/cpuset/camera-daemon/cpus"

    const/4 v2, 0x0

    invoke-static {v1, v2}, Lcom/android/camera/Util;->execCommand(Ljava/lang/String;Z)Ljava/lang/String;

    move-result-object v1

    .line 395
    if-nez v1, :cond_0

    .line 396
    return-void

    .line 398
    :cond_0
    const-string v3, "cpus"

    invoke-virtual {v0, v3, v1}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 400
    const-string v1, "cat $(dirname $(grep -nir \"xo_therm\" /sys/class/thermal/thermal_zone*/type))/temp"

    invoke-static {v1, v2}, Lcom/android/camera/Util;->execCommand(Ljava/lang/String;Z)Ljava/lang/String;

    move-result-object v1

    .line 401
    if-nez v1, :cond_1

    .line 402
    return-void

    .line 404
    :cond_1
    const-string v3, "temperature"

    invoke-virtual {v0, v3, v1}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 406
    const-string v1, "cat /proc/meminfo|grep -E \'MemFree|MemAvailable\'"

    const/4 v3, 0x1

    invoke-static {v1, v3}, Lcom/android/camera/Util;->execCommand(Ljava/lang/String;Z)Ljava/lang/String;

    move-result-object v1

    .line 407
    if-nez v1, :cond_2

    .line 408
    return-void

    .line 410
    :cond_2
    const-string v4, "\r\n"

    invoke-virtual {v1, v4}, Ljava/lang/String;->split(Ljava/lang/String;)[Ljava/lang/String;

    move-result-object v1

    .line 411
    array-length v4, v1

    const/4 v5, 0x2

    if-eq v4, v5, :cond_3

    .line 412
    return-void

    .line 414
    :cond_3
    array-length v4, v1

    move v5, v2

    :goto_0
    if-ge v5, v4, :cond_4

    aget-object v6, v1, v5

    .line 415
    const-string v7, ":"

    invoke-virtual {v6, v7}, Ljava/lang/String;->split(Ljava/lang/String;)[Ljava/lang/String;

    move-result-object v6

    .line 416
    aget-object v7, v6, v2

    aget-object v6, v6, v3

    const-string v8, "\\D"

    const-string v9, ""

    invoke-virtual {v6, v8, v9}, Ljava/lang/String;->replaceAll(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v0, v7, v6}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 414
    add-int/lit8 v5, v5, 0x1

    goto :goto_0

    .line 418
    :cond_4
    invoke-interface {p1, v0}, Lio/reactivex/SingleObserver;->onSuccess(Ljava/lang/Object;)V

    .line 419
    return-void
.end method
