.class Lcom/android/camera2/CameraCapabilities$1;
.super Ljava/util/ArrayList;
.source "CameraCapabilities.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/android/camera2/CameraCapabilities;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/util/ArrayList<",
        "Landroid/hardware/camera2/CameraCharacteristics$Key<",
        "[",
        "Landroid/hardware/camera2/params/StreamConfiguration;",
        ">;>;"
    }
.end annotation


# direct methods
.method constructor <init>(I)V
    .locals 0

    .line 111
    invoke-direct {p0, p1}, Ljava/util/ArrayList;-><init>(I)V

    .line 113
    invoke-static {}, Lcom/android/camera2/CameraCapabilities;->access$000()Landroid/hardware/camera2/CameraCharacteristics$Key;

    move-result-object p1

    invoke-virtual {p0, p1}, Lcom/android/camera2/CameraCapabilities$1;->add(Ljava/lang/Object;)Z

    .line 114
    invoke-static {}, Lcom/android/camera2/CameraCapabilities;->access$100()Landroid/hardware/camera2/CameraCharacteristics$Key;

    move-result-object p1

    invoke-virtual {p0, p1}, Lcom/android/camera2/CameraCapabilities$1;->add(Ljava/lang/Object;)Z

    .line 115
    sget-object p1, Lcom/android/camera/constant/MiCameraCharacteristics;->XIAOMI_SCALER_AVAILABLE_SR_STREAM_CONFIGURATIONS:Landroid/hardware/camera2/CameraCharacteristics$Key;

    invoke-virtual {p0, p1}, Lcom/android/camera2/CameraCapabilities$1;->add(Ljava/lang/Object;)Z

    .line 116
    return-void
.end method
