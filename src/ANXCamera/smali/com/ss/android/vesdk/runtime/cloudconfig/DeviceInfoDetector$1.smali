.class final Lcom/ss/android/vesdk/runtime/cloudconfig/DeviceInfoDetector$1;
.super Ljava/util/ArrayList;
.source "DeviceInfoDetector.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/ss/android/vesdk/runtime/cloudconfig/DeviceInfoDetector;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x8
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/util/ArrayList<",
        "Ljava/lang/String;",
        ">;"
    }
.end annotation


# direct methods
.method constructor <init>()V
    .locals 1

    .line 34
    invoke-direct {p0}, Ljava/util/ArrayList;-><init>()V

    .line 36
    const-string v0, "os_sdk_int"

    invoke-virtual {p0, v0}, Lcom/ss/android/vesdk/runtime/cloudconfig/DeviceInfoDetector$1;->add(Ljava/lang/Object;)Z

    .line 37
    const-string v0, "external_storage"

    invoke-virtual {p0, v0}, Lcom/ss/android/vesdk/runtime/cloudconfig/DeviceInfoDetector$1;->add(Ljava/lang/Object;)Z

    .line 38
    const-string v0, "screen_height"

    invoke-virtual {p0, v0}, Lcom/ss/android/vesdk/runtime/cloudconfig/DeviceInfoDetector$1;->add(Ljava/lang/Object;)Z

    .line 39
    const-string v0, "screen_width"

    invoke-virtual {p0, v0}, Lcom/ss/android/vesdk/runtime/cloudconfig/DeviceInfoDetector$1;->add(Ljava/lang/Object;)Z

    .line 40
    const-string v0, "storage"

    invoke-virtual {p0, v0}, Lcom/ss/android/vesdk/runtime/cloudconfig/DeviceInfoDetector$1;->add(Ljava/lang/Object;)Z

    .line 41
    const-string v0, "memory"

    invoke-virtual {p0, v0}, Lcom/ss/android/vesdk/runtime/cloudconfig/DeviceInfoDetector$1;->add(Ljava/lang/Object;)Z

    .line 42
    const-string v0, "cpu_core"

    invoke-virtual {p0, v0}, Lcom/ss/android/vesdk/runtime/cloudconfig/DeviceInfoDetector$1;->add(Ljava/lang/Object;)Z

    .line 43
    const-string v0, "cpu_freq"

    invoke-virtual {p0, v0}, Lcom/ss/android/vesdk/runtime/cloudconfig/DeviceInfoDetector$1;->add(Ljava/lang/Object;)Z

    .line 44
    return-void
.end method
