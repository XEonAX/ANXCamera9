.class public Lcom/android/camera/panorama/PanoramaState;
.super Ljava/lang/Object;
.source "PanoramaState.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/android/camera/panorama/PanoramaState$IPanoramaStateEventListener;
    }
.end annotation


# instance fields
.field public listener:Lcom/android/camera/panorama/PanoramaState$IPanoramaStateEventListener;


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 26
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 27
    invoke-virtual {p0}, Lcom/android/camera/panorama/PanoramaState;->clearListener()V

    .line 28
    return-void
.end method


# virtual methods
.method public clearListener()V
    .locals 1

    .line 14
    new-instance v0, Lcom/android/camera/panorama/PanoramaState$1;

    invoke-direct {v0, p0}, Lcom/android/camera/panorama/PanoramaState$1;-><init>(Lcom/android/camera/panorama/PanoramaState;)V

    iput-object v0, p0, Lcom/android/camera/panorama/PanoramaState;->listener:Lcom/android/camera/panorama/PanoramaState$IPanoramaStateEventListener;

    .line 20
    return-void
.end method

.method public onSaveImage(Lcom/android/camera/panorama/CaptureImage;)Z
    .locals 0

    .line 31
    invoke-virtual {p1}, Lcom/android/camera/panorama/CaptureImage;->close()V

    .line 32
    const/4 p1, 0x1

    return p1
.end method

.method public setPanoramaStateEventListener(Lcom/android/camera/panorama/PanoramaState$IPanoramaStateEventListener;)V
    .locals 0

    .line 23
    iput-object p1, p0, Lcom/android/camera/panorama/PanoramaState;->listener:Lcom/android/camera/panorama/PanoramaState$IPanoramaStateEventListener;

    .line 24
    return-void
.end method
